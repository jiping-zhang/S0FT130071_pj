var changePosition=function ()
{
	const body=document.getElementsByTagName("body")[0];
	const contLeft=document.getElementById("contLeft");
	const contRight=document.getElementById("contRight");
	return function ()
	{
		if (body.clientWidth<=1162)
		{
			contLeft.style.width="95%";
			contRight.style.width="95%";
		}
		else
		{
			contLeft.style.width="45%";
			contRight.style.width="45%";
		}
		cutImage();
	}
}();

window.addEventListener("load",changePosition);

window.addEventListener("resize",changePosition);