$(document).ready(function(){
	console.log("hi");
	$('.text2').mouseenter(function(){
		$(this).css('cursor', 'pointer');
		$(this).fadeTo('slow' , 0.5 );
	});

	$('.text2').mouseleave(function(){
		$(this).fadeTo('fast', 1 );
	});

	var form = $('#shortener_forms');
	form.on('submit', function(e){
		e.preventDefault();

		$.ajax({
			url: "/create_url",
			method: "POST" ,
			data: $(this).serialize(),
			dataType: 'JSON' ,
			success: function(data){				//ask about tbody and how it link to json in the index.erb file //
				console.log(data) ; 
				$('tbody').append("<tr class ='notfirst'>\
					<td>"+ data.id +"</td>\
					<td>"+ data.long_url +"</td>\
					<td><a href= '/<%=i.short_url%>' class = 'link'>localhost:9393"+ data.short_url +"</a></td>\
					<td>0</td>\
				</tr> ");

				if (data != undefined){
					$('.check').html("<p>your url has been saved to id : "+ data.id +" </p>")
				}
				else if (data == undefined) {
					$('.check').html("<p>the url cannot be blank </p>")
				}
			}
		});
	});
});