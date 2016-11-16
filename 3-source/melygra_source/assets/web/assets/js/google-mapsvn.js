// Defining variables that need to be available to some functions
var map1, infoWindow1;
var map2, infoWindow2;
var rendererOptions = {
    draggable: true
};
var rendererOptions2 = {
    draggable: true
};
var directionsDisplay1;
var directionsDisplay2;
var directionsService1 = new google.maps.DirectionsService();
var directionsService2 = new google.maps.DirectionsService();
//Thay dia chi web
var endAddress1 = "20.983820, 105.842992";
//Thay toa do
var lat1 = 20.983820, long1 = 105.842992;
//Thay dia chi web
var endAddress2 = "10.777146, 106.637529";
//Thay toa do
var lat2 = 10.777146, long2 = 106.637529;
window.onload = function () {
    //init direction
    directionsDisplay1 = new google.maps.DirectionsRenderer(rendererOptions);
    directionsDisplay2 = new google.maps.DirectionsRenderer(rendererOptions2);
    // Creating a map
    var options1 = {
        zoom: 17,
        center: new google.maps.LatLng(lat1, long1),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    var options2 = {
        zoom: 18,
        center: new google.maps.LatLng(lat2, long2),
        mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    map1 = new google.maps.Map(document.getElementById('map1'), options1);
    map2 = new google.maps.Map(document.getElementById('map2'), options2);


    // Adding a marker
    var marker1 = new google.maps.Marker({
        position: new google.maps.LatLng(lat1, long1),
        map: map1,
        title: 'Click me'
    });
    // Adding a marker


    google.maps.event.addListener(marker1, 'click', function () {

        // Check to see if an InfoWindow already exists
        if (!infoWindow1) {
            infoWindow1 = new google.maps.InfoWindow();
        }

        // Creating the content  
        var content1 = '<div class="box">' +
            '<h2>CÔNG TY CỔ PHẦN DƯỢC PHẨM VINACARE</h2>' +
            '<p><strong>Địa chỉ:</strong> Số 18, ngách 19/15 Kim Đồng, Thành phố Hà Nội</p>' +
            '<p><strong>Điện thoại :</strong> (04) 3664 9263 <strong>Fax :</strong> (04) 3664 92635</p>' +
            '</div>';

        // Setting the content of the InfoWindow
        infoWindow1.setContent(content1);

        // Opening the InfoWindow
        infoWindow1.open(map1, marker1);

    });

            //HUNG -- Cho điểm thứ 2
    var marker2 = new google.maps.Marker({
                position: new google.maps.LatLng(lat2, long2),
                map: map2,
                title: 'Click me'
            });

            google.maps.event.addListener(marker2, 'click', function () {

//                 Check to see if an InfoWindow already exists
                if (!infoWindow2) {
                    infoWindow2 = new google.maps.InfoWindow();
                }

//                 Creating the content  
                var content2 = '<div class="box">' +
                '<h2>CÔNG TY CỔ PHẦN O2PHARM</h2>' +
                '<p><strong>Địa chỉ:</strong> 312/10/15 Trịnh Đình Trọng, P. Hòa Thạnh, Q. Tân Phú, Tp. Hồ Chí Minh</p>' +
                '<p><strong>Điện thoại :</strong> (08) 3976 0728 - (08) 3976 0729 <strong>Fax :</strong> (08) 3976 0730</p>' +
                '</div>';

//                 Setting the content of the InfoWindow
                infoWindow2.setContent(content2);

//                 Opening the InfoWindow
                infoWindow2.open(map2, marker2);

            });
//            //HUNG-END -- Cho điểm thứ 2


    // Hiển thị thông tin
    google.maps.event.trigger(marker1, 'click');

    directionsDisplay1.setMap(map1);
    directionsDisplay1.setPanel(document.getElementById("directionsPanel1"));

    // Hiển thị thông tin
    google.maps.event.trigger(marker2, 'click');

    directionsDisplay2.setMap(map2);
    directionsDisplay2.setPanel(document.getElementById("directionsPanel2"));

};

function calcRoute() {
    var start = document.getElementById("start1").value;
    var end = endAddress1;
    var request = {
        origin: start,
        destination: end,
        travelMode: google.maps.DirectionsTravelMode.WALKING
        //travelMode: google.maps.DirectionsTravelMode.BICYCLING
        //travelMode: google.maps.DirectionsTravelMode.DRIVING
    };
    directionsService1.route(request, function (response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay1.setDirections(response);
        }
    });
}
function calcRoute2() {
    var start2 = document.getElementById("start2").value;
    var end2 = endAddress2;
    var request2 = {
        origin: start2,
        destination: end2,
        travelMode: google.maps.DirectionsTravelMode.WALKING
        //travelMode: google.maps.DirectionsTravelMode.BICYCLING
        //travelMode: google.maps.DirectionsTravelMode.DRIVING
    };
    directionsService2.route(request2, function (response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay2.setDirections(response);
        }
    });
}