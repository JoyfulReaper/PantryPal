CREATE TABLE [dbo].[ProductCategory]
(
	[ProductCategoryId] INT NOT NULL PRIMARY KEY, 
    [ProductId] INT NOT NULL, 
    [CategoryId] INT NOT NULL, 
    CONSTRAINT [FK_ProductCategory_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [Product]([ProductId]), 
    CONSTRAINT [FK_ProductCategory_CategoryId] FOREIGN KEY ([CategoryId]) REFERENCES [Category]([CategoryId])
)
