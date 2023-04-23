SELECT [m].[Id], [m].[Name], [t0].[Id], [t0].[DateCreated], [t0].[IsComplete], [t0].[c]
FROM [dbo].[MainEntity] AS [m]
LEFT JOIN (
    SELECT [t].[Id], [t].[DateCreated], [t].[IsComplete], [t].[c], [t].[MainEntityId]
    FROM (
        SELECT [r].[Id], [r].[DateCreated], [r].[IsComplete], 1 AS [c], [r].[MainEntityId], ROW_NUMBER() OVER(PARTITION BY [r].[MainEntityId] ORDER BY [r].[DateCreated] DESC) AS [row]
        FROM [dbo].[RelatedEntity] AS [r]
    ) AS [t]
    WHERE [t].[row] <= 1
) AS [t0] ON [m].[Id] = [t0].[MainEntityId]
WHERE [m].[StatusId] = 1