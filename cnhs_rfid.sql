-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 20, 2026 at 02:14 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cnhs_rfid`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(60) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('admin','counselor') NOT NULL DEFAULT 'admin',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `email`, `password_hash`, `role`, `is_active`, `created_at`) VALUES
(1, 'admin', 'Villanuevajoshua745@gmail.com', '$2y$10$4eoObWz6EdvUeWjDJEdNUuRXOVN3fSPxy7plrFUmORSisJXZMPURy', 'admin', 1, '2026-11-18 13:00:42'),
(2, 'joshua', 'ayendelacruz210@gmail.com', '$2y$10$QhpqgsojvfjMvkfZkDONGeW0FIr2SEK./5Wfy01huZXX2ykI4VtlG', 'counselor', 1, '2026-11-20 10:03:41');

-- --------------------------------------------------------

--
-- Table structure for table `admin_login_attempts`
--

CREATE TABLE `admin_login_attempts` (
  `ip_hash` char(64) NOT NULL,
  `failed_attempts` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `last_attempt_at` datetime DEFAULT NULL,
  `locked_until` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED DEFAULT NULL,
  `actor_username` varchar(60) NOT NULL,
  `action` varchar(60) NOT NULL,
  `entity_type` varchar(40) NOT NULL,
  `entity_id` varchar(64) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audit_log`
--

INSERT INTO `audit_log` (`id`, `admin_id`, `actor_username`, `action`, `entity_type`, `entity_id`, `details`, `created_at`) VALUES
(1, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"count\":4,\"page\":1}', '2026-11-20 09:45:20'),
(2, 1, 'admin', 'audit.viewed', 'audit_log', NULL, '{\"page\":1}', '2026-11-20 09:45:29'),
(3, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"count\":4,\"page\":1}', '2026-11-20 09:45:32'),
(4, 1, 'admin', 'audit.viewed', 'audit_log', NULL, '{\"page\":1}', '2026-11-20 09:57:20'),
(5, 1, 'admin', 'staff.created', 'admin', '2', '{\"username\":\"joshua\",\"role\":\"counselor\"}', '2026-11-20 10:03:41'),
(6, 2, 'joshua', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[12,10,11,9],\"page\":1}', '2026-11-20 10:03:54'),
(7, 2, 'joshua', 'report.details_viewed', 'report', '12', '{\"reference\":\"CNHS-20261119-000012\"}', '2026-11-20 10:03:57'),
(8, 2, 'joshua', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[12,10,11,9],\"page\":1}', '2026-11-20 10:04:03'),
(9, 2, 'joshua', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[12,10,11,9],\"page\":1}', '2026-11-20 10:04:04'),
(10, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[12,10,11,9],\"page\":1}', '2026-11-20 10:04:46'),
(11, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[12,10,11,9],\"page\":1}', '2026-11-20 10:05:16'),
(12, 1, 'admin', 'report.deleted', 'report', '12', '{\"reference\":\"CNHS-20261119-000012\"}', '2026-11-20 10:05:19'),
(13, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[10,11,9],\"page\":1}', '2026-11-20 10:05:19'),
(14, 1, 'admin', 'report.deleted', 'report', '10', '{\"reference\":\"CNHS-20261119-000010\"}', '2026-11-20 10:05:21'),
(15, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[11,9],\"page\":1}', '2026-11-20 10:05:21'),
(16, 1, 'admin', 'report.deleted', 'report', '11', '{\"reference\":\"CNHS-20261119-000011\"}', '2026-11-20 10:05:23'),
(17, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[9],\"page\":1}', '2026-11-20 10:05:23'),
(18, 1, 'admin', 'report.deleted', 'report', '9', '{\"reference\":\"CNHS-20261119-000009\"}', '2026-11-20 10:05:24'),
(19, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[],\"page\":1}', '2026-11-20 10:05:24'),
(20, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[13],\"page\":1}', '2026-11-20 10:24:11'),
(21, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[14,13],\"page\":1}', '2026-11-20 10:25:56'),
(22, 1, 'admin', 'report.details_viewed', 'report', '13', '{\"reference\":\"CNHS-20261120-000013\"}', '2026-11-20 10:26:00'),
(23, 1, 'admin', 'report.status_changed', 'report', '13', '{\"reference\":\"CNHS-20261120-000013\",\"from\":\"Pending\",\"to\":\"Done\"}', '2026-11-20 10:26:02'),
(24, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[14,13],\"page\":1}', '2026-11-20 10:26:02'),
(25, 1, 'admin', 'audit.viewed', 'audit_log', NULL, '{\"page\":1}', '2026-11-20 10:30:18'),
(26, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[14,13],\"page\":1}', '2026-11-20 10:30:21'),
(27, 1, 'admin', 'student.deactivated', 'student', '1', '{\"rfid_revoked\":true}', '2026-11-20 10:30:32'),
(28, 1, 'admin', 'rfid.replaced', 'student', '1', '{\"previous_assignment\":false,\"new_assignment\":true}', '2026-11-20 10:30:50'),
(29, 1, 'admin', 'student.updated', 'student', '1', '{\"rfid_changed\":true}', '2026-11-20 10:30:50'),
(30, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[14,13],\"page\":1}', '2026-11-20 10:31:14'),
(31, 1, 'admin', 'audit.viewed', 'audit_log', NULL, '{\"page\":1}', '2026-11-20 10:31:17'),
(32, 1, 'admin', 'audit.viewed', 'audit_log', NULL, '{\"page\":1}', '2026-11-20 10:32:35'),
(33, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[14,13],\"page\":1}', '2026-11-20 10:33:29'),
(34, 1, 'admin', 'report.status_changed', 'report', '14', '{\"reference\":\"CNHS-20261120-000014\",\"from\":\"Pending\",\"to\":\"Done\"}', '2026-11-20 10:34:00'),
(35, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[14,13],\"page\":1}', '2026-11-20 10:34:00'),
(36, 1, 'admin', 'report.details_viewed', 'report', '13', '{\"reference\":\"CNHS-20261120-000013\"}', '2026-11-20 10:34:18'),
(37, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[14,13],\"page\":1}', '2026-11-20 10:36:19'),
(38, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[14,13],\"page\":1}', '2026-11-20 10:41:00'),
(39, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[14,13],\"page\":1}', '2026-11-20 10:41:06'),
(40, 1, 'admin', 'report.status_changed', 'report', '14', '{\"reference\":\"CNHS-20261120-000014\",\"from\":\"Resolved\",\"to\":\"UnderReview\"}', '2026-11-20 10:41:09'),
(41, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[14,13],\"page\":1}', '2026-11-20 10:41:09'),
(42, 1, 'admin', 'report.status_changed', 'report', '13', '{\"reference\":\"CNHS-20261120-000013\",\"from\":\"Resolved\",\"to\":\"UnderReview\"}', '2026-11-20 10:41:11'),
(43, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[14,13],\"page\":1}', '2026-11-20 10:41:11'),
(44, 1, 'admin', 'report.deleted', 'report', '14', '{\"reference\":\"CNHS-20261120-000014\"}', '2026-11-20 10:41:28'),
(45, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[13],\"page\":1}', '2026-11-20 10:41:28'),
(46, 1, 'admin', 'report.deleted', 'report', '13', '{\"reference\":\"CNHS-20261120-000013\"}', '2026-11-20 10:41:31'),
(47, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[],\"page\":1}', '2026-11-20 10:41:31'),
(48, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[15],\"page\":1}', '2026-11-20 10:42:29'),
(49, 1, 'admin', 'audit.viewed', 'audit_log', NULL, '{\"page\":1}', '2026-11-20 10:59:04'),
(50, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[15],\"page\":1}', '2026-11-20 10:59:04'),
(51, 1, 'admin', 'student.portal_setup_code_issued', 'student', '1', NULL, '2026-11-20 10:59:11'),
(52, 1, 'admin', 'student.portal_setup_code_issued', 'student', '1', NULL, '2026-11-20 11:00:40'),
(53, 1, 'admin', 'rfid.uid_issued', 'issued_rfid_uid', '1E912E8E', NULL, '2026-11-20 11:55:30'),
(54, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[15,16],\"page\":1}', '2026-11-20 12:05:51'),
(55, 1, 'admin', 'report.details_viewed', 'report', '15', '{\"reference\":\"CNHS-20261120-000015\"}', '2026-11-20 12:05:58'),
(56, 1, 'admin', 'report.details_viewed', 'report', '16', '{\"reference\":\"CNHS-20261120-000016\"}', '2026-11-20 12:06:05'),
(57, 1, 'admin', 'audit.viewed', 'audit_log', NULL, '{\"page\":1}', '2026-11-20 13:06:29'),
(58, 1, 'admin', 'reports.list_viewed', 'report', NULL, '{\"report_ids\":[15,16],\"page\":1}', '2026-11-20 13:06:34');

-- --------------------------------------------------------

--
-- Table structure for table `issued_rfid_uids`
--

CREATE TABLE `issued_rfid_uids` (
  `uid` varchar(32) NOT NULL,
  `issued_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `issued_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `issued_rfid_uids`
--

INSERT INTO `issued_rfid_uids` (`uid`, `issued_at`, `issued_by`) VALUES
('1E912E8E', '2026-11-20 11:55:30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `reference` varchar(24) DEFAULT NULL,
  `submission_token` char(32) NOT NULL,
  `tracking_token_hash` char(64) DEFAULT NULL,
  `student_ref` int(10) UNSIGNED DEFAULT NULL,
  `reporting_method` enum('Identified','Anonymous') NOT NULL,
  `category` varchar(60) NOT NULL,
  `incident_date` enum('Today','Yesterday','This Week','Other / Not Sure') NOT NULL,
  `location` varchar(60) NOT NULL,
  `incident_detail` varchar(100) NOT NULL,
  `person_involved` enum('Student','Teacher','Staff','Unknown','Prefer not to say') DEFAULT NULL,
  `witnesses` enum('Yes','No','Not Sure') DEFAULT NULL,
  `immediate_assistance` tinyint(1) NOT NULL DEFAULT 0,
  `priority` enum('Normal','High') NOT NULL DEFAULT 'Normal',
  `status` varchar(32) NOT NULL DEFAULT 'Submitted',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `reference`, `submission_token`, `tracking_token_hash`, `student_ref`, `reporting_method`, `category`, `incident_date`, `location`, `incident_detail`, `person_involved`, `witnesses`, `immediate_assistance`, `priority`, `status`, `created_at`) VALUES
(15, 'CNHS-20261120-000015', 'bc81bc871f5f3067476967b51656be3a', '1ce8081dc8f16466f43cd7680727f5a54ca008a1d5aac847b5de64df3e3203b6', 1, 'Identified', 'Harassment', 'Today', 'Classroom', 'Sexual Harassment', 'Student', 'Yes', 1, 'High', 'Submitted', '2026-11-20 10:41:54'),
(16, 'CNHS-20261120-000016', '49e0551c4c0b9e69e19e55311d2b22aa', '1eb99c7b748c9d4567de16a2bdf9bc81d6f726ba074e5dd42dad6696be4a43c1', 1, 'Identified', 'Bullying', 'Today', 'Classroom', 'Social Exclusion', 'Unknown', 'No', 0, 'Normal', 'Submitted', '2026-11-20 12:05:30');

-- --------------------------------------------------------

--
-- Table structure for table `scan_events`
--

CREATE TABLE `scan_events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rfid_uid` varchar(32) NOT NULL,
  `device_id` varchar(80) NOT NULL,
  `scanned_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `course` varchar(120) NOT NULL,
  `year_level` varchar(30) NOT NULL,
  `section` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `rfid_uid` varchar(64) DEFAULT NULL,
  `card_status` enum('Active','Inactive') NOT NULL DEFAULT 'Active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `portal_password_hash` varchar(255) DEFAULT NULL,
  `portal_setup_code_hash` char(64) DEFAULT NULL,
  `portal_setup_expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `student_id`, `full_name`, `course`, `year_level`, `section`, `email`, `rfid_uid`, `card_status`, `created_at`, `updated_at`, `portal_password_hash`, `portal_setup_code_hash`, `portal_setup_expires_at`) VALUES
(1, '6969', 'JOSHUA VILLANUEVA', '', 'Grade 7', 'SAMPAGUITA', 'joshuapogi977@gmail.com', '12862F8E', 'Active', '2026-11-18 13:29:00', '2026-11-20 11:00:40', NULL, 'ff6bed46480020277d5e82fceb34b5a52028795df238b188dc7bbc78338f4b7a', '2026-11-21 19:00:40');

-- --------------------------------------------------------

--
-- Table structure for table `student_portal_accounts`
--

CREATE TABLE `student_portal_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `student_ref` int(11) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `verified_rfid_uid` varchar(32) NOT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL DEFAULT 'Pending',
  `requested_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `reviewed_at` datetime DEFAULT NULL,
  `reviewed_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_portal_login_attempts`
--

CREATE TABLE `student_portal_login_attempts` (
  `ip_hash` char(64) NOT NULL,
  `failed_attempts` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `last_attempt_at` datetime DEFAULT NULL,
  `locked_until` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_rfid_history`
--

CREATE TABLE `student_rfid_history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` int(11) NOT NULL,
  `rfid_uid` varchar(32) NOT NULL,
  `assigned_at` datetime NOT NULL,
  `revoked_at` datetime DEFAULT NULL,
  `assigned_by` int(10) UNSIGNED DEFAULT NULL,
  `revoked_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_rfid_history`
--

INSERT INTO `student_rfid_history` (`id`, `student_id`, `rfid_uid`, `assigned_at`, `revoked_at`, `assigned_by`, `revoked_by`) VALUES
(1, 1, '12862F8E', '2026-11-20 17:45:20', '2026-11-20 18:30:32', NULL, 1),
(2, 1, '12862F8E', '2026-11-20 18:30:50', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_migrations`
--

CREATE TABLE `system_migrations` (
  `migration_key` varchar(100) NOT NULL,
  `applied_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_migrations`
--

INSERT INTO `system_migrations` (`migration_key`, `applied_at`) VALUES
('expand_report_status_workflow_v1', '2026-11-20 10:39:28'),
('remove_identifying_scan_history_v1', '2026-11-20 10:30:07');

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
-- Indexes for table `admin_login_attempts`
--
ALTER TABLE `admin_login_attempts`
  ADD PRIMARY KEY (`ip_hash`),
  ADD KEY `idx_admin_login_attempts_last_attempt` (`last_attempt_at`);

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_audit_log_created_at` (`created_at`),
  ADD KEY `idx_audit_log_entity` (`entity_type`,`entity_id`);

--
-- Indexes for table `issued_rfid_uids`
--
ALTER TABLE `issued_rfid_uids`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `idx_issued_rfid_uids_issued_at` (`issued_at`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `submission_token` (`submission_token`),
  ADD UNIQUE KEY `reference` (`reference`),
  ADD UNIQUE KEY `uq_reports_tracking_token_hash` (`tracking_token_hash`),
  ADD KEY `idx_reports_priority_created` (`priority`,`created_at`),
  ADD KEY `idx_reports_student_ref` (`student_ref`);

--
-- Indexes for table `scan_events`
--
ALTER TABLE `scan_events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_scan_events_scanned_at` (`scanned_at`),
  ADD KEY `idx_scan_events_uid_time` (`rfid_uid`,`scanned_at`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_id` (`student_id`),
  ADD UNIQUE KEY `rfid_uid` (`rfid_uid`);

--
-- Indexes for table `student_portal_accounts`
--
ALTER TABLE `student_portal_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_student_portal_accounts_student` (`student_ref`),
  ADD KEY `idx_student_portal_accounts_status` (`status`);

--
-- Indexes for table `student_portal_login_attempts`
--
ALTER TABLE `student_portal_login_attempts`
  ADD PRIMARY KEY (`ip_hash`),
  ADD KEY `idx_student_portal_login_attempts_last_attempt` (`last_attempt_at`);

--
-- Indexes for table `student_rfid_history`
--
ALTER TABLE `student_rfid_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_rfid_history_lookup` (`rfid_uid`,`assigned_at`,`revoked_at`),
  ADD KEY `idx_rfid_history_student` (`student_id`,`assigned_at`);

--
-- Indexes for table `system_migrations`
--
ALTER TABLE `system_migrations`
  ADD PRIMARY KEY (`migration_key`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `scan_events`
--
ALTER TABLE `scan_events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_portal_accounts`
--
ALTER TABLE `student_portal_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_rfid_history`
--
ALTER TABLE `student_rfid_history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `fk_reports_student` FOREIGN KEY (`student_ref`) REFERENCES `students` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
