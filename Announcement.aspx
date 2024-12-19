<%@ Page Title="公告管理" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Announcement.aspx.cs" Inherits="WebApplication2.Announcement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .announcement-container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
        }

        .announcement-form {
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            color: #90EE90;
            margin-bottom: 5px;
            font-size: 16px;
        }

        .form-control {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .announcement-area {
            min-height: 150px;
            resize: vertical;
        }

        .btn {
            padding: 10px 30px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin: 0 10px;
        }

        .btn-submit {
            background-color: #90EE90;
            color: white;
        }

        .btn-cancel {
            background-color: #ddd;
            color: #666;
        }

        .error-message {
            color: red;
            margin-bottom: 10px;
        }

        .no-access {
            text-align: center;
            padding: 50px;
            color: #666;
        }
    </style>

    <div class="announcement-container">
        <asp:Panel ID="pnlAdminAccess" runat="server" Visible="false">
            <div class="announcement-form">
                <h2 style="text-align: center; color: #333; margin-bottom: 30px;">发布新公告</h2>
                
                <asp:Label ID="lblError" runat="server" CssClass="error-message" Visible="false"></asp:Label>

                <div class="form-group">
                    <label class="form-label">公告内容:</label>
                    <asp:TextBox ID="txtContent" runat="server" CssClass="form-control announcement-area" 
                               TextMode="MultiLine" required></asp:TextBox>
                </div>

                <div style="text-align: center;">
                    <asp:Button ID="btnSubmit" runat="server" Text="发布" CssClass="btn btn-submit" 
                              OnClick="btnSubmit_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="取消" CssClass="btn btn-cancel" 
                              OnClientClick="return confirm('确定要取消吗？');" />
                </div>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlNoAccess" runat="server" CssClass="no-access">
            <h2>访问被拒绝</h2>
            <p>您没有权限访问此页面。</p>
        </asp:Panel>
    </div>
</asp:Content>
