$("body").delegate(".get_form","click",function(e){
	e.preventDefault();
	var url = $(this).attr("href");
  var name = $(this).text();
var data = "name="+name;
	$.post(url,data,function(ress){
		$(".form_place").html(ress);
	})
})
$("body").delegate(".form_data","submit",function(e){
	e.preventDefault();
	var url = $(this).attr('action');
var frm = $(this);
	$.ajax({
		url: url,
		data: new FormData(this),
		type: "POST",
		contentType: false,
  	     processData: false,
		success: function(ress){
		var response = ress.split("|");

		if(frm.hasClass('report')){
             frm.next().html(ress);
		}else{
		$(".response").html(`<button class="btn btn-${response[0]} btn-block">${response[1]}</button>`);
		if($.trim(response[0]) == "success"){
     frm.trigger("reset");
		}

}
			
		}
	})
})

$("body").delegate(".search-info","keyup",function(){
	var text = $(this).val();
	var action = $(this).attr('action');
	var ul = $(this).next();
ul.removeClass("hide");
if(text == ""){
	ul.addClass('hide');
}

var data = "text="+text+"&action="+action;
	$.post("tools/search.php",data,function(ress){
		ul.html(ress);
	})
});

$("body").delegate(".list-data","click",function(){
	var name = $(this).text();
	var id = $(this).attr('id');
	$(this).parent().prev().val(name);
	$(this).parent().next().val(id);
	$(this).parent().addClass('hide');

})

$("body").delegate(".find_name","blur",function(){
	var acc = $(this).val();

	var data = "acc="+acc;
	$.post("tools/find_name.php",data,function(ress){
    $(".set_name").val(ress);
	})
})
  