<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calculator.aspx.cs" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<head>
	<style>
		.dropbtn {
			background-color: #3498DB;
			color: white;
			padding: 16px;
			font-size: 16px;
			border: none;
			cursor: pointer;
		}

			.dropbtn:hover, .dropbtn:focus {
				background-color: #2980B9;
			}

		.dropdown {
			position: relative;
			display: inline-block;
		}

		.dropdown-content {
			display: none;
			position: absolute;
			background-color: #f1f1f1;
			min-width: 160px;
			overflow: auto;
			box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
			z-index: 1;
		}

			.dropdown-content a {
				color: black;
				padding: 12px 16px;
				text-decoration: none;
				display: block;
			}

		.dropdown a:hover {
			background-color: #ddd;
		}

		.show {
			display: block;
		}
	</style>
</head>
<body>

	<div style="border: 5px solid blue; margin-left:10px;  margin-bottom:10px; margin-right:100px; padding-left:10px">
		<h1 style="text-align: center">Calculator</h1>
		<div class="dropdown">
			<button  style="text-align: center" onclick="myFunction()" class="dropbtn">Select Product</button>
			<div id="myDropdown" class="dropdown-content">
				<button id="magic" class="dropbtn" onclick="fill('Magic')">Magic The Gathering: Guilds of Ravnica</button>
				<button id="yugioh" class="dropbtn" onclick="fill('YU-Gi-OH')">YU-Gi-OH: Soul Fusion</button>
				<button id="pokemon" class="dropbtn" onclick="fill('Pokemon')">Pokemon: Dragon Majesty Elite Trainer Box</button>
				<button id="forceofwill" class="dropbtn" onclick="fill('Force)">Force of Will: New Dawn</button>
				<button id="dbs" class="dropbtn" onclick="fill('Dragon')">Dragon Ball Super: Super World Martial Arts Tournament</button>
				<button id="cardfight" class="dropbtn" onclick="fill('CardFight')">CardFight! Vanguard!: EB02</button>
				<button id="WS" class="dropbtn" onclick="fill('Weiss')">Weiss Schwartz: Fate Zero</button>
			</div>
		</div>
		<br />
		<br />
		<br />
		<form id="PriceForm">
			<p>
				<label id="PricelabelID">Price $</label>
				<input id="PriceboxID" type="number" style="margin-left:10px" size="25px" />
			</p>
		</form>
		<form id="QuantityForm">
			<p>
				<label id="QuantitylabelID">Quantity $</label>
				<input id="QuantityboxID" type="number" style="margin-left:10px" size="25px" />
			</p>
		</form>
		<form id="ShippingForm">
			<p>
				<label id="ShippinglabelID">Shipping $</label>
				<input id="ShippingboxID" type="number" style="margin-left:10px" size="25px" />
			</p>
		</form>
		<button onclick="calculate()">Calculate</button>
		<h2 id="total">Total Price:</h2>
	</div>


	<script>
		xmlDoc = loadXMLDoc("Calculator.xml");
		function loadXMLDoc(fname) {
			var xmlDoc;
			xmlhttp = new XMLHttpRequest();
			xmlhttp.open("GET", fname, false);
			xmlhttp.send(null);
			if (xmlhttp.responseXML == null) //(did not load in Chrome), Chrome does not give specific errors
			{
				alert("Bad XML");
				return -1;
			}
			xmlDoc = xmlhttp.responseXML.documentElement;
			//if not ie, at least for syntax errors
			if (xmlDoc.nodeName == "parsererror")	//there are errors (this works in firefox)
			{	//finding out what they are
				alert(xmlDoc.childNodes[0].nodeValue);
				return -1;
			}
			return xmlDoc;
		}

		function calculate() {
			var Shipping = document.getElementById("ShippingboxID").value;
			var Price = document.getElementById("PriceboxID").value;
			var Quanity = document.getElementById("QuantityboxID").value;

			var NumberShipping = Number(Shipping);
			if (ShippingCheck(NumberShipping) == "Error") {
				alert("Error in Shipping: Please enter a positive number");
				return;
			}
			if (ShippingCheck(NumberShipping) == "Format Error") {
				alert("Error in Quanity: Format Error");
				return;
			}

			var NumberPrice = Number(Price);
			if (PriceCheck(NumberPrice) == "Error") {
				alert("Error in Price: Please enter a positive number");
				return;
			}
			if (PriceCheck(NumberPrice) == "Format Error") {
				alert("Error in Price: Format Error");
				return;
			}

			var NumberQuanity = Number(Quanity);
			if (QuanityCheck(NumberQuanity) == "Error") {
				alert("Error in Quanity: Please enter a positive Integer");
				return;
			}
			var total = document.getElementById("total");
			var totalvar = NumberQuanity * NumberPrice + NumberShipping;
			totalvar = totalvar.toFixed(2);
			total.innerHTML = "Total Price: $" + totalvar;

		}

		function PriceCheck(e) {
			if (e <= 0) {
				return ("Error")
			}
			var regex = /(?=.*?\d)^\$?(([1-9]\d{0,2}(,\d{3})*)|\d+)?(\.\d{2})?$/;
			if (!regex.test(e)) {
				return ("Format Error");
			}


		}
		function ShippingCheck(e) {
			if (e <= 0) {
				return ("Error")
			}
			var regex = /(?=.*?\d)^\$?(([1-9]\d{0,2}(,\d{3})*)|\d+)?(\.\d{2})?$/;
			if (!regex.test(e)) {
				return ("Format Error");
			}
		}
		function QuanityCheck(e) {
			if (e <= 0) {
				return ("Error");
			}
			if (!Number.isInteger(e)) {
				return ("Error");
			}
		}

		function myFunction() {
			document.getElementById("myDropdown").classList.toggle("show");
		}
		function fill(str) {
			var Price = document.getElementById("PriceboxID");
			if (str == "Magic") {
				Price.value = xmlDoc.getElementsByTagName("Game")[0].textContent;
			}
			if (str == "YU-Gi-OH") {
				Price.value = xmlDoc.getElementsByTagName("Game")[1].textContent;
			}
			if (str == "Pokemon") {
				Price.value = xmlDoc.getElementsByTagName("Game")[2].textContent;
			}
			if (str == "Force") {
				Price.value = xmlDoc.getElementsByTagName("Game")[3].textContent;
			}
			if (str == "Dragon") {
				Price.value = xmlDoc.getElementsByTagName("Game")[4].textContent;
			}
			if (str == "CardFight") {
				Price.value = xmlDoc.getElementsByTagName("Game")[5].textContent;
			}
			if (str == "Weiss") {
				Price.value = xmlDoc.getElementsByTagName("Game")[6].textContent;
			}
			var dropdowns = document.getElementsByClassName("dropdown-content");
			var i;
			for (i = 0; i < dropdowns.length; i++) {
				var openDropdown = dropdowns[i];
				if (openDropdown.classList.contains('show')) {
					openDropdown.classList.remove('show');
				}
			}
		}
		// Close the dropdown if the user clicks outside of it
		window.onclick = function (event) {
			if (!event.target.matches('.dropbtn')) {

				var dropdowns = document.getElementsByClassName("dropdown-content");
				var i;
				for (i = 0; i < dropdowns.length; i++) {
					var openDropdown = dropdowns[i];
					if (openDropdown.classList.contains('show')) {
						openDropdown.classList.remove('show');
					}
				}
			}
		}
	</script>

</body>
	</asp:Content>