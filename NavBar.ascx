<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavBar.ascx.cs" Inherits="WebApplication2.UserControls.NavBar" %>

<style type="text/css">
    .nav-container {
        width: 100%;
        background-color: #fff;
        padding: 5px 0;
        position: relative;
    }
    .nav-list {
        display: flex;
        justify-content: center;
        list-style: none;
        margin: 0;
        padding: 0;
    }
    .nav-item {
        display: flex;
        align-items: center;
        margin: 0 15px;
    }
    .nav-dot {
        width: 6px;
        height: 6px;
        background-color: #90EE90;
        border-radius: 50%;
        display: inline-block;
        margin-right: 6px;
    }
    .nav-link {
        text-decoration: none;
        color: #663399;
        font-size: 14px;
        transition: color 0.3s;
    }
    .nav-link:hover {
        color: #4B0082;
    }
    .user-info {
        position: absolute;
        right: 15px;
        top: 5px;
        display: flex;
        align-items: center;
        font-size: 12px;
        color: #666;
    }
    .logout-btn {
        margin-left: 8px;
        padding: 3px 8px;
        background-color: #f8f9fa;
        border: 1px solid #ddd;
        border-radius: 3px;
        color: #666;
        text-decoration: none;
        font-size: 12px;
    }
    .logout-btn:hover {
        background-color: #e9ecef;
    }
</style>

<nav class="nav-container">
    <div class="user-info">
        <% if (Context.User.Identity.IsAuthenticated) { %>
            欢迎, <%= Context.User.Identity.Name %>
            <asp:LinkButton ID="lnkLogout" runat="server" CssClass="logout-btn" OnClick="lnkLogout_Click">退出</asp:LinkButton>
        <% } else { %>
            <a href="~/Login.aspx" runat="server" class="nav-link">登录</a>
        <% } %>
    </div>

    <ul class="nav-list">
        <li class="nav-item">
            <span class="nav-dot"></span>
            <asp:HyperLink runat="server" NavigateUrl="~/" CssClass="nav-link">首页</asp:HyperLink>
        </li>
        <li class="nav-item">
            <span class="nav-dot"></span>
            <asp:HyperLink runat="server" NavigateUrl="~/ClassDiary" CssClass="nav-link">班级日志</asp:HyperLink>
        </li>
        <li class="nav-item">
            <span class="nav-dot"></span>
            <asp:HyperLink runat="server" NavigateUrl="~/ClassAlbum" CssClass="nav-link">班级相册</asp:HyperLink>
        </li>
        <li class="nav-item">
            <span class="nav-dot"></span>
            <asp:HyperLink runat="server" NavigateUrl="~/ClassWorks" CssClass="nav-link">同学作品</asp:HyperLink>
        </li>
        <li class="nav-item">
            <span class="nav-dot"></span>
            <asp:HyperLink runat="server" NavigateUrl="~/Message" CssClass="nav-link">留言板</asp:HyperLink>
        </li>
        <li class="nav-item">
            <span class="nav-dot"></span>
            <asp:HyperLink runat="server" NavigateUrl="~/About" CssClass="nav-link">关于我们</asp:HyperLink>
        </li>
    </ul>
</nav>
