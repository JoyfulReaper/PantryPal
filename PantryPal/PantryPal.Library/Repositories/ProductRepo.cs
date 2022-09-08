using PantryPal.Library.DataAccess;
using PantryPal.Library.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PantryPal.Library.Repositories;
public class ProductRepo
{
    private readonly IDataAccess _dataAccess;

    public ProductRepo(IDataAccess dataAccess)
    {
        _dataAccess = dataAccess;
    }

    public async Task Save(Product product)
    {
        await _dataAccess.SaveDataAndGetIdAsync("spProduct_Upsert", new
        {
            product.ProductId,
            product.Name,
            product.Description,
            product.UPC,
            product.TypeId
        }, "Data");
    }

    public async Task<Product?> Load(int productId)
    {
        return (await _dataAccess.LoadDataAsync<Product, dynamic>("spProduct_Load", new
        {
            productId,
        }, "Data")).SingleOrDefault();
    }
}
