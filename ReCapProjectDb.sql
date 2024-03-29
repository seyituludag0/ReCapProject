USE [CarProject]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 27.04.2021 16:44:32 ******/
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
/****** Object:  Table [dbo].[CardDetails]    Script Date: 27.04.2021 16:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Cvv] [int] NOT NULL,
	[ExpirationDate] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[CardNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CardDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarImages]    Script Date: 27.04.2021 16:44:32 ******/
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
/****** Object:  Table [dbo].[Cars]    Script Date: 27.04.2021 16:44:32 ******/
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
	[MinFindex] [int] NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Colors]    Script Date: 27.04.2021 16:44:32 ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 27.04.2021 16:44:32 ******/
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
/****** Object:  Table [dbo].[OperationClaims]    Script Date: 27.04.2021 16:44:32 ******/
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
/****** Object:  Table [dbo].[Payments]    Script Date: 27.04.2021 16:44:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CardNumber] [nvarchar](50) NULL,
	[Cvv] [int] NULL,
	[ExpirationDate] [nvarchar](50) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rentals]    Script Date: 27.04.2021 16:44:32 ******/
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
/****** Object:  Table [dbo].[UserOperationClaims]    Script Date: 27.04.2021 16:44:32 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 27.04.2021 16:44:32 ******/
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
	[Findex] [int] NOT NULL,
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
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (5, N'Wolksvagen')
SET IDENTITY_INSERT [dbo].[Brands] OFF
SET IDENTITY_INSERT [dbo].[CardDetails] ON 

INSERT [dbo].[CardDetails] ([Id], [UserId], [Cvv], [ExpirationDate], [FirstName], [LastName], [CardNumber]) VALUES (1, 1, 123, N'12/21', N'Seyit', N'Uludağ', N'63944739480365842')
INSERT [dbo].[CardDetails] ([Id], [UserId], [Cvv], [ExpirationDate], [FirstName], [LastName], [CardNumber]) VALUES (2, 4009, 254, N'20/24', N'Ali', N'Veli', N'1234567890123456')
INSERT [dbo].[CardDetails] ([Id], [UserId], [Cvv], [ExpirationDate], [FirstName], [LastName], [CardNumber]) VALUES (3, 2, 394, N'20/10', N'Ezgi', N'Uludag', N'3944394439443944')
INSERT [dbo].[CardDetails] ([Id], [UserId], [Cvv], [ExpirationDate], [FirstName], [LastName], [CardNumber]) VALUES (1003, 1, 258, N'20/24', N'Burak', N'Tağıl', N'3672653658636823')
SET IDENTITY_INSERT [dbo].[CardDetails] OFF
SET IDENTITY_INSERT [dbo].[CarImages] ON 

INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1, 1, N'103d9192-cd2d-4dfc-81af-9b634d06ff5b_4_20_2021.png', CAST(N'2021-04-20T01:41:15.067' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (2, 2, N'31114c9f-c9ba-441b-bfb9-03b7f82ea947_4_20_2021.png', CAST(N'2021-04-20T01:46:59.830' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (3, 3, N'5e2dda83-a982-40ca-85ca-9fe7c30d9f4e_4_20_2021.png', CAST(N'2021-04-20T02:02:31.057' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (4, 4, N'782ee88d-861b-40be-aceb-a3efa56e9b7f_4_20_2021.png', CAST(N'2021-04-20T02:18:07.770' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (5, 5, N'98089452-8956-47ec-b333-5c6888e7f2b6_4_20_2021.png', CAST(N'2021-04-20T02:21:23.817' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (6, 6, N'bb96893f-03c0-4766-9585-bf2c05191239_4_20_2021.png', CAST(N'2021-04-20T02:22:32.357' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (7, 8, N'841af894-98fb-4c21-b167-807525118fad_4_20_2021.png', CAST(N'2021-04-20T02:23:22.833' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (8, 9, N'4f1cf624-2634-44d2-acb5-d999e708a23c_4_20_2021.png', CAST(N'2021-04-20T02:26:06.820' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (9, 1, N'c571721a-57be-4af5-bf72-af11a87706dc_4_20_2021.png', CAST(N'2021-04-20T02:44:00.820' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (10, 1, N'f3aefacd-8e3d-48e6-99f1-56c9c40987f6_4_20_2021.png', CAST(N'2021-04-20T02:44:13.140' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (11, 1, N'3047e3fd-bda3-432f-b61e-3c99bd2952c4_4_20_2021.png', CAST(N'2021-04-20T02:44:18.847' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (12, 1, N'a6710f4a-236f-40e9-a1ba-74bc8a444c58_4_20_2021.png', CAST(N'2021-04-20T02:44:24.597' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (13, 2, N'007dff9e-eb1e-41bf-89f1-17051d92af94_4_20_2021.jpg', CAST(N'2021-04-20T02:52:34.237' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (14, 2, N'9c7406df-f1fd-4324-9981-c9bbad747333_4_20_2021.png', CAST(N'2021-04-20T02:52:45.423' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (15, 2, N'932d0234-7de2-4bd8-a48b-c830ba7558f1_4_20_2021.jpg', CAST(N'2021-04-20T02:52:56.033' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (16, 2, N'42dd49c2-d95d-46bd-b668-20820d79e4fa_4_20_2021.png', CAST(N'2021-04-20T02:53:03.487' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (17, 3, N'b642733d-ac26-435f-9d22-b99f4c6f50b2_4_20_2021.png', CAST(N'2021-04-20T03:05:23.553' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (18, 3, N'36ad4591-140d-4d1c-9794-07d772ce93d2_4_20_2021.png', CAST(N'2021-04-20T03:05:32.613' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (19, 3, N'6253b9a5-97e5-4b52-83aa-095ad508cb7b_4_20_2021.png', CAST(N'2021-04-20T03:05:38.140' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (20, 3, N'd3cfdbb8-b94e-4c67-bd72-82b0b9b02fe3_4_20_2021.png', CAST(N'2021-04-20T03:05:45.170' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (21, 4, N'10ab418c-14b6-49d8-b909-29fd77f553a1_4_20_2021.png', CAST(N'2021-04-20T03:08:29.847' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (22, 4, N'5ac0f68b-edec-46a2-8fbe-17b65c61a087_4_20_2021.png', CAST(N'2021-04-20T03:08:36.977' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (23, 4, N'9759c22a-c32b-4f6d-9cbc-834e83d5fa49_4_20_2021.png', CAST(N'2021-04-20T03:09:11.007' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (24, 4, N'dbd7757f-125c-48dd-8d35-058d17b14510_4_20_2021.png', CAST(N'2021-04-20T03:09:18.363' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (25, 5, N'ea77886f-530b-40ec-b8a1-f213095932e3_4_20_2021.png', CAST(N'2021-04-20T03:10:33.020' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (26, 5, N'f06c6cea-b1d3-469a-bb10-3f3f56fe0173_4_20_2021.png', CAST(N'2021-04-20T03:10:38.547' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (27, 5, N'3ce83507-02f4-4168-ab62-d883bdf68d05_4_20_2021.png', CAST(N'2021-04-20T03:10:45.820' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (28, 6, N'6b443c03-b8d3-4aff-b75c-9607ed4d67bd_4_20_2021.png', CAST(N'2021-04-20T03:11:20.987' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (29, 6, N'e3852733-e579-4fd4-b00a-4501f366fe72_4_20_2021.png', CAST(N'2021-04-20T03:11:48.953' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (30, 6, N'41393032-7693-42f8-b347-40309b45b932_4_20_2021.png', CAST(N'2021-04-20T03:11:54.323' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (31, 8, N'ade296ba-c468-495c-991e-85bfa2a36f83_4_20_2021.png', CAST(N'2021-04-20T03:13:46.970' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (32, 8, N'a384a1ac-e135-448b-9480-032f079ea346_4_20_2021.png', CAST(N'2021-04-20T03:13:56.333' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (33, 8, N'7d64af15-81b0-450f-a684-cd4a2938bf87_4_20_2021.png', CAST(N'2021-04-20T03:14:02.953' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (34, 9, N'9083e905-3456-46e8-9e43-c5f340dd2bac_4_20_2021.png', CAST(N'2021-04-20T03:15:13.020' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (35, 9, N'ec69ac55-ec3d-458d-aa9b-2610b7317c87_4_20_2021.png', CAST(N'2021-04-20T03:15:21.837' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (36, 9, N'1e0b9aba-130f-409e-8000-39948c406723_4_20_2021.png', CAST(N'2021-04-20T03:15:26.367' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (37, 9, N'f764c077-ff80-4ed2-b804-d8aeb61fd427_4_20_2021.png', CAST(N'2021-04-20T03:15:35.257' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1004, 11, N'f64bca0c-f9ea-41ef-bc05-8ef35e471473_4_20_2021.png', CAST(N'2021-04-20T06:19:20.820' AS DateTime))
SET IDENTITY_INSERT [dbo].[CarImages] OFF
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description], [MinFindex]) VALUES (1, 1, 3, N'A3 Sedan', N'Mavi', 2020, CAST(250 AS Decimal(18, 0)), N'Audi A3 Sedan', 200)
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description], [MinFindex]) VALUES (2, 1, 1, N'Q2', N'Siyah', 2019, CAST(320 AS Decimal(18, 0)), N'Audi Q2', 250)
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description], [MinFindex]) VALUES (3, 2, 2, N'Z4', N'Beyaz', 2019, CAST(370 AS Decimal(18, 0)), N'BMW Z4', 260)
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description], [MinFindex]) VALUES (4, 2, 6, N'i8', N'Gri', 2020, CAST(300 AS Decimal(18, 0)), N'BMW i8', 250)
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description], [MinFindex]) VALUES (5, 3, 1, N'GT-COUPE', N'Siyah', 2021, CAST(475 AS Decimal(18, 0)), N'Mercedes GT-COUPE', 450)
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description], [MinFindex]) VALUES (6, 3, 5, N'CLA-180', N'Kımızı', 2018, CAST(250 AS Decimal(18, 0)), N'Mercedes CLA-180', 200)
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description], [MinFindex]) VALUES (7, 4, 8, N'RCZ', N'Sarı', 2019, CAST(200 AS Decimal(18, 0)), N'Pegeout RCZ ', 200)
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description], [MinFindex]) VALUES (8, 4, 3, N'SUV-3008', N'Mavi', 2019, CAST(290 AS Decimal(18, 0)), N'Pegeout SUV-3008', 285)
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description], [MinFindex]) VALUES (9, 5, 2, N'Golf', N'Beyaz', 2018, CAST(140 AS Decimal(18, 0)), N'Wolksvagen Golf', 250)
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description], [MinFindex]) VALUES (10, 1, 1, N'Deneme', N'Deneme', 2021, CAST(300 AS Decimal(18, 0)), N'Deneme', 0)
SET IDENTITY_INSERT [dbo].[Cars] OFF
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([Id], [Name]) VALUES (1, N'Siyah')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (2, N'Beyaz')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (3, N'Mavi')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (5, N'Kırmızı')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (6, N'Gri')
SET IDENTITY_INSERT [dbo].[Colors] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (4, 1, N'Car Rental')
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (5, 2, N'ULUDAG HOLDİNG A.Ş')
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (1007, 1002, N'Benim Holdingim')
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (4004, 1, N'Deneme')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[OperationClaims] ON 

INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (1, N'admin')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (2, N'add')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (3, N'update')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (4, N'delete')
SET IDENTITY_INSERT [dbo].[OperationClaims] OFF
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([Id], [CardNumber], [Cvv], [ExpirationDate], [FirstName], [LastName]) VALUES (1, N'3456545654354543', 921, N'12/21', N'Seyit', N'Uludag')
INSERT [dbo].[Payments] ([Id], [CardNumber], [Cvv], [ExpirationDate], [FirstName], [LastName]) VALUES (2, N'3944394439443944', 394, N'20/10', N'Ezgi', N'Uludag')
SET IDENTITY_INSERT [dbo].[Payments] OFF
SET IDENTITY_INSERT [dbo].[Rentals] ON 

INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (7003, 2, 5, CAST(N'2021-04-23T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (8002, 3, 4, CAST(N'2021-04-26T00:00:00.000' AS DateTime), CAST(N'2021-04-30T00:00:00.000' AS DateTime))
INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (9002, 1, 5, CAST(N'2021-04-26T00:00:00.000' AS DateTime), CAST(N'2021-04-27T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rentals] OFF
SET IDENTITY_INSERT [dbo].[UserOperationClaims] ON 

INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (1, 1, 1)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (2, 1, 2)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (3, 1, 3)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (4, 1, 4)
SET IDENTITY_INSERT [dbo].[UserOperationClaims] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status], [Findex]) VALUES (1, N'seyit', N'uludag', N'seyit@seyit.com', 0xBB322D4C9E34F14A8A1C4A9C52ACCCFE986B090781B0474E3A5C04614E75E95A90F1DDD1C4164F1C8331EF9044ABC404A8F0259982FC4975D9AD10996807C4BE, 0x18368490E67E7BFD29F64D3A7ACCB558EF223DBC7FD9FD8C64446CFBB794C1E31A71233AD753D9D3F882276BF69450E1A9BFF526B6BE56BB52444FA2CA4785A1B4462A4948006EAA5731BB7FBA7B980FB17B43B6DC6C08160D543C6CED57D001442FBCE97F41F9EBAE6C6B01610B2114D75A6D77BEC823DCCBFCDCAC546CC8F2, 1, 1249)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status], [Findex]) VALUES (2, N'Ezgi', N'Uludag', N'ezgiuludag0@gmail.com', 0x3D91CAC6E027601BBBE0C5464C6DA90F95B83125FF2AF4A3F9C2831C1874F78EA4F71087AD83D6334464DEED49CF066119499133D9F096DF0300381D2D2A9A1B, 0x3428FC4636E3AE10DF1553F2397ED7D56864B6BCD5E5050F3A625D945BE705C36484DF6257EC165232CBBAC874CCAC91924B00B91D3F550FA696543DCB41E39E4312D01A13B586359663F363A10099A284E854D588C971A013C077ADE0DA66336A3CD25D00FC5F6D89CD279C65E15ACAA1C498A981880C597433EE683441CEDD, 1, 1400)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status], [Findex]) VALUES (1002, N'Ahmet', N'Kaya', N'ahmet@kaya.com', 0x5CF45907B99DD276C1B75883A735C92E5B86E8913A3DFF79AB337CEB96FD04F453BC49004976C54706C1ED9DA0BEB0086E64D805E2C6B60998738D723C40896B, 0x9BC9ECED1C45A93149A8A3102058ABCE389352A03670B4DEAAD178CB377F855DBE5F6D80FC658A55E7D5B5618255B119249D8C98C2A35720FFED826D90D2DF6F8BAB193B60ADB08D214F3DE312383C9FB7E842825575C135330264FB11A2ED237034C7008C6505D8597EF282ECEB08FCC4B590FE09B83DBC94744F8911D84A31, 1, 200)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status], [Findex]) VALUES (2002, N'Seyit', N'Uludag', N'seyituludag@gmail.com', 0xB17E68380B15DD4272811669CB1DB86CF865BA7BF7F5190B0B80F984240858BC2E446FE1CD77C5E574001A60172F84BAAEFC5D8D615213A6B5190C5FDEBE52BC, 0xD3CD0241859B9FC02073027D7CD621F64D56E32FA02F8C91182176E3EA84FFE68783F60700B7362CB642E08CE768DBE26ABDCA58AFB46633DE679068D0405EE6C3AA35BA4BFAA8BDC22A29B5C80C9F8AA94FB239B3E1794D7646F496CE85CB753830D4A98E04A853E8BA858E970B57E30F05A2F772F1A383E6F5387B40C8B5CE, 1, 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status], [Findex]) VALUES (3002, N'asdada', N'dasdas', N'adas@s.com', 0xA41D989694DAE1E9A0E116B4A8C9EFA13BD68406CDD0FBFA9A226944BA22F17FD6EB59ED9B4113BFF12CD6EA9F1337392A3E869765E84AF23D395EAFF052F103, 0x5C7625DA83B47C075694BD281912243E819257EA20B283CBC29AE76B1178BD0F5935C8F234481A415D8F9AC5BA20BCFD1110473E378DFE56C7F37896A039C708D51841748536210B4E9BC0D95C3096D1E15138A2A30A75FFFDCCCBA38B6DBD1300D835DDEE4DECFBEB8BC47869CA430DAC15316962C40616C1D6ED8EBBDBB90D, 1, 0)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status], [Findex]) VALUES (3003, N'Seyit', N'Uludag', N'seyituludag0@gmail.com', 0xB5DAA097E558175B4BCAE496746DDECC264C042B7D16991702A374CB8C5A19979B0062C7E6D5323327C25A83FB0A73B1966322B5ED7D5CF140DA5F380E989478, 0x09441A60C74070CA589A03BB31135AA7818DD15751C5B4C321EB01DDF51D0983F9D52FF51E6DDB96F9C57B59AF49F41569AFA5FCD802420775E41D828F0D51AC146476FACA1B17F22D742A359936872E5AC1272B79B2BD7400F1C72F5A3D9BDEC2A56443520C2300EC45833A00FF073FF36EC82177830959455C7ED2DA985448, 1, 200)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status], [Findex]) VALUES (4002, N'Seyit', N'Uludag', N'seyituludag00@gmail.com', 0xB4B90166588A70E43412FD3E567E99DC16D4D1F6E4CBB6641B2212CF989D7317F23590736AA3723162C75828A2EDD6257B64F343744A7729D3CDB3B9243CDA0E, 0x907DBEDA852F8D7ED954E2BCC2C3F57DF1F4406F2C24E0E735FD5086A65A1999D886F2CA25F6DAD0B46496DB545EF235E53B4390EB4DFCE37F4FB99C77FD776C88E5AACCD6540277AE11575F3B732BB8E148D30FFADD5B147F626C2BCFB9D1B92024C670ED212A8BAEE6C4ED85C625EB971A393F98540DEDFDB6C73F61CDA6F2, 1, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Cars] ADD  CONSTRAINT [DF__Cars__MinFindex__1A9EF37A]  DEFAULT ((0)) FOR [MinFindex]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF__Users__Findex__1B9317B3]  DEFAULT ((0)) FOR [Findex]
GO
