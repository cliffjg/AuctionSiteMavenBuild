function editPressedPass() {	
	
	document.getElementById("editButtonPassword").style.display = "none";
	document.getElementById("cancelButtonPassword").style.visibility = "visible";
	document.getElementById("saveButtonPassword").style.visibility = "visible";
	
	var placeholderText = document.getElementById("password").getAttribute("placeholder");
    document.getElementById("password").value = placeholderText;
    document.getElementById("password").disabled = false;

    
    var placeholderText = document.getElementById("confirmPassword").getAttribute("placeholder");
    document.getElementById("confirmPassword").value = placeholderText;
    document.getElementById("confirmPassword").disabled = false;
    
    
	
	
}

function cancelPressedPass() {	

	document.getElementById("editButtonPassword").style.display = "inline";
	document.getElementById("cancelButtonPassword").style.visibility = "hidden";
	document.getElementById("saveButtonPassword").style.visibility = "hidden";
	
	document.getElementById("password").value = "";
	document.getElementById("confirmPassword").value = "";
	
	
	document.getElementById("password").disabled = true;
	document.getElementById("confirmPassword").disabled = true;


	
}	


function editPressed() {	
	
	document.getElementById("editButton").style.display = "none";
	document.getElementById("cancelButton").style.visibility = "visible";
	document.getElementById("saveButton").style.visibility = "visible";
	
	var placeholderText = document.getElementById("firstName").getAttribute("placeholder");
    document.getElementById("firstName").value = placeholderText;
    document.getElementById("firstName").disabled = false;

    
    var placeholderText = document.getElementById("lastName").getAttribute("placeholder");
    document.getElementById("lastName").value = placeholderText;
    document.getElementById("lastName").disabled = false;
    
    var placeholderText = document.getElementById("address").getAttribute("placeholder");
    document.getElementById("address").value = placeholderText;
    document.getElementById("address").disabled = false;
    
    var placeholderText = document.getElementById("city").getAttribute("placeholder");
    document.getElementById("city").value = placeholderText;
    document.getElementById("city").disabled = false;
    
    var placeholderText = document.getElementById("state").getAttribute("placeholder");
    document.getElementById("state").value = placeholderText;
    document.getElementById("state").disabled = false;
    
    var placeholderText = document.getElementById("zipCode").getAttribute("placeholder");
    document.getElementById("zipCode").value = placeholderText;
    document.getElementById("zipCode").disabled = false;
    
    var placeholderText = document.getElementById("phoneNumber").getAttribute("placeholder");
    document.getElementById("phoneNumber").value = placeholderText;
    document.getElementById("phoneNumber").disabled = false;
	
	
}
   		
function cancelPressed() {	

	document.getElementById("editButton").style.display = "inline";
	document.getElementById("cancelButton").style.visibility = "hidden";
	document.getElementById("saveButton").style.visibility = "hidden";
	
	document.getElementById("firstName").value = "";
	document.getElementById("lastName").value = "";
	document.getElementById("address").value = "";
	document.getElementById("city").value = "";
	document.getElementById("state").value = "";
	document.getElementById("zipCode").value = "";
	document.getElementById("phoneNumber").value = "";
	
	document.getElementById("firstName").disabled = true;
	document.getElementById("lastName").disabled = true;
	document.getElementById("address").disabled = true;
	document.getElementById("city").disabled = true;
	document.getElementById("state").disabled = true;
	document.getElementById("zipCode").disabled = true;
	document.getElementById("phoneNumber").disabled = true;

	
}		