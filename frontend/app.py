from flask import Flask, request, jsonify  # 引入 Flask 及相關模組
from flask_sqlalchemy import SQLAlchemy  # 引入 SQLAlchemy 模組來處理資料庫
from flask_cors import CORS  # 引入 CORS 模組以解決跨域問題

app = Flask(__name__)

# 啟用 CORS，允許所有來源進行請求
CORS(app)

# 設定 SQLite 資料庫路徑與 Flask 參數
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///database.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# 初始化 SQLAlchemy，與 Flask 應用程式進行連結
db = SQLAlchemy(app)

# 定義資料庫模型，描述藥品儲位數據的結構
class DrugLocation(db.Model):
    id = db.Column(db.Integer, primary_key=True)  # 主鍵，自動遞增
    barcode = db.Column(db.String(80), unique=True, nullable=False)  # 條碼，需唯一
    location = db.Column(db.String(120), nullable=False)  # 儲位位置

    def __repr__(self):
        return f'<DrugLocation {self.barcode}>'

# 在第一次啟動時，建立資料庫與資料表
with app.app_context():
    db.create_all()

# API 端點：新增藥品存放位置
@app.route('/api/add_drug', methods=['POST'])
def add_drug():
    data = request.get_json()  # 從請求中取得 JSON 資料
    barcode = data.get('barcode')
    location = data.get('location')

    if barcode and location:
        # 檢查條碼是否已存在
        existing_drug = DrugLocation.query.filter_by(barcode=barcode).first()
        if existing_drug:
            return jsonify({"message": "條碼已存在"}), 400  # 條碼重複錯誤
        # 新增藥品資料到資料庫
        new_drug = DrugLocation(barcode=barcode, location=location)
        db.session.add(new_drug)
        db.session.commit()
        return jsonify({"message": "藥品位置已新增"}), 201  # 新增成功
    else:
        return jsonify({"message": "缺少條碼或位置"}), 400  # 缺少必要數據錯誤

# API 端點：查詢藥品存放位置
@app.route('/api/get_location/<barcode>', methods=['GET'])
def get_location(barcode):
    # 查詢資料庫中是否有對應條碼的藥品資料
    drug = DrugLocation.query.filter_by(barcode=barcode).first()
    if drug:
        return jsonify({"location": drug.location}), 200  # 返回位置數據
    else:
        return jsonify({"message": "未找到該條碼對應的藥品位置"}), 404  # 未找到資料錯誤

# 啟動 Flask 應用程式
if __name__ == '__main__':
    app.run(debug=True)  # 開啟 debug 模式，便於開發測試
