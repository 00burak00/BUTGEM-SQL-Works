USE [Kutuphane]
GO
/****** Object:  UserDefinedFunction [dbo].[isaret2]    Script Date: 5.06.2022 00:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[isaret2](@sayi int)
returns int
as
begin
if @sayi>0
return 1
if @sayi<0
return -1
return 0
end
GO
/****** Object:  UserDefinedFunction [dbo].[kucuk]    Script Date: 5.06.2022 00:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[kucuk](@a nvarchar(20),@b nvarchar(20))
returns nvarchar(40)
as 
begin
return lower(@a)+' '+lower(@b)
end
GO
/****** Object:  Table [dbo].[TblIslemler]    Script Date: 5.06.2022 00:29:44 ******/
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
/****** Object:  Table [dbo].[TblKitap]    Script Date: 5.06.2022 00:29:44 ******/
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
/****** Object:  Table [dbo].[TblOgrenci]    Script Date: 5.06.2022 00:29:44 ******/
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
/****** Object:  Table [dbo].[TblTur]    Script Date: 5.06.2022 00:29:44 ******/
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
/****** Object:  Table [dbo].[TblYazar]    Script Date: 5.06.2022 00:29:44 ******/
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
/****** Object:  StoredProcedure [dbo].[kitapsay]    Script Date: 5.06.2022 00:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[kitapsay]
@sayi int output
as
begin
select @sayi=count(no) from TblKitap
end
GO
/****** Object:  StoredProcedure [dbo].[ogrencicesit]    Script Date: 5.06.2022 00:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ogrencicesit] @ad nvarchar(30),@soyad nvarchar(30),@sayi int output
as
begin
select @sayi=count(TblIslemler.ogrno) from TblOgrenci,
TblIslemler,TblKitap,TblYazar where TblOgrenci.no=TblIslemler.ogrno and TblIslemler.isbnno=
TblKitap.isbnno and TblKitap.yazarno=TblYazar.no and 
TblOgrenci.ad=@ad and TblOgrenci.soyad=@soyad group by TblOgrenci.ad,TblOgrenci.soyad
end
GO
/****** Object:  StoredProcedure [dbo].[ogrenciyazarcesit]    Script Date: 5.06.2022 00:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ogrenciyazarcesit] @adi nvarchar(20),@soyadi nvarchar(20),
@sayi int output
as
begin
select @sayi=count(TblIslemler.ogrno) 
from TblIslemler,TblYazar,TblOgrenci,TblKitap
where TblIslemler.ogrno=TblOgrenci.no 
and TblYazar.no=TblKitap.yazarno and TblIslemler.isbnno=TblKitap.isbnno
and TblOgrenci.ad=@adi and TblOgrenci.soyad=@soyadi group by TblOgrenci.ad,TblOgrenci.soyad
end
GO
/****** Object:  StoredProcedure [dbo].[ogrkitapyazar]    Script Date: 5.06.2022 00:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ogrkitapyazar]
as
begin
select TblOgrenci.ad, TblOgrenci.soyad,
TblKitap.adi,TblYazar.ad,TblYazar.soyad
from TblOgrenci,TblIslemler,TblKitap,TblYazar
where TblOgrenci.no=TblIslemler.ogrno
and TblIslemler.isbnno=TblKitap.isbnno
and TblKitap.yazarno=TblYazar.no
end
GO
/****** Object:  StoredProcedure [dbo].[ogrliste]    Script Date: 5.06.2022 00:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[ogrliste]
as
begin
select * from TblOgrenci
end
GO
/****** Object:  StoredProcedure [dbo].[paratmetregir]    Script Date: 5.06.2022 00:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[paratmetregir] @ad nvarchar(30),@soyad nvarchar(30)
as
begin
select TblOgrenci.ad,TblOgrenci.soyad,count(TblYazar.no) from TblOgrenci,TblIslemler,TblKitap,TblYazar where TblOgrenci.no=TblIslemler.ogrno 
and TblIslemler.isbnno=TblKitap.isbnno and 
TblKitap.yazarno=TblYazar.no and TblOgrenci.ad=@ad and TblOgrenci.soyad=@soyad group by TblOgrenci.ad,TblOgrenci.soyad
end
GO
/****** Object:  StoredProcedure [dbo].[pkitapsay]    Script Date: 5.06.2022 00:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pkitapsay] @turu nvarchar(50),
@sayi int output
as
begin
--select @sayi=count(no) from TblKitap
select @sayi=count(TblKitap.no) from TblKitap,TblTur
where TblKitap.turno=TblTur.no and TblTur.adi=@turu 
group by TblTur.adi
end
GO
/****** Object:  StoredProcedure [dbo].[prmogrkitapyazar]    Script Date: 5.06.2022 00:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prmogrkitapyazar] @ad nvarchar(20)
as
begin
select TblOgrenci.ad,tblogrenci.soyad,tblkitap.adi,tblyazar.ad,tblyazar.soyad from TblOgrenci,TblIslemler,tblkitap,TblYazar where tblogrenci.no=TblIslemler.ogrno
and TblIslemler.isbnno=tblkitap.isbnno and tblkitap.yazarno=tblyazar.no and tblogrenci.ad=@ad
end
GO
/****** Object:  StoredProcedure [dbo].[prmturkitapyazar]    Script Date: 5.06.2022 00:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prmturkitapyazar] @adi nvarchar(30)
as
begin
select * from TblKitap,TblYazar,TblTur where TblKitap.yazarno=TblYazar.no and tbltur.no=TblKitap.turno and TblYazar.no=TblKitap.yazarno and tblkitap.adi=@adi
end
GO
/****** Object:  StoredProcedure [dbo].[prmturkitapyazar2]    Script Date: 5.06.2022 00:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[prmturkitapyazar2] @adi nvarchar(30)
as
begin
select * from TblKitap,TblYazar,TblTur where TblKitap.yazarno=TblYazar.no and tbltur.no=TblKitap.turno  and TblTur.adi=@adi
end
GO
/****** Object:  StoredProcedure [dbo].[yazarlarvekitaplar]    Script Date: 5.06.2022 00:29:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[yazarlarvekitaplar] @adi nvarchar(30)
as
begin
select * from TblKitap,TblYazar,TblTur where TblKitap.yazarno=TblYazar.no and tbltur.no=TblKitap.turno and tblkitap.adi=@adi
end
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'>=200' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TblKitap', @level2type=N'CONSTRAINT',@level2name=N'CK_TblKitap'
GO
