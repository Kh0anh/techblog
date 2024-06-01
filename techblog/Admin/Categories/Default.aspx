<%@ Page Title="Danh mục" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="techblog.Admin.Categories.Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container">
            <h1 class="h3 d-inline">Danh mục</h1>
            <hr />

            <div class="row">
                <div class="col-md-4 mb-3">
                    <asp:Panel ID="FormPanel" runat="server">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" />

                        <div class="form-group">
                            <asp:TextBox ID="CategoryName" runat="server" CssClass="form-control" Placeholder="Name" AutoCompleteType="Disabled"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="CategoryNameValidator" runat="server" ControlToValidate="CategoryName" ErrorMessage="Vui lòng điền tên danh mục." CssClass="text-danger" />
                        </div>

                        <asp:Button ID="AddButton" runat="server" CssClass="btn btn-primary" Text="Add" OnClick="AddButton_Click" />
                    </asp:Panel>
                </div>

                <div class="col-md-8">
                    <div class="table-responsive">
                        <asp:GridView ID="CategoriesGridView" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover">
                            <Columns>
                                <asp:BoundField DataField="CategoryName" HeaderText="Danh mục" />
                                <asp:TemplateField HeaderText="Tuỳ chọn">
                                    <ItemTemplate>
                                        <asp:HyperLink ID="DeleteLink" runat="server" CssClass="text-danger" Text="Delete" NavigateUrl='<%# "/Admin/Categories/Default.aspx?delete=" + Eval("ID") %>'></asp:HyperLink>
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
