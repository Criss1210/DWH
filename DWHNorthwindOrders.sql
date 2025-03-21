USE [master]
GO
/****** Object:  Database [DWHNorthwindOrders]    Script Date: 14/03/2025 1:02:04 PM ******/
CREATE DATABASE [DWHNorthwindOrders]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DWHNorthwindOrders', FILENAME = N'E:\electiva 1\DATO\DWHNorthwindOrders.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ), 
 FILEGROUP [CURRENT] 
( NAME = N'DWHNorthwindOrders_CUR', FILENAME = N'E:\electiva 1\CURRENT\DWHNorthwindOrders_CUR.ndf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ), 
 FILEGROUP [HISTORY] 
( NAME = N'DWHNorthwindOrders_HISTORY', FILENAME = N'E:\electiva 1\HISTORY\DWHNorthwindOrders_HISTORY.ndf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DWHNorthwindOrders_log', FILENAME = N'E:\electiva 1\DATO\DWHNorthwindOrders_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DWHNorthwindOrders] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DWHNorthwindOrders].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DWHNorthwindOrders] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DWHNorthwindOrders] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DWHNorthwindOrders] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DWHNorthwindOrders] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DWHNorthwindOrders] SET ARITHABORT OFF 
GO
ALTER DATABASE [DWHNorthwindOrders] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DWHNorthwindOrders] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DWHNorthwindOrders] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DWHNorthwindOrders] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DWHNorthwindOrders] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DWHNorthwindOrders] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DWHNorthwindOrders] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DWHNorthwindOrders] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DWHNorthwindOrders] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DWHNorthwindOrders] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DWHNorthwindOrders] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DWHNorthwindOrders] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DWHNorthwindOrders] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DWHNorthwindOrders] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DWHNorthwindOrders] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DWHNorthwindOrders] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DWHNorthwindOrders] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DWHNorthwindOrders] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DWHNorthwindOrders] SET  MULTI_USER 
GO
ALTER DATABASE [DWHNorthwindOrders] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DWHNorthwindOrders] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DWHNorthwindOrders] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DWHNorthwindOrders] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DWHNorthwindOrders] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DWHNorthwindOrders] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DWHNorthwindOrders] SET QUERY_STORE = ON
GO
ALTER DATABASE [DWHNorthwindOrders] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DWHNorthwindOrders]
GO
/****** Object:  Table [dbo].[DimCategory]    Script Date: 14/03/2025 1:02:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCategory](
	[CategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCustomers]    Script Date: 14/03/2025 1:02:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomers](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nchar](5) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[Country] [nvarchar](15) NULL,
	[City] [nvarchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__DimCusto__A4AE64B9A6F59804] UNIQUE NONCLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimEmployees]    Script Date: 14/03/2025 1:02:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEmployees](
	[EmployeeKey] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Title] [nvarchar](30) NULL,
	[HireDate] [datetime] NULL,
	[BirthDate] [datetime] NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EmployeeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_EmployeeID] UNIQUE NONCLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProducts]    Script Date: 14/03/2025 1:02:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProducts](
	[ProductKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Category] [int] NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[ProductName] [nvarchar](40) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ__DimProdu__B40CC6EC0FBC4DAD] UNIQUE NONCLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimShippers]    Script Date: 14/03/2025 1:02:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimShippers](
	[ShipperKey] [int] IDENTITY(1,1) NOT NULL,
	[ShipperID] [int] NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[Phone] [nvarchar](24) NULL,
PRIMARY KEY CLUSTERED 
(
	[ShipperKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_ShipperID] UNIQUE NONCLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSales]    Script Date: 14/03/2025 1:02:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSales](
	[SalesKey] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[CustomerKey] [int] NULL,
	[EmployeeKey] [int] NULL,
	[ProductKey] [int] NULL,
	[ShipperKey] [int] NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [money] NULL,
	[Discount] [decimal](5, 2) NULL,
	[TotalSales] [decimal](10, 2) NULL,
	[CategoryKey] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([CustomerKey])
REFERENCES [dbo].[DimCustomers] ([CustomerKey])
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([EmployeeKey])
REFERENCES [dbo].[DimEmployees] ([EmployeeKey])
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([ProductKey])
REFERENCES [dbo].[DimProducts] ([ProductKey])
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD FOREIGN KEY([ShipperKey])
REFERENCES [dbo].[DimShippers] ([ShipperKey])
GO
ALTER TABLE [dbo].[FactSales]  WITH CHECK ADD  CONSTRAINT [FK_FactSales_DimCategory] FOREIGN KEY([CategoryKey])
REFERENCES [dbo].[DimCategory] ([CategoryKey])
GO
ALTER TABLE [dbo].[FactSales] CHECK CONSTRAINT [FK_FactSales_DimCategory]
GO
/****** Object:  StoredProcedure [dbo].[sp_Load_DimCategory]    Script Date: 14/03/2025 1:02:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Load_DimCategory]
@CategoryID int,
@CategoryName nvarchar(15) 

 
AS
 
BEGIN
 
    INSERT INTO dbo.DimCategory (CategoryID, CategoryName)
    values (@CategoryID, @CategoryName)
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Load_DimCustomers]    Script Date: 14/03/2025 1:02:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Load_DimCustomers]
@CustomerID nchar(5),
@CompanyName nvarchar(40), 
@Country nvarchar (15),
@City nvarchar(15) 

 
AS
 
BEGIN
 
    INSERT INTO dbo.DimCustomers(CustomerID, CompanyName, Country, City)
    values (@CustomerID, @CompanyName, @Country, @City)
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Load_DimEmployees]    Script Date: 14/03/2025 1:02:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Load_DimEmployees]
@EmployeeID int,
@Title nvarchar(30),
@HireDate datetime,
@BirthDate datetime,
@LastName nvarchar(20),
@FirstName nvarchar(10)
 
AS
 
BEGIN
 
    INSERT INTO dbo.DimEmployees(EmployeeID, Title, HireDate, BirthDate, LastName, FirstName)
    values (@EmployeeID, @Title, @HireDate, @BirthDate, @LastName, @FirstName)
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Load_DimProducts]    Script Date: 14/03/2025 1:02:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Load_DimProducts]
@ProductID int,
@Category int,
@UnitPrice money,
@UnitsInStock smallint,
@ProductName nvarchar(40)
 
AS
 
BEGIN
 
    INSERT INTO dbo.DimProducts(ProductID, Category, UnitPrice, UnitsInStock, ProductName)
    values (@ProductID, @Category, @UnitPrice, @UnitsInStock, @ProductName)
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_Load_DimShippers]    Script Date: 14/03/2025 1:02:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Load_DimShippers]
@ShipperID int,
@CompanyName nvarchar(40),
@Phone nvarchar(40)
 
AS
 
BEGIN
 
    INSERT INTO dbo.DimShippers(ShipperID, CompanyName, Phone)
    values (@ShipperID, @CompanyName, @Phone)
END;
GO
/****** Object:  StoredProcedure [dbo].[usp_LoadDimCategory]    Script Date: 14/03/2025 1:02:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_LoadDimCategory]
AS
BEGIN
    INSERT INTO DimCategory (CategoryID, CategoryName)
    SELECT CategoryID, CategoryName
    FROM dbo.Categories;
END
GO
/****** Object:  StoredProcedure [dbo].[usp_LoadDimCustomers]    Script Date: 14/03/2025 1:02:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_LoadDimCustomers]
AS
BEGIN
    INSERT INTO DimCustomers (CustomerID, CompanyName, Country, City)
    SELECT c.CustomerID, c.CompanyName, c.Country, c.City
    FROM dbo.Customers c;
END
GO
USE [master]
GO
ALTER DATABASE [DWHNorthwindOrders] SET  READ_WRITE 
GO
