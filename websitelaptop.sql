USE [master]
GO
/****** Object:  Database [laptop2]    Script Date: 06/04/2021 11:36:10 CH ******/
CREATE DATABASE [laptop2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'laptop2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\laptop2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'laptop2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\laptop2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [laptop2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [laptop2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [laptop2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [laptop2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [laptop2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [laptop2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [laptop2] SET ARITHABORT OFF 
GO
ALTER DATABASE [laptop2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [laptop2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [laptop2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [laptop2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [laptop2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [laptop2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [laptop2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [laptop2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [laptop2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [laptop2] SET  ENABLE_BROKER 
GO
ALTER DATABASE [laptop2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [laptop2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [laptop2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [laptop2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [laptop2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [laptop2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [laptop2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [laptop2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [laptop2] SET  MULTI_USER 
GO
ALTER DATABASE [laptop2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [laptop2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [laptop2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [laptop2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [laptop2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [laptop2] SET QUERY_STORE = OFF
GO
USE [laptop2]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 06/04/2021 11:36:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[category_id] [int] NOT NULL,
	[category_name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 06/04/2021 11:36:10 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[prd_id] [int] NOT NULL,
	[prd_name] [varchar](255) NOT NULL,
	[category_id] [int] NOT NULL,
	[prd_price] [int] NOT NULL,
	[model_year] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[prd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (1, N'DELL')
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (2, N'ASUS')
INSERT [dbo].[categories] ([category_id], [category_name]) VALUES (3, N'MACBOOK')
INSERT [dbo].[products] ([prd_id], [prd_name], [category_id], [prd_price], [model_year]) VALUES (1, N' DELL insprion', 1, 20000000, 2016)
INSERT [dbo].[products] ([prd_id], [prd_name], [category_id], [prd_price], [model_year]) VALUES (2, N' DELL vostro', 1, 30000000, 2017)
INSERT [dbo].[products] ([prd_id], [prd_name], [category_id], [prd_price], [model_year]) VALUES (3, N' DELL precision', 1, 40000000, 2018)
INSERT [dbo].[products] ([prd_id], [prd_name], [category_id], [prd_price], [model_year]) VALUES (4, N'ASUS vivobook', 2, 20000000, 2016)
INSERT [dbo].[products] ([prd_id], [prd_name], [category_id], [prd_price], [model_year]) VALUES (5, N'ASUS zenbook', 2, 20000000, 2016)
INSERT [dbo].[products] ([prd_id], [prd_name], [category_id], [prd_price], [model_year]) VALUES (6, N'ASUS studio', 2, 40000000, 2010)
INSERT [dbo].[products] ([prd_id], [prd_name], [category_id], [prd_price], [model_year]) VALUES (7, N'MACBOOK air', 3, 20000000, 2017)
INSERT [dbo].[products] ([prd_id], [prd_name], [category_id], [prd_price], [model_year]) VALUES (8, N'MACBOOK pro', 3, 20000000, 2018)
INSERT [dbo].[products] ([prd_id], [prd_name], [category_id], [prd_price], [model_year]) VALUES (9, N'MACBOOK super pro', 3, 20000000, 2020)
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([category_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [laptop2] SET  READ_WRITE 
GO
