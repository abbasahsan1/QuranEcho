const mongoose = require('mongoose');

const UserSchema = new mongoose.Schema({
    username: {
        type: String,
        required: true,
    },
    password: {
        type: String,
        required: true,
    },
    email: {
        type: String,
        required: true,
    },
    category: {
        type: String,
        enum: ['admin', 'user'], // Define allowed categories
        default: 'user', // Default value if not provided
    }
});

const UserModel = mongoose.model("User", UserSchema);
module.exports = UserModel;