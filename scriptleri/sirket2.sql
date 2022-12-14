USE [Sirket2]
GO
/****** Object:  Table [dbo].[Bolum]    Script Date: 5.06.2022 00:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bolum](
	[bolAd] [nvarchar](20) NOT NULL,
	[bolNo] [int] IDENTITY(1,1) NOT NULL,
	[yonSosGno] [int] NOT NULL,
	[yIsbasTar] [date] NOT NULL,
	[sicilId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[bolNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[sicilId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personel]    Script Date: 5.06.2022 00:37:55 ******/
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
	[cins] [char](1) NULL,
	[maas] [smallmoney] NULL,
	[bolNo] [int] NULL,
	[ySosGuvNo] [int] NULL,
	[sosYardim] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[sicilNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yonetici]    Script Date: 5.06.2022 00:37:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yonetici](
	[yonSosGno] [int] NOT NULL,
	[yonAdiSoyadi] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[yonSosGno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Bolum] ADD  DEFAULT (getdate()) FOR [yIsbasTar]
GO
ALTER TABLE [dbo].[Personel] ADD  DEFAULT ('K') FOR [cins]
GO
ALTER TABLE [dbo].[Personel] ADD  DEFAULT ((4250)) FOR [maas]
GO
ALTER TABLE [dbo].[Personel] ADD  DEFAULT ('E') FOR [sosYardim]
GO
ALTER TABLE [dbo].[Bolum]  WITH CHECK ADD FOREIGN KEY([yonSosGno])
REFERENCES [dbo].[Yonetici] ([yonSosGno])
GO
ALTER TABLE [dbo].[Personel]  WITH CHECK ADD FOREIGN KEY([bolNo])
REFERENCES [dbo].[Bolum] ([bolNo])
GO
ALTER TABLE [dbo].[Personel]  WITH CHECK ADD FOREIGN KEY([ySosGuvNo])
REFERENCES [dbo].[Yonetici] ([yonSosGno])
GO
