USE [master]
GO
/****** Object:  Database [todolist]    Script Date: 2024/8/19 上午 11:47:25 ******/
CREATE DATABASE [todolist]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'todolist', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\todolist.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'todolist_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\todolist_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [todolist] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [todolist].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [todolist] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [todolist] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [todolist] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [todolist] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [todolist] SET ARITHABORT OFF 
GO
ALTER DATABASE [todolist] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [todolist] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [todolist] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [todolist] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [todolist] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [todolist] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [todolist] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [todolist] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [todolist] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [todolist] SET  DISABLE_BROKER 
GO
ALTER DATABASE [todolist] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [todolist] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [todolist] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [todolist] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [todolist] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [todolist] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [todolist] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [todolist] SET RECOVERY FULL 
GO
ALTER DATABASE [todolist] SET  MULTI_USER 
GO
ALTER DATABASE [todolist] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [todolist] SET DB_CHAINING OFF 
GO
ALTER DATABASE [todolist] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [todolist] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [todolist] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [todolist] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'todolist', N'ON'
GO
ALTER DATABASE [todolist] SET QUERY_STORE = ON
GO
ALTER DATABASE [todolist] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [todolist]
GO
/****** Object:  Table [dbo].[ToDoLists]    Script Date: 2024/8/19 上午 11:47:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ToDoLists](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[TaskContent] [nvarchar](50) NOT NULL,
	[PriorityLevel] [nvarchar](50) NOT NULL,
	[TaskStatus] [nvarchar](5) NOT NULL,
	[ExpectedFinishTime] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2024/8/19 上午 11:47:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[UserEmail] [nvarchar](50) NOT NULL,
	[PasswordHash] [varbinary](64) NOT NULL,
	[PasswordSalt] [varbinary](64) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ToDoLists] ON 

INSERT [dbo].[ToDoLists] ([TaskId], [TaskContent], [PriorityLevel], [TaskStatus], [ExpectedFinishTime]) VALUES (5, N'寫mvc練習作業(CRUD、cookies)。', N'高', N'處理中', CAST(N'2024-08-20T12:00:00.000' AS DateTime))
INSERT [dbo].[ToDoLists] ([TaskId], [TaskContent], [PriorityLevel], [TaskStatus], [ExpectedFinishTime]) VALUES (1002, N'買C#工具書、買文具。', N'中', N'已完成', CAST(N'2024-08-18T21:40:00.000' AS DateTime))
INSERT [dbo].[ToDoLists] ([TaskId], [TaskContent], [PriorityLevel], [TaskStatus], [ExpectedFinishTime]) VALUES (1004, N'安排中會議室邀請各單位主管', N'低', N'待處理', CAST(N'2024-08-20T20:50:00.000' AS DateTime))
INSERT [dbo].[ToDoLists] ([TaskId], [TaskContent], [PriorityLevel], [TaskStatus], [ExpectedFinishTime]) VALUES (1006, N'練習唱周杰倫的星情', N'中', N'已完成', CAST(N'2024-08-18T12:40:00.000' AS DateTime))
INSERT [dbo].[ToDoLists] ([TaskId], [TaskContent], [PriorityLevel], [TaskStatus], [ExpectedFinishTime]) VALUES (1008, N'去健身房練腿。', N'低', N'已完成', CAST(N'2024-08-20T14:00:00.000' AS DateTime))
INSERT [dbo].[ToDoLists] ([TaskId], [TaskContent], [PriorityLevel], [TaskStatus], [ExpectedFinishTime]) VALUES (1009, N'看衛視電影台，看完之後去夜市吃消夜', N'中', N'待處理', CAST(N'2024-08-18T22:55:00.000' AS DateTime))
INSERT [dbo].[ToDoLists] ([TaskId], [TaskContent], [PriorityLevel], [TaskStatus], [ExpectedFinishTime]) VALUES (1011, N'回桃園去永安漁港吃海產，順便看夜景。', N'低', N'待處理', CAST(N'2024-08-30T11:25:00.000' AS DateTime))
INSERT [dbo].[ToDoLists] ([TaskId], [TaskContent], [PriorityLevel], [TaskStatus], [ExpectedFinishTime]) VALUES (1013, N'繳交行冠企業技術考題。', N'高', N'已完成', CAST(N'2024-08-19T16:20:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ToDoLists] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [UserEmail], [PasswordHash], [PasswordSalt]) VALUES (1, N'aaa', N'simon@gmail', 0xD941A31E22C58EAD8B8C7ED61439A2DAEF4D6BC367C3699E442F419A6982C525, 0x398D8BA4A9192D9B)
INSERT [dbo].[Users] ([UserID], [Username], [UserEmail], [PasswordHash], [PasswordSalt]) VALUES (2, N'apple', N'apple@gmail.com', 0xD941A31E22C58EAD8B8C7ED61439A2DAEF4D6BC367C3699E442F419A6982C525, 0x276DD4DD1D432D08)
INSERT [dbo].[Users] ([UserID], [Username], [UserEmail], [PasswordHash], [PasswordSalt]) VALUES (3, N'simon', N'simon@gmail.com', 0xD941A31E22C58EAD8B8C7ED61439A2DAEF4D6BC367C3699E442F419A6982C525, 0xF4C40C9048D0CD66)
INSERT [dbo].[Users] ([UserID], [Username], [UserEmail], [PasswordHash], [PasswordSalt]) VALUES (4, N'ccc', N'ccc@gmail.com', 0xD7D537ABA1DEF10EFB1D6904E92571B851B79D1F90E9AF129DCF8CE298AB4310, 0xA22DC20F03551C7A)
INSERT [dbo].[Users] ([UserID], [Username], [UserEmail], [PasswordHash], [PasswordSalt]) VALUES (5, N'CCC', N'CCC@gmail.com', 0x29543973265AB07FA200F8EB67DAFE4DA54B64D092CA15AB9A472B0F8CABD3EE, 0x6FC3DECC68723128)
INSERT [dbo].[Users] ([UserID], [Username], [UserEmail], [PasswordHash], [PasswordSalt]) VALUES (6, N'ccc1', N'ccc1@gmail.com', 0x29543973265AB07FA200F8EB67DAFE4DA54B64D092CA15AB9A472B0F8CABD3EE, 0xDFF86A889C1403B8)
INSERT [dbo].[Users] ([UserID], [Username], [UserEmail], [PasswordHash], [PasswordSalt]) VALUES (7, N'AAA', N'AAA@gmail.com', 0xD941A31E22C58EAD8B8C7ED61439A2DAEF4D6BC367C3699E442F419A6982C525, 0x6E20CCCF079F0006)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
USE [master]
GO
ALTER DATABASE [todolist] SET  READ_WRITE 
GO
