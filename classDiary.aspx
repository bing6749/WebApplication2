<%@ Page Title="班级日志" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="classDiary.aspx.cs" Inherits="WebApplication2.classDiary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .diary-container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
        }

        .diary-title {
            color: #2c3e50;
            font-size: 28px;
            margin-bottom: 30px;
            text-align: center;
            padding-bottom: 15px;
            border-bottom: 2px solid #eee;
        }

        .diary-list {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            padding: 20px;
        }

        .diary-item {
            padding: 20px;
            border-bottom: 1px solid #eee;
            margin-bottom: 20px;
        }

        .diary-item:last-child {
            border-bottom: none;
        }

        .diary-content {
            color: #34495e;
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 10px;
        }

        .diary-meta {
            color: #7f8c8d;
            font-size: 14px;
        }

        .diary-author {
            font-weight: bold;
            color: #3498db;
        }

        .diary-time {
            margin-left: 15px;
        }
    </style>

    <div class="diary-container">
        <div class="diary-list">
            <asp:ListView ID="lvDiary" runat="server">
                <ItemTemplate>
                    <div class="diary-item">
                        <div class="diary-content">
                            <%# Eval("MessageContent") %>
                        </div>
                        <div class="diary-meta">
                            <span class="diary-author"><%# Eval("Name") %></span>
                            <span class="diary-time"><%# ((DateTime)Eval("SubmitTime")).ToString("yyyy-MM-dd HH:mm") %></span>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
