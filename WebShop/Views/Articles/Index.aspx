<%@ Page Title="" Language="C#" MasterPageFile="~/Views/ViewMasterPage1.Master"
    Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="JavaScript/jquery-1.3.2.min.js"></script>
    <link href="../../Style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(
        function GetBooks() {
            $('#LblPageIndex').text(1);
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
        });
        $(document).ready(
            function GetBooksInCart() {
                $.ajax({
                    url: '/Articles/GetCartBooksCount',
                    success: function (data) {
                        $('#LblCartBooks').text(data);
                    },
                    error: function (x, y, z) {
                        alert(x + '\n' + y + '\n' + z);
                    }
                });
            }
            );
        $(document).ready(
           function GetPagesCount() {
               document.getElementById('LblPagesCount').style.display = 'none';
               $.ajax({
                   url: '/Articles/GetPagesCount',
                   success: function (data) {
                       $('#LblPagesCount').text(data);
                   },
                   error: function (x, y, z) {
                       alert(x + '\n' + y + '\n' + z);
                   }
               });
           }
           );
        function GetPrevious() {
            var id = Number($('#LblPageIndex').text());
            id = id - 1;
            if (id > 0) {
                $('#LblPageIndex').text(id);
                $.ajax({
                    url: 'api/pagination/' + id,
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
        }
        function GetNext() {
            var PagesCount = Number($('#LblPagesCount').text());
            var id = Number($('#LblPageIndex').text());
            id = id + 1;
            if (id <= PagesCount) {
                $('#LblPageIndex').text(id);
                $.ajax({
                    url: 'api/pagination/' + id,
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
        }
        function ShowPopUp(id) {
            $.ajax({
                url: 'api/bookapi/' + id,
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    SetPopUpData(data);
                }
            });
        }
        function AddToCart(id) {
            $.ajax({
                url: 'api/bookapi/' + id,
                type: 'Post',
                dataType: 'json',
                success: function () {
                    var Count = Number($('#LblCartBooks').text());
                    Count = Count + 1;
                    $('#LblCartBooks').text(Count);
                }
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
            $("#PopupDiv").html(data);
            $("#PopupDiv").css("display", "block");
        }
        function CloseWindow() {
            $("#PopupDiv").css("display", "none");
        }
        function WriteResponse(Books) {
            var strResult = "<table><th>Book Title</th><th>Book Author</th><th>Book Price</th>";
            $.each(Books, function (index, Book) {
                strResult += "<tr><td><a style=\"border-bottom: 1px solid Black;\" id =" + Book.BookID + " onclick='ShowPopUp(this.id)'>"
                    + Book.Title + "</a>" + "</td><td> " + Book.Author + "</td><td>" + Book.Price + "</td>" +
                "<td><a style=\"color: red; text-decoration: none; border-bottom: 1px solid Red;\" id =" + Book.BookID + " onclick='AddToCart(this.id)'>Add To Cart</a></td></tr>";
            });
            strResult += "</table>";
            $("#divResult").html(strResult);
        }
    </script>
    <h2>Articles</h2>
    Number Of Books In The Cart:
    <label id="LblCartBooks"></label>
     <label id="LblPagesCount"></label>
    <div id="PopupDiv" style="background-color: white; position: fixed; left:20%; top:40%; display: none; border:thin;"></div>
    <div id="divResult"></div>
    <br />
    <button onclick="GetPrevious();return false;">Previous</button>
    <label id="LblPageIndex"></label>
    <button onclick="GetNext();return false;">Next</button>
</asp:Content>
