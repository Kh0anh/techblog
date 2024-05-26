<%@ Page Title="Post" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Post.aspx.cs" Inherits="techblog.Manage.Post" %>

<asp:Content ID="Header" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="SayHello" runat="server" ForeColor="Black" Font-Size="18" Font-Bold="true" />
    <ol>
        <li>
            <asp:Label runat="server" AssociatedControlID="PostTitle">Tiêu đề:</asp:Label>
            <asp:TextBox ID="PostTitle" runat="server" TextMode="MultiLine" Rows="1" Style="overflow: hidden;" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="PostTitle" CssClass="field-validation-error" ErrorMessage="Bạn chưa nhập tiêu đề." />
        </li>
        <li>
            <asp:Label runat="server" AssociatedControlID="PostDescription">Mô tả:</asp:Label>
            <asp:TextBox ID="PostDescription" runat="server" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="PostDescription" CssClass="field-validation-error" ErrorMessage="Bạn chưa nhập tiêu đề Mô tả." />
        </li>
        <li>
            <asp:Label runat="server" AssociatedControlID="FileUploadImage">Ảnh bìa:</asp:Label>
            <asp:FileUpload ID="FileUploadImage" runat="server" />
            <asp:CustomValidator ID="CustomValidatorFileUpload" runat="server"
                ControlToValidate="FileUploadImage"
                CssClass="field-validation-error"
                ErrorMessage="Bạn chưa tải ảnh lên."
                OnServerValidate="ValidateFileUpload"
                Display="Dynamic" />
            <asp:Label ID="UploadMsgErr" runat="server" ForeColor="Red" />
        </li>
        <li>
            <div id="editor"></div>
        </li>
    </ol>
    <asp:Button ID="SubmitButton" runat="server" Text="Đăng" OnClick="SubmitButton_Click" />
    <input type="hidden" name="PostContent" id="PostContent" />
    <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
    <script>
        function htmlEncode(value) {
            return $('<div/>').text(value).html();
        }

        const quill = new Quill('#editor', {
            modules: {
                toolbar: [
                  ['bold', 'italic'],
                  ['link', 'blockquote', 'code-block', 'image'],
                  [{ list: 'ordered' }, { list: 'bullet' }],
                ],
            },
            theme: 'snow',
        });
        document.getElementById('<%= SubmitButton.ClientID %>').addEventListener('click', function () {
            var content = htmlEncode(quill.root.innerHTML);
            document.getElementById('PostContent').value = content;
        });
    </script>
</asp:Content>
