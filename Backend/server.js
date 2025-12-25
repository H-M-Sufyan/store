const express = require("express");
const mongoose = require("mongoose");
const productRoutes = require("./routes/productRoutes");
const orderRoutes = require("./routes/orderRoutes");
const app = express();

app.use(express.json());


const uri =
  "mongodb+srv://hmsufyan191_db_user:pSf2nfyKb5bV7u56@cluster0.bnkcgds.mongodb.net/?appName=Cluster0";
mongoose
  .connect(uri)
  .then(() => console.log("MongoDB connected Successfully!"))
  .catch((err) => console.log(err));

app.get("/", (req, res) => {
  res.send("Ecommerce API is working");
});

app.use("/api/products", productRoutes);
app.use("/api/orders", orderRoutes);

app.listen(3000, () => {
  console.log("Server running on port 3000");
});
