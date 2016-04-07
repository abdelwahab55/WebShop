<%@ Page Title="" Language="C#" MasterPageFile="~/Views/ViewMasterPage1.Master" 
    Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="JavaScript/jquery-1.3.2.min.js"></script>
    <link href="../../Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function GetBooks() {
            $.ajax({
                url: '<%= Url.Action("bookapi", "api") %>',
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    WriteResponse(data);
                },
                error: function (x, y, z) {
                    alert(x + '\n' + y + '\n' + z);
                }
            });
        }
        function ShowPopUp(id) {
            $.ajax({

                url: 'api/bookapi/' + id,
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    SetPopUpData(data);
                },
                error: function (x, y, z) {
                    alert(x + '\n' + y + '\n' + z);
                }
            });
        }
        function AddToCart(id) {
            $.ajax({

                url: 'api/bookapi/' + id,
                type: 'Post',
                dataType: 'json'
            });
        }
        function SetPopUpData(book) {
            $.get('<%= Url.Content("~/PopUp/GetPopUp") %>', {
                Title: book.Title,
                Author: book.Author,
                Genre: book.Genre,
                Price: book.Price,
                PublishDate: book.PublishDate,
                Description: book.Description,
                Vat: book.VatPercentage
            }, setData);
        }
        function setData(data) {
            // putting the data to the pop up div
            $("#PopupDiv").html(data);
            // viewing the div as block
            $("#PopupDiv").css("display", "block");
        }
        function CloseWindow() {
            $("#PopupDiv").css("display", "none");
        }
        function WriteResponse(Books) {
            var strResult = "<table><th>Book Title</th><th>Book Author</th><th>Book Price</th>";
            $.each(Books, function (index, Book) {
                strResult += "<tr><td><a id =" + Book.BookID + " onclick='ShowPopUp(this.id)'>"
                    + Book.Title + "</a>" + "</td><td> " + Book.Author + "</td><td>" + Book.Price + "</td>" +
                "<td><a id =" + Book.BookID + " onclick='AddToCart(this.id)'>Add To Cart</a></td></tr>";
            });
            strResult += "</table>";
            $("#divResult").html(strResult);

        }
    </script>
    <h2>Articles</h2>
    <div id="PopupDiv" class="Popup" style="background-color: white;"></div>
    <ol class="round">
        <li>
            <div id="divResult"></div>

        </li>
    </ol>
    <button onclick="GetBooks();return false;">Get All Books</button>
</asp:Content>
