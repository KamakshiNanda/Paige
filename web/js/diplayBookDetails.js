/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var image = document.getElementsByClassName("product-image");
var price = document.getElementsByClassName("product-price");
var title = document.getElementsByClassName("product-title");
var product = document.getElementsByClassName("product");
var category, p = 5000, condition = [], binding = [], language = [];
var json;

function page2()
{
    if (window.XMLHttpRequest)
    {
        request = new XMLHttpRequest();
    } else if (window.ActiveXObject)
    {
        request = new ActiveXObject("Microsoft.XMLHTTP");
        //alert("ActiveXObject object created");
    }
    try
    {
        request.onreadystatechange = getInfo2;
        request.open("POST", "displayServlet", true);
        request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        request.send();
    } catch (e)
    {
        alert("Unable to connect to server." + e);
    }
}
function getInfo2()
{
    //console.log("getsignin called" + request.readyState);
    if (request.readyState === 4)
    {
        document.getElementsByClassName("products-row")[0].style.display = "flex";
        document.getElementsByClassName("products-row")[1].style.display = "flex";
        document.getElementById("nrf").style.display = "none";
        var text = request.responseText;
        console.log(text);
        var obj = JSON.parse(text);
        json = JSON.parse(text);
        var j = 0;
        var m=24;
        if (obj.length > 0)
        {
            console.log(text);
            console.log(obj[0].title);
            console.log(obj[24].thumbnail);
            for (var i = 0; m < obj.length && i < image.length; i++)
            {
                //console.log(image[i]);
                image[i].src = obj[m].thumbnail;
                price[i].innerHTML = "₹" + obj[m].price;
                console.log("price=" + "₹" + obj[m].price);
                title[i].innerHTML = obj[m].title;
                product[i].style.display = "block";
                m++;
            }
            //console.log(m);
            j = obj.length-23;
            //console.log(j);
            //console.log(product.length);
            for (l = j; l < product.length; l++)
            {
                product[l].style.display = "none";
            }
        } else
        {
            document.getElementsByClassName("products-row")[0].style.display = "none";
            document.getElementsByClassName("products-row")[1].style.display = "none";
            document.getElementById("nrf").style.display = "block";
        }
    }
}
function sortBy(parameter)
{
    console.log("sortBy called");
    if (window.XMLHttpRequest)
    {
        request = new XMLHttpRequest();
    } else if (window.ActiveXObject)
    {
        request = new ActiveXObject("Microsoft.XMLHTTP");
        //alert("ActiveXObject object created");
    }
    try
    {
        request.onreadystatechange = getInfo;
        request.open("POST", "displayServlet", true);
        request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        request.send("sortBy="+parameter);
    } catch (e)
    {
        alert("Unable to connect to server." + e);
    }
}
function sendInfo()
{
    if (window.XMLHttpRequest)
    {
        request = new XMLHttpRequest();
    } else if (window.ActiveXObject)
    {
        request = new ActiveXObject("Microsoft.XMLHTTP");
        //alert("ActiveXObject object created");
    }
    try
    {
        request.onreadystatechange = getInfo;
        request.open("POST", "displayServlet", true);
        request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        request.send();
    } catch (e)
    {
        alert("Unable to connect to server." + e);
    }
}
function sendFilters()
{
    if (window.XMLHttpRequest)
    {
        request = new XMLHttpRequest();
    } else if (window.ActiveXObject)
    {
        request = new ActiveXObject("Microsoft.XMLHTTP");
        //alert("ActiveXObject object created");
    }
    try
    {
        request.onreadystatechange = getInfo;
        request.open("POST", "displayServlet", true);
        request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        var str = "price=" + p;
        if (category)
        {
            str += "&category=" + category;
        }
        if (condition.length > 0)
        {
            str += "&condition=" + condition.toString();
        }
        if (binding.length > 0)
        {
            str += "&binding=" + binding.toString();
        }
        if (language.length > 0)
        {
            str += "&language=" + language.toString();
        }
        //request.send("filter=1&category="+category+"&price="+p+"&condition="+condition.toString()+"&binding="+binding.toString()+"&language="+language.toString());
        console.log("str=" + str)
        request.send(str);
    } catch (e)
    {
        alert("Unable to connect to server." + e);
    }
}
function getInfo()
{
    //console.log("getsignin called" + request.readyState);
    if (request.readyState === 4)
    {
        document.getElementsByClassName("products-row")[0].style.display = "flex";
        document.getElementsByClassName("products-row")[1].style.display = "flex";
        document.getElementById("nrf").style.display = "none";
        var text = request.responseText;
        console.log(text);
        var obj = JSON.parse(text);
        json = JSON.parse(text);
        var j = 0;
        if (obj.length > 0)
        {
            console.log(text);
            //console.log(obj[0].title);
            for (var i = 0; i < obj.length && i < image.length; i++)
            {
                //console.log(image[i]);
                image[i].src = obj[i].thumbnail;
                price[i].innerHTML = "₹" + obj[i].price;
                console.log("price=" + "₹" + obj[i].price);
                title[i].innerHTML = obj[i].title;
                product[i].style.display = "block";
            }
            j = obj.length;
            //console.log(j);
            for (l = j; l < product.length; l++)
            {
                product[l].style.display = "none";
            }
        } else
        {
            document.getElementsByClassName("products-row")[0].style.display = "none";
            document.getElementsByClassName("products-row")[1].style.display = "none";
            document.getElementById("nrf").style.display = "block";
        }
    }
}
function applyFilter(filtername, filter)
{
    document.getElementById("page").style.display="none";
    document.getElementById("orderby").style.display="none";
    console.log(filtername);
    if (filtername === "category" )
    {
        console.log(filter.innerHTML);
        category = filter.innerHTML;
    } 
    else if(filtername === "cat" )
    {
        console.log("in here");
        filtername="category";
        category = filter;
    }else if (filtername === "price")
    {
        console.log(filter);
        p = filter;
    } else if (filtername === "condition")
    {
        var f = 0;
        for (var i = 0; i < condition.length; i++)
        {
            if (condition[i] === filter)
            {
                condition.splice(i, 1);
                f = 1;
            }
        }
        if (f === 0)
        {
            condition.push(filter);
        }
        console.log(condition);
        console.log(condition.length);
    } else if (filtername === "binding")
    {
        var f = 0;
        for (var i = 0; i < binding.length; i++)
        {
            if (binding[i] === filter)
            {
                binding.splice(i, 1);
                f = 1;
            }
        }
        if (f === 0)
        {
            binding.push(filter);
        }
        console.log(binding);
    } else if (filtername === "language")
    {
        var f = 0;
        for (var i = 0; i < language.length; i++)
        {
            if (language[i] === filter)
            {
                language.splice(i, 1);
                f = 1;
            }
        }
        if (f === 0)
        {
            language.push(filter);
        }
        console.log(language);
    }
    sendFilters();
}
function setTitle(n)
{
    var title = document.getElementsByClassName("product-title")[n].innerHTML;
    console.log(title);
    if (window.XMLHttpRequest)
    {
        request = new XMLHttpRequest();
    } else if (window.ActiveXObject)
    {
        request = new ActiveXObject("Microsoft.XMLHTTP");
        //alert("ActiveXObject object created");
    }
    try
    {
        request.open("POST", "SetTitle", true);
        request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        request.send("title="+title+"&seller="+json[n].sid+"&isbn="+json[n].ISBN);
    } catch (e)
    {
        alert("Unable to connect to server." + e);
        document.getElementById("sr").value = "not found";
    }

}
function addToWishList(n)
{
    if (window.XMLHttpRequest)
    {
        request = new XMLHttpRequest();
    } else if (window.ActiveXObject)
    {
        request = new ActiveXObject("Microsoft.XMLHTTP");
        //alert("ActiveXObject object created");
    }
    try
    {
        request.open("POST", "AddToWishList", true);
        request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        request.send("seller="+json[n].sid+"&isbn="+json[n].ISBN);
    } catch (e)
    {
        alert("Unable to connect to server." + e);
        document.getElementById("sr").value = "not found";
    }

}
/*console.log(document.getElementById("myRang"));
 var slider = document.getElementById("myRang");
 var output = document.getElementById("demo");
 output.innerHTML = slider.value;
 slider.oninput = function() {
 console.log("function called");
 output.innerHTML = slider.value;
 };
 */


