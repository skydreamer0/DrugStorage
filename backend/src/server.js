// 引入必要的模組
const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const cors = require('cors');

// 創建 Express 應用程式
const app = express();
const port = 3000;

// 設定中介軟體
app.use(cors());  // 啟用跨來源資源共享
app.use(bodyParser.json());  // 解析 JSON 格式的請求體
app.use(bodyParser.urlencoded({ extended: true }));  // 解析 URL 編碼的請求體

// 使用環境變數設定 MongoDB 連接字符串
const mongoUrl = process.env.MONGO_URL || 'mongodb://localhost:27017/my_pharmacy_db';
mongoose.connect(mongoUrl, {
})
  .then(() => console.log('MongoDB 連接成功'))
  .catch(err => console.error('MongoDB 連接錯誤:', err));

// 定義藥品資料模型
const DrugModel = mongoose.model('Drug', new mongoose.Schema({
  barcode: { type: String, required: true, unique: true },  // 條碼，必填且唯一
  location: { type: String, required: true }  // 存放位置，必填
}));
// 查詢所有藥品的 GET 路由
app.get('/api/drugs', (req, res) => {
  DrugModel.find({})
    .then(drugs => {
      res.send(drugs);
    })
    .catch(err => {
      res.status(500).send({ message: '查詢藥品時發生錯誤', error: err });
    });
});
// 查詢藥品存放位置的 GET 路由
app.get('/api/get_location/:barcode', (req, res) => {
  const { barcode } = req.params;

  DrugModel.findOne({ barcode })
    .then(drug => {
      if (!drug) {
        return res.status(404).send({ message: '找不到該條碼的藥品' });
      }
      res.send({ location: drug.location });
    })
    .catch(err => {
      res.status(500).send({ message: '查詢藥品時發生錯誤', error: err });
    });
});
// 新增單筆藥品的 POST 路由
app.post('/api/add_drugs', (req, res) => {
  const { barcode, location } = req.body.drug;

  // 檢查條碼和存放位置是否存在
  if (!barcode || !location) {
    return res.status(400).send({ message: '條碼和存放位置為必填項目' });
  }

  // 建立新藥品
  const newDrug = new DrugModel({ barcode, location });

  // 儲存藥品資料到資料庫
  newDrug.save()
    .then(() => res.send({ message: '藥品新增成功' }))
    .catch(err => {
      console.error('新增藥品時發生錯誤:', err.message);  // 打印錯誤訊息

      // 檢查錯誤類型並回傳相應的錯誤訊息
      if (err.code === 11000) {
        res.status(400).send({ message: '條碼已存在' });
      } else {
        res.status(500).send({ message: '新增藥品時發生錯誤', error: err.message });
      }
    });
});
// 添加錯誤處理中介軟體
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send('系統發生錯誤!');
});

// 啟動伺服器
app.listen(port, () => {
  console.log(`伺服器正在運行，網址為 http://localhost:${port}`);
});
