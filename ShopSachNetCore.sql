USE [ShopSachNetCore]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 5/20/2025 9:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 5/20/2025 9:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/20/2025 9:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/20/2025 9:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/20/2025 9:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/20/2025 9:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/20/2025 9:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[BirthDate] [datetime2](7) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 5/20/2025 9:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 5/20/2025 9:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[madon] [int] NOT NULL,
	[masp] [int] NOT NULL,
	[soluong] [int] NULL,
	[gia] [decimal](18, 0) NULL,
	[tongsoluong] [int] NULL,
	[tonggia] [decimal](18, 0) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK__ChiTietD__3C460110D46F34D2] PRIMARY KEY CLUSTERED 
(
	[madon] ASC,
	[masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 5/20/2025 9:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Rating] [float] NULL,
	[Ngaycapnhap] [datetime] NULL,
	[trangthai] [int] NULL,
	[id_sp] [int] NULL,
	[id_kh] [int] NULL,
 CONSTRAINT [PK_DanhGia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 5/20/2025 9:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[idDanhmuc] [int] IDENTITY(1,1) NOT NULL,
	[tendanhmuc] [nvarchar](30) NULL,
	[ParentID] [nvarchar](100) NULL,
 CONSTRAINT [PK__DanhMuc__DB790BF68C813DE1] PRIMARY KEY CLUSTERED 
(
	[idDanhmuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DichVu]    Script Date: 5/20/2025 9:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DichVu](
	[iddichvu] [int] IDENTITY(1,1) NOT NULL,
	[hoten] [nvarchar](30) NULL,
	[email] [nvarchar](30) NULL,
	[sdt] [nvarchar](30) NULL,
	[diachi] [nvarchar](30) NULL,
	[trangthai] [nvarchar](30) NULL,
	[tendichvu] [nvarchar](30) NULL,
	[ngaydat] [datetime] NULL,
	[makh] [int] NULL,
 CONSTRAINT [PK__DichVu__77FDDBF8BC48DDF1] PRIMARY KEY CLUSTERED 
(
	[iddichvu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 5/20/2025 9:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[madon] [int] IDENTITY(1,1) NOT NULL,
	[thanhtoan] [nvarchar](50) NULL,
	[giaohang] [nvarchar](255) NULL,
	[ngaydat] [date] NULL,
	[ngaygiao] [date] NULL,
	[makh] [int] NULL,
 CONSTRAINT [PK__DonHang__0BE416770A34913A] PRIMARY KEY CLUSTERED 
(
	[madon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 5/20/2025 9:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[makh] [int] IDENTITY(1,1) NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[tendangnhap] [varchar](20) NULL,
	[matkhau] [nvarchar](255) NULL,
	[email] [varchar](50) NULL,
	[diachi] [nvarchar](100) NULL,
	[dienthoai] [varchar](15) NULL,
	[ngaysinh] [date] NULL,
	[RoleID] [int] NULL,
	[status] [int] NULL,
	[resetpasswordcode] [nvarchar](255) NULL,
 CONSTRAINT [PK__KhachHan__7A21BB4CE42C9226] PRIMARY KEY CLUSTERED 
(
	[makh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHangRoles]    Script Date: 5/20/2025 9:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHangRoles](
	[RoleID] [int] NOT NULL,
	[RoleName] [varchar](30) NULL,
 CONSTRAINT [PK__KhachHan__8AFACE3A2B34BEF9] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LiveStream]    Script Date: 5/20/2025 9:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LiveStream](
	[idLiveStream] [int] IDENTITY(1,1) NOT NULL,
	[noidunglive] [nvarchar](255) NULL,
	[hinh] [nvarchar](255) NULL,
	[link] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[idLiveStream] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 5/20/2025 9:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[masp] [int] IDENTITY(1,1) NOT NULL,
	[idDanhmuc] [int] NULL,
	[idthuvien] [int] NULL,
	[tensp] [nvarchar](max) NULL,
	[hinh] [nvarchar](255) NULL,
	[giaban] [decimal](18, 0) NULL,
	[ngaycapnhat] [smalldatetime] NULL,
	[soluongton] [int] NULL,
	[mota] [nvarchar](500) NULL,
	[giamgia] [int] NULL,
	[giakhuyenmai] [decimal](18, 0) NULL,
 CONSTRAINT [PK__SanPham__7A217672AEC9D6C2] PRIMARY KEY CLUSTERED 
(
	[masp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuVienAnh]    Script Date: 5/20/2025 9:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuVienAnh](
	[idthuvien] [int] IDENTITY(1,1) NOT NULL,
	[img1] [nvarchar](255) NULL,
	[img2] [nvarchar](255) NULL,
	[img3] [nvarchar](255) NULL,
 CONSTRAINT [PK__ThuVienA__31FA4CDF3B21DD43] PRIMARY KEY CLUSTERED 
(
	[idthuvien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'56d91112-15c2-4aa9-b9a9-34bca0dd35a8', N'Administrator with full access', N'Admin', N'ADMIN', N'b94c9322-1e4b-4a56-83f5-0f2a1a6c52c8')
INSERT [dbo].[AspNetRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'ABBDA9F2-C553-413B-A633-AECBFB701FE0', N'User1 can Perform CRUD Employee', N'User1', N'USER1', N'421ffca4-e9d7-4491-9e3a-996498b5b787')
INSERT [dbo].[AspNetRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'AF0EFC4F-C010-4287-94A3-4F2A1AB37504', N'admin1', N'Admin1', N'ADMIN1', N'421ffca4-e9d7-4491-9e3a-996498b5b79')
INSERT [dbo].[AspNetRoles] ([Id], [Description], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'fbe9beb3-d7d2-4662-8d80-31ffa768c0ee', N'User can Perform CRUD Employee', N'staff', N'STAFF', N'3e13b307-8454-43e0-a84f-a2d579cf7d31')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'70f384f3-c9e4-404a-90e0-e11c2bdd57bc', N'fbe9beb3-d7d2-4662-8d80-31ffa768c0ee')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f3dd465a-4e89-4b6c-ad97-81e1581cb5e5', N'56d91112-15c2-4aa9-b9a9-34bca0dd35a8')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [BirthDate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'70f384f3-c9e4-404a-90e0-e11c2bdd57bc', N'Nguyen nhat hao', CAST(N'2004-03-13T00:00:00.0000000' AS DateTime2), N'nhathao', N'NHATHAO', N'nguyennhathao13032004@gmail.comngu', N'NGUYENNHATHAO13032004@GMAIL.COMNGU', 0, N'AQAAAAEAACcQAAAAELYreQvZjBgzwKAPAqLaRGipi/+5g6ZC2p4hZgy3SiiKbeseD3w9F74lrfrwaA4TKg==', N'ZNBMAT74FVANTGIJGPHNQQQOBMNEKTUC', N'f0fbd3ac-f948-405e-819f-3160a16a9739', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [BirthDate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'83CF9754-4BE0-407D-915D-EC98C5B0AFD3', N'nguyen van teo', CAST(N'2000-11-11T00:00:00.0000000' AS DateTime2), N'teo', N'teo1', N'nguyenteo@gmail.com', N'NGUYENTEO1@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEMu/tepU3tavDxFJtSiWfLjSSh0rs1KUsHVtNkU1FO4KkY2on5rSWvfo272jPIZT1g==', N'KOZDMGDHFPJLNX37WIJLCOKTLHOSWZLG', N'21a12916-b9bb-44c5-b9bb-469a4ae8a7e7', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [BirthDate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'B558C6B9-44C6-4F21-A55B-E0BE59EC2BB9', N'admin', CAST(N'2000-11-11T00:00:00.0000000' AS DateTime2), N'admin', N'ADMIN1', N'admin1@gmail.com', N'ADMIN1@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEMu/tepU3tavDxFJtSiWfLjSSh0rs1KUsHVtNkU1FO4KkY2on5rSWvfo272jPIZT1g==', N'KOZDMGDHFPJLNX37WIJLCOKTLHOSWZLG', N'421ffca4-e9d7-4491-9e3a-996498b5b79', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FullName], [BirthDate], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'f3dd465a-4e89-4b6c-ad97-81e1581cb5e5', N'Administrator', CAST(N'1999-11-13T22:56:40.0321016' AS DateTime2), N'Admin', N'ADMIN', N'admin@example.com', N'ADMIN@EXAMPLE.COM', 0, N'AQAAAAEAACcQAAAAEMzCpZV/8j+m9walf+JvOBeQYjBKk06kLmdhJ7pHoeZvVFp9SuW9DyfUbYw4MLUjEQ==', N'RAE2OKT7PWDXIOXY4RXAFUNFBJBUXT32', N'e995386c-cd2a-4330-ada3-4b36f04df564', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[ChiTietDonHang] ([madon], [masp], [soluong], [gia], [tongsoluong], [tonggia], [status]) VALUES (1, 1, 1, CAST(100000 AS Decimal(18, 0)), 1, CAST(100000 AS Decimal(18, 0)), 0)
INSERT [dbo].[ChiTietDonHang] ([madon], [masp], [soluong], [gia], [tongsoluong], [tonggia], [status]) VALUES (2, 1, 2, CAST(100000 AS Decimal(18, 0)), 2, CAST(200000 AS Decimal(18, 0)), 1)
INSERT [dbo].[ChiTietDonHang] ([madon], [masp], [soluong], [gia], [tongsoluong], [tonggia], [status]) VALUES (3, 6, 1, CAST(220000 AS Decimal(18, 0)), 1, CAST(220000 AS Decimal(18, 0)), 0)
INSERT [dbo].[ChiTietDonHang] ([madon], [masp], [soluong], [gia], [tongsoluong], [tonggia], [status]) VALUES (4, 46, 1, CAST(351000 AS Decimal(18, 0)), 1, CAST(351000 AS Decimal(18, 0)), 0)
INSERT [dbo].[ChiTietDonHang] ([madon], [masp], [soluong], [gia], [tongsoluong], [tonggia], [status]) VALUES (5, 6, 1, CAST(220000 AS Decimal(18, 0)), 1, CAST(220000 AS Decimal(18, 0)), 0)
INSERT [dbo].[ChiTietDonHang] ([madon], [masp], [soluong], [gia], [tongsoluong], [tonggia], [status]) VALUES (6, 6, 1, CAST(220000 AS Decimal(18, 0)), 1, CAST(220000 AS Decimal(18, 0)), 0)
INSERT [dbo].[ChiTietDonHang] ([madon], [masp], [soluong], [gia], [tongsoluong], [tonggia], [status]) VALUES (7, 15, 1, CAST(359000 AS Decimal(18, 0)), 1, CAST(359000 AS Decimal(18, 0)), 0)
INSERT [dbo].[ChiTietDonHang] ([madon], [masp], [soluong], [gia], [tongsoluong], [tonggia], [status]) VALUES (8, 15, 1, CAST(359000 AS Decimal(18, 0)), 1, CAST(359000 AS Decimal(18, 0)), 0)
INSERT [dbo].[ChiTietDonHang] ([madon], [masp], [soluong], [gia], [tongsoluong], [tonggia], [status]) VALUES (9, 58, 1, CAST(259000 AS Decimal(18, 0)), 1, CAST(259000 AS Decimal(18, 0)), 0)
INSERT [dbo].[ChiTietDonHang] ([madon], [masp], [soluong], [gia], [tongsoluong], [tonggia], [status]) VALUES (10, 6, 1, CAST(220000 AS Decimal(18, 0)), 2, CAST(579000 AS Decimal(18, 0)), 0)
INSERT [dbo].[ChiTietDonHang] ([madon], [masp], [soluong], [gia], [tongsoluong], [tonggia], [status]) VALUES (10, 14, 1, CAST(359000 AS Decimal(18, 0)), 2, CAST(579000 AS Decimal(18, 0)), 0)
INSERT [dbo].[ChiTietDonHang] ([madon], [masp], [soluong], [gia], [tongsoluong], [tonggia], [status]) VALUES (11, 6, 10, CAST(220000 AS Decimal(18, 0)), 10, CAST(2200000 AS Decimal(18, 0)), 0)
INSERT [dbo].[ChiTietDonHang] ([madon], [masp], [soluong], [gia], [tongsoluong], [tonggia], [status]) VALUES (12, 6, 1, CAST(220000 AS Decimal(18, 0)), 1, CAST(220000 AS Decimal(18, 0)), 0)
INSERT [dbo].[ChiTietDonHang] ([madon], [masp], [soluong], [gia], [tongsoluong], [tonggia], [status]) VALUES (13, 28, 1, CAST(259000 AS Decimal(18, 0)), 1, CAST(259000 AS Decimal(18, 0)), 0)
GO
SET IDENTITY_INSERT [dbo].[DanhMuc] ON 

INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (1, N'Sách Văn Học', NULL)
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (2, N'Sách Kinh Tế', NULL)
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (3, N'Sách Kỹ Năng Sống', NULL)
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (4, N'Sách Thiếu Nhi', NULL)
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (5, N'Sách Khuyến Mãi', NULL)
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (6, N'Sách Theo Hình Thức', NULL)
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (7, N'Sách Theo Chủ Đề', NULL)
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (8, N'Sách Bán Chạy', NULL)
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (9, N'DANH MỤC SẢN PHẨM', NULL)
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (10, N'Sách Cảm Ơn', N'DANH MỤC SẢN PHẨM')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (11, N'Sách Sinh Nhật', N'DANH MỤC SẢN PHẨM')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (12, N'Sách Sự Kiện', N'DANH MỤC SẢN PHẨM')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (13, N'Sách Mới Phát Hành', N'DANH MỤC SẢN PHẨM')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (14, N'Sách Làm Quà Tặng', N'DANH MỤC SẢN PHẨM')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (15, N'Sách Tổng Hợp', N'DANH MỤC SẢN PHẨM')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (16, N'Sách Mini', N'DANH MỤC SẢN PHẨM')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (17, N'Sách Kỷ Niệm', N'DANH MỤC SẢN PHẨM')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (18, N'Sách Cho Ngày Phụ Nữ', N'DANH MỤC SẢN PHẨM')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (19, N'Sách Tặng Thầy Cô', N'DANH MỤC SẢN PHẨM')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (20, N'Sách Hot Nhất', N'Sách Bán Chạy')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (21, N'Tiểu Thuyết Việt', N'Sách Văn Học')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (22, N'Tiểu Thuyết Nước Ngoài', N'Sách Văn Học')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (23, N'Truyện Ngắn', N'Sách Văn Học')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (24, N'Kinh Tế Việt Nam', N'Sách Kinh Tế')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (25, N'Tài Chính Cá Nhân', N'Sách Kinh Tế')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (26, N'Khởi Nghiệp', N'Sách Kinh Tế')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (27, N'Giao Tiếp', N'Sách Kỹ Năng Sống')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (28, N'Thuyết Trình', N'Sách Kỹ Năng Sống')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (29, N'Tư Duy Tích Cực', N'Sách Kỹ Năng Sống')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (30, N'Sách Truyện Tranh', N'Sách Thiếu Nhi')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (31, N'Sách Kể Chuyện', N'Sách Thiếu Nhi')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (32, N'Sách Tô Màu', N'Sách Thiếu Nhi')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (33, N'Sách Đang Giảm Giá', N'Sách Khuyến Mãi')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (34, N'Sách Bìa Mềm', N'Sách Theo Hình Thức')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (35, N'Sách Bìa Cứng', N'Sách Theo Hình Thức')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (36, N'Ebook', N'Sách Theo Hình Thức')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (37, N'Sách Âm Thanh', N'Sách Theo Hình Thức')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (38, N'Sách Dịp Lễ', N'Sách Theo Chủ Đề')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (39, N'Sách Giỏ Quà', N'Sách Theo Chủ Đề')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (40, N'Sách Dành Cho Ngày Lễ', N'Sách Theo Chủ Đề')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (41, N'Sách Cưới Hỏi', N'Sách Theo Chủ Đề')
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (42, N'Phân loại sách theo thể loại', NULL)
INSERT [dbo].[DanhMuc] ([idDanhmuc], [tendanhmuc], [ParentID]) VALUES (43, N'Phân loại sách theo đối tượng', NULL)
SET IDENTITY_INSERT [dbo].[DanhMuc] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([madon], [thanhtoan], [giaohang], [ngaydat], [ngaygiao], [makh]) VALUES (1, N'COD', N'hủy', CAST(N'2022-06-14' AS Date), CAST(N'2022-06-14' AS Date), 1)
INSERT [dbo].[DonHang] ([madon], [thanhtoan], [giaohang], [ngaydat], [ngaygiao], [makh]) VALUES (2, N'COD', N'giao thành công', CAST(N'2024-11-11' AS Date), CAST(N'2024-11-13' AS Date), 6)
INSERT [dbo].[DonHang] ([madon], [thanhtoan], [giaohang], [ngaydat], [ngaygiao], [makh]) VALUES (3, N'VNPAY', N'chờ xử lý', CAST(N'2024-11-11' AS Date), NULL, 7)
INSERT [dbo].[DonHang] ([madon], [thanhtoan], [giaohang], [ngaydat], [ngaygiao], [makh]) VALUES (4, N'VNPAY', N'chờ xử lý', CAST(N'2024-11-11' AS Date), NULL, 8)
INSERT [dbo].[DonHang] ([madon], [thanhtoan], [giaohang], [ngaydat], [ngaygiao], [makh]) VALUES (5, N'VNPAY', N'chờ xử lý', CAST(N'2024-11-12' AS Date), NULL, 9)
INSERT [dbo].[DonHang] ([madon], [thanhtoan], [giaohang], [ngaydat], [ngaygiao], [makh]) VALUES (6, N'VNPAY', N'chờ xử lý', CAST(N'2024-11-12' AS Date), NULL, 10)
INSERT [dbo].[DonHang] ([madon], [thanhtoan], [giaohang], [ngaydat], [ngaygiao], [makh]) VALUES (7, N'VNPAY', N'chờ xử lý', CAST(N'2024-11-13' AS Date), NULL, 11)
INSERT [dbo].[DonHang] ([madon], [thanhtoan], [giaohang], [ngaydat], [ngaygiao], [makh]) VALUES (8, N'VNPAY', N'chờ xử lý', CAST(N'2024-11-13' AS Date), NULL, 12)
INSERT [dbo].[DonHang] ([madon], [thanhtoan], [giaohang], [ngaydat], [ngaygiao], [makh]) VALUES (9, N'VNPAY', N'chờ xử lý', CAST(N'2024-11-13' AS Date), NULL, 13)
INSERT [dbo].[DonHang] ([madon], [thanhtoan], [giaohang], [ngaydat], [ngaygiao], [makh]) VALUES (10, N'VNPAY', N'chờ xử lý', CAST(N'2024-11-13' AS Date), NULL, 14)
INSERT [dbo].[DonHang] ([madon], [thanhtoan], [giaohang], [ngaydat], [ngaygiao], [makh]) VALUES (11, N'VNPAY', N'chờ xử lý', CAST(N'2024-11-13' AS Date), NULL, 15)
INSERT [dbo].[DonHang] ([madon], [thanhtoan], [giaohang], [ngaydat], [ngaygiao], [makh]) VALUES (12, N'VNPAY', N'chờ xử lý', CAST(N'2024-11-14' AS Date), NULL, 16)
INSERT [dbo].[DonHang] ([madon], [thanhtoan], [giaohang], [ngaydat], [ngaygiao], [makh]) VALUES (13, N'COD', N'chờ xử lý', CAST(N'2024-11-14' AS Date), NULL, 17)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([makh], [hoten], [tendangnhap], [matkhau], [email], [diachi], [dienthoai], [ngaysinh], [RoleID], [status], [resetpasswordcode]) VALUES (1, N'admin', N'admin', N'Nhathao1967@', N'admin@gmail.com', N'Bình Phước', N'0836209818', CAST(N'2004-03-13' AS Date), 1, 1, N'Nhathao1967@')
INSERT [dbo].[KhachHang] ([makh], [hoten], [tendangnhap], [matkhau], [email], [diachi], [dienthoai], [ngaysinh], [RoleID], [status], [resetpasswordcode]) VALUES (2, N'Phan Quoc Trieu', N'trieu', N'202cb962ac59075b964b07152d234b70', N'trieuetam@gmail.com', N'HCM', N'123456789', CAST(N'1999-04-01' AS Date), 2, 1, NULL)
INSERT [dbo].[KhachHang] ([makh], [hoten], [tendangnhap], [matkhau], [email], [diachi], [dienthoai], [ngaysinh], [RoleID], [status], [resetpasswordcode]) VALUES (3, N'Admin', N'admin', N'202cb962ac59075b964b07152d234b70', NULL, N'', NULL, NULL, 1, 1, NULL)
INSERT [dbo].[KhachHang] ([makh], [hoten], [tendangnhap], [matkhau], [email], [diachi], [dienthoai], [ngaysinh], [RoleID], [status], [resetpasswordcode]) VALUES (5, N'vana', N'vana', N'123456', NULL, NULL, NULL, NULL, 2, NULL, NULL)
INSERT [dbo].[KhachHang] ([makh], [hoten], [tendangnhap], [matkhau], [email], [diachi], [dienthoai], [ngaysinh], [RoleID], [status], [resetpasswordcode]) VALUES (6, N'nguyen van a', NULL, NULL, N'nguyennhathao13032004@gmail.comngu', N'324/52 Thành phố Thủ Dầu Một ', N'09875453431', CAST(N'0001-01-01' AS Date), 2, 1, N'123')
INSERT [dbo].[KhachHang] ([makh], [hoten], [tendangnhap], [matkhau], [email], [diachi], [dienthoai], [ngaysinh], [RoleID], [status], [resetpasswordcode]) VALUES (7, NULL, NULL, NULL, N'nguyennhathao13032004@gmail.comngu', N'324/52 Thành phố Thủ Dầu Một Bình Dương', N'123456789', CAST(N'0001-01-01' AS Date), 2, 1, N'123')
INSERT [dbo].[KhachHang] ([makh], [hoten], [tendangnhap], [matkhau], [email], [diachi], [dienthoai], [ngaysinh], [RoleID], [status], [resetpasswordcode]) VALUES (8, NULL, NULL, NULL, N'nguyennhathao13032004@gmail.comngu', N'324/52 Thành phố Thủ Dầu Một Bình Dương', N'123456789', CAST(N'0001-01-01' AS Date), 2, 1, N'123')
INSERT [dbo].[KhachHang] ([makh], [hoten], [tendangnhap], [matkhau], [email], [diachi], [dienthoai], [ngaysinh], [RoleID], [status], [resetpasswordcode]) VALUES (9, NULL, N'nhathao', NULL, N'nguyennhathao13032004@gmail.comngu', N'324/52 Thành phố Thủ Dầu Một Bình Dương', N'123456789', CAST(N'0001-01-01' AS Date), 2, 1, N'123')
INSERT [dbo].[KhachHang] ([makh], [hoten], [tendangnhap], [matkhau], [email], [diachi], [dienthoai], [ngaysinh], [RoleID], [status], [resetpasswordcode]) VALUES (10, NULL, N'teo1', NULL, N'nguyennhathao13032004@gmail.comngu', N'324/52 Thành phố Thủ Dầu Một Bình Dương', N'123456789', CAST(N'0001-01-01' AS Date), 2, 1, N'123')
INSERT [dbo].[KhachHang] ([makh], [hoten], [tendangnhap], [matkhau], [email], [diachi], [dienthoai], [ngaysinh], [RoleID], [status], [resetpasswordcode]) VALUES (11, NULL, N'teo1', NULL, N'nguyennhathao13032004@gmail.comngu', N'324/52 Huyện Bù Đăng Bình Dương', N'123456789', CAST(N'0001-01-01' AS Date), 2, 1, N'123')
INSERT [dbo].[KhachHang] ([makh], [hoten], [tendangnhap], [matkhau], [email], [diachi], [dienthoai], [ngaysinh], [RoleID], [status], [resetpasswordcode]) VALUES (12, NULL, N'admin1', NULL, N'nguyennhathao13032004@gmail.comngu', N'324/52 Huyện Bù Đăng Bình Phước', N'123456789', CAST(N'0001-01-01' AS Date), 2, 1, N'123')
INSERT [dbo].[KhachHang] ([makh], [hoten], [tendangnhap], [matkhau], [email], [diachi], [dienthoai], [ngaysinh], [RoleID], [status], [resetpasswordcode]) VALUES (13, NULL, N'admin1', NULL, N'nguyennhathao13032004@gmail.comngu', N'324/52 Huyện Bù Đăng Bình Phước', N'123456789', CAST(N'0001-01-01' AS Date), 2, 1, N'123')
INSERT [dbo].[KhachHang] ([makh], [hoten], [tendangnhap], [matkhau], [email], [diachi], [dienthoai], [ngaysinh], [RoleID], [status], [resetpasswordcode]) VALUES (14, NULL, N'admin1', NULL, N'nguyennhathao13032004@gmail.comngu', N'324/52 Huyện Bù Đăng Bình Phước', N'123456789', CAST(N'0001-01-01' AS Date), 2, 1, N'123')
INSERT [dbo].[KhachHang] ([makh], [hoten], [tendangnhap], [matkhau], [email], [diachi], [dienthoai], [ngaysinh], [RoleID], [status], [resetpasswordcode]) VALUES (15, NULL, N'admin1', NULL, N'nguyennhathao13032004@gmail.comngu', N'324/52 Huyện Bù Đăng Bình Phước', N'123456789', CAST(N'0001-01-01' AS Date), 2, 1, N'123')
INSERT [dbo].[KhachHang] ([makh], [hoten], [tendangnhap], [matkhau], [email], [diachi], [dienthoai], [ngaysinh], [RoleID], [status], [resetpasswordcode]) VALUES (16, NULL, N'nhathao', NULL, N'nguyennhathao13032004@gmail.comngu', N'324/52 Huyện Bù Đăng Bình Phước', N'123456789', CAST(N'0001-01-01' AS Date), 2, 1, N'123')
INSERT [dbo].[KhachHang] ([makh], [hoten], [tendangnhap], [matkhau], [email], [diachi], [dienthoai], [ngaysinh], [RoleID], [status], [resetpasswordcode]) VALUES (17, N'nguyen van a', N'nhathao', NULL, N'nguyennhathao13032004@gmail.comngu', N'324/52 Thành phố Thủ Dầu Một Bình Phước', N'09875453431', CAST(N'0001-01-01' AS Date), 2, 1, N'123')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
INSERT [dbo].[KhachHangRoles] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[KhachHangRoles] ([RoleID], [RoleName]) VALUES (2, N'User')
INSERT [dbo].[KhachHangRoles] ([RoleID], [RoleName]) VALUES (3, N'Staff')
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([masp], [idDanhmuc], [idthuvien], [tensp], [hinh], [giaban], [ngaycapnhat], [soluongton], [mota], [giamgia], [giakhuyenmai]) VALUES (1, 3, NULL, N'Sách Kỹ năng sống', N'/Content/uploads/sachkynang1.jpg', CAST(100000 AS Decimal(18, 0)), NULL, 3, N'Sách giúp phát triển kỹ năng sống hàng ngày', 0, CAST(100000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([masp], [idDanhmuc], [idthuvien], [tensp], [hinh], [giaban], [ngaycapnhat], [soluongton], [mota], [giamgia], [giakhuyenmai]) VALUES (2, 3, NULL, N'Sách Kỹ năng sống nâng cao', N'/Content/uploads/sachkynang2.jpg', CAST(105000 AS Decimal(18, 0)), NULL, 10, N'Cuốn sách chuyên sâu về kỹ năng sống', 0, CAST(105000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([masp], [idDanhmuc], [idthuvien], [tensp], [hinh], [giaban], [ngaycapnhat], [soluongton], [mota], [giamgia], [giakhuyenmai]) VALUES (3, 4, NULL, N'Sách Thiếu nhi: Truyện cổ tích', N'/Content/uploads/sachthieunhi1.jpg', CAST(45000 AS Decimal(18, 0)), NULL, 17, N'Truyện cổ tích dành cho trẻ em', 0, CAST(45000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([masp], [idDanhmuc], [idthuvien], [tensp], [hinh], [giaban], [ngaycapnhat], [soluongton], [mota], [giamgia], [giakhuyenmai]) VALUES (4, 4, NULL, N'Sách Thiếu nhi: Học chữ cái', N'/Content/uploads/sachthieunhi2.jpg', CAST(55000 AS Decimal(18, 0)), NULL, 7, N'Sách học chữ cái cho bé 3 tuổi+', 0, CAST(55000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([masp], [idDanhmuc], [idthuvien], [tensp], [hinh], [giaban], [ngaycapnhat], [soluongton], [mota], [giamgia], [giakhuyenmai]) VALUES (5, 5, NULL, N'Tiểu thuyết tình cảm: Gió qua miền ký ức', N'/Content/uploads/tieuthuyet1.jpg', CAST(65000 AS Decimal(18, 0)), NULL, 4, N'Một tiểu thuyết tình cảm lãng mạn', 0, CAST(65000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([masp], [idDanhmuc], [idthuvien], [tensp], [hinh], [giaban], [ngaycapnhat], [soluongton], [mota], [giamgia], [giakhuyenmai]) VALUES (6, 1, NULL, N'Sách Lịch sử Việt Nam', N'/Content/uploads/lichsu1.jpg', CAST(220000 AS Decimal(18, 0)), NULL, 20, N'Khám phá lịch sử Việt Nam từ thời kỳ dựng nước', 0, CAST(220000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([masp], [idDanhmuc], [idthuvien], [tensp], [hinh], [giaban], [ngaycapnhat], [soluongton], [mota], [giamgia], [giakhuyenmai]) VALUES (7, 1, NULL, N'Sách Lịch sử Thế giới', N'/Content/uploads/lichsu2.jpg', CAST(234000 AS Decimal(18, 0)), NULL, 22, N'Sách tổng hợp lịch sử các nền văn minh', 0, CAST(234000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([masp], [idDanhmuc], [idthuvien], [tensp], [hinh], [giaban], [ngaycapnhat], [soluongton], [mota], [giamgia], [giakhuyenmai]) VALUES (8, 1, NULL, N'Sách Toán học lớp 12', N'/Content/uploads/toan12.jpg', CAST(267000 AS Decimal(18, 0)), NULL, 32, N'Sách giáo khoa toán lớp 12 chuẩn chương trình', 0, CAST(267000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([masp], [idDanhmuc], [idthuvien], [tensp], [hinh], [giaban], [ngaycapnhat], [soluongton], [mota], [giamgia], [giakhuyenmai]) VALUES (9, 1, NULL, N'Sách Vật lý cơ bản', N'/Content/uploads/vatly1.jpg', CAST(250000 AS Decimal(18, 0)), NULL, 15, N'Giáo trình vật lý cho sinh viên năm nhất', 0, CAST(250000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([masp], [idDanhmuc], [idthuvien], [tensp], [hinh], [giaban], [ngaycapnhat], [soluongton], [mota], [giamgia], [giakhuyenmai]) VALUES (10, 1, NULL, N'Sách Hóa học nâng cao', N'/Content/uploads/hoahoc2.jpg', CAST(350000 AS Decimal(18, 0)), NULL, 15, N'Bài tập và lý thuyết hóa học nâng cao', 0, CAST(350000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([masp], [idDanhmuc], [idthuvien], [tensp], [hinh], [giaban], [ngaycapnhat], [soluongton], [mota], [giamgia], [giakhuyenmai]) VALUES (11, 1, NULL, N'Sách Sinh học phổ thông', N'/Content/uploads/sinhhoc1.jpg', CAST(150000 AS Decimal(18, 0)), NULL, 15, N'Nội dung sinh học từ lớp 10 đến 12', 0, CAST(150000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([masp], [idDanhmuc], [idthuvien], [tensp], [hinh], [giaban], [ngaycapnhat], [soluongton], [mota], [giamgia], [giakhuyenmai]) VALUES (12, 1, NULL, N'Sách Văn học Việt Nam', N'/Content/uploads/vanhocvn.jpg', CAST(352000 AS Decimal(18, 0)), NULL, 15, N'Tuyển tập các tác phẩm văn học tiêu biểu', 0, CAST(351000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([masp], [idDanhmuc], [idthuvien], [tensp], [hinh], [giaban], [ngaycapnhat], [soluongton], [mota], [giamgia], [giakhuyenmai]) VALUES (13, 1, NULL, N'Sách Văn học nước ngoài', N'/Content/uploads/vanhocnuocngoai.jpg', CAST(355000 AS Decimal(18, 0)), NULL, 15, N'Những tiểu thuyết kinh điển thế giới', 0, CAST(355000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([masp], [idDanhmuc], [idthuvien], [tensp], [hinh], [giaban], [ngaycapnhat], [soluongton], [mota], [giamgia], [giakhuyenmai]) VALUES (14, 21, NULL, N'Sách Self-help: Đắc Nhân Tâm', N'/Content/uploads/dacnhantam.jpg', CAST(359000 AS Decimal(18, 0)), NULL, 15, N'Cuốn sách kinh điển về giao tiếp và ứng xử', 0, CAST(359000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([masp], [idDanhmuc], [idthuvien], [tensp], [hinh], [giaban], [ngaycapnhat], [soluongton], [mota], [giamgia], [giakhuyenmai]) VALUES (15, 25, NULL, N'Sách Kinh tế học cơ bản', N'/Content/uploads/kinhte.jpg', CAST(359000 AS Decimal(18, 0)), NULL, 15, N'Sách nhập môn kinh tế học', 0, CAST(359000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([masp], [idDanhmuc], [idthuvien], [tensp], [hinh], [giaban], [ngaycapnhat], [soluongton], [mota], [giamgia], [giakhuyenmai]) VALUES (16, 7, NULL, N'Sách Lập trình C++', N'/Content/uploads/laptrinhcpp.jpg', CAST(259000 AS Decimal(18, 0)), NULL, 55, N'Hướng dẫn từ cơ bản đến nâng cao C++', 0, CAST(259000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([masp], [idDanhmuc], [idthuvien], [tensp], [hinh], [giaban], [ngaycapnhat], [soluongton], [mota], [giamgia], [giakhuyenmai]) VALUES (17, 7, NULL, N'Sách Python cho người mới bắt đầu', N'/Content/uploads/pythonbasic.jpg', CAST(259000 AS Decimal(18, 0)), NULL, 55, N'Học Python từ đầu, có ví dụ thực tế', 0, CAST(259000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([masp], [idDanhmuc], [idthuvien], [tensp], [hinh], [giaban], [ngaycapnhat], [soluongton], [mota], [giamgia], [giakhuyenmai]) VALUES (18, 5, NULL, N'Sách Machine Learning cơ bản', N'/Content/uploads/mlbook.jpg', CAST(259000 AS Decimal(18, 0)), NULL, 55, N'Giới thiệu học máy với Python', 0, CAST(259000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([masp], [idDanhmuc], [idthuvien], [tensp], [hinh], [giaban], [ngaycapnhat], [soluongton], [mota], [giamgia], [giakhuyenmai]) VALUES (19, 5, NULL, N'Sách Deep Learning nâng cao', N'/Content/uploads/dlbook.jpg', CAST(259000 AS Decimal(18, 0)), NULL, 55, N'Hướng dẫn học sâu với TensorFlow/Keras', 0, CAST(259000 AS Decimal(18, 0)))
INSERT [dbo].[SanPham] ([masp], [idDanhmuc], [idthuvien], [tensp], [hinh], [giaban], [ngaycapnhat], [soluongton], [mota], [giamgia], [giakhuyenmai]) VALUES (20, 7, NULL, N'Sách Thiết kế web với HTML/CSS', N'/Content/uploads/htmlcss.jpg', CAST(459000 AS Decimal(18, 0)), NULL, 55, N'Thiết kế giao diện web chuyên nghiệp', 0, CAST(459000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
ALTER TABLE [dbo].[DanhGia] ADD  DEFAULT ((0)) FOR [trangthai]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietDo__madon__36B12243] FOREIGN KEY([madon])
REFERENCES [dbo].[DonHang] ([madon])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK__ChiTietDo__madon__36B12243]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK__DanhGia__id_kh__3C69FB99] FOREIGN KEY([id_kh])
REFERENCES [dbo].[KhachHang] ([makh])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK__DanhGia__id_kh__3C69FB99]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK__DanhGia__id_sp__3B75D760] FOREIGN KEY([id_sp])
REFERENCES [dbo].[SanPham] ([masp])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK__DanhGia__id_sp__3B75D760]
GO
ALTER TABLE [dbo].[DichVu]  WITH CHECK ADD  CONSTRAINT [FK__DichVu__makh__30F848ED] FOREIGN KEY([makh])
REFERENCES [dbo].[KhachHang] ([makh])
GO
ALTER TABLE [dbo].[DichVu] CHECK CONSTRAINT [FK__DichVu__makh__30F848ED]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK__DonHang__makh__33D4B598] FOREIGN KEY([makh])
REFERENCES [dbo].[KhachHang] ([makh])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK__DonHang__makh__33D4B598]
GO
ALTER TABLE [dbo].[KhachHang]  WITH CHECK ADD  CONSTRAINT [FK__KhachHang__RoleI__2E1BDC42] FOREIGN KEY([RoleID])
REFERENCES [dbo].[KhachHangRoles] ([RoleID])
GO
ALTER TABLE [dbo].[KhachHang] CHECK CONSTRAINT [FK__KhachHang__RoleI__2E1BDC42]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK__SanPham__idDanhm__286302EC] FOREIGN KEY([idDanhmuc])
REFERENCES [dbo].[DanhMuc] ([idDanhmuc])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK__SanPham__idDanhm__286302EC]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK__SanPham__idthuvi__29572725] FOREIGN KEY([idthuvien])
REFERENCES [dbo].[ThuVienAnh] ([idthuvien])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK__SanPham__idthuvi__29572725]
GO
