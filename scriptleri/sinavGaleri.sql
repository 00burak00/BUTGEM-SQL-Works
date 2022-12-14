USE [sinavGaleri]
GO
/****** Object:  Table [dbo].[alim]    Script Date: 5.06.2022 00:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alim](
	[AlimNo] [int] IDENTITY(1,1) NOT NULL,
	[Mno] [int] NOT NULL,
	[Aracno] [int] NOT NULL,
	[alim_Tarihi] [date] NOT NULL,
	[Afiyat] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Arac]    Script Date: 5.06.2022 00:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Arac](
	[aracno] [int] IDENTITY(1,1) NOT NULL,
	[model] [int] NOT NULL,
	[Marka] [nvarchar](25) NOT NULL,
	[Plaka] [nvarchar](15) NOT NULL,
	[Fiyat] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[aracno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Musteri]    Script Date: 5.06.2022 00:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Musteri](
	[mno] [int] IDENTITY(1,1) NOT NULL,
	[Madi] [nvarchar](30) NOT NULL,
	[Msoyadi] [nvarchar](30) NOT NULL,
	[Madres] [nvarchar](250) NOT NULL,
	[Mtelefon] [decimal](11, 0) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[mno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Satis]    Script Date: 5.06.2022 00:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Satis](
	[satno] [int] IDENTITY(1,1) NOT NULL,
	[mno] [int] NOT NULL,
	[Aracno] [int] NOT NULL,
	[sat_Tarihi] [date] NOT NULL,
	[Sfiyati] [money] NOT NULL,
 CONSTRAINT [PK__Satis__E5DCCA69E1F20B5A] PRIMARY KEY CLUSTERED 
(
	[satno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[alim]  WITH CHECK ADD FOREIGN KEY([Aracno])
REFERENCES [dbo].[Arac] ([aracno])
GO
ALTER TABLE [dbo].[alim]  WITH CHECK ADD FOREIGN KEY([Mno])
REFERENCES [dbo].[Musteri] ([mno])
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK__Satis__Aracno__3B75D760] FOREIGN KEY([Aracno])
REFERENCES [dbo].[Arac] ([aracno])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK__Satis__Aracno__3B75D760]
GO
ALTER TABLE [dbo].[Satis]  WITH CHECK ADD  CONSTRAINT [FK__Satis__mno__3A81B327] FOREIGN KEY([mno])
REFERENCES [dbo].[Musteri] ([mno])
GO
ALTER TABLE [dbo].[Satis] CHECK CONSTRAINT [FK__Satis__mno__3A81B327]
GO
/****** Object:  StoredProcedure [dbo].[ogrliste]    Script Date: 5.06.2022 00:37:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ogrliste]
as
begin
	select * from ogrenci	
end
GO
