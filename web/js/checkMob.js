/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function checkIfExists(i)
{
    console.log("checkIfExists called.");
    sendInfo(i);
}
function sendInfo(i)
{
    if(window.XMLHttpRequest)
    {
        request=new XMLHttpRequest();
    }
    else if(window.ActiveXObject)
    {
        request=new ActiveXObject("Microsoft.XMLHTTP");
        //alert("ActiveXObject object created");
    }
    try 
    {
        request.onreadystatechange=getInfo;
        request.open("POST","checkSellerDetails",true);
        request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        console.log("inside sendInfo mob="+i.value);
        request.send("mob="+i.value);
    }
    catch(e)
    {
        alert("Unable to connect to server."+e);
        document.getElementById("sr").value="not found";
    }
}
function getInfo()
{
    console.log("getInfo called"+request.readyState);
    if(request.readyState==4)
    {
        var text=request.responseText;
        if(text==="This mobile number is already registered.")
        {
            console.log("inside if");
            document.getElementById("sub").disabled=true;
            document.getElementById("sub").style.backgroundColor="rgba(251, 183, 16, 0.58)";
            document.getElementById("dispError").style.display="block";
            document.getElementById("dispError").innerHTML=text;
        }
        else
        {
            console.log("inside else");
            document.getElementById("sub").disabled=false;
            document.getElementById("sub").style.backgroundColor="#fbb710";
            document.getElementById("dispError").style.display="none";
        }
    }
}
