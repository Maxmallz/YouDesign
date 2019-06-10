<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Irogbele_HW2.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>YouDesign | Admin</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 257px;
        }
        .auto-style3 {
            width: 236px;
        }
        .auto-style4 {
            font-weight: bold;
            font-size: x-large;
        }
        .auto-style5 {
            width: 257px;
            height: 27px;
        }
        .auto-style6 {
            width: 236px;
            height: 27px;
        }
        .auto-style7 {
            height: 27px;
        }
    </style>
    <link rel="stylesheet" href="MainStyle.css" />
</head>
<body>
    <form id="adminForm" runat="server" class="form">
        <header>
        <asp:Image ID="imgMainImage" runat="server" Height="101px" ImageUrl="logo.jpg" Width="797px"/>
        </header>
        <div class="container">
        <asp:LinkButton ID="lbtnHome" runat="server" Height="20px" PostBackUrl="~/Order.aspx" Width="60px" CssClass="navlink">Home</asp:LinkButton>
        <br />
        <span class="auto-style4">Total Revenue</span><br />
        <br />
        <table class="auto-style1" style="border: thin solid #000000">
            <tr>
                <td class="auto-style2">Item</td>
                <td class="auto-style3">Total Order</td>
                <td>Count</td>
            </tr>
            <tr>
                <td class="auto-style2">Pen</td>
                <td class="auto-style3">
                    <asp:Label ID="lblPenCost" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblPenCount" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Mouse Pad</td>
                <td class="auto-style3">
                    <asp:Label ID="lblMousePadCost" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblMousePadCount" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Picture Frame</td>
                <td class="auto-style3">
                    <asp:Label ID="lblPictureFrameCost" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblPictureFrameCount" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Mug</td>
                <td class="auto-style6">
                    <asp:Label ID="lblMugCost" runat="server"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="lblMugCount" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="border-style: solid none none none; border-width: thin; border-color: #000000">Total:</td>
                <td class="auto-style3" style="border-style: solid none none none; border-width: thin; border-color: #000000">
                    <asp:Label ID="lblTotalCost" runat="server"></asp:Label>
                </td>
                <td style="border-style: solid none none none; border-width: thin; border-color: #000000">
                    <asp:Label ID="lblTotalCount" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
        <p class="auto-style4">
            Active Sessions</p>
        <asp:ListBox ID="lbxCustomers" runat="server" Height="82px" Width="424px"></asp:ListBox>
            </div>
        <br />
        <br />
    </form>
</body>
</html>
