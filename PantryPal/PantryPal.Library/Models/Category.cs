using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PantryPal.Library.Models;
public class Category
{
    public int CategoryId { get; set; }
    public string Name { get; set; } = null!;
    public DateTime DateCreated { get; set; }
    public DateTime? DateDeleted { get; set; }
}
