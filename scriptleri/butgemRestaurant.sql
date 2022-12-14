USE [butgemRestaurant]
GO
/****** Object:  Table [dbo].[Ilce]    Script Date: 5.06.2022 00:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ilce](
	[ilceId] [int] NOT NULL,
	[tanim] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ilceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ilTablo]    Script Date: 5.06.2022 00:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ilTablo](
	[ilId] [int] NOT NULL,
	[tanim] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ilId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mekanlar]    Script Date: 5.06.2022 00:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mekanlar](
	[mekanId] [int] NOT NULL,
	[mekanAdi] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[mekanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[musteriler]    Script Date: 5.06.2022 00:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[musteriler](
	[musteriId] [int] NOT NULL,
	[musteriAd] [nvarchar](20) NOT NULL,
	[musteriSoyad] [nvarchar](20) NOT NULL,
	[rezarvasyonId] [int] NOT NULL,
	[musteriMail] [nvarchar](50) NOT NULL,
	[Acıklama] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[musteriId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mutfaklar]    Script Date: 5.06.2022 00:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mutfaklar](
	[mutfakId] [int] NOT NULL,
	[tanim] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[mutfakId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rezervasyon]    Script Date: 5.06.2022 00:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rezervasyon](
	[rezarvasyonId] [int] NOT NULL,
	[rezarvasyonTarihi] [date] NOT NULL,
	[rezarvasyonSaati] [datetime] NOT NULL,
	[kisiSayisi] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[rezarvasyonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yerSecimi]    Script Date: 5.06.2022 00:25:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yerSecimi](
	[yerSecimId] [int] NOT NULL,
	[ilId] [int] NOT NULL,
	[ilceId] [int] NOT NULL,
	[mutfakId] [int] NOT NULL,
	[mekanId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[yerSecimId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[musteriler]  WITH CHECK ADD FOREIGN KEY([rezarvasyonId])
REFERENCES [dbo].[rezervasyon] ([rezarvasyonId])
GO
