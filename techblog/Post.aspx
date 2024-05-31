<%@ Page Title="Trang chủ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Post.aspx.cs" Inherits="techblog._Post" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="row">
        <% if (Entry != null)
           { %>
        <div class="col-lg-8">
            <h1 class="mt-4"><%:Entry.Title %></h1>
            <p class="lead">bởi <a class="badge badge-pill bg-primary text-white" href="Search.aspx?Author=<%:Entry.Author.ID%>"><%:Entry.Author.Author %></a></p>

            <hr>
            <p>
                <% foreach (var category in Entry.Categories)
                   { %>
                <a class="badge badge-pill bg-secondary" href="Search.aspx?category=<%:category.ID%>"><%:category.CategoryName%></a>
                <% } %>
            Đăng vào <%:Entry.DateTime.ToLongDateString() %> lúc <%:Entry.DateTime.ToShortTimeString() %>
            </p>

            <hr>
            <%:Entry.Content %>

            <hr>

            <%-- @if (Model.CommentStatus)
        {
            @Html.Raw(ViewData["CommentSystemCode"])
        }--%>
            <%}
           else
           {%>
            <h1 class="mt-4">404</h1>
            <%} %>
        </div>
        <%-- @Html.Partial("Partials/Sidebar")--%>
    </div>
</asp:Content>
