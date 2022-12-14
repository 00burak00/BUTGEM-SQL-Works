USE [market]
GO
/****** Object:  Table [dbo].[alim]    Script Date: 5.06.2022 00:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alim](
	[Ukodu] [int] NULL,
	[almiktar] [int] NULL,
	[MusteriAdsoy] [varchar](100) NULL,
	[Altrh] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[satis]    Script Date: 5.06.2022 00:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[satis](
	[Ukodu] [int] NULL,
	[Smiktar] [int] NULL,
	[MusteriAdSoy] [varchar](100) NULL,
	[Strh] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[urun]    Script Date: 5.06.2022 00:31:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[urun](
	[Ukodu] [int] IDENTITY(1,1) NOT NULL,
	[Uadi] [varchar](50) NULL,
	[Ufiyat] [money] NULL,
	[Umiktar] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Ukodu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
