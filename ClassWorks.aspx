<%@ Page Title="同学作品" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClassWorks.aspx.cs" Inherits="WebApplication2.ClassWorks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .works-container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
        }

        .works-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            padding: 20px;
        }

        .work-item {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            padding: 20px;
        }

        .work-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        .work-title {
            color: #2c3e50;
            font-size: 20px;
            margin-bottom: 10px;
            padding-bottom: 10px;
            border-bottom: 2px solid #eee;
        }

        .work-author {
            color: #3498db;
            font-size: 16px;
            margin-bottom: 10px;
        }

        .work-description {
            color: #666;
            font-size: 14px;
            line-height: 1.6;
            margin: 0;
        }
    </style>

    <div class="works-container">
        <div class="works-grid">
            <asp:ListView ID="lvWorks" runat="server">
                <ItemTemplate>
                    <div class="work-item">
                        <h3 class="work-title"><%# Eval("Title") %></h3>
                        <div class="work-author">作者：<%# Eval("Author") %></div>
                        <p class="work-description"><%# Eval("Description") %></p>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
