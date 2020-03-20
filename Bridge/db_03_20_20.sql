USE [master]
GO
/****** Object:  Database [Bridge]    Script Date: 3/20/2020 9:11:18 PM ******/
CREATE DATABASE [Bridge]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bridge', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.KUDOSQL\MSSQL\DATA\Bridge.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bridge_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.KUDOSQL\MSSQL\DATA\Bridge_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Bridge] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bridge].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bridge] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bridge] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bridge] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bridge] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bridge] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bridge] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bridge] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bridge] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bridge] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bridge] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bridge] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bridge] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bridge] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bridge] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bridge] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Bridge] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bridge] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bridge] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bridge] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bridge] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bridge] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Bridge] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bridge] SET RECOVERY FULL 
GO
ALTER DATABASE [Bridge] SET  MULTI_USER 
GO
ALTER DATABASE [Bridge] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bridge] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bridge] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bridge] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bridge] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Bridge', N'ON'
GO
ALTER DATABASE [Bridge] SET QUERY_STORE = OFF
GO
USE [Bridge]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/20/2020 9:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 3/20/2020 9:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 3/20/2020 9:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 3/20/2020 9:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 3/20/2020 9:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 3/20/2020 9:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 3/20/2020 9:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[CompanyAddress] [nvarchar](max) NULL,
	[HomeAddress] [nvarchar](max) NULL,
	[DeviceId] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 3/20/2020 9:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/20/2020 9:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Logo] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CollectionProducts]    Script Date: 3/20/2020 9:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CollectionProducts](
	[ProductId] [bigint] NOT NULL,
	[CollectionId] [bigint] NOT NULL,
 CONSTRAINT [PK_CollectionProducts] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[CollectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Collections]    Script Date: 3/20/2020 9:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collections](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[Banner] [nvarchar](max) NULL,
 CONSTRAINT [PK_Collections] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 3/20/2020 9:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[B] [int] NOT NULL,
	[G] [int] NOT NULL,
	[O] [int] NOT NULL,
	[R] [int] NOT NULL,
 CONSTRAINT [PK_Colors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryStatuses]    Script Date: 3/20/2020 9:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryStatuses](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_DeliveryStatuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genders]    Script Date: 3/20/2020 9:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Genders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 3/20/2020 9:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[Size] [nvarchar](max) NULL,
	[Color] [nvarchar](max) NULL,
	[Quantity] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[Star] [real] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/20/2020 9:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[BuyerId] [nvarchar](450) NULL,
	[TotalAmount] [float] NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[CurrentStatus] [int] NOT NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[Receiver] [nvarchar](max) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatuses]    Script Date: 3/20/2020 9:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatuses](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderId] [bigint] NOT NULL,
	[StatusId] [bigint] NOT NULL,
	[DateCreate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_OrderStatuses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductColors]    Script Date: 3/20/2020 9:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductColors](
	[ProductId] [bigint] NOT NULL,
	[ColorId] [bigint] NOT NULL,
 CONSTRAINT [PK_ProductColors] PRIMARY KEY CLUSTERED 
(
	[ColorId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 3/20/2020 9:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FilePath] [nvarchar](max) NULL,
	[IsHighLight] [bit] NOT NULL,
	[Order] [int] NOT NULL,
	[ProductId] [bigint] NOT NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/20/2020 9:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[OldPrice] [float] NOT NULL,
	[CategoryId] [bigint] NOT NULL,
	[CurrentPrice] [float] NOT NULL,
	[DateSale] [datetime2](7) NOT NULL,
	[IsSale] [bit] NOT NULL,
	[GenderId] [bigint] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sizes]    Script Date: 3/20/2020 9:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Standard] [nvarchar](max) NULL,
	[GenderId] [bigint] NOT NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAddresses]    Script Date: 3/20/2020 9:11:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAddresses](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[IsHome] [bit] NOT NULL,
	[UserId] [nvarchar](450) NULL,
 CONSTRAINT [PK_UserAddresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200221065606_init', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200221072240_add-cate-table', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200221072455_add-cate-table-id', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200222092819_add-product-table', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200222095103_add-productimages-table', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200223030649_gender-size-table', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200223031058_gender-size-table-modify', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200223054400_produc-color-table', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200223055848_color-code-swift', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200223134541_collection-product-table', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200224080322_product-status-col', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200225143338_address-user-col', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200225145303_order-ref', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200225145541_order-ref-edit', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200225150756_order-ref-edit-name', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200225151830_order-ref-edit-mpte', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200301031329_order-current-status', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200307030231_rating-data-col', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200307032455_rating-data-col-remove', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200307082444_address-table', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200307082743_address-table-s', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200307083926_address-col-ư', N'2.2.6-servicing-10079')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200314022330_devicetoken_', N'2.2.6-servicing-10079')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [CompanyAddress], [HomeAddress], [DeviceId]) VALUES (N'00ac28e7-509f-4c8a-b936-5d69738da861', N'admin', N'ADMIN', N'admin@dongtv.com', N'ADMIN@DONGTV.COM', 0, N'AQAAAAEAACcQAAAAEDR95C7C4Aq0Hp1r8rF/9REXmS0aP7vUJK+0+j4yswjnmrVsdyoDeKdRn1NjTApsug==', N'PIGVLO4B7NLTX46Y6HYKSHYTDQGTQGC7', N'1c5c41d9-86c2-4382-b522-4d016eafe9f6', N'0942502660', 0, 0, NULL, 1, 0, N'Admin', NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [CompanyAddress], [HomeAddress], [DeviceId]) VALUES (N'3a947cf1-3a69-4c50-bd58-9d8ecadbd48f', N'xhunter1412@gmail.com', N'XHUNTER1412@GMAIL.COM', N'xhunter1412@gmail.com', N'XHUNTER1412@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEHfFokGfggQRCaRaOMsUTBpdDTjoYmFADWGOISC6qHaHj4+9hW0HO/JhOLxC6WLyHw==', N'AC4DCEJY4GAI2IAOFS7KY3WYYLTRRN4C', N'0e3afda5-4d17-40e1-8215-64711dde09d5', NULL, 0, 0, NULL, 1, 0, N'Hunter Trần', NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [CompanyAddress], [HomeAddress], [DeviceId]) VALUES (N'3d135837-d71b-4428-bccd-9d91747f6126', N'testmailbusiness1412@gmail.com', N'TESTMAILBUSINESS1412@GMAIL.COM', N'testmailbusiness1412@gmail.com', N'TESTMAILBUSINESS1412@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAELxC0dmlsHyO4h0udLltMaxTP1MXdNU3fJR/RIdSROV30P22Ftz0VHs+ioJcBBLnDQ==', N'NEFWZHSHA65PCB5QBEYY6FJRTCU4H4CD', N'6e9962ad-eb4e-4050-b6e2-a13540753f24', NULL, 0, 0, NULL, 1, 0, N'Tran Dong', NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [CompanyAddress], [HomeAddress], [DeviceId]) VALUES (N'6bce7933-5d5a-4530-9223-4637bc17c5ca', N'dongtv', N'DONGTV', N'dongtv@fpt.edu.vn', N'DONGTV@FPT.EDU.VN', 0, N'AQAAAAEAACcQAAAAELWGdOvWSN2tjro5tCfUT7I1squ1heEQK2XIQ6fSlKlGtkrQNBg5z1t3dAHVOn5NJA==', N'HR3FAEBSDNKND7FHLU3KBJQPVJ6SHCNM', N'fefcf0d4-1920-41c4-a1b9-ff2d2871d5c3', NULL, 0, 0, NULL, 1, 0, N'Trần Viết Đông', N'FPT University', N'Tay Hoa str. Phuoc Long A dist. Ho Chi Minh', N'fYwVYKeHXr8:APA91bHNt8VpQBMDiUv3xtPR2mzET_dx8a-lfAzGCEEBdq6Hwa9r8CaQMfiWI2l_RPzcalK7HXP8CDbZvl4vw2Qlp1Fb-WPgZ0vUViUcL8YXWhvcxqbJLpDgrBnepBGIQKGDHbGBJe6B')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FullName], [CompanyAddress], [HomeAddress], [DeviceId]) VALUES (N'b0161337-db35-4c60-9533-be0dee304f3b', N'dongtvse05344@fpt.edu.vn', N'DONGTVSE05344@FPT.EDU.VN', N'dongtvse05344@fpt.edu.vn', N'DONGTVSE05344@FPT.EDU.VN', 0, N'AQAAAAEAACcQAAAAECODX6+9S8VIuFo3wD1MC9U0JDGdsgNQoyx/HU2/rapxeGi1xLiODqjKjk5BTVQBoQ==', N'TYKLTUNWJQ33RAO2FDHYWED3URBPOK7K', N'8d19a777-b5bc-4b1c-ab57-d0646d4aa681', NULL, 0, 0, NULL, 1, 0, N'K12 Trần Viết Đông', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [Logo]) VALUES (1, N'Jackets', N'files/images/categories/jacket.jpg')
INSERT [dbo].[Categories] ([Id], [Name], [Logo]) VALUES (2, N'Dresses', N'files/images/categories/dress.jpg')
INSERT [dbo].[Categories] ([Id], [Name], [Logo]) VALUES (3, N'Jeans', N'files/images/categories/jean.png')
INSERT [dbo].[Categories] ([Id], [Name], [Logo]) VALUES (4, N'T-shirts', N'files/images/categories/t-shirt.png')
INSERT [dbo].[Categories] ([Id], [Name], [Logo]) VALUES (5, N'Shirts', N'files/images/categories/shirt.jpg')
SET IDENTITY_INSERT [dbo].[Categories] OFF
INSERT [dbo].[CollectionProducts] ([ProductId], [CollectionId]) VALUES (2, 2)
INSERT [dbo].[CollectionProducts] ([ProductId], [CollectionId]) VALUES (3, 2)
INSERT [dbo].[CollectionProducts] ([ProductId], [CollectionId]) VALUES (4, 2)
INSERT [dbo].[CollectionProducts] ([ProductId], [CollectionId]) VALUES (2, 4)
INSERT [dbo].[CollectionProducts] ([ProductId], [CollectionId]) VALUES (4, 4)
INSERT [dbo].[CollectionProducts] ([ProductId], [CollectionId]) VALUES (6, 4)
INSERT [dbo].[CollectionProducts] ([ProductId], [CollectionId]) VALUES (8, 4)
SET IDENTITY_INSERT [dbo].[Collections] ON 

INSERT [dbo].[Collections] ([Id], [Name], [StartDate], [EndDate], [Banner]) VALUES (1, N'Memorial Day 2020', CAST(N'2020-04-23T00:00:00.0000000' AS DateTime2), CAST(N'2020-05-30T00:00:00.0000000' AS DateTime2), N'files/images/collections/1.png')
INSERT [dbo].[Collections] ([Id], [Name], [StartDate], [EndDate], [Banner]) VALUES (2, N'Woman Day', CAST(N'2020-02-23T00:00:00.0000000' AS DateTime2), CAST(N'2020-04-08T00:00:00.0000000' AS DateTime2), N'files/images/collections/2.jpg')
INSERT [dbo].[Collections] ([Id], [Name], [StartDate], [EndDate], [Banner]) VALUES (3, N'test collection', CAST(N'2020-03-16T16:30:28.0760000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'files/images/products/11412018511732020124808~Conan.png')
INSERT [dbo].[Collections] ([Id], [Name], [StartDate], [EndDate], [Banner]) VALUES (4, N'test collection lan 2', CAST(N'2020-03-20T09:19:58.7660000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'files/images/collections/204051730203202043558~Conan.png')
SET IDENTITY_INSERT [dbo].[Collections] OFF
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([Id], [Name], [B], [G], [O], [R]) VALUES (1, N'Red', 33, 22, 1, 163)
INSERT [dbo].[Colors] ([Id], [Name], [B], [G], [O], [R]) VALUES (2, N'Blue', 209, 184, 1, 149)
INSERT [dbo].[Colors] ([Id], [Name], [B], [G], [O], [R]) VALUES (3, N'Green', 126, 137, 1, 33)
INSERT [dbo].[Colors] ([Id], [Name], [B], [G], [O], [R]) VALUES (4, N'Pink', 255, 217, 1, 228)
INSERT [dbo].[Colors] ([Id], [Name], [B], [G], [O], [R]) VALUES (5, N'Grey', 63, 73, 1, 60)
INSERT [dbo].[Colors] ([Id], [Name], [B], [G], [O], [R]) VALUES (6, N'Beige', 204, 214, 1, 224)
INSERT [dbo].[Colors] ([Id], [Name], [B], [G], [O], [R]) VALUES (7, N'Dark Orange', 70, 78, 1, 233)
INSERT [dbo].[Colors] ([Id], [Name], [B], [G], [O], [R]) VALUES (8, N'Aquamarine', 219, 221, 1, 139)
INSERT [dbo].[Colors] ([Id], [Name], [B], [G], [O], [R]) VALUES (9, N'Teal', 104, 90, 1, 32)
INSERT [dbo].[Colors] ([Id], [Name], [B], [G], [O], [R]) VALUES (10, N'White Lemon', 211, 235, 1, 237)
INSERT [dbo].[Colors] ([Id], [Name], [B], [G], [O], [R]) VALUES (11, N'Dark Yellow', 86, 193, 1, 243)
INSERT [dbo].[Colors] ([Id], [Name], [B], [G], [O], [R]) VALUES (12, N'Light Brown', 136, 161, 1, 177)
INSERT [dbo].[Colors] ([Id], [Name], [B], [G], [O], [R]) VALUES (13, N'Dark Blue', 69, 41, 1, 32)
INSERT [dbo].[Colors] ([Id], [Name], [B], [G], [O], [R]) VALUES (14, N'Dark Green', 84, 95, 1, 93)
INSERT [dbo].[Colors] ([Id], [Name], [B], [G], [O], [R]) VALUES (15, N'White', 245, 244, 1, 244)
SET IDENTITY_INSERT [dbo].[Colors] OFF
SET IDENTITY_INSERT [dbo].[DeliveryStatuses] ON 

INSERT [dbo].[DeliveryStatuses] ([Id], [Name], [Priority]) VALUES (1, N'Bridge Shop has received the order', 0)
INSERT [dbo].[DeliveryStatuses] ([Id], [Name], [Priority]) VALUES (2, N'This products is ready to ship', 5)
INSERT [dbo].[DeliveryStatuses] ([Id], [Name], [Priority]) VALUES (3, N'The shipper has taken from the repositories', 5)
INSERT [dbo].[DeliveryStatuses] ([Id], [Name], [Priority]) VALUES (4, N'The shipper is on his way to you', 5)
INSERT [dbo].[DeliveryStatuses] ([Id], [Name], [Priority]) VALUES (5, N'Delivery successful', 10)
INSERT [dbo].[DeliveryStatuses] ([Id], [Name], [Priority]) VALUES (7, N'This order has been cancel by Bridge Shop! Sorry about this case.', -10)
INSERT [dbo].[DeliveryStatuses] ([Id], [Name], [Priority]) VALUES (8, N'The shipper is busy now', -5)
INSERT [dbo].[DeliveryStatuses] ([Id], [Name], [Priority]) VALUES (9, N'This products are out of stock', -10)
INSERT [dbo].[DeliveryStatuses] ([Id], [Name], [Priority]) VALUES (10, N'This order has been cancel by customer', -10)
SET IDENTITY_INSERT [dbo].[DeliveryStatuses] OFF
SET IDENTITY_INSERT [dbo].[Genders] ON 

INSERT [dbo].[Genders] ([Id], [Name]) VALUES (1, N'Male')
INSERT [dbo].[Genders] ([Id], [Name]) VALUES (2, N'Female')
INSERT [dbo].[Genders] ([Id], [Name]) VALUES (3, N'Child')
INSERT [dbo].[Genders] ([Id], [Name]) VALUES (4, N'FreeSize')
SET IDENTITY_INSERT [dbo].[Genders] OFF
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [ProductId], [OrderId], [Size], [Color], [Quantity], [Comment], [Star]) VALUES (16, 4, 11, N'F3', N'Grey', 2, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [ProductId], [OrderId], [Size], [Color], [Quantity], [Comment], [Star]) VALUES (17, 19, 12, N'F2', N'Aquamarine', 1, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [ProductId], [OrderId], [Size], [Color], [Quantity], [Comment], [Star]) VALUES (18, 12, 12, N'C3', N'Dark Yellow', 1, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [ProductId], [OrderId], [Size], [Color], [Quantity], [Comment], [Star]) VALUES (19, 12, 13, N'C2', N'Dark Yellow', 2, N'It''s awful product', 1)
INSERT [dbo].[OrderDetails] ([Id], [ProductId], [OrderId], [Size], [Color], [Quantity], [Comment], [Star]) VALUES (20, 1, 14, N'M2', N'Blue', 1, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [ProductId], [OrderId], [Size], [Color], [Quantity], [Comment], [Star]) VALUES (21, 16, 15, N'C2', N'Grey', 3, NULL, NULL)
INSERT [dbo].[OrderDetails] ([Id], [ProductId], [OrderId], [Size], [Color], [Quantity], [Comment], [Star]) VALUES (22, 17, 16, N'M3', N'Dark Green', 3, NULL, NULL)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [BuyerId], [TotalAmount], [DateCreated], [Address], [Note], [CurrentStatus], [PhoneNumber], [Receiver]) VALUES (11, N'6bce7933-5d5a-4530-9223-4637bc17c5ca', 51.98, CAST(N'2020-03-08T15:45:09.3204060' AS DateTime2), N'1E / 27 đường Tây Hoà, phường Phước Long A, quận 9, tp Hồ Chí Minh', NULL, 2, N'0942502660', N'Trần Viết Đông')
INSERT [dbo].[Orders] ([Id], [BuyerId], [TotalAmount], [DateCreated], [Address], [Note], [CurrentStatus], [PhoneNumber], [Receiver]) VALUES (12, N'6bce7933-5d5a-4530-9223-4637bc17c5ca', 26, CAST(N'2020-03-09T17:10:21.2108918' AS DateTime2), N'1E / 27 đường Tây Hoà, phường Phước Long A, quận 9, tp Hồ Chí Minh', NULL, 3, N'0942502660', N'Trần Viết Đông')
INSERT [dbo].[Orders] ([Id], [BuyerId], [TotalAmount], [DateCreated], [Address], [Note], [CurrentStatus], [PhoneNumber], [Receiver]) VALUES (13, N'6bce7933-5d5a-4530-9223-4637bc17c5ca', 28, CAST(N'2020-03-09T17:12:06.9513312' AS DateTime2), N'1E / 27 đường Tây Hoà, phường Phước Long A, quận 9, tp Hồ Chí Minh', NULL, 2, N'0942502660', N'Trần Viết Đông')
INSERT [dbo].[Orders] ([Id], [BuyerId], [TotalAmount], [DateCreated], [Address], [Note], [CurrentStatus], [PhoneNumber], [Receiver]) VALUES (14, N'6bce7933-5d5a-4530-9223-4637bc17c5ca', 39.99, CAST(N'2020-03-14T09:42:49.8806351' AS DateTime2), N'1E / 27 đường Tây Hoà, phường Phước Long A, quận 9, tp Hồ Chí Minh', NULL, 2, N'0942502660', N'Trần Viết Đông')
INSERT [dbo].[Orders] ([Id], [BuyerId], [TotalAmount], [DateCreated], [Address], [Note], [CurrentStatus], [PhoneNumber], [Receiver]) VALUES (15, N'6bce7933-5d5a-4530-9223-4637bc17c5ca', 58.29, CAST(N'2020-03-15T11:41:52.9321456' AS DateTime2), N'1E / 27 đường Tây Hoà, phường Phước Long A, quận 9, tp Hồ Chí Minh', NULL, 1, N'0942502660', N'Trần Viết Đông')
INSERT [dbo].[Orders] ([Id], [BuyerId], [TotalAmount], [DateCreated], [Address], [Note], [CurrentStatus], [PhoneNumber], [Receiver]) VALUES (16, N'3a947cf1-3a69-4c50-bd58-9d8ecadbd48f', 144, CAST(N'2020-03-18T15:19:28.0134654' AS DateTime2), N'FPT university Distric 9, Ho Chi Minh city', NULL, 1, N'0334885952', N'Đào Thị Hoài Thương')
SET IDENTITY_INSERT [dbo].[Orders] OFF
SET IDENTITY_INSERT [dbo].[OrderStatuses] ON 

INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (16, 11, 1, CAST(N'2020-03-08T15:45:09.7116983' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (17, 11, 2, CAST(N'2020-03-09T15:43:11.3923585' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (18, 11, 3, CAST(N'2020-03-09T15:43:37.6167897' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (19, 11, 4, CAST(N'2020-03-09T15:45:36.7458449' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (20, 11, 5, CAST(N'2020-03-09T16:04:12.4380295' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (21, 12, 1, CAST(N'2020-03-09T17:10:21.5577324' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (22, 12, 2, CAST(N'2020-03-09T17:11:05.0003348' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (23, 12, 10, CAST(N'2020-03-09T17:11:23.7298825' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (24, 13, 1, CAST(N'2020-03-09T17:12:06.9590981' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (25, 13, 2, CAST(N'2020-03-09T17:12:15.5113014' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (26, 13, 3, CAST(N'2020-03-09T17:12:17.4325881' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (27, 13, 4, CAST(N'2020-03-09T17:12:19.9157741' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (28, 13, 5, CAST(N'2020-03-09T17:12:21.7165614' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (29, 14, 1, CAST(N'2020-03-14T09:42:50.0846833' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (30, 14, 2, CAST(N'2020-03-14T09:54:46.4774005' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (31, 14, 3, CAST(N'2020-03-14T09:55:13.7532969' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (32, 14, 3, CAST(N'2020-03-14T09:56:42.1097416' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (33, 14, 3, CAST(N'2020-03-14T09:58:00.3186935' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (34, 14, 4, CAST(N'2020-03-14T09:58:37.5660170' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (35, 14, 4, CAST(N'2020-03-14T10:04:09.5768288' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (36, 14, 4, CAST(N'2020-03-14T10:04:42.4670483' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (37, 14, 4, CAST(N'2020-03-14T10:16:18.8440181' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (38, 14, 4, CAST(N'2020-03-14T10:18:01.0472990' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (39, 14, 4, CAST(N'2020-03-14T10:19:24.0085568' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (40, 14, 4, CAST(N'2020-03-14T10:19:38.2539104' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (41, 14, 4, CAST(N'2020-03-14T10:20:08.5612566' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (42, 14, 4, CAST(N'2020-03-14T10:20:34.9222324' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (43, 14, 4, CAST(N'2020-03-14T10:25:47.4618832' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (44, 14, 4, CAST(N'2020-03-14T10:25:55.6545736' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (45, 14, 5, CAST(N'2020-03-14T10:26:23.9194167' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (46, 15, 1, CAST(N'2020-03-15T11:41:53.1342005' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (47, 15, 2, CAST(N'2020-03-15T22:40:48.5057989' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (48, 15, 2, CAST(N'2020-03-15T22:42:50.0695889' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (49, 15, 2, CAST(N'2020-03-15T22:44:31.4204947' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (50, 15, 2, CAST(N'2020-03-15T22:45:17.3091213' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (51, 15, 3, CAST(N'2020-03-15T22:50:29.4662125' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (52, 16, 1, CAST(N'2020-03-18T15:19:28.1169741' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (53, 16, 1, CAST(N'2020-03-20T16:53:04.5420396' AS DateTime2))
INSERT [dbo].[OrderStatuses] ([Id], [OrderId], [StatusId], [DateCreate]) VALUES (54, 16, 3, CAST(N'2020-03-20T17:07:23.2013918' AS DateTime2))
SET IDENTITY_INSERT [dbo].[OrderStatuses] OFF
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (1, 1)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (1, 2)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (1, 3)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (2, 2)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (2, 3)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (2, 4)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (3, 3)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (3, 4)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (3, 5)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (4, 1)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (4, 4)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (4, 5)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (6, 1)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (8, 2)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (10, 10)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (11, 9)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (12, 11)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (13, 2)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (15, 2)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (16, 5)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (17, 12)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (17, 13)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (17, 14)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (18, 15)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (19, 8)
INSERT [dbo].[ProductColors] ([ProductId], [ColorId]) VALUES (20, 6)
SET IDENTITY_INSERT [dbo].[ProductImages] ON 

INSERT [dbo].[ProductImages] ([Id], [FilePath], [IsHighLight], [Order], [ProductId]) VALUES (1, N'files/images/products/jacket_1.jpg', 1, 0, 1)
INSERT [dbo].[ProductImages] ([Id], [FilePath], [IsHighLight], [Order], [ProductId]) VALUES (2, N'files/images/products/jean_1.jpg', 1, 0, 2)
INSERT [dbo].[ProductImages] ([Id], [FilePath], [IsHighLight], [Order], [ProductId]) VALUES (3, N'files/images/products/dress_1.jpg', 1, 0, 3)
INSERT [dbo].[ProductImages] ([Id], [FilePath], [IsHighLight], [Order], [ProductId]) VALUES (4, N'files/images/products/jacket_2.jpg', 0, 1, 1)
INSERT [dbo].[ProductImages] ([Id], [FilePath], [IsHighLight], [Order], [ProductId]) VALUES (5, N'files/images/products/dress_2.jpg', 1, 0, 4)
INSERT [dbo].[ProductImages] ([Id], [FilePath], [IsHighLight], [Order], [ProductId]) VALUES (6, N'files/images/products/dress_21.jpg', 0, 1, 4)
INSERT [dbo].[ProductImages] ([Id], [FilePath], [IsHighLight], [Order], [ProductId]) VALUES (7, N'files/images/products/dress_22.jpg', 0, 2, 4)
INSERT [dbo].[ProductImages] ([Id], [FilePath], [IsHighLight], [Order], [ProductId]) VALUES (8, N'files/images/products/jeans_4.jpg', 1, 0, 8)
INSERT [dbo].[ProductImages] ([Id], [FilePath], [IsHighLight], [Order], [ProductId]) VALUES (10, N'files/images/products/jeans_3.jpg', 1, 1, 15)
INSERT [dbo].[ProductImages] ([Id], [FilePath], [IsHighLight], [Order], [ProductId]) VALUES (11, N'files/images/products/jeans_2.jpg', 1, 0, 6)
INSERT [dbo].[ProductImages] ([Id], [FilePath], [IsHighLight], [Order], [ProductId]) VALUES (12, N'files/images/products/shirt_1.jpg', 1, 0, 11)
INSERT [dbo].[ProductImages] ([Id], [FilePath], [IsHighLight], [Order], [ProductId]) VALUES (13, N'files/images/products/shirt_2.jpg', 1, 0, 17)
INSERT [dbo].[ProductImages] ([Id], [FilePath], [IsHighLight], [Order], [ProductId]) VALUES (14, N'files/images/products/t-shirt_1.jpg', 1, 0, 13)
INSERT [dbo].[ProductImages] ([Id], [FilePath], [IsHighLight], [Order], [ProductId]) VALUES (15, N'files/images/products/t-shirt_2.jpg', 1, 0, 18)
INSERT [dbo].[ProductImages] ([Id], [FilePath], [IsHighLight], [Order], [ProductId]) VALUES (16, N'files/images/products/t-shirt_3.jpeg', 1, 0, 16)
INSERT [dbo].[ProductImages] ([Id], [FilePath], [IsHighLight], [Order], [ProductId]) VALUES (17, N'files/images/products/t-shirt_4.jpg', 1, 0, 19)
INSERT [dbo].[ProductImages] ([Id], [FilePath], [IsHighLight], [Order], [ProductId]) VALUES (18, N'files/images/products/shirt_3.jpg', 1, 0, 12)
INSERT [dbo].[ProductImages] ([Id], [FilePath], [IsHighLight], [Order], [ProductId]) VALUES (19, N'files/images/products/shirt_4.jpg', 1, 0, 10)
INSERT [dbo].[ProductImages] ([Id], [FilePath], [IsHighLight], [Order], [ProductId]) VALUES (20, N'files/images/products/jacket_2.jpg', 1, 0, 20)
INSERT [dbo].[ProductImages] ([Id], [FilePath], [IsHighLight], [Order], [ProductId]) VALUES (31, N'files/images/products/11412018511732020124808~Conan.png', 1, 0, 3)
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [OldPrice], [CategoryId], [CurrentPrice], [DateSale], [IsSale], [GenderId], [Status]) VALUES (1, N'Black Cropped Bomber Jacket', N'This black cropped bomber jacket adds the perfect finishing touch to your look. Whether this layer complements a pair of joggers or jeans, it is always a go-to option. 100% Polyester. Machine wash.', 49.99, 1, 39.99, CAST(N'2020-02-22T00:00:00.0000000' AS DateTime2), 0, 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [OldPrice], [CategoryId], [CurrentPrice], [DateSale], [IsSale], [GenderId], [Status]) VALUES (2, N'Indigo Let Hem Jamie Flare Skinny Jeans', N'Take inspiration from fashion''s past to create the ultimate look of the present. These high waisted, flared leg jeans in authentic power stretch denim with let hem detailing have a flair for fashion. Pair a bold crew neck to contrast the style. 91% Cotton, 6% Polyester, 3% Elastane. Machine wash.', 49, 3, 42, CAST(N'2020-02-21T00:00:00.0000000' AS DateTime2), 0, 2, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [OldPrice], [CategoryId], [CurrentPrice], [DateSale], [IsSale], [GenderId], [Status]) VALUES (3, N'Black Prairie Satin Mini Dress', N'This bold black satin mini dress is a nod to Prairie style that the catwalks and street style icons love to rock. This ensemble is such a Topshop classic that creates a trending touch. 100% Polyester. Machine wash.', 39, 2, 35, CAST(N'2020-02-20T00:00:00.0000000' AS DateTime2), 0, 4, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [OldPrice], [CategoryId], [CurrentPrice], [DateSale], [IsSale], [GenderId], [Status]) VALUES (4, N'Ao Dai Wonman 2020', N'Embrace romantic detailing for a feminine and elegant style with our maxi dress. Designed in ivory with ruffle detail, this ensemble work for elevated days or evenings. For style perfection, add some trending Western boots to the mix. 100% Polyester. Machine wash.
', 29.99, 2, 25.99, CAST(N'2020-02-20T00:00:00.0000000' AS DateTime2), 0, 2, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [OldPrice], [CategoryId], [CurrentPrice], [DateSale], [IsSale], [GenderId], [Status]) VALUES (6, N'Stretch Selvage Slim-Fit Jeans', N'It''s hard to beat a pair of selvage jeans for under $40. Like, very hard.', 49.9, 3, 49.9, CAST(N'2020-02-24T00:00:00.0000000' AS DateTime2), 0, 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [OldPrice], [CategoryId], [CurrentPrice], [DateSale], [IsSale], [GenderId], [Status]) VALUES (8, N'Alberto Coolmax Denim Jeans Shorts', N'The BELL Coolmax Denim Jeans Shorts by ALBERTO offer ladies a pleasantly cool feeling and high comfort on warm days. Just the right choice for summer tours and everyday use!

Details:
• Comfortable jeans shorts in an urban style
• Made from cooling COOLMAX fabric
• High stretch content for unrestricted freedom of movement
• High waist - raised back
• Patch hip pockets that do not touch the saddle
• Belt loops
• Button and zip
• Two front pockets with additional small coin pocket
• Two strategically positioned hip pockets
• Reflective elements on hip pockets

Material: 60% cotton, 37% polyester, 3% elastane

Manufacturer''s ref.: 2742 2560 883

COOLMAX:
Thanks to its larger surface, this material wicks moisture away especially fast when sweating. In this way, it offers very good breathability and always ensures a dry and comfortable feeling.', 99.95, 3, 92.97, CAST(N'2020-01-15T00:00:00.0000000' AS DateTime2), 1, 4, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [OldPrice], [CategoryId], [CurrentPrice], [DateSale], [IsSale], [GenderId], [Status]) VALUES (10, N'Carnation Womens Shirt - Lemon', N'This long sleeved ladies shirt, with contrast cuffs and elbow patches is a great ladies casual fashion piece. Not only is it ideal with cropped trousers and womens deck shoes, suede loafers or moccasins for a sailing clothing look. - Marine concept stretch cotton fitted shirt, with houndstooth trim, buttoned sleeve placket and additional button detail above the elbow. With Dubarry branded metal buttons. Stretch cotton Machine washable', 79, 5, 29, CAST(N'2020-02-10T00:00:00.0000000' AS DateTime2), 1, 2, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [OldPrice], [CategoryId], [CurrentPrice], [DateSale], [IsSale], [GenderId], [Status]) VALUES (11, N'Olive Green Colour Smart Casual Shirt', N'Go for this trendy fusion casual from Cats Eye. That has been made from soft quality cotton. Comfortable to wear and soft on skin. Style this smart casual shirt with jeans and casual shoes.', 90, 5, 45, CAST(N'2020-02-15T00:00:00.0000000' AS DateTime2), 1, 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [OldPrice], [CategoryId], [CurrentPrice], [DateSale], [IsSale], [GenderId], [Status]) VALUES (12, N'Polar Fleece Pipe Up Shirt', N'', 40.99, 5, 14, CAST(N'2020-03-20T10:07:41.2550000' AS DateTime2), 1, 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [OldPrice], [CategoryId], [CurrentPrice], [DateSale], [IsSale], [GenderId], [Status]) VALUES (13, N'Kaden Stripe Shirt', N'Short sleeve striped knit crew with woven flag label.
100% Cotton Knit - Imported.', 60, 4, 40, CAST(N'2020-01-30T00:00:00.0000000' AS DateTime2), 1, 4, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [OldPrice], [CategoryId], [CurrentPrice], [DateSale], [IsSale], [GenderId], [Status]) VALUES (15, N'Rokker Rokkertech High Waist Ladies Jeans - Light Wash', N'The ladies edition of the Rokker Rokkertech jeans uses the same single layer formula as the original men''s version but features a higher waist and slimmer leg. Rokker have pushed the boundaries of what is possible in terms of rider safety with single layer technology, meaning they can give their denim an authentic fashion fit and feel. ', 49.99, 3, 30.99, CAST(N'2019-12-30T00:00:00.0000000' AS DateTime2), 1, 2, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [OldPrice], [CategoryId], [CurrentPrice], [DateSale], [IsSale], [GenderId], [Status]) VALUES (16, N'Future NASA Space Astronaut Charcoal Youth T-Shirt', N'Does your little one dream of blasting off in a spaceship and exploring the stars? This shirt is for them. This great shirt has the official NASA meatball logo and says "Future Astronaut" around it.', 19.43, 4, 19.43, CAST(N'2020-02-20T00:00:00.0000000' AS DateTime2), 0, 3, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [OldPrice], [CategoryId], [CurrentPrice], [DateSale], [IsSale], [GenderId], [Status]) VALUES (17, N'Mens Outdoor Military Double Pocket Solid Color Casual Short Sleeve Cotton Shirt', N'Material:Cotton
Color:Navy Blue,Army Green,Khaki
Occasion: Casual,Outdoor
Season: Summer
Size:S M L XL 2XL 3XL', 51.39, 5, 48, CAST(N'2020-01-13T00:00:00.0000000' AS DateTime2), 1, 1, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [OldPrice], [CategoryId], [CurrentPrice], [DateSale], [IsSale], [GenderId], [Status]) VALUES (18, N'lilo and stitch funny cute stitch cute T-Shirt', N'Stitch T-Shirt Designed and Sold by tessacreativeart', 20, 4, 20, CAST(N'2020-01-27T00:00:00.0000000' AS DateTime2), 0, 4, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [OldPrice], [CategoryId], [CurrentPrice], [DateSale], [IsSale], [GenderId], [Status]) VALUES (19, N'Ramen Panda', N'Ramen is this panda''s favorite food, our favorite food ... everyone''s favorite! 🍜Next time you''re chowing down, make sure you are wearing this teal, TeeTurtle original "Ramen Panda" t-shirt.

Tees are social creatures, so make sure to get them lots of friends!', 24, 4, 12, CAST(N'2020-02-25T00:00:00.0000000' AS DateTime2), 1, 2, 0)
INSERT [dbo].[Products] ([Id], [Name], [Description], [OldPrice], [CategoryId], [CurrentPrice], [DateSale], [IsSale], [GenderId], [Status]) VALUES (20, N'Nylon Mock Neck', N'Full zip sherpa fleece mock with nylon piecing on welt pockets and neck. Lycra binding at hem and sleeve opening. Branded with logo zip pull and Stussy design woven label.
100% Polyester Knit - Imported', 25.99, 1, 100, CAST(N'2020-01-10T00:00:00.0000000' AS DateTime2), 1, 3, 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[Sizes] ON 

INSERT [dbo].[Sizes] ([Id], [Name], [Standard], [GenderId]) VALUES (1, N'M1', NULL, 1)
INSERT [dbo].[Sizes] ([Id], [Name], [Standard], [GenderId]) VALUES (2, N'M2', NULL, 1)
INSERT [dbo].[Sizes] ([Id], [Name], [Standard], [GenderId]) VALUES (3, N'M3', NULL, 1)
INSERT [dbo].[Sizes] ([Id], [Name], [Standard], [GenderId]) VALUES (4, N'M4', NULL, 1)
INSERT [dbo].[Sizes] ([Id], [Name], [Standard], [GenderId]) VALUES (5, N'M5', NULL, 1)
INSERT [dbo].[Sizes] ([Id], [Name], [Standard], [GenderId]) VALUES (6, N'F1', NULL, 2)
INSERT [dbo].[Sizes] ([Id], [Name], [Standard], [GenderId]) VALUES (7, N'F2', NULL, 2)
INSERT [dbo].[Sizes] ([Id], [Name], [Standard], [GenderId]) VALUES (8, N'F3', NULL, 2)
INSERT [dbo].[Sizes] ([Id], [Name], [Standard], [GenderId]) VALUES (9, N'F4', NULL, 2)
INSERT [dbo].[Sizes] ([Id], [Name], [Standard], [GenderId]) VALUES (10, N'C1', NULL, 3)
INSERT [dbo].[Sizes] ([Id], [Name], [Standard], [GenderId]) VALUES (11, N'C2', NULL, 3)
INSERT [dbo].[Sizes] ([Id], [Name], [Standard], [GenderId]) VALUES (12, N'C3', NULL, 3)
INSERT [dbo].[Sizes] ([Id], [Name], [Standard], [GenderId]) VALUES (13, N'C4', NULL, 3)
INSERT [dbo].[Sizes] ([Id], [Name], [Standard], [GenderId]) VALUES (14, N'S1', NULL, 4)
INSERT [dbo].[Sizes] ([Id], [Name], [Standard], [GenderId]) VALUES (15, N'S2', NULL, 4)
INSERT [dbo].[Sizes] ([Id], [Name], [Standard], [GenderId]) VALUES (16, N'S3', NULL, 4)
INSERT [dbo].[Sizes] ([Id], [Name], [Standard], [GenderId]) VALUES (17, N'S4', NULL, 4)
INSERT [dbo].[Sizes] ([Id], [Name], [Standard], [GenderId]) VALUES (18, N'S5', NULL, 4)
SET IDENTITY_INSERT [dbo].[Sizes] OFF
SET IDENTITY_INSERT [dbo].[UserAddresses] ON 

INSERT [dbo].[UserAddresses] ([Id], [Name], [Address], [PhoneNumber], [IsHome], [UserId]) VALUES (1, N'Trần Viết Đông', N'1E / 27 đường Tây Hoà, phường Phước Long A, quận 9, tp Hồ Chí Minh', N'0942502660', 1, N'6bce7933-5d5a-4530-9223-4637bc17c5ca')
INSERT [dbo].[UserAddresses] ([Id], [Name], [Address], [PhoneNumber], [IsHome], [UserId]) VALUES (3, N'Đào Thị Hoài Thương', N'FPT university Distric 9, Ho Chi Minh city', N'0334885952', 1, N'6bce7933-5d5a-4530-9223-4637bc17c5ca')
INSERT [dbo].[UserAddresses] ([Id], [Name], [Address], [PhoneNumber], [IsHome], [UserId]) VALUES (4, N'Đào Thị Hoài Thương', N'FPT university Distric 9, Ho Chi Minh city', N'0334885952', 1, N'3a947cf1-3a69-4c50-bd58-9d8ecadbd48f')
SET IDENTITY_INSERT [dbo].[UserAddresses] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 3/20/2020 9:11:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 3/20/2020 9:11:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 3/20/2020 9:11:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 3/20/2020 9:11:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 3/20/2020 9:11:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 3/20/2020 9:11:23 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 3/20/2020 9:11:23 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CollectionProducts_CollectionId]    Script Date: 3/20/2020 9:11:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_CollectionProducts_CollectionId] ON [dbo].[CollectionProducts]
(
	[CollectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetails_OrderId]    Script Date: 3/20/2020 9:11:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_OrderId] ON [dbo].[OrderDetails]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderDetails_ProductId]    Script Date: 3/20/2020 9:11:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetails_ProductId] ON [dbo].[OrderDetails]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Orders_BuyerId]    Script Date: 3/20/2020 9:11:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_BuyerId] ON [dbo].[Orders]
(
	[BuyerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderStatuses_OrderId]    Script Date: 3/20/2020 9:11:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderStatuses_OrderId] ON [dbo].[OrderStatuses]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderStatuses_StatusId]    Script Date: 3/20/2020 9:11:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderStatuses_StatusId] ON [dbo].[OrderStatuses]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductColors_ProductId]    Script Date: 3/20/2020 9:11:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductColors_ProductId] ON [dbo].[ProductColors]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductImages_ProductId]    Script Date: 3/20/2020 9:11:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductImages_ProductId] ON [dbo].[ProductImages]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 3/20/2020 9:11:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_GenderId]    Script Date: 3/20/2020 9:11:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_GenderId] ON [dbo].[Products]
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Sizes_GenderId]    Script Date: 3/20/2020 9:11:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_Sizes_GenderId] ON [dbo].[Sizes]
(
	[GenderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserAddresses_UserId]    Script Date: 3/20/2020 9:11:23 PM ******/
CREATE NONCLUSTERED INDEX [IX_UserAddresses_UserId] ON [dbo].[UserAddresses]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Colors] ADD  DEFAULT ((0)) FOR [B]
GO
ALTER TABLE [dbo].[Colors] ADD  DEFAULT ((0)) FOR [G]
GO
ALTER TABLE [dbo].[Colors] ADD  DEFAULT ((0)) FOR [O]
GO
ALTER TABLE [dbo].[Colors] ADD  DEFAULT ((0)) FOR [R]
GO
ALTER TABLE [dbo].[Orders] ADD  DEFAULT ((0)) FOR [CurrentStatus]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0.0000000000000000e+000)) FOR [CurrentPrice]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [DateSale]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [IsSale]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CollectionProducts]  WITH CHECK ADD  CONSTRAINT [FK_CollectionProducts_Collections_CollectionId] FOREIGN KEY([CollectionId])
REFERENCES [dbo].[Collections] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CollectionProducts] CHECK CONSTRAINT [FK_CollectionProducts_Collections_CollectionId]
GO
ALTER TABLE [dbo].[CollectionProducts]  WITH CHECK ADD  CONSTRAINT [FK_CollectionProducts_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CollectionProducts] CHECK CONSTRAINT [FK_CollectionProducts_Products_ProductId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products_ProductId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AspNetUsers_BuyerId] FOREIGN KEY([BuyerId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_AspNetUsers_BuyerId]
GO
ALTER TABLE [dbo].[OrderStatuses]  WITH CHECK ADD  CONSTRAINT [FK_OrderStatuses_DeliveryStatuses_StatusId] FOREIGN KEY([StatusId])
REFERENCES [dbo].[DeliveryStatuses] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderStatuses] CHECK CONSTRAINT [FK_OrderStatuses_DeliveryStatuses_StatusId]
GO
ALTER TABLE [dbo].[OrderStatuses]  WITH CHECK ADD  CONSTRAINT [FK_OrderStatuses_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderStatuses] CHECK CONSTRAINT [FK_OrderStatuses_Orders_OrderId]
GO
ALTER TABLE [dbo].[ProductColors]  WITH CHECK ADD  CONSTRAINT [FK_ProductColors_Colors_ColorId] FOREIGN KEY([ColorId])
REFERENCES [dbo].[Colors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductColors] CHECK CONSTRAINT [FK_ProductColors_Colors_ColorId]
GO
ALTER TABLE [dbo].[ProductColors]  WITH CHECK ADD  CONSTRAINT [FK_ProductColors_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductColors] CHECK CONSTRAINT [FK_ProductColors_Products_ProductId]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Genders_GenderId] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Genders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Genders_GenderId]
GO
ALTER TABLE [dbo].[Sizes]  WITH CHECK ADD  CONSTRAINT [FK_Sizes_Genders_GenderId] FOREIGN KEY([GenderId])
REFERENCES [dbo].[Genders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sizes] CHECK CONSTRAINT [FK_Sizes_Genders_GenderId]
GO
ALTER TABLE [dbo].[UserAddresses]  WITH CHECK ADD  CONSTRAINT [FK_UserAddresses_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserAddresses] CHECK CONSTRAINT [FK_UserAddresses_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [Bridge] SET  READ_WRITE 
GO
