$(document).ready(function() {
	$('#new-data').click(function() {
		size = $('#data-forms .data-form').size();

		$.ajax({
			type: "GET",
			url: "/data_form/" + size,
			dataType: "text",
			success: function(data) {
				contents = data;
			},
			async: false
		});
		
		if (contents != "blank")
		{
			var obj = $(contents).hide()
			$('#data-forms').prepend(obj);
			obj.fadeIn();
		}
	});
});