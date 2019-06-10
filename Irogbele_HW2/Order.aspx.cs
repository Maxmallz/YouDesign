using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//Irogbele Maximillian
//700683918
//Homework 2
namespace Irogbele_HW2
{
    public partial class Order : System.Web.UI.Page {

        int quantityCount = 0;
        List<OrderObject> orders = null;
        OrderObject order = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            //check for cookies and set welcome message accordingly
            lblCart.Text = "";
            HttpCookie cookie = Request.Cookies["Irogbele"];
            if (cookie == null) { lblWelcome.Text = "Welcome New User.   "; }
            else { lblWelcome.Text = "Welcome " + cookie.Value.ToString() + "   "; }

            //retrieve the current count of items in cart if any using ViewState
            if (ViewState["CartItem"] != null)
            {
                quantityCount = (int)ViewState["CartItem"];
            }

            //retrieve all orders (item, custom-text and quantity) in the cart if any
            if (ViewState["CartOrder"] == null)
            {
                orders = new List<OrderObject>();
            }
            else
            {
                orders = (List<OrderObject>)ViewState["CartOrder"];
            }
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            //store the total items and orders in the cart
            ViewState["CartItem"] = quantityCount;
            ViewState["CartOrder"] = orders;
        }
        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            try
            {
                //create order object (item, price, quantity and cost) and add to cart
                order = new OrderObject();
                order.Item = ddlItem.SelectedItem.Text;
                order.Quantity = int.Parse(txtQuantity.Text);
                order.Price = double.Parse(ddlItem.SelectedItem.Value);
                order.Cost = order.Price * order.Quantity;
                orders.Add(order);

                quantityCount += order.Quantity;
                //display current item added and the total items in the cart
                lblCart.Text = "added " + order.Quantity.ToString() + " items. Total items in cart [" + quantityCount + "]";
                reset_fields();
            }
            catch (Exception)
            {
                string url = "errorPage.aspx?";
                url += Server.UrlEncode("errMsg=an error has occured during processing");
                Response.Redirect(url);
            }
        }
        private void reset_fields()
        {
            ddlItem.SelectedIndex = -1;
            txtCustom.Text = "";
            txtQuantity.Text = "";
        }
        protected void btnPayment_Click(object sender, EventArgs e)
        {
            //ensure cart is not empty then enable payment panel
            if (quantityCount < 1)
            {
                lblCart.Text = "no items in cart";
                return;
            }
            pnlOrder.Enabled = false;
            pnlPayment.Enabled = true;
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string phone = txtPhone.Text;
            string creditCard = txtCreditCard.Text;
            double totalCost = 0;
                //create session is non exists and add each all orders to the session object
                foreach (OrderObject order in (List<OrderObject>)ViewState["CartOrder"])
                {
                    if (Session["Transactions"] == null)
                    {
                        Session["Transactions"] = new List<OrderObject>();
                        ((List<OrderObject>)Session["Transactions"]).Add(order);
                    }
                    else
                    {
                        ((List<OrderObject>)Session["Transactions"]).Add(order);
                    }

                    //process payment.
                    totalCost += order.Cost;
                }
                //get customer name assosiated with current payment
                if (Session["Customers"] == null)
                {
                    Session["Customers"] = new List<String>();
                }
                if (Session["Customers"] != null)
                {
                    ((List<String>)Session["Customers"]).Add(name);
                }
                //create cookie and store customer name
                if (Request.Cookies["Irogbele"] == null)
                {
                    HttpCookie cookie = new HttpCookie("Irogbele", name);
                    cookie.Expires = DateTime.Now.AddHours(1); //1 hour cookie lifetime
                    Response.SetCookie(cookie);
                }
                //redirect to confirmation page using query string
                string url = "Confirmation.aspx?";
                url += "name=" + Server.UrlEncode(name) + "&";
                url += "phone=" + phone + "&";
                url += "totalCost=" + Server.UrlEncode(totalCost.ToString("C2"));
                Response.Redirect(url);
        }
    }
}