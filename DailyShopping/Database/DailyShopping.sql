USE [master]
GO
/****** Object:  Database [DailyShopping]    Script Date: 7/25/2020 5:22:54 PM ******/
CREATE DATABASE [DailyShopping] ON  PRIMARY 
( NAME = N'DailyShopping', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\DailyShopping.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DailyShopping_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\DailyShopping_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DailyShopping] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DailyShopping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DailyShopping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DailyShopping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DailyShopping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DailyShopping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DailyShopping] SET ARITHABORT OFF 
GO
ALTER DATABASE [DailyShopping] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DailyShopping] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DailyShopping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DailyShopping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DailyShopping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DailyShopping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DailyShopping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DailyShopping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DailyShopping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DailyShopping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DailyShopping] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DailyShopping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DailyShopping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DailyShopping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DailyShopping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DailyShopping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DailyShopping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DailyShopping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DailyShopping] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DailyShopping] SET  MULTI_USER 
GO
ALTER DATABASE [DailyShopping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DailyShopping] SET DB_CHAINING OFF 
GO
USE [DailyShopping]
GO
/****** Object:  StoredProcedure [dbo].[AdminSignUpProcedure]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[AdminSignUpProcedure]
(
@name nvarchar(50),
@email nvarchar(50),
@pass nvarchar(50),
@role nvarchar(50)
)
AS
BEGIN
insert into AdminView(name,email,password) values (@name,@email,@pass)
END
BEGIN
insert into loginView(email,password,role) values (@email,@pass,@role)
END

GO
/****** Object:  StoredProcedure [dbo].[InsertCategoryProcedure]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[InsertCategoryProcedure]
(
@CatName nvarchar(50)
)
AS
BEGIN
insert into CategoryView(CategoryName) values (@CatName)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertProductProcedure]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[InsertProductProcedure]
(
@name nvarchar(50),
@description nvarchar(max),
@price int,
@Qty int,
@image nvarchar(max),
@category int
)
AS
BEGIN
insert into ProductView(name,description,price,quantity,image,category) values (@name,@description,@price,@Qty,@image,@category)
END
GO
/****** Object:  StoredProcedure [dbo].[LoginProcedure]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginProcedure]
@em nvarchar(50),
@pa nvarchar(50)
AS
BEGIN
Select * from loginView where email = @em and password = @pa
END

GO
/****** Object:  StoredProcedure [dbo].[ProductProcedure]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ProductProcedure]
AS
BEGIN
	SELECT * from ProductView
END


GO
/****** Object:  StoredProcedure [dbo].[UserSignUpProcedure]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[UserSignUpProcedure]
(
@fname nvarchar(50),
@lname nvarchar(50),
@email nvarchar(50),
@pass nvarchar(50),
@address nvarchar(MAX),
@city nvarchar(50),
@state nvarchar(50),
@pincode nvarchar(50),
@mobile nvarchar(50),
@role nvarchar(50)
)
AS
BEGIN
insert into UsersView(FirstName,lastName,email,password,address,city,state,pincode,mobile) values (@fname,@lname,@email,@pass,@address,@city,@state,@pincode,@mobile)
END
BEGIN
insert into loginView(email,password,role) values (@email,@pass,@role)
END

GO
/****** Object:  Table [dbo].[Admin]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Aid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Cid] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[comment] [nvarchar](max) NULL,
	[timespan] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[History]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[Activity] [nvarchar](50) NULL,
	[timespan] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Login]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[role] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Did] [int] IDENTITY(1,1) NOT NULL,
	[Oid] [int] NULL,
	[ProductName] [nvarchar](50) NULL,
	[price] [int] NULL,
	[qty] [int] NULL,
	[image] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Did] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Oid] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[city] [nvarchar](50) NULL,
	[state] [nvarchar](50) NULL,
	[pincode] [nvarchar](50) NULL,
	[mobile] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Oid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Pid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](max) NULL,
	[price] [int] NULL,
	[quantity] [int] NULL,
	[image] [nvarchar](max) NULL,
	[category] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Report]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Total] [int] NULL,
	[Profit] [int] NULL,
	[TotalCategory] [int] NULL,
	[TotalProducts] [int] NULL,
	[TotalCustomers] [int] NULL,
	[TotalOrders] [int] NULL,
	[timespan] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Uid] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[lastName] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[city] [nvarchar](50) NULL,
	[state] [nvarchar](50) NULL,
	[pincode] [nvarchar](50) NULL,
	[mobile] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Uid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[AdminView]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[AdminView] As
select * from Admin

GO
/****** Object:  View [dbo].[CategoryView]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[CategoryView] AS select * from Category
GO
/****** Object:  View [dbo].[CommentsView]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[CommentsView] As
select * from Comments

GO
/****** Object:  View [dbo].[HistoryView]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[HistoryView] As
select * from History

GO
/****** Object:  View [dbo].[loginView]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[loginView] As
select * from Login

GO
/****** Object:  View [dbo].[OrderDetailsView]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[OrderDetailsView] As
select * from OrderDetails

GO
/****** Object:  View [dbo].[OrdersView]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[OrdersView] As
select * from Orders

GO
/****** Object:  View [dbo].[ProductView]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[ProductView] As
select * from Product


GO
/****** Object:  View [dbo].[ReportView]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ReportView] As
select * from Report

GO
/****** Object:  View [dbo].[UsersView]    Script Date: 7/25/2020 5:22:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[UsersView] As
select * from Users

GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([Aid], [name], [email], [password]) VALUES (1, N'Afnan', N'hassanafnan20@gmail.com', N'12345ned')
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Cid], [CategoryName]) VALUES (1, N'Mobiles')
INSERT [dbo].[Category] ([Cid], [CategoryName]) VALUES (2, N'Sports')
INSERT [dbo].[Category] ([Cid], [CategoryName]) VALUES (3, N'Clothings')
INSERT [dbo].[Category] ([Cid], [CategoryName]) VALUES (4, N'Headphone')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([id], [email], [password], [role]) VALUES (1, N'hassan@gmail.com', N'123456', N'Users')
INSERT [dbo].[Login] ([id], [email], [password], [role]) VALUES (2, N'ansarmuahammadfaraz@gmail.com', N'12345', N'Users')
INSERT [dbo].[Login] ([id], [email], [password], [role]) VALUES (3, N'ansarmuahammadfaraz@gmail.com', N'12345', N'Users')
INSERT [dbo].[Login] ([id], [email], [password], [role]) VALUES (4, N'hassanafnan20@gmail.com', N'12345ned', N'Admin')
SET IDENTITY_INSERT [dbo].[Login] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Pid], [name], [description], [price], [quantity], [image], [category]) VALUES (1, N'GalaxyS4', N'A very great phone', 2000, 5, N'pic/sg.jpg', 1)
INSERT [dbo].[Product] ([Pid], [name], [description], [price], [quantity], [image], [category]) VALUES (2, N'GalaxyS5', N'A very very phone', 3000, 5, N'pic/sg.jpg', 1)
INSERT [dbo].[Product] ([Pid], [name], [description], [price], [quantity], [image], [category]) VALUES (3, N'RealMe311', N'A very very phone', 6000, 3, N'pic/sg.jpg', 1)
INSERT [dbo].[Product] ([Pid], [name], [description], [price], [quantity], [image], [category]) VALUES (5, N'Samsung S3', N'one year warranty', 10000, 23, N'pic/Penguins.jpg', 1)
INSERT [dbo].[Product] ([Pid], [name], [description], [price], [quantity], [image], [category]) VALUES (7, N'space headphone', N'new piece', 1000, 12, N'pic/5.jpg', 4)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Uid], [FirstName], [lastName], [email], [password], [address], [city], [state], [pincode], [mobile]) VALUES (1, N'Afnan', N'Hassan', N'hassan@gmail.com', N'123456', N'Karachi Pakistan', N'Karachi', N'Sd', N'74200', N'0343425678')
INSERT [dbo].[Users] ([Uid], [FirstName], [lastName], [email], [password], [address], [city], [state], [pincode], [mobile]) VALUES (3, N'faraz', N'ansar', N'ansarmuahammadfaraz@gmail.com', N'12345', N'street12', N'karachi', N'district central east', N'74600', N'03352722117')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([Oid])
REFERENCES [dbo].[Orders] ([Oid])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
USE [master]
GO
ALTER DATABASE [DailyShopping] SET  READ_WRITE 
GO
