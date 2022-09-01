CREATE TABLE [dbo].[Inventory]
(
	[InventoryId] INT NOT NULL PRIMARY KEY IDENTITY, 
    [ProductId] INT NOT NULL, 
    [Price] DECIMAL(18, 2) NOT NULL, 
    [ExpirationDate] DATETIME2 NULL, 
    [PurchaseDate] DATETIME2 NOT NULL, 
    [DateConsumed] DATETIME2 NULL, 
    [DateCreated] DATETIME2 NOT NULL, 
    [IsWasted] BIT NOT NULL DEFAULT 0, 
    CONSTRAINT [FK_Inventory_Product] FOREIGN KEY ([ProductId]) REFERENCES [Product]([ProductId])
)
