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
        request.open("POST", "MyBooks", true);
        request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        request.send();
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



