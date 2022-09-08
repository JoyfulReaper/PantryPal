using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PantryPal.Library.Models;
public class Inventory
{
    public int InventoryId { get; set; }
    public int ProductId { get; set; }
    public decimal Price { get; set; }
    public DateTime? ExpirationDate { get; set; }
    public DateTime PurchaseDate { get; set; }
    public DateTime? DateConsumed { get; set; }
    public DateTime DateCreated { get; set; }
    public bool IsWasted { get; set; }
}
