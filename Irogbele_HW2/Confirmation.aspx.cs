using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Irogbele_HW2
{
    public partial class Confirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //retrieve query strings and display
            lblName.Text = Request.QueryString["name"];
            lblPhone.Text = Request.QueryString["phone"];
            lblTotalCharge.Text = Request.QueryString["totalCost"];
        }
    }
}