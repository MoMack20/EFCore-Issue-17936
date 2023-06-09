USE [master]
GO
/****** Object:  Database [EFScenario]    Script Date: 4/23/2023 3:35:31 PM ******/
CREATE DATABASE [EFScenario]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EFScenario', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EFScenario.mdf' , SIZE = 532480KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EFScenario_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EFScenario_log.ldf' , SIZE = 466944KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EFScenario] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EFScenario].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EFScenario] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EFScenario] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EFScenario] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EFScenario] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EFScenario] SET ARITHABORT OFF 
GO
ALTER DATABASE [EFScenario] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EFScenario] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EFScenario] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EFScenario] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EFScenario] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EFScenario] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EFScenario] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EFScenario] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EFScenario] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EFScenario] SET  DISABLE_BROKER 
GO
ALTER DATABASE [EFScenario] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EFScenario] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EFScenario] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EFScenario] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EFScenario] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EFScenario] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EFScenario] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EFScenario] SET RECOVERY FULL 
GO
ALTER DATABASE [EFScenario] SET  MULTI_USER 
GO
ALTER DATABASE [EFScenario] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EFScenario] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EFScenario] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EFScenario] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EFScenario] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EFScenario] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EFScenario', N'ON'
GO
ALTER DATABASE [EFScenario] SET QUERY_STORE = OFF
GO
ALTER DATABASE [EFScenario] SET  READ_WRITE 
GO
