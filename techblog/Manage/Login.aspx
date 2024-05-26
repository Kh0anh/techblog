<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="techblog.Manage.Login" %>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Đăng nhập tài khoản quản trị</h2>
    <ol>
        <li>
            <asp:Label runat="server" AssociatedControlID="UserName">Tài khoản</asp:Label>
            <asp:TextBox ID="UserName" runat="server" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" CssClass="field-validation-error" ErrorMessage="Vui lòng nhập tài khoản." />
        </li>
        <li>
            <asp:Label runat="server" AssociatedControlID="Password">Mật khẩu</asp:Label>
            <asp:TextBox ID="Password" runat="server" TextMode="Password" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="field-validation-error" ErrorMessage="Vui lòng nhập mật khẩu." />
        </li>
    </ol>
    <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" OnClick="btnLogin_Click" />
    <br />
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
</asp:Content>
