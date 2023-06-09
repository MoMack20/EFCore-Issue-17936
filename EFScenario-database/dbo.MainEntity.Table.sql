USE [EFScenario]
GO
/****** Object:  Table [dbo].[MainEntity]    Script Date: 4/23/2023 3:35:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MainEntity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[StatusId] [int] NOT NULL,
	[DateCreated] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_MainEntity_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_MainEntity_Name]    Script Date: 4/23/2023 3:35:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_MainEntity_Name] ON [dbo].[MainEntity]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_MainEntity_StatusId]    Script Date: 4/23/2023 3:35:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_MainEntity_StatusId] ON [dbo].[MainEntity]
(
	[StatusId] ASC
)
INCLUDE([Name],[DateCreated]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MainEntity]  WITH CHECK ADD  CONSTRAINT [FK_MainEntity_MainEntityStatus_StatusId] FOREIGN KEY([StatusId])
REFERENCES [dbo].[MainEntityStatus] ([Id])
GO
ALTER TABLE [dbo].[MainEntity] CHECK CONSTRAINT [FK_MainEntity_MainEntityStatus_StatusId]
GO
