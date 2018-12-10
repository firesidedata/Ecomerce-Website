<%@ Page Language="C#"  MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="MyAccount.aspx.cs" Inherits="Account_Default" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="FormContent">
   
    
	<asp:FormView ID="FormView1" runat="server" DataKeyNames="Id" DataSourceID="SqlDataSource2" CellPadding="10" CellSpacing="10">
		<EditItemTemplate>
			Id:
			<asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
			<br />
			Name:
			<asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
			<br />
			Address:
			<asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
			<br />
			Phone Number:
			<asp:TextBox ID="Phone_NumberTextBox" runat="server" Text='<%# Bind("Phone_Number") %>' />
			<br />
			Email:
			<asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
			<br />
			<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
			&nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
		</EditItemTemplate>
		<InsertItemTemplate>
			Id:
			<asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
			<br />
			Name:
			<asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
			<br />
			Address:
			<asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
			<br />
			Phone Number:
			<asp:TextBox ID="Phone_NumberTextBox" runat="server" Text='<%# Bind("[Phone_Number]") %>' />
			<br />
			Email:
			<asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
			<br />
			<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
			&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
		</InsertItemTemplate>
		<ItemTemplate>
			Id:
			<asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
			<br />
			Name:
			<asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
			<br />
			Address:
			<asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
			<br />
			Phone Number:
			<asp:Label ID="Phone_NumberLabel" runat="server" Text='<%# Bind("[Phone_Number]") %>' />
			<br />
			Email:
			<asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
			<br />
		</ItemTemplate>
	</asp:FormView>
	<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringAccount %>" SelectCommand="SELECT * FROM [User]" UpdateCommand=" Update [User] Set [Name]=@Name WHERE Id=@UserID">
		<SelectParameters><asp:SessionParameter Name="UserID" SessionField="UserID" Type="String"/></SelectParameters>
		<UpdateParameters><asp:SessionParameter Name="UserID" SessionField="UserID" Type="String"/></UpdateParameters>
	</asp:SqlDataSource>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringAccount %>" SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
   
    </asp:Content>