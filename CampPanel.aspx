<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="CampPanel.aspx.cs" Inherits="MentalHealth3.CampPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderHeader" runat="server">
    <link rel="stylesheet" type="text/css" href="Stylesheets/CssCampPanel.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("a").on('click', function (event) {
                if (this.hash !== "") {
                    event.preventDefault();
                    var hash = this.hash;
                    $('html, body').animate({
                        scrollTop: $(hash).offset().top
                    }, 800, function () {
                        window.location.hash = hash;
                    });
                }
            });
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#back-to-top").hide();
            $(window).scroll(function () {
                if ($(window).scrollTop() > 200) {
                    $('#back-to-top').fadeIn();
                } else {
                    $('#back-to-top').fadeOut();
                }
            });
            $(function () { $("#imageUp").on('click', function () { var position = $("#topofthePage").offset().top; $("HTML, BODY").animate({ scrollTop: position }, 1000); }); });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderContent" runat="server">
    <span id="back-to-top">
        <img src="Images/Arrow.png" id="imageUp" />
    </span>

    <div id="topofthePage"></div>

    <table id="TableChoose">
        <tr>
            <td>
                <a href="#DivAttendence">
                    <div>
                        Users Attendence
                    </div>
                </a>
            </td>

            <td>
                <a href="#DivRequest">
                    <div>
                        Request Events
                    </div>
                </a>
            </td>

            <td>
                <a href="MainPage.aspx">
                    <div>
                        Log out
                    </div>
                </a>
            </td>
        </tr>
    </table>

    <div id="DivAttendencePointer" style="margin-bottom: 100px;"></div>

    <asp:Panel runat="server" ID="Panel1">
        <div id="DivAttendence" class="Divisions">
            <h1>User Attendence</h1>

            <table>
                <tr>
                    <td>Username:</td>

                    <td>
                        <input type="text" runat="server" id="TextboxUsername" class="form-control" style="width: 100%;" />
                    </td>

                    <td>
                        <asp:RequiredFieldValidator runat="server" ValidationGroup="1" ForeColor="Red" Text="*" ControlToValidate="TextboxUsername"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>Shared Code:
                    </td>

                    <td>
                        <input type="text" runat="server" id="TextboxCode" class="form-control" style="width: 100%;" />
                    </td>

                    <td>
                        <asp:RequiredFieldValidator runat="server" ValidationGroup="1" ForeColor="Red" Text="*" ControlToValidate="TextboxCode"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td colspan="3" style="padding-top: 2em;">
                        <input type="submit" runat="server" id="ButtonAttend" value="User Attend" validationgroup="1" class="ButtonSubmit form-control" style="padding-top: 1em;" />
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>

    <div id="DivRequestPointer" style="margin-bottom: 100px"></div>

    <asp:Panel runat="server" ID="Panel2">
        <div id="DivRequest" class="Divisions">
            <h1>Request an Event</h1>

            <table>
                <tr>
                    <td>JP Points:
                    </td>

                    <td>
                        <input type="number" class="form-control" runat="server" id="TextboxXP" style="width: 100%" />
                    </td>

                    <td>
                        <asp:RequiredFieldValidator runat="server" ForeColor="Red" Text="*" ControlToValidate="TextboxXP" ValidationGroup="2"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>Date:
                    </td>

                    <td>
                        <input type="date" class="form-control" runat="server" id="TextboxDate" style="width: 100%" />
                    </td>

                    <td>
                        <asp:RequiredFieldValidator runat="server" ForeColor="Red" Text="*" ControlToValidate="TextboxXP" ValidationGroup="2"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>Description:
                    </td>

                    <td>
                        <textarea runat="server" id="TextareaDescription" style="width: 100%" rows="5" />
                    </td>

                    <td>
                        <asp:RequiredFieldValidator runat="server" ForeColor="Red" Text="*" ControlToValidate="TextareaDescription" ValidationGroup="2"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td colspan="3" style="padding-top: 2em;">
                        <input type="submit" runat="server" validationgroup="2" id="ButtonRequest" class="ButtonSubmit form-control" value="Send Request" />
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>

    <div style="height: 300px;"></div>
</asp:Content>
