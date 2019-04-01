<!-- Written by Myungsik Kim -->

<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="" CodeBehind="registration.aspx.cs" Inherits="" %>

<%@ Register Assembly="DevExpress.Web.v18.1, Version=18.1.3.0, Culture=neutral, PublicKeyToken=" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="registration" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div align="center" style="padding-top:100px; padding-bottom:100px">
        
        <dx:ASPxLabel runat="server" Theme="MaterialCompact" Font-Size="X-Large" Text="Register" ForeColor="#2273e6"></dx:ASPxLabel>

        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="1" EnableTheming="True">
            <Items>
                <dx:LayoutGroup ColCount="1" ColSpan="1" Caption="Account" ParentContainerStyle-Font-Size="Medium">
                    <Items>
                        <dx:LayoutItem Caption="" ColSpan="1">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="EmailTxt" runat="server" NullText="Email" AutoCompleteType="Disabled" Theme="MaterialCompact" Width="300px" Font-Size="Medium" MaxLength="100" FocusedStyle-Border-BorderColor="#2273e6">
                                        <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" EnableCustomValidation="true">
                                            <RequiredField ErrorText="E-mail required" IsRequired="True" />
                                            <RegularExpression ErrorText="Invalid Email Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                            <CaptionSettings HorizontalAlign="Center" VerticalAlign="Middle" />
                            <CaptionStyle Font-Names="Book Antiqua">
                            </CaptionStyle>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="" ColSpan="1">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="PasswordTxt" runat="server" NullText="Password" Password="True" Theme="MaterialCompact" Width="300px" Font-Size="Medium" MaxLength="100" ClientInstanceName="pass1" FocusedStyle-Border-BorderColor="#2273e6">
                                        <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                            <RequiredField ErrorText="Password required" IsRequired="True" />
                                            <RegularExpression ErrorText="Must Contain 1Upper,1Special,8Length" ValidationExpression="(?=.*\d)(?=.*\W)(?=.*[A-Z]).{8,}" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>

                        <dx:LayoutItem Caption="" ColSpan="1">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="PasswordAgainTxt" runat="server" NullText="Password (Again)" Password="True" Theme="MaterialCompact" Width="300px" Font-Size="Medium" MaxLength="100" ClientInstanceName="pass2" FocusedStyle-Border-BorderColor="#2273e6">
                                        <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom" EnableCustomValidation="true" ErrorText="Password does not match">
                                            <RequiredField ErrorText="Password required" IsRequired="True" />
                                        </ValidationSettings>
                                        <ClientSideEvents Validation="function(s, e) { e.isValid = (pass1.GetText()==pass2.GetText()); }" />
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>

                    <ParentContainerStyle Font-Size="Medium"></ParentContainerStyle>
                </dx:LayoutGroup>
                <dx:LayoutGroup ColCount="1" ColSpan="1" Caption="Personal Information" ParentContainerStyle-Font-Size="Medium">
                    <Items>
                        <dx:LayoutItem Caption="" ColSpan="1">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="FirstNameText" runat="server" AutoCompleteType="Disabled" NullText="First Name" Theme="MaterialCompact" Width="300px" Font-Size="Medium" MaxLength="100" FocusedStyle-Border-BorderColor="#2273e6">
                                        <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                            <RequiredField ErrorText="First name requried" IsRequired="True" />
                                            <RegularExpression ErrorText="Invalid First Name" ValidationExpression="[a-zA-Z\s]+" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="" ColSpan="1">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="LastNameText" runat="server" AutoCompleteType="Disabled" NullText="Last Name" Theme="MaterialCompact" Width="300px" Font-Size="Medium" MaxLength="100" FocusedStyle-Border-BorderColor="#2273e6">
                                        <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                            <RequiredField ErrorText="Last name requried" IsRequired="True" />
                                            <RegularExpression ErrorText="Invalid Last Name" ValidationExpression="[a-zA-Z\s]+" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="" ColSpan="1">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="PhoneNumberTxt" runat="server" AutoCompleteType="Disabled" NullText="Phone Number" Theme="MaterialCompact" Width="300px" Font-Size="Medium" MaxLength="12" FocusedStyle-Border-BorderColor="#2273e6">
                                        <MaskSettings Mask="000-000-0000" IncludeLiterals="None" ErrorText="Phone number required" />
                                        <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                            <RequiredField ErrorText="Phone number required" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>

                    <ParentContainerStyle Font-Size="Medium"></ParentContainerStyle>
                </dx:LayoutGroup>
                <dx:LayoutGroup Caption="Address" ColCount="1" ColSpan="1" ParentContainerStyle-Font-Size="Medium">
                    <Items>
                        <dx:LayoutItem Caption="" ColSpan="1">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="Address1Txt" runat="server" AutoCompleteType="Disabled" NullText="Address1" Theme="MaterialCompact" Width="300px" Font-Size="Medium" MaxLength="100" FocusedStyle-Border-BorderColor="#2273e6">
                                        <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                            <RequiredField ErrorText="Address1 required" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="" ColSpan="1">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="Address2Txt" runat="server" AutoCompleteType="Disabled" Theme="MaterialCompact" Width="300px" NullText="Address2" Font-Size="Medium" MaxLength="100" FocusedStyle-Border-BorderColor="#2273e6">
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="" ColSpan="1">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="CityTxt" runat="server" AutoCompleteType="Disabled" Theme="MaterialCompact" Width="300px" NullText="City" Font-Size="Medium" MaxLength="100" FocusedStyle-Border-BorderColor="#2273e6">
                                        <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                            <RequiredField ErrorText="City requried" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ColSpan="1" Caption="">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="StateCombo" runat="server" AutoPostBack="false" NullText="State" Width="300" Theme="MaterialCompact" DropDownWidth="300" Font-Size="Medium" MaxLength="2" FocusedStyle-Border-BorderColor="#2273e6">
                                        <Items>
                                            <dx:ListEditItem Value="AL" />
                                            <dx:ListEditItem Value="AK" />
                                            <dx:ListEditItem Value="AZ" />
                                            <dx:ListEditItem Value="AR" />
                                            <dx:ListEditItem Value="CA" />
                                            <dx:ListEditItem Value="CO" />
                                            <dx:ListEditItem Value="CT" />
                                            <dx:ListEditItem Value="DE" />
                                            <dx:ListEditItem Value="FL" />
                                            <dx:ListEditItem Value="GA" />
                                            <dx:ListEditItem Value="HI" />
                                            <dx:ListEditItem Value="ID" />
                                            <dx:ListEditItem Value="IL" />
                                            <dx:ListEditItem Value="IN" />
                                            <dx:ListEditItem Value="IA" />
                                            <dx:ListEditItem Value="KS" />
                                            <dx:ListEditItem Value="KY" />
                                            <dx:ListEditItem Value="LA" />
                                            <dx:ListEditItem Value="ME" />
                                            <dx:ListEditItem Value="MD" />
                                            <dx:ListEditItem Value="MA" />
                                            <dx:ListEditItem Value="MI" />
                                            <dx:ListEditItem Value="MN" />
                                            <dx:ListEditItem Value="MS" />
                                            <dx:ListEditItem Value="MO" />
                                            <dx:ListEditItem Value="MT" />
                                            <dx:ListEditItem Value="NE" />
                                            <dx:ListEditItem Value="NV" />
                                            <dx:ListEditItem Value="NH" />
                                            <dx:ListEditItem Value="NJ" />
                                            <dx:ListEditItem Value="NM" />
                                            <dx:ListEditItem Value="NY" />
                                            <dx:ListEditItem Value="NC" />
                                            <dx:ListEditItem Value="ND" />
                                            <dx:ListEditItem Value="OH" />
                                            <dx:ListEditItem Value="OK" />
                                            <dx:ListEditItem Value="OR" />
                                            <dx:ListEditItem Value="PA" />
                                            <dx:ListEditItem Value="RI" />
                                            <dx:ListEditItem Value="SC" />
                                            <dx:ListEditItem Value="SD" />
                                            <dx:ListEditItem Value="TN" />
                                            <dx:ListEditItem Value="TX" />
                                            <dx:ListEditItem Value="UT" />
                                            <dx:ListEditItem Value="VT" />
                                            <dx:ListEditItem Value="VA" />
                                            <dx:ListEditItem Value="WA" />
                                            <dx:ListEditItem Value="WV" />
                                            <dx:ListEditItem Value="WI" />
                                            <dx:ListEditItem Value="WY" />
                                            <dx:ListEditItem Value="AS" />
                                            <dx:ListEditItem Value="DC" />
                                            <dx:ListEditItem Value="FM" />
                                            <dx:ListEditItem Value="GU" />
                                            <dx:ListEditItem Value="MH" />
                                            <dx:ListEditItem Value="MP" />
                                            <dx:ListEditItem Value="PW" />
                                            <dx:ListEditItem Value="PR" />
                                            <dx:ListEditItem Value="VI" />
                                        </Items>
                                        <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                            <RequiredField ErrorText="State required" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="" ColSpan="1">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="ZipTxt" runat="server" Theme="MaterialCompact" AutoCompleteType="Disabled" Width="300px" NullText="Zip" Font-Size="Medium" MaxLength="5" FocusedStyle-Border-BorderColor="#2273e6">
                                        <MaskSettings Mask="00000" IncludeLiterals="None" ErrorText="Zip code requried" />
                                        <ValidationSettings Display="Dynamic" ErrorTextPosition="Bottom">
                                            <RequiredField ErrorText="Zip code requried" IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>

                    <ParentContainerStyle Font-Size="Medium"></ParentContainerStyle>
                </dx:LayoutGroup>
                <dx:LayoutItem Caption="" ColSpan="1">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxButton ID="RegisterButton" runat="server"
                                ClientInstanceName="RegisterButton"
                                CssClass="mega-button-link mega-menu-item mega-menu-item-type-custom mega-menu-item-object-custom mega-align-bottom-left mega-menu-flyout mega-menu-item-854 button-link mega-menu-link"
                                Theme="MaterialCompact" Width="320px" Text="Submit" OnClick="RegisterButton_Click" HorizontalAlign="Center">
                                
                                <%-- Prevent double clicking --%>    
                                <ClientSideEvents Init="function(s,e)
                                                        { 
                                                            s.SetEnabled(true); 
                                                        }" 
                                                  Click="function(s,e)
                                                        { 
                                                            if(ASPxClientEdit.ValidateGroup(null)) 
                                                            { 
                                                                window.setTimeout(function(){s.SetEnabled(false);},0) 
                                                            } 
                                                        }" />
                            </dx:ASPxButton>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
        </dx:ASPxFormLayout>

        <font face="verdana">Already have an account?</font>
        <a href="login.aspx"><span class="underlined-text animated-underline">Sign In</span></a>
    </div>

</asp:Content>