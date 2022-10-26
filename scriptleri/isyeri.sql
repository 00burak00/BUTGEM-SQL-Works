USE [master]
GO
/****** Object:  Database [isyeri]    Script Date: 5.06.2022 00:29:09 ******/
CREATE DATABASE [isyeri]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'isyeri', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\isyeri.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'isyeri_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\isyeri_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [isyeri] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [isyeri].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [isyeri] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [isyeri] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [isyeri] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [isyeri] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [isyeri] SET ARITHABORT OFF 
GO
ALTER DATABASE [isyeri] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [isyeri] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [isyeri] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [isyeri] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [isyeri] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [isyeri] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [isyeri] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [isyeri] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [isyeri] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [isyeri] SET  ENABLE_BROKER 
GO
ALTER DATABASE [isyeri] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [isyeri] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [isyeri] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [isyeri] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [isyeri] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [isyeri] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [isyeri] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [isyeri] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [isyeri] SET  MULTI_USER 
GO
ALTER DATABASE [isyeri] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [isyeri] SET DB_CHAINING OFF 
GO
ALTER DATABASE [isyeri] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [isyeri] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [isyeri] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [isyeri] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [isyeri] SET QUERY_STORE = OFF
GO
ALTER DATABASE [isyeri] SET  READ_WRITE 
GO
