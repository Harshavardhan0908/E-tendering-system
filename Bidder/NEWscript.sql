USE [master]
GO
/****** Object:  Database [E_tendering]    Script Date: 13-04-2024 13:06:31 ******/
CREATE DATABASE [E_tendering]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'E_tendering', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\E_tendering.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'E_tendering_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\E_tendering_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [E_tendering] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [E_tendering].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [E_tendering] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [E_tendering] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [E_tendering] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [E_tendering] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [E_tendering] SET ARITHABORT OFF 
GO
ALTER DATABASE [E_tendering] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [E_tendering] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [E_tendering] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [E_tendering] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [E_tendering] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [E_tendering] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [E_tendering] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [E_tendering] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [E_tendering] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [E_tendering] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [E_tendering] SET  DISABLE_BROKER 
GO
ALTER DATABASE [E_tendering] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [E_tendering] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [E_tendering] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [E_tendering] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [E_tendering] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [E_tendering] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [E_tendering] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [E_tendering] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [E_tendering] SET  MULTI_USER 
GO
ALTER DATABASE [E_tendering] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [E_tendering] SET DB_CHAINING OFF 
GO
ALTER DATABASE [E_tendering] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [E_tendering] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [E_tendering]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 13-04-2024 13:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Admin_name] [nvarchar](20) NULL,
	[Admin_pass] [nvarchar](20) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bidder_master]    Script Date: 13-04-2024 13:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bidder_master](
	[BID] [int] IDENTITY(1,1) NOT NULL,
	[BName] [nvarchar](50) NULL,
	[BEmail] [nvarchar](50) NULL,
	[Bphone] [nvarchar](50) NULL,
	[Bpassword] [nvarchar](50) NULL,
	[BAddress] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Bidder_request]    Script Date: 13-04-2024 13:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bidder_request](
	[RID] [int] IDENTITY(1,1) NOT NULL,
	[Bid] [int] NULL,
	[TID] [int] NULL,
	[Amount] [nvarchar](50) NULL,
	[RDate] [datetime] NULL,
	[Statuss] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Log_master]    Script Date: 13-04-2024 13:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log_master](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Tender_id] [int] NULL,
	[T_Hash] [nvarchar](max) NULL,
	[T_Type] [nvarchar](50) NULL,
	[T_date] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Request_status]    Script Date: 13-04-2024 13:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request_status](
	[RequestID] [nvarchar](50) NULL,
	[RequestName] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tender_master]    Script Date: 13-04-2024 13:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tender_master](
	[TID] [int] IDENTITY(1,1) NOT NULL,
	[RID] [int] NULL,
	[TotID] [int] NULL,
	[Refno] [nvarchar](50) NULL,
	[Lenghtt] [nvarchar](50) NULL,
	[Weidth] [nvarchar](50) NULL,
	[lane] [nvarchar](50) NULL,
	[Tvalue] [nvarchar](50) NULL,
	[TLocation] [nvarchar](50) NULL,
	[Document] [nvarchar](max) NULL,
	[tender_name] [nvarchar](50) NULL,
	[Tclosingdate] [datetime] NULL,
	[TImage] [nvarchar](max) NULL,
	[Discription] [nvarchar](max) NULL,
	[status] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Type_of_road]    Script Date: 13-04-2024 13:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_of_road](
	[RID] [int] IDENTITY(1,1) NOT NULL,
	[Road_type] [nvarchar](20) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Type_of_Tender]    Script Date: 13-04-2024 13:06:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_of_Tender](
	[TotID] [int] IDENTITY(1,1) NOT NULL,
	[tender_type] [nvarchar](20) NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([ID], [Admin_name], [Admin_pass]) VALUES (1, N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Bidder_master] ON 

INSERT [dbo].[Bidder_master] ([BID], [BName], [BEmail], [Bphone], [Bpassword], [BAddress]) VALUES (1, N'ashish', N'ashish@gmail.com', N'9*95623656', N'123456', N'test')
SET IDENTITY_INSERT [dbo].[Bidder_master] OFF
SET IDENTITY_INSERT [dbo].[Bidder_request] ON 

INSERT [dbo].[Bidder_request] ([RID], [Bid], [TID], [Amount], [RDate], [Statuss]) VALUES (1, 1, 1, N'6300', CAST(0x0000AFF1013AB7BC AS DateTime), N'2')
INSERT [dbo].[Bidder_request] ([RID], [Bid], [TID], [Amount], [RDate], [Statuss]) VALUES (2, 1, 2, N'6000', CAST(0x0000B10B010A0F39 AS DateTime), N'1')
SET IDENTITY_INSERT [dbo].[Bidder_request] OFF
SET IDENTITY_INSERT [dbo].[Log_master] ON 

INSERT [dbo].[Log_master] ([id], [Tender_id], [T_Hash], [T_Type], [T_date]) VALUES (1, 0, N'd8jD1GUK6F6uNn0IqLJhst1qD4vbYCzhJi/clzukKa8=', N'Registration', CAST(0x4C450B00 AS Date))
INSERT [dbo].[Log_master] ([id], [Tender_id], [T_Hash], [T_Type], [T_date]) VALUES (2, 1, N'f2ZiH+inodCjX9JVAGZlS2H27aZG31fvNTeNF8vJSrs=', N'Requested', CAST(0x4C450B00 AS Date))
INSERT [dbo].[Log_master] ([id], [Tender_id], [T_Hash], [T_Type], [T_date]) VALUES (3, 3, N'5W8O9RnM2ZwBrnIDxloVjwmqZNtiSDNKRRxw+zwWHAo=', N'completed', CAST(0x4C450B00 AS Date))
INSERT [dbo].[Log_master] ([id], [Tender_id], [T_Hash], [T_Type], [T_date]) VALUES (1002, 2, N'gmUQnopwG7KS7uWAv7lz0xZvU29f1ZjWY6KhY+b+B8g=', N'Registration', CAST(0x66460B00 AS Date))
INSERT [dbo].[Log_master] ([id], [Tender_id], [T_Hash], [T_Type], [T_date]) VALUES (1003, 2, N'rhFis0ayO+9SbhlplgRpsi4i2x70fw9lz3AMBqIBws8=', N'Requested', CAST(0x66460B00 AS Date))
SET IDENTITY_INSERT [dbo].[Log_master] OFF
INSERT [dbo].[Request_status] ([RequestID], [RequestName]) VALUES (N'1', N'Pending')
INSERT [dbo].[Request_status] ([RequestID], [RequestName]) VALUES (N'2', N'Accepted')
INSERT [dbo].[Request_status] ([RequestID], [RequestName]) VALUES (N'3', N'Rejected')
SET IDENTITY_INSERT [dbo].[Tender_master] ON 

INSERT [dbo].[Tender_master] ([TID], [RID], [TotID], [Refno], [Lenghtt], [Weidth], [lane], [Tvalue], [TLocation], [Document], [tender_name], [Tclosingdate], [TImage], [Discription], [status]) VALUES (1, 2, 1, N'665', N'123', N'663', N'1', N'5000', N'mumbai', N'Tulips.jpg', N'test1', CAST(0x0000B0F400000000 AS DateTime), N'Lighthouse.jpg', N'testing terender', 1)
INSERT [dbo].[Tender_master] ([TID], [RID], [TotID], [Refno], [Lenghtt], [Weidth], [lane], [Tvalue], [TLocation], [Document], [tender_name], [Tclosingdate], [TImage], [Discription], [status]) VALUES (2, 3, 1, N'3356', N'659', N'88', N'2', N'8000', N'borivali', N'CrystalReport3.pdf', N'road', CAST(0x0000B11800000000 AS DateTime), N'Jellyfish.jpg', N'adad', 0)
SET IDENTITY_INSERT [dbo].[Tender_master] OFF
SET IDENTITY_INSERT [dbo].[Type_of_road] ON 

INSERT [dbo].[Type_of_road] ([RID], [Road_type]) VALUES (1, N'EARTHAN ROAD')
INSERT [dbo].[Type_of_road] ([RID], [Road_type]) VALUES (2, N'GRAVEL ROAD')
INSERT [dbo].[Type_of_road] ([RID], [Road_type]) VALUES (3, N'CONCRETE ROAD')
INSERT [dbo].[Type_of_road] ([RID], [Road_type]) VALUES (4, N'BITUMENOUS ROAD')
SET IDENTITY_INSERT [dbo].[Type_of_road] OFF
SET IDENTITY_INSERT [dbo].[Type_of_Tender] ON 

INSERT [dbo].[Type_of_Tender] ([TotID], [tender_type]) VALUES (1, N'CONSTRUCTION TENDER')
INSERT [dbo].[Type_of_Tender] ([TotID], [tender_type]) VALUES (2, N'ELECTRICAL TENDER')
INSERT [dbo].[Type_of_Tender] ([TotID], [tender_type]) VALUES (3, N'NHAI TENDER')
SET IDENTITY_INSERT [dbo].[Type_of_Tender] OFF
USE [master]
GO
ALTER DATABASE [E_tendering] SET  READ_WRITE 
GO
