CREATE PROCEDURE [dbo].[spProduct_Load]
	@ProductID INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[ProductId]
		,[Name]
		,[Description]
		,[UPC]
		,[TypeId]
		,[DateCreated]
	FROM
		[Product]
	WHERE
		ProductId = @ProductId;

END