-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2024 at 02:07 PM
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
-- Database: `salaam`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `account_type_sp` (`_name` TEXT, `_date` DATE)   BEGIN

if EXISTS(SELECT id FROM account_type WHERE name=_name)THEN

SELECT concat('danger|',_name, ' Horay ayaa lo diwan galiyay');
ELSE

INSERT INTO account_type(name,date)
VALUES(_name,_date);
SELECT concat('success|',_name, ' Wala diwan galiyay');
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `branch_sp` (`_name` TEXT, `_tell` TEXT, `_address` TEXT, `_admin` TEXT, `_admintell` TEXT, `_date` DATE)   BEGIN
if EXISTS(SELECT id FROM branch WHERE name=_name)THEN
SELECT concat('danger|',_name,' Horay ayaa loo diwan galiyay');

ELSE
INSERT INTO branch(name,tell,address,admin,admin_tell,date)
VALUES(_name,_tell,_address,_admin,_admintell,_date);
SELECT concat('success|',_name,' waala diwan galiyay');


END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_account_sp` (IN `_customer_id` INT, IN `_acounttype` INT, IN `_segnature` TEXT, IN `_user_id` INT, IN `_branch_id` INT, IN `_date` DATE)   BEGIN

INSERT INTO customer_account(customer_id,account_no,account_type_id,segnature,date,exp_date,user_id,branch_id)
VALUES(_customer_id,account_no(),_acounttype,_segnature,_date,adddate(_date,INTERVAL 1 year),_user_id,_branch_id);

SELECT concat('success| regisred Success');

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `customer_sp` (`_name` VARCHAR(100), `_tell` VARCHAR(100), `_address` TEXT, `_doc_no` TEXT, `_doctype` TEXT, `_m1n` TEXT, `_m1t` TEXT, `_m1ty` TEXT, `_m2n` TEXT, `_m2t` TEXT, `_image` TEXT, `_user_id` INT, `_accounty` INT, `_segnature` TEXT, `_branch_id` INT, `_date` DATE)   BEGIN
START TRANSACTION;
if EXISTS(SELECT id FROM customer WHERE name=_name AND tell=_tell)THEN

SELECT concat('danger|',_name,' Horay ayaa loo diwan galiyay');
ELSE

INSERT INTO customer(name,tell,address,doc_no,doc_type,masul_name,_masul_tell,_masul_type,masul2_name,masul2_tell,image,user_id)
VALUES(_name,_tell,_address,_doc_no,_doctype,_m1n,_m1t,_m1ty,_m2n,_m2t,_image,_user_id);


INSERT INTO customer_account(customer_id,account_no,account_type_id,segnature,date,exp_date,user_id,branch_id)
VALUES(last_insert_id(),account_no(),_accounty,_segnature,_date,adddate(_date,INTERVAL 1 year),_user_id,_branch_id);

SELECT concat('success|',_name,' waala diiwan galiyay');
END IF;
COMMIT;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deposit_sp` (IN `_acc` INT, IN `_name` TEXT, IN `_amount` DOUBLE, IN `_inwords` TEXT, IN `_description` TEXT, IN `_deposit_by` TEXT, IN `_user_id` INT, IN `_date` DATE)   BEGIN

SELECT a.customer_id INTO @cust_id FROM customer_account a WHERE a.account_no=_acc LIMIT 1;
INSERT INTO deposit(customer_id,account_no,amount,inwords,description,date,deposit_py,user_id)
VALUES(@cust_id,_acc,_amount,_inwords,_description,_date,_deposit_by,_user_id);

SELECT concat('success|',_amount,' Has been Depoet Success');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `find_name_sp` (IN `_acc` INT)   BEGIN
if EXISTS(select name from customer c
join customer_account a on a.customer_id=c.id 
where a.account_no=_acc LIMIT 1)THEN

select name from customer c
join customer_account a on a.customer_id=c.id 
where a.account_no=_acc LIMIT 1;
ELSE

SELECT 'Accountkaan ma ahan mid jira fadlan iska hubi';
end IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `login_sp` (IN `_user` TEXT, IN `_pass` TEXT)   BEGIN
if EXISTS(SELECT id FROM users WHERE username=_user AND password=md5(_pass) AND status=1)THEN
SELECT id user_id,username,image FROM users WHERE username=_user AND password=md5(_pass) AND status=1;
ELSE

SELECT 'username or password inccorrect' as error;
END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `rp_cust_sp` (`_branch_id` TEXT, `_from` DATE, `_to` DATE)   BEGIN

SELECT c.name 'Customer Name',c.tell Tell,c.address FROM customer c;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `rp_deposit_sp` (`_from` DATE, `_to` DATE)   BEGIN
if(_to = '0000-00-00')THEN
SET _to = now();

END IF;
SELECT c.name `Customer Name`,w.account_no `Account No`,w.amount,w.date FROM customer c JOIN deposit w on c.id=w.customer_id WHERE w.date BETWEEN _from AND _to;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `rp_withdraw_ap` (`_from` DATE, `_to` DATE)   BEGIN
if(_to = '0000-00-00')THEN
SET _to = now();

END IF;
SELECT c.name `Customer Name`,w.account_no `Account No`,w.amount,w.date FROM customer c JOIN withdraw w on c.id=w.customer_id WHERE w.date BETWEEN _from AND _to;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `search_sp` (IN `_text` TEXT, IN `_action` TEXT)   BEGIN

if(_action='customer')THEN
SELECT id,name FROM customer WHERE (name LIKE concat('%',_text,'%') or tell LIKE concat('%',_text,'%'));

END IF;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `withdraw_sp` (IN `_acc` INT, IN `_amount` DOUBLE, IN `_inwords` TEXT, IN `_description` TEXT, IN `_user_id` INT, IN `_date` DATE)   BEGIN

SELECT account_balance(_acc) INTO @balance;
SELECT m.max INTO @max FROM max_withdraw m ORDER by id desc LIMIT 1;
SELECT sum(amount) INTO @w FROM withdraw w WHERE w.account_no=_acc AND date=date(now());
if(_amount > @balance)THEN
SELECT concat('danger| Haraaga kuma filna');
ELSEIF((@w + _amount) > @max)THEN
SELECT concat('danger| Waxaad dhaftay xadiga lacag la bixida waxaadna la bixi kartaa ',format(@max - @w,2));
ELSE
SELECT a.customer_id INTO @cust_id FROM customer_account a WHERE a.account_no=_acc LIMIT 1;
INSERT INTO withdraw(customer_id,account_no,amount,inwords,description,date,user_id)
VALUES(@cust_id,_acc,_amount,_inwords,_description,_date,_user_id);

SELECT concat('success|',_amount,' Has been Withdrawd Success');

END IF;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `account_balance` (`_acc_id` INT) RETURNS DOUBLE  BEGIN

SELECT sum(amount) INTO @d FROM deposit d WHERE d.account_no=_acc_id;


SELECT sum(amount) INTO @w FROM withdraw d WHERE d.account_no=_acc_id;


RETURN ifnull(@d,0) - ifnull(@w,0);
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `account_no` () RETURNS BIGINT(20)  BEGIN
SET @acc = 12345678;

SELECT a.account_no+1 INTO @acc FROM customer_account a ORDER by a.account_no DESC LIMIT 1;


RETURN @acc;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `account_type`
--

CREATE TABLE `account_type` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_type`
--

INSERT INTO `account_type` (`id`, `name`, `date`) VALUES
(1, 'Saving', '2023-05-09'),
(2, 'Current', '2023-05-09'),
(3, '%', '2023-05-01'),
(4, 'hhh', '2023-05-14');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `tell` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `admin` varchar(100) DEFAULT NULL,
  `admin_tell` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `name`, `tell`, `address`, `admin`, `admin_tell`, `date`) VALUES
(1, 'HQ', '625262262', 'Bakaro', 'Cali Jaamac', '666777', '2023-05-09'),
(2, '12345679', '200', 'laba boqol oo dolar', 'Test', 'hassan', '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `company_info`
--

CREATE TABLE `company_info` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `tell` varchar(200) NOT NULL,
  `address` varchar(100) NOT NULL,
  `logo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `company_info`
--

INSERT INTO `company_info` (`id`, `name`, `tell`, `address`, `logo`) VALUES
(1, 'Dhuba Somali Bank', '6142727/272882/278272/282762', 'Mogadisho.somalia Holwadag', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `tell` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `doc_no` int(11) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT NULL,
  `masul_name` varchar(100) DEFAULT NULL,
  `_masul_tell` varchar(100) DEFAULT NULL,
  `_masul_type` varchar(100) DEFAULT NULL,
  `masul2_name` varchar(100) DEFAULT NULL,
  `masul2_tell` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `name`, `tell`, `address`, `doc_no`, `doc_type`, `masul_name`, `_masul_tell`, `_masul_type`, `masul2_name`, `masul2_tell`, `image`, `user_id`) VALUES
(3, 'Geedi', '612334455', 'madina', 123, 'Passport', 'Jamac', '6666', 'walaal', 'geedi', '777777', '../uploads/Capture.PNG', 1),
(4, 'Jaamc', '612334455', 'madina', 123, 'Passport', 'Jamac', '6666', 'walaal', 'geedi', '777777', '../uploads/Capture.PNG', 1),
(5, 'Mohamed Hassan', '612334455', 'madina', 123, 'Passport', 'Jamac', '6666', 'walaal', 'geedi', '777777', '../uploads/Capture.PNG', 1);

-- --------------------------------------------------------

--
-- Table structure for table `customer_account`
--

CREATE TABLE `customer_account` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `account_no` int(11) DEFAULT NULL,
  `account_type_id` int(11) DEFAULT NULL,
  `segnature` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer_account`
--

INSERT INTO `customer_account` (`id`, `customer_id`, `account_no`, `account_type_id`, `segnature`, `date`, `status`, `exp_date`, `user_id`, `branch_id`) VALUES
(3, 3, 12345678, 1, '../uploads/logo.png', '2023-05-09', NULL, '2024-05-09', 1, 1),
(5, 5, 12345679, 2, '../uploads/n947rWL.png', '2023-05-14', NULL, '2024-05-14', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `deposit`
--

CREATE TABLE `deposit` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `account_no` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `inwords` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `deposit_py` varchar(100) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deposit`
--

INSERT INTO `deposit` (`id`, `customer_id`, `account_no`, `amount`, `inwords`, `description`, `date`, `deposit_py`, `user_id`) VALUES
(2, 3, 12345678, 200, 'test', 'test', '2023-05-14', 'hassan', 1),
(3, 3, 12345678, 900, 'test', 'Test', '2023-05-14', 'hassan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `max_withdraw`
--

CREATE TABLE `max_withdraw` (
  `id` int(11) NOT NULL,
  `max` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `max_withdraw`
--

INSERT INTO `max_withdraw` (`id`, `max`, `date`) VALUES
(1, 1000, '2023-05-14');

-- --------------------------------------------------------

--
-- Table structure for table `staf`
--

CREATE TABLE `staf` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `tell` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staf_daily`
--

CREATE TABLE `staf_daily` (
  `id` int(11) NOT NULL,
  `staf_id` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `staf_id` int(11) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `image`, `staf_id`, `status`) VALUES
(1, 'admin', '202cb962ac59075b964b07152d234b70', NULL, 1, '1');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw`
--

CREATE TABLE `withdraw` (
  `id` int(11) NOT NULL,
  `customer_id` varchar(100) DEFAULT NULL,
  `account_no` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `inwords` varchar(100) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `withdraw`
--

INSERT INTO `withdraw` (`id`, `customer_id`, `account_no`, `amount`, `inwords`, `description`, `date`, `user_id`) VALUES
(1, '3', 12345678, 190, 'Test', 'tet', '2023-05-14', 1),
(2, '3', 12345678, 800, 'ffwfwf', 'Test', '2023-05-14', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_type`
--
ALTER TABLE `account_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_info`
--
ALTER TABLE `company_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_account`
--
ALTER TABLE `customer_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `max_withdraw`
--
ALTER TABLE `max_withdraw`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staf`
--
ALTER TABLE `staf`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staf_daily`
--
ALTER TABLE `staf_daily`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw`
--
ALTER TABLE `withdraw`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_type`
--
ALTER TABLE `account_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `company_info`
--
ALTER TABLE `company_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `customer_account`
--
ALTER TABLE `customer_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `deposit`
--
ALTER TABLE `deposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `max_withdraw`
--
ALTER TABLE `max_withdraw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `staf`
--
ALTER TABLE `staf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staf_daily`
--
ALTER TABLE `staf_daily`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `withdraw`
--
ALTER TABLE `withdraw`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
