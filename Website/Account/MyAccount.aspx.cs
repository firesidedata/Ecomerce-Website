using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Web.Security;
public partial class Account_Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
		Session["UserID"] = User.Identity.GetUserName();
		FormView1.ChangeMode(FormViewMode.Edit);		
	}

}