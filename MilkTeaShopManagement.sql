USE [master]
GO
/****** Object:  Database [MilkTeaShopManagement]    Script Date: 08-Jul-22 11:52:45 PM ******/
CREATE DATABASE [MilkTeaShopManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MilkTeaShopManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MilkTeaShopManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MilkTeaShopManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MilkTeaShopManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MilkTeaShopManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MilkTeaShopManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MilkTeaShopManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MilkTeaShopManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MilkTeaShopManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MilkTeaShopManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MilkTeaShopManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [MilkTeaShopManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MilkTeaShopManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MilkTeaShopManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MilkTeaShopManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MilkTeaShopManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MilkTeaShopManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MilkTeaShopManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MilkTeaShopManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MilkTeaShopManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MilkTeaShopManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MilkTeaShopManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MilkTeaShopManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MilkTeaShopManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MilkTeaShopManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MilkTeaShopManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MilkTeaShopManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MilkTeaShopManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MilkTeaShopManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [MilkTeaShopManagement] SET  MULTI_USER 
GO
ALTER DATABASE [MilkTeaShopManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MilkTeaShopManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MilkTeaShopManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MilkTeaShopManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MilkTeaShopManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MilkTeaShopManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MilkTeaShopManagement', N'ON'
GO
ALTER DATABASE [MilkTeaShopManagement] SET QUERY_STORE = OFF
GO
USE [MilkTeaShopManagement]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 08-Jul-22 11:52:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [int] NOT NULL,
	[name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 08-Jul-22 11:52:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] IDENTITY(0,1) NOT NULL,
	[userID] [varchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[total] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 08-Jul-22 11:52:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[orderID] [int] NOT NULL,
	[productID] [varchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 08-Jul-22 11:52:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [varchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[categoryID] [int] NOT NULL,
	[productIMG] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 08-Jul-22 11:52:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[roleID] [varchar](2) NOT NULL,
	[roleName] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 08-Jul-22 11:52:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [varchar](50) NOT NULL,
	[fullName] [nvarchar](30) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[address] [nvarchar](100) NOT NULL,
	[roleID] [varchar](2) NOT NULL,
	[password] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (1, N'Trà trái cây')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (2, N'Trà sữa tươi - Sữa tươi')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (3, N'Trà sữa')
INSERT [dbo].[tblCategory] ([categoryID], [name]) VALUES (4, N'Trà cream')
GO
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([orderID], [userID], [date], [total]) VALUES (0, N'keito1507', CAST(N'2022-07-08' AS Date), 85000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [date], [total]) VALUES (1, N'keito1507', CAST(N'2022-07-08' AS Date), 85000)
INSERT [dbo].[tblOrder] ([orderID], [userID], [date], [total]) VALUES (2, N'keito1507', CAST(N'2022-07-08' AS Date), 85000)
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
GO
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (0, N'T002', 85000, 1)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (1, N'T002', 85000, 1)
INSERT [dbo].[tblOrderDetail] ([orderID], [productID], [price], [quantity]) VALUES (2, N'T002', 85000, 1)
GO
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [description]) VALUES (N'T002', N'Lục trà nho', 85000, 997, 1, N'https://centraltea.vn/wp-content/uploads/2022/03/THUMBNAIL-TRA-NHO-01.jpg', N'Lục trà nho là sự kết hợp giữa lục trà và nho tạo vị ngọt thanh khi uống. Đây thuộc nhóm danh mục Trà trái cây dành cho những ai thích sự thuần khiết và tươi mát giữa cái nóng gay gắt tại thành phố mang tên Bác. Tiêu biểu là các ly trà như Hồng trà dâu nhiệt đới, Trà trái cây tươi Hawaiian …')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [description]) VALUES (N'T003', N'Hồng trà dâu nhiệt đới', 85000, 999, 1, N'https://centraltea.vn/wp-content/uploads/2022/04/hong-tra-dau-nhiet-doi.jpg', N'Hồng trà dâu nhiệt đới là sự kết hợp giữa lục trà và nho tạo vị ngọt thanh khi uống. Đây thuộc nhóm danh mục Trà trái cây dành cho những ai thích sự thuần khiết và tươi mát giữa cái nóng gay gắt tại thành phố mang tên Bác. Tiêu biểu là các ly trà như Hồng trà dâu nhiệt đới, Trà trái cây tươi Hawaiian …')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [description]) VALUES (N'T004', N'Lục trà đào thơm ngon bổ dưỡng', 85000, 999, 1, N'https://centraltea.vn/wp-content/uploads/2022/03/THUMBNAIL-LUC-TRA-DAO-01.jpg', N'Lục trà đào là sự kết hợp giữa lục trà và nho tạo vị ngọt thanh khi uống. Đây thuộc nhóm danh mục Trà trái cây dành cho những ai thích sự thuần khiết và tươi mát giữa cái nóng gay gắt tại thành phố mang tên Bác. Tiêu biểu là các ly trà như Hồng trà dâu nhiệt đới, Trà trái cây tươi Hawaiian …')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [description]) VALUES (N'T005', N'Trà olong hoa hồng chanh đào', 80000, 999, 1, N'https://centraltea.vn/wp-content/uploads/2022/03/tra-olong-hoa-hong-chanh-dao.jpg', N'Trà olong hoa hồng chanh đào là sự kết hợp giữa lục trà và nho tạo vị ngọt thanh khi uống. Đây thuộc nhóm danh mục Trà trái cây dành cho những ai thích sự thuần khiết và tươi mát giữa cái nóng gay gắt tại thành phố mang tên Bác. Tiêu biểu là các ly trà như Hồng trà dâu nhiệt đới, Trà trái cây tươi Hawaiian …')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [description]) VALUES (N'T006', N'Trà trái cây nhiệt đới Fruit cup', 85000, 999, 1, N'https://centraltea.vn/wp-content/uploads/2022/03/tra-trai-cay-nhiet-doi-Fruit-cup.jpg', N'Trà trái cây nhiệt đới Fruit cup là sự kết hợp giữa lục trà và nho tạo vị ngọt thanh khi uống. Đây thuộc nhóm danh mục Trà trái cây dành cho những ai thích sự thuần khiết và tươi mát giữa cái nóng gay gắt tại thành phố mang tên Bác. Tiêu biểu là các ly trà như Hồng trà dâu nhiệt đới, Trà trái cây tươi Hawaiian …')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [description]) VALUES (N'T007', N'Trà sữa tươi hạnh nhân', 85000, 999, 2, N'https://centraltea.vn/wp-content/uploads/2022/03/THUMBNAIL-TRA-SUA-TUOI-HANH-NHAN-01.jpg', N'Trà sữa tươi hạnh nhân là sự kết hợp giữa lục trà và nho tạo vị ngọt thanh khi uống. Đây thuộc nhóm danh mục Trà sữa tươi mà nhất định bạn phải thử để cảm nhận những ly trà bán chạy nhất của chúng tôi như Sữa tươi trân châu đường đen, Trà sữa tươi pudding …')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [description]) VALUES (N'T008', N'Trà sữa tươi caramel dâu', 85000, 999, 2, N'https://centraltea.vn/wp-content/uploads/2022/03/THUMBNAIL-TRA-SUA-TUOI-CARAMEL-01.jpg', N'Trà sữa tươi caramel dâu là sự kết hợp giữa lục trà và nho tạo vị ngọt thanh khi uống. Đây thuộc nhóm danh mục Trà sữa tươi mà nhất định bạn phải thử để cảm nhận những ly trà bán chạy nhất của chúng tôi như Sữa tươi trân châu đường đen, Trà sữa tươi pudding …')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [description]) VALUES (N'T009', N'Trà sữa tươi trân châu đường đen', 85000, 999, 2, N'https://centraltea.vn/wp-content/uploads/2022/03/tra-sua-tuoi-tran-chau.jpg', N'Trà sữa tươi trân châu đường đen là sự kết hợp giữa lục trà và nho tạo vị ngọt thanh khi uống. Đây thuộc nhóm danh mục Trà sữa tươi mà nhất định bạn phải thử để cảm nhận những ly trà bán chạy nhất của chúng tôi như Sữa tươi trân châu đường đen, Trà sữa tươi pudding …')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [description]) VALUES (N'T010', N'Sữa tươi trân châu đường đen cheese brulee', 90000, 999, 2, N'https://centraltea.vn/wp-content/uploads/2022/03/tra-sua-tuoi-tran-chau-duong-den-cheese-brulee.jpg', N'Sữa tươi trân châu đường đen cheese brulee là sự kết hợp giữa lục trà và nho tạo vị ngọt thanh khi uống. Đây thuộc nhóm danh mục Trà sữa tươi mà nhất định bạn phải thử để cảm nhận những ly trà bán chạy nhất của chúng tôi như Sữa tươi trân châu đường đen, Trà sữa tươi pudding …')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [description]) VALUES (N'T011', N'Socola trân châu đường đen cheese brulee', 90000, 999, 2, N'https://centraltea.vn/wp-content/uploads/2022/03/socola-tran-chau-duong-den-cheese-brulee.jpg', N'Socola trân châu đường đen cheese brulee là sự kết hợp giữa lục trà và nho tạo vị ngọt thanh khi uống.')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [description]) VALUES (N'T012', N'Sữa tươi trân châu đường đen', 85000, 999, 2, N'https://centraltea.vn/wp-content/uploads/2022/03/sua-tuoi-tran-chau.jpg', N'Sữa tươi trân châu đường đen là sự kết hợp giữa lục trà và nho tạo vị ngọt thanh khi uống. Đây thuộc nhóm danh mục Trà sữa tươi mà nhất định bạn phải thử để cảm nhận những ly trà bán chạy nhất của chúng tôi như Sữa tươi trân châu đường đen, Trà sữa tươi pudding …')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [description]) VALUES (N'T013', N'Sữa tươi caramel trân châu pudding', 90000, 999, 2, N'https://centraltea.vn/wp-content/uploads/2022/03/sua-tuoi-caramel-tran-chau-pudding.jpg', N'Sữa tươi caramel trân châu pudding là sự kết hợp giữa lục trà và nho tạo vị ngọt thanh khi uống. Đây thuộc nhóm danh mục Trà sữa tươi mà nhất định bạn phải thử để cảm nhận những ly trà bán chạy nhất của chúng tôi như Sữa tươi trân châu đường đen, Trà sữa tươi pudding …')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [description]) VALUES (N'T014', N'Hồng-Lục trà sữa pudding cream', 90000, 999, 3, N'https://centraltea.vn/wp-content/uploads/2022/03/hong-luc-tra-sua-cream.jpg', N'Hồng-Lục trà sữa pudding cream là sự kết hợp giữa lục trà và nho tạo vị ngọt thanh khi uống. Đây thuộc nhóm danh mục Trà sữa mà nhất định bạn phải thử để cảm nhận những ly trà bán chạy nhất của chúng tôi như Trà sữa trân châu đường đen, Trà sữa vị phomai pudding trứng …')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [description]) VALUES (N'T015', N'Trà sữa olong hoa hồng yến mạch', 80000, 999, 3, N'https://centraltea.vn/wp-content/uploads/2022/03/tra-sua-olong-hoa-hong-yen-mach.jpg', N'Trà sữa olong hoa hồng yến mạch là sự kết hợp giữa lục trà và nho tạo vị ngọt thanh khi uống. Đây thuộc nhóm danh mục Trà sữa mà nhất định bạn phải thử để cảm nhận những ly trà bán chạy nhất của chúng tôi như Trà sữa trân châu đường đen, Trà sữa vị phomai pudding trứng …')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [description]) VALUES (N'T016', N'Trà sữa 3 loại thạch giòn dai', 90000, 999, 3, N'https://centraltea.vn/wp-content/uploads/2022/03/tra-sua-3-loai-thach.jpg', N'Trà sữa 3 loại thạch giòn dai là sự kết hợp giữa lục trà và nho tạo vị ngọt thanh khi uống. Đây thuộc nhóm danh mục Trà sữa mà nhất định bạn phải thử để cảm nhận những ly trà bán chạy nhất của chúng tôi như Trà sữa trân châu đường đen, Trà sữa vị phomai pudding trứng …')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [description]) VALUES (N'T017', N'Trà sữa vị phô mai pudding trứng', 85000, 999, 3, N'https://centraltea.vn/wp-content/uploads/2022/03/THUMBNAIL-LUC-TRA-SUA-PHO-MAI-PUDDING-01.jpg', N'Trà sữa vị phô mai pudding trứng là sự kết hợp giữa lục trà và nho tạo vị ngọt thanh khi uống. Đây thuộc nhóm danh mục Trà sữa mà nhất định bạn phải thử để cảm nhận những ly trà bán chạy nhất của chúng tôi như Trà sữa trân châu đường đen, Trà sữa vị phomai pudding trứng …')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [description]) VALUES (N'T018', N'Sữa cookies cream ngon sánh mịn', 70000, 999, 4, N'https://centraltea.vn/wp-content/uploads/2022/04/sua-cookies-cream.jpg', N'Sữa cookies cream là sự kết hợp giữa lục trà và nho tạo vị ngọt thanh khi uống. Nó thuộc nhóm Trà cream dành cho những ai yêu thích các sản phẩm kem tuyệt đỉnh của R&B Tea.')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [description]) VALUES (N'T019', N'Trà sữa ngũ cốc cream ngon tuyệt', 88000, 999, 4, N'https://centraltea.vn/wp-content/uploads/2022/03/tra-sua-ngu-coc-cream.jpg', N'Trà sữa ngũ cốc cream là sự kết hợp giữa lục trà và nho tạo vị ngọt thanh khi uống. Nó thuộc nhóm Trà cream dành cho những ai yêu thích các sản phẩm kem tuyệt đỉnh của R&B Tea.')
INSERT [dbo].[tblProduct] ([productID], [name], [price], [quantity], [categoryID], [productIMG], [description]) VALUES (N'T020', N'Trà sữa oreo socola cream', 88000, 999, 4, N'https://centraltea.vn/wp-content/uploads/2022/03/tra-sua-oreo-cream.jpg', N'Trà sữa oreo socola cream là sự kết hợp giữa lục trà và nho tạo vị ngọt thanh khi uống.')
GO
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'AD', N'ADMIN')
INSERT [dbo].[tblRole] ([roleID], [roleName]) VALUES (N'US', N'USER')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [email], [address], [roleID], [password]) VALUES (N'admin', N'ADMINISTRATOR', N'hvinh24@gmail.com', N'84 Nguyễn Thái Học, Quận 1', N'AD', N'admin')
INSERT [dbo].[tblUsers] ([userID], [fullName], [email], [address], [roleID], [password]) VALUES (N'hvinh24', N'Nguyen Hien Vinh (K16_HCM)', N'vinhnhse162003@fpt.edu.vn', N'Lô E2a-7, Đường D1, Đ. D1, Long Thạnh Mỹ, Thành Phố Thủ Đức', N'AD', N'123456')
INSERT [dbo].[tblUsers] ([userID], [fullName], [email], [address], [roleID], [password]) VALUES (N'keito1507', N'', N'keito1507@gmail.com', N'L1 cư xá Nguyễn Đình Chiểu, Phường 4 Quận Phú Nhuận', N'US', N'123456')
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [tblProduct_categoryID_tblCategory_categoryID] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [tblProduct_categoryID_tblCategory_categoryID]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD  CONSTRAINT [tblUsers_roleID_tblRole_roleID] FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRole] ([roleID])
GO
ALTER TABLE [dbo].[tblUsers] CHECK CONSTRAINT [tblUsers_roleID_tblRole_roleID]
GO
USE [master]
GO
ALTER DATABASE [MilkTeaShopManagement] SET  READ_WRITE 
GO
