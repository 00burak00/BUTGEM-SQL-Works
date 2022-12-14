USE [OKULBUTGEM]
GO
/****** Object:  Table [dbo].[Bolum]    Script Date: 5.06.2022 00:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bolum](
	[Bolumkod] [int] NOT NULL,
	[BolumAd] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Bolumkod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dersler]    Script Date: 5.06.2022 00:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dersler](
	[dersNo] [int] NOT NULL,
	[DersAdi] [nvarchar](30) NOT NULL,
	[H_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[dersNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hocalar]    Script Date: 5.06.2022 00:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hocalar](
	[HNo] [int] NOT NULL,
	[Htc] [decimal](18, 0) NOT NULL,
	[Had] [nvarchar](40) NOT NULL,
	[Hsoyad] [nvarchar](30) NOT NULL,
	[HDtarihi] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notlar]    Script Date: 5.06.2022 00:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notlar](
	[S_no] [int] NOT NULL,
	[Ogr_id] [int] NOT NULL,
	[ders_id] [int] NOT NULL,
	[vize] [int] NOT NULL,
	[final] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[S_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ogrenciler]    Script Date: 5.06.2022 00:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ogrenciler](
	[OgrNo] [int] NOT NULL,
	[ogrTc] [decimal](18, 0) NOT NULL,
	[ogrAd] [nvarchar](20) NOT NULL,
	[OgrSoyad] [nvarchar](20) NOT NULL,
	[bolumid] [int] NOT NULL,
	[OgrDtarih] [date] NOT NULL,
	[Yabanci_dil] [nvarchar](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[OgrNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ogrTc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dersler]  WITH CHECK ADD FOREIGN KEY([H_id])
REFERENCES [dbo].[Hocalar] ([HNo])
GO
ALTER TABLE [dbo].[Notlar]  WITH CHECK ADD FOREIGN KEY([ders_id])
REFERENCES [dbo].[Dersler] ([dersNo])
GO
ALTER TABLE [dbo].[Notlar]  WITH CHECK ADD FOREIGN KEY([Ogr_id])
REFERENCES [dbo].[Ogrenciler] ([OgrNo])
GO
ALTER TABLE [dbo].[Ogrenciler]  WITH CHECK ADD FOREIGN KEY([bolumid])
REFERENCES [dbo].[Bolum] ([Bolumkod])
GO
ALTER TABLE [dbo].[Notlar]  WITH CHECK ADD CHECK  (([final]>=(50)))
GO
