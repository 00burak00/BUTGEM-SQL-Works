USE [film2]
GO
/****** Object:  Table [dbo].[filmler]    Script Date: 5.06.2022 00:26:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[filmler](
	[film_id] [int] IDENTITY(1,1) NOT NULL,
	[ad] [nvarchar](75) NOT NULL,
	[Tarih] [int] NOT NULL,
	[IMDB_Puan] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[film_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
