<%@ Page Title="Trang chủ" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Post.aspx.cs" Inherits="techblog._Post" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-8">
            <h1 class="mt-4"><%= PostData.Title %></h1>
            <p class="lead">đăng bởi <span class="badge badge-pill bg-primary text-white">
                <asp:HyperLink ID="AuthorLink" runat="server" CssClass="text-white"><%:PostData.Author.Author %></asp:HyperLink>
            </span></p>

            <hr>

            <p>
                <asp:Repeater ID="CategoriesRepeater" runat="server">
                    <ItemTemplate>
                        <span class="badge badge-pill bg-secondary">
                            <asp:HyperLink ID="CategoryLink" runat="server" CssClass="text-white"></asp:HyperLink>
                        </span>
                    </ItemTemplate>
                </asp:Repeater>
                Đăng ngày <%= PostData.DateTime.ToLongDateString() %> lúc <%= PostData.DateTime.ToShortTimeString() %>
            </p>

            <hr>

            <div>
                <%=PostData.Content %>
            </div>

            <hr>

            <asp:PlaceHolder ID="CommentSystemPlaceholder" runat="server" Visible="false"></asp:PlaceHolder>

        </div>

        <%--<uc:Sidebar ID="Sidebar" runat="server" />--%>
    </div>
</asp:Content>