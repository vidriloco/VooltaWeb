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
		autoPlay: 3000
	});
	
});