USE [Firma]
GO
/****** Object:  Table [dbo].[Bolum]    Script Date: 5.06.2022 00:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bolum](
	[bolumAd] [nvarchar](20) NOT NULL,
	[bolumNo] [int] IDENTITY(1,1) NOT NULL,
	[yonSosGNo] [int] NOT NULL,
	[ylsBasTarih] [date] NOT NULL,
	[sicilID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[bolumNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[sicilID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personel]    Script Date: 5.06.2022 00:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personel](
	[sicilNo] [int] NOT NULL,
	[sosGuvNo] [int] NULL,
	[ad] [nvarchar](20) NULL,
	[soyad] [nvarchar](20) NULL,
	[dtarih] [date] NULL,
	[adres] [nvarchar](50) NULL,
	[cinsiyet] [char](1) NULL,
	[maas] [smallmoney] NULL,
	[bolNo] [int] NULL,
	[ySosGuvNo] [int] NULL,
	[sosYardım] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[sicilNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yonetıcı]    Script Date: 5.06.2022 00:27:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yonetıcı](
	[yonSosGno] [int] NOT NULL,
	[yonAdSoyad] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[yonSosGno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bolum] ADD  DEFAULT (getdate()) FOR [ylsBasTarih]
GO
ALTER TABLE [dbo].[Personel] ADD  DEFAULT ('K') FOR [cinsiyet]
GO
ALTER TABLE [dbo].[Personel] ADD  DEFAULT ((4250)) FOR [maas]
GO
ALTER TABLE [dbo].[Personel] ADD  DEFAULT ('E') FOR [sosYardım]
GO
ALTER TABLE [dbo].[Bolum]  WITH CHECK ADD FOREIGN KEY([yonSosGNo])
REFERENCES [dbo].[Yonetıcı] ([yonSosGno])
GO
ALTER TABLE [dbo].[Personel]  WITH CHECK ADD FOREIGN KEY([bolNo])
REFERENCES [dbo].[Bolum] ([bolumNo])
GO
ALTER TABLE [dbo].[Personel]  WITH CHECK ADD FOREIGN KEY([ySosGuvNo])
REFERENCES [dbo].[Yonetıcı] ([yonSosGno])
GO
