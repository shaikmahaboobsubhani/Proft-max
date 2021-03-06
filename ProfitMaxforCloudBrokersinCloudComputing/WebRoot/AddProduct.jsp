<!DOCTYPE html>
<html>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

/* Full-width input fields */
input[type=text] {
    width: 60%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
}

hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}

button:hover {
    opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
    padding: 14px 20px;
    background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
    padding: 16px;
}

/* Clear floats */
.clearfix::after {
    content: "";
    clear: both;
    display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
    .cancelbtn, .signupbtn {
       width: 100%;
    }
}
</style>

<script type="text/javascript">
var frmvalidator  = new Validator("myform");

frmvalidator.addValidation("available","numeric");
frmvalidator.addValidation("price","numeric");

function validator() {
  var x = document.forms["myform"]["machines"].value;
  if (x == "") {
    alert("Machines must be filled out");
    return false;
  }
  
  var x = document.forms["myform"]["available"].value;
  if (x == "") {
    alert("Available must be filled out");
    return false;
  }
  var x = document.forms["myform"]["price"].value;
  if (x == "") {
    alert("Price must be filled out");
    return false;
  }
  
  
  
}


</script>




<jsp:include page="Header.jsp"></jsp:include>



<body>

<form action="./ProductDetailsServlet" style="border:1px solid #ccc" name="myform" onsubmit="return validator();">
  <div class="container">
    <h1>Enter Details</h1>
    <p>Please fill in this formt.</p>
    <hr>

<label style="color:  red;">
		   	        <%
		   	        String status=request.getParameter("status");
		   	        if(status !=null){
		   	        out.print(status);
		   	        
		   	        }
		   	        
		   	        
		   	         %>
		   	         </label>



    <input type="hidden" placeholder="Product Id" name="pid" required>
    <br/>



    <label for="machines"><b>Machines</b></label>
    <input type="text" placeholder="Enter Machine Name" name="machines" pattern="[a-zA-Z]{3,}" required>
    <br/>

    <label for="available"><b>Available  </b></label>
    <input type="text" placeholder="Enter Available Machines" name="available" pattern="[0-9]{2,}" required>
    <br/>

    <label for="price"><b>Enter Price</b></label>
    <input type="text" placeholder="Machine Price" name="price" pattern="[0-9]{3,}" required>
    
    <!--<label>
      <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px"> Remember me
    </label>
    
    <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

    <div class="clearfix">
      <button type="button" class="cancelbtn">Cancel</button>-->
      
      <button type="submit" class="signupbtn">Submit</button>
    </div>
  </div>
</form>

</body>
</html>
