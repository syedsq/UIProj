<?php
include 'header.php'; // Use same header as author-detail
require 'config.php';

// Validate book ID
$book_id = filter_var($_GET['book_id'] ?? null, FILTER_VALIDATE_INT);
if (!$book_id || $book_id < 1) die("Invalid book ID.");

try {
    // Fetch book details using JOIN with prepared statement
    $stmt = $pdo->prepare("
        SELECT b.title, b.cover_image_url, b.publication_year, b.price, b.description, 
               a.author_id, a.name AS author_name
        FROM Books b
        JOIN Authors a ON b.author_id = a.author_id
        WHERE b.book_id = ?
    ");
    $stmt->execute([$book_id]);
    $book = $stmt->fetch(PDO::FETCH_ASSOC);

    if (!$book) die("Book not found.");

    // Fetch genres
    $stmt = $pdo->prepare("
        SELECT g.genre_name
        FROM BookGenres bg
        JOIN Genres g ON bg.genre_id = g.genre_id
        WHERE bg.book_id = ?
    ");
    $stmt->execute([$book_id]);
    $genres = $stmt->fetchAll(PDO::FETCH_COLUMN, 0);

} catch (PDOException $e) {
    error_log("Database error: " . $e->getMessage());
    die("An error occurred while loading the page.");
}
?>

<div class="container">
    <nav class="breadcrumb">
        <a href="index.php">Home</a> &raquo;
        <?php if (!empty($genres)) : ?>
            <a href="books.php?genre=<?= urlencode($genres[0]) ?>">
                <?= htmlspecialchars($genres[0]) ?>
            </a>
        <?php else : ?>
            <span>No Genre</span>
        <?php endif; ?> &raquo;
        <span class="current"><?= htmlspecialchars($book['title']) ?></span>
    </nav>

    <div class="book-detail">
        <img src="images/books/<?= htmlspecialchars($book['cover_image_url'] ?: 'default.jpg') ?>" 
             alt="<?= htmlspecialchars($book['title']) ?>"
             class="book-cover"
             onerror="this.src='images/books/default.jpg'">
        
        <div class="book-info">
            <h1><?= htmlspecialchars($book['title']) ?></h1>
            
            <div class="meta-section">
                <p class="author">
                    By <a href="author-detail.php?id=<?= $book['author_id'] ?>">
                        <?= htmlspecialchars($book['author_name']) ?>
                    </a>
                </p>
                
                <?php if (!empty($genres)) : ?>
                    <div class="genres">
                        <?php foreach ($genres as $genre) : ?>
                            <a href="books.php?genre=<?= urlencode($genre) ?>" class="genre-tag">
                                <?= htmlspecialchars($genre) ?>
                            </a>
                        <?php endforeach; ?>
                    </div>
                <?php endif; ?>
            </div>

            <div class="price-section">
                <span class="price">$<?= number_format((float)$book['price'], 2) ?></span>
                <form action="add-to-cart.php" method="post" class="cart-form">
                    <input type="hidden" name="book_id" value="<?= $book_id ?>">
                    <div class="quantity-selector">
                        <input type="number" name="quantity" value="1" min="1" max="10" class="qty-input">
                        <button type="submit" class="add-to-cart-btn">
                            🛒 Add to Cart
                        </button>
                    </div>
                </form>
            </div>

            <div class="book-description">
                <h3>Description</h3>
                <p><?= htmlspecialchars($book['description'] ?? 'No description available.') ?></p>
            </div>

            <div class="publication-info">
                <p><strong>Published:</strong> <?= htmlspecialchars($book['publication_year']) ?></p>
            </div>
        </div>
    </div>
</div>

<?php include 'footer.php'; ?>

<style>
/* Container - Match author-detail styling */
.container {
    max-width: 1200px;
    margin: 20px auto;
    padding: 20px;
    background: #ffffff;
    border-radius: 12px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

/* Book detail layout */
.book-detail {
    display: grid;
    grid-template-columns: 300px 1fr;
    gap: 30px;
    margin-top: 20px;
}

.book-cover {
    width: 100%;
    height: 400px;
    object-fit: cover;
    border-radius: 8px;
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
}

.book-info h1 {
    font-size: 2.2rem;
    margin-bottom: 15px;
    color: #333;
}

.meta-section {
    margin-bottom: 25px;
}

.author a {
    color: #007BFF;
    text-decoration: none;
    font-size: 1.1rem;
}

.genres {
    display: flex;
    gap: 10px;
    flex-wrap: wrap;
    margin-top: 15px;
}

.genre-tag {
    background: #f0f0f0;
    padding: 5px 12px;
    border-radius: 15px;
    font-size: 0.9rem;
    text-decoration: none;
    color: #555;
    transition: background 0.2s;
}

.genre-tag:hover {
    background: #e0e0e0;
}

.price-section {
    background: #f8f9fa;
    padding: 20px;
    border-radius: 8px;
    margin: 25px 0;
}

.price {
    font-size: 1.8rem;
    color: #28a745;
    font-weight: bold;
    display: block;
    margin-bottom: 15px;
}

.quantity-selector {
    display: flex;
    gap: 10px;
    align-items: center;
}

.qty-input {
    width: 70px;
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.add-to-cart-btn {
    background: #28a745;
    color: white;
    border: none;
    padding: 10px 25px;
    border-radius: 4px;
    cursor: pointer;
    transition: background 0.2s;
}

.add-to-cart-btn:hover {
    background: #218838;
}

.book-description {
    border-top: 1px solid #eee;
    padding-top: 20px;
}

.book-description h3 {
    font-size: 1.4rem;
    margin-bottom: 15px;
    color: #333;
}

.publication-info {
    margin-top: 20px;
    color: #666;
}

.breadcrumb {
    font-size: 0.9rem;
    color: #666;
    margin-bottom: 20px;
}

.breadcrumb a {
    color: #007BFF;
    text-decoration: none;
}
</style>