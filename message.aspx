<%@ Page Title="留言板" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="message.aspx.cs" Inherits="WebApplication2.message" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .message-container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
        }

        .message-form {
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .message-list {
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .message-item {
            padding: 15px;
            border-bottom: 1px solid #eee;
        }

        .message-item:last-child {
            border-bottom: none;
        }

        .message-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            color: #666;
            font-size: 14px;
        }

        .message-content {
            color: #333;
            margin-bottom: 10px;
        }

        .message-time {
            color: #999;
            font-size: 12px;
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

        .message-area {
            min-height: 150px;
            resize: vertical;
        }

        .btn-container {
            text-align: center;
            margin-top: 20px;
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

        .btn:hover {
            opacity: 0.9;
        }
    </style>

    <div class="message-container">
        <div class="message-form">
            <h2 style="text-align: center; color: #333; margin-bottom: 30px;">请填写以下信息，方便我们进行及时沟通:</h2>
            
            <div class="form-group">
                <label class="form-label">姓名:</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" required></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label">e-mail:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label">联系电话:</label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label">留言:</label>
                <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control message-area" TextMode="MultiLine"></asp:TextBox>
            </div>

            <div class="btn-container">
                <asp:Button ID="btnSubmit" runat="server" Text="提交" CssClass="btn btn-submit" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="取消" CssClass="btn btn-cancel" OnClientClick="return confirm('确定要取消吗？');" />
            </div>
        </div>

        <div class="message-list">
            <h3 style="margin-bottom: 20px; color: #333;">最近留言</h3>
            <asp:Repeater ID="rptMessages" runat="server">
                <ItemTemplate>
                    <div class="message-item">
                        <div class="message-header">
                            <span><%# Eval("Name") %></span>
                            <span><%# Eval("Email") %></span>
                        </div>
                        <div class="message-content">
                            <%# Eval("MessageContent") %>
                        </div>
                        <div class="message-time">
                            <%# Eval("SubmitTime", "{0:yyyy-MM-dd HH:mm:ss}") %>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>