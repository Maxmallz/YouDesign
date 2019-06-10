using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Irogbele_HW2
{
    [Serializable]
    public class OrderObject
    {
        string item;
        int quantity;
        double price;
        double cost;

        public string Item { get => item; set => item = value; }
        public int Quantity { get => quantity; set => quantity = value; }
        public double Price { get => price; set => price = value; }
        public double Cost { get => cost; set => cost = value; }
    }
}