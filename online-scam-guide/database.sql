-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2025 at 09:24 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fraud_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$encryptedpasswordhash');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `fraud_type` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `category` varchar(100) NOT NULL DEFAULT 'Other'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `name`, `email`, `fraud_type`, `description`, `date`, `category`) VALUES
(3, 'Rajesh Kumar', 'rajesh.kumar@example.com', 'Fake Websites', '\"I came across a website claiming to offer 80% discounts on branded shoes. The website looked legitimate, but after making a payment, I never received my order. The customer service email is unresponsive, and the contact number is invalid. The website URL is \'www.discountshoe-store.com\'.\"\r\n', '2025-03-28 05:41:51', 'Other'),
(4, 'Priya Sharma', 'priya.sharma123@example.com', 'Phishing', '\"I received an email that appeared to be from my bank, asking me to verify my account by clicking a link. The link led to a website that looked identical to my bank\'s site, but I noticed the URL was slightly different. After entering my details, I realized it was a scam and immediately contacted my bank to secure my account.\"\r\n', '2025-03-28 05:42:35', 'Other'),
(5, 'John Doe', 'johndoe@example.com', 'Phishing Scam', 'Received an email claiming to be from my bank, asking for account details.', '2025-04-02 19:12:37', 'Email Scams'),
(6, 'Alice Smith', 'alice.smith@example.com', 'Investment Fraud', 'Invested in a fake crypto scheme promising 200% returns in a month.', '2025-04-02 19:12:37', 'Financial Scams'),
(7, 'Robert Brown', 'robert.brown@example.com', 'E-commerce Scam', 'Ordered a product online but never received it. The website is now down.', '2025-04-02 19:12:37', 'Online Shopping Scams'),
(8, 'Sophia Johnson', 'sophia.johnson@example.com', 'Loan Scam', 'Got a call offering a personal loan with no credit check, but they asked for an upfront payment.', '2025-04-02 19:12:37', 'Loan & Credit Scams'),
(9, 'Michael Lee', 'michael.lee@example.com', 'Job Scam', 'Applied for a job, and they asked for a registration fee before the interview.', '2025-04-02 19:12:37', 'Employment Scams'),
(10, 'Emma Wilson', 'emma.wilson@example.com', 'Identity Theft', 'Someone used my personal details to create a fake social media profile.', '2025-04-02 19:12:37', 'Identity Fraud'),
(11, 'David Miller', 'david.miller@example.com', 'Tech Support Scam', 'Received a call claiming to be from Microsoft asking for remote access to my computer.', '2025-04-02 19:12:37', 'Tech Support Scams'),
(12, 'Olivia Davis', 'olivia.davis@example.com', 'Lottery Scam', 'Got a message saying I won a lottery but needed to pay processing fees.', '2025-04-02 19:12:37', 'Lottery & Prize Scams'),
(13, 'Daniel White', 'daniel.white@example.com', 'Romance Scam', 'Met someone online who asked for money after a few weeks of chatting.', '2025-04-02 19:12:37', 'Dating & Romance Scams'),
(14, 'Sophia Clark', 'sophia.clark@example.com', 'Fake Charity Scam', 'Donated money to a charity that turned out to be fake.', '2025-04-02 19:12:37', 'Charity & Donation Scams');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
