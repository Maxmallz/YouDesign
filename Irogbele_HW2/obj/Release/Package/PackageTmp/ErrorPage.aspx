<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="Irogbele_HW2.ErrorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>YouDesign | Error</title>
    <link rel="stylesheet" href="MainStyle.css" />
</head>

<body>
    <form id="confirmationForm" runat="server" class="form">
        <asp:Image ID="imgMainImage" runat="server" Height="101px" ImageUrl="logo.jpg" Width="797px" />
        <asp:LinkButton ID="lbtnHome" runat="server" PostBackUrl="~/Order.aspx" Height="20px" Width="60px" CssClass="navlink" >Home</asp:LinkButton>
        <div class="container">
        <br />
        <br />
                <asp:Label ID="lblError" runat="server" ForeColor="#FF3300"></asp:Label>
        <br />
        </div>
        <br />
        <br />
    </form>
</body>
</html>
