<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="techblog._Default" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <section id="featuredPost" style="border-bottom: 1px solid #ccc;">
        <div class="feature-post">
            <div class="image-container">
                <img src="Images/demo.png" alt="Post Image" class="post-image">
            </div>
            <div class="post-details">
                <h1 class="post-title">Ngôi nhà ở Trung Kính trước khi xảy ra hỏa hoạn</h1>
                <p class="post-description">
                    Hà Nội – Sân của ngôi nhà được tận dụng làm nơi sửa chữa xe điện, khắp nơi bày bình ắc-quy, có thời điểm xếp chật kín các loại xe máy.
                </p>
                <div class="post-meta">
                    <span class="post-category">Thời sự</span>
                    <span class="post-views">152</span>
                </div>
            </div>
        </div>
    </section>

    <section id="randomPost">
        <div class="random-post">
            <div class="post">
                <div class="image-container">
                    <img src="Images/demo.png" alt="Post 1 Image">
                </div>
                <h2>Người chết cháy nhiều hơn chết ngạt' trong vụ hỏa hoạn ở Trung Kính</h2>
            </div>
            <div class="post">
                <div class="image-container">
                    <img src="Images/demo.png" alt="Post 2 Image">
                </div>
                <h2>Chủ tịch nước: Siết quy định sử dụng dao để xây dựng xã hội an toàn</h2>
            </div>
            <div class="post">
                <div class="image-container">
                    <img src="Images/demo.png" alt="Post 3 Image">
                </div>
                <h2>Title for the third post</h2>
            </div>
        </div>
    </section>
</asp:Content>
