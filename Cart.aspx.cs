﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Foodie.Admin;
using System.Diagnostics.PerformanceData;

namespace Foodie.User
{
    public partial class Cart : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        decimal grandTotal = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            getCartItems();
        }

        void getCartItems()
        {
            con = new SqlConnection(Connection.GetConnectionString());
            cmd = new SqlCommand("Cart_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.Parameters.AddWithValue("@UserId", Session["userId"]);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rCartItem.DataSource= dt;
            if (dt.Rows.Count > 0)
            {
                rCartItem.FooterTemplate = null;
                rCartItem.FooterTemplate = new CustomTemplete(ListItemType.Footer);
            }
            rCartItem.DataBind();
        }

        protected void rCartItem_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            
        }

        protected void rCartItem_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }

        private sealed class CustomTemplete : ITemplate
        {
            private ListItemType ListItemType { get; set; }

            public CustomTemplete(ListItemType type) 
            {
                ListItemType = type;
            }
            public void InstantiateIn(Control container)
            {
                if(ListItemType == ListItemType.Footer)
                {
                    var footer = new LiteralControl("<tr><td colspan='5'><b>Your Cart is empty.</b><a href='Menu.aspx' class='badge badge-info ml-2'>Continue Shopping</a></td></tr></tbody></table>");
                    container.Controls.Add(footer);
                }
            }
        }
    }
}