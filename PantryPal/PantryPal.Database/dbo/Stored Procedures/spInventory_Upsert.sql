CREATE PROCEDURE [dbo].[spInventory_Upsert]
	@InventoryId INT,
	@ProductId INT,
	@Price DECIMAL(18,2),
	@ExpirationDate DATETIME2(7),
	@PurchaseDate DATETIME2(7),
	@DateConsumed DATETIME2(7),
    @IsWasted BIT
AS
BEGIN

    BEGIN TRANSACTION;
 
    INSERT dbo.[Inventory]
        ([ProductId],
        [Price],
        [ExpirationDate],
        [PurchaseDate],
        [DateConsumed],
        [IsWasted])
      SELECT 
        @ProductId,
        @Price,
        @ExpirationDate,
        @PurchaseDate,
        @DateConsumed,
        @IsWasted
      WHERE NOT EXISTS
      (
        SELECT 1 FROM dbo.[Inventory] WITH (UPDLOCK, SERIALIZABLE)
          WHERE [InventoryId] = @InventoryId
      );
 
    IF @@ROWCOUNT = 0
    BEGIN
      UPDATE dbo.[Inventory] 
      SET
        [ProductId] = @ProductId,
        [Price] = @Price,
        [ExpirationDate] = @ExpirationDate,
        [PurchaseDate] = @PurchaseDate,
        [DateConsumed] = @DateConsumed,
        [IsWasted] = @IsWasted
      WHERE 
        [InventoryId] = @InventoryId;
    END
    ELSE
    BEGIN
        SET @InventoryId = SCOPE_IDENTITY();
    END
 
    COMMIT TRANSACTION;

    SELECT @InventoryId;

END