﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Foodie.User.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>
    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgUser.ClientID%>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>User Registration</h2>"></asp:Label>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                            
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Name is required" ControlToValidate="txtName"
                                 ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revName" runat="server" ErrorMessage="Name nust be in characters only"
                                 ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[a-zA-Z\s]+$" 
                                 ControlToValidate="txtName"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter Full name"
                                 ToolTip="Full Name"></asp:TextBox>
                        </div>
                        <div>
                            
                            <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Username is required" ControlToValidate="txtUsername"
                                 ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"
                                 ToolTip="Username"></asp:TextBox>
                        </div>
                         <div>
                            
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is required" ControlToValidate="txtEmail"
                                 ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                             <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter Email"
                                 ToolTip="Email" TextMode="Email"></asp:TextBox>
                        </div>
                        <div>
                            
                            <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ErrorMessage="Mobile Number is required" 
                                ControlToValidate="txtMobile" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revMobile" runat="server" ErrorMessage="Mobile Number must have 10 digits only"
                                 ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{10}$" 
                                 ControlToValidate="txtMobile"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control" placeholder="Enter Mobile Number"
                                 ToolTip="Mobile Number" TextMode="Number"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form_container">
                       
                        <div>
                            
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Address is required" ControlToValidate="txtAddress"
                                 ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter Address" TextMode="MultiLine"
                                 ToolTip="Address"></asp:TextBox>
                        </div>
                        <div>
                            
                            <asp:RequiredFieldValidator ID="rfvPostcode" runat="server" ErrorMessage="Postcode is required" ControlToValidate="txtPostcode"
                                 ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revPostcode" runat="server" ErrorMessage="txtPostcode must be of 6 digits only"
                                 ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationExpression="^[0-9]{6}$" 
                                 ControlToValidate="txtPostcode"></asp:RegularExpressionValidator>
                            <asp:TextBox ID="txtPostcode" runat="server" CssClass="form-control" placeholder="Enter Post/zip code"
                                 ToolTip="Post/zip code" TextMode="Number"></asp:TextBox>
                        </div>
                         <div>
                            <asp:FileUpload ID="fuUserImage" runat="server" CssClass="form-control" ToolTip="User Image"
                                onChange="ImagePreview(this);" />
                        </div>
                        <div>
                            
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is required" 
                                ControlToValidate="txtPassword" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password"
                                 ToolTip="Password" TextMode="Password"></asp:TextBox>
                            
                        </div>

                    </div>
                </div>

                <div class="row pl-4">
                    <div class="btn-box">
                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" OnClick="btnRegister_Click" />

                        <asp:Label ID="lblAlreadyUser" runat="server" CssClass="pl-3 text-black-100"
                             Text="Already register? <a href='Login.aspx' class='badge badge-info'>Login here..</a>"></asp:Label>

                    </div>
                </div>
                <div class="row p-5">
                    <div style="align-items:center">
                        <asp:Image ID="imgUser" runat="server" CssClass="img-thumbnail" />
                    </div>
                </div>

            </div>

        </div>

    </section>

</asp:Content>
