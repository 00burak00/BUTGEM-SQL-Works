USE [ogrenciler]
GO
/****** Object:  Table [dbo].[OgrenciBilgiler]    Script Date: 5.06.2022 00:33:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OgrenciBilgiler](
	[TC_kimlik_no] [varchar](15) NOT NULL,
	[AdSoyad] [varchar](30) NULL,
	[DogumTarihi] [datetime] NULL,
	[Telefon] [varchar](15) NULL,
	[Bolum] [varchar](15) NULL,
 CONSTRAINT [PK_OgrenciBilgiler] PRIMARY KEY CLUSTERED 
(
	[TC_kimlik_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ogrenciNotları]    Script Date: 5.06.2022 00:33:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ogrenciNotları](
	[TC_kimlik_no] [varchar](15) NOT NULL,
	[vize] [int] NULL,
	[final] [int] NULL,
	[Ortalama] [int] NULL,
 CONSTRAINT [PK_ogrenciNotları] PRIMARY KEY CLUSTERED 
(
	[TC_kimlik_no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ogrenciNotları]  WITH CHECK ADD  CONSTRAINT [FK_ogrenciNotları_OgrenciBilgiler] FOREIGN KEY([TC_kimlik_no])
REFERENCES [dbo].[OgrenciBilgiler] ([TC_kimlik_no])
GO
ALTER TABLE [dbo].[ogrenciNotları] CHECK CONSTRAINT [FK_ogrenciNotları_OgrenciBilgiler]
GO
