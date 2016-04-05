<%@ Page Title="" Language="C#" MasterPageFile="~/Views/ViewMasterPage1.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="JavaScript/jquery-1.3.2.min.js"></script>
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
        function ShowPopUp(id)
        {
            $.ajax({

                url: 'api/bookapi/' + id,
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    alert(JSON.stringify(data));
                },
                error: function (x, y, z) {
                    alert(x + '\n' + y + '\n' + z);
                }
            });
        }
        function WriteResponse(Books) {
            var strResult = "<table><th>Book Title</th><th>Book Author</th><th>Book Price</th>";
            $.each(Books, function (index, Book) {
                strResult += "<tr><td><a id ="+Book.BookID+" onclick='ShowPopUp(this.id)'>"+Book.Title+"</a>" + "</td><td> " + Book.Author + "</td><td>" + Book.Price + "</td></tr>";
            });
            strResult += "</table>";
            $("#divResult").html(strResult);

        }
    </script>
    <h2>Articles</h2>
    
    <ol class="round">
        <li>
            <div id="divResult"></div>

        </li>
    </ol>
    <div id="PopUpWindow" class="Popup"></div>
    <button onclick="GetBooks();return false;">Get All Books</button>
</asp:Content>
