CREATE TABLE [dbo].[Notes]
(
	[NoteId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [InventoryId] INT NOT NULL, 
    [Note] NVARCHAR(1000) NOT NULL, 
    [DateCreated] DATETIME2 NOT NULL DEFAULT GETUTCDATE(), 
    [DateDeleted] DATETIME2 NULL, 
    CONSTRAINT [FK_Notes_Inventory] FOREIGN KEY ([InventoryId]) REFERENCES [Inventory]([InventoryId])
)
