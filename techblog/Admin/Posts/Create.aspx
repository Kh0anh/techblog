<%@ Page Title="Tạo bài đăng" Language="C#" MasterPageFile="~/Admin/Site.Master" AutoEventWireup="true" CodeBehind="Create.aspx.cs" Inherits="techblog.Admin.Posts.Create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container">
            <hr />
            <asp:PlaceHolder ID="FormPlaceHolder" runat="server">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="text-danger" />

                        <div class="row">
                            <div class="col-lg-9 col-md-12 mb-3">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="form-group">
                                            <asp:TextBox ID="TitleTextBox" runat="server" CssClass="form-control" placeholder="Tiêu đề"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="TitleValidator" runat="server" ControlToValidate="TitleTextBox" ErrorMessage="Vui lòng điền tiêu đề." CssClass="text-danger" />
                                        </div>
                                        <div class="form-group">
                                            <asp:HiddenField ID="PostContent" runat="server" />
                                            <textarea id="ContentTextArea" class="form-control" runat="server"></textarea>
                                            <asp:RequiredFieldValidator ID="ContentValidator" runat="server" ControlToValidate="ContentTextArea" ErrorMessage="Content is required." CssClass="text-danger" OnServerValidate="ContentValidator_ServerValidate"/>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-3 col-md-12 mb-3">
                                <div class="card">
                                    <div class="card-header">Cài đặt</div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <asp:Label ID="StatusLabel" runat="server" Text="Tuỳ chỉnh"></asp:Label>
                                            <asp:DropDownList ID="StatusDropDownList" runat="server" CssClass="form-control">
                                                <asp:ListItem Text="Công khai" Value="Published"></asp:ListItem>
                                                <asp:ListItem Text="Nháp" Value="Draft"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="StatusValidator" runat="server" ControlToValidate="StatusDropDownList" InitialValue="" ErrorMessage="Status is required." CssClass="text-danger" />
                                        </div>
                                    </div>
                                    <div class="card-footer text-right">
                                        <asp:Button ID="PublishButton" runat="server" CssClass="btn btn-primary btn-block" Text="Đăng" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:PlaceHolder>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
        <script>
            $('#<%= ContentTextArea.ClientID %>').summernote({
                tabsize: 2,
                height: 600,
                toolbar: [
                  ['style', ['style']],
                  ['font', ['bold', 'underline', 'clear']],
                  ['color', ['color']],
                  ['para', ['ul', 'ol', 'paragraph']],
                  ['table', ['table']],
                  ['insert', ['link', 'picture', 'video']],
                  ['view', ['fullscreen', 'codeview', 'help']]
                ]
            });</script>

         <%-- var initialContent = '<%= Server.HtmlEncode(ContentHiddenField.Value) %>';
            $('#<%= ContentTextArea.ClientID %>').summernote({
                height: 300
            });
            $('#<%= ContentTextArea.ClientID %>').summernote('code', initialContent);--%>
    </form>
</asp:Content>
