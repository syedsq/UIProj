<?php
session_start();
include 'header.php'; // Include the header
require 'config.php'; // Use external config for DB credentials

// Ensure database credentials exist
if (empty($host) || empty($dbname) || empty($username) || empty($password)) {
    die("Database connection failed: Missing credentials in config.php.");
}

// Attempt database connection
try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
    ]);
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}

// Fetch authors from the database
try {
    $stmt = $pdo->query("SELECT * FROM Authors ORDER BY name ASC");
    $authors = $stmt->fetchAll();
} catch (PDOException $e) {
    die("Failed to fetch authors: " . $e->getMessage());
}
?>

<div class="container">
    <h1>Our Authors</h1>
    <div class="grid-container">
        <?php if (!empty($authors)) : ?>
            <?php foreach ($authors as $author) : ?>
                <div class="author-card">
                    <img src="images/authors/<?= strtolower(str_replace([' ', '.', ','], '-', $author['name'])); ?>.jpg" 
                         alt="<?= htmlspecialchars($author['name']); ?>" 
                         onerror="this.src='images/authors/default.jpg';">
                    <h3><?= htmlspecialchars($author['name']); ?></h3>
                    <p><?= htmlspecialchars($author['bio'] ?? 'No biography available.'); ?></p>
                </div>
            <?php endforeach; ?>
        <?php else : ?>
            <p class="no-results">No authors found.</p>
        <?php endif; ?>
    </div>
</div>

<?php include 'footer.php'; ?> <!-- Include footer -->

<style>
/* Container similar to books.php */
.container {
    max-width: 1200px;
    margin: 20px auto;
    padding: 20px;
    background: #ffffff;
    border-radius: 12px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
    text-align: center;
    border: 2px solid black;
}

/* Title */
h1 {
    font-size: 2rem;
    color: #333;
    margin-bottom: 20px;
}

/* Grid layout for authors */
.grid-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
    padding: 20px;
}

/* Author card */
.author-card {
    background: white;
    border-radius: 8px;
    border: 2px solid black;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    padding: 15px;
    text-align: center;
    transition: transform 0.2s;
}

/* Hover effect */
.author-card:hover {
    transform: scale(1.05);
}

/* Author image */
.author-card img {
    width: 120px;
    height: 120px;
    object-fit: cover;
    border-radius: 50%;
    border: 2px solid black;
    margin-bottom: 10px;
}

/* Author name */
.author-card h3 {
    color: #007BFF;
    font-size: 18px;
    margin: 10px 0;
}

/* Author bio */
.author-card p {
    font-size: 14px;
    color: #666;
    margin: 5px 0;
}

/* No authors message */
.no-results {
    font-size: 16px;
    color: #777;
}
</style>
