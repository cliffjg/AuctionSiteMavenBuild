
document.querySelectorAll('.auction').forEach(function(element) {
	element.addEventListener('click', function(event) {
	
	// Get the ID of the clicked auction
	var auctionId = event.currentTarget.id;
            
	
	console.log("Clicked auction ID: " + auctionId);
            
            
	// Creating form for submission
	var form = document.createElement('form');
	form.setAttribute('method', 'post');
	form.setAttribute('action', 'UserPageServlet');

	// Create an input element to hold the auction ID
	var input = document.createElement('input');
	input.setAttribute('type', 'hidden');
	input.setAttribute('name', 'auctionID');
	input.setAttribute('value', auctionId);
            


	// Add the input element to the form
	form.appendChild(input);
	

	// Append the form to the document body
	document.body.appendChild(form);

	// Submit the form
	form.submit();
            
            
          
	});
});
    
    
    
    
function submitForm(data) {
	
	
	
	console.log("Data to submit:", data);
	// Set the value of the hidden input field
	//document.getElementById("dataField").value = data;
	
	
	var auctionID =  data;
        	    

	// Creating form for submission
	var form = document.createElement('form');
	form.setAttribute('method', 'post');
	form.setAttribute('action', 'UserPageServlet');

	// Create an input element to hold the auction ID
	var input = document.createElement('input');
	input.setAttribute('type', 'hidden');
	input.setAttribute('name', 'auctionID');
	input.setAttribute('value', auctionID);
            


	// Add the input element to the form
	form.appendChild(input);
	

	// Append the form to the document body
	document.body.appendChild(form);

	// Submit the form
	form.submit();
	
}    


function submitFormWhatTabPressed(whatTabPressed){
	console.log("Data to submit:", whatTabPressed);
	// Set the value of the hidden input field
	//document.getElementById("dataField").value = data;
	
	
	
	var whatTabPressed = whatTabPressed;
        	    

	// Creating form for submission
	var form = document.createElement('form');
	form.setAttribute('method', 'post');
	form.setAttribute('action', 'BackToUserPageServlet');

	// Create an input element to hold the auction ID
	var input = document.createElement('input');
	input.setAttribute('type', 'hidden');
	input.setAttribute('name', 'whatTabPressed');
	input.setAttribute('value', whatTabPressed);
            


	// Add the input element to the form
	form.appendChild(input);
	

	// Append the form to the document body
	document.body.appendChild(form);

	// Submit the form
	form.submit();
	
	
}


function submitFormForMessage(conversationID, auctionID, userEmail, destinationEmail) {
//function submitFormForMessage(data) {	
	
	
	//console.log("Data to submit:", data);
	console.log("Form submitted with parameters:", conversationID, auctionID, userEmail, destinationEmail);


	var conversationID = conversationID;
	var auctionID = auctionID;
	var userEmail = userEmail;
	var destinationEmail = destinationEmail;
  	    

	// Creating form for submission
	var form = document.createElement('form');
	form.setAttribute('method', 'post');
	form.setAttribute('action', 'ViewMessageServlet');
	
	// Create an input element to hold the conversationID
	var inputConversationID = document.createElement('input');
	inputConversationID.setAttribute('type', 'hidden');
	inputConversationID.setAttribute('name', 'conversationID');
	inputConversationID.setAttribute('value', conversationID);
	
	// Create an input element to hold the auction ID
	var inputAuctionID = document.createElement('input');
	inputAuctionID.setAttribute('type', 'hidden');
	inputAuctionID.setAttribute('name', 'auctionID');
	inputAuctionID.setAttribute('value', auctionID);
	
	// Create an input element to hold the userEmail
	var inputUserEmail = document.createElement('input');
	inputUserEmail.setAttribute('type', 'hidden');
	inputUserEmail.setAttribute('name', 'userEmail');
	inputUserEmail.setAttribute('value', userEmail);

	// Create an input element to hold the destinationEmail
	var inputDestinationEmail = document.createElement('input');
	inputDestinationEmail.setAttribute('type', 'hidden');
	inputDestinationEmail.setAttribute('name', 'destinationEmail');
	inputDestinationEmail.setAttribute('value', destinationEmail);
            


	// Add the input element to the form
	form.appendChild(inputConversationID);
	form.appendChild(inputAuctionID);
	form.appendChild(inputUserEmail);
	form.appendChild(inputDestinationEmail);
	

	// Append the form to the document body
	document.body.appendChild(form);

	// Submit the form
	form.submit();
	
} 




function startCountdown(auctionId, endTime) {
    // Update the countdown every second
    var countdown = setInterval(function() {
        // Get the current time
        var now = new Date().getTime();
        
        // Calculate the time remaining
        var distance = endTime - now;
        
        // Calculate days, hours, minutes, and seconds
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);
        
        // Display the countdown
        var countdownElement = document.getElementById("countdown" + auctionId);
        if (countdownElement) {
            // Create the SVG element
            var svgIcon = '<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24" fill="none" style="margin-right: 5px;">'+
                            '<path d="M5.45887 2L1 6.01478L2.33826 7.50107L6.79713 3.48629L5.45887 2Z" fill="currentColor"></path>'+
                            '<path d="M11 8H13V12H16V14H11V8Z" fill="currentColor"></path>'+
                            '<path fill-rule="evenodd" clip-rule="evenodd" d="M3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12C21 16.9706 16.9706 21 12 21C7.02944 21 3 16.9706 3 12ZM5 12C5 8.13401 8.13401 5 12 5C15.866 5 19 8.13401 19 12C19 15.866 15.866 19 12 19C8.13401 19 5 15.866 5 12Z" fill="currentColor"></path>'+
                            '<path d="M18.5411 2L23 6.01478L21.6617 7.50107L17.2029 3.48629L18.5411 2Z" fill="currentColor"></path>'+
                         '</svg>';
            
            // Set the HTML with the SVG icon and countdown text
            countdownElement.innerHTML = svgIcon + days + "d " + hours + "h " + minutes + "m " + seconds + "s ";
            // You can change the color here if you want
            // countdownElement.style.color = "red";
            
            console.log(svgIcon);
        }
        
        // If the countdown is over, display a message
        if (distance < 0) {
            clearInterval(countdown);
            if (countdownElement) {
                countdownElement.innerHTML = "EXPIRED";
            }
        }
    }, 1000);
}


   
document.getElementById("logout").onclick = function(){
	window.location.href = "login.jsp";
	   
};  

    
    
    
function logout() {
	history.replaceState(null, null, location.href);
	
	window.onpopstate = function () {
		history.go(1);
	};
}
    


function off() {
	
	//set the overflow to visible when user presses cancel button
	document.body.style.overflow = 'visible';
	
	//clear the carDescription textarea input field
	var elements = document.getElementById("carDescription").value= "";
	
	//Need to error check this
	//document.getElementById("imagePath").value= "";
	
	//clear all text input fields in addAuction overlay
	elements = document.getElementsByTagName("input");
	for (var i=0; i < elements.length; i++) {
		if (elements[i].type == "text") {
    		elements[i].value = "";
  		}

  	
  	
	}
	
	document.getElementById("overlay").style.display = "none";
}
   							
function on() {
	document.body.style.overflow = 'hidden';
	document.getElementById("overlay").style.display = "block";
	
}





function previewImage(event) {

		var img = document.getElementById('imagePath');
		var divAboveImage = document.getElementById('divAboveImage');
		console.log("The image: " + img.value);
  		 						  
		// Check if a file was selected
		if (event.target.files && event.target.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
			
  		 	
			//set the size of the image and also the result
			img.style.width = '100%';
			img.style.height = '100%';
			img.src = e.target.result;
			
			divAboveImage.style.width = '100%';
			divAboveImage.style.height = '100%';
  		 						   
		}

		// Read the selected file as a Data URL
		reader.readAsDataURL(event.target.files[0]);
		}
} 
	
	
function handleFileSelect(event) {
		  const file = event.target.files[0];
		  const filePath = URL.createObjectURL(file);
		  document.getElementById('filePath').textContent = filePath;

}




    