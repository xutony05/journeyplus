<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="AdminPanel.aspx.cs" Inherits="MentalHealth3.AdminPanel" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderHeader" runat="server">
    <link rel="stylesheet" type="text/css" href="Stylesheets/CssAdminPanel.css" />

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
            $(function() { $("#imageUp").on('click', function() { var position = $("#topofthePage").offset().top; $("HTML, BODY").animate({ scrollTop: position }, 1000); }); });
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderContent" runat="server">

    <span id="back-to-top">
        <img src="Images/Arrow.png" id="imageUp" />
    </span>

    <table id="TableChoose">
        <tr>
            <td>
                <a href="#DivCamp">
                    <div>
                        REGISTER
                    </div>
                </a>
            </td>

            <td>
                <a href="#DivEvent">
                    <div>
                        ADD EVENTS
                    </div>
                </a>
            </td>

            <td>
                <a href="MainPage.aspx">
                    <div>
                        LOG OUT
                    </div>
                </a>
            </td>
        </tr>
    </table>

    <%--<div id="DivCampPointer" style="margin-bottom: 8px;"></div>--%>

    <asp:Panel runat="server" ID="Panel1">
        <div id="DivCamp" class="Divisions">
            <h1>Adding Company:</h1>

            <table>
                <tr>
                    <td>Company Name:
                    </td>

                    <td>
                        <input type="text" runat="server" id="TextboxCompany" style="width: 100%;" class="form-control" />
                    </td>

                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="Validator1" ControlToValidate="TextboxCompany" ForeColor="Red" Text="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>Password:
                    </td>

                    <td>
                        <input type="password" runat="server" id="TextboxPassword" class="form-control" style="width: 100%" />
                    </td>

                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="TextboxPassword" ForeColor="Red" Text="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>Repeat Password:
                    </td>

                    <td>
                        <input type="password" runat="server" class="form-control" id="TextboxPassword2" style="width: 100%" />
                    </td>

                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="TextboxPassword2" ForeColor="Red" Text="*" ValidationGroup="1"></asp:RequiredFieldValidator>
                        <asp:CompareValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="TextboxPassword2" ControlToCompare="TextboxPassword" ForeColor="Red" Text="Discrepency Detected" ValidationGroup="1"></asp:CompareValidator>
                    </td>
                </tr>

                <tr>
                    <td colspan="3">
                        <br />
                        <div align="left">
                            <input type="submit" runat="server" id="ButtonRegister" class="ButtonSubmit form-control" value="Sign Up" validationgroup="1" />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>

    <div id="DivEventPointer" style="margin-bottom: 100px;"></div>

    <asp:Panel runat="server" ID="Panel3">
        <div id="DivEvent" class="Divisions">
            <h1>Seting Up an Event:</h1>
            <table>
                <tr>
                    <td>
                        Company name:
                    </td>

                    <td>
                        <input type="text" class="form-control" runat="server" id="TextboxCampEvent" style="width: 100%" />
                    </td>

                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredSetup1" ControlToValidate="TextboxCampEvent" ForeColor="Red" Text="*" ValidationGroup="3"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>
                        Date:
                    </td>

                    <td>
                        <input type="date" class="form-control" runat="server" id="TextboxDateEvent" style="width: 100%" />
                    </td>

                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ControlToValidate="TextboxDateEvent" ForeColor="Red" Text="*" ValidationGroup="3"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>
                        JP Points:
                    </td>

                    <td>
                        <input class="form-control" type="number" runat="server" id="TextboxXPEvent" style="width: 100%" />
                    </td>

                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="TextboxXPEvent" ForeColor="Red" Text="*" ValidationGroup="3"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>
                        Description
                    </td>

                    <td>
                        <textarea runat="server" id="TextAreaDescription" style="width: 100%;" rows="5"></textarea>
                    </td>

                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="TextAreaDescription" ForeColor="Red" Text="*" ValidationGroup="3"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                <tr>
                    <td>Image:</td>
                    
                    <td>
                        <input type="text" runat="server" id="TextboxLink" class="form-control" style="width: 100%" />
                    </td>
                    
                    <td>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7"  ControlToValidate="TextboxLink" ForeColor="Red" Text="*" ValidationGroup="3"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                
                <tr>
                    <td colspan="3">
                        <br />
                        <div>
                            <input type="submit" runat="server" value="Set Up Event" id="ButtonEvent" class="ButtonSubmit form-control" validationgroup="3" />
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>

    <div style="height: 300px;"></div>
</asp:Content>
