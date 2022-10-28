USE [RRS_DB]
GO
/****** Object:  Table [dbo].[ACCOUNTS]    Script Date: 10/28/2022 9:07:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ACCOUNTS](
	[username] [varchar](20) NOT NULL,
	[password] [varchar](30) NULL,
	[name] [nvarchar](50) NULL,
	[email] [varchar](50) NULL,
	[image] [nvarchar](255) NULL,
	[regDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONTENTS]    Script Date: 10/28/2022 9:07:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTENTS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[subject] [nvarchar](80) NULL,
	[content] [nvarchar](255) NULL,
	[regTime] [datetime] NULL,
	[views] [int] NULL,
	[active] [bit] NULL,
	[account_id] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VIEW_AC_RANGE]    Script Date: 10/28/2022 9:07:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VIEW_AC_RANGE] AS
	SELECT 
		MIN(regTime) as 'st', 
		MAX(regTime) as 'et', 
		COUNT(id) as 'length'
	FROM CONTENTS INNER JOIN ACCOUNTS 
	ON account_id=username
GO
/****** Object:  Table [dbo].[APIs]    Script Date: 10/28/2022 9:07:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIs](
	[id] [varchar](30) NOT NULL,
	[value] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIES]    Script Date: 10/28/2022 9:07:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIES](
	[id] [char](8) NOT NULL,
	[name] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONTENT_IMAGES]    Script Date: 10/28/2022 9:07:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTENT_IMAGES](
	[image] [nvarchar](255) NOT NULL,
	[content_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[image] ASC,
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CONTENT_TYPES]    Script Date: 10/28/2022 9:07:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONTENT_TYPES](
	[content_id] [int] NOT NULL,
	[category_id] [char](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[content_id] ASC,
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LIKES]    Script Date: 10/28/2022 9:07:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LIKES](
	[account_id] [varchar](20) NULL,
	[content_id] [int] NULL,
UNIQUE NONCLUSTERED 
(
	[account_id] ASC,
	[content_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STAFFS]    Script Date: 10/28/2022 9:07:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STAFFS](
	[username] [varchar](20) NOT NULL,
	[password] [varchar](30) NULL,
	[email] [varchar](50) NULL,
	[role] [bit] NULL,
	[image] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CONTENTS] ADD  DEFAULT ((0)) FOR [views]
GO
ALTER TABLE [dbo].[CONTENTS] ADD  DEFAULT ((0)) FOR [active]
GO
ALTER TABLE [dbo].[CONTENT_IMAGES]  WITH CHECK ADD FOREIGN KEY([content_id])
REFERENCES [dbo].[CONTENTS] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CONTENT_TYPES]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[CATEGORIES] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CONTENT_TYPES]  WITH CHECK ADD FOREIGN KEY([content_id])
REFERENCES [dbo].[CONTENTS] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CONTENTS]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[ACCOUNTS] ([username])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LIKES]  WITH CHECK ADD FOREIGN KEY([account_id])
REFERENCES [dbo].[ACCOUNTS] ([username])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LIKES]  WITH CHECK ADD FOREIGN KEY([content_id])
REFERENCES [dbo].[CONTENTS] ([id])
ON UPDATE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[PROC_AC]    Script Date: 10/28/2022 9:07:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PROC_AC] 
	@top int, @start datetime, @end datetime, @desc bit 
AS BEGIN 
	IF @start IS NULL SET @start = (SELECT st FROM VIEW_AC_RANGE)
	IF @end IS NULL SET @end = (SELECT et FROM VIEW_AC_RANGE)
	
	-- SELECT INTO TEMPORARY TABLE
	SELECT a.name, a.username, COUNT(c.account_id) as quantity 
		INTO #TEMP
	FROM ACCOUNTS a 
		INNER JOIN CONTENTS c on a.username = c.account_id
		WHERE c.regTime BETWEEN @start AND @end
	GROUP BY a.name, a.username

	-- SELECT DATA TO RETURN
	IF @desc IS NULL SELECT TOP(ISNULL(@top, 100)) * FROM #TEMP
	ELSE IF @desc=0 SELECT  TOP(ISNULL(@top, 100)) * FROM #TEMP o ORDER BY o.quantity
	ELSE SELECT TOP(ISNULL(@top, 100)) * FROM #TEMP o ORDER BY o.quantity DESC
END
GO
/****** Object:  StoredProcedure [dbo].[PROC_AS]    Script Date: 10/28/2022 9:07:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[PROC_AS]
	@top int, @start datetime, @end datetime, @desc bit 
AS BEGIN 
	IF @start IS NULL SET @start = (SELECT st FROM VIEW_AC_RANGE)
	IF @end IS NULL SET @end = (SELECT et FROM VIEW_AC_RANGE)
	
	-- SELECT INTO TEMPORARY TABLE
	SELECT a.name, a.username, COUNT(c.account_id) as quantity 
		INTO #TEMP
	FROM ACCOUNTS a 
		INNER JOIN CONTENTS c on a.username = c.account_id
		WHERE c.regTime BETWEEN @start AND @end
	GROUP BY a.name, a.username

	-- SELECT DATA TO RETURN
	IF @desc IS NULL SELECT TOP(ISNULL(@top, 100)) * FROM #TEMP
	ELSE IF @desc=0 SELECT  TOP(ISNULL(@top, 100)) * FROM #TEMP o ORDER BY o.quantity
	ELSE SELECT TOP(ISNULL(@top, 100)) * FROM #TEMP o ORDER BY o.quantity DESC
END
GO
/****** Object:  StoredProcedure [dbo].[PROC_CS]    Script Date: 10/28/2022 9:07:08 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- @about = 1(YEAR) | 2(MONTH) | 3(DAY)
CREATE PROC [dbo].[PROC_CS]
	@about TINYINT, @start date, @end date
AS BEGIN
	IF(@about IS NULL OR @about < 1 OR 3 < @about)
		RAISERROR('Chỉ nhận giá trị đầu vào là 1 | 2 | 3', 20 , 1) with LOG
	-- CHECK DATE AND SET LENGTH SUBSTRING DATE
	IF @start IS NULL SET @start = (SELECT st FROM VIEW_AC_RANGE)
	IF @end IS NULL SET @end = (SELECT et FROM VIEW_AC_RANGE)
	DECLARE @CUT_AT TINYINT = 3*@about
	-- SELECT QUERY
	SELECT 
		SUBSTRING(CONVERT(varchar(8), regTime, 2), 0 , @CUT_AT) as about,
		COUNT(*) as 'quantity'
	FROM CONTENTS
	WHERE regTime BETWEEN @start AND @end
	GROUP BY SUBSTRING(CONVERT(varchar(8), regTime, 2), 0 , @CUT_AT)
	ORDER BY about asc
END
GO
