using PantryPal.Library.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PantryPal.Library.Repositories;
public class Product
{
	private readonly IDataAccess _dataAccess;

	public Product(IDataAccess dataAccess)
	{
		_dataAccess = dataAccess;
	}

	public async Task Save(Product product)
	{
		await _dataAccess.SaveDataAndGetIdAsync("spProduct_Save", new {}, "Data");
	}
}
