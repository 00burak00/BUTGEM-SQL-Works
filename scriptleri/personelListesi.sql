USE [personalListesi]
GO
/****** Object:  Table [dbo].[Personal]    Script Date: 5.06.2022 00:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal](
	[per_id] [int] IDENTITY(1,1) NOT NULL,
	[per_ad] [nvarchar](20) NOT NULL,
	[per_soyad] [nvarchar](20) NOT NULL,
	[per_bolum] [nvarchar](20) NOT NULL,
	[maas] [int] NOT NULL,
	[istarih] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[per_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Personal] ADD  DEFAULT (getdate()) FOR [istarih]
GO
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD CHECK  (([istarih]>='2001-01-01'))
GO
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD CHECK  (([maas]>=(4250) AND [maas]<=(10000)))
GO
ALTER TABLE [dbo].[Personal]  WITH CHECK ADD CHECK  (([per_bolum]='ütü' OR [per_bolum]='dikim' OR [per_bolum]='kumaskesim'))
GO
