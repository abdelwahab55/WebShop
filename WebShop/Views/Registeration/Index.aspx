<%@ Page Title="" Language="C#" MasterPageFile="~/Views/ViewMasterPage1.Master"
    Inherits="System.Web.Mvc.ViewPage<IEnumerable<WebShop.Models.Books>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%string TotalPrice = ViewData["TotalPrice"].ToString();
      string TotalVAT = ViewData["TotalVAT"].ToString();
      string TotalFinalPrice = ViewData["TotalFinalPrice"].ToString();%>
    <script type="text/javascript" src="JavaScript/jquery-1.3.2.min.js"></script>
    <script type="text/javascript">
        
        function CheckOutFunc() {
            var FirstName = $("#<%=TxtFirstName.ClientID%>").val();
            var LastName = $("#<%=TxtLastName.ClientID%>").val();
            var HouseNumber = $("#<%=TxtHouseNo.ClientID%>").val();
            var Address = $("#<%=TxtAddress.ClientID%>").val();
            var ZipCode = $("#<%=TxtZipCode.ClientID%>").val();
            var City = $("#<%=TxtCity.ClientID%>").val();
            var Email = $("#<%=TxtEmail.ClientID%>").val();

            var id = FirstName.concat(',',LastName, ',', HouseNumber, ',', Address, ',', City, ',', ZipCode, ',', Email);
            $.ajax({
                url: 'api/orderapi/' + id,
                type: 'Post',
                dataType: 'json'
            });
        }
    </script>
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
    <table>
        <tr>
            <td>Total Price :</td>
            <td>"<%= TotalPrice %>"</td>
            <td>Total Vat :</td>
            <td>"<%= TotalVAT %>"</td>
            <td>Total Final Price</td>
            <td>"<%= TotalFinalPrice %>"</td>
        </tr>
    </table>

    <table>
        <tr>
            <td>First Name :</td>
            <td style="width: 137px">
                <asp:TextBox ID="TxtFirstName" runat="server" ValidationGroup="Required"></asp:TextBox>    
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TxtFirstName" ValidationGroup="Required"></asp:RequiredFieldValidator>
            
            </td>
            <td>Last Name :</td>
            <td>
                <asp:TextBox ID="TxtLastName" runat="server" ValidationGroup="Required"></asp:TextBox>    
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TxtLastName" ValidationGroup="Required"></asp:RequiredFieldValidator>
            
            </td>
        </tr>
        <tr>
            <td>House No :</td>
            <td style="width: 137px">
                <asp:TextBox ID="TxtHouseNo" runat="server" ValidationGroup="Required"></asp:TextBox>    
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TxtHouseNo" ValidationGroup="Required"></asp:RequiredFieldValidator>
            
            </td>
            <td>Address :</td>
            <td>
                <asp:TextBox ID="TxtAddress" runat="server" ValidationGroup="Required"></asp:TextBox>    
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TxtAddress" ValidationGroup="Required"></asp:RequiredFieldValidator>
            
            </td>
        </tr>
        <tr>
            <td>City :</td>
            <td style="width: 137px">
                <asp:TextBox ID="TxtCity" runat="server" ValidationGroup="Required"></asp:TextBox>    
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TxtCity" ValidationGroup="Required"></asp:RequiredFieldValidator>
            
            </td>
            <td>Zip Code :</td>
            <td>
                <asp:TextBox ID="TxtZipCode" runat="server" ValidationGroup="Required"></asp:TextBox>    
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TxtZipCode" ValidationGroup="Required"></asp:RequiredFieldValidator>
            
            </td>
        </tr>
        <tr>
            <td>Email :</td>
            <td style="width: 137px">
                <asp:TextBox ID="TxtEmail" runat="server" TextMode="Email" ValidationGroup="Required"></asp:TextBox>    
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="TxtEmail" ValidationGroup="Required"></asp:RequiredFieldValidator>
            
            </td>
        </tr>
    </table>
    <asp:Button ID="BtnCheckOut" runat="server" Text="Check Out" OnClientClick="CheckOutFunc()" ValidationGroup="Required"/>
</asp:Content>
