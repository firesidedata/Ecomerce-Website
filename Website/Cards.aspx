<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cards.aspx.cs" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="FormContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CardConnectionString %>" SelectCommand="SELECT DISTINCT [Creator] FROM [Table] ORDER BY [Creator]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:CardConnectionString %>" SelectCommand="SELECT * FROM [Table] WHERE ([ID] = @ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="ID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CardConnectionString %>" SelectCommand="SELECT * FROM [Table] WHERE ([Creator] = @Creator)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="Creator" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
    <div style="padding-left: 10px" >
        
    
          <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="Creator" DataValueField="Creator" AutoPostBack="true">
          </asp:DropDownList>
       
        <br />
        <br />
      </div>
    <div style="align-content:center">
    <div style="float:right; padding-right: 20px">
        <asp:GridView ID="GridView1" runat="server"  AllowSorting="true" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource4" CssClass="grid">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                <asp:BoundField DataField="Game" HeaderText="Game" SortExpression="Game" />
                <asp:BoundField DataField="Paper or Online" HeaderText="Paper or Online" SortExpression="Paper or Online" />
                <asp:BoundField DataField="Creator" HeaderText="Creator" SortExpression="Creator" />
                <asp:BoundField DataField="Set" HeaderText="Set" SortExpression="Set" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            </Columns>

        </asp:GridView>
   </div>
    <div style=" float:right; padding-right: 10px; padding-bottom:20px;" >
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="SqlDataSource5" CssClass="Detail" >
                <Fields>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="Game" HeaderText="Game" SortExpression="Game" />
                    <asp:BoundField DataField="Paper or Online" HeaderText="Paper or Online" SortExpression="Paper or Online" />
                    <asp:BoundField DataField="Creator" HeaderText="Creator" SortExpression="Creator" />
                    <asp:BoundField DataField="Set" HeaderText="Set" SortExpression="Set" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                     <asp:TemplateField HeaderText="Images">
	                        <ItemTemplate>
     	                        <asp:Image Style="float:left"   
         	                        AlternateText="Image Not Available" Runat="Server" height="200px" width="300px"  ImageUrl='<%# ""+ Eval("Images") %>' />
	                        </ItemTemplate>
                    </asp:TemplateField>

                </Fields>
            </asp:DetailsView>
            
    </div>
        </div>
     </ContentTemplate>
    </asp:UpdatePanel>
	</asp:Content>
