var changeTableWidth=(function ()
{
	return function ()
	{
		var tdArray=document.getElementsByTagName("td");
		var tdWidth=document.getElementById("content").clientWidth*0.3;
		for (let i = 0; i < tdArray.length ; i++)
		{
			tdArray[i].style.width=tdWidth+"px";
		}
		document.getElementsByTagName("button")[0].style.width=tdWidth+"px";
	}
})();

window.addEventListener("load",changeTableWidth);

window.addEventListener("resize",changeTableWidth);