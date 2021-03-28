USE [master]
GO
/****** Object:  Database [CarProject]    Script Date: 22.03.2021 18:49:20 ******/
CREATE DATABASE [CarProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarProject', FILENAME = N'C:\Users\Seyit\CarProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarProject_log', FILENAME = N'C:\Users\Seyit\CarProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CarProject] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CarProject] SET  MULTI_USER 
GO
ALTER DATABASE [CarProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CarProject] SET QUERY_STORE = OFF
GO
USE [CarProject]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [CarProject]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 22.03.2021 18:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarImages]    Script Date: 22.03.2021 18:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarId] [int] NULL,
	[ImagePath] [nvarchar](max) NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_CarImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 22.03.2021 18:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BrandId] [int] NOT NULL,
	[ColorId] [int] NOT NULL,
	[ModelName] [nvarchar](50) NOT NULL,
	[ColorName] [nvarchar](50) NOT NULL,
	[ModelYear] [int] NOT NULL,
	[DailyPrice] [decimal](18, 0) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 22.03.2021 18:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Colors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 22.03.2021 18:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[CompanyName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationClaims]    Script Date: 22.03.2021 18:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NOT NULL,
 CONSTRAINT [PK_OperationClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 22.03.2021 18:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RentId] [int] NULL,
	[NameSurname] [varchar](50) NULL,
	[CardNumber] [varchar](50) NULL,
	[ExpiryDate] [varchar](50) NULL,
	[Cvv] [varchar](50) NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 22.03.2021 18:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rentals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CarId] [int] NULL,
	[CustomerId] [int] NULL,
	[RentDate] [datetime] NOT NULL,
	[ReturnDate] [datetime] NULL,
 CONSTRAINT [PK_Rentals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserOperationClaims]    Script Date: 22.03.2021 18:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserOperationClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[OperationClaimId] [int] NOT NULL,
 CONSTRAINT [PK_UserOperationClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 22.03.2021 18:49:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[PasswordHash] [varbinary](128) NOT NULL,
	[PasswordSalt] [varbinary](128) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [Name]) VALUES (1, N'Audi')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (2, N'BMW')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (3, N'Mercedes')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (4, N'Pegeout')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (5, N'Wolkswagen')
SET IDENTITY_INSERT [dbo].[Brands] OFF
SET IDENTITY_INSERT [dbo].[CarImages] ON 

INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1, 1, N'5f85a103-dbad-4a0b-b3db-45389aa3cdf1_3_17_2021.jpg', CAST(N'2021-03-17T17:51:44.963' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (2, 1, N'61504868-ae84-4d13-bed6-56ee21983493_3_17_2021.jpg', CAST(N'2021-03-17T17:53:23.797' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (3, 1, N'f38c552f-45fc-40e4-bded-e2c34c548ff0_3_17_2021.jpg', CAST(N'2021-03-17T17:54:08.437' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (4, 1, N'bda94c63-51b4-418f-9797-56a3f5666b1f_3_17_2021.png', CAST(N'2021-03-17T17:54:18.080' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (5, 1, N'd7675b3d-7214-4c6d-96f8-d7d15089cd4d_3_17_2021.jpg', CAST(N'2021-03-17T17:54:24.577' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (6, 2, N'76902bd2-294b-4cfd-8cff-3a830a7fb8d9_3_17_2021.jpg', CAST(N'2021-03-17T17:55:28.863' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (7, 2, N'8b2034fb-86dd-4eba-898e-fded9a4616d6_3_17_2021.jpg', CAST(N'2021-03-17T17:55:41.747' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (8, 2, N'04e52af3-e59b-49f7-b159-6710fedca814_3_17_2021.jpg', CAST(N'2021-03-17T17:56:09.843' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (9, 2, N'5c43d7af-4688-4803-a9d0-961c8e342ec2_3_17_2021.jpg', CAST(N'2021-03-17T17:56:18.230' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (11, 3, N'65048f73-121d-4b87-b56b-5e6efa8a460a_3_17_2021.jpg', CAST(N'2021-03-17T18:07:21.810' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (12, 3, N'6e3c7229-2a00-48ee-9b0f-26cf1a7aee86_3_17_2021.jpg', CAST(N'2021-03-17T18:07:55.037' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (13, 3, N'9b92185a-df32-4755-9413-b6fa28a665c3_3_17_2021.jpg', CAST(N'2021-03-17T18:08:04.070' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (14, 3, N'48757ccc-ded4-4623-9a44-dba12864b35e_3_17_2021.jpg', CAST(N'2021-03-17T18:08:13.780' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (15, 3, N'9e9af5db-b42f-42e5-a8e1-cd7af509520d_3_17_2021.jpg', CAST(N'2021-03-17T18:08:20.550' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (16, 4, N'1f4b2300-87e9-41a9-842e-739bb8f9f3e7_3_17_2021.jpg', CAST(N'2021-03-17T18:08:51.013' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (17, 4, N'4da156a8-c92e-41ef-a56a-0aceb6bd4906_3_17_2021.jpg', CAST(N'2021-03-17T18:09:42.087' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (18, 4, N'5bf36b65-1869-44f8-af82-055d996122a8_3_17_2021.jpg', CAST(N'2021-03-17T18:09:49.510' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (19, 4, N'f05ec7ba-7586-42da-a719-3c2dbf96ffd4_3_17_2021.png', CAST(N'2021-03-17T18:09:57.030' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (20, 4, N'd0534f65-8281-495e-bdb9-1d3da9d49bf7_3_17_2021.jpg', CAST(N'2021-03-17T18:10:04.483' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (21, 5, N'13e8aa71-ff49-4c2c-ae5c-f84dc9616a1f_3_17_2021.jpg', CAST(N'2021-03-17T18:11:31.683' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (22, 5, N'2287b131-fc56-4587-b6ca-94c8d4076c03_3_17_2021.jpg', CAST(N'2021-03-17T18:11:37.847' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (23, 5, N'bdf101ce-470e-4a75-ae09-91283f1e1d73_3_17_2021.jpg', CAST(N'2021-03-17T18:11:44.440' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (24, 5, N'9a40a71f-1425-4a84-a1a8-49bf402d0ed7_3_17_2021.jpg', CAST(N'2021-03-17T18:11:50.610' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (25, 5, N'6909b200-0068-4066-b1c1-9d8e82d1b8e5_3_17_2021.jpg', CAST(N'2021-03-17T18:11:56.713' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (26, 6, N'd754e221-c815-461f-a2ac-8f80aaa62702_3_17_2021.jpg', CAST(N'2021-03-17T18:15:04.897' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (27, 6, N'15b22296-5a54-42c7-ab29-9a2e9167c8ef_3_17_2021.jpg', CAST(N'2021-03-17T18:15:12.743' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (28, 6, N'68e6e94c-f439-44f6-a1c8-44995f88aff3_3_17_2021.jpg', CAST(N'2021-03-17T18:16:03.283' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (29, 6, N'77e53caa-5f7c-4101-9396-039af22e5aee_3_17_2021.jpg', CAST(N'2021-03-17T18:16:09.157' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (30, 6, N'dab9e9a5-d4ce-4e6b-9c4f-d7f1e526be91_3_17_2021.jpg', CAST(N'2021-03-17T18:16:15.687' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (31, 7, N'496ac611-6e00-4546-896e-4a69ba20c949_3_17_2021.jpg', CAST(N'2021-03-17T18:17:52.367' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (32, 7, N'88b70623-202f-45c5-8056-fd435210cd38_3_17_2021.jpg', CAST(N'2021-03-17T18:17:58.603' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (33, 7, N'5af5b12c-88a5-4c1a-a220-9fb624a78ac3_3_17_2021.jpg', CAST(N'2021-03-17T18:18:05.730' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (34, 7, N'8a748033-5a59-445d-b9ef-0ec767fe0d11_3_17_2021.jpg', CAST(N'2021-03-17T18:18:30.170' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (35, 7, N'ffad5505-4b91-48e1-a79f-ae405f662fcf_3_17_2021.jpg', CAST(N'2021-03-17T18:18:38.403' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (36, 8, N'7fd2c668-8bf8-4f26-8830-019bb8c96495_3_17_2021.jpg', CAST(N'2021-03-17T18:19:10.620' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (37, 8, N'122b58dc-c7aa-4412-b7f4-8cd162d3e0ee_3_17_2021.jpg', CAST(N'2021-03-17T18:19:20.360' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (38, 8, N'050e8515-cfe1-4dca-b201-cc905f8530db_3_17_2021.jpg', CAST(N'2021-03-17T18:19:29.360' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (39, 8, N'4b26e332-72b7-406b-a564-10bec4791955_3_17_2021.jpg', CAST(N'2021-03-17T18:19:40.847' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (40, 8, N'0a130f20-7a72-48ec-9adf-9abd358265d8_3_17_2021.jpg', CAST(N'2021-03-17T18:19:49.957' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (41, 9, N'fe90c875-2157-4cea-ad7e-ed3f466626be_3_17_2021.png', CAST(N'2021-03-17T18:23:11.030' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (42, 9, N'1f2b1b6b-643e-443b-a274-735ddc25196e_3_17_2021.jpg', CAST(N'2021-03-17T18:23:20.970' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (43, 9, N'b678d34b-4fa2-4c12-8062-01d1a6cb982c_3_17_2021.jpg', CAST(N'2021-03-17T18:23:28.280' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (44, 9, N'93ce91ea-e86a-470e-a26d-9e15df46e355_3_17_2021.jpg', CAST(N'2021-03-17T18:23:36.377' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (45, 9, N'0dba0f40-0d05-47be-9c57-126526fab9bf_3_17_2021.jpg', CAST(N'2021-03-17T18:23:43.187' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (46, 10, N'2606eef2-e826-4d74-82df-6a50206eb271_3_17_2021.jpg', CAST(N'2021-03-17T18:24:13.963' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (47, 10, N'b319d370-ebb1-40bb-b45a-5e8726408cbd_3_17_2021.png', CAST(N'2021-03-17T18:24:19.060' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (48, 10, N'4052b4b2-709f-4e0c-ad75-f3c1e184b222_3_17_2021.jpg', CAST(N'2021-03-17T18:24:24.547' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (49, 10, N'27e1374e-fa23-41b4-9d43-95f9523c4f21_3_17_2021.jpg', CAST(N'2021-03-17T18:24:30.870' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (50, 10, N'4ee46ab1-4a95-4569-92e6-3ebc828c6b1c_3_17_2021.jpg', CAST(N'2021-03-17T18:24:37.947' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1002, 11, N'2847ec93-aac4-4232-9f58-8772d234af4e_3_18_2021.jpg', CAST(N'2021-03-18T02:51:33.327' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (2002, 2, N'a3e1c5ba-72e6-40db-86e8-407e72ec1fbb_3_21_2021.jpg', CAST(N'2021-03-21T00:59:34.537' AS DateTime))
SET IDENTITY_INSERT [dbo].[CarImages] OFF
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (1, 1, 7, N'A1', N'Sarı', 2015, CAST(500 AS Decimal(18, 0)), N'Yeni model')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (2, 1, 6, N'Audi A8', N'Gri', 2015, CAST(500 AS Decimal(18, 0)), N'Yeni model')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (3, 2, 2, N'520i', N'Beyaz', 2015, CAST(500 AS Decimal(18, 0)), N'Temiz araç')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (4, 2, 6, N'i8', N'Gri', 2015, CAST(500 AS Decimal(18, 0)), N'Yeni model')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (5, 3, 1, N'GT-COUPE', N'Siyah', 2021, CAST(500 AS Decimal(18, 0)), N'Yeni model')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (6, 3, 5, N'CLA-180', N'Kırmızı', 2021, CAST(500 AS Decimal(18, 0)), N'Yeni model')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (7, 4, 7, N'RCZ', N'Sarı', 2021, CAST(500 AS Decimal(18, 0)), N'Yeni model')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (8, 4, 3, N'SUV-3008', N'Mavi', 2021, CAST(500 AS Decimal(18, 0)), N'Yeni model')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (9, 5, 4, N'Polo', N'Yeşil', 2021, CAST(500 AS Decimal(18, 0)), N'Modifiye yapıldı')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (10, 5, 6, N'Passat', N'Gri', 2021, CAST(500 AS Decimal(18, 0)), N'Yeni model')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (11, 5, 6, N'Deneme', N'Gri', 2021, CAST(500 AS Decimal(18, 0)), N'Deneme')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (14, 1, 1, N'A Doblo', N'Siyah', 2015, CAST(500 AS Decimal(18, 0)), N'6 koltuklu')
SET IDENTITY_INSERT [dbo].[Cars] OFF
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([Id], [Name]) VALUES (1, N'Siyah')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (2, N'Beyaz')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (3, N'Mavi')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (4, N'Yeşil')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (5, N'Kırmızı')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (6, N'Gri')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (7, N'Sarı')
SET IDENTITY_INSERT [dbo].[Colors] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (1, 1, N'İstanbul')
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (2, 2, N'İzmir')
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (3, 2, N'Van')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[OperationClaims] ON 

INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (1, N'admin')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (2, N'car.add')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (3, N'car.update')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (4, N'car.delete')
SET IDENTITY_INSERT [dbo].[OperationClaims] OFF
SET IDENTITY_INSERT [dbo].[Rentals] ON 

INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (1, 2, 1, CAST(N'2021-08-08T00:00:00.000' AS DateTime), CAST(N'2021-09-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (2, 5, 2, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (3, 6, 3, CAST(N'2021-02-20T00:00:00.000' AS DateTime), CAST(N'2021-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (4, 2, 2, CAST(N'2021-04-04T00:00:00.000' AS DateTime), CAST(N'2021-03-03T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rentals] OFF
SET IDENTITY_INSERT [dbo].[UserOperationClaims] ON 

INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (1, 1, 1)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (6, 1, 2)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (7, 1, 3)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (8, 1, 4)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (1002, 3, 1)
SET IDENTITY_INSERT [dbo].[UserOperationClaims] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status]) VALUES (1, N'Seyit', N'Uludag', N'seyituludag0@gmail.com', 0x8DD49D980FB1DCD82729D0499B20C856E8E158E9A355A4E78377C52DA5DFB2C318DDE6D86E8091DB6F2EEEBBDFFDE59F9C1098D6DB48C74490D740850D91BD3F, 0xD02B81AC868305E540B72FCC87F50DC54E10C658630004487FAD29B805558E445CE39F718B3797738F1253408E2FA8B618FCADCA2362B9D082C41AA024AF137FFE9275BFC25B3BB54D6C55C794ACC8203366360ACA42CE10627D9D7D423E7186F2C7947C176E6C372289072945891A534C6FD25CFEFCF43F6794D46387890723, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status]) VALUES (2, N'Burak', N'Tagil', N'buraktagil@gmail.com', 0x88496E9CC1C90E4E459E69A953698E6DD4235E4943C4BBBDA4077B1AFDC6E893DBF9B29E32FAF202AE2BDF15EEDEB09D28C359CC9F3BFBDC52E63E1017C62D4F, 0xE398DA6FC736B633E3331B717F2B90CFFAB4F7DE0559A2F93DD0BF19A031D107A88BC659296E4469D9AC94AB71067CF7B6C76DB7E925F7B41172C4F5D069E77EE0A736851FAEBB1FDB279ECE24B75C44D7A8CFDB20433D4DE81849143D29339D73F00D2AB77A33B25134BA52E203B85549F6545AAA0C4F0871C38903F0476409, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status]) VALUES (3, N'Seyit', N'Can', N'seyituludag34@gmail.com', 0x21CB3605EB6380713E8027FA6AF8D3EDA577DBDC4B43FDA8533E64FA2C07EBB2A8A9F34C6BF4FE3C55365E6343CE8B3913C63FCA5DD396AB67BE95D24AC21BDE, 0xFD8D5558BB3384B2DB6C2CB7984DFF8B0729B80CFF6A3E2085ABC36484374A92F04689C3BF30A324D389E207D9174D8EF73B6C13420A1B42ABD46A612E94482E8CB5E48824E3E157C62D695D77775BEE36CA2A64A31ED0012157BDC1CEDAFDD35CD809C227A4CE811759B122BD5EDF7B4E2B1A6CB86C5B4E3429CCB570F0A0D3, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
USE [master]
GO
ALTER DATABASE [CarProject] SET  READ_WRITE 
GO
