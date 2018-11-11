USE [master]
GO
/****** Object:  Database [ShortLink]    Script Date: 10/21/2018 5:33:31 PM ******/
CREATE DATABASE [ShortLink]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShortLink', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ShortLink.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShortLink_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ShortLink_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShortLink] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShortLink].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShortLink] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShortLink] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShortLink] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShortLink] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShortLink] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShortLink] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShortLink] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ShortLink] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShortLink] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShortLink] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShortLink] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShortLink] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShortLink] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShortLink] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShortLink] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShortLink] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShortLink] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShortLink] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShortLink] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShortLink] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShortLink] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShortLink] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShortLink] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShortLink] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShortLink] SET  MULTI_USER 
GO
ALTER DATABASE [ShortLink] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShortLink] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShortLink] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShortLink] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ShortLink]
GO
/****** Object:  Table [dbo].[BlackList]    Script Date: 10/21/2018 5:33:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlackList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[URL] [nvarchar](50) NOT NULL,
	[Create_User] [int] NULL,
	[Create_Date] [date] NULL,
	[Update_User] [nvarchar](50) NULL,
	[Update_Date] [date] NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_BlackList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Config]    Script Date: 10/21/2018 5:33:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Config](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Config_Name] [nvarchar](50) NOT NULL,
	[Value] [int] NOT NULL,
 CONSTRAINT [PK_Config] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GiftCode]    Script Date: 10/21/2018 5:33:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiftCode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Gift_Code] [nvarchar](50) NULL,
	[Gift_Name] [nvarchar](50) NULL,
	[Gift_Status] [bit] NULL,
	[Gift_Date_Vip] [int] NULL,
 CONSTRAINT [PK_GiftCode] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Link]    Script Date: 10/21/2018 5:33:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Link](
	[Link_ID] [int] IDENTITY(1,1) NOT NULL,
	[Link_Code] [nvarchar](500) NOT NULL,
	[Link_URL] [nvarchar](500) NOT NULL,
	[Create_Date] [date] NOT NULL,
	[Create_User] [int] NULL,
	[Expiry_Date] [date] NULL,
	[Status] [bit] NULL,
	[Link_View] [int] NULL,
	[Link_Title] [nvarchar](500) NULL,
	[Link_Type] [smallint] NULL,
 CONSTRAINT [PK_Link] PRIMARY KEY CLUSTERED 
(
	[Link_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/21/2018 5:33:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Role_Id] [int] NOT NULL,
	[Role_Name] [nvarchar](50) NOT NULL,
	[Descristion] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Role_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/21/2018 5:33:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_id] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[User_FullName] [nvarchar](50) NULL,
	[User_PassWord] [nvarchar](50) NULL,
	[Role_Id] [int] NULL,
	[Create_Date] [date] NULL,
	[Status] [bit] NULL,
	[Expiry_Date_Vip] [date] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[User_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VipCode]    Script Date: 10/21/2018 5:33:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VipCode](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Gift_Code] [nvarchar](50) NULL,
	[Gift_Name] [nvarchar](50) NULL,
	[Gift_Status] [bit] NULL,
	[Gift_Date_Vip] [int] NULL,
 CONSTRAINT [PK_VipCode] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BlackList] ON 

INSERT [dbo].[BlackList] ([ID], [URL], [Create_User], [Create_Date], [Update_User], [Update_Date], [Status]) VALUES (1, N'https://www.xvideos.com/', 5, NULL, NULL, NULL, NULL)
INSERT [dbo].[BlackList] ([ID], [URL], [Create_User], [Create_Date], [Update_User], [Update_Date], [Status]) VALUES (2, N'www.youtube.com', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[BlackList] ([ID], [URL], [Create_User], [Create_Date], [Update_User], [Update_Date], [Status]) VALUES (3, N'', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[BlackList] OFF
SET IDENTITY_INSERT [dbo].[Config] ON 

INSERT [dbo].[Config] ([ID], [Config_Name], [Value]) VALUES (2, N'Cấu hình số lượng point gia hạn / view', 100)
INSERT [dbo].[Config] ([ID], [Config_Name], [Value]) VALUES (3, N'Cấu hình thời hạn link / ngày', 30)
SET IDENTITY_INSERT [dbo].[Config] OFF
SET IDENTITY_INSERT [dbo].[GiftCode] ON 

INSERT [dbo].[GiftCode] ([ID], [Gift_Code], [Gift_Name], [Gift_Status], [Gift_Date_Vip]) VALUES (1, N'datdeptrai', N'30 Ngày vip', 1, 30)
INSERT [dbo].[GiftCode] ([ID], [Gift_Code], [Gift_Name], [Gift_Status], [Gift_Date_Vip]) VALUES (2, N'datdeptrai2', N'60 Ngày vip', 1, 60)
SET IDENTITY_INSERT [dbo].[GiftCode] OFF
SET IDENTITY_INSERT [dbo].[Link] ON 

INSERT [dbo].[Link] ([Link_ID], [Link_Code], [Link_URL], [Create_Date], [Create_User], [Expiry_Date], [Status], [Link_View], [Link_Title], [Link_Type]) VALUES (1111, N'Vcjzr', N'', CAST(N'2018-10-07' AS Date), NULL, NULL, 1, 0, NULL, 0)
INSERT [dbo].[Link] ([Link_ID], [Link_Code], [Link_URL], [Create_Date], [Create_User], [Expiry_Date], [Status], [Link_View], [Link_Title], [Link_Type]) VALUES (1112, N'NXPFK', N'https://viblo.asia/p/securing-spring-boot-with-jwt-bJzKm14rK9N', CAST(N'2018-10-07' AS Date), NULL, NULL, 1, 3, NULL, 0)
INSERT [dbo].[Link] ([Link_ID], [Link_Code], [Link_URL], [Create_Date], [Create_User], [Expiry_Date], [Status], [Link_View], [Link_Title], [Link_Type]) VALUES (1113, N'NJRDX', N'', CAST(N'2018-10-07' AS Date), 6, NULL, 1, 0, NULL, 0)
INSERT [dbo].[Link] ([Link_ID], [Link_Code], [Link_URL], [Create_Date], [Create_User], [Expiry_Date], [Status], [Link_View], [Link_Title], [Link_Type]) VALUES (1114, N'hMNOb', N'https://stackoverflow.com/questions/5683728/convert-java-util-date-to-string', CAST(N'2018-10-07' AS Date), 5, NULL, 1, 5, NULL, 0)
INSERT [dbo].[Link] ([Link_ID], [Link_Code], [Link_URL], [Create_Date], [Create_User], [Expiry_Date], [Status], [Link_View], [Link_Title], [Link_Type]) VALUES (1115, N'jards', N'http://localhost:8084/gethistory', CAST(N'2018-10-07' AS Date), 5, NULL, 1, 0, NULL, 0)
INSERT [dbo].[Link] ([Link_ID], [Link_Code], [Link_URL], [Create_Date], [Create_User], [Expiry_Date], [Status], [Link_View], [Link_Title], [Link_Type]) VALUES (1116, N'VZuAm', N'https://google.com.vn', CAST(N'2018-10-07' AS Date), NULL, NULL, 1, 1, NULL, 0)
INSERT [dbo].[Link] ([Link_ID], [Link_Code], [Link_URL], [Create_Date], [Create_User], [Expiry_Date], [Status], [Link_View], [Link_Title], [Link_Type]) VALUES (1117, N'TGFjC', N'https://google.com.vn', CAST(N'2018-10-07' AS Date), 5, NULL, 1, 0, NULL, 0)
INSERT [dbo].[Link] ([Link_ID], [Link_Code], [Link_URL], [Create_Date], [Create_User], [Expiry_Date], [Status], [Link_View], [Link_Title], [Link_Type]) VALUES (1118, N'6Cw3y', N'https://google.com.vn', CAST(N'2018-10-07' AS Date), 5, NULL, 1, 0, NULL, 0)
INSERT [dbo].[Link] ([Link_ID], [Link_Code], [Link_URL], [Create_Date], [Create_User], [Expiry_Date], [Status], [Link_View], [Link_Title], [Link_Type]) VALUES (1119, N'BpZMD', N'https://google.com.vn', CAST(N'2018-10-07' AS Date), 5, NULL, 1, 0, NULL, 0)
INSERT [dbo].[Link] ([Link_ID], [Link_Code], [Link_URL], [Create_Date], [Create_User], [Expiry_Date], [Status], [Link_View], [Link_Title], [Link_Type]) VALUES (1121, N'aa', N'aa', CAST(N'2018-10-14' AS Date), NULL, NULL, 1, 0, NULL, 0)
INSERT [dbo].[Link] ([Link_ID], [Link_Code], [Link_URL], [Create_Date], [Create_User], [Expiry_Date], [Status], [Link_View], [Link_Title], [Link_Type]) VALUES (1122, N'aa', N'aa', CAST(N'2018-10-14' AS Date), NULL, NULL, 1, 0, NULL, 0)
INSERT [dbo].[Link] ([Link_ID], [Link_Code], [Link_URL], [Create_Date], [Create_User], [Expiry_Date], [Status], [Link_View], [Link_Title], [Link_Type]) VALUES (1123, N'sRgBF', N'https://www.google.com.vn/', CAST(N'2018-10-14' AS Date), NULL, NULL, 1, 13, NULL, 0)
INSERT [dbo].[Link] ([Link_ID], [Link_Code], [Link_URL], [Create_Date], [Create_User], [Expiry_Date], [Status], [Link_View], [Link_Title], [Link_Type]) VALUES (1124, N'mdqKX', N'https://www.google.com.vn/', CAST(N'2018-10-14' AS Date), NULL, NULL, 1, 1, NULL, 0)
INSERT [dbo].[Link] ([Link_ID], [Link_Code], [Link_URL], [Create_Date], [Create_User], [Expiry_Date], [Status], [Link_View], [Link_Title], [Link_Type]) VALUES (1125, N'WxH6z', N'https://www.xvideos.com/', CAST(N'2018-10-14' AS Date), NULL, NULL, 1, 0, NULL, 0)
INSERT [dbo].[Link] ([Link_ID], [Link_Code], [Link_URL], [Create_Date], [Create_User], [Expiry_Date], [Status], [Link_View], [Link_Title], [Link_Type]) VALUES (1126, N'AEWgD', N'https://docs.google.com/spreadsheets/d/1tcGh8k-2fmVykbRG7Uus4rNQb3bubkS-cvLw3SFYku0/edit#gid=0', CAST(N'2018-10-21' AS Date), NULL, CAST(N'2018-11-20' AS Date), 1, 0, NULL, 0)
SET IDENTITY_INSERT [dbo].[Link] OFF
INSERT [dbo].[Roles] ([Role_Id], [Role_Name], [Descristion]) VALUES (1, N'Admin', N'Quản lý')
INSERT [dbo].[Roles] ([Role_Id], [Role_Name], [Descristion]) VALUES (2, N'Thành viên', N'Thành viên trong hệ thống')
INSERT [dbo].[Roles] ([Role_Id], [Role_Name], [Descristion]) VALUES (3, N'Thành viên vip', N'Thành viên vip')
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([User_id], [User_Name], [Email], [User_FullName], [User_PassWord], [Role_Id], [Create_Date], [Status], [Expiry_Date_Vip]) VALUES (5, N'admin', NULL, N'admin', N'123456', 1, CAST(N'2018-08-08' AS Date), 1, NULL)
INSERT [dbo].[Users] ([User_id], [User_Name], [Email], [User_FullName], [User_PassWord], [Role_Id], [Create_Date], [Status], [Expiry_Date_Vip]) VALUES (6, N'vip', NULL, NULL, N'123456', 3, NULL, 1, NULL)
INSERT [dbo].[Users] ([User_id], [User_Name], [Email], [User_FullName], [User_PassWord], [Role_Id], [Create_Date], [Status], [Expiry_Date_Vip]) VALUES (7, N'datkurai', NULL, NULL, N'123456', 2, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Link]  WITH CHECK ADD  CONSTRAINT [FK_Link_Users] FOREIGN KEY([Create_User])
REFERENCES [dbo].[Users] ([User_id])
GO
ALTER TABLE [dbo].[Link] CHECK CONSTRAINT [FK_Link_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([Role_Id])
REFERENCES [dbo].[Roles] ([Role_Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
USE [master]
GO
ALTER DATABASE [ShortLink] SET  READ_WRITE 
GO
