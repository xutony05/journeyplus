<%@ Page Title="" Language="C#" MasterPageFile="~/Master1.Master" AutoEventWireup="true" CodeBehind="MainPage.aspx.cs" Inherits="MentalHealth3.MainPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PlaceHolderHeader" runat="server">
    <link rel="stylesheet" type="text/css" href="Stylesheets/CssMainPage.css" />
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PlaceHolderContent" runat="server">
    <div id="DivLogin" style="background-color: rgba(0, 0, 0, 0.05)">
        <table style="width: 100%">
            <tr>
                <td style="color: white; text-align: center; font-size: 8px;">USERNAME</td>
                <td>
                    <input type="text" class="form-control" runat="server" id="TextboxUsername" style="width: 100%" />
                </td>
                <td>
                    <asp:RequiredFieldValidator runat="server" ID="Validator1" ForeColor="Red" Text="*" ControlToValidate="TextboxUsername"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td style="color: white; text-align: center; font-size: 8px;">PASSWORD</td>
                <td>
                    <input type="password" class="form-control" runat="server" id="TextboxPassword" style="width: 100%" />
                </td>
                <td>
                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ForeColor="Red" Text="*" ControlToValidate="TextboxPassword"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td>

                </td>

                <td style="padding-top: 1em; height: 25px; text-align: right">

                    <input class="btn btn-primary ButtonLogin" style="width: 70%; text-align: center; height: 25px; font-size: 8px" type="submit" id="ButtonLogin" runat="server" value="Log in" />

                </td>

                <td></td>
            </tr>
        </table>
    </div>
</asp:Content>
