USE [GALERİ2022]
GO
/****** Object:  Table [dbo].[alim]    Script Date: 5.06.2022 00:28:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alim](
	[alno] [int] IDENTITY(1,1) NOT NULL,
	[mno] [int] NOT NULL,
	[ano] [int] NOT NULL,
	[atarih] [date] NOT NULL,
	[afiyat] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[alno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[arac]    Script Date: 5.06.2022 00:28:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[arac](
	[ano] [int] IDENTITY(1,1) NOT NULL,
	[model] [int] NOT NULL,
	[marka] [nvarchar](50) NOT NULL,
	[plaka] [nvarchar](15) NOT NULL,
	[fiyat] [money] NOT NULL,
 CONSTRAINT [PK__arac__DE57AB418EE98B83] PRIMARY KEY CLUSTERED 
(
	[ano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[musteri]    Script Date: 5.06.2022 00:28:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[musteri](
	[mno] [int] IDENTITY(1,1) NOT NULL,
	[madi] [nvarchar](20) NOT NULL,
	[msoyadi] [nvarchar](20) NOT NULL,
	[madres] [nvarchar](250) NOT NULL,
	[mtel] [nvarchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[mno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[satis]    Script Date: 5.06.2022 00:28:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[satis](
	[sno] [int] IDENTITY(1,1) NOT NULL,
	[mno] [int] NULL,
	[ano] [int] NULL,
	[starihi] [date] NOT NULL,
	[sfiyat] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[alim] ADD  DEFAULT (getdate()) FOR [atarih]
GO
ALTER TABLE [dbo].[arac] ADD  CONSTRAINT [DF__arac__model__71D1E811]  DEFAULT ((2022)) FOR [model]
GO
ALTER TABLE [dbo].[arac] ADD  CONSTRAINT [DF__arac__marka__72C60C4A]  DEFAULT ('FIAT') FOR [marka]
GO
ALTER TABLE [dbo].[arac] ADD  CONSTRAINT [DF__arac__plaka__73BA3083]  DEFAULT ('01XX9999') FOR [plaka]
GO
ALTER TABLE [dbo].[musteri] ADD  DEFAULT ('Müşteri adi') FOR [madi]
GO
ALTER TABLE [dbo].[satis] ADD  DEFAULT (getdate()) FOR [starihi]
GO
ALTER TABLE [dbo].[alim]  WITH CHECK ADD  CONSTRAINT [FK__alim__ano__778AC167] FOREIGN KEY([ano])
REFERENCES [dbo].[arac] ([ano])
GO
ALTER TABLE [dbo].[alim] CHECK CONSTRAINT [FK__alim__ano__778AC167]
GO
ALTER TABLE [dbo].[alim]  WITH CHECK ADD FOREIGN KEY([mno])
REFERENCES [dbo].[musteri] ([mno])
GO
ALTER TABLE [dbo].[satis]  WITH CHECK ADD  CONSTRAINT [FK__satis__ano__7C4F7684] FOREIGN KEY([ano])
REFERENCES [dbo].[arac] ([ano])
GO
ALTER TABLE [dbo].[satis] CHECK CONSTRAINT [FK__satis__ano__7C4F7684]
GO
ALTER TABLE [dbo].[satis]  WITH CHECK ADD FOREIGN KEY([mno])
REFERENCES [dbo].[musteri] ([mno])
GO
/****** Object:  DdlTrigger [fonksiyonengelle]    Script Date: 5.06.2022 00:28:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [fonksiyonengelle]
on database for create_function
as
begin
print('Fonksiyon oluşturma engellendi')
rollback
end
GO
DISABLE TRIGGER [fonksiyonengelle] ON DATABASE
GO
/****** Object:  DdlTrigger [tabloengelle]    Script Date: 5.06.2022 00:28:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [tabloengelle]
on database for create_table
as
begin
print('Tablo oluşturma engellendi')
rollback
end
GO
DISABLE TRIGGER [tabloengelle] ON DATABASE
GO
ENABLE TRIGGER [fonksiyonengelle] ON DATABASE
GO
ENABLE TRIGGER [tabloengelle] ON DATABASE
GO
