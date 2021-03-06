CREATE DATABASE CNCWOODCUTTERDATABASE
GO

USE [CNCWOODCUTTERDATABASE]
GO
/****** Object:  StoredProcedure [dbo].[PSave_Customer]    Script Date: 10/14/2016 6:23:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PSave_Customer]
	@NationalCode nvarchar(10),
	@Name nvarchar(50),
	@Family nvarchar(50),
	@Phone nvarchar(10),
	@Adress nvarchar(50),
	@ServiceType nvarchar(50),
	@Description nvarchar(50)
	
AS
	Insert into dbo.CustomerTB values(@NationalCode,@Name,@Family,@Phone,@Adress,@ServiceType,@Description)
RETURN 0



GO
/****** Object:  StoredProcedure [dbo].[PSave_Part]    Script Date: 10/14/2016 6:23:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PSave_Part]
	@NationalCode nvarchar(10),		
	@SheetID nvarchar(50),
	@Height float,
	@Width float,
	@PartNo int,
	@Material nvarchar(50),
	@Rotate bit,
	@Thickness float,
	@Design nvarchar(50),
	@Colour nvarchar(50)
	
AS
	Insert into dbo.PartTB values(@NationalCode,@SheetID,@Height,@Width,@PartNo,@Material,@Rotate,@Thickness,@Design,@Colour)
RETURN 0




GO
/****** Object:  StoredProcedure [dbo].[PSave_Sheet]    Script Date: 10/14/2016 6:23:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PSave_Sheet]
	@NationalCode nvarchar(10),
	@SheetID nvarchar(50),
	@Height float,
	@Width float,
	@StockNO int,
	@TrimLeft float,
	@TrimRight float,
	@TrimUp	float,
	@TrimDown float,
	@Material nvarchar(50),
	@Thickness float,	
	@Design nvarchar(50),	
	@Colour nvarchar(50)
AS
	Insert into dbo.SheetTB values(@NationalCode,@SheetID,@Height,@Width,@StockNO,@TrimLeft,@TrimRight,@TrimUp,@TrimDown,@Material,@Thickness,@Design,@Colour)
RETURN 0



GO
/****** Object:  Table [dbo].[CustomerTB]    Script Date: 10/14/2016 6:23:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerTB](
	[NationalCode] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Family] [nvarchar](50) NULL,
	[Phone] [nvarchar](10) NULL,
	[Adress] [nvarchar](50) NULL,
	[ServiceType] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_CustomerTB] PRIMARY KEY CLUSTERED 
(
	[NationalCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PartTB]    Script Date: 10/14/2016 6:23:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartTB](
	[NationalCode] [nvarchar](10) NOT NULL,
	[SheetID] [nvarchar](50) NOT NULL,
	[Height] [float] NOT NULL,
	[Width] [float] NOT NULL,
	[PartNo] [int] NOT NULL,
	[Material] [nvarchar](50) NOT NULL,
	[Rotate] [bit] NOT NULL,
	[Thickness] [float] NOT NULL,
	[Design] [nvarchar](50) NOT NULL,
	[Colour] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SheetTB]    Script Date: 10/14/2016 6:23:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SheetTB](
	[NationalCode] [nvarchar](10) NOT NULL,
	[SheetID] [nvarchar](50) NOT NULL,
	[Height] [float] NOT NULL,
	[Width] [float] NOT NULL,
	[StockNo] [int] NOT NULL,
	[TrimLeft] [float] NOT NULL,
	[TrimRight] [float] NOT NULL,
	[TrimUp] [float] NOT NULL,
	[TrimDown] [float] NOT NULL,
	[Material] [nvarchar](50) NOT NULL,
	[Thickness] [float] NOT NULL,
	[Design] [nvarchar](50) NOT NULL,
	[Colour] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_SheetTB_1] PRIMARY KEY CLUSTERED 
(
	[SheetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[PartTB] ADD  CONSTRAINT [DF__PartTB__Height__182C9B23]  DEFAULT ((120)) FOR [Height]
GO
ALTER TABLE [dbo].[PartTB] ADD  CONSTRAINT [DF__PartTB__Width__173876EA]  DEFAULT ((102)) FOR [Width]
GO
ALTER TABLE [dbo].[PartTB] ADD  CONSTRAINT [DF__PartTB__PartNo__164452B1]  DEFAULT ((1)) FOR [PartNo]
GO
ALTER TABLE [dbo].[PartTB] ADD  CONSTRAINT [DF__PartTB__Rotate__15502E78]  DEFAULT ((1)) FOR [Rotate]
GO
ALTER TABLE [dbo].[SheetTB] ADD  CONSTRAINT [DF__SheetTB__StockNo__1A14E395]  DEFAULT ((1)) FOR [StockNo]
GO
ALTER TABLE [dbo].[SheetTB] ADD  CONSTRAINT [DF__SheetTB__TrimLef__1B0907CE]  DEFAULT ((0)) FOR [TrimLeft]
GO
ALTER TABLE [dbo].[SheetTB] ADD  CONSTRAINT [DF__SheetTB__TrimRig__1BFD2C07]  DEFAULT ((0)) FOR [TrimRight]
GO
ALTER TABLE [dbo].[SheetTB] ADD  CONSTRAINT [DF__SheetTB__TrimUp__1CF15040]  DEFAULT ((0)) FOR [TrimUp]
GO
ALTER TABLE [dbo].[SheetTB] ADD  CONSTRAINT [DF__SheetTB__TrimDow__1DE57479]  DEFAULT ((0)) FOR [TrimDown]
GO
ALTER TABLE [dbo].[PartTB]  WITH CHECK ADD  CONSTRAINT [FK_PartTB_SheetTB] FOREIGN KEY([SheetID])
REFERENCES [dbo].[SheetTB] ([SheetID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PartTB] CHECK CONSTRAINT [FK_PartTB_SheetTB]
GO
ALTER TABLE [dbo].[SheetTB]  WITH CHECK ADD  CONSTRAINT [FK_SheetTB_CustomerTB] FOREIGN KEY([NationalCode])
REFERENCES [dbo].[CustomerTB] ([NationalCode])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SheetTB] CHECK CONSTRAINT [FK_SheetTB_CustomerTB]
GO
