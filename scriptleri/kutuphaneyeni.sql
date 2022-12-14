USE [kutuphaneyeni]
GO
/****** Object:  Table [dbo].[anonimkitaplar]    Script Date: 5.06.2022 00:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[anonimkitaplar](
	[id] [int] NOT NULL,
	[ad] [varchar](500) NULL,
	[yazarno] [int] NULL,
	[sayi] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[islem]    Script Date: 5.06.2022 00:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[islem](
	[islemno] [int] IDENTITY(1,1) NOT NULL,
	[ogrno] [int] NULL,
	[kitapno] [int] NULL,
	[atarih] [date] NULL,
	[vtarih] [date] NULL,
 CONSTRAINT [PK_islem] PRIMARY KEY CLUSTERED 
(
	[islemno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kitap]    Script Date: 5.06.2022 00:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kitap](
	[kitapno] [int] IDENTITY(1,1) NOT NULL,
	[ad] [varchar](500) NULL,
	[sayfasayisi] [int] NOT NULL,
	[puan] [int] NOT NULL,
	[yazarno] [int] NULL,
	[turno] [int] NOT NULL,
 CONSTRAINT [PK_kitap] PRIMARY KEY CLUSTERED 
(
	[kitapno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[kitap2]    Script Date: 5.06.2022 00:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[kitap2](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ad] [varchar](500) NULL,
	[yazarno] [int] NULL,
	[sayi] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ogrenci]    Script Date: 5.06.2022 00:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ogrenci](
	[ogrno] [int] IDENTITY(1,1) NOT NULL,
	[ad] [varchar](20) NULL,
	[soyad] [varchar](20) NULL,
	[dtarih] [datetime] NULL,
	[cinsiyet] [char](1) NULL,
	[sinif] [varchar](4) NOT NULL,
	[puan] [int] NULL,
 CONSTRAINT [PK_ogrenci] PRIMARY KEY CLUSTERED 
(
	[ogrno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[siniflar]    Script Date: 5.06.2022 00:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[siniflar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nchar](4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tur]    Script Date: 5.06.2022 00:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tur](
	[turno] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nchar](30) NULL,
 CONSTRAINT [PK_tur] PRIMARY KEY CLUSTERED 
(
	[turno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yazar]    Script Date: 5.06.2022 00:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yazar](
	[yazarno] [int] NOT NULL,
	[ad] [varchar](50) NULL,
	[soyad] [varchar](50) NULL,
 CONSTRAINT [PK_yazar] PRIMARY KEY CLUSTERED 
(
	[yazarno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[islem]  WITH CHECK ADD  CONSTRAINT [FK_islem_kitap] FOREIGN KEY([kitapno])
REFERENCES [dbo].[kitap] ([kitapno])
GO
ALTER TABLE [dbo].[islem] CHECK CONSTRAINT [FK_islem_kitap]
GO
ALTER TABLE [dbo].[islem]  WITH CHECK ADD  CONSTRAINT [FK_islem_ogrenci] FOREIGN KEY([ogrno])
REFERENCES [dbo].[ogrenci] ([ogrno])
GO
ALTER TABLE [dbo].[islem] CHECK CONSTRAINT [FK_islem_ogrenci]
GO
ALTER TABLE [dbo].[kitap]  WITH CHECK ADD  CONSTRAINT [FK_kitap_tur] FOREIGN KEY([turno])
REFERENCES [dbo].[tur] ([turno])
GO
ALTER TABLE [dbo].[kitap] CHECK CONSTRAINT [FK_kitap_tur]
GO
ALTER TABLE [dbo].[kitap]  WITH CHECK ADD  CONSTRAINT [FK_kitap_yazar1] FOREIGN KEY([yazarno])
REFERENCES [dbo].[yazar] ([yazarno])
GO
ALTER TABLE [dbo].[kitap] CHECK CONSTRAINT [FK_kitap_yazar1]
GO
ALTER TABLE [dbo].[kitap2]  WITH CHECK ADD  CONSTRAINT [FK_kitap_yazar] FOREIGN KEY([yazarno])
REFERENCES [dbo].[yazar] ([yazarno])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[kitap2] CHECK CONSTRAINT [FK_kitap_yazar]
GO
