function manageError()
{
    if(password!=confirmpassword)
    {
        document.getElementById("wrongpass").style.display="none";
        //alert("function called");
    }
}
function validateForm()
                {
                    password=document.getElementById("password").value;
                    confirmpassword=document.getElementById("confirmpassword").value;
                    if(password!=confirmpassword)
                    {
                        //alert("Both he passwords should match.");
                        document.getElementById("wrongpass").style.display="inline";
                        document.getElementById("wrongpass").style.color="red";
                        //document.getElementById("wrongpass").style.font-size="5px";
                        document.getElementById("wrongpass").innerHTML="Both the passwor should match.";
                        return false;
                    }
                    else
                    {
                        document.getElementById("wrongpass").style.display="none";
                    }
					
}
/*function displayBlur()
    {
        var b=document.getElementById("blurImage");
        b.style.visibility='visible';
    }
function hideBlur()
    {
        var b=document.getElementById("blurImage");
        b.style.visibility='hidden';
    }
function getMargin(){
    var p = document.getElementById("lp");
    var style2 = window.getComputedStyle(p);
    alert("Current marginLeft: " + style2.marginLeft);
    alert("Current marginRight: " + style2.marginRight);
}
*/
