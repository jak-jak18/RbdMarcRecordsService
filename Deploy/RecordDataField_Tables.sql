
USE [Records]
GO

/****** Object:  Table [dbo].[RecordDataField]    Script Date: 5/17/2018 1:49:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[DataField](
	[DataFieldId] [int] NOT NULL,
	[RecordId] [int] NOT NULL,
	[RecordProviderTypeId] [int] NOT NULL,
	[fieldNumber] [varchar](10) NOT NULL,
	[fieldIndicator] [varchar](10) NULL,
	[Value] [varchar](max) NOT NULL,
	[dateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_RecordDataField] PRIMARY KEY CLUSTERED 
(
	[RecordDataFieldId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO



SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[RecordDataSubField](
	[RecordDataSubFieldsId] [int] NOT NULL,
	[RecordDataFieldId] int not null,
	[subFieldIndicator] [varchar](10) NOT NULL,
	[subFieldValue] [varchar](max) NOT NULL,
	[fieldNumber] [varchar](10) NOT NULL,
	[fieldIndicator] [varchar](10) NULL,
	[Value] [varchar](max) NOT NULL,
	[dateCreated] [datetime] NOT NULL
 CONSTRAINT [PK_RecordDataSubFields] PRIMARY KEY CLUSTERED 
(
	[RecordDataSubFieldsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[RecordDataSubField]  WITH CHECK ADD  CONSTRAINT [FK_RecordDataField_RecordDataFieldId] FOREIGN KEY([RecordDataFieldId])
REFERENCES [dbo].[RecordDataField] ([RecordDataFieldId])
GO

ALTER TABLE [dbo].[RecordDataSubField] CHECK CONSTRAINT [FK_RecordDataField_RecordDataFieldId]
GO