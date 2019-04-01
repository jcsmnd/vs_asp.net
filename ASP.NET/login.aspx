<!-- Written by Myungsik Kim -->

<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="" CodeBehind="login.aspx.cs" Inherits="" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.Bootstrap.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<asp:Content ID="login" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div align="center" style="margin-top: 150px; margin-bottom: 100px;">
        <dx:ASPxLabel runat="server" ID="MessageTxt" Theme="MaterialCompact" Font-Size="Large" ForeColor="Red"></dx:ASPxLabel>
        <br />
        <br />
        <dx:ASPxTextBox runat="server" ID="EmailTxt" Theme="MaterialCompact" NullText="Email" Width="350px" Font-Size="Large" AutoCompleteType="Disabled" FocusedStyle-Border-BorderColor="#2273e6">
        </dx:ASPxTextBox>
        <br />
        <dx:ASPxTextBox runat="server" ID="PasswordTxt" Theme="MaterialCompact" NullText="Password" Password="true" Width="350px" Font-Size="Large" CssClass="centered" FocusedStyle-Border-BorderColor="#2273e6">
        </dx:ASPxTextBox>
        <br />
        <font face="verdana">
            <a href="forgotpassword.aspx" class="underlined-text animated-underline">Forgot password?</a>
        </font>
        <br />
        <br />
        <dx:ASPxButton runat="server"
            ID="LoginButton" Theme="MaterialCompact" Text="Sign In"
            Width="350px" Font-Size="Large" HorizontalAlign="Center"
            CssClass="mega-button-link mega-menu-item mega-menu-item-type-custom mega-menu-item-object-custom mega-align-bottom-left mega-menu-flyout mega-menu-item-854 button-link mega-menu-link"
            OnClick="LoginButton_Click">

            <%-- Prevent double clicking --%>
            <ClientSideEvents
                Init="function(s,e)
                {
                    s.SetEnabled(true);
                }"
                Click="function(s,e)
                { 
                    window.setTimeout(function(){s.SetEnabled(false);},0) 
                }" />

        </dx:ASPxButton>
        <br />
        <br />
        <font face="verdana">Do not have an account?</font>
        <a href="registration.aspx"><span class="underlined-text animated-underline">Register</span></a>
        <br />
        <br />
    </div>

</asp:Content>
