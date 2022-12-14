USE [Okul]
GO
/****** Object:  Table [dbo].[Table]    Script Date: 5.06.2022 00:33:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Table](
	[id] [int] NOT NULL,
	[ogrno] [int] NOT NULL,
	[sin1] [tinyint] NULL,
	[sin2] [tinyint] NULL,
	[ders_adi] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
