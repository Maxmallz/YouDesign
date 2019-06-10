using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Irogbele_HW2
{
    public partial class Admin : System.Web.UI.Page
    {
        List<OrderObject> orders = null;
        private int penCount = 0;
        private int mugCount = 0;
        private int mousePadCount = 0;
        private int pictureFrameCount = 0;
        private int totalCount = 0;

        private double penCost = 0;
        private double mugCost = 0;
        private double mousePadCost = 0;
        private double pictureFrameCost = 0;
        private double totalCost = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            //process total-cost and total-count of all orders within the session
            if (Session["Transactions"] != null)
            {
                orders = (List<OrderObject>)Session["Transactions"];
                foreach (OrderObject order in orders)
                {
                    if (order.Item.Equals("Pen", StringComparison.OrdinalIgnoreCase))//Pen
                    {
                        penCost += order.Cost;
                        penCount += order.Quantity;
                    }
                    else if (order.Item.Equals("Mouse Pad", StringComparison.OrdinalIgnoreCase))//Mouse Pad
                    {
                        mousePadCost += order.Cost;
                        mousePadCount += order.Quantity;
                    }
                    else if (order.Item.Equals("Picture Frame", StringComparison.OrdinalIgnoreCase))//Picture Frame
                    {
                        pictureFrameCost += order.Cost;
                        pictureFrameCount += order.Quantity;
                    }
                    else if (order.Item.Equals("Mug", StringComparison.OrdinalIgnoreCase))//Mug
                    {
                        mugCost += order.Cost;
                        mugCount += order.Quantity;
                    }
                    totalCost += order.Cost;
                    totalCount += order.Quantity;
                }
            }
            lblPenCost.Text = penCost.ToString("C2");
            lblPenCount.Text = penCount.ToString();
            lblMugCost.Text = mugCost.ToString("C2");
            lblMugCount.Text = mugCount.ToString();
            lblPictureFrameCost.Text = pictureFrameCost.ToString("C2");
            lblPictureFrameCount.Text = pictureFrameCount.ToString();
            lblMousePadCost.Text = mousePadCost.ToString("C2");
            lblMousePadCount.Text = mousePadCount.ToString();
            lblTotalCost.Text = totalCost.ToString("C2");
            lblTotalCount.Text = totalCount.ToString();

            //retrieve all customers who have processed a payment within session
            if (Session["Customers"]!= null)
            {
                foreach (string customer in (List<String>)Session["Customers"])
                {
                    lbxCustomers.Items.Add(customer);
                }
            }
        }
    }
}