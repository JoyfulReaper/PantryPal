using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PantryPal.Library.Models;
public class Product
{
    public int ProductId { get; set; }
    public string Name { get; set; } = null!;
    public string? Description { get; set; }
    public string UPC { get; set; } = null!;
    public int TypeId { get; set; }
    public DateTime DateCreated { get; set; }
}
