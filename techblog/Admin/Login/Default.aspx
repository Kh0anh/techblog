<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="techblog.Admin.Login.Default" %>

<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <div class="card card-login mx-auto mt-5">
            <div class="card-header">Đăng nhập</div>
            <div class="card-body">
                <div class="form-group">
                    <div class="form-label-group">
                        <asp:TextBox ID="Email" runat="server" CssClass="form-control" placeholder="Email"></asp:TextBox>
                        <asp:Label ID="Label1" runat="server" AssociatedControlID="Email" Text="Email"></asp:Label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="form-label-group">
                        <asp:TextBox ID="Password" runat="server" CssClass="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
                        <asp:Label ID="textPassword" runat="server" AssociatedControlID="Password" Text="Mật khẩu"></asp:Label>
                    </div>
                </div>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" />
                <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary btn-block" Text="Đăng nhập" OnClick="LoginButton_Click"/>
            </div>
        </div>
    </form>
</asp:Content>
