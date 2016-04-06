<%@ Page Title="" Language="C#" MasterPageFile="~/Views/ViewMasterPage1.Master"
    Inherits="System.Web.Mvc.ViewPage<IEnumerable<WebShop.Models.Books>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%string TotalPrice = ViewData["TotalPrice"].ToString();
      string TotalVAT = ViewData["TotalVAT"].ToString();
      string TotalFinalPrice = ViewData["TotalFinalPrice"].ToString();%>
    <h2>Cart</h2>
    <table>
        <tr>
            <th>
                <%: Html.DisplayNameFor(model => model.Title) %>       
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.Author) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.Price) %>
            </th>
            <th>
                <%: Html.DisplayNameFor(model => model.VatPercentage) %>
            </th>
        </tr>

        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: Html.DisplayFor(modelItem => item.Title) %>            
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Author) %>
            </td>
            <td>
                <%: Html.DisplayFor(modelItem => item.Price) %>
            </td>
            <td>
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
</asp:Content>
