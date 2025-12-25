const express = require("express");
const router = express.Router();
const Order = require("../models/Order");

// router.post("/", async (req, res) => {
//   const order = new Order(req.body);
//   await order.save();
//   res.json({ success: true });
// });

router.post("/", async (req, res) => {
  try {
    const order = new Order(req.body);
    await order.save();
    res.status(201).json({success: true});
  } catch (error) {
    res.status(400).json({ message: "Order not Saved" });
  }
});

router.get("/", async (req, res) => {
  const orders = await Order.find();
  res.json(orders);
});

module.exports = router;
