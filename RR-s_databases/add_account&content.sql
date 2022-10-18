USE [RRS_DB]
GO
	DELETE FROM ACCOUNTS WHERE username <> 'user' and username <> 'guest';
GO
INSERT [dbo].[ACCOUNTS] ([username], [password], [name], [email], [image], [regDate]) VALUES (N'abc', N'123', N'Chung Bảo Trúc', N'samara.hirthe69@yahoo.com', N'user.png', CAST(N'2022-03-16' AS Date))
INSERT [dbo].[ACCOUNTS] ([username], [password], [name], [email], [image], [regDate]) VALUES (N'bcd', N'123', N'Giang Lê Quỳnh', N'estrella42@gmail.com', N'user.png', CAST(N'2022-03-25' AS Date))
INSERT [dbo].[ACCOUNTS] ([username], [password], [name], [email], [image], [regDate]) VALUES (N'cde', N'123', N'Ngư Thy Vân', N'myrl_mitchell@gmail.com', N'user.png', CAST(N'2022-03-30' AS Date))
INSERT [dbo].[ACCOUNTS] ([username], [password], [name], [email], [image], [regDate]) VALUES (N'def', N'123', N'Phan Hạnh Dung', N'maria5@gmail.com', N'user.png', CAST(N'2022-04-14' AS Date))
INSERT [dbo].[ACCOUNTS] ([username], [password], [name], [email], [image], [regDate]) VALUES (N'efg', N'123', N'Đỗ Ngọc Oanh', N'adam.hartmann@hotmail.com', N'user.png', CAST(N'2022-04-18' AS Date))
INSERT [dbo].[ACCOUNTS] ([username], [password], [name], [email], [image], [regDate]) VALUES (N'fgh', N'123', N'Nguyễn Tuấn Long', N'bryce44@gmail.com', N'user.png', CAST(N'2022-05-26' AS Date))
INSERT [dbo].[ACCOUNTS] ([username], [password], [name], [email], [image], [regDate]) VALUES (N'ghi', N'123', N'Nguyễn Kim Chi', N'randy_mcglynn47@gmail.com', N'user.png', CAST(N'2022-06-03' AS Date))
INSERT [dbo].[ACCOUNTS] ([username], [password], [name], [email], [image], [regDate]) VALUES (N'hij', N'123', N'Đào Trường Sơn', N'jacky_wolff@gmail.com', N'user.png', CAST(N'2022-06-16' AS Date))
INSERT [dbo].[ACCOUNTS] ([username], [password], [name], [email], [image], [regDate]) VALUES (N'ijk', N'123', N'Trịnh Bích Châu', N'margret.bogisich@hotmail.com', N'user.png', CAST(N'2022-07-25' AS Date))
INSERT [dbo].[ACCOUNTS] ([username], [password], [name], [email], [image], [regDate]) VALUES (N'jkl', N'123', N'Trương Tuyết Băng', N'dagmar_hauck@hotmail.com', N'user.png', CAST(N'2022-07-26' AS Date))
INSERT [dbo].[ACCOUNTS] ([username], [password], [name], [email], [image], [regDate]) VALUES (N'klm', N'123', N'Võ Công Luận', N'jamison_quitzon73@yahoo.com', N'user.png', CAST(N'2022-08-15' AS Date))
INSERT [dbo].[ACCOUNTS] ([username], [password], [name], [email], [image], [regDate]) VALUES (N'lmn', N'123', N'Tô Xuân Hương', N'alanis.funk@gmail.com', N'user.png', CAST(N'2022-08-16' AS Date))
INSERT [dbo].[ACCOUNTS] ([username], [password], [name], [email], [image], [regDate]) VALUES (N'mno', N'123', N'Ân Tuyết Hương', N'thurman_schultz@yahoo.com', N'user.png', CAST(N'2022-09-21' AS Date))
INSERT [dbo].[ACCOUNTS] ([username], [password], [name], [email], [image], [regDate]) VALUES (N'nop', N'123', N'Nguyễn Thái Minh', N'trent_fay@yahoo.com', N'user.png', CAST(N'2022-10-13' AS Date))
INSERT [dbo].[ACCOUNTS] ([username], [password], [name], [email], [image], [regDate]) VALUES (N'opq', N'123', N'Mã Vân Sơn', N'cleta.hansen13@hotmail.com', N'user.png', CAST(N'2022-10-20' AS Date))
INSERT [dbo].[ACCOUNTS] ([username], [password], [name], [email], [image], [regDate]) VALUES (N'pqr', N'123', N'Tôn Hải Sơn', N'mack_mertz@hotmail.com', N'user.png', CAST(N'2022-11-14' AS Date))
INSERT [dbo].[ACCOUNTS] ([username], [password], [name], [email], [image], [regDate]) VALUES (N'qrs', N'123', N'Hồ Thiện Ân', N'judd.mcdermott76@hotmail.com', N'user.png', CAST(N'2022-11-17' AS Date))
INSERT [dbo].[ACCOUNTS] ([username], [password], [name], [email], [image], [regDate]) VALUES (N'rst', N'123', N'Tô Quốc Tuấn', N'gaetano_predovic41@gmail.com', N'user.png', CAST(N'2022-11-29' AS Date))
INSERT [dbo].[ACCOUNTS] ([username], [password], [name], [email], [image], [regDate]) VALUES (N'stu', N'123', N'Phan Xuân Bình', N'jamarcus_krajcik@hotmail.com', N'user.png', CAST(N'2022-12-15' AS Date))
INSERT [dbo].[ACCOUNTS] ([username], [password], [name], [email], [image], [regDate]) VALUES (N'tuv', N'123', N'Võ Trường Nam', N'edd.gaylord@hotmail.com', N'user.png', CAST(N'2022-12-20' AS Date))
GO

/* __________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________ */

GO
	DELETE FROM [dbo].[CONTENTS] WHERE [id] > 5
	DBCC CHECKIDENT ('[CONTENTS]', RESEED, 5);
GO
SET IDENTITY_INSERT [dbo].[CONTENTS] ON 
INSERT [dbo].[CONTENTS] ([id], [subject], [content], [regTime], [views], [active], [account_id]) VALUES (6, N'Cần tuyển người bán bánh mì 🌭', N'Hiện Quán chị Hiền khai trương tuần tới. Cần tuyển nhân viên bán bánh mì, thời gian làm từ 6h00 - 10h + 15h-19h.', CAST(N'2022-01-12T04:22:51.000' AS DateTime), 0, 1, N'qrs')
INSERT [dbo].[CONTENTS] ([id], [subject], [content], [regTime], [views], [active], [account_id]) VALUES (7, N'Mình cần mua một điện thoại giá rẻ', N'Cần điện thoại chữa cháy giá tầm 1tr, chỉ cần nghe gọi và online các mạng xã hội', CAST(N'2022-04-04T17:34:23.000' AS DateTime), 0, 1, N'nop')
INSERT [dbo].[CONTENTS] ([id], [subject], [content], [regTime], [views], [active], [account_id]) VALUES (8, N'Mai cần người đi công trường gấp', N'Thiếu 5 bạn đi công trường, công việc là lắp ráp mái nhà 400/ngày. Nhận lương cuối ca', CAST(N'2022-03-22T10:45:23.000' AS DateTime), 0, 1, N'efg')
INSERT [dbo].[CONTENTS] ([id], [subject], [content], [regTime], [views], [active], [account_id]) VALUES (9, N'Đây là nội dung nhảm', N'Tao đăng lên cho vui thôi, không có ý đồ gì hết á, a haha', CAST(N'2022-08-28T14:27:01.000' AS DateTime), 0, 1, N'klm')
INSERT [dbo].[CONTENTS] ([id], [subject], [content], [regTime], [views], [active], [account_id]) VALUES (10, N'Cần mua xe giá tầm 🛵50tr', N'Cần chiếc tay côn giá tầm 50tr, ae có xe hoặc tu vấn tui với', CAST(N'2022-04-15T02:26:26.000' AS DateTime), 0, 1, N'tuv')
INSERT [dbo].[CONTENTS] ([id], [subject], [content], [regTime], [views], [active], [account_id]) VALUES (11, N'Quán café Tân Bình sắp khai trương, cần người hỗ trợ', N'Café sắp khai trương cần người làm, liên Hệ Chị Ngọc sdt … Hoặc email', CAST(N'2022-02-19T03:55:43.000' AS DateTime), 0, 0, N'opq')
INSERT [dbo].[CONTENTS] ([id], [subject], [content], [regTime], [views], [active], [account_id]) VALUES (12, N'Nhóm sinh viên 5 người sắp ra trường cần tìm việc làm', N'Nhóm mình có 5 thành viên, vì muốn làm việc chung nên cần tìm công ty tuyển đủ 5 người vào làm', CAST(N'2022-06-10T04:30:25.000' AS DateTime), 0, 1, N'stu')
INSERT [dbo].[CONTENTS] ([id], [subject], [content], [regTime], [views], [active], [account_id]) VALUES (13, N'Ai biết đây là cây 🍀 gì không ạ? Ai có liên hệ mình cần mua', N'Vì bé Na 🐍 nhà mình hít thở không đều, ngáy khò khè suốt ngày nên mình cần cây như hình cho bé hít qua ngày. Mình thương bé Nak lắm 🤣.', CAST(N'2022-01-16T16:52:24.000' AS DateTime), 0, 1, N'fgh')
INSERT [dbo].[CONTENTS] ([id], [subject], [content], [regTime], [views], [active], [account_id]) VALUES (14, N'Mình đang học spring-boot cần người học chung', N'🍃 Ai học spring-boot không ạ, cần tìm bạn học chung và giúp đỡ lẫn nhau trong quá trình học tập', CAST(N'2022-08-22T06:29:58.000' AS DateTime), 0, 1, N'lmn')
INSERT [dbo].[CONTENTS] ([id], [subject], [content], [regTime], [views], [active], [account_id]) VALUES (15, N'Đăng cho vui và không có mục đích gì =>', N'😁 À thế làm sao mà à, tao là tao rất chi là rảnh đó nha. Tao không đùa đâu và tao chỉ đăng cho vui thoi được khum 😛.', CAST(N'2022-01-17T18:25:41.000' AS DateTime), 0, 0, N'ghi')
INSERT [dbo].[CONTENTS] ([id], [subject], [content], [regTime], [views], [active], [account_id]) VALUES (16, N'Mình cần tìm phòng trọ giá tầm 3 tr khoảng 5 người ở', N'Cần tìm phòng cho 5 con đầu đen ở, giá tầm 2tr5- 3tr5, yêu cầu có wifi + nước tính theo người nha.', CAST(N'2022-02-21T14:44:02.000' AS DateTime), 0, 1, N'abc')
INSERT [dbo].[CONTENTS] ([id], [subject], [content], [regTime], [views], [active], [account_id]) VALUES (17, N'Hiện tại mình cần tìm 2 bạn theo làm lâu dài tới tết, công việc trong mô tả', N'Công việc theo mình làm là đi lắp điện gia dụng, camera… biết một chút về điện là lợi thế nha', CAST(N'2022-03-29T23:29:02.000' AS DateTime), 0, 0, N'ijk')
INSERT [dbo].[CONTENTS] ([id], [subject], [content], [regTime], [views], [active], [account_id]) VALUES (18, N'Tìm người dạy kèm cho con lớp 8 môn Hóa', N'Con zai mình lớp 8 bắt đầu học môn Hóa Học, cần một chị có ngoại hình vì bé đòi 🤣 dạy em môn hóa. Cuối năm tiền thưởng (điểm tổng của bé * 1tr) sẽ được trả nhe. Còn tiền kèm học tùy gia sư tính nha.', CAST(N'2022-03-30T13:31:12.000' AS DateTime), 0, 1, N'bcd')
INSERT [dbo].[CONTENTS] ([id], [subject], [content], [regTime], [views], [active], [account_id]) VALUES (19, N'Đầu tháng 12 tới, mình đi Đà Lạt với vài bạn, cần một hướng dẫn viên ạ', N'Nhóm 5 nam tìm hướng dẫn viên nữ. Yêu cầu thuần thục map địa phương + biết nhiều món ăn ngon =-)', CAST(N'2022-07-18T16:55:08.000' AS DateTime), 0, 1, N'ijk')
INSERT [dbo].[CONTENTS] ([id], [subject], [content], [regTime], [views], [active], [account_id]) VALUES (20, N'Mình bán xe do kẹt tiền tầm 20tr nha', N'Chiếc vision năm 2021 bán lại do cần tiền mở quán', CAST(N'2022-01-10T17:33:46.000' AS DateTime), 0, 1, N'bcd')
INSERT [dbo].[CONTENTS] ([id], [subject], [content], [regTime], [views], [active], [account_id]) VALUES (21, N'Mua điện thoại hư, cũ để lấy linh kiện ⌨', N'Ai có thiết bị điện tử bị hư, hỏng bán lại cho tui, tui lấy linh kiện thay thế', CAST(N'2022-06-25T06:39:05.000' AS DateTime), 0, 0, N'abc')
INSERT [dbo].[CONTENTS] ([id], [subject], [content], [regTime], [views], [active], [account_id]) VALUES (22, N'Điện thoại mới mua rớt bể màn cần sell lại cho ai cần', N'Chiếc này mới mua sài được 1 tuần thì rớt vỡ màn, cần bán lại. Chỉ hư màn thôi nha', CAST(N'2022-01-09T08:28:03.000' AS DateTime), 0, 1, N'tuv')
INSERT [dbo].[CONTENTS] ([id], [subject], [content], [regTime], [views], [active], [account_id]) VALUES (23, N'Tôi bán cậu vàng, (Cậu Vàng bán Lão Hạc) ಥ_ಥ', N'Cậu vàng nhà tui định bán lão hạc nên tui phải cao tay hơn đi trước cậu một bước, tui bán cậu vàng giống Nhật shiba Inu nhe', CAST(N'2022-02-15T04:26:36.000' AS DateTime), 0, 1, N'efg')
INSERT [dbo].[CONTENTS] ([id], [subject], [content], [regTime], [views], [active], [account_id]) VALUES (24, N'Tìm việc làm lương theo ngày hoặc tuần', N'Mình thất nghiệp 3 ngày nay cần người tuyển việc làm cho mình theo làm, thòi gian cố định càng tốt', CAST(N'2022-09-20T12:37:18.000' AS DateTime), 0, 0, N'qrs')
INSERT [dbo].[CONTENTS] ([id], [subject], [content], [regTime], [views], [active], [account_id]) VALUES (25, N'Cần vài bạn chăm chỉ, chắc chắn thì liên hệ 😐 theo mình làm lương tuần', N'Mình tuyển người đi lơ xe container, yêu cầu có sức khỏe, công việc lơ xe xuyên tính bắc nam. Một chuyển đi tầm 3-4 ngày. Lương thanh toán theo tuần hoặc chuyến xe. Yêu caafi CMND, SDT, HỌ TÊN, STK-NH chính chủ. Làm việc nghiêm túc được thưởng thêm.', CAST(N'2022-05-05T21:24:35.000' AS DateTime), 0, 1, N'stu')
SET IDENTITY_INSERT [dbo].[CONTENTS] OFF
GO
INSERT [dbo].[CONTENT_IMAGES] ([image], [content_id]) VALUES('https://cdn.huongnghiepaau.com/wp-content/uploads/2020/04/image-search-la-gi.jpg', 7);
INSERT [dbo].[CONTENT_IMAGES] ([image], [content_id]) VALUES('https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg', 7);
INSERT [dbo].[CONTENT_IMAGES] ([image], [content_id]) VALUES('https://www.w3schools.com/w3images/fjords.jpg', 8);
INSERT [dbo].[CONTENT_IMAGES] ([image], [content_id]) VALUES('https://www.w3schools.com/css/img_5terre.jpg', 10);
INSERT [dbo].[CONTENT_IMAGES] ([image], [content_id]) VALUES('https://tinypng.com/images/social/website.jpg', 12);
INSERT [dbo].[CONTENT_IMAGES] ([image], [content_id]) VALUES('https://i.ytimg.com/vi/7oIAs-0G4mw/maxresdefault.jpg', 15);

SELECT * FROM [dbo].[CONTENTS]
SELECT * FROM [dbo].[CONTENT_IMAGES] ORDER BY content_id desc
