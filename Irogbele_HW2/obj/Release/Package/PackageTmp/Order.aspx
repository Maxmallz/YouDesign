<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="Irogbele_HW2.Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>YouDesign | Home</title>
    <style type="text/css">
        .auto-style3 {
            width: 214px;
        }
        .auto-style7 {
            width: 443px;
        }
        .auto-style8 {
            width: 449px;
        }
        .auto-style10 {
            width: 97%;
        }
        .auto-style11 {
            width: 194px;
        }
        </style>
    <link rel="stylesheet" href="MainStyle.css" />
</head>
<body>
    <form id="orderForm" runat="server" class="form">
        <asp:Image ID="imgMainImage" runat="server" Height="101px" ImageUrl="logo.jpg" Width="797px"/>
        <div class="container">
            <asp:LinkButton ID="lbtnHome" runat="server" PostBackUrl="~/Order.aspx" Height="20px" Width="60px" CssClass="navlink" >Home</asp:LinkButton>
            <span>&nbsp</span>
        <asp:LinkButton ID="lbtnAdmin" runat="server" PostBackUrl="~/Admin.aspx" Height="20px" Width="60px" CssClass="navlink" >Admin</asp:LinkButton>
        <asp:Label ID="lblWelcome" runat="server"></asp:Label>
        <br />
            
        <br />
        <asp:Panel ID="pnlOrder" runat="server" Height="357px" Width="713px">
            <div id="order-panel">
                <asp:Label ID="Label1" runat="server" Text="Order" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                <br />
                <table class="auto-style10" id="orderTable" style="border: thin solid #000000;">
                    <tr>
                        <td class="auto-style11">&nbsp;</td>
                        <td class="auto-style8">
                            <asp:Label ID="lblCart" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">Select Item:</td>
                        <td class="auto-style8">
                            <asp:RequiredFieldValidator ID="rfvItem" runat="server" ControlToValidate="ddlItem" Display="Dynamic" ForeColor="Red" InitialValue="-1" SetFocusOnError="True" ValidationGroup="vgpOrder" ViewStateMode="Enabled">item required</asp:RequiredFieldValidator>
                            <br />
                            <asp:DropDownList ID="ddlItem" runat="server" Height="16px" Width="193px">
                                <asp:ListItem Value="-1">select item</asp:ListItem>
                                <asp:ListItem Value="14">Pen</asp:ListItem>
                                <asp:ListItem Value="12">Mouse Pad</asp:ListItem>
                                <asp:ListItem Value="20">Picture Frame</asp:ListItem>
                                <asp:ListItem Value="16">Mug</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">Enter Custom Text:</td>
                        <td class="auto-style8">
                            <asp:RequiredFieldValidator ID="rfvCustom" runat="server" ControlToValidate="txtCustom" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="vgpOrder">custom text required</asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="txtCustom" runat="server" Height="59px" TextMode="MultiLine" Width="190px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">Enter Quantity:</td>
                        <td class="auto-style8">
                            <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" ControlToValidate="txtQuantity" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="vgpOrder">quantity required</asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="rgvQuantity" runat="server" ControlToValidate="txtQuantity" Display="Dynamic" ForeColor="Red" MaximumValue="99" MinimumValue="1" SetFocusOnError="True" Type="Integer" ValidationGroup="vgpOrder">quantity must be between 1 and 99</asp:RangeValidator>
                            <br />
                            <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">&nbsp;</td>
                        <td class="auto-style8">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style11">&nbsp;</td>
                        <td class="auto-style8">
                            <asp:Button ID="btnAddToCart" runat="server" OnClick="btnAddToCart_Click" Text="Add to Order" ValidationGroup="vgpOrder" CssClass="order-button" Width="171px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style11">&nbsp;</td>
                        <td class="auto-style8">
                            <asp:Button ID="btnPayment" runat="server" OnClick="btnPayment_Click" Text="Continue To Payment" CssClass="order-button" Width="171px" />
                            <br />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        <br />
        <asp:Panel ID="pnlPayment" runat="server" Enabled="False" Width="711px">
            <div>
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="X-Large" Text="Payment"></asp:Label>
                <br />
                <table class="auto-style10" style="border: thin solid #000000">
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="Label2" runat="server" Text="Enter Name"></asp:Label>
                        </td>
                        <td class="auto-style7">
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="vlgPayment">name required</asp:RequiredFieldValidator>
                            <br />
                            <asp:TextBox ID="txtName" runat="server" Width="261px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">&nbsp;</td>
                        <td class="auto-style7">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="Label3" runat="server" Text="Phone:(xxx-xxx-xxxx)"></asp:Label>
                        </td>
                        <td class="auto-style7">
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="vlgPayment">phone number required</asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="rxvPhone" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ValidationGroup="vlgPayment">enter valid phone format</asp:RegularExpressionValidator>
                            <br />
                            <asp:TextBox ID="txtPhone" runat="server" ToolTip="(XXX-XXX-XXXX)" Width="257px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">&nbsp;</td>
                        <td class="auto-style7">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="Label4" runat="server" Text="Credit Card No."></asp:Label>
                        </td>
                        <td class="auto-style7">
                            <asp:RequiredFieldValidator ID="rfvCreditCard" runat="server" ControlToValidate="txtCreditCard" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationGroup="vlgPayment">credit card required</asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="rxvCreditCard" runat="server" ControlToValidate="txtCreditCard" ErrorMessage="RegularExpressionValidator" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\d{16}" ValidationGroup="vlgPayment">credit card should be 16 digits with no special characters</asp:RegularExpressionValidator>
                            <br />
                            <asp:TextBox ID="txtCreditCard" runat="server" ToolTip="1234-5678-9012-3456" Width="260px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">&nbsp;</td>
                        <td class="auto-style7">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style3">&nbsp;</td>
                        <td class="auto-style7">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit Order" ValidationGroup="vlgPayment" OnClick="btnSubmit_Click" CssClass="order-button" />
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>
        </div>
        <br />
        <br />
    </form>
</body>
</html>
