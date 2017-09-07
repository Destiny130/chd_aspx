using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Management_EditForum : BasePage
{
    myCHDEntities1 myEntities = new myCHDEntities1();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // The return type can be changed to IEnumerable, however to support
    // paging and sorting, the following parameters must be added:
    //     int maximumRows
    //     int startRowIndex
    //     out int totalRowCount
    //     string sortByExpression
    public IQueryable EditForumListView_GetData()
    {
        return myEntities.Fora;
    }

    // The id parameter name should match the DataKeyNames value set on the control
    public void EditForumListView_UpdateItem(int id)
    {
        Forum item = myEntities.Fora.Where(f => f.Id == id).Single();
        // Load the item here, e.g. item = MyDataLayer.Find(id);
        if (item == null)
        {
            // The item wasn't found
            ModelState.AddModelError("", String.Format("Item with id {0} was not found", id));
            return;
        }
        TryUpdateModel(item);
        if (ModelState.IsValid)
        {
            // Save changes here, e.g. MyDataLayer.SaveChanges();
            myEntities.SaveChanges();
        }
    }
}