var required_field;
required_field = function(){
	$(".new_employee").validate({
		rules: {
			"employee[name]": { required: true },
			"employee[designation]":{ required: true }
		},
		messages: {
			"employee[name]": "Employee Name can't be blank.",
			"employee[designation]": "Employee Designation can't be blank.",
		}
		});
	}

jQuery(document).ready(required_field);
$(document).on('page:load', required_field);
