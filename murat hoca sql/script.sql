USE [OgrenciDatabase]
GO
/****** Object:  Table [dbo].[Bolum]    Script Date: 23.04.2022 13:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bolum](
	[BolumNo] [int] NOT NULL,
	[BolumAdi] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BolumNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ders]    Script Date: 23.04.2022 13:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ders](
	[DersNo] [int] NOT NULL,
	[DersAdi] [nvarchar](15) NOT NULL,
	[DersKredi] [int] NOT NULL,
	[BolumNo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DersNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ogrenci]    Script Date: 23.04.2022 13:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ogrenci](
	[OgrenciNo] [int] NOT NULL,
	[OgrenciAdi] [nvarchar](20) NOT NULL,
	[OgrenciSoyadi] [nvarchar](20) NOT NULL,
	[OgrenciTel] [nvarchar](20) NOT NULL,
	[OgrenciAdres] [nvarchar](20) NOT NULL,
	[BolumNo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OgrenciNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Puan]    Script Date: 23.04.2022 13:10:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puan](
	[OgrenciNo] [int] NOT NULL,
	[DersNo] [int] NOT NULL,
	[VizePuan] [int] NOT NULL,
	[FinalPuan] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ders]  WITH CHECK ADD FOREIGN KEY([BolumNo])
REFERENCES [dbo].[Bolum] ([BolumNo])
GO
ALTER TABLE [dbo].[Ogrenci]  WITH CHECK ADD FOREIGN KEY([BolumNo])
REFERENCES [dbo].[Bolum] ([BolumNo])
GO
ALTER TABLE [dbo].[Puan]  WITH CHECK ADD FOREIGN KEY([DersNo])
REFERENCES [dbo].[Ders] ([DersNo])
GO
ALTER TABLE [dbo].[Puan]  WITH CHECK ADD FOREIGN KEY([OgrenciNo])
REFERENCES [dbo].[Ogrenci] ([OgrenciNo])
GO
