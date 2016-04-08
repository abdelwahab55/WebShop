<%@ Page Title="" Language="C#" MasterPageFile="~/Views/ViewMasterPage1.Master"
    Inherits="System.Web.Mvc.ViewPage<IEnumerable<WebShop.Models.Books>>" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%string TotalPrice = ViewData["TotalPrice"].ToString();
      string TotalVAT = ViewData["TotalVAT"].ToString();
      string TotalFinalPrice = ViewData["TotalFinalPrice"].ToString();%>
    <script type="text/javascript" src="JavaScript/jquery-1.3.2.min.js"></script>
    <script type="text/javascript">
        function IsEmail(email) {
            var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            return regex.test(email);
        }
        function CheckOutFunc() {
            var Error = 0;
            var FirstName = $('#TxtFirstName').val();
            var LastName = $('#TxtLastName').val();
            var HouseNumber = $('#TxtHouseNo').val();
            var Address = $('#TxtAddress').val();
            var ZipCode = $('#TxtZipCode').val();
            var City = $('#TxtCity').val();
            var Email = $('#TxtEmail').val();
            $('#ValidatorFirstName').text('');
            $('#ValidatorLastName').text('');
            $('#ValidatorHouseNo').text('');
            $('#ValidatorAddress').text('');
            $('#ValidatorZipCode').text('');
            $('#ValidatorCity').text('');
            $('#ValidatorEmail').text('');
            if ($('#TxtFirstName').val() == '') {
                Error = 1;
                $('#ValidatorFirstName').text('*');
            }
            if ($('#TxtLastName').val() == '') {
                Error = 1;
                $('#ValidatorLastName').text('*');
            }
            if ($('#TxtHouseNo').val() == '') {
                Error = 1;
                $('#ValidatorHouseNo').text('*');
            }
            if ($('#TxtAddress').val() == '') {
                Error = 1;
                $('#ValidatorAddress').text('*');
            }
            if ($('#TxtZipCode').val() == '') {
                Error = 1;
                $('#ValidatorZipCode').text('*');
            }
            if ($('#TxtCity').val() == '') {
                Error = 1;
                $('#ValidatorCity').text('*');
            }
            var EmailCheck = IsEmail(Email);
            if (EmailCheck == false) {
                Error = 1;
                $('#ValidatorEmail').text('This field must contain email');
            }
            if (Error == 0) {
                var Customer = {};
                Customer.FirstName = FirstName;
                Customer.LastName = LastName;
                Customer.HouseNumber = HouseNumber;
                Customer.Address = Address;
                Customer.City = City;
                Customer.ZipCode = ZipCode;
                Customer.Email = Email;

                $.post('api/orderapi/a', Customer, function (data) {
                    if (data == "false") {
                        alert("There Are No Records In This Cart");
                    }
                    else {
                        DivRegistration.innerHTML = "";
                        ThanksMessage.innerHTML = "<h2>Thanks For Visiting Our Web Site</h2>";
                    }
                },JSON);
                    

            }
        }


    </script>
    <div id="DivRegistration">
        <h2>Check Out Registeration</h2>

        <table style="width: 455px">
            <tr>
                <th style="width: 27px">
                    <%: Html.DisplayNameFor(model => model.Title) %>       
                </th>
                <th style="width: 30px">
                    <%: Html.DisplayNameFor(model => model.Author) %>
                </th>
                <th style="width: 28px">
                    <%: Html.DisplayNameFor(model => model.Price) %>
                </th>
                <th style="width: 26px">
                    <%: Html.DisplayNameFor(model => model.VatPercentage) %>
                </th>
            </tr>

            <% foreach (var item in Model)
               { %>
            <tr>
                <td style="width: 27px">
                    <%: Html.DisplayFor(modelItem => item.Title) %>            
                </td>
                <td style="width: 30px">
                    <%: Html.DisplayFor(modelItem => item.Author) %>
                </td>
                <td style="width: 28px">
                    <%: Html.DisplayFor(modelItem => item.Price) %>
                </td>
                <td style="width: 26px">
                    <%: Html.DisplayFor(modelItem => item.VatPercentage) %>
                </td>
            </tr>
            <% } %>
        </table>
        <br />
        <table>
            <tr>
                <td>Total Price :</td>
                <td>"<%= TotalPrice %>"</td>
                <td>Total Vat :</td>
                <td>"<%= TotalVAT %>"</td>
                <td>Total Final Price :</td>
                <td>"<%= TotalFinalPrice %>"</td>
            </tr>
        </table>
        <br />
        <table>
            <tr>
                <td>First Name :</td>
                <td style="width: 137px">
                    <input type='text' id='TxtFirstName' />
                    <label id="ValidatorFirstName"></label>
                </td>
                <td>Last Name :</td>
                <td>
                    <input type='text' id='TxtLastName' />
                    <label id="ValidatorLastName"></label>
                </td>
            </tr>
            <tr>
                <td>House No :</td>
                <td style="width: 137px">
                    <input type='text' id='TxtHouseNo' />
                    <label id="ValidatorHouseNo"></label>
                </td>
                <td>Address :</td>
                <td>
                    <input type='text' id='TxtAddress' />
                    <label id="ValidatorAddress"></label>
                </td>
            </tr>
            <tr>
                <td>City :</td>
                <td style="width: 137px">
                    <input type='text' id='TxtCity' />
                    <label id="ValidatorCity"></label>
                </td>
                <td>Zip Code :</td>
                <td>
                    <input type='text' id='TxtZipCode' />
                    <label id="ValidatorZipCode"></label>
                </td>
            </tr>
            <tr>
                <td>Email :</td>
                <td style="width: 137px">
                    <input type='text' id='TxtEmail' />
                    <label id="ValidatorEmail"></label>
                </td>
            </tr>
        </table>
        <button onclick="CheckOutFunc();return false;">Check Out</button>
    </div>
    <div id="ThanksMessage">
    </div>
</asp:Content>
