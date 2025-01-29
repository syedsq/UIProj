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

// Initialize error variable for login feedback
$error = "";

// Check if form data is submitted
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Fetch user data from the database
    $stmt = $pdo->prepare("SELECT * FROM Users WHERE email = :email");
    $stmt->bindParam(':email', $email);
    $stmt->execute();
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    // Verify user and password
    if ($user && password_verify($password, $user['password_hash'])) {
        // Password is correct; set session variables
        $_SESSION['user_id'] = $user['user_id'];
        $_SESSION['username'] = $user['username'];
        $_SESSION['email'] = $user['email'];

        // Redirect to a dashboard or home page
        header("Location: index.php");
        exit;
    } else {
        // Invalid email or password
        $error = "Invalid email or password.";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - RowdyBookly</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* Inline adjustments to maintain consistency */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }
        .login-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        .login-container {
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            padding: 2rem;
            width: 100%;
            max-width: 400px;
            text-align: center;
        }
        .login-container h1 {
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
        .login-button {
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
        .login-button:hover {
            background-color: #0056b3;
        }
        .signup-link {
            display: inline-block;
            margin-top: 1rem;
            color: #007BFF;
            text-decoration: none;
        }
        .signup-link:hover {
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
    <div class="login-wrapper">
        <main class="login-container">
            <h1>Login</h1>
            <?php if (!empty($error)) { echo "<p style='color:red;'>$error</p>"; } ?>
            <form action="login.php" method="post">
                <label for="email">Email:</label>
                <input class="textbox" type="email" id="email" name="email" placeholder="Enter your email" required>
                
                <label for="password">Password:</label>
                <input class="textbox" type="password" id="password" name="password" placeholder="Enter your password" required>
                
                <button type="submit" class="login-button">Login</button>
            </form>
            <p><a href="signup.php" class="signup-link">Not a member? Sign up</a></p>
        </main>
    </div>
</body>
</html>
