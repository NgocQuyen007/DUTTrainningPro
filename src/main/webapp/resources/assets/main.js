$(document).ready(function() {
	//for add muc tieu hoc phan
	
	// get standard row
	$stdRow = $("#standard-row").html();
	$oldRows = $('[id^=old-row]').length;
	$("tbody").children("tr").each(function(index) {
    	$("tbody").children().eq(index).find("#muc-tieu").val("G" + (index + 1));
    	$("tbody").children().eq(index).find("#cdr").attr('name', 'chuanDauRa' + (index - $oldRows));
    })
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
            	$("tbody").children().eq(index).find("#cdr").attr('name', 'chuanDauRa' + (index - $oldRows));
            })
        });
        $("tbody").children("tr").each(function(index) {
        	$("tbody").children().eq(index).find("#muc-tieu").val("G" + (index + 1));
        	$("tbody").children().eq(index).find("#cdr").attr('name', 'chuanDauRa' + (index - $oldRows));
        })
	})
	
	$("#default-wizard").submit(function() {
		$('<input />').attr('type', 'hidden')
        .attr('name', "countRow")
        .attr('value', $countRow)
        .appendTo('#default-wizard');
		return true;
	})
	
	//for edit muc tieu hoc phan
	$("[name=edit-muctieu]").click(function(event) {
		$id = $(this).val();
		$muctieuId = $(this).attr('data-item');
		$parentElement = $(this).parents(':eq(1)');
		showFormEdit($parentElement);
		$parentElement.find("#cancel-muctieu").click(function(e) {
			hideFormEdit($parentElement);
		})
		$parentElement.find("#apply-muctieu").click(function(e) {
			if ($parentElement.find("textarea").val() == "" || $parentElement.find("#trinh-do").find("input").val() == "") {
				alert("Please fill in required field!");
				return ;
			}
			let data = {
				"moTa": $parentElement.find("textarea").val(),
				"trinhDoNangLuc": $parentElement.find("#trinh-do").find("input").val() 
			};
			$.ajax({
		        type: 'POST',
		        url: $id + '/muctieu/' + $muctieuId + '/edit',
		        data: data,
		        success: function(data) {
		            $newMoTa = $parentElement.find("textarea").val();
		            $newTDNL = $parentElement.find("#trinh-do").find("input").val();
		            hideFormEdit($parentElement);
		            $parentElement.find("#trinh-do").find("span").html($newTDNL);
		            $parentElement.find("#mo-ta-element").find("span").html($newMoTa);
		            alert("Update this item successful!");
		        },
		        error: function(data) {
		            //display error
		            console.log(data);
		        }
		    });
		})
	});
})

function hideFormEdit($parentElement) {
	$parentElement.find("textarea").addClass("hidden");
	$parentElement.find("#trinh-do").find("input").addClass("hidden");
	$parentElement.find("#mo-ta-element").find("span").removeClass("hidden");
	$parentElement.find("#trinh-do").find("span").removeClass("hidden");
	$parentElement.find("#edit-muctieu").removeClass("hidden");
	$parentElement.find("#apply-muctieu").addClass("hidden");
	$parentElement.find("#cancel-muctieu").addClass("hidden");
}

function showFormEdit($parentElement) {
	//remove hidden
	$parentElement.find("textarea").removeClass("hidden");
	$parentElement.find("#trinh-do").find("input").removeClass("hidden");
	$parentElement.find("#mo-ta-element").find("span").addClass("hidden");
	$parentElement.find("#trinh-do").find("span").addClass("hidden");
	$parentElement.find("#edit-muctieu").addClass("hidden");
	//show apply-cancel btn
	$parentElement.find("#apply-muctieu").removeClass("hidden");
	$parentElement.find("#cancel-muctieu").removeClass("hidden");
}