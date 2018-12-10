<%@ Page Title="Contact"  MasterPageFile="~/Site.Master" Language="C#"AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  
    <h3>Where are we Located?</h3>
    <!--The div element for the map -->
    <div id="map"></div>
    <script>
// Initialize and add the map
        function initMap() {
            var contentString = '<div id="content">' +
                '<div id="siteNotice">' +
                '</div>' +
                '<h1 id="firstHeading" class="firstHeading">Robs Card Shop!</h1>' +
                '<div id="bodyContent">' +
                '<p><b>Robs Cards</b>: a great place to get cards from multiple diffrent game!' + 'Phone Number: 570 555 555' + 'Address: 233 Prospect St East Stroudsburg, PA 18301'+'</p >'+
                '</div>' +
                '</div>';

            var infowindow = new google.maps.InfoWindow({
                content: contentString
            });
  // The location of Uluru
    var uluru = { lat: 40.994130, lng: -75.176833};
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 16, center: uluru});
  // The marker, positioned at Uluru
        var marker = new google.maps.Marker({ position: uluru, map: map, title: "Robs Cards!" });
        marker.addListener('click', function () {
            infowindow.open(map, marker);
        });
}
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDLk2GKWyKmPICuSKYXKlrkMsPuczInKhc&callback=initMap">
    </script>
  
</asp:Content>