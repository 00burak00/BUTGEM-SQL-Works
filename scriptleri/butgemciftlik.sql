USE [butgemciftlik]
GO
/****** Object:  Table [dbo].[siparis]    Script Date: 5.06.2022 00:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[siparis](
	[sipno] [int] NOT NULL,
	[urunid] [int] NOT NULL,
	[adet] [int] NOT NULL,
	[starihi] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[sipno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[urunler]    Script Date: 5.06.2022 00:25:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[urunler](
	[urunno] [int] IDENTITY(1,1) NOT NULL,
	[urunad] [nvarchar](50) NOT NULL,
	[urunstok] [int] NOT NULL,
	[fiyat] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[urunno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[siparis]  WITH CHECK ADD  CONSTRAINT [fk_siparis_urunler] FOREIGN KEY([urunid])
REFERENCES [dbo].[urunler] ([urunno])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[siparis] CHECK CONSTRAINT [fk_siparis_urunler]
GO
