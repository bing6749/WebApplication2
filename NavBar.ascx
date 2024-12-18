<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavBar.ascx.cs" Inherits="WebApplication2.UserControls.NavBar" %>

<style type="text/css">
    .nav-container {
        width: 100%;
        background-color: #fff;
        padding: 10px 0;
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
        margin: 0 20px;
    }
    .nav-dot {
        width: 8px;
        height: 8px;
        background-color: #90EE90;
        border-radius: 50%;
        display: inline-block;
        margin-right: 8px;
    }
    .nav-link {
        text-decoration: none;
        color: #663399;
        font-size: 16px;
        transition: color 0.3s;
    }
    .nav-link:hover {
        color: #4B0082;
    }
</style>

<nav class="nav-container">
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
            <asp:HyperLink runat="server" NavigateUrl="~/classAlbum" CssClass="nav-link">班级相册</asp:HyperLink>
        </li>
        <li class="nav-item">
            <span class="nav-dot"></span>
            <asp:HyperLink runat="server" NavigateUrl="~/StudentWorks" CssClass="nav-link">同学作品</asp:HyperLink>
        </li>
        <li class="nav-item">
            <span class="nav-dot"></span>
            <asp:HyperLink runat="server" NavigateUrl="~/MessageBoard" CssClass="nav-link">留言板</asp:HyperLink>
        </li>
        <li class="nav-item">
            <span class="nav-dot"></span>
            <asp:HyperLink runat="server" NavigateUrl="~/About" CssClass="nav-link">关于我们</asp:HyperLink>
        </li>
    </ul>
</nav>
