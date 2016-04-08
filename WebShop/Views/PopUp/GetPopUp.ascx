<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>

<%string Title = ViewData["Title"].ToString();
  string Author = ViewData["Author"].ToString();
  string Genre = ViewData["Genre"].ToString();
  string Price = ViewData["Price"].ToString();
  string PublishDate = ViewData["PublishDate"].ToString();
  string Description = ViewData["Description"].ToString();
  string Vat = ViewData["Vat"].ToString(); %>

<table>
    <tr>
        <td>Book Title</td>
        <td>
            "<%= Title %>"</td>
    </tr>
    <tr>
        <td>Book Author :</td>
        <td>
            "<%= Author %>"</td>
    </tr>
    <tr>
        <td>Book Genre :</td>
        <td>
            "<%= Genre %>"</td>
    </tr>
    <tr>
        <td>Book Price :</td>
        <td>
            "<%= Price %>"</td>
    </tr>
    <tr>
        <td>Publish Date :</td>
        <td>
            "<%= PublishDate %>"</td>
    </tr>
    <tr>
        <td>Description :</td>
        <td>
            "<%= Description %>"</td>
    </tr>
    <tr>
        <td>Vat Percentage :</td>
        <td>
            "<%= Vat %>"</td>
    </tr>
</table>
<p>
    <button onclick="CloseWindow();return false;">Close</button>
</p>
