<%@ Page Title="" Language="C#" MasterPageFile="~/Views/ViewMasterPage1.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript" src="JavaScript/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="../../js/webshop.js"></script>
    <h2>Articles</h2>
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Book ID :"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TxtProductID" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Book Title :"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TxtBooktitle" runat="server"></asp:TextBox></td>

                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Book Author :"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TxtBookAuthor" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="Book Genre :"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TxtBookGenre" runat="server"></asp:TextBox></td>

                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Book Price :"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TxtBookPrice" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Vat Percentage :"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TxtVat" runat="server"></asp:TextBox></td>

                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Publish Date :"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TxtPublishDate" runat="server"></asp:TextBox></td>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="Product Description :"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="TxtDescription" runat="server" TextMode="MultiLine"></asp:TextBox></td>

                </tr>
            </table>
            
        </ItemTemplate>


    </asp:Repeater>
    <button onclick="GetBooks();return false;">Get All Books</button>
</asp:Content>
