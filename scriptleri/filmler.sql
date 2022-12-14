USE [filmler]
GO
/****** Object:  Table [dbo].[Film_Tur]    Script Date: 5.06.2022 00:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Film_Tur](
	[film_ID] [int] NOT NULL,
	[tur_Id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[filmler]    Script Date: 5.06.2022 00:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[filmler](
	[film_ID] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](75) NOT NULL,
	[Tarih] [int] NOT NULL,
	[IMDB_Puan] [int] NOT NULL,
	[yonetmen] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[film_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oyuncu_Film]    Script Date: 5.06.2022 00:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oyuncu_Film](
	[oyuncu_Id] [int] NOT NULL,
	[Film_Id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oyuncular]    Script Date: 5.06.2022 00:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oyuncular](
	[oyuncu_Id] [int] IDENTITY(1,1) NOT NULL,
	[Ad] [nvarchar](30) NOT NULL,
	[Soyad] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[oyuncu_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[turler]    Script Date: 5.06.2022 00:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[turler](
	[tur_Id] [int] NOT NULL,
	[ad] [nvarchar](20) NOT NULL,
	[deneme] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[tur_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yonetmenler]    Script Date: 5.06.2022 00:27:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yonetmenler](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[adı] [nvarchar](30) NOT NULL,
	[soyad] [nvarchar](30) NOT NULL,
 CONSTRAINT [pk_not] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[turler] ADD  CONSTRAINT [dfturad]  DEFAULT ('komik') FOR [ad]
GO
ALTER TABLE [dbo].[yonetmenler] ADD  DEFAULT ('osman') FOR [adı]
GO
ALTER TABLE [dbo].[yonetmenler] ADD  DEFAULT ('sınav') FOR [soyad]
GO
ALTER TABLE [dbo].[Film_Tur]  WITH CHECK ADD FOREIGN KEY([film_ID])
REFERENCES [dbo].[filmler] ([film_ID])
GO
ALTER TABLE [dbo].[Film_Tur]  WITH CHECK ADD FOREIGN KEY([tur_Id])
REFERENCES [dbo].[turler] ([tur_Id])
GO
ALTER TABLE [dbo].[filmler]  WITH CHECK ADD  CONSTRAINT [fk_yonetmenfilm1] FOREIGN KEY([yonetmen])
REFERENCES [dbo].[yonetmenler] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[filmler] CHECK CONSTRAINT [fk_yonetmenfilm1]
GO
ALTER TABLE [dbo].[Oyuncu_Film]  WITH CHECK ADD FOREIGN KEY([Film_Id])
REFERENCES [dbo].[filmler] ([film_ID])
GO
ALTER TABLE [dbo].[Oyuncu_Film]  WITH CHECK ADD FOREIGN KEY([oyuncu_Id])
REFERENCES [dbo].[Oyuncular] ([oyuncu_Id])
GO
ALTER TABLE [dbo].[filmler]  WITH CHECK ADD CHECK  (([IMDB_puan]>(7)))
GO
ALTER TABLE [dbo].[filmler]  WITH CHECK ADD CHECK  (([IMDB_puan]>(7)))
GO
