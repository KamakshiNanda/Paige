/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*code to add image*/
function takeInput(ele)
{
    console.log("inside takeInput");
    var id=ele.id;
    if(id==="p1"||id==="ic1")
    {
        console.log(id);
	document.getElementById("fp1").click();
    }
    else if(id==="p2"||id==="ic2")
    {
	console.log(id);
	document.getElementById("fp2").click();
    }
    else if(id==="p3"||id==="ic3")
    {
	console.log(id);
        document.getElementById("fp3").click();
    }
    else if(id==="p4"||id==="ic4")
    {
	console.log(id);
	document.getElementById("fp4").click();
    }
    else if(id==="p5"||id==="ic5")
    {
	console.log(id);
	document.getElementById("fp5").click();
    }
}
function getResponse(ele)
{
    console.log(ele.value);
    var id=ele.id;
    var input=ele;
    var val=ele.value;
    if(id==="fp1")
    {
	/*document.getElementById("p1").style.display="none";
	document.getElementById("ic1").style.display="block";
	document.getElementById("i1").src=val;
	var obj=/\w+\..*$/.exec(val);
	document.getElementById("i1").alt=obj[0];
        console.log(obj[0]);
        */											
        if (input.files && input.files[0]) 
        {
            console.log(input.files);
            var reader = new FileReader();
            reader.onload = function (e) 
            {
                console.log(e);
                console.log(e.target);
                //console.log(e.target.result);
                $('#i1').attr('src', e.target.result);
            };
            document.getElementById("p1").style.display="none";
            document.getElementById("ic1").style.display="block";
            reader.readAsDataURL(input.files[0]);
        }
    }
    else if(id==="fp2")
    {
        if (input.files && input.files[0]) 
        {
            console.log(input.files);
            var reader = new FileReader();
            reader.onload = function (e) 
            {
                console.log(e);
                //console.log(e.target.result);
                $('#i2').attr('src', e.target.result);
            };
            document.getElementById("p2").style.display="none";
            document.getElementById("ic2").style.display="block";
            reader.readAsDataURL(input.files[0]);
        }
    }
    else if(id==="fp3")
    {
        if (input.files && input.files[0]) 
        {
            console.log(input.files);
            var reader = new FileReader();
            reader.onload = function (e) 
            {
                console.log(e);
                //console.log(e.target.result);
                $('#i3').attr('src', e.target.result);
            };
            document.getElementById("p3").style.display="none";
            document.getElementById("ic3").style.display="block";
            reader.readAsDataURL(input.files[0]);
        }
    }
    else if(id==="fp4")
    {
        if (input.files && input.files[0]) 
        {
            console.log(input.files);
            var reader = new FileReader();
            reader.onload = function (e) 
            {
                console.log(e);
                //console.log(e.target.result);
                $('#i4').attr('src', e.target.result);
            };
            document.getElementById("p4").style.display="none";
            document.getElementById("ic4").style.display="block";
            reader.readAsDataURL(input.files[0]);
        }
    }
    else if(id==="fp5")
    {
        if (input.files && input.files[0]) 
        {
            console.log(input.files);
            var reader = new FileReader();
            reader.onload = function (e) 
            {
                console.log(e);
                ///console.log(e.target.result);
                $('#i5').attr('src', e.target.result);
            };
            document.getElementById("p5").style.display="none";
            document.getElementById("ic5").style.display="block";
            reader.readAsDataURL(input.files[0]);
        }
    }
}
											