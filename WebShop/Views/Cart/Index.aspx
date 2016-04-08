<%@ Page Title="" Language="C#" MasterPageFile="~/Views/ViewMasterPage1.Master"
    Inherits="System.Web.Mvc.ViewPage<IEnumerable<WebShop.Models.Books>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%string TotalPrice = ViewData["TotalPrice"].ToString();
      string TotalVAT = ViewData["TotalVAT"].ToString();
      string TotalFinalPrice = ViewData["TotalFinalPrice"].ToString();%>
    <h2>Cart</h2>
    <table style="width: 349px">
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
    <%= Html.ActionLink("Check Out", "Index", "Registeration") %>
</asp:Content>
