using PantryPal.Library.DataAccess;
using PantryPal.Library.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PantryPal.Library.Repositories;
public class InventoryRepo
{
    private readonly IDataAccess _dataAccess;

    public InventoryRepo(IDataAccess dataAccess)
    {
        _dataAccess = dataAccess;
    }

    public async Task Save(Inventory inventory)
    {
        await _dataAccess.SaveDataAsync("spInventory_Upsert", new
        {
        }, "Data");

    }

    public async Task<Inventory?> Load(int inventoryId)
    {
        return (await _dataAccess.LoadDataAsync<Inventory, dynamic>("spInventory_Load", new { 
            inventoryId }, "Data")).SingleOrDefault();
    }
}
