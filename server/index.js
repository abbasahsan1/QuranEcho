const express = require("express");
const app = express();
const mongoose = require('mongoose');
const UserModel = require('./models/User');
//const AccountModel = require('./models/accounts');

const cors = require("cors");
app.use(express.json());
app.use(cors({
  origin: ['http://localhost:8081', 'http://10.0.2.2:8081'], // Android emulator
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  credentials: true
}));

mongoose.connect("mongodb+srv://QuranEcho:QuranEcho@db.mpffo.mongodb.net/QuranEcho?retryWrites=true&w=majority&appName=DB")
.then(() => console.log("Connected to MongoDB"))
.catch(err => console.error("MongoDB connection error:", err));

// Add these to handle connection events
mongoose.connection.on('connected', () => {
  console.log('Mongoose connected to DB');
});

mongoose.connection.on('error', (err) => {
  console.log('Mongoose connection error:', err);
});


app.get("/getUsers", async (req, res) => {
    try {
        const result = await UserModel.find({});
        res.json(result);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

const validator = require('validator'); 
const bcrypt = require('bcrypt'); 

app.post("/registerUser", async (req, res) => {
  const { username, email, password } = req.body;

  // Check if all fields are provided
  if (!username || !email || !password) {
      return res.status(400).json({ message: "All fields are required" });
  }

  // Validate email format
  if (!validator.isEmail(email)) {
      return res.status(400).json({ message: "Invalid email format" });
  }

  // Check for password strength
  const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
  if (!passwordRegex.test(password)) {
      return res.status(400).json({
          message:
              "Password must be at least 8 characters long, include letters, numbers, and special characters.",
      });
  }

  try {
      // Check if the email already exists
      const existingUser = await UserModel.findOne({ email });
      if (existingUser) {
          return res.status(400).json({ message: "Email is already used" });
      }

      // Hash the password before saving
      const hashedPassword = await bcrypt.hash(password, 10);

      const newUser = new UserModel({
          username,
          email,
          password: hashedPassword,
      });

      await newUser.save();
      res.status(201).json({ message: "User registered successfully" });
  } catch (error) {
      console.error("Error during user registration:", error);
      res.status(500).json({ message: "Internal server error" });
  }
});



//bcrypt = require('bcrypt'); // Already installed for registration, reuse here
app.post("/login", async (req, res) => {
    const { username, password } = req.body;

    try {
        // Find the account with the provided username
        const account = await UserModel.findOne({ username });

        if (!account) {
            // If no account found, return an error
            return res.status(401).json({ message: "Username not found" });
        }

        // Check if the password matches the stored hash
        const isPasswordValid = await bcrypt.compare(password, account.password);
        if (!isPasswordValid) {
            return res.status(401).json({ message: "Incorrect password" });
        }

        // If login successful, send success response
        res.status(200).json({
            message: "Login successful",
            category: account.category, // Assuming a `category` field exists
        });
    } catch (error) {
        console.error("Login error:", error);
        res.status(500).json({ message: "An error occurred. Please try again later." });
    }
});

app.listen(3000, '0.0.0.0', () => {
    console.log("Server is running on 3000");
})