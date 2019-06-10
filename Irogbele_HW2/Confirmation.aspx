<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirmation.aspx.cs" Inherits="Irogbele_HW2.Confirmation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>YouDesign | Confirmation</title>
    <link rel="stylesheet" href="MainStyle.css" />
</head>
<body>
    <form id="confirmationForm" runat="server" class="form">
        <asp:Image ID="imgMainImage" runat="server" Height="101px" ImageUrl="logo.jpg" Width="797px" />
        <asp:LinkButton ID="lbtnHome" runat="server" PostBackUrl="~/Order.aspx" Height="20px" Width="60px" CssClass="navlink" >Home</asp:LinkButton>
        <div class="container">
                <asp:Label ID="Label1" runat="server" Text="Order Summary" Font-Bold="True" Font-Size="X-Large"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblName" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblPhone" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblTotalCharge" runat="server"></asp:Label>
        <br />
        </div>
        <br />
        <br />
    </form>
</body>
</html>
