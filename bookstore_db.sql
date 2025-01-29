-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 29, 2025 at 05:22 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookstore_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `Authors`
--

CREATE TABLE `Authors` (
  `author_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `bio` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Authors`
--

INSERT INTO `Authors` (`author_id`, `name`, `bio`, `image_url`) VALUES
(1, 'Siddhartha Mukherjee', 'Author of \"The Emperor of All Maladies,\" focused on the history of cancer.', 'siddhartha-mukherjee.jpg'),
(2, 'Benjamin Graham', 'Author of \"The Intelligent Investor,\" known as the father of value investing.', 'benjamin-graham.jpg'),
(3, 'Silvanus P. Thompson', 'Author of \"Calculus Made Easy,\" a mathematician and physicist.', 'silvanus-p.-thompson.jpg'),
(4, 'Robert C. Martin', 'Author of \"Clean Code,\" a software engineer and consultant.', 'robert-c.-martin.jpg'),
(5, 'Howard Zinn', 'Author of \"A People’s History of the United States,\" a historian and activist.', 'howard-zinn.jpg'),
(6, 'Stephen Hawking', 'Author of \"A Brief History of Time,\" a renowned theoretical physicist.', 'stephen-hawking.jpg'),
(7, 'J.K. Rowling', 'Author of the \"Harry Potter\" series, a British novelist.', 'j.k.-rowling.jpg'),
(8, 'George Orwell', 'Author of \"1984,\" known for his dystopian and political works.', 'george-orwell.jpg'),
(9, 'J.R.R. Tolkien', 'Author of \"The Hobbit,\" a fantasy and philology professor.', 'j.r.r.-tolkien.jpg'),
(10, 'Philip A. Fisher', 'Author of \"Common Stocks and Uncommon Profits,\" a pioneer in finance.', NULL),
(11, 'Martin Aigner', 'Author of \"An Invitation to Mathematics\" and a mathematician.', NULL),
(13, 'Neil deGrasse Tyson', 'Renowned astrophysicist and science communicator.', 'neil-degrasse-tyson.jpg'),
(14, 'Aldous Huxley', 'Author of \"Brave New World,\" exploring a genetically engineered society.', 'aldous-huxley.jpg'),
(15, 'Steve McConnell', 'Author of \"Code Complete,\" expert in software engineering.', 'steve-mcconnell.jpg'),
(16, 'Philip A. Fisher', 'Investment pioneer and author of \"Common Stocks and Uncommon Profits.\"', NULL),
(17, 'Carl Sagan', 'Renowned astronomer and author of \"Cosmos.\"', 'carl-sagan.jpg'),
(18, 'Fyodor Dostoevsky', 'Russian novelist, author of \"Crime and Punishment.\"', 'fyodor-dostoevsky.jpg'),
(19, 'Michael Lewis', 'Author of financial and business bestsellers like \"Flash Boys.\"', 'michael-lewis.jpg'),
(20, 'Douglas Hofstadter', 'Author of \"Gödel, Escher, Bach\" and cognitive science expert.', 'douglas-hofstadter.jpg'),
(21, 'Keith Devlin', 'Mathematician and author of \"Introduction to Mathematical Thinking.\"', 'keith-devlin.jpg'),
(22, 'Jojo Moyes', 'Romance novelist, author of \"Me Before You.\"', 'jojo-moyes.jpg'),
(23, 'Lissa Rankin', 'Author of \"Mind Over Medicine,\" focused on the connection between mind and health.', 'lissa-rankin.jpg'),
(24, 'Herman Melville', 'Author of \"Moby Dick,\" a classic in American literature.', 'herman-melville.jpg'),
(25, 'Diana Gabaldon', 'Author of the \"Outlander\" series, combining history and romance.', 'diana-gabaldon.jpg'),
(26, 'Kugane Maruyama', 'Author of the \"Overlord\" series, a Japanese fantasy novelist.', 'kugane-maruyama.jpg'),
(28, 'Martin Fowler', 'Software engineer and author of \"Refactoring.\"', 'martin-fowler.jpg'),
(29, 'Richard Rusczyk', 'Mathematician and founder of the Art of Problem Solving.', 'richard-rusczyk.jpg'),
(30, 'Brent Weeks', 'Fantasy author, creator of \"The Black Prism.\"', 'brent-weeks.jpg'),
(31, 'Bessel van der Kolk', 'Renowned psychiatrist and trauma expert, author of \"The Body Keeps the Score.\"', 'bessel-van-der-kolk.jpg'),
(33, 'Robert C. Martin', 'Software engineer and author of \"The Clean Coder.\"', 'robert-c.-martin.jpg'),
(34, 'Andrew Hunt', 'Co-author of \"The Pragmatic Programmer\" and software expert.', NULL),
(35, 'Robert T. Kiyosaki', 'Author of \"Rich Dad Poor Dad,\" a financial education advocate.', NULL),
(36, 'Brandon Sanderson', 'Fantasy author, creator of \"The Way of Kings.\"', 'brandon-sanderson.jpg'),
(37, 'Patrick Rothfuss', 'Fantasy novelist, author of \"The Wise Man’s Fear.\"', 'patrick-rothfuss.jpg'),
(38, 'Emily Brontë', 'Author of \"Wuthering Heights,\" a classic gothic romance.', 'emily-brontë.jpg'),
(39, 'John J. Ratey', 'Author of \"Spark,\" exploring the connection between exercise and brain health.', NULL),
(40, 'Michael Greger', 'Author of \"How Not to Die,\" focusing on diet and chronic disease prevention.', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `BookGenres`
--

CREATE TABLE `BookGenres` (
  `book_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `BookGenres`
--

INSERT INTO `BookGenres` (`book_id`, `genre_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 4),
(13, 4),
(14, 4),
(15, 4),
(16, 4),
(17, 5),
(18, 5),
(19, 5),
(20, 6),
(21, 6),
(22, 6),
(23, 6),
(24, 7),
(25, 7);

-- --------------------------------------------------------

--
-- Table structure for table `Books`
--

CREATE TABLE `Books` (
  `book_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `cover_image_url` varchar(255) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `publication_year` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Books`
--

INSERT INTO `Books` (`book_id`, `title`, `cover_image_url`, `author_id`, `publication_year`, `price`, `description`) VALUES
(1, 'The Emperor of All Maladies', 'the-emperor-of-all-maladies.jpg', 1, 2010, 16.99, 'A biography of cancer, covering its history, treatment, and research.'),
(2, 'Mind Over Medicine', 'mind-over-medicine.jpg', 23, 2013, 13.99, 'The mind’s influence on healing and health.'),
(3, 'The Body Keeps the Score', 'the-body-keeps-the-score.jpg', 31, 2014, 16.99, 'Understanding trauma and its effects on the brain and body.'),
(4, 'The Intelligent Investor', 'the-intelligent-investor.jpg', 2, 1949, 22.50, 'A definitive book on value investing and financial wisdom.'),
(5, 'Common Stocks and Uncommon Profits', 'common-stocks-and-uncommon-profits.jpg', 16, 1958, 24.99, 'A timeless guide on stock investing and growth companies.'),
(6, 'The Rich Dad Poor Dad', 'the-rich-dad-poor-dad.jpg', 35, 1997, 19.99, 'A financial book contrasting wealth-building mindsets.'),
(7, 'Flash Boys', 'flash-boys.jpg', 19, 2014, 16.99, 'An exposé on high-frequency trading in Wall Street.'),
(8, 'Calculus Made Easy', 'calculus-made-easy.jpg', 3, 1910, 13.99, 'A simplified introduction to calculus concepts.'),
(9, 'An Invitation to Mathematics', 'an-invitation-to-mathematics.jpg', 11, 2011, 14.99, 'An introduction to mathematical ideas and beauty.'),
(10, 'Introduction to Mathematical Thinking', 'introduction-to-mathematical-thinking.jpg', 21, 2012, 17.99, 'A course on how to think like a mathematician.'),
(11, 'The Art of Problem Solving', 'the-art-of-problem-solving.jpg', 29, 2006, 18.99, 'A structured approach to mathematical problem-solving.'),
(12, 'Clean Code', 'clean-code.jpg', 4, 2008, 29.99, 'A handbook of agile software craftsmanship.'),
(13, 'Code Complete', 'code-complete.jpg', 15, 1993, 39.99, 'A comprehensive guide to software construction best practices.'),
(14, 'The Pragmatic Programmer', 'the-pragmatic-programmer.jpg', 34, 1999, 35.99, 'Essential tips for software developers.'),
(15, 'The Clean Coder', 'the-clean-coder.jpg', 33, 2011, 27.99, 'A guide to professional software development practices.'),
(16, 'Refactoring', 'refactoring.jpg', 28, 1999, 34.99, 'A guide to improving existing software code efficiently.'),
(17, 'A People’s History of the United States', 'a-peoples-history-of-the-united-states.jpg', 5, 1980, 18.99, 'A retelling of American history from the perspective of the marginalized.'),
(18, 'A History of the World in 12 Maps', 'a-history-of-the-world-in-12-maps.jpg', 10, 2012, 18.99, 'A fascinating look at how maps have shaped human history.'),
(19, 'The Guns of August', 'the-guns-of-august.jpg', 37, 1962, 14.99, 'A detailed account of the outbreak of World War I.'),
(20, 'A Brief History of Time', 'a-brief-history-of-time.jpg', 6, 1988, 15.99, 'A classic work by Stephen Hawking on cosmology and black holes.'),
(21, 'Astrophysics for People in a Hurry', 'astrophysics-for-people-in-a-hurry.jpg', 13, 2017, 11.99, 'Neil deGrasse Tyson explains the universe in an accessible way.'),
(22, 'Cosmos', 'cosmos.jpg', 17, 1980, 19.99, 'Carl Sagan’s deep dive into the wonders of the universe.'),
(23, 'Gödel, Escher, Bach', 'godel-escher-bach.jpg', 20, 1979, 23.99, 'An exploration of patterns in mathematics, music, and logic.'),
(24, 'Harry Potter and the Sorcerer’s Stone', 'harry-potter-and-the-sorcerers-stone.jpg', 7, 1997, 19.99, 'The first book in the Harry Potter series.'),
(25, 'The Hobbit', 'the-hobbit.jpg', 9, 1937, 14.99, 'A fantasy novel and children’s book by J.R.R. Tolkien.');

-- --------------------------------------------------------

--
-- Table structure for table `CartItems`
--

CREATE TABLE `CartItems` (
  `cart_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Carts`
--

CREATE TABLE `Carts` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Carts`
--

INSERT INTO `Carts` (`cart_id`, `user_id`, `created_at`) VALUES
(1, 1, '2025-01-28 03:11:57');

-- --------------------------------------------------------

--
-- Table structure for table `Genres`
--

CREATE TABLE `Genres` (
  `genre_id` int(11) NOT NULL,
  `genre_name` varchar(50) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Genres`
--

INSERT INTO `Genres` (`genre_id`, `genre_name`, `description`) VALUES
(1, 'Health and Medicine', 'Books covering topics on health, wellness, and medical sciences.'),
(2, 'Finance', 'Books about managing finances, investing, and understanding economic principles.'),
(3, 'Mathematics', 'Books exploring mathematical theories, applications, and problem-solving techniques.'),
(4, 'Coding', 'Books on programming, software development, and various coding languages.'),
(5, 'History', 'Books documenting historical events, biographies, and ancient cultures.'),
(6, 'Science', 'Books focused on scientific discoveries, principles, and research.'),
(7, 'Fantasy', 'Books that contain magical or supernatural elements.'),
(8, 'Science Fiction', 'Books based on imagined future scientific or technological advances.'),
(9, 'Classics', 'Books that have stood the test of time and are widely regarded as excellent.'),
(10, 'Romance', 'Books that focus on love and relationships.');

-- --------------------------------------------------------

--
-- Table structure for table `OrderItems`
--

CREATE TABLE `OrderItems` (
  `order_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `tax` decimal(10,2) DEFAULT 0.00,
  `discount` decimal(10,2) DEFAULT 0.00,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(20) NOT NULL,
  `status` enum('Pending','Shipped','Completed','Cancelled') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Orders`
--

INSERT INTO `Orders` (`order_id`, `user_id`, `total`, `tax`, `discount`, `firstname`, `lastname`, `address`, `city`, `state`, `zip`, `status`, `created_at`) VALUES
(3, NULL, 32.46, 2.47, 0.00, 'Alex', 'Test', '123 Street', 'Austin', 'TX', '78626', 'Pending', '2025-01-28 10:53:37'),
(4, 3, 16.23, 1.24, 0.00, 'Test1@gmail.com', 'Again', '123 Austin', 'Tx', 'Tx', '78626', 'Pending', '2025-01-28 15:56:48'),
(5, 3, 16.23, 1.24, 0.00, 'd', 'd', 'd', 'd', 'd', 'd', 'Pending', '2025-01-28 15:57:28'),
(6, NULL, 24.36, 1.86, 0.00, 'd', 'd', 'd', 'd', 'd', 'd', 'Pending', '2025-01-28 15:57:53'),
(7, NULL, 24.36, 1.86, 0.00, 'd', 'd', 'd', 'd', 'd', 'd', 'Pending', '2025-01-28 15:58:47'),
(8, NULL, 24.36, 1.86, 0.00, 'Dest@gmail.com', 'Test', '123 Andro', 'Austi', 'TX', '78672', 'Pending', '2025-01-28 16:00:41'),
(9, NULL, 0.00, 0.00, 0.00, 'Dest@gmail.com', 'Test', '123 Andro', 'Austi', 'TX', '78672', 'Pending', '2025-01-28 16:02:59'),
(10, NULL, 0.00, 0.00, 0.00, 'Dest@gmail.com', 'Test', '123 Andro', 'Austi', 'TX', '78672', 'Pending', '2025-01-28 16:03:10'),
(11, NULL, 43.29, 3.30, 0.00, 'Tesig@gmail.com', 'Last', '123 Usa ln', 'Austin', 'TX', '78992', 'Pending', '2025-01-28 16:03:50'),
(12, NULL, 43.29, 3.30, 0.00, 'Tesig@gmail.com', 'Last', '123 Usa ln', 'Austin', 'TX', '78992', 'Pending', '2025-01-28 16:03:55'),
(13, NULL, 43.29, 3.30, 0.00, 'Tesig@gmail.com', 'Last', '123 Usa ln', 'Austin', 'TX', '78992', 'Pending', '2025-01-28 16:03:58'),
(14, NULL, 86.58, 6.60, 0.00, 'name', 'name', 'addy', 'ausitn', 'tx', '78626', 'Pending', '2025-01-28 16:05:58'),
(15, 3, 43.29, 3.30, 0.00, 'Test', 'Test', 'Nardia', 'Ausitn', 'TX', '78626', 'Pending', '2025-01-28 16:15:46'),
(16, 3, 43.29, 3.30, 0.00, 'Test', 'Test', 'Nardia', 'Ausitn', 'TX', '78626', 'Pending', '2025-01-28 16:20:00'),
(17, 3, 43.29, 3.30, 0.00, 'Test', 'Test', 'Nardia', 'Ausitn', 'TX', '78626', 'Pending', '2025-01-28 16:21:40'),
(18, 3, 43.29, 3.30, 0.00, 'Test', 'Test', 'Nardia', 'Ausitn', 'TX', '78626', 'Pending', '2025-01-29 11:16:17');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`user_id`, `username`, `password_hash`, `email`, `address`, `created_at`) VALUES
(1, 'jdoe', 'hashed_password_123123', 'jdoe@example.com', '123 Main St, Anytown, USA', '2025-01-28 03:11:57'),
(3, 'Test', '$2y$10$R.p53vAyQIpR9hTqTZsF9.HI1Wtymgvyx.zKQOj7Sn05iXgaByt4W', 'Test@gmail.com', '', '2025-01-28 14:54:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Authors`
--
ALTER TABLE `Authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `BookGenres`
--
ALTER TABLE `BookGenres`
  ADD PRIMARY KEY (`book_id`,`genre_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `Books`
--
ALTER TABLE `Books`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `CartItems`
--
ALTER TABLE `CartItems`
  ADD PRIMARY KEY (`cart_id`,`book_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `Carts`
--
ALTER TABLE `Carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `Genres`
--
ALTER TABLE `Genres`
  ADD PRIMARY KEY (`genre_id`),
  ADD UNIQUE KEY `genre_name` (`genre_name`);

--
-- Indexes for table `OrderItems`
--
ALTER TABLE `OrderItems`
  ADD PRIMARY KEY (`order_id`,`book_id`),
  ADD KEY `book_id` (`book_id`);

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Authors`
--
ALTER TABLE `Authors`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `Books`
--
ALTER TABLE `Books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `Carts`
--
ALTER TABLE `Carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `Genres`
--
ALTER TABLE `Genres`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `BookGenres`
--
ALTER TABLE `BookGenres`
  ADD CONSTRAINT `bookgenres_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `Books` (`book_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookgenres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `Genres` (`genre_id`) ON DELETE CASCADE;

--
-- Constraints for table `Books`
--
ALTER TABLE `Books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `Authors` (`author_id`) ON DELETE CASCADE;

--
-- Constraints for table `CartItems`
--
ALTER TABLE `CartItems`
  ADD CONSTRAINT `cartitems_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `Books` (`book_id`) ON DELETE CASCADE;

--
-- Constraints for table `Carts`
--
ALTER TABLE `Carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);

--
-- Constraints for table `OrderItems`
--
ALTER TABLE `OrderItems`
  ADD CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `Books` (`book_id`) ON DELETE CASCADE;

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `Users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
