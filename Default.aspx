<%@ Page Title="首页" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs"
    Inherits="WebApplication2._Default" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <style>
            .indent {
                padding: 20px;
                max-width: 1200px;
                margin: 0 auto;
            }

            .welcome {
                background: linear-gradient(to right, #f6f9fc, #ffffff);
                padding: 30px;
                border-radius: 10px;
                box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
                margin-bottom: 40px;
            }

            .welcome h1 {
                color: #2c3e50;
                font-size: 28px;
                margin-bottom: 20px;
                text-align: center;
            }

            .welcome h2 {
                color: #666;
                font-size: 16px;
                line-height: 1.8;
                text-align: justify;
                font-weight: normal;
            }

            .announcements-section {
                background: #ffffff;
                padding: 25px;
                border-radius: 10px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            }

            .announcements-section h1 {
                color: #2c3e50;
                font-size: 24px;
                margin-bottom: 20px;
                padding-bottom: 10px;
                border-bottom: 2px solid #eee;
            }

            #listItem {
                list-style: none;
                padding: 0;
            }

            #listItem li {
                padding: 15px;
                border-bottom: 1px solid #eee;
                transition: background-color 0.3s;
            }

            #listItem li:hover {
                background-color: #f8f9fa;
            }

            #listItem a {
                text-decoration: none;
                color: #34495e;
                display: block;
            }

            #listItem small {
                color: #7f8c8d;
                font-size: 0.85em;
                display: block;
                margin-top: 5px;
            }

            .more {
                text-align: right;
                padding: 15px 0 0 0;
            }

            .more a {
                color: #3498db;
                text-decoration: none;
                font-size: 14px;
                transition: color 0.3s;
            }

            .more a:hover {
                color: #2980b9;
            }
        </style>
        <div class="indent">
            <div class="welcome">
                <h1>欢迎来到浙江万里学院软件工程23C1班</h1>
                <h2>因为我们的缘分,我们齐聚一堂。这是一个充满活力的集体,不同的思想,不同的习惯,这是一个平凡而和谐的集体,它偶尔烦乱确不乏温馨;这是一个充满智慧的集体,关键时候,一条心一起努力。。。。。有很多故事，有欢笑，有悲伤，有成功的欢呼，也有失败的顺位，我们在这里一起难过!
                </h2>
            </div>
            <div class="announcements-section">
                <h1>最新公告</h1>
                <asp:ListView ID="lvAnnouncements" runat="server">
                    <LayoutTemplate>
                        <ul id="listItem">
                            <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                            <div class="more">
                                <asp:HyperLink runat="server" NavigateUrl="~/MessageBoard.aspx">更多...</asp:HyperLink>
                            </div>
                        </ul>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <li>
                            <asp:HyperLink runat="server" NavigateUrl='<%# Eval("Url") %>'>
                                <br />
                                <%# Eval("Title") %>
                                    <small>
                                        - by <%# Eval("Author") %>
                                            (<%# ((DateTime)Eval("SubmitTime")).ToString("yyyy-MM-dd") %>)
                                    </small>
                            </asp:HyperLink>
                        </li>
                    </ItemTemplate>
                </asp:ListView>
            </div>
        </div>
    </asp:Content>