function val()
{	
	
    let f_name = document.getElementById("f_name").value;
    let l_name = document.getElementById("l_name").value;
    let age = document.getElementById("age").value;
    let email = document.getElementById("email").value;
    let username = document.getElementById("username").value;
    let passwd = document.getElementById("password").value;
    let c_password = document.getElementById("confirm_password").value;
    var mailformat = /^w+([.-]?w+)*@w+([.-]?w+)*(.w{2,3})+$/;
    if ( f_name == "" )
	    {
            document.getElementById("exception").innerHTML = "<h3> Please enter your first name.. </h3>";		
			return false;
	    }

    if ( l_name == "" )
	    {
            document.getElementById("exception").innerHTML = "<h3>Please enter your last name...</h3>";		
			return false;
	    }

	if ( username == "" )
	    {
            document.getElementById("exception").innerHTML = "<h3>Please choose a username....</h3>";		
			return false;
	    }

	if(age == "")	
	   {
            document.getElementById("exception").innerHTML = "<h3>Please fill out your age....</h3>";
			return false;
	   }	

	if(passwd != c_password)
	{   
         document.getElementById("exception").innerHTML = "<h3>Passwords doesn't match....</h3>";
			return false;
	}

	if ( phone_num == "" )
	{		
        document.getElementById("exception").innerHTML = "<h3>Enter valid phone number..</h3>";
			return false;
	}			
	if ( email == "" )		
    {
        document.getElementById("exception").innerHTML = "<h3>Email cannot be empty..</h3>";
		return false;
	}	
        
	return true;

}

function format_checker(event)
	{
		var keychar;
			
		keychar = event.key;
		if (((".+-0123456789").indexOf(keychar) > -1))
		   return true;
		else{
            document.getElementById("exception").innerHTML = "Enter valid format.";
		   return false;
        }
	}

 //email format checker 
  function valid_email2(val){
    var mailformat = /^w+([.-]?w+)*@w+([.-]?w+)*(.w{2,3})+$/;
    if(val.value.match(mailformat)){
        return true;
    }
    else{
        
        document.getElementById("exception").innerHTML = "<h3>Enter valid email address...</h3>";
		  
        return false;
    }
}

function leave(){
	document.getElementById("exception").innerHTML = "";
	return true;
}

function val1()
{	
	
    let name = document.getElementById("name").value;
    let email = document.getElementById("email").value;
    let username = document.getElementById("username").value;
    let phone  = document.getElementById("phone").value;
	var mailformat = /^w+([.-]?w+)*@w+([.-]?w+)*(.w{2,3})+$/;
    if ( name == "" )
	    {
            document.getElementById("exception").innerHTML = "<h3> Please enter your first name. </h3>";		
			return false;
	    }

	if ( username == "" )
	    {
            document.getElementById("exception").innerHTML = "<h3>Please enter your username....</h3>";		
			return false;
	    }


	if ( phone == "" )
	{		
        document.getElementById("exception").innerHTML = "<h3>Enter valid phone number..</h3>";
			return false;
	}			
	if ( email == "" )		
    {
        document.getElementById("exception").innerHTML = "<h3>Email cannot be empty..</h3>";
		return false;
	}	
        
	return true;

}



