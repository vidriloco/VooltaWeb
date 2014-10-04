$(document).ready(function() {
	
	$("#phone-carousel").owlCarousel({
		navigation : false, // Show next and prev buttons
		slideSpeed : 500,
		paginationSpeed : 500,
		singleItem:true,
		transitionStyle : "fade",
		autoPlay: 5000
	});
	
	$("#showcase-carousel").owlCarousel({
		navigation : false, // Show next and prev buttons
		slideSpeed : 500,
		pagination: false,
		singleItem: true,
		transitionStyle : "fade",
		autoPlay: 4000
	});
	
	if($.isDefined('#map')) {		
		
		var origin = new google.maps.LatLng(parseFloat($('#trip-origin-lat').val()), parseFloat($('#trip-origin-lon').val()));
		var destination = new google.maps.LatLng(parseFloat($('#trip-final-lat').val()), parseFloat($('#trip-final-lon').val()));
		
	  var mapOptions = {
	    zoom: 12,
	    center: origin
	  };
		
		var map = new google.maps.Map(document.getElementById('map'), mapOptions);
		
		var originMarker = new google.maps.Marker({
		      position: origin,
		      map: map,
		      title: 'Origen',
					icon: 'http://127.0.0.1:3000/assets/start_route_marker.png'
		});
		
		var destinationMarker = new google.maps.Marker({
		      position: destination,
		      map: map,
		      title: 'Destino',
					icon: 'http://127.0.0.1:3000/assets/end_route_marker.png'
		});
	}
	
	$('.edit-field').bind('click', function() {
		var dataForm = $(this).attr('data-form');
		$('#'+dataForm+'-field').hide();
		$('#'+dataForm+'-form').fadeIn();
	});
	
	$('.hide-field').bind('click', function() {
		var dataForm = $(this).attr('data-form');
		$('#'+dataForm+'-field').fadeIn();
		$('#'+dataForm+'-form').fadeOut();
	});
	
	$('.dismissable').bind('click', function() {
		$(this).fadeOut();
	});
	
	if($.isDefined('.notice') || $.isDefined('.alert')) {
		setTimeout(function() {
			$('.dismissable').click();
		}, 4000);
	}
	
	if($.isDefined('#mixpanel')) {
		mixpanel.track("Visit");
	}
});