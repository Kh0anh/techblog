<%@ Page Title="Bài đăng" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="techblog.Admin.Posts.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <div class="container">
            <a href="/Admin/Posts/Create.aspx" class="btn btn-primary align-top btn-sm"><i class="fa fa-list"></i>Thêm bài</a>

            <hr />

            <div class="row mb-3">
                <div class="col-12">
                    <div class="table-responsive">
                        <asp:GridView ID="PostsGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover">
                            <Columns>
                                <asp:BoundField DataField="Title" HeaderText="Tiêu đề" />
                                <asp:BoundField DataField="Status" HeaderText="Trạng thái" />
                                <asp:BoundField DataField="DateTime" HeaderText="Ngày đăng" DataFormatString="{0:MM/dd/yyyy}" />
                                <asp:TemplateField HeaderText="Categories">
                                    <ItemTemplate>
                                        <asp:Repeater ID="CategoriesRepeater" runat="server" DataSource='<%# Eval("Categories") %>'>
                                            <ItemTemplate>
                                                <a href="#" target="_blank"><%# Eval("CategoryName") + ", " %></a>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Tuỳ chọn">
                                    <ItemTemplate>
                                    <a href="/Admin/Posts/Default.aspx?delete=<%# Eval("ID") %>" class="text-danger">Delete</a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>
