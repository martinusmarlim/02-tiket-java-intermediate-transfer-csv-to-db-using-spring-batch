SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";



--
-- Database: `tiket`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `CustomerID` int(50) NOT NULL,
  `companyName` varchar(50) DEFAULT NULL,
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `BillingAddress` varchar(255) NOT NULL,
  `City` varchar(50) NOT NULL,
  `StateOrProvince` varchar(20) NOT NULL,
  `ZipCode` varchar(20) NOT NULL,
  `Email` varchar(75) NOT NULL,
  `CompanyWebsite` varchar(200) NOT NULL,
  `PhoneNumber` varchar(30) NOT NULL,
  `FaxNumber` varchar(30) NOT NULL,
  `ShipAddress` varchar(255) NOT NULL,
  `ShipCity` varchar(50) NOT NULL,
  `ShipStateOrProvince` varchar(50) NOT NULL,
  `ShipZipCode` varchar(20) NOT NULL,
  `ShipPhoneNumber` varchar(30) NOT NULL,
  UNIQUE KEY `CustomerID` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `EmployeeID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `WorkPhone` varchar(30) NOT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `OrderID` int(11) NOT NULL,
  `CustomerID` int(11) NOT NULL,
  `EmployeeID` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `PurchaseOrderNumber` varchar(30) NOT NULL,
  `ShipDate` date DEFAULT NULL,
  `ShippingMethodID` int(11) NOT NULL,
  `FreightCharge` int(11) DEFAULT NULL,
  `Taxes` int(11) NOT NULL,
  `PaymentReceived` varchar(1) NOT NULL,
  `Comment` varchar(150) NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `orderFK2` (`ShippingMethodID`),
  KEY `orderFK3` (`EmployeeID`),
  KEY `orderFK1` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `OrderDetailID` int(11) NOT NULL,
  `OrderID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `UnitPrice` int(11) NOT NULL,
  `Discount` int(11) NOT NULL,
  PRIMARY KEY (`OrderDetailID`),
  KEY `orderDetailsFK2` (`OrderID`),
  KEY `orderDetailsFK1` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `ProductID` int(11) NOT NULL,
  `ProductName` varchar(50) NOT NULL,
  `UnitPrice` int(11) NOT NULL,
  `InStock` char(1) NOT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `shipping_methods`
--

DROP TABLE IF EXISTS `shipping_methods`;
CREATE TABLE IF NOT EXISTS `shipping_methods` (
  `ShippingMethodID` int(11) NOT NULL,
  `ShippingMethod` varchar(20) NOT NULL,
  PRIMARY KEY (`ShippingMethodID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- constraints untuk tabel pelimpahan (Dumped Tables)
--

--
-- constraints untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orderFK1` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderFK2` FOREIGN KEY (`ShippingMethodID`) REFERENCES `shipping_methods` (`ShippingMethodID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orderFK3` FOREIGN KEY (`EmployeeID`) REFERENCES `employees` (`EmployeeID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- constraints untuk tabel `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `orderDetailsFK1` FOREIGN KEY (`ProductID`) REFERENCES `products` (`ProductID`),
  ADD CONSTRAINT `orderDetailsFK2` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

