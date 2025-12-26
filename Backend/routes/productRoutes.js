const express = require("express");
const router = express.Router();
const Product = require("../models/Product");

// GET all products
router.get("/", async (req, res) => {
  const products = await Product.find();
  res.json(products);
});
// GET all featured products
router.get("/featured", async (req, res) => {
  const products = await Product.find({ isFeatured: true });
  res.json(products);
});
// GET all best sellers
router.get("/best-sellers", async (req, res) => {
  const products = await Product.find().sort({ soldCount: -1 }).limit(10);
  res.json(products);
});
// GET all special offers
router.get("/special-offers", async (req, res) => {
  const products = await Product.find({ isSpecialOffer: true });
  res.json(products);
});
// GET all top-rated products
router.get("/top-rated", async (req, res) => {
  const products = await Product.find().sort({ rating: -1 }).limit(10);
  res.json(products);
});
// GET all new-arrival products
router.get("/new-arrivals", async (req, res) => {
  const products = await Product.find().sort({ createdAt: -1 }).limit(10);
  res.json(products);
});

// ADD product
router.post("/", async (req, res) => {
  try {
    const product = new Product(req.body);
    await product.save();
    res.status(201).json(product);
  } catch (error) {
    res.status(400).json({ message: "Product not saved" });
  }
});


module.exports = router;
