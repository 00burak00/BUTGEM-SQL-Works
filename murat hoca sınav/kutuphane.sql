USE [Kutuphane]
GO
/****** Object:  Table [dbo].[TblIslemler]    Script Date: 21.05.2022 19:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblIslemler](
	[no] [int] IDENTITY(1,1) NOT NULL,
	[ogrno] [nvarchar](4) NOT NULL,
	[isbnno] [nvarchar](13) NOT NULL,
	[atarih] [date] NOT NULL,
	[vtarih] [date] NOT NULL,
 CONSTRAINT [PK_TblIslemler] PRIMARY KEY CLUSTERED 
(
	[no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblKitap]    Script Date: 21.05.2022 19:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblKitap](
	[no] [int] IDENTITY(1,1) NOT NULL,
	[isbnno] [nvarchar](13) NOT NULL,
	[adi] [nvarchar](100) NOT NULL,
	[yazarno] [int] NOT NULL,
	[turno] [int] NOT NULL,
	[sayfasayisi] [int] NOT NULL,
	[puan] [int] NOT NULL,
 CONSTRAINT [PK_TblKitap] PRIMARY KEY CLUSTERED 
(
	[isbnno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblOgrenci]    Script Date: 21.05.2022 19:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblOgrenci](
	[no] [nvarchar](4) NOT NULL,
	[ad] [nvarchar](20) NOT NULL,
	[soyad] [nvarchar](20) NOT NULL,
	[cinsiyet] [nvarchar](7) NOT NULL,
	[dtarih] [date] NOT NULL,
	[sinif] [nvarchar](20) NOT NULL,
	[puan] [int] NOT NULL,
 CONSTRAINT [PK_TblOgrenci] PRIMARY KEY CLUSTERED 
(
	[no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblTur]    Script Date: 21.05.2022 19:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblTur](
	[no] [int] IDENTITY(1,1) NOT NULL,
	[adi] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TblTur] PRIMARY KEY CLUSTERED 
(
	[no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblYazar]    Script Date: 21.05.2022 19:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblYazar](
	[no] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](50) NOT NULL,
	[soyad] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TblYazar] PRIMARY KEY CLUSTERED 
(
	[no] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TblIslemler] ON 

INSERT [dbo].[TblIslemler] ([no], [ogrno], [isbnno], [atarih], [vtarih]) VALUES (3, N'125', N'15467895', CAST(N'2022-04-11' AS Date), CAST(N'2022-04-25' AS Date))
INSERT [dbo].[TblIslemler] ([no], [ogrno], [isbnno], [atarih], [vtarih]) VALUES (9, N'858', N'56454654', CAST(N'2022-04-11' AS Date), CAST(N'2022-04-25' AS Date))
SET IDENTITY_INSERT [dbo].[TblIslemler] OFF
GO
SET IDENTITY_INSERT [dbo].[TblKitap] ON 

INSERT [dbo].[TblKitap] ([no], [isbnno], [adi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (4, N'15467895', N'KAŞAĞI', 3, 3, 220, 25)
INSERT [dbo].[TblKitap] ([no], [isbnno], [adi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (6, N'56454654', N'SEFİLLER', 2, 3, 540, 30)
INSERT [dbo].[TblKitap] ([no], [isbnno], [adi], [yazarno], [turno], [sayfasayisi], [puan]) VALUES (5, N'65413544', N'DOĞU EKSPRESİNDE CİNAYET', 1, 2, 358, 25)
SET IDENTITY_INSERT [dbo].[TblKitap] OFF
GO
INSERT [dbo].[TblOgrenci] ([no], [ad], [soyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (N'125', N'TOLUNAY', N'ÖZCAN', N'ERKEK', CAST(N'1998-01-20' AS Date), N'11B', 10)
INSERT [dbo].[TblOgrenci] ([no], [ad], [soyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (N'858', N'EMRAH', N'EMRE', N'ERKEK', CAST(N'1985-10-23' AS Date), N'11A', 5)
INSERT [dbo].[TblOgrenci] ([no], [ad], [soyad], [cinsiyet], [dtarih], [sinif], [puan]) VALUES (N'8797', N'MURAT', N'ÇATMALI', N'ERKEK', CAST(N'1979-01-01' AS Date), N'11B', 4)
GO
SET IDENTITY_INSERT [dbo].[TblTur] ON 

INSERT [dbo].[TblTur] ([no], [adi]) VALUES (1, N'MACERA')
INSERT [dbo].[TblTur] ([no], [adi]) VALUES (2, N'FANTASTİK')
INSERT [dbo].[TblTur] ([no], [adi]) VALUES (3, N'TARİH')
SET IDENTITY_INSERT [dbo].[TblTur] OFF
GO
SET IDENTITY_INSERT [dbo].[TblYazar] ON 

INSERT [dbo].[TblYazar] ([no], [ad], [soyad]) VALUES (1, N'AGATHA', N'CHRISTIE')
INSERT [dbo].[TblYazar] ([no], [ad], [soyad]) VALUES (2, N'VICTOR', N'HUGO')
INSERT [dbo].[TblYazar] ([no], [ad], [soyad]) VALUES (3, N'ÖMER', N'SEYFETTİN')
SET IDENTITY_INSERT [dbo].[TblYazar] OFF
GO
ALTER TABLE [dbo].[TblIslemler] ADD  CONSTRAINT [DF_TblIslemler_atarih]  DEFAULT (getdate()) FOR [atarih]
GO
ALTER TABLE [dbo].[TblIslemler]  WITH CHECK ADD  CONSTRAINT [FK_TblIslemler_TblKitap] FOREIGN KEY([isbnno])
REFERENCES [dbo].[TblKitap] ([isbnno])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblIslemler] CHECK CONSTRAINT [FK_TblIslemler_TblKitap]
GO
ALTER TABLE [dbo].[TblIslemler]  WITH CHECK ADD  CONSTRAINT [FK_TblIslemler_TblOgrenci] FOREIGN KEY([ogrno])
REFERENCES [dbo].[TblOgrenci] ([no])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblIslemler] CHECK CONSTRAINT [FK_TblIslemler_TblOgrenci]
GO
ALTER TABLE [dbo].[TblKitap]  WITH CHECK ADD  CONSTRAINT [FK_TblKitap_TblTur] FOREIGN KEY([turno])
REFERENCES [dbo].[TblTur] ([no])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblKitap] CHECK CONSTRAINT [FK_TblKitap_TblTur]
GO
ALTER TABLE [dbo].[TblKitap]  WITH CHECK ADD  CONSTRAINT [FK_TblKitap_TblYazar] FOREIGN KEY([yazarno])
REFERENCES [dbo].[TblYazar] ([no])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblKitap] CHECK CONSTRAINT [FK_TblKitap_TblYazar]
GO
ALTER TABLE [dbo].[TblKitap]  WITH CHECK ADD  CONSTRAINT [CK_TblKitap] CHECK  (([sayfasayisi]>=(200)))
GO
ALTER TABLE [dbo].[TblKitap] CHECK CONSTRAINT [CK_TblKitap]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'>=200' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblKitap', @level2type=N'CONSTRAINT',@level2name=N'CK_TblKitap'
GO
