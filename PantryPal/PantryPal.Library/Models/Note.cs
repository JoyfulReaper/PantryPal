using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PantryPal.Library.Models;
public class Note
{
    public int NoteId { get; set; }
    public int InventoryId { get; set; }
    public string Body { get; set; } = null!;
    public DateTime DateCreated { get; set; }
    public DateTime? DateDeleted { get; set; }
}
