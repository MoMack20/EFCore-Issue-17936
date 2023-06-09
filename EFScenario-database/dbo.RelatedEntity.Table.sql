USE [EFScenario]
GO
/****** Object:  Table [dbo].[RelatedEntity]    Script Date: 4/23/2023 3:35:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelatedEntity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MainEntityId] [int] NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[DateCreated] [datetimeoffset](7) NOT NULL,
	[IsComplete] [bit] NOT NULL,
 CONSTRAINT [PK_RelatedEntity_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_RelatedEntity_DateCreated]    Script Date: 4/23/2023 3:35:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_RelatedEntity_DateCreated] ON [dbo].[RelatedEntity]
(
	[DateCreated] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RelatedEntity_IsComplete]    Script Date: 4/23/2023 3:35:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_RelatedEntity_IsComplete] ON [dbo].[RelatedEntity]
(
	[IsComplete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RelatedEntity_MainEntityId]    Script Date: 4/23/2023 3:35:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_RelatedEntity_MainEntityId] ON [dbo].[RelatedEntity]
(
	[MainEntityId] ASC
)
INCLUDE([Name],[DateCreated],[IsComplete]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RelatedEntity_Name]    Script Date: 4/23/2023 3:35:31 PM ******/
CREATE NONCLUSTERED INDEX [IX_RelatedEntity_Name] ON [dbo].[RelatedEntity]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RelatedEntity] ADD  CONSTRAINT [DF_RelatedEntity_IsComplete]  DEFAULT ((0)) FOR [IsComplete]
GO
ALTER TABLE [dbo].[RelatedEntity]  WITH CHECK ADD  CONSTRAINT [FK_RelatedEntity_MainEntity_MainEntityId] FOREIGN KEY([MainEntityId])
REFERENCES [dbo].[MainEntity] ([Id])
GO
ALTER TABLE [dbo].[RelatedEntity] CHECK CONSTRAINT [FK_RelatedEntity_MainEntity_MainEntityId]
GO
