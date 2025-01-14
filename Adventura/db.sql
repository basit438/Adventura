USE [master]
GO
/****** Object:  Database [AdventureDatabase]    Script Date: 13-11-2023 18:58:48 ******/
CREATE DATABASE [AdventureDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AdventureDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AdventureDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AdventureDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\AdventureDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AdventureDatabase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AdventureDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AdventureDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AdventureDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AdventureDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AdventureDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AdventureDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [AdventureDatabase] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AdventureDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AdventureDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AdventureDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AdventureDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AdventureDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AdventureDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AdventureDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AdventureDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AdventureDatabase] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AdventureDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AdventureDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AdventureDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AdventureDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AdventureDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AdventureDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AdventureDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AdventureDatabase] SET RECOVERY FULL 
GO
ALTER DATABASE [AdventureDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [AdventureDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AdventureDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AdventureDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AdventureDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AdventureDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AdventureDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AdventureDatabase', N'ON'
GO
ALTER DATABASE [AdventureDatabase] SET QUERY_STORE = ON
GO
ALTER DATABASE [AdventureDatabase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AdventureDatabase]
GO
/****** Object:  Table [dbo].[Citemdetails]    Script Date: 13-11-2023 18:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Citemdetails](
	[Citemid] [bigint] IDENTITY(1,1) NOT NULL,
	[itemid] [bigint] NOT NULL,
	[Citemdescription] [varchar](50) NULL,
	[Citemcolor] [varchar](50) NULL,
	[Citemquantity] [varchar](50) NULL,
	[rent] [varchar](50) NULL,
	[per] [varchar](20) NULL,
	[Citemimage] [varchar](max) NULL,
 CONSTRAINT [PK_Citemdetails] PRIMARY KEY CLUSTERED 
(
	[Citemid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campingitems]    Script Date: 13-11-2023 18:58:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campingitems](
	[Citemid] [bigint] IDENTITY(1,1) NOT NULL,
	[renderid] [bigint] NOT NULL,
	[CitemName] [varchar](50) NULL,
	[CitemQuantity] [varchar](50) NULL,
	[CitemCapacity] [varchar](50) NULL,
	[status] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_camp]    Script Date: 13-11-2023 18:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_camp]
AS
SELECT dbo.Campingitems.CitemName, dbo.Campingitems.Citemid, dbo.Citemdetails.rent, dbo.Citemdetails.per, dbo.Campingitems.CitemQuantity, dbo.Campingitems.renderid, dbo.Campingitems.CitemCapacity, dbo.Citemdetails.Citemquantity AS Expr1, dbo.Citemdetails.Citemcolor, 
             dbo.Citemdetails.Citemimage
FROM   dbo.Campingitems INNER JOIN
             dbo.Citemdetails ON dbo.Campingitems.Citemid = dbo.Citemdetails.Citemid
GO
/****** Object:  Table [dbo].[AdventureItemDetail]    Script Date: 13-11-2023 18:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdventureItemDetail](
	[itemDetailID] [bigint] IDENTITY(1,1) NOT NULL,
	[AdventureItemID] [bigint] NULL,
	[itemRegistrationNO] [varchar](50) NULL,
	[Itemdescription] [varchar](max) NULL,
	[itemCapacity] [varchar](50) NULL,
	[itemcolor] [varchar](50) NULL,
	[itemQuantity] [varchar](50) NULL,
	[itemCategory] [varchar](20) NULL,
	[rent] [varchar](50) NULL,
	[per] [varchar](20) NULL,
	[itemimage] [varchar](max) NULL,
 CONSTRAINT [PK_AdventureItemDetial] PRIMARY KEY CLUSTERED 
(
	[itemDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Adventure_item_BookingDetail]    Script Date: 13-11-2023 18:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adventure_item_BookingDetail](
	[Adventurebookingid] [bigint] IDENTITY(1,1) NOT NULL,
	[itemid] [bigint] NULL,
	[renderid] [bigint] NULL,
	[customerid] [bigint] NULL,
	[qty] [int] NOT NULL,
	[date_of_booking] [date] NULL,
	[Date_Of_Pick] [date] NULL,
	[time_of_pic] [time](7) NULL,
	[Date_of_Return] [date] NULL,
	[status] [varchar](50) NULL,
 CONSTRAINT [PK_Adventure_item_BookingDetail] PRIMARY KEY CLUSTERED 
(
	[Adventurebookingid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Adventureitems]    Script Date: 13-11-2023 18:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adventureitems](
	[AdventureItemid] [bigint] IDENTITY(1,1) NOT NULL,
	[renderid] [bigint] NOT NULL,
	[AdventureItemName] [varchar](50) NULL,
	[AdventureItemType] [varchar](50) NULL,
	[Quantity] [bigint] NULL,
	[status] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AdventrueItemBookingDetailView]    Script Date: 13-11-2023 18:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AdventrueItemBookingDetailView]
AS
SELECT dbo.Adventureitems.AdventureItemid, dbo.Adventureitems.AdventureItemName, dbo.Adventureitems.AdventureItemType, dbo.AdventureItemDetail.itemRegistrationNO, dbo.AdventureItemDetail.Itemdescription, dbo.AdventureItemDetail.itemCapacity, 
             dbo.AdventureItemDetail.itemcolor, dbo.AdventureItemDetail.itemCategory, dbo.AdventureItemDetail.rent, dbo.AdventureItemDetail.per, dbo.AdventureItemDetail.itemimage, dbo.Adventure_item_BookingDetail.qty, dbo.Adventure_item_BookingDetail.date_of_booking, 
             dbo.Adventure_item_BookingDetail.Date_Of_Pick, dbo.Adventure_item_BookingDetail.time_of_pic, dbo.Adventure_item_BookingDetail.Date_of_Return, dbo.Adventure_item_BookingDetail.status, dbo.Adventure_item_BookingDetail.customerid, dbo.Adventureitems.renderid
FROM   dbo.Adventure_item_BookingDetail INNER JOIN
             dbo.Adventureitems ON dbo.Adventure_item_BookingDetail.itemid = dbo.Adventureitems.AdventureItemid INNER JOIN
             dbo.AdventureItemDetail ON dbo.Adventureitems.AdventureItemid = dbo.AdventureItemDetail.AdventureItemID
GO
/****** Object:  View [dbo].[CampingitemDetailView]    Script Date: 13-11-2023 18:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CampingitemDetailView]
AS
SELECT dbo.Campingitems.Citemid, dbo.Campingitems.renderid, dbo.Campingitems.CitemName, dbo.Campingitems.CitemQuantity, dbo.Campingitems.CitemCapacity, dbo.Campingitems.status, dbo.Citemdetails.Citemdescription, dbo.Citemdetails.Citemcolor, 
             dbo.Citemdetails.Citemquantity AS Expr2, dbo.Citemdetails.rent, dbo.Citemdetails.per, dbo.Citemdetails.Citemimage, dbo.Citemdetails.itemid
FROM   dbo.Campingitems INNER JOIN
             dbo.Citemdetails ON dbo.Campingitems.Citemid = dbo.Citemdetails.itemid
GO
/****** Object:  Table [dbo].[camping_item_BookingDetail]    Script Date: 13-11-2023 18:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[camping_item_BookingDetail](
	[campingbookingid] [bigint] IDENTITY(1,1) NOT NULL,
	[itemid] [bigint] NULL,
	[renderid] [bigint] NULL,
	[customerid] [bigint] NULL,
	[qty] [int] NOT NULL,
	[date_of_booking] [date] NULL,
	[Date_Of_Pick] [date] NULL,
	[time_of_pic] [time](7) NULL,
	[Date_of_Return] [date] NULL,
	[status] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[campingbookingid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CampingItemBookingDetailView]    Script Date: 13-11-2023 18:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CampingItemBookingDetailView]
AS
SELECT dbo.camping_item_BookingDetail.campingbookingid, dbo.camping_item_BookingDetail.itemid, dbo.camping_item_BookingDetail.renderid, dbo.camping_item_BookingDetail.customerid, dbo.camping_item_BookingDetail.qty, dbo.camping_item_BookingDetail.date_of_booking, 
             dbo.camping_item_BookingDetail.Date_Of_Pick, dbo.camping_item_BookingDetail.time_of_pic, dbo.camping_item_BookingDetail.Date_of_Return, dbo.camping_item_BookingDetail.status, dbo.Campingitems.CitemName, dbo.Campingitems.CitemQuantity, 
             dbo.Campingitems.CitemCapacity, dbo.Campingitems.status AS Expr1, dbo.Citemdetails.Citemdescription, dbo.Citemdetails.Citemcolor, dbo.Citemdetails.Citemquantity AS Expr2, dbo.Citemdetails.rent, dbo.Citemdetails.per, dbo.Citemdetails.Citemimage
FROM   dbo.camping_item_BookingDetail INNER JOIN
             dbo.Campingitems ON dbo.camping_item_BookingDetail.itemid = dbo.Campingitems.Citemid INNER JOIN
             dbo.Citemdetails ON dbo.Campingitems.Citemid = dbo.Citemdetails.Citemid
GO
/****** Object:  View [dbo].[AdventureItemDetailView]    Script Date: 13-11-2023 18:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AdventureItemDetailView]
AS
SELECT dbo.Adventureitems.*, dbo.AdventureItemDetail.itemDetailID, dbo.AdventureItemDetail.itemRegistrationNO, dbo.AdventureItemDetail.Itemdescription, dbo.AdventureItemDetail.itemCapacity, dbo.AdventureItemDetail.itemcolor, dbo.AdventureItemDetail.itemQuantity, 
             dbo.AdventureItemDetail.itemCategory, dbo.AdventureItemDetail.rent, dbo.AdventureItemDetail.per, dbo.AdventureItemDetail.itemimage
FROM   dbo.Adventureitems INNER JOIN
             dbo.AdventureItemDetail ON dbo.Adventureitems.AdventureItemid = dbo.AdventureItemDetail.AdventureItemID
GO
/****** Object:  Table [dbo].[AdventureitemPictures]    Script Date: 13-11-2023 18:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdventureitemPictures](
	[Pictureid] [bigint] IDENTITY(1,1) NOT NULL,
	[AdventureItemid] [bigint] NULL,
	[Adventureitempictures] [varchar](max) NULL,
 CONSTRAINT [PK_AdventureitemPictures] PRIMARY KEY CLUSTERED 
(
	[Pictureid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campingitempictures]    Script Date: 13-11-2023 18:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campingitempictures](
	[CampingitemPicid] [bigint] IDENTITY(1,1) NOT NULL,
	[Campingitemid] [bigint] NULL,
	[CampingitemPictures] [varchar](max) NULL,
 CONSTRAINT [PK_Campingitempictures] PRIMARY KEY CLUSTERED 
(
	[CampingitemPicid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customerdetail]    Script Date: 13-11-2023 18:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customerdetail](
	[Customerid] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](50) NULL,
	[CustomerEmail] [varchar](50) NULL,
	[CustomerAddress] [varchar](50) NULL,
	[CustomerContact] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Customerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DistrictTable]    Script Date: 13-11-2023 18:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DistrictTable](
	[Districtid] [bigint] IDENTITY(1,1) NOT NULL,
	[DistrictName] [varchar](50) NULL,
 CONSTRAINT [PK_DistrictTable] PRIMARY KEY CLUSTERED 
(
	[Districtid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginTable]    Script Date: 13-11-2023 18:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginTable](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[userid] [bigint] NULL,
	[loginid] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[usertype] [varchar](50) NULL,
 CONSTRAINT [PK_LoginTable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RenderCompany]    Script Date: 13-11-2023 18:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RenderCompany](
	[Companyid] [bigint] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Districtid] [bigint] NULL,
	[Tehsilid] [bigint] NULL,
	[CompanyContact] [varchar](50) NULL,
	[CompanyEmailid] [varchar](50) NULL,
	[RegistrationNO] [varchar](50) NOT NULL,
	[status] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Companyid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentitemdetails]    Script Date: 13-11-2023 18:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentitemdetails](
	[Rentid] [bigint] IDENTITY(1,1) NOT NULL,
	[Companyid] [bigint] NULL,
	[Itemid] [bigint] NULL,
	[Customerid] [bigint] NULL,
	[itemType] [varchar](50) NULL,
	[itemRentedon] [varchar](50) NULL,
	[itemrentedupto] [varchar](50) NULL,
	[AmountTobepaid] [varchar](50) NULL,
	[AdvanceamountPaid] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Rentid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tehsiltable]    Script Date: 13-11-2023 18:58:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tehsiltable](
	[Tehsilid] [bigint] IDENTITY(1,1) NOT NULL,
	[Districtid] [bigint] NULL,
	[TehsilName] [varchar](50) NULL,
 CONSTRAINT [PK_Tehsiltable] PRIMARY KEY CLUSTERED 
(
	[Tehsilid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[76] 4[2] 2[4] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Adventure_item_BookingDetail"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 400
               Right = 345
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Adventureitems"
            Begin Extent = 
               Top = 9
               Left = 382
               Bottom = 316
               Right = 651
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AdventureItemDetail"
            Begin Extent = 
               Top = 31
               Left = 778
               Bottom = 440
               Right = 1084
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AdventrueItemBookingDetailView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AdventrueItemBookingDetailView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Adventureitems"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 275
               Right = 352
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AdventureItemDetail"
            Begin Extent = 
               Top = 9
               Left = 383
               Bottom = 275
               Right = 676
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AdventureItemDetailView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AdventureItemDetailView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Citemdetails"
            Begin Extent = 
               Top = 9
               Left = 648
               Bottom = 206
               Right = 886
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Campingitems"
            Begin Extent = 
               Top = 9
               Left = 369
               Bottom = 271
               Right = 611
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "camping_item_BookingDetail"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 271
               Right = 312
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CampingItemBookingDetailView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CampingItemBookingDetailView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Campingitems"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Citemdetails"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 206
               Right = 574
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CampingitemDetailView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CampingitemDetailView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Campingitems"
            Begin Extent = 
               Top = 9
               Left = 57
               Bottom = 206
               Right = 279
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Citemdetails"
            Begin Extent = 
               Top = 9
               Left = 336
               Bottom = 206
               Right = 574
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_camp'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_camp'
GO
USE [master]
GO
ALTER DATABASE [AdventureDatabase] SET  READ_WRITE 
GO
