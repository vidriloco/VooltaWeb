//= require concerns/extensions

$(document).on('rails_admin.dom_ready', function(){ 
	
	if($.isDefined('#content_kind')) {
		$('#content_kind').on('change', function() {
			var value = $(this).text();
			$('.control-group').hide();
			
			if(value == "paragraph") {
				$('#content_content_field').fadeIn();
			} else if(value == "webview") {
				$('#content_html_string_field').fadeIn();
			} else if(value == "poi_table") {
				$('#content_table_title_field').fadeIn();
			} else if(value == "photograph") {
				$('#content_full_width_field').fadeIn();
				$('#content_caption_field').fadeIn();
				$('#content_image_id_field').fadeIn();
				$('#content_image_height_field').fadeIn();
			} else if(value == "legend") {
				$('#content_title_field').fadeIn();
				$('#content_subtitle_field').fadeIn();
				$('#content_details_field').fadeIn();
				$('#content_image_id_field').fadeIn();
			}
			
			$('#content_order_field').fadeIn();
			$('#content_kind_field').fadeIn();
			$('#content_contentable_id_field').fadeIn();
		});
	}
	
	if($.isDefined('#poi_mode_field')) {
		$('#poi_mode').on('change', function() {
			var value = $(this).text();
			alert(value);
			$('.control-group').hide();
			if(value == "slide_based") {
				$('#poi_image_id_field').fadeIn();
				$('#poi_details_field').fadeIn();
			} else if(value == "small" || value == "normal") {
				$('#poi_poi_category_id_field').fadeIn();
				$('#poi_poi_kind_id_field').fadeIn();

				if(value == "normal") {
					$('#poi_image_id_field').fadeIn();
				} else {
					$('#poi_details_field').fadeIn();
				}
			} 

			$('#poi_published_field').fadeIn();
			$('#poi_listed_field').fadeIn();
			$('#poi_sponsored_field').fadeIn();
			$('#poi_title_field').fadeIn();

			$('#poi_trip_id_field').fadeIn();
			$('#poi_mode_field').fadeIn();
			$('#poi_lat_field').fadeIn();
			$('#poi_lon_field').fadeIn();
		});

		
	}
});