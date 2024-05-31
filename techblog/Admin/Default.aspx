<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="techblog.Admin._Default" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-xl-3 col-sm-6 mb-3">
                <div class="card text-white bg-primary o-hidden h-100">
                    <div class="card-body">
                        <div class="card-body-icon"><i class="fas fa-fw fa-file"></i></div>
                        <div class="mr-5"><span class="h3 font-weight-lighter"><%= PostCount %></span> Bài đăng</div>
                    </div>
                    <a class="card-footer text-white clearfix small z-1" href="/Admin/Posts">
                        <span class="float-left">Xem thêm</span>
                        <span class="float-right"><i class="fas fa-angle-right"></i></span>
                    </a>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-3">
                <div class="card text-white bg-primary o-hidden h-100">
                    <div class="card-body">
                        <div class="card-body-icon"><i class="fas fa-fw fa-file"></i></div>
                        <div class="mr-5"><span class="h3 font-weight-lighter"><%= CategoryCount %></span> Danh mục</div>
                    </div>
                    <a class="card-footer text-white clearfix small z-1" href="/Admin/Posts">
                        <span class="float-left">Xem thêm</span>
                        <span class="float-right"><i class="fas fa-angle-right"></i></span>
                    </a>
                </div>
            </div>
            <div class="col-xl-3 col-sm-6 mb-3">
                <div class="card text-white bg-primary o-hidden h-100">
                    <div class="card-body">
                        <div class="card-body-icon"><i class="fas fa-fw fa-file"></i></div>
                        <div class="mr-5"><span class="h3 font-weight-lighter"><%= AuthorCount %></span> Tác giả</div>
                    </div>
                    <a class="card-footer text-white clearfix small z-1" href="/Admin/Posts">
                        <span class="float-left">Xem thêm</span>
                        <span class="float-right"><i class="fas fa-angle-right"></i></span>
                    </a>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-xl-6 col-sm-12 mb-3">
                <div class="card">
                    <div class="card-header"><i class="fas fa-paper-plane"></i> Bài đăng gần đây</div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <asp:GridView ID="RecentPostsGrid" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover">
                                <Columns>
                                    <asp:BoundField DataField="Title" HeaderText="Title" />
                                    <asp:TemplateField HeaderText="Categories">
                                        <ItemTemplate>
                                            <asp:Repeater ID="CategoriesRepeater" runat="server" DataSource='<%# Eval("Categories") %>'>
                                                <ItemTemplate>
                                                    <a href="#" target="_blank"><%# Eval("CategoryName") %></a>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="DateTime" HeaderText="Date" DataFormatString="{0:MM/dd/yyyy}" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-6 col-sm-12 mb-3">
                <div class="card">
                    <div class="card-header"><i class="fas fa-plus-circle"></i> Tạo bài đăng</div>
                    <div class="card-body">
                        <asp:Panel ID="NewPostForm" runat="server">
                            <div class="form-group">
                                <label for="title">Tiêu đề</label>
                                <asp:TextBox ID="NewPostTitle" runat="server" CssClass="form-control" Placeholder="Title" required="required" autofocus="autofocus" />
                            </div>
                            <div class="form-group">
                                <label for="category">Danh mục</label>
                                <asp:DropDownList ID="NewPostCategory" runat="server" CssClass="form-control"></asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label for="content">Nội dung</label>
                                <asp:TextBox ID="NewPostContent" runat="server" TextMode="MultiLine" Rows="6" CssClass="form-control"></asp:TextBox>
                            </div>
                            <asp:Button ID="SaveNewPost" runat="server" CssClass="btn btn-primary" Text="Save!" OnClick="SaveNewPostButton_Click" />
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
    <script>
        <%--$(document).ready(function () {
            $('#<%= content.ClientID %>').summernote({
                height: 200
            });
        });--%>
    </script>
</asp:Content>
