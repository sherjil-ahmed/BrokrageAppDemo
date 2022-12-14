USE [master]
GO
/****** Object:  Database [BrokerageDB]    Script Date: 8/13/2022 12:42:57 PM ******/
CREATE DATABASE [BrokerageDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BrokerageDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BrokerageDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BrokerageDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BrokerageDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BrokerageDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BrokerageDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BrokerageDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BrokerageDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BrokerageDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BrokerageDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BrokerageDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BrokerageDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BrokerageDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BrokerageDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BrokerageDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BrokerageDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BrokerageDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BrokerageDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BrokerageDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BrokerageDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BrokerageDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BrokerageDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BrokerageDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BrokerageDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BrokerageDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BrokerageDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BrokerageDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BrokerageDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BrokerageDB] SET  MULTI_USER 
GO
ALTER DATABASE [BrokerageDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BrokerageDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BrokerageDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BrokerageDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BrokerageDB', N'ON'
GO
USE [BrokerageDB]
GO
/****** Object:  Table [dbo].[Brokerage]    Script Date: 8/13/2022 12:42:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brokerage](
	[BrokerageId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Description] [varchar](500) NULL,
	[StatusId] [int] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_Brokerage] PRIMARY KEY CLUSTERED 
(
	[BrokerageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 8/13/2022 12:42:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ClientId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[BrokerageId] [int] NULL,
	[Description] [varbinary](500) NULL,
	[StatusId] [int] NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ClientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 8/13/2022 12:42:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[AddressLine1] [varchar](500) NULL,
	[AddressLine2] [varchar](500) NULL,
	[AddressLine3] [varchar](500) NULL,
	[StatusId] [int] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Insurer]    Script Date: 8/13/2022 12:42:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insurer](
	[InsurerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Decription] [varbinary](500) NULL,
	[StatusId] [int] NULL,
 CONSTRAINT [PK_Insurer] PRIMARY KEY CLUSTERED 
(
	[InsurerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Policy]    Script Date: 8/13/2022 12:42:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Policy](
	[PolicyId] [int] IDENTITY(1,1) NOT NULL,
	[CustommerId] [int] NULL,
	[InsurerId] [int] NULL,
	[PolicyTypeId] [int] NULL,
	[Premium] [float] NULL,
	[StatusId] [int] NULL,
	[ClientId] [int] NULL,
 CONSTRAINT [PK_Policy] PRIMARY KEY CLUSTERED 
(
	[PolicyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PolicyType]    Script Date: 8/13/2022 12:42:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PolicyType](
	[PolicyTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[StatusId] [int] NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_PolicyType] PRIMARY KEY CLUSTERED 
(
	[PolicyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 8/13/2022 12:42:57 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[Description] [varchar](500) NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Brokerage] ON 

INSERT [dbo].[Brokerage] ([BrokerageId], [Name], [Description], [StatusId], [CreatedOn]) VALUES (1, N'Test Brokrage 1', NULL, 2, NULL)
SET IDENTITY_INSERT [dbo].[Brokerage] OFF
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ClientId], [Name], [BrokerageId], [Description], [StatusId]) VALUES (1, N'"Achme Broker Ltd', 1, NULL, 2)
SET IDENTITY_INSERT [dbo].[Client] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [Name], [AddressLine1], [AddressLine2], [AddressLine3], [StatusId]) VALUES (1, N'ABC Joinery', N'12 Ascott Street, Dundee', NULL, NULL, 2)
INSERT [dbo].[Customer] ([CustomerId], [Name], [AddressLine1], [AddressLine2], [AddressLine3], [StatusId]) VALUES (2, N'"XYZ Plumbing', N'24 Fleet Street, Glasgow', NULL, NULL, 2)
INSERT [dbo].[Customer] ([CustomerId], [Name], [AddressLine1], [AddressLine2], [AddressLine3], [StatusId]) VALUES (3, N'Fast Taxis', N'324b Bank Street, Aberdeen', NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[Insurer] ON 

INSERT [dbo].[Insurer] ([InsurerId], [Name], [Decription], [StatusId]) VALUES (1, N'Aviva', NULL, 2)
INSERT [dbo].[Insurer] ([InsurerId], [Name], [Decription], [StatusId]) VALUES (2, N'Allianz', NULL, 2)
INSERT [dbo].[Insurer] ([InsurerId], [Name], [Decription], [StatusId]) VALUES (3, N'QBE', NULL, 2)
SET IDENTITY_INSERT [dbo].[Insurer] OFF
SET IDENTITY_INSERT [dbo].[Policy] ON 

INSERT [dbo].[Policy] ([PolicyId], [CustommerId], [InsurerId], [PolicyTypeId], [Premium], [StatusId], [ClientId]) VALUES (1, 1, 1, 1, 123.87, 2, 1)
INSERT [dbo].[Policy] ([PolicyId], [CustommerId], [InsurerId], [PolicyTypeId], [Premium], [StatusId], [ClientId]) VALUES (2, 2, 2, 1, 2321.45, 2, 1)
INSERT [dbo].[Policy] ([PolicyId], [CustommerId], [InsurerId], [PolicyTypeId], [Premium], [StatusId], [ClientId]) VALUES (3, 3, 1, 2, 59897, 2, 1)
INSERT [dbo].[Policy] ([PolicyId], [CustommerId], [InsurerId], [PolicyTypeId], [Premium], [StatusId], [ClientId]) VALUES (4, 3, 3, 1, 6845, 2, 1)
SET IDENTITY_INSERT [dbo].[Policy] OFF
SET IDENTITY_INSERT [dbo].[PolicyType] ON 

INSERT [dbo].[PolicyType] ([PolicyTypeId], [Title], [StatusId], [Description]) VALUES (1, N'Public Liability', 2, NULL)
INSERT [dbo].[PolicyType] ([PolicyTypeId], [Title], [StatusId], [Description]) VALUES (2, N'Motor Fleet', 2, NULL)
SET IDENTITY_INSERT [dbo].[PolicyType] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusId], [Title], [Description]) VALUES (1, N'New', NULL)
INSERT [dbo].[Status] ([StatusId], [Title], [Description]) VALUES (2, N'Active', NULL)
INSERT [dbo].[Status] ([StatusId], [Title], [Description]) VALUES (3, N'Inactive', NULL)
INSERT [dbo].[Status] ([StatusId], [Title], [Description]) VALUES (4, N'Deleted', NULL)
SET IDENTITY_INSERT [dbo].[Status] OFF
ALTER TABLE [dbo].[Brokerage]  WITH CHECK ADD  CONSTRAINT [FK_Brokerage_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Brokerage] CHECK CONSTRAINT [FK_Brokerage_Status]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Brokerage] FOREIGN KEY([BrokerageId])
REFERENCES [dbo].[Brokerage] ([BrokerageId])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Brokerage]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Status]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Status]
GO
ALTER TABLE [dbo].[Insurer]  WITH CHECK ADD  CONSTRAINT [FK_Insurer_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Insurer] CHECK CONSTRAINT [FK_Insurer_Status]
GO
ALTER TABLE [dbo].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_Policy_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([ClientId])
GO
ALTER TABLE [dbo].[Policy] CHECK CONSTRAINT [FK_Policy_Client]
GO
ALTER TABLE [dbo].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_Policy_Customer] FOREIGN KEY([CustommerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Policy] CHECK CONSTRAINT [FK_Policy_Customer]
GO
ALTER TABLE [dbo].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_Policy_Insurer] FOREIGN KEY([InsurerId])
REFERENCES [dbo].[Insurer] ([InsurerId])
GO
ALTER TABLE [dbo].[Policy] CHECK CONSTRAINT [FK_Policy_Insurer]
GO
ALTER TABLE [dbo].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_Policy_PolicyType] FOREIGN KEY([PolicyTypeId])
REFERENCES [dbo].[PolicyType] ([PolicyTypeId])
GO
ALTER TABLE [dbo].[Policy] CHECK CONSTRAINT [FK_Policy_PolicyType]
GO
ALTER TABLE [dbo].[Policy]  WITH CHECK ADD  CONSTRAINT [FK_Policy_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Policy] CHECK CONSTRAINT [FK_Policy_Status]
GO
ALTER TABLE [dbo].[PolicyType]  WITH CHECK ADD  CONSTRAINT [FK_PolicyType_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[PolicyType] CHECK CONSTRAINT [FK_PolicyType_Status]
GO
USE [master]
GO
ALTER DATABASE [BrokerageDB] SET  READ_WRITE 
GO
