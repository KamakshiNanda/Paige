/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var image = document.getElementsByClassName("product-image");
var price = document.getElementsByClassName("product-price");
var title = document.getElementsByClassName("product-title");
var product = document.getElementsByClassName("product");
function searchBooks()
{
    console.log("search called");
    var searchValue = document.getElementById("search").value;
    console.log(searchValue);
    if (window.XMLHttpRequest)
    {
        request = new XMLHttpRequest();
    } else if (window.ActiveXObject)
    {
        request = new ActiveXObject("Microsoft.XMLHTTP");
    }
    try
    {
        request.onreadystatechange = getData;
        request.open("POST", "Search", true);
        request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        request.send("search=" + searchValue);
    } catch (e)
    {
        alert("Unable to connect to server." + e);
    }
    return false;
}
function getData()
{
    //console.log("getsignin called" + request.readyState);
    if (request.readyState === 4)
    {
        document.getElementsByClassName("products-row")[0].style.display = "flex";
        document.getElementsByClassName("products-row")[1].style.display = "flex";
        document.getElementById("nrf").style.display = "none";
        var text = request.responseText;
        var obj = JSON.parse(text);
        var j = 0;
        if (obj.length > 0)
        {
            console.log(text);
            //console.log(obj[0].title);
            for (var i = 0; i < obj.length && i < image.length; i++)
            {
                //console.log(image[i]);
                image[i].src = obj[i].thumbnail;
                price[i].innerHTML = obj[i].price;
                title[i].innerHTML = obj[i].title;
                product[i].style.display = "block";
                document.getElementById("filters").style.display = "none";
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

function removeInput()
{
    console.log("input for " + document.getElementById("search") + "removed");
    document.getElementById("search").value = "";
}

function removeDropDown()
{
    var table = document.getElementById("searchTable");
    table.style.display = "none";
}
function getDropDown(search)
{
    var searchValue = search.value;
    if (searchValue == "" || searchValue == null)
    {
        var table = document.getElementById("searchTable");
        table.style.display = "none";
        return;
    }
    if (window.XMLHttpRequest)
    {
        request = new XMLHttpRequest();
    } else if (window.ActiveXObject)
    {
        request = new ActiveXObject("Microsoft.XMLHTTP");
        //alert("ActiveXObject object created");
    }
    request.onreadystatechange = getInfoSearch;
    request.open("POST", "Search", true);
    request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    request.send("searchValue=" + searchValue);
}
function getInfoSearch()
{
    if (request.readyState === 4)
    {
        var table = document.getElementById("searchTable");
        while (table.hasChildNodes())
        {
            table.removeChild(table.firstChild);
        }
        var text = request.responseText;
        console.log(text);
        var obj = JSON.parse(text);
        if (obj.length > 0)
        {
            var size;
            if (obj.length > 6)
            {
                size = 6;
            } else
            {
                size = obj.length;
            }
            for (var i = 0; i < size; i++)
            {
                var li = document.createElement("li");
                table.style.display = "table";
                li.appendChild(document.createTextNode(obj[i]));
                table.appendChild(li);
            }
            var myFunction = function () {
                console.log("called my function");
            };
            table=document.getElementById("searchTable");
            var  hints= table.children;
            console.log("length of hints"+hints.length);
            for (var i = 0; i < hints.length; i++) {
                console.log(i+hints[i].innerHTML);
                hints[i].addEventListener('mouseover', function(){
                    console.log("called my function");
                    document.getElementById("search").value = event.target.innerHTML;});
            }
        } else
        {
            table.style.display = "none";
        }
    }
}

