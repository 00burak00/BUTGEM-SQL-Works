USE [ornekler]
GO
/****** Object:  Table [dbo].[active]    Script Date: 5.06.2022 00:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[active](
	[uyeid] [int] NULL,
	[akodu] [nchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[altkategoriler]    Script Date: 5.06.2022 00:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[altkategoriler](
	[altkateno] [smallint] IDENTITY(1,1) NOT NULL,
	[altkateadi] [nvarchar](50) NOT NULL,
	[anakateno] [tinyint] NOT NULL,
 CONSTRAINT [PK_altkategoriler] PRIMARY KEY CLUSTERED 
(
	[altkateno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favoriler]    Script Date: 5.06.2022 00:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favoriler](
	[favno] [bigint] IDENTITY(1,1) NOT NULL,
	[uyeid] [int] NOT NULL,
	[urunid] [int] NOT NULL,
 CONSTRAINT [PK_favoriler] PRIMARY KEY CLUSTERED 
(
	[favno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kategoriler]    Script Date: 5.06.2022 00:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kategoriler](
	[kateno] [tinyint] IDENTITY(1,1) NOT NULL,
	[kateadi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_kategoriler] PRIMARY KEY CLUSTERED 
(
	[kateno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[meslek]    Script Date: 5.06.2022 00:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[meslek](
	[meslekid] [smallint] IDENTITY(1,1) NOT NULL,
	[meslekad] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_meslek] PRIMARY KEY CLUSTERED 
(
	[meslekid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sehirler]    Script Date: 5.06.2022 00:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sehirler](
	[plaka] [tinyint] NOT NULL,
	[sehiradi] [nvarchar](15) NOT NULL,
 CONSTRAINT [PK_sehirler] PRIMARY KEY CLUSTERED 
(
	[plaka] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[siparisler]    Script Date: 5.06.2022 00:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[siparisler](
	[uyeid] [int] NOT NULL,
	[urunid] [int] NOT NULL,
	[adet] [smallint] NOT NULL,
	[sip_tarihi] [smalldatetime] NOT NULL,
	[sipno] [int] NOT NULL,
	[kayitno] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_siparisler] PRIMARY KEY CLUSTERED 
(
	[kayitno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[toplam_kazan]    Script Date: 5.06.2022 00:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[toplam_kazan](
	[sipno] [int] NOT NULL,
	[toplamfiy] [float] NOT NULL,
	[sip_tarihi] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[urunler]    Script Date: 5.06.2022 00:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[urunler](
	[urunid] [int] IDENTITY(1,1) NOT NULL,
	[urunadi] [nvarchar](50) NOT NULL,
	[fiyat] [float] NOT NULL,
	[aciklama] [nvarchar](2000) NULL,
	[resim] [nvarchar](50) NULL,
	[kateno] [tinyint] NOT NULL,
 CONSTRAINT [PK_urunler] PRIMARY KEY CLUSTERED 
(
	[urunid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[uyeler]    Script Date: 5.06.2022 00:35:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[uyeler](
	[uyeid] [int] IDENTITY(1,1) NOT NULL,
	[kuladi] [nvarchar](30) NOT NULL,
	[sifre] [nvarchar](20) NOT NULL,
	[adsoyad] [nvarchar](50) NOT NULL,
	[dogtar] [smalldatetime] NOT NULL,
	[cinsiyet] [bit] NOT NULL,
	[adres] [nvarchar](400) NULL,
	[plaka] [tinyint] NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[meslekid] [smallint] NOT NULL,
	[onay] [bit] NULL,
 CONSTRAINT [PK_uyeler] PRIMARY KEY CLUSTERED 
(
	[uyeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uk_uyeler_email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uk_uyeler_kuladi] UNIQUE NONCLUSTERED 
(
	[kuladi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[uyeler] ADD  CONSTRAINT [DF_uyeler_onay]  DEFAULT ((0)) FOR [onay]
GO
ALTER TABLE [dbo].[altkategoriler]  WITH CHECK ADD  CONSTRAINT [FK_altkategoriler_kategoriler] FOREIGN KEY([anakateno])
REFERENCES [dbo].[kategoriler] ([kateno])
GO
ALTER TABLE [dbo].[altkategoriler] CHECK CONSTRAINT [FK_altkategoriler_kategoriler]
GO
ALTER TABLE [dbo].[favoriler]  WITH CHECK ADD  CONSTRAINT [FK_favoriler_urunler] FOREIGN KEY([urunid])
REFERENCES [dbo].[urunler] ([urunid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[favoriler] CHECK CONSTRAINT [FK_favoriler_urunler]
GO
ALTER TABLE [dbo].[favoriler]  WITH CHECK ADD  CONSTRAINT [FK_favoriler_uyeler] FOREIGN KEY([uyeid])
REFERENCES [dbo].[uyeler] ([uyeid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[favoriler] CHECK CONSTRAINT [FK_favoriler_uyeler]
GO
ALTER TABLE [dbo].[siparisler]  WITH CHECK ADD  CONSTRAINT [FK_siparisler_urunler] FOREIGN KEY([urunid])
REFERENCES [dbo].[urunler] ([urunid])
GO
ALTER TABLE [dbo].[siparisler] CHECK CONSTRAINT [FK_siparisler_urunler]
GO
ALTER TABLE [dbo].[siparisler]  WITH CHECK ADD  CONSTRAINT [FK_siparisler_uyeler] FOREIGN KEY([uyeid])
REFERENCES [dbo].[uyeler] ([uyeid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[siparisler] CHECK CONSTRAINT [FK_siparisler_uyeler]
GO
ALTER TABLE [dbo].[urunler]  WITH CHECK ADD  CONSTRAINT [FK_urunler_kategoriler] FOREIGN KEY([kateno])
REFERENCES [dbo].[kategoriler] ([kateno])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[urunler] CHECK CONSTRAINT [FK_urunler_kategoriler]
GO
ALTER TABLE [dbo].[uyeler]  WITH CHECK ADD  CONSTRAINT [FK_uyeler_meslek1] FOREIGN KEY([meslekid])
REFERENCES [dbo].[meslek] ([meslekid])
GO
ALTER TABLE [dbo].[uyeler] CHECK CONSTRAINT [FK_uyeler_meslek1]
GO
ALTER TABLE [dbo].[uyeler]  WITH CHECK ADD  CONSTRAINT [FK_uyeler_sehirler1] FOREIGN KEY([plaka])
REFERENCES [dbo].[sehirler] ([plaka])
GO
ALTER TABLE [dbo].[uyeler] CHECK CONSTRAINT [FK_uyeler_sehirler1]
GO
ALTER TABLE [dbo].[sehirler]  WITH CHECK ADD  CONSTRAINT [CK_sehirler] CHECK  (([plaka]>(0)))
GO
ALTER TABLE [dbo].[sehirler] CHECK CONSTRAINT [CK_sehirler]
GO
