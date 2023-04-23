SELECT [m].[Id], [m].[Name], [t0].[Id], [t0].[DateCreated], [t0].[IsComplete], [t0].[c]
FROM [dbo].[MainEntity] AS [m]
OUTER APPLY (
    SELECT TOP(1) [t].[Id], [t].[DateCreated], [t].[IsComplete], 1 AS [c]
    FROM (
        SELECT TOP(1) [r].[Id], [r].[DateCreated], [r].[IsComplete]
        FROM [dbo].[RelatedEntity] AS [r]
        WHERE [m].[Id] = [r].[MainEntityId]
        ORDER BY [r].[DateCreated] DESC
    ) AS [t]
    ORDER BY [t].[DateCreated] DESC
) AS [t0]
WHERE [m].[StatusId] = 1