<%@ Page Title="CHDBits :: Destiny130的魔力值 - Powered by NexusPHP" Language="C#" MasterPageFile="~/MasterPages/Layout.master" AutoEventWireup="true" CodeFile="Mybonus.aspx.cs" Inherits="UserControlViews_Mybonus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainContent1" runat="Server">
    <table style="width: 940px; margin: auto; text-align: center;">
        <tr>
            <td colspan="4" class="borderH" style="color: white; font-size: 14px;">CHDBits魔力值系统</td>
        </tr>
        <tr>
            <td colspan="4" class="border" style="padding: 15px;">用你的魔力值（当前216,691.4）换东东！<br />
                <b>如果按钮不可点，则你的魔力值不足以交换该项。</b>
            </td>
        </tr>
        <tr>
            <td class="borderSubH" style="width: 24px;">项目</td>
            <td class="borderSubH" style="width: auto; text-align: left;">简介</td>
            <td class="borderSubH" style="width: 62px;">价格</td>
            <td class="borderSubH" style="width: 108px;">交换</td>
        </tr>
        <tr>
            <td class="border">1</td>
            <td class="border" style="text-align: left;">
                <p style="font-size: 16px; font-weight: bold; margin: 10px 0px -10px 3px;">1.0 GB上传量</p>
                <br />
                <p style="margin-left: 3px;">如果有足够的魔力值，你可以用它来换取上传量。交易完成后，你的魔力值会减少，上传量则会增加。</p>
            </td>
            <td class="border">1,000</td>
            <td class="border">分享率已很高</td>
        </tr>
        <tr>
            <td class="border">2</td>
            <td class="border" style="text-align: left;">
                <p style="font-size: 16px; font-weight: bold; margin: 10px 0px -10px 3px;">5.0 GB上传量</p>
                <br />
                <p style="margin-left: 3px;">如果有足够的魔力值，你可以用它来换取上传量。交易完成后，你的魔力值会减少，上传量则会增加。</p>
            </td>
            <td class="border">4,000</td>
            <td class="border">分享率已很高</td>
        </tr>
        <tr>
            <td class="border">3</td>
            <td class="border" style="text-align: left;">
                <p style="font-size: 16px; font-weight: bold; margin: 10px 0px -10px 3px;">10.0 GB上传量</p>
                <br />
                <p style="margin-left: 3px;">如果有足够的魔力值，你可以用它来换取上传量。交易完成后，你的魔力值会减少，上传量则会增加。</p>
            </td>
            <td class="border">8,000</td>
            <td class="border">分享率已很高</td>
        </tr>
        <tr>
            <td class="border">4</td>
            <td class="border" style="text-align: left;">
                <p style="font-size: 16px; font-weight: bold; margin: 10px 0px -10px 3px;">1个邀请名额</p>
                <br />
                <p style="margin-left: 3px;">如果有足够的魔力值，你可以用它来换取上传量。交易完成后，你的魔力值会减少，上传量则会增加。</p>
            </td>
            <td class="border">88,888</td>
            <td class="border">交换</td>
        </tr>
        <tr>
            <td class="border">5</td>
            <td class="border" style="text-align: left;">
                <p style="font-size: 16px; font-weight: bold; margin: 10px 0px -10px 3px;">自定义头衔</p>
                <br />
                <p style="margin-left: 3px;">如果有足够的魔力值，你就可以给自己定一个头衔了。注意：禁止使用脏话、攻击性的词汇或用户等级作为头衔。交易完成后，你的魔 力值会减少，你的头衔将变成自定义的。</p>
                <br />
                <p style="margin-left: 3px;">输入你想要的<span style="font-weight: bold">特殊头衔</span>textbox点击交换</p>
            </td>
            <td class="border">8,000</td>
            <td class="border">交换</td>
        </tr>
        <tr>
            <td class="border">6</td>
            <td class="border" style="text-align: left;">
                <p style="font-size: 16px; font-weight: bold; margin: 10px 0px -10px 3px;">30天不显示广告</p>
                <br />
                <p style="margin-left: 3px;">如果有足够的魔力值，你可以用它来换取一定期限内不显示广告的权限。交易完成后，你的魔力值会减少，同时在一定期限内你将看不 到网站中的广告。如果在此期间你需要显示广告，你可以随时在控制面板开启它。</p>
            </td>
            <td class="border">1,000,000</td>
            <td class="border">需要更多魔力值</td>
        </tr>
        <tr>
            <td class="border">7</td>
            <td class="border" style="text-align: left;">
                <p style="font-size: 16px; font-weight: bold; margin: 10px 0px -10px 3px;">慈善捐赠</p>
                <br />
                <p style="margin-left: 3px;">你可以将你的魔力值通过慈善捐赠送与有需要的用户群体。而且，完全由你决定赠与群体的条件。</p>
                <br />
                <p style="margin-left: 3px;">选择你想捐赠予的用户群体的分享率，选择你想赠送的魔力值总值，然后点击慈善捐赠！</p>
                <p style="margin-left: 3px;">平均分配给用户：分享率低于dropdownlist且下载量大于 10 GB	赠送量：dropdownlist个魔力值！</p>
            </td>
            <td class="border">最少1,000<br />
                最多50,000</td>
            <td class="border">慈善捐赠</td>
        </tr>
    </table>
    <br />
    <table style="width: 940px; margin: auto; text-align: center;">
        <tr>
            <td class="borderH" style="color: white; font-size: 14px;">魔力值到底是什么玩意儿，我怎样才能得到它？</td>
        </tr>
        <tr>
            <td class="border" style="text-align: left; padding: 10px;">
                <br />
                <h1 style="font-size: 16px;">做种每小时将得到如下的魔力值</h1>
                <ul class="bonusrules">
                    <li>1个魔力值 * 你的做种数 (做种数最多计12个)</li>
                    <li>每小时获得的魔力值点数由下面的公式给出<br />
                        &nbsp;&nbsp;&nbsp;
                        <img src="../App_Themes/DarkGreen/images/bonusformulaa.png" /><br />
                        &nbsp;&nbsp;&nbsp;
                        <img src="../App_Themes/DarkGreen/images/bonusformulab.png" /><br />
                        式中<br />
                        <ul style="list-style-type: circle; margin-left: 60px;">
                            <li><b>A</b>为中间变量</li>
                            <li><b>Ti</b>为第<b>i</b>个种子的生存时间, 即自种子发布起到现在所经过的时间, 单位是周</li>
                            <li><b>T0</b>为参数。<b>T0</b> = 4</li>
                            <li><b>Si</b>为第<b>i</b>个种子的大小，单位是GB</li>
                            <li><b>Ni</b>为第<b>i</b>个种子当前的做种者数</li>
                            <li><b>N0</b>为参数。<b>N0</b> = 7</li>
                            <li><b>B</b>为1小时中用户获得的做种魔力值点数</li>
                            <li><b>B0</b>为参数，代表用户1小时获得魔力值的上限。<b>B0</b> = 60</li>
                            <li><b>L</b>为参数。<b>L</b> = 300</li>
                        </ul>
                        简言之，为做种人数少、文件体积大的种子做种能获得更多魔力值。
                    </li>
                    <li>捐赠者每次将得到2倍的魔力值</li>
                    <li>魔力:216691.4 做种积分:60632.2 当前时间:2017-07-15 11:34:47</li>
                </ul>
                <br />
                <div style="text-align: center;">
                    你当前每小时能获取62.715个魔力值 (A = 1209.8)<br />
                    <img src="../App_Themes/DarkGreen/images/bonustake.jpg" />
                </div>
                <h1 style="font-size: 16px;">其他获取方式</h1>
                <ul class="bonusrules">
                    <li>发布新种子 = 15个魔力值</li>
                    <li>上传一个字幕 = 5个魔力值</li>
                    <li>发布新主题 = 2个魔力值</li>
                    <li>回复帖子 = 1个魔力值</li>
                    <li>发布种子、候选的评论 = 1个魔力值</li>
                    <li>参与一次调查投票 = 1个魔力值</li>
                    <li>参与一次候选投票 = 1个魔力值</li>
                    <li>参与一次趣味盒投票 = 1个魔力值</li>
                    <li>收到感谢 = 5个魔力值</li>
                    <li>宣传链接获得一次点击（每个IP只计一次）= 1个魔力值</li>
                    <li>发布的趣味盒内容获得用户较高的评价（详见规则）</li>
                </ul>
                <h1 style="font-size: 16px;">注意点</h1>
                <ul class="bonusrules">
                    <li>分享率高于3且上传量大于500GB的用户不能换取更多的上传量。</li>
                    <li>与获取相反的事件也会消耗你的魔力值。<br />
                        如：如果你上传种子后又删除了它，你会先得到然后又失去15个魔力值。</li>
                    <li>站点还有其他获取魔力值的事，请慢慢探索。:)</li>
                    <li>管理组可以剥夺或发放魔力值，视用户是违反规则还是做贡献而定。</li>
                </ul>
            </td>
        </tr>
    </table>
</asp:Content>

