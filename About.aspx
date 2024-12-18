<%@ Page Title="关于我们" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication2.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .about-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }

        .section {
            background: #fff;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .section h2 {
            color: #333;
            border-bottom: 2px solid #eee;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .section p {
            line-height: 1.6;
            color: #666;
        }

        .info-list {
            list-style: none;
            padding: 0;
        }

        .info-list li {
            margin-bottom: 10px;
            color: #666;
        }

        .motto {
            font-style: italic;
            color: #666;
            margin: 10px 0;
        }

        .teacher-list {
            list-style: none;
            padding: 0;
        }

        .teacher-list li {
            margin-bottom: 10px;
            color: #666;
        }

        .contact-info {
            list-style: none;
            padding: 0;
        }

        .contact-info li {
            margin-bottom: 10px;
            color: #666;
        }
    </style>

    <div class="about-container">
        <div class="section">
            <h2>班级简介</h2>
            <p>软件工程23C1班成立于2023年9月，是一个充满活力和创造力的集体。我们班共有40名同学，每个人都怀着对软件开发的热爱，在学习的道路上互帮互助，共同进步。</p>
        </div>

        <div class="section">
            <h2>班级信息</h2>
            <ul class="info-list">
                <li>班级：软件工程23C1班</li>
                <li>班主任：张老师</li>
                <li>班长：李明</li>
                <li>团支书：王华</li>
                <li>班级人数：40人</li>
                <li>教室：王教学楼A403</li>
            </ul>
        </div>

        <div class="section">
            <h2>班级口号</h2>
            <p class="motto">团结协作，追求卓越</p>
            <p class="motto">用代码改变世界，以创新塑造未来</p>
        </div>

        <div class="section">
            <h2>任课教师</h2>
            <ul class="teacher-list">
                <li>高等数学：李教授</li>
                <li>程序设计：王教授</li>
                <li>数据结构：张教授</li>
                <li>计算机网络：刘教授</li>
                <li>软件工程：陈教授</li>
            </ul>
        </div>

        <div class="section">
            <h2>联系我们</h2>
            <ul class="contact-info">
                <li>班级邮箱：23c1@example.com</li>
                <li>办公室：教学楼A405</li>
                <li>联系电话：xxx-xxxxxxxx</li>
            </ul>
        </div>
    </div>
</asp:Content>
