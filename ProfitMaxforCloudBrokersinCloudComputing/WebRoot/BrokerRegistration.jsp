<html>

<head>

<style type="text/css">

*{
 margin:0px;
 padding:0px;
 }
body{
 font-family:Tahoma, Geneva, sans-serif;
 }
#container{
 width:550px;
 background-color:rgba(250,250,252,.9);
 margin:auto;
 margin-top:10px;
 margin-bottom:10px;
 box-shadow:0 0 3px #999;
 }
#container_body{
 padding:20px;
 }
.form_title{
 font-size:35px;
 color:#141823;
 text-align:center;
 padding:10px;
 font-weight:normal;
 }
.head_para{
 font-size:19px;
 color:#99a2a7;
 text-align:center;
 font-weight:normal;
 }
#form_name{
 padding:25px 0 0 15px;
 }
.firstnameorlastname{
  margin-right:20px;
 }
.input_name{
 width:207px;
 padding:5px;
 font-size:18px;
 }
#email_form{
 clear:both;
 padding:15px 0 10px 0px;
 }
.input_email{
 width:434px;
 padding:5px;
 font-size:18px;
 }
#Re_email_form{
 padding:10px 0 10px 0px;
 }
.input_Re_email{
 width:434px;
 padding:5px;
 font-size:18px;
 }
#password_form{
 padding:10px 0 10px 0px;
 }
.input_password{
 width:434px;
 padding:5px;
 font-size:18px;
 }
.birthday_title{
 font-size:16px; 
 color:#8b919d; 
 font-weight:normal;
 padding:0 0 10px 0;
 }
 
 .input_phone
 {
 
 padding: 8px 28px;
 
 }
 
select{
 padding:5px;
 }
#birthday{
 font-size:12px;
 color:#8b919d;
 padding-top:10px;
 }
#radio_button{
 padding:10px 0 0 0;
 }
 
#sign_user{
 font-size:14px;
 color:#FFF;
 text-align:center;
 background-color:#3B5998;
 padding:10px;
 margin-top:10px;
 cursor: pointer;
 }
#errorBox{
 color:#F00;
 }




/*input[type=text], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}*/


</style>
<script>
function Submit(){
 var emailRegex = /^[A-Za-z0-9._]*\@[A-Za-z]*\.[A-Za-z]{2,5}$/;
 var fname = document.form.Name.value,
  lname = document.form.LastName.value,
  femail = document.form.Email.value,
  freemail = document.form.enterEmail.value,
  fpassword = document.form.Password.value,
  fmonth = document.form.birthday_month.value,
  fday = document.form.birthday_day.value,
  fyear = document.form.birthday_year.value;
   
 if( fname == "" )
   {
     document.form.Name.focus() ;
  document.getElementById("errorBox").innerHTML = "enter the first name";
     return false;
   }
 if( lname == "" )
   {
     document.form.LastName.focus() ;
   document.getElementById("errorBox").innerHTML = "enter the last name";
     return false;
   }
    
   if (femail == "" )
 {
  document.form.Email.focus();
  document.getElementById("errorBox").innerHTML = "enter the email";
  return false;
  }else if(!emailRegex.test(femail)){
  document.form.Email.focus();
  document.getElementById("errorBox").innerHTML = "enter the valid email";
  return false;
  }
   
   if (freemail == "" )
 {
  document.form.enterEmail.focus();
  document.getElementById("errorBox").innerHTML = "Re-enter the email";
  return false;
  }else if(!emailRegex.test(freemail)){
  document.form.enterEmail.focus();
  document.getElementById("errorBox").innerHTML = "Re-enter the valid email";
  return false;
  }
   
  if(freemail !=  femail){
   document.form.enterEmail.focus();
   document.getElementById("errorBox").innerHTML = "emails are not matching, re-enter again";
   return false;
   }
   
   
 if(fpassword == "")
  {
   document.form.Password.focus();
   document.getElementById("errorBox").innerHTML = "enter the password";
   return false;
  }
   
   if (fmonth == "") {
        document.form.birthday_month.focus();
  document.getElementById("errorBox").innerHTML = "select the birthday month";
        return false;
     }
  if (fday == "") {
        document.form.birthday_day.focus();
  document.getElementById("errorBox").innerHTML = "select the birthday day";
        return false;
     }
  if (fyear == "") {
        document.form.birthday_year.focus();
  document.getElementById("errorBox").innerHTML = "select the birthday year";
        return false;
     }
  if(document.form.radiobutton[0].checked == false && document.form.radiobutton[1].checked == false){
    document.getElementById("errorBox").innerHTML = "select your gender";
    return false;
   }
  if(fname != '' && lname != '' && femail != '' && freemail != '' && fpassword != '' && fmonth != '' && fday != '' && fyear != ''){
   document.getElementById("errorBox").innerHTML = "form submitted successfully";
   }
     
}


</script>

<script type="text/javascript">

              var password = document.getElementById("password")
            , confirm_password = document.getElementById("confirmpassword");
            function validatePassword(){
                if(password.value != confirm_password.value) {
                confirm_password.setCustomValidity("Passwords Don't Match");
                } else {
                confirm_password.setCustomValidity('');
                }
            }
            password.onchange = validatePassword;
            confirm_password.onkeyup = validatePassword;   

function validator() {
  var x = document.forms["myform"]["userid"].value;
  if (x == "") {
    alert("UserId must be filled out");
    return false;
  }
   var x = document.forms["myform"]["password"].value;
  if (x == "") {
    alert("password must be filled out");
    return false;
  }
  
   var x = document.forms["myform"]["confirmpassword"].value;
  if (x == "") {
    alert("confirm password must be filled out");
    return false;
  }

  if (document.forms["myform"]["username"].value== "") {
    alert("username must be filled out");
    return false;
  }
  if (document.forms["myform"]["lastname"].value== "") {
    alert("lastname must be filled out");
    return false;
  }
    if (document.forms["myform"]["email"].value== "") {
    alert("email must be filled out");
    return false;
  }
  
   if (document.forms["myform"]["phone"].value== "") {
    alert("mobileno must be filled out");
    return false;
  }
   if (document.forms["myform"]["role"].value== "") {
    alert("role must be filled out");
    return false;
  }
}


</script>



</head>



<jsp:include page="Header.jsp"></jsp:include>




<body>

<div id="emptyDiv"></div>
<div id="description"></div>
<!--container start-->
<div id="container">
  <div id="container_body">
    <div>
      <h2 class="form_title">Broker Registration </h2>
      <p class="head_para">Enter Details</p>
    </div>
    <!--Form  start-->
    <div id="form_name">
      <div class="firstnameorlastname">
      
       <form action="./BrokerRegisterServlet" name="myform" onsubmit="return validator();">
       
       <label style="color: red; font-style:italic; text-align: center; ">
                	<% String status=request.getParameter("status"); if(status!=null){out.println(status);} %></label>      
       
       
       <div id="errorBox"></div>
        <input type="text" name="username" pattern="[a-zA-Z]{3,}" value="" placeholder="First Name"  class="input_name" >
        <input type="text" name="lastname" pattern="[a-zA-Z]{3,}" value="" placeholder="Last Name" class="input_name" >
         
      </div>
      <br/>
      <div class="passwordorconfirmpassword">
       
       <div id="errorBox"></div>
        <input type="password" name="password" pattern="[a-zA-Z]{3,}" value="" placeholder="Password"  class="input_name" >
        <input type="password" name="confirmpassword"  pattern="[a-zA-Z]{3,}" value="" placeholder="ConfirmPassword" class="input_name" >
         
      </div>
      <br/>
      <div class="useridorphone">
       <div id="errorBox"></div>
  
        <input type="text" name="userid" pattern="[a-zA-Z]{3,}" value=""  placeholder="Username" class="input_name">
         <input type="text" name="phone" value=""  minlength="10" maxlength="10" pattern="[0-9]{10}"  placeholder="Phone" class="input_phone">
      </div>
      <div id="email_form">
        <input type="text" name="email" value=""  pattern="[^ @]*@[^ @]*" placeholder="enter Email" class="input_email">
      </div>
      
      
      <div id="usertype">
        
        <label for="usertype"><i class="fa fa-user"></i>UserType</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								
										&nbsp;&nbsp;&nbsp;&nbsp;<select name="usertype" id="usertype">
										
										
										<option value="BROKER">BROKER</option>
										
										
										</select>
        
      </div>
      
      
      
      <!--birthday details start--><!--
      <div>
        <h3 class="birthday_title">Birthday</h3>
      </div>
      <div>
        <select name="birthday_month" >
          <option value="" selected >Month</option>
          <option value="1">Jan</option>
          <option value="2">Feb</option>
          <option value="3">Mar</option>
          <option value="4">Apr</option>
          <option value="5">May</option>
          <option value="6">Jun</option>
          <option value="7">Jul</option>
          <option value="8">Aug</option>
          <option value="9">Sep</option>
          <option value="10">Oct</option>
          <option value="11">Nov</option>
          <option value="12">Dec</option>
        </select>
        &nbsp;&nbsp;
        <select name="birthday_day" >
          <option value="" selected>Day</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
          <option value="13">13</option>
          <option value="14">14</option>
          <option value="15">15</option>
          <option value="16">16</option>
          <option value="17">17</option>
          <option value="18">18</option>
          <option value="19">19</option>
          <option value="20">20</option>
          <option value="21">21</option>
          <option value="22">22</option>
          <option value="23">23</option>
          <option value="24">24</option>
          <option value="25">25</option>
          <option value="26">26</option>
          <option value="27">27</option>
          <option value="28">28</option>
          <option value="29">29</option>
          <option value="30">30</option>
          <option value="31">31</option>
        </select>
        &nbsp;&nbsp;
        <select name="birthday_year">
          <option value="" selected>Year</option>
          <option value="2018">2018</option>
          <option value="2017">2017</option>
          <option value="2016">2016</option>
          <option value="2015">2015</option>
          <option value="2014">2014</option>
          <option value="2013">2013</option>
          <option value="2012">2012</option>
          <option value="2011">2011</option>
          <option value="2010">2010</option>
          <option value="2009">2009</option>
          <option value="2008">2008</option>
          <option value="2007">2007</option>
          <option value="2006">2006</option>
          <option value="2005">2005</option>
          <option value="2004">2004</option>
          <option value="2003">2003</option>
          <option value="2002">2002</option>
          <option value="2001">2001</option>
          <option value="2000">2000</option>
          <option value="1999">1999</option>
          <option value="1998">1998</option>
          <option value="1997">1997</option>
          <option value="1996">1996</option>
          <option value="1995">1995</option>
          <option value="1994">1994</option>
          <option value="1993">1993</option>
          <option value="1992">1992</option>
          <option value="1991">1991</option>
          <option value="1990">1990</option>
        </select>
      </div>
      --><!--birthday details ends-->
      <div id="radio_button">
       <label for="gender"><i class=""></i>Gender</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="radio" name="gender" value="Female" checked="checked">
        <label >Female</label>
        &nbsp;&nbsp;&nbsp;
        <input type="radio" name="gender" value="Male">
        <label >Male</label>
      </div>
       <div>
        <p id="sign_user" onClick="Submit()"><input type="submit" value="Sign Up"/> </p>
      </div>
     </form>
    </div>
    <!--form ends-->
  </div>
</div>
<!--container ends-->






</body>




</html>