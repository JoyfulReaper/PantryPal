using PantryPal.Library.DataAccess;
using PantryPal.Library.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PantryPal.Library.Repositories;
public class CategoryRepo
{
	private readonly IDataAccess _dataAccess;

	public CategoryRepo(IDataAccess dataAccess)
	{
		_dataAccess = dataAccess;
	}

	public async Task Save(Category category)
	{
		await _dataAccess.SaveDataAndGetIdAsync("spCategory_Upsert", new
		{
			category.CategoryId,
			category.Name
		}, "Data");
	}

	public async Task<Category?> Load(int categoryId)
	{
		return (await _dataAccess.LoadDataAsync<Category, dynamic>("spCategory_Load", new
		{
			categoryId
		}, "Data")).SingleOrDefault();
	}

	public async Task Delete(int categoryId)
	{
		await _dataAccess.SaveDataAsync("spCategory_Delete", new
		{
			categoryId
		}, "Date");
	}
}
