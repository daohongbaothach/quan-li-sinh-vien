USE [master]
GO
/****** Object:  Database [QLDSV]    Script Date: 5/30/2022 11:43:37 PM ******/
CREATE DATABASE [QLDSV]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLDSV', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLDSV.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLDSV_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\QLDSV_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLDSV].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLDSV] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLDSV] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLDSV] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLDSV] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLDSV] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLDSV] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLDSV] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLDSV] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLDSV] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLDSV] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLDSV] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLDSV] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLDSV] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLDSV] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLDSV] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLDSV] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLDSV] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLDSV] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLDSV] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLDSV] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLDSV] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLDSV] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLDSV] SET RECOVERY FULL 
GO
ALTER DATABASE [QLDSV] SET  MULTI_USER 
GO
ALTER DATABASE [QLDSV] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLDSV] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLDSV] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLDSV] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLDSV] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLDSV', N'ON'
GO
USE [QLDSV]
GO
/****** Object:  Table [dbo].[CHITIETDIEMLV]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETDIEMLV](
	[MaLV] [nchar](20) NOT NULL,
	[MaSV] [nchar](10) NOT NULL,
	[MaGV] [nchar](10) NULL,
	[Diem] [nchar](10) NULL,
 CONSTRAINT [PK_CHITIETDIEMLV_1] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHUYENNGANH]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHUYENNGANH](
	[MaCN] [nchar](10) NOT NULL,
	[TenCN] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ChuyenNganh] PRIMARY KEY CLUSTERED 
(
	[MaCN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DANGKYLTC]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANGKYLTC](
	[MaSV] [nchar](10) NOT NULL,
	[MaLTC] [nchar](10) NOT NULL,
	[DCC] [float] NOT NULL,
	[DGK] [float] NOT NULL,
	[DThi] [float] NOT NULL,
	[HuyDK] [bit] NOT NULL,
 CONSTRAINT [PK_DANGKYLTC] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC,
	[MaLTC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DAYLOPTC]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DAYLOPTC](
	[MAGV] [nchar](10) NOT NULL,
	[MALTC] [nchar](10) NOT NULL,
 CONSTRAINT [PK_PHANCONG] PRIMARY KEY CLUSTERED 
(
	[MAGV] ASC,
	[MALTC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GIANGVIEN]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIANGVIEN](
	[MaGV] [nchar](10) NOT NULL,
	[HoGV] [nvarchar](50) NOT NULL,
	[TenGV] [nvarchar](50) NOT NULL,
	[HocVi] [nvarchar](50) NULL,
	[HocHam] [nvarchar](50) NULL,
	[ChuyenMon] [nvarchar](50) NULL,
	[ChucVu] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_GIANGVIEN] PRIMARY KEY CLUSTERED 
(
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOCBONG]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOCBONG](
	[MaHB] [nchar](10) NOT NULL,
	[MaSV] [nchar](10) NOT NULL,
	[Diem] [float] NULL,
	[HocKy] [int] NULL,
	[Nam] [int] NULL,
 CONSTRAINT [PK_HOCBONG] PRIMARY KEY CLUSTERED 
(
	[MaHB] ASC,
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHANANGDAY]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHANANGDAY](
	[MaMH] [nchar](10) NOT NULL,
	[MaGV] [nchar](10) NOT NULL,
 CONSTRAINT [PK_DayHoc] PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC,
	[MaGV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHOA]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHOA](
	[MaKhoa] [nchar](10) NOT NULL,
	[TenKhoa] [nvarchar](50) NOT NULL,
	[MaTruongKhoa] [nchar](10) NULL,
 CONSTRAINT [PK_KHOA] PRIMARY KEY CLUSTERED 
(
	[MaKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAIHOCBONG]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAIHOCBONG](
	[MaHB] [nchar](10) NOT NULL,
	[DieuKienHB] [float] NULL,
	[GiaTri] [money] NULL,
 CONSTRAINT [PK_LOAIHOCBONG] PRIMARY KEY CLUSTERED 
(
	[MaHB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOP]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOP](
	[MaLop] [nchar](10) NOT NULL,
	[TenLop] [nvarchar](50) NOT NULL,
	[KhoaHoc] [int] NULL,
	[MaCN] [nchar](10) NULL,
 CONSTRAINT [PK_LOP] PRIMARY KEY CLUSTERED 
(
	[MaLop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOPTINCHI]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOPTINCHI](
	[MaLTC] [nchar](10) NOT NULL,
	[SVTT] [int] NOT NULL,
	[SVTD] [int] NOT NULL,
	[MaMH] [nchar](10) NOT NULL,
	[HocKi] [int] NOT NULL,
	[Nam] [nchar](10) NOT NULL,
	[HeSo1] [float] NOT NULL,
	[HeSo2] [float] NOT NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_LOPTINCHI_1] PRIMARY KEY CLUSTERED 
(
	[MaLTC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LUANVANTN]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LUANVANTN](
	[MaLV] [nchar](20) NOT NULL,
	[TenLV] [nvarchar](50) NULL,
 CONSTRAINT [PK_LUANVANTN] PRIMARY KEY CLUSTERED 
(
	[MaLV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MONHOC]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MONHOC](
	[MaMH] [nchar](10) NOT NULL,
	[TenMH] [nvarchar](50) NOT NULL,
	[SoTC] [int] NOT NULL,
	[TietLT] [int] NULL,
	[TietTH] [int] NULL,
 CONSTRAINT [PK_MONHOC] PRIMARY KEY CLUSTERED 
(
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MONHOCNGANH]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MONHOCNGANH](
	[MaCN] [nchar](10) NOT NULL,
	[MaMH] [nchar](10) NOT NULL,
	[HocKy] [int] NULL,
 CONSTRAINT [PK_MONHOCNGANH] PRIMARY KEY CLUSTERED 
(
	[MaCN] ASC,
	[MaMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PHONGGIAOVU]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PHONGGIAOVU](
	[MaPhong] [nchar](10) NOT NULL,
	[TenPhong] [nvarchar](50) NULL,
 CONSTRAINT [PK_PhongGiaoVu] PRIMARY KEY CLUSTERED 
(
	[MaPhong] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QUYEN]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QUYEN](
	[MaQuyen] [int] NOT NULL,
	[TenQuyen] [nchar](10) NULL,
 CONSTRAINT [PK_QUYEN] PRIMARY KEY CLUSTERED 
(
	[MaQuyen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SINHVIEN]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SINHVIEN](
	[MaSV] [nchar](10) NOT NULL,
	[HoSV] [nvarchar](50) NOT NULL,
	[TenSV] [nvarchar](20) NOT NULL,
	[Phai] [bit] NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
	[NgaySinh] [date] NOT NULL,
	[MaLop] [nchar](10) NOT NULL,
 CONSTRAINT [PK_SINHVIEN] PRIMARY KEY CLUSTERED 
(
	[MaSV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[ID] [int] NOT NULL,
	[TaiKhoan] [nchar](10) NOT NULL,
	[PWD] [nchar](30) NOT NULL,
	[Quyen] [int] NOT NULL,
 CONSTRAINT [PK_TaiKhoan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIEUCHI]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIEUCHI](
	[MaTC] [nchar](10) NOT NULL,
	[MaCN] [nchar](10) NULL,
	[Nam] [int] NOT NULL,
	[DiemTC] [float] NOT NULL,
 CONSTRAINT [PK_TIEUCHI] PRIMARY KEY CLUSTERED 
(
	[MaTC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TKGV]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TKGV](
	[TK] [nchar](10) NOT NULL,
	[MK] [nchar](10) NOT NULL,
	[MaQuyen] [int] NOT NULL,
 CONSTRAINT [PK_TKGV] PRIMARY KEY CLUSTERED 
(
	[TK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TKQL]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TKQL](
	[TK] [nchar](10) NOT NULL,
	[MK] [nchar](30) NOT NULL,
	[MaQuyen] [int] NOT NULL,
 CONSTRAINT [PK_QUANLI] PRIMARY KEY CLUSTERED 
(
	[TK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TKSV]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TKSV](
	[TK] [nchar](10) NOT NULL,
	[MK] [nvarchar](20) NOT NULL,
	[MaQuyen] [int] NOT NULL,
 CONSTRAINT [PK_TKSV] PRIMARY KEY CLUSTERED 
(
	[TK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TRUONGKHOA]    Script Date: 5/30/2022 11:43:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRUONGKHOA](
	[MaTruongKhoa] [nchar](10) NOT NULL,
	[NgayNC] [date] NOT NULL,
 CONSTRAINT [PK_TRUONGKHOA_1] PRIMARY KEY CLUSTERED 
(
	[MaTruongKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CHUYENNGANH] ([MaCN], [TenCN]) VALUES (N'ATTT      ', N'An toàn thông tin')
INSERT [dbo].[CHUYENNGANH] ([MaCN], [TenCN]) VALUES (N'CNTT      ', N'Công nghệ thông tin')
INSERT [dbo].[CHUYENNGANH] ([MaCN], [TenCN]) VALUES (N'DPT       ', N'ĐA PHƯƠNG TIỆN')
GO
INSERT [dbo].[DANGKYLTC] ([MaSV], [MaLTC], [DCC], [DGK], [DThi], [HuyDK]) VALUES (N'n19dccn001', N'aaa       ', 6, 7, 5, 0)
INSERT [dbo].[DANGKYLTC] ([MaSV], [MaLTC], [DCC], [DGK], [DThi], [HuyDK]) VALUES (N'n19dccn001', N'asd       ', 7, 10, 6, 0)
INSERT [dbo].[DANGKYLTC] ([MaSV], [MaLTC], [DCC], [DGK], [DThi], [HuyDK]) VALUES (N'n19dccn001', N'bbb       ', 7, 7, 3, 0)
INSERT [dbo].[DANGKYLTC] ([MaSV], [MaLTC], [DCC], [DGK], [DThi], [HuyDK]) VALUES (N'n19dccn002', N'aaa       ', 9, 8, 9, 0)
INSERT [dbo].[DANGKYLTC] ([MaSV], [MaLTC], [DCC], [DGK], [DThi], [HuyDK]) VALUES (N'n19dccn002', N'asd       ', 7, 5, 5, 0)
INSERT [dbo].[DANGKYLTC] ([MaSV], [MaLTC], [DCC], [DGK], [DThi], [HuyDK]) VALUES (N'n19dccn003', N'bbb       ', 0, 0, 0, 0)
INSERT [dbo].[DANGKYLTC] ([MaSV], [MaLTC], [DCC], [DGK], [DThi], [HuyDK]) VALUES (N'n19dccn003', N'ccc       ', 0, 0, 0, 0)
GO
INSERT [dbo].[DAYLOPTC] ([MAGV], [MALTC]) VALUES (N'GV01      ', N'aaa       ')
INSERT [dbo].[DAYLOPTC] ([MAGV], [MALTC]) VALUES (N'GV01      ', N'bbb       ')
INSERT [dbo].[DAYLOPTC] ([MAGV], [MALTC]) VALUES (N'GV02      ', N'aaa       ')
INSERT [dbo].[DAYLOPTC] ([MAGV], [MALTC]) VALUES (N'GV02      ', N'ccc       ')
GO
INSERT [dbo].[GIANGVIEN] ([MaGV], [HoGV], [TenGV], [HocVi], [HocHam], [ChuyenMon], [ChucVu]) VALUES (N'GV01      ', N'Nguyễn Hồng ', N'Sơn', N'Thạc sĩ', N'', N'', N'Trưởng khoa')
INSERT [dbo].[GIANGVIEN] ([MaGV], [HoGV], [TenGV], [HocVi], [HocHam], [ChuyenMon], [ChucVu]) VALUES (N'GV02      ', N'Lưu Nguyễn Kỳ', N'Thư', N'Thạc sĩ', N'', N'', N'Phó khoa')
INSERT [dbo].[GIANGVIEN] ([MaGV], [HoGV], [TenGV], [HocVi], [HocHam], [ChuyenMon], [ChucVu]) VALUES (N'GV03      ', N'Tân', N'Hạnh', N'Tiến sĩ', NULL, NULL, N'Phó giám đốc học viện')
INSERT [dbo].[GIANGVIEN] ([MaGV], [HoGV], [TenGV], [HocVi], [HocHam], [ChuyenMon], [ChucVu]) VALUES (N'GV04      ', N'Huỳnh Trọng ', N'Thưa', N'Tiến sĩ', NULL, NULL, N'Trưởng BM An toàn thông tin')
INSERT [dbo].[GIANGVIEN] ([MaGV], [HoGV], [TenGV], [HocVi], [HocHam], [ChuyenMon], [ChucVu]) VALUES (N'GV05      ', N'Nguyễn Thị Bích', N'Nguyên', N'Thạc sĩ', NULL, NULL, N'Giảng viên')
GO
INSERT [dbo].[KHOA] ([MaKhoa], [TenKhoa], [MaTruongKhoa]) VALUES (N'asd       ', N'asd', N'asd       ')
INSERT [dbo].[KHOA] ([MaKhoa], [TenKhoa], [MaTruongKhoa]) VALUES (N'cntt      ', N'cntt', N'asd       ')
INSERT [dbo].[KHOA] ([MaKhoa], [TenKhoa], [MaTruongKhoa]) VALUES (N'CNTT2     ', N'CÔNG NGHỆ THÔNG TIN 2', N'ASD       ')
GO
INSERT [dbo].[LOP] ([MaLop], [TenLop], [KhoaHoc], [MaCN]) VALUES (N'D18CQCN02 ', N'cntt2', 2018, N'cntt      ')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [KhoaHoc], [MaCN]) VALUES (N'D19CQCN01 ', N'Công nghệ thông tin 1', 2019, N'cntt      ')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [KhoaHoc], [MaCN]) VALUES (N'D19CQCN03 ', N'cntt3', 2019, N'cntt      ')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [KhoaHoc], [MaCN]) VALUES (N'D19CQPU01 ', N'Đa phương tiện', 2019, N'DPT       ')
INSERT [dbo].[LOP] ([MaLop], [TenLop], [KhoaHoc], [MaCN]) VALUES (N'D21CQAT01 ', N'An toàn thông tin 1', 2021, N'ATTT      ')
GO
INSERT [dbo].[LOPTINCHI] ([MaLTC], [SVTT], [SVTD], [MaMH], [HocKi], [Nam], [HeSo1], [HeSo2], [TrangThai]) VALUES (N'191CNPM   ', 30, 150, N'CNPM      ', 1, N'2022      ', 3, 6, 1)
INSERT [dbo].[LOPTINCHI] ([MaLTC], [SVTT], [SVTD], [MaMH], [HocKi], [Nam], [HeSo1], [HeSo2], [TrangThai]) VALUES (N'192CNPM   ', 30, 150, N'CNPM      ', 2, N'2022      ', 2, 7, 1)
INSERT [dbo].[LOPTINCHI] ([MaLTC], [SVTT], [SVTD], [MaMH], [HocKi], [Nam], [HeSo1], [HeSo2], [TrangThai]) VALUES (N'aaa       ', 45, 200, N'C++       ', 2, N'2019      ', 2, 7, 1)
INSERT [dbo].[LOPTINCHI] ([MaLTC], [SVTT], [SVTD], [MaMH], [HocKi], [Nam], [HeSo1], [HeSo2], [TrangThai]) VALUES (N'asd       ', 30, 200, N'C++       ', 1, N'2019      ', 1, 8, 1)
INSERT [dbo].[LOPTINCHI] ([MaLTC], [SVTT], [SVTD], [MaMH], [HocKi], [Nam], [HeSo1], [HeSo2], [TrangThai]) VALUES (N'bbb       ', 50, 200, N'C++       ', 2, N'2022      ', 2, 7, 1)
INSERT [dbo].[LOPTINCHI] ([MaLTC], [SVTT], [SVTD], [MaMH], [HocKi], [Nam], [HeSo1], [HeSo2], [TrangThai]) VALUES (N'ccc       ', 30, 200, N'C++       ', 2, N'2022      ', 2, 7, 1)
GO
INSERT [dbo].[MONHOC] ([MaMH], [TenMH], [SoTC], [TietLT], [TietTH]) VALUES (N'AI        ', N'Trí tuệ nhân tạo', 3, 3, 0)
INSERT [dbo].[MONHOC] ([MaMH], [TenMH], [SoTC], [TietLT], [TietTH]) VALUES (N'c++       ', N'Ngôn ngữ C++', 2, 2, 2)
INSERT [dbo].[MONHOC] ([MaMH], [TenMH], [SoTC], [TietLT], [TietTH]) VALUES (N'CNPM      ', N'Công nghệ phần mềm', 3, 3, 0)
INSERT [dbo].[MONHOC] ([MaMH], [TenMH], [SoTC], [TietLT], [TietTH]) VALUES (N'LTW       ', N'Lập trình Web', 3, 2, 1)
INSERT [dbo].[MONHOC] ([MaMH], [TenMH], [SoTC], [TietLT], [TietTH]) VALUES (N'TRR       ', N'Toán rời rạc', 3, 3, 0)
GO
INSERT [dbo].[PHONGGIAOVU] ([MaPhong], [TenPhong]) VALUES (N'admin     ', N'admin')
GO
INSERT [dbo].[QUYEN] ([MaQuyen], [TenQuyen]) VALUES (1, N'Quan li   ')
INSERT [dbo].[QUYEN] ([MaQuyen], [TenQuyen]) VALUES (2, N'Giang vien')
INSERT [dbo].[QUYEN] ([MaQuyen], [TenQuyen]) VALUES (3, N'Sinh vien ')
GO
INSERT [dbo].[SINHVIEN] ([MaSV], [HoSV], [TenSV], [Phai], [DiaChi], [NgaySinh], [MaLop]) VALUES (N'N19DCCN001', N'Vũ Đức', N'Anh', 1, N'Thủ Đức', CAST(N'2001-05-22' AS Date), N'd19cqcn03 ')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoSV], [TenSV], [Phai], [DiaChi], [NgaySinh], [MaLop]) VALUES (N'N19DCCN002', N'Nguyen', N'Bảo', 0, N'Thủ Đức', CAST(N'2001-03-04' AS Date), N'd19cqcn03 ')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoSV], [TenSV], [Phai], [DiaChi], [NgaySinh], [MaLop]) VALUES (N'N19DCCN003', N'Hoàng', N'Trúc', 1, N'Thủ Đức', CAST(N'2022-05-12' AS Date), N'd19cqcn03 ')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoSV], [TenSV], [Phai], [DiaChi], [NgaySinh], [MaLop]) VALUES (N'N19DCCN004', N'Nguyễn', N'Hoàng', 1, N'Thủ Đức', CAST(N'2022-05-05' AS Date), N'd19cqcn03 ')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoSV], [TenSV], [Phai], [DiaChi], [NgaySinh], [MaLop]) VALUES (N'N19DCCN005', N'Thanh', N'Hùng', 1, N'Thủ Đức', CAST(N'2022-05-13' AS Date), N'd19cqcn03 ')
INSERT [dbo].[SINHVIEN] ([MaSV], [HoSV], [TenSV], [Phai], [DiaChi], [NgaySinh], [MaLop]) VALUES (N'SV01      ', N'Anh', N'Quân', 0, N'Thủ Đức', CAST(N'2001-02-03' AS Date), N'd19cqcn03 ')
GO
INSERT [dbo].[TAIKHOAN] ([ID], [TaiKhoan], [PWD], [Quyen]) VALUES (1, N'GV01      ', N'123456                        ', 1)
GO
INSERT [dbo].[TKGV] ([TK], [MK], [MaQuyen]) VALUES (N'gv01      ', N'123456    ', 2)
INSERT [dbo].[TKGV] ([TK], [MK], [MaQuyen]) VALUES (N'GV02      ', N'123456    ', 2)
GO
INSERT [dbo].[TKQL] ([TK], [MK], [MaQuyen]) VALUES (N'aa        ', N'aa                            ', 1)
INSERT [dbo].[TKQL] ([TK], [MK], [MaQuyen]) VALUES (N'admin     ', N'admin                         ', 1)
GO
INSERT [dbo].[TKSV] ([TK], [MK], [MaQuyen]) VALUES (N'n19dccn001', N'123456    ', 3)
INSERT [dbo].[TKSV] ([TK], [MK], [MaQuyen]) VALUES (N'N19DCCN002', N'123456', 3)
INSERT [dbo].[TKSV] ([TK], [MK], [MaQuyen]) VALUES (N'SV01      ', N'123456   ', 3)
GO
INSERT [dbo].[TRUONGKHOA] ([MaTruongKhoa], [NgayNC]) VALUES (N'asd       ', CAST(N'2001-05-02' AS Date))
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [unique_tencn]    Script Date: 5/30/2022 11:43:38 PM ******/
ALTER TABLE [dbo].[CHUYENNGANH] ADD  CONSTRAINT [unique_tencn] UNIQUE NONCLUSTERED 
(
	[TenCN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_KHOA]    Script Date: 5/30/2022 11:43:38 PM ******/
ALTER TABLE [dbo].[KHOA] ADD  CONSTRAINT [IX_KHOA] UNIQUE NONCLUSTERED 
(
	[TenKhoa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MONHOC]    Script Date: 5/30/2022 11:43:38 PM ******/
ALTER TABLE [dbo].[MONHOC] ADD  CONSTRAINT [IX_MONHOC] UNIQUE NONCLUSTERED 
(
	[TenMH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_TAIKHOAN]    Script Date: 5/30/2022 11:43:38 PM ******/
ALTER TABLE [dbo].[TAIKHOAN] ADD  CONSTRAINT [IX_TAIKHOAN] UNIQUE NONCLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DANGKYLTC] ADD  CONSTRAINT [DF_DANGKYLTC_DCC]  DEFAULT ((0)) FOR [DCC]
GO
ALTER TABLE [dbo].[DANGKYLTC] ADD  CONSTRAINT [DF_DANGKYLTC_DGK]  DEFAULT ((0)) FOR [DGK]
GO
ALTER TABLE [dbo].[DANGKYLTC] ADD  CONSTRAINT [DF_DANGKYLTC_DThi]  DEFAULT ((0)) FOR [DThi]
GO
ALTER TABLE [dbo].[DANGKYLTC] ADD  CONSTRAINT [DF_DANGKYLTC_HUYDK]  DEFAULT ((0)) FOR [HuyDK]
GO
ALTER TABLE [dbo].[GIANGVIEN] ADD  CONSTRAINT [DF_GIANGVIEN_CHUCVU]  DEFAULT (N'Giảng viên') FOR [ChucVu]
GO
ALTER TABLE [dbo].[LOP] ADD  CONSTRAINT [DF_LOP_KHOAHOC]  DEFAULT (datepart(year,getdate())) FOR [KhoaHoc]
GO
ALTER TABLE [dbo].[LOPTINCHI] ADD  CONSTRAINT [DF_LOPTINCHI_SVMIN]  DEFAULT ((30)) FOR [SVTT]
GO
ALTER TABLE [dbo].[LOPTINCHI] ADD  CONSTRAINT [DF_LOPTINCHI_SVTD]  DEFAULT ((30)) FOR [SVTD]
GO
ALTER TABLE [dbo].[LOPTINCHI] ADD  CONSTRAINT [DF_LOPTINCHI_HocKi]  DEFAULT ((1)) FOR [HocKi]
GO
ALTER TABLE [dbo].[LOPTINCHI] ADD  CONSTRAINT [DF_LOPTINCHI_HeSo1]  DEFAULT ((0)) FOR [HeSo1]
GO
ALTER TABLE [dbo].[LOPTINCHI] ADD  CONSTRAINT [DF_LOPTINCHI_HeSo2]  DEFAULT ((0)) FOR [HeSo2]
GO
ALTER TABLE [dbo].[LOPTINCHI] ADD  CONSTRAINT [DF_LOPTINCHI_TrangThai]  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[MONHOC] ADD  CONSTRAINT [DF_MONHOC_TIETLT]  DEFAULT ((0)) FOR [TietLT]
GO
ALTER TABLE [dbo].[MONHOC] ADD  CONSTRAINT [DF_MONHOC_TIETTH]  DEFAULT ((0)) FOR [TietTH]
GO
ALTER TABLE [dbo].[SINHVIEN] ADD  CONSTRAINT [DF_SINHVIEN_PHAI]  DEFAULT ((0)) FOR [Phai]
GO
ALTER TABLE [dbo].[TAIKHOAN] ADD  CONSTRAINT [DF_TaiKhoan_PWD]  DEFAULT ((123456)) FOR [PWD]
GO
ALTER TABLE [dbo].[TAIKHOAN] ADD  CONSTRAINT [DF_TAIKHOAN_Quyen]  DEFAULT ((1)) FOR [Quyen]
GO
ALTER TABLE [dbo].[TIEUCHI] ADD  CONSTRAINT [DF_TIEUCHI_Nam]  DEFAULT (datepart(year,getdate())) FOR [Nam]
GO
ALTER TABLE [dbo].[TKGV] ADD  CONSTRAINT [DF_TKGV_TK]  DEFAULT ((2)) FOR [TK]
GO
ALTER TABLE [dbo].[TKGV] ADD  CONSTRAINT [DF_TKGV_PWD]  DEFAULT ((123456)) FOR [MK]
GO
ALTER TABLE [dbo].[TKGV] ADD  CONSTRAINT [DF_TKGV_MaQuyen]  DEFAULT ((2)) FOR [MaQuyen]
GO
ALTER TABLE [dbo].[TKQL] ADD  CONSTRAINT [DF_QuanLy_MaQuyen]  DEFAULT ((1)) FOR [MaQuyen]
GO
ALTER TABLE [dbo].[TKSV] ADD  CONSTRAINT [DF_TKSV_PWD]  DEFAULT ((123456)) FOR [MK]
GO
ALTER TABLE [dbo].[TKSV] ADD  CONSTRAINT [DF_TKSV_MaQuyen]  DEFAULT ((3)) FOR [MaQuyen]
GO
ALTER TABLE [dbo].[TRUONGKHOA] ADD  CONSTRAINT [DF_TRUONGKHOA_NGAYNC]  DEFAULT (getdate()) FOR [NgayNC]
GO
ALTER TABLE [dbo].[CHITIETDIEMLV]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDIEMLV_GIANGVIEN] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GIANGVIEN] ([MaGV])
GO
ALTER TABLE [dbo].[CHITIETDIEMLV] CHECK CONSTRAINT [FK_CHITIETDIEMLV_GIANGVIEN]
GO
ALTER TABLE [dbo].[CHITIETDIEMLV]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDIEMLV_LUANVANTN] FOREIGN KEY([MaLV])
REFERENCES [dbo].[LUANVANTN] ([MaLV])
GO
ALTER TABLE [dbo].[CHITIETDIEMLV] CHECK CONSTRAINT [FK_CHITIETDIEMLV_LUANVANTN]
GO
ALTER TABLE [dbo].[CHITIETDIEMLV]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETDIEMLV_SINHVIEN] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SINHVIEN] ([MaSV])
GO
ALTER TABLE [dbo].[CHITIETDIEMLV] CHECK CONSTRAINT [FK_CHITIETDIEMLV_SINHVIEN]
GO
ALTER TABLE [dbo].[DANGKYLTC]  WITH CHECK ADD  CONSTRAINT [FK_DANGKYLTC_LOPTINCHI] FOREIGN KEY([MaLTC])
REFERENCES [dbo].[LOPTINCHI] ([MaLTC])
GO
ALTER TABLE [dbo].[DANGKYLTC] CHECK CONSTRAINT [FK_DANGKYLTC_LOPTINCHI]
GO
ALTER TABLE [dbo].[DANGKYLTC]  WITH CHECK ADD  CONSTRAINT [FK_DANGKYLTC_SINHVIEN] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SINHVIEN] ([MaSV])
GO
ALTER TABLE [dbo].[DANGKYLTC] CHECK CONSTRAINT [FK_DANGKYLTC_SINHVIEN]
GO
ALTER TABLE [dbo].[DAYLOPTC]  WITH CHECK ADD  CONSTRAINT [FK_DAYLOPTC_GIANGVIEN] FOREIGN KEY([MAGV])
REFERENCES [dbo].[GIANGVIEN] ([MaGV])
GO
ALTER TABLE [dbo].[DAYLOPTC] CHECK CONSTRAINT [FK_DAYLOPTC_GIANGVIEN]
GO
ALTER TABLE [dbo].[DAYLOPTC]  WITH CHECK ADD  CONSTRAINT [FK_DAYLOPTC_LOPTINCHI] FOREIGN KEY([MALTC])
REFERENCES [dbo].[LOPTINCHI] ([MaLTC])
GO
ALTER TABLE [dbo].[DAYLOPTC] CHECK CONSTRAINT [FK_DAYLOPTC_LOPTINCHI]
GO
ALTER TABLE [dbo].[HOCBONG]  WITH CHECK ADD  CONSTRAINT [FK_HOCBONG_LOAIHOCBONG1] FOREIGN KEY([MaHB])
REFERENCES [dbo].[LOAIHOCBONG] ([MaHB])
GO
ALTER TABLE [dbo].[HOCBONG] CHECK CONSTRAINT [FK_HOCBONG_LOAIHOCBONG1]
GO
ALTER TABLE [dbo].[HOCBONG]  WITH CHECK ADD  CONSTRAINT [FK_HOCBONG_SINHVIEN1] FOREIGN KEY([MaSV])
REFERENCES [dbo].[SINHVIEN] ([MaSV])
GO
ALTER TABLE [dbo].[HOCBONG] CHECK CONSTRAINT [FK_HOCBONG_SINHVIEN1]
GO
ALTER TABLE [dbo].[KHANANGDAY]  WITH CHECK ADD  CONSTRAINT [FK_DAYMONHOC_GIANGVIEN] FOREIGN KEY([MaGV])
REFERENCES [dbo].[GIANGVIEN] ([MaGV])
GO
ALTER TABLE [dbo].[KHANANGDAY] CHECK CONSTRAINT [FK_DAYMONHOC_GIANGVIEN]
GO
ALTER TABLE [dbo].[KHANANGDAY]  WITH CHECK ADD  CONSTRAINT [FK_DAYMONHOC_MONHOC] FOREIGN KEY([MaMH])
REFERENCES [dbo].[MONHOC] ([MaMH])
GO
ALTER TABLE [dbo].[KHANANGDAY] CHECK CONSTRAINT [FK_DAYMONHOC_MONHOC]
GO
ALTER TABLE [dbo].[LOP]  WITH CHECK ADD  CONSTRAINT [FK_LOP_CHUYENNGANH] FOREIGN KEY([MaCN])
REFERENCES [dbo].[CHUYENNGANH] ([MaCN])
GO
ALTER TABLE [dbo].[LOP] CHECK CONSTRAINT [FK_LOP_CHUYENNGANH]
GO
ALTER TABLE [dbo].[LOPTINCHI]  WITH CHECK ADD  CONSTRAINT [FK_LOPTINCHI_MONHOC] FOREIGN KEY([MaMH])
REFERENCES [dbo].[MONHOC] ([MaMH])
GO
ALTER TABLE [dbo].[LOPTINCHI] CHECK CONSTRAINT [FK_LOPTINCHI_MONHOC]
GO
ALTER TABLE [dbo].[MONHOCNGANH]  WITH CHECK ADD  CONSTRAINT [FK_MONHOCNGANH_CHUYENNGANH] FOREIGN KEY([MaCN])
REFERENCES [dbo].[CHUYENNGANH] ([MaCN])
GO
ALTER TABLE [dbo].[MONHOCNGANH] CHECK CONSTRAINT [FK_MONHOCNGANH_CHUYENNGANH]
GO
ALTER TABLE [dbo].[MONHOCNGANH]  WITH CHECK ADD  CONSTRAINT [FK_MONHOCNGANH_MONHOC] FOREIGN KEY([MaMH])
REFERENCES [dbo].[MONHOC] ([MaMH])
GO
ALTER TABLE [dbo].[MONHOCNGANH] CHECK CONSTRAINT [FK_MONHOCNGANH_MONHOC]
GO
ALTER TABLE [dbo].[SINHVIEN]  WITH CHECK ADD  CONSTRAINT [FK_SINHVIEN_LOP1] FOREIGN KEY([MaLop])
REFERENCES [dbo].[LOP] ([MaLop])
GO
ALTER TABLE [dbo].[SINHVIEN] CHECK CONSTRAINT [FK_SINHVIEN_LOP1]
GO
ALTER TABLE [dbo].[TIEUCHI]  WITH CHECK ADD  CONSTRAINT [FK_TIEUCHI_CHUYENNGANH] FOREIGN KEY([MaCN])
REFERENCES [dbo].[CHUYENNGANH] ([MaCN])
GO
ALTER TABLE [dbo].[TIEUCHI] CHECK CONSTRAINT [FK_TIEUCHI_CHUYENNGANH]
GO
ALTER TABLE [dbo].[TKGV]  WITH CHECK ADD  CONSTRAINT [FK_TKGV_GIANGVIEN] FOREIGN KEY([TK])
REFERENCES [dbo].[GIANGVIEN] ([MaGV])
GO
ALTER TABLE [dbo].[TKGV] CHECK CONSTRAINT [FK_TKGV_GIANGVIEN]
GO
ALTER TABLE [dbo].[TKGV]  WITH CHECK ADD  CONSTRAINT [FK_TKGV_QUYEN] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[QUYEN] ([MaQuyen])
GO
ALTER TABLE [dbo].[TKGV] CHECK CONSTRAINT [FK_TKGV_QUYEN]
GO
ALTER TABLE [dbo].[TKQL]  WITH CHECK ADD  CONSTRAINT [FK_QUANLI_QUYEN] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[QUYEN] ([MaQuyen])
GO
ALTER TABLE [dbo].[TKQL] CHECK CONSTRAINT [FK_QUANLI_QUYEN]
GO
ALTER TABLE [dbo].[TKSV]  WITH CHECK ADD  CONSTRAINT [FK_TKSV_QUYEN] FOREIGN KEY([MaQuyen])
REFERENCES [dbo].[QUYEN] ([MaQuyen])
GO
ALTER TABLE [dbo].[TKSV] CHECK CONSTRAINT [FK_TKSV_QUYEN]
GO
ALTER TABLE [dbo].[TKSV]  WITH CHECK ADD  CONSTRAINT [FK_TKSV_SINHVIEN] FOREIGN KEY([TK])
REFERENCES [dbo].[SINHVIEN] ([MaSV])
GO
ALTER TABLE [dbo].[TKSV] CHECK CONSTRAINT [FK_TKSV_SINHVIEN]
GO
ALTER TABLE [dbo].[DANGKYLTC]  WITH CHECK ADD  CONSTRAINT [CK_DANGKYLTC] CHECK  (([DCC]>=(0) AND [DCC]<=(10)))
GO
ALTER TABLE [dbo].[DANGKYLTC] CHECK CONSTRAINT [CK_DANGKYLTC]
GO
ALTER TABLE [dbo].[DANGKYLTC]  WITH CHECK ADD  CONSTRAINT [CK_DANGKYLTC_2] CHECK  (([DGK]>=(0) AND [DGK]<=(10)))
GO
ALTER TABLE [dbo].[DANGKYLTC] CHECK CONSTRAINT [CK_DANGKYLTC_2]
GO
ALTER TABLE [dbo].[DANGKYLTC]  WITH CHECK ADD  CONSTRAINT [CK_DANGKYLTC_3] CHECK  (([DThi]>=(0) AND [DThi]<=(10)))
GO
ALTER TABLE [dbo].[DANGKYLTC] CHECK CONSTRAINT [CK_DANGKYLTC_3]
GO
ALTER TABLE [dbo].[DANGKYLTC]  WITH CHECK ADD  CONSTRAINT [CK_DANGKYLTC_4] CHECK  (([HuyDK]=(0) OR [HuyDK]=(1)))
GO
ALTER TABLE [dbo].[DANGKYLTC] CHECK CONSTRAINT [CK_DANGKYLTC_4]
GO
ALTER TABLE [dbo].[LOPTINCHI]  WITH CHECK ADD  CONSTRAINT [CK_LOPTINCHI] CHECK  (([SVTT]>=(30)))
GO
ALTER TABLE [dbo].[LOPTINCHI] CHECK CONSTRAINT [CK_LOPTINCHI]
GO
ALTER TABLE [dbo].[LOPTINCHI]  WITH CHECK ADD  CONSTRAINT [CK_LOPTINCHI_1] CHECK  (([SVTD]>=[SVTT]))
GO
ALTER TABLE [dbo].[LOPTINCHI] CHECK CONSTRAINT [CK_LOPTINCHI_1]
GO
ALTER TABLE [dbo].[MONHOC]  WITH CHECK ADD  CONSTRAINT [CK_MONHOC] CHECK  (([SoTC]>=(1) AND [SoTC]<=(10)))
GO
ALTER TABLE [dbo].[MONHOC] CHECK CONSTRAINT [CK_MONHOC]
GO
ALTER TABLE [dbo].[MONHOC]  WITH CHECK ADD  CONSTRAINT [CK_MONHOC_1] CHECK  (([TietLT]>=(0)))
GO
ALTER TABLE [dbo].[MONHOC] CHECK CONSTRAINT [CK_MONHOC_1]
GO
ALTER TABLE [dbo].[MONHOC]  WITH CHECK ADD  CONSTRAINT [CK_MONHOC_2] CHECK  (([TietTH]>=(0)))
GO
ALTER TABLE [dbo].[MONHOC] CHECK CONSTRAINT [CK_MONHOC_2]
GO
USE [master]
GO
ALTER DATABASE [QLDSV] SET  READ_WRITE 
GO
