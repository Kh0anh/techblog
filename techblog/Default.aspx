<%@ Page Title="Trang chủ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="techblog._Default" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="col-md-8">
        <%  int counter = 0;
            for (int i = EntryList.CurrentPage; i < EntryList.PageCount; i++)
            {
                if (counter == 10)
                {
                    break;
                }
                var Post = EntryList.Posts[i];%>
        <div class="card mb-4">
            <div class="card-body">
                <h2 class="card-title"><%:Post.Title%></h2>
                <%--  <p class="card-text"><%:(Post.Content.Length > 200 ? Post.Content.Substring(0, 200) : Post.Content)%></p>--%>
                <a href="Post.aspx?id=<%:Post.ID%>" class="btn btn-primary">Đọc thêm &rarr;</a>
            </div>
            <div class="card-footer text-muted">
                <% foreach (var category in Post.Categories)
                   {%>
                <a class="badge badge-pill bg-secondary" style="color: white" href="Search.aspx?category=<%:category.ID%>"><%:category.CategoryName%></a>
                <% } %>
                    Đăng ngày <span class="badge badge-pill bg-success text-white"><%:Post.DateTime.ToLongDateString()%></span> bởi <a class="badge badge-pill bg-primary text-white" href="Search.aspx?Author=<%:Post.Author.ID%>"><%:Post.Author.Author%></a>
            </div>
        </div>
        <% } %>

        <% if (EntryList.PageCount > 10)
           { %>

        <ul class="pagination justify-content-center mb-4">
            <li class="page-item"><a class="page-link" href="Default.aspx?start=0">&larr; Đầu</a></li>
            <%
               if (EntryList.CurrentPage != 0)
               { %>
            <li class="page-item"><a class="page-link" href="Default.aspx?start=<%=EntryList.PageCount-10 %>">Lùi</a></li>
            <%} %>
              <%
               if (EntryList.CurrentPage != EntryList.PageCount - (EntryList.PageCount % 10))
               { %>
            <li class="page-item"><a class="page-link" href="Default.aspx?start=<%=EntryList.PageCount+10 %>">Tiếp</a></li>
            <%} %>
            <li class="page-item"><a class="page-link" href="Default.aspx?start=<%:EntryList.PageCount-(EntryList.PageCount%10) %>">Cuối &rarr;</a></li>
        </ul>
        <%} %>
    </div>
</asp:Content>
