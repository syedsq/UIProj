<?php
session_start(); // Start a session to track logged-in users

// Check for database URL from environment variable or use fallback values
$dbUrl = getenv('JAWSDB_URL'); // Try to fetch JAWSDB_URL

if ($dbUrl) {
    // Parse the URL if it's set
    $dbParts = parse_url($dbUrl);
    $host = $dbParts['host'];
    $dbname = ltrim($dbParts['path'], '/');
    $username = $dbParts['user'];
    $password = $dbParts['pass'];
} else {
    // Use fallback for local development
    $host = 'localhost';
    $dbname = 'bookstore_db';
    $username = 'root'; // Adjust for your local setup
    $password = '';     // Adjust for your local setup
}

// Connect to the database
try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}

// Initialize error messages
$error = '';
$success = '';

// Check if form data is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim($_POST['email']);
    $username = trim($_POST['username']);
    $password = $_POST['password'];
    $confirmPassword = $_POST['confirm-password'];

    // Validate input
    if ($password !== $confirmPassword) {
        $error = "Passwords do not match.";
    } else {
        // Check if email or username already exists
        $stmt = $pdo->prepare("SELECT * FROM Users WHERE email = :email OR username = :username");
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':username', $username);
        $stmt->execute();
        if ($stmt->fetch()) {
            $error = "Email or username already exists.";
        } else {
            // Hash the password
            $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

            // Insert user into database
            $stmt = $pdo->prepare("INSERT INTO Users (email, username, password_hash, address, created_at) 
                                   VALUES (:email, :username, :password_hash, :address, :created_at)");
            $stmt->bindParam(':email', $email);
            $stmt->bindParam(':username', $username);
            $stmt->bindParam(':password_hash', $hashedPassword);
            $stmt->bindValue(':address', ''); // Default value for address (can be updated later)
            $stmt->bindValue(':created_at', date('Y-m-d H:i:s'));

            if ($stmt->execute()) {
                $success = "Account created successfully. <a href='login.php'>Log in here</a>";
            } else {
                $error = "An error occurred. Please try again.";
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - RowdyBookly</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* Inline adjustments to maintain theme consistency */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }
        .signup-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .signup-container {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            padding: 2rem;
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        .signup-container h1 {
            font-size: 24px;
            color: #333333;
            margin-bottom: 1rem;
        }
        .textbox {
            width: 100%;
            padding: 0.8rem;
            margin: 0.5rem 0;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        .signup-button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 0.8rem;
            font-size: 16px;
            border-radius: 8px;
            width: 100%;
            cursor: pointer;
            margin-top: 1rem;
        }
        .signup-button:hover {
            background-color: #0056b3;
        }
        .login-link {
            display: inline-block;
            margin-top: 1rem;
            color: #007BFF;
            text-decoration: none;
        }
        .login-link:hover {
            text-decoration: underline;
        }
        .home-icon {
            text-decoration: none;
            font-size: 20px;
            color: #007BFF;
            position: absolute;
            top: 20px;
            left: 20px;
        }
    </style>
</head>
<body>
    <header>
        <a href="index.php" class="home-icon">🏠</a> <!-- Home icon to go back to the main page -->
    </header>
    <div class="signup-wrapper">
        <main class="signup-container">
            <h1>Create Account</h1>
            <?php 
            if (!empty($error)) { 
                echo "<p style='color:red;'>$error</p>"; 
            } 
            if (!empty($success)) { 
                echo "<p style='color:green;'>$success</p>"; 
            } 
            ?>
            <form action="signup.php" method="post">
                <label for="email">Email:</label>
                <input class="textbox" type="email" id="email" name="email" placeholder="Enter your email" required>
                
                <label for="username">Username:</label>
                <input class="textbox" type="text" id="username" name="username" placeholder="Choose a username" required>
                
                <label for="password">Password:</label>
                <input class="textbox" type="password" id="password" name="password" placeholder="Enter a password" required>
                
                <label for="confirm-password">Verify Password:</label>
                <input class="textbox" type="password" id="confirm-password" name="confirm-password" placeholder="Re-enter your password" required>
                
                <button type="submit" class="signup-button">Sign Up</button>
            </form>
            <p><a href="login.php" class="login-link">Already a member? Log in</a></p>
        </main>
    </div>
</body>
</html>
