<%@ Page Title="班级相册" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClassAlbum.aspx.cs" Inherits="WebApplication2.ClassAlbum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .photo-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
        }

        .photo-item {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: transform 0.3s;
        }

        .photo-item:hover {
            transform: translateY(-5px);
        }

        .photo-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .photo-title {
            padding: 15px;
            text-align: center;
            font-size: 16px;
            color: #333;
            background: #fff;
        }

        h1 {
            text-align: center;
            margin: 20px 0;
            color: #333;
        }
    </style>

    <h1>班级相册</h1>
    <asp:ListView ID="lvPhotos" runat="server">
        <LayoutTemplate>
            <div class="photo-grid">
                <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="photo-item">
                <asp:Image ID="imgPhoto" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' AlternateText='<%# Eval("Title") %>' />
                <div class="photo-title"><%# Eval("Title") %></div>
            </div>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
