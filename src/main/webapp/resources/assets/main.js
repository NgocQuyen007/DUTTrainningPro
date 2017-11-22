$(document).ready(function() {
	//for add muc tieu hoc phan
	
	// get standard row
	$stdRow = $("#standard-row").html();
	$countRow = 1;
	$("#add-row").on("click", function(event) {
		$countRow++;
		$('tbody').append('<tr></tr>');
        $newElement = $('tbody tr:last-child');
        $newElement.append($stdRow);
        $newElement.find("#delete-row").removeClass("hidden").click(function(event) {
        	$(this).parents(':eq(1)').remove();
        	$countRow--;
            $("tbody").children("tr").each(function(index) {
            	$("tbody").children().eq(index).find("#muc-tieu").val("G" + (index + 1));
            	$("tbody").children().eq(index).find("#cdr").attr('name', 'chuanDauRa' + (index));
            })
        });
        $("tbody").children("tr").each(function(index) {
        	$("tbody").children().eq(index).find("#muc-tieu").val("G" + (index + 1));
        	$("tbody").children().eq(index).find("#cdr").attr('name', 'chuanDauRa' + (index));
        })
	})
	
	$("#default-wizard").submit(function() {
		$('<input />').attr('type', 'hidden')
        .attr('name', "countRow")
        .attr('value', $countRow)
        .appendTo('#default-wizard');
		return true;
	})
})