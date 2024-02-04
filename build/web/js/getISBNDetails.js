/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var inp,vf=0;
function fetchDetails() 
{
    var input=document.getElementById("isbn");
    inp=input.value;
    var len = input.value.length;
    //console.log(response);
    if(len === 10|| len===13) {
        console.log("Correct  digits in ISBN");
        document.getElementById("error").style.display="none";
        sendSignInf(input.value);
        return true;
    }
    else
    {
        alert("ISBN should contain either 10 or 13 digits.");
        document.getElementById("epara").innerHTML="ISBN should contain either 10 or 13 digits.";
        document.getElementById("sr").value="not found";
        document.getElementById("error").style.display="block";
        document.getElementById("bd").style.display="none";
        vf=0;
        return false;
    }
    //console.log(response);
}
function sendSignInf(response)
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
        request.onreadystatechange=getSignInf;
        request.open("POST","GetISBNData",true);
        request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        request.send("ISBN="+response);
    }
    catch(e)
    {
        alert("Unable to connect to server."+e);
        document.getElementById("sr").value="not found";
    }
}
function getSignInf()
{
    console.log("getsignin called"+request.readyState);
    if(request.readyState==4)
    {
        var text=request.responseText;
        //console.log(text);
        try
        {
            var obj = JSON.parse(text); 
            console.log(obj.totalItems);
            if(obj.totalItems>0)
            {
                vf=1;
                document.getElementById("sr").value="Found";
                console.log(obj.items[0].volumeInfo.title);
                var title=obj.items[0].volumeInfo.title;
                console.log(obj.items[0].volumeInfo.subtitle);
                var authors="",cat="";
                if(obj.items[0].volumeInfo.authors)
                {
                    for(i=0;i<obj.items[0].volumeInfo.authors.length;i++)
                    {
                        if(i>0)
                        {
                            authors+=", ";
                        }
                        console.log("author"+i+": "+obj.items[0].volumeInfo.authors[i]);
                        authors+=obj.items[0].volumeInfo.authors[i];
                    }
                }
                else
                {
                    authors="Not Found";
                    document.getElementById("authors2").value="Not Found";
                }
                console.log("publisher "+obj.items[0].volumeInfo.publisher);
                var pub=obj.items[0].volumeInfo.publisher;
                console.log("pdate "+obj.items[0].volumeInfo.publishedDate);
                var pd=obj.items[0].volumeInfo.publishedDate;
                console.log("desc "+obj.items[0].volumeInfo.description);
                var desc=obj.items[0].volumeInfo.description;
                console.log("pageCount "+obj.items[0].volumeInfo.pageCount);
                var pc=obj.items[0].volumeInfo.pageCount;
                console.log("avg rating "+obj.items[0].volumeInfo.averageRating);
                var ar=obj.items[0].volumeInfo.averageRating;
                console.log("ratingsCount "+obj.items[0].volumeInfo.ratingsCount);
                if(obj.items[0].volumeInfo.ratingsCount)
                {
                    document.getElementById("rc").value=obj.items[0].volumeInfo.ratingsCount;
                }
                else
                {
                    document.getElementById("rc").value="Not Found";
                }
                console.log("maturityRating "+obj.items[0].volumeInfo.maturityRating);
                if(obj.items[0].volumeInfo.maturityRating)
                {
                    document.getElementById("mr").value=obj.items[0].volumeInfo.maturityRating;
                }
                else
                {
                    document.getElementById("mr").value="Not Found";
                }
                if(obj.items[0].volumeInfo.categories)
                {
                    for(i=0;i<obj.items[0].volumeInfo.categories.length;i++)
                    {
                        if(i>0)
                        {
                            cat+=", ";
                        }
                        console.log("category"+i+": "+obj.items[0].volumeInfo.categories[i]);
                        cat+=obj.items[0].volumeInfo.categories[i];
                    }
                }
                else
                {
                    categories="Not Found";
                    document.getElementById("cat2").value="Not Found";
                }
                try
                {
                    if(obj.items[0].volumeInfo.imageLinks.thumbnail)
                    {
                       console.log("smallThumbnail "+obj.items[0].volumeInfo.imageLinks.smallThumbnail);
                       console.log("thumbnail "+obj.items[0].volumeInfo.imageLinks.thumbnail);
                       var tn=obj.items[0].volumeInfo.imageLinks.thumbnail; 
                    }
                    else
                    {
                        document.getElementById("tn").src="F:\net beans project\Paige2\web\bookImages\not_found.jpeg";
                        document.getElementById("tn2").value="Not Found";
                    }
                }
                catch(err)
                {
                    document.getElementById("tn").src="F:\net beans project\Paige2\web\bookImages\not_found.jpeg";
                    document.getElementById("tn2").value="Not Found";
                }
                console.log("language "+obj.items[0].volumeInfo.language);
                if(inp)
                {
                    document.getElementById("inp").innerHTML=inp;
                    document.getElementById("inp2").value=inp;
                }
                if(tn)
                {
                    document.getElementById("tn").src=tn;
                    document.getElementById("tn2").value=tn;
                }
                if(title)
                {
                    document.getElementById("title").innerHTML=title;
                    document.getElementById("title2").value=title;
                }
                else
                {
                    document.getElementById("title").innerHTML="Not Found";
                    document.getElementById("title2").value="Not Found";
                }
                if(authors)
                {
                    document.getElementById("authors").innerHTML=authors;
                    document.getElementById("authors2").value=authors;
                }
                else
                {
                    document.getElementById("authors").innerHTML="Not found";
                }
                if(pub)
                {
                    document.getElementById("pub").innerHTML=pub;
                    document.getElementById("pub2").value=pub;
                }
                else
                {
                    document.getElementById("pub").innerHTML="Not found.";
                    document.getElementById("pub2").value="Not Found";
                }
                if(pd)
                {
                    document.getElementById("pd").innerHTML=pd;
                    document.getElementById("pd2").value=pd;
                }
                else
                {
                    document.getElementById("pd").innerHTML="Not found.";
                    document.getElementById("pd2").value="Not Found";
                }
                if(pc)
                {
                    document.getElementById("pc").innerHTML=pc;
                    document.getElementById("pc2").value=pc;
                }
                else
                {
                    document.getElementById("pc").innerHTML="Not Found";
                    document.getElementById("pc2").value="Not Found";
                }
                if(ar)
                {
                    document.getElementById("ar").innerHTML=ar;
                    document.getElementById("ar2").value=ar;
                }
                else
                {
                    document.getElementById("ar").innerHTML="Not Found";
                    document.getElementById("ar2").value="Not Found";
                }
                if(cat)
                {
                    document.getElementById("cat").innerHTML=cat;
                    document.getElementById("cat2").value=cat;
                }
                else
                {
                    document.getElementById("cat").innerHTML="Not Found";
                }
                if(desc)
                {
                    document.getElementById("desc").innerHTML=desc;
                    document.getElementById("desc2").value=desc;
                }
                else
                {
                     document.getElementById("desc").innerHTML="";
                     document.getElementById("desc2").value="Not Found";
                }
                document.getElementById("bd").style.display="block";
               
            }
            else
            {
                document.getElementById("epara").innerHTML="Sorry,no book was found with the given ISBN.";
                vf=0;
                document.getElementById("sr").value="Not Found";
                document.getElementById("error").style.display="block";
                document.getElementById("bd").style.display="none";
            }
        }
        catch(err)
        {
            document.getElementById("epara").innerHTML="Sorry,could not connect to our servers right now.Please try again later.";
            vf=0;
            console.log(err);
            document.getElementById("sr").value="not found";
            document.getElementById("error").style.display="block";
            document.getElementById("bd").style.display="none";
        }
        /*if(obj.success==true)
        {
            document.getElementById('g-recaptcha-error').innerHTML = '<span style="color:white;">correct recaptcha.</span>';
            //console.log("true");
            document.getElementById("sub").click();
            //document.getElementById("displayError").style.display="block";
        }
        else 
        {
            //alert("we are submitting the form"); 
            document.getElementById('g-recaptcha-error').innerHTML = '<span style="color:red;">wrong recaptcha.</span>';
            //console.log("false");
            //document.getElementById("sub").click();
        }*/
    }   
}
function validateBookDetails()
{
    var c=0,st;
    console.log("vf="+vf);
    if(document.getElementById("category").value==="category")
    {
        console.log(document.getElementById("category").value);
        //document.getElementById("category").value="abcd";
        alert("Select Category");
        return false;
    }
    else if(document.getElementById("condition").value==="condition")
    {
        console.log(document.getElementById("condition").value);
        //document.getElementById("category").style.boxShadow="0 0 0 0.2rem rgba(255, 3, 3, 0.88)";
        //document.getElementById("category").value="abcd";
        alert("Select Condition");
        return false;
    }
    else if(document.getElementById("binding").value==="binding")
    {
        console.log(document.getElementById("binding").value);
        //document.getElementById("category").style.boxShadow="0 0 0 0.2rem rgba(255, 3, 3, 0.88)";
        //document.getElementById("category").value="abcd";
        alert("Select Binding");
        return false;
    }
    else if(document.getElementById("language").value==="language")
    {
        console.log(document.getElementById("language").value);
        //document.getElementById("category").style.boxShadow="0 0 0 0.2rem rgba(255, 3, 3, 0.88)";
        //document.getElementById("category").value="abcd";
        alert("Select Language");
        return false;
    }
    if(!document.getElementById("fp1").value)
    {
         console.log("inside else "+document.getElementById("fp1").value);
        document.getElementById("p1").style.boxShadow="0 0 0 0.2rem rgba(255, 3, 3, 0.88)";
        //document.getElementById("category").value="abcd";
        alert("Upload the front cover page of your book.");
        return false;
    }
    else if(!document.getElementById("fp2").value)
    {
         console.log("inside else "+document.getElementById("fp2").value);
        document.getElementById("p2").style.boxShadow="0 0 0 0.2rem rgba(255, 3, 3, 0.88)";
        //document.getElementById("category").value="abcd";
        alert("Upload the back cover page of your book.");
        return false;
    }
    else if(!document.getElementById("fp3").value)
    {
         console.log("inside else "+document.getElementById("fp3").value);
        document.getElementById("p3").style.boxShadow="0 0 0 0.2rem rgba(255, 3, 3, 0.88)";
        //document.getElementById("category").value="abcd";
        alert("Upload the index page of your book.");
        return false;
    }
    else if(!document.getElementById("fp4").value)
    {
         console.log("inside else "+document.getElementById("fp4").value);
        document.getElementById("p4").style.boxShadow="0 0 0 0.2rem rgba(255, 3, 3, 0.88)";
        //document.getElementById("category").value="abcd";
        alert("Upload the page containing isbn number of your book.");
        return false;
    }
    else if(!document.getElementById("fp5").value)
    {
         console.log("inside else "+document.getElementById("fp5").value);
        document.getElementById("p5").style.boxShadow="0 0 0 0.2rem rgba(255, 3, 3, 0.88)";
        //document.getElementById("category").value="abcd";
        alert("Upload any random page of your book.");
        return false;
    }
}
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
        console.log("inside sendInfo isbn="+i.value);
        request.send("Isbn="+i.value);
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
        if(text==="You have already posted the same book.")
        {
            console.log("inside if");
            document.getElementById("postAdd").disabled=true;
            document.getElementById("displayError").style.display="block";
            document.getElementById("errorMessage").innerHTML=text;
        }
        else
        {
            console.log("inside else");
            document.getElementById("postAdd").disabled=false;
            document.getElementById("displayError").style.display="none";
        }
    }
}