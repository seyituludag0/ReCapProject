USE [CarProject]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 1.04.2021 13:36:33 ******/
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
/****** Object:  Table [dbo].[CarImages]    Script Date: 1.04.2021 13:36:33 ******/
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
/****** Object:  Table [dbo].[Cars]    Script Date: 1.04.2021 13:36:33 ******/
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
/****** Object:  Table [dbo].[Colors]    Script Date: 1.04.2021 13:36:33 ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 1.04.2021 13:36:33 ******/
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
/****** Object:  Table [dbo].[OperationClaims]    Script Date: 1.04.2021 13:36:33 ******/
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
/****** Object:  Table [dbo].[Rentals]    Script Date: 1.04.2021 13:36:33 ******/
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
/****** Object:  Table [dbo].[UserOperationClaims]    Script Date: 1.04.2021 13:36:33 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 1.04.2021 13:36:33 ******/
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
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (6, N'Honda')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (8, N'FIAT')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (3001, N'Volvo')
SET IDENTITY_INSERT [dbo].[Brands] OFF
SET IDENTITY_INSERT [dbo].[CarImages] ON 

INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (1, 1, N'15794d50-bda0-4e3a-9a8f-27ca6351a9b4_3_30_2021.png', CAST(N'2021-03-30T22:57:39.943' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (2, 1, N'01dc260b-99c6-4387-82b6-9324281c294a_3_30_2021.png', CAST(N'2021-03-30T22:59:53.740' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (3, 1, N'c4337c07-e256-4e2b-8fb4-5049740730cf_3_30_2021.png', CAST(N'2021-03-30T23:00:28.140' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (4, 1, N'e6f65cd7-0415-4362-ae9a-a16936caa366_3_30_2021.png', CAST(N'2021-03-30T23:00:38.547' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (5, 1, N'3a07e46e-670a-48c5-86f6-599a17cc19dc_3_30_2021.png', CAST(N'2021-03-30T23:01:02.160' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (6, 2, N'6ed2b108-ad5f-4db0-82ba-6b1c9a1d0047_3_30_2021.jpg', CAST(N'2021-03-30T23:02:00.257' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (7, 2, N'288a8e2b-af0e-4c5f-94e6-97c71b286d2c_3_30_2021.png', CAST(N'2021-03-30T23:02:09.133' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (8, 2, N'3164843f-ec1e-4d54-9959-309fea3960c8_3_30_2021.png', CAST(N'2021-03-30T23:02:16.957' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (9, 2, N'fd8ce5c3-cd4e-4248-aa64-e60d589cdd95_3_30_2021.png', CAST(N'2021-03-30T23:02:44.463' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (10, 2, N'f0dcef3f-aec8-46d5-bcab-e873c98e4706_3_30_2021.png', CAST(N'2021-03-30T23:02:55.173' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (11, 3, N'f4ad94c3-25e3-4519-8b05-42834938f690_3_30_2021.png', CAST(N'2021-03-30T23:04:06.560' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (12, 3, N'4c2f57df-6e38-4b8f-8aff-4ec616006fe4_3_30_2021.png', CAST(N'2021-03-30T23:04:21.407' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (13, 3, N'5ed942ea-f39d-469e-a3b4-7e3c83e0e950_3_30_2021.png', CAST(N'2021-03-30T23:04:31.690' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (14, 3, N'899ddc16-4000-4d1c-9c36-d1cf963a6db5_3_30_2021.jpg', CAST(N'2021-03-30T23:04:41.323' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (15, 3, N'f2ac7077-d35c-48fd-8fe2-bb06523d946e_3_30_2021.png', CAST(N'2021-03-30T23:04:50.620' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (16, 4, N'8fd39b37-db7a-4d7a-9647-8cfc3aa0181f_3_30_2021.png', CAST(N'2021-03-30T23:17:37.843' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (17, 4, N'e56c4519-669b-4623-9852-44df2075016d_3_30_2021.png', CAST(N'2021-03-30T23:17:45.193' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (18, 4, N'6009b3ce-8857-46de-8660-4fe3786992c5_3_30_2021.png', CAST(N'2021-03-30T23:17:50.370' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (19, 4, N'e4c8d306-9b52-4cac-b584-fc54aab7c0ff_3_30_2021.png', CAST(N'2021-03-30T23:18:16.177' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (20, 4, N'5ec2e42c-81dd-47e1-93d6-da19d876601b_3_30_2021.png', CAST(N'2021-03-30T23:18:22.617' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (21, 5, N'c938c334-b0c4-4ae0-8903-2bdca41d63f9_3_30_2021.png', CAST(N'2021-03-30T23:53:23.347' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (22, 5, N'22898121-5f17-48ca-beda-d9bd385cdc14_3_30_2021.png', CAST(N'2021-03-30T23:53:33.583' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (23, 5, N'b7c880fd-df1e-4614-b2ce-08a9a578de43_3_30_2021.png', CAST(N'2021-03-30T23:53:42.680' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (24, 5, N'1452e952-645b-4749-b3fd-5ffcc6def6fb_3_30_2021.png', CAST(N'2021-03-30T23:53:51.230' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (25, 5, N'52b90129-45ba-4d2d-97a8-7ab949ef98b0_3_30_2021.png', CAST(N'2021-03-30T23:54:02.703' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (26, 6, N'5a9b9d82-83e8-4d4d-94a9-9ef6ff08b383_3_30_2021.png', CAST(N'2021-03-30T23:55:25.903' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (27, 6, N'9637f7e7-cbea-4ec1-b750-1985f7b53b35_3_30_2021.png', CAST(N'2021-03-30T23:55:34.880' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (28, 6, N'189e7bcd-1862-47e5-8963-90f8e7f92b37_3_30_2021.png', CAST(N'2021-03-30T23:55:39.783' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (29, 6, N'5515100e-6836-439e-b3ff-d56b90f9bf70_3_30_2021.png', CAST(N'2021-03-30T23:55:45.207' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (30, 6, N'aabe75fc-3d8d-4f5f-aa97-37f8bfe209d2_3_30_2021.png', CAST(N'2021-03-30T23:55:54.750' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (31, 7, N'4961e2a5-8b4f-47d5-bf39-167d47e7d300_3_30_2021.png', CAST(N'2021-03-30T23:56:49.417' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (32, 7, N'72520b2e-b900-462a-85b1-35380ec34044_3_30_2021.png', CAST(N'2021-03-30T23:56:54.787' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (33, 7, N'0e775b08-3707-46ab-8c8b-138ba7f57545_3_30_2021.png', CAST(N'2021-03-30T23:57:00.497' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (34, 7, N'bc9d1d56-3b24-4d22-bb3f-4c29adaa8592_3_30_2021.png', CAST(N'2021-03-30T23:57:07.807' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (35, 7, N'b740af94-f7ae-4a4a-9b4b-e8a5d0647e0d_3_30_2021.png', CAST(N'2021-03-30T23:57:30.003' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (36, 8, N'275c2371-669d-46ef-bcb4-0f703d65605f_3_30_2021.png', CAST(N'2021-03-30T23:57:59.337' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (37, 8, N'f010987a-1b00-4355-81ac-36658ef758d4_3_30_2021.png', CAST(N'2021-03-30T23:58:08.283' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (38, 8, N'184cafc2-93e7-414e-8e93-91fa49ce6e4f_3_30_2021.png', CAST(N'2021-03-30T23:58:15.990' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (39, 8, N'cc4e3e0a-e88c-4cb5-88a1-060d5a094fa8_3_30_2021.png', CAST(N'2021-03-30T23:58:21.290' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (40, 8, N'3daef147-54ee-4299-8984-e8bfd00577c7_3_30_2021.png', CAST(N'2021-03-30T23:58:28.470' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (41, 9, N'99dca075-479c-4715-98d8-7497e48b136f_3_31_2021.png', CAST(N'2021-03-31T00:00:28.983' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (42, 9, N'46788128-ee3f-4817-9670-e80c756aa842_3_31_2021.png', CAST(N'2021-03-31T00:01:37.213' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (43, 9, N'352e2456-0ebd-4bc9-b4cb-2b51ae2623aa_3_31_2021.png', CAST(N'2021-03-31T00:01:42.313' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (44, 9, N'e627bf09-9a3d-4796-8081-fd47f93c3e98_3_31_2021.png', CAST(N'2021-03-31T00:01:50.130' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (45, 9, N'2c42a9e4-18e4-48e1-8803-07af9ddbdb45_3_31_2021.png', CAST(N'2021-03-31T00:01:56.953' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (46, 10, N'0ff91892-dd13-49e5-b23f-a5b56db169b1_3_31_2021.png', CAST(N'2021-03-31T00:02:50.950' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (47, 10, N'6bb1168b-a081-4792-9545-cc705fc5fc47_3_31_2021.png', CAST(N'2021-03-31T00:02:52.760' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (48, 10, N'390fba59-aa56-49f2-929b-11980db86e84_3_31_2021.png', CAST(N'2021-03-31T00:03:04.923' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (49, 10, N'5ac09503-cbe5-4083-b1bb-60cbbf683236_3_31_2021.png', CAST(N'2021-03-31T00:03:09.930' AS DateTime))
INSERT [dbo].[CarImages] ([Id], [CarId], [ImagePath], [Date]) VALUES (50, 10, N'a04c1020-603b-4a85-a33a-9bce91e1e340_3_31_2021.png', CAST(N'2021-03-31T00:03:14.150' AS DateTime))
SET IDENTITY_INSERT [dbo].[CarImages] OFF
SET IDENTITY_INSERT [dbo].[Cars] ON 

INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (1, 1, 7, N'A3', N'Sarı', 2015, CAST(500 AS Decimal(18, 0)), N'Yeni model')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (2, 1, 1, N'A8', N'Siyah', 200, CAST(500 AS Decimal(18, 0)), N'Temiz Araç')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (3, 2, 2, N'520i', N'Beyaz', 2015, CAST(500 AS Decimal(18, 0)), N'Temiz araç')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (4, 2, 6, N'i8', N'Gri', 2015, CAST(500 AS Decimal(18, 0)), N'Yeni model')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (5, 3, 1, N'GT-COUPE', N'Siyah', 2021, CAST(500 AS Decimal(18, 0)), N'Yeni model')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (6, 3, 5, N'CLA-180', N'Kırmızı', 2021, CAST(500 AS Decimal(18, 0)), N'Yeni model')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (7, 4, 7, N'RCZ', N'Sarı', 2021, CAST(500 AS Decimal(18, 0)), N'Yeni model')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (8, 4, 3, N'SUV 3008', N'Mavi', 2020, CAST(500 AS Decimal(18, 0)), N'Yeni model')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (9, 5, 4, N'Golf', N'Beyaz', 2021, CAST(500 AS Decimal(18, 0)), N'Modifiye yapıldı')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (10, 5, 2, N'Jetta', N'Gri', 2021, CAST(500 AS Decimal(18, 0)), N'Yeni model')
INSERT [dbo].[Cars] ([Id], [BrandId], [ColorId], [ModelName], [ColorName], [ModelYear], [DailyPrice], [Description]) VALUES (11, 6, 6, N'Civic', N'Gri', 2020, CAST(500 AS Decimal(18, 0)), N'Modifiye edildi')
SET IDENTITY_INSERT [dbo].[Cars] OFF
SET IDENTITY_INSERT [dbo].[Colors] ON 

INSERT [dbo].[Colors] ([Id], [Name]) VALUES (1, N'Siyah')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (2, N'Beyaz')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (3, N'Mavi')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (4, N'Yeşil')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (5, N'Kırmızı')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (6, N'Gri')
INSERT [dbo].[Colors] ([Id], [Name]) VALUES (7, N'Turkuaz')
SET IDENTITY_INSERT [dbo].[Colors] OFF
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (1, 1, N'Kodlama.io')
INSERT [dbo].[Customers] ([Id], [UserId], [CompanyName]) VALUES (2, 2, N'Rentals')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[OperationClaims] ON 

INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (1, N'admin')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (2, N'add')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (3, N'update')
INSERT [dbo].[OperationClaims] ([Id], [Name]) VALUES (4, N'delete')
SET IDENTITY_INSERT [dbo].[OperationClaims] OFF
SET IDENTITY_INSERT [dbo].[Rentals] ON 

INSERT [dbo].[Rentals] ([Id], [CarId], [CustomerId], [RentDate], [ReturnDate]) VALUES (8, 2, 2, CAST(N'2021-04-04T00:00:00.000' AS DateTime), CAST(N'2021-04-23T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Rentals] OFF
SET IDENTITY_INSERT [dbo].[UserOperationClaims] ON 

INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (1, 1, 1)
INSERT [dbo].[UserOperationClaims] ([Id], [UserId], [OperationClaimId]) VALUES (2, 1, 2)
SET IDENTITY_INSERT [dbo].[UserOperationClaims] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status]) VALUES (1, N'seyit', N'uludag', N'seyit@seyit.com', 0xE883ED93C06F9F48661CAC539ECD19CA2661D66D97CB64D8BCFAA6F8A97DFB9BE7D6C1087BE0EF0E60DCEB650D2D4BCCFDE6B93DF496809DAB3F68C00C8A8266, 0x59917054AE176F1F306F92CE358296B0A6A644180C4F9D45A5C2F7FC916291F9B80650DE5C7187835F4F090715E053CE66837507BFE9593CE62AF710EEE82978CB6CB2B752E595137DB4BD6733FF636C3B25A941E57F0566F5B0C551D5BC0DA4B29A32B581D4D36D285633AF027F5063A7142AA938EE11C6224489FD9B03B21E, 1)
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [Status]) VALUES (2, N'Ezgi', N'Uludag', N'ezgiuludag0@gmail.com', 0xF3E5B34CFCD49707103558113673F83D471AA5C3F55524E04FF1BBF739DD36D98D05CC33FF845123E50D21AB68482BFA7BE9A8C8C6AAB4F7D4C98F502E1F4263, 0xAE06639A432995B4947B35B5E31554189B5FE7DEE39A1ED39DC2352DC270EC8F41A03F212AF268F8CB81E72A03C9A1B5FE7391446F6B69FF4BD75FA44929DB2901AC1575CEA38F1B62C4C4D54E7AC5814695C35B2DE74AC513318D448D676FFBC1BC2975994122389E80629E2C83AF4948666E58A2CFD91BA0455814A347ED7B, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
