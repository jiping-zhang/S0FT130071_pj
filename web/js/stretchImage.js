/*var stretchImage=(function ()
{
	return function ()
	{
		const container = document.getElementsByClassName('imgContainer')[0];
		const standardWidth = container.clientWidth;
		const standardHeight = container.clientHeight;
		const imgList = document.getElementsByClassName('contImg');
		for (let i = 0; i < imgList.length; i++)
		{

			if ((imgList[i].clientWidth/standardWidth) !== (imgList[i].clientHeight/standardHeight))
			{
				if ((imgList[i].clientWidth/standardWidth) < (imgList[i].clientHeight/standardHeight))
				{
					imgList[i].style.height = (standardHeight + "px");
					imgList[i].style.width = "auto";
					imgList[i].style.left=(0.5*(standardWidth-imgList[i].clientWidth)+"px");
					imgList[i].style.top="0";
				}
				else
				{
					imgList[i].style.width = (standardWidth + "px");
					imgList[i].style.height = "auto";
					imgList[i].style.top=(0.5*(standardHeight-imgList[i].clientHeight)+"px");
					imgList[i].style.left="0";
				}
			}
			else
			{
				imgList[i].style.height = (standardHeight + "px");
				imgList[i].style.width = (standardWidth + "px");
			}
		}
	}
})();*/

function stretchImage()
{
	return function ()
	{
		const container = document.getElementsByClassName('imgContainer')[0];
		const standardWidth = container.clientWidth;
		const standardHeight = container.clientHeight;
		const imgList = document.getElementsByClassName('contImg');
		for (let i = 0; i < imgList.length; i++)
		{

			if ((imgList[i].clientWidth/standardWidth) !== (imgList[i].clientHeight/standardHeight))
			{
				if ((imgList[i].clientWidth/standardWidth) < (imgList[i].clientHeight/standardHeight))
				{
					imgList[i].style.height = (standardHeight + "px");
					imgList[i].style.width = "auto";
					imgList[i].style.left=(0.5*(standardWidth-imgList[i].clientWidth)+"px");
					imgList[i].style.top="0";
				}
				else
				{
					imgList[i].style.width = (standardWidth + "px");
					imgList[i].style.height = "auto";
					imgList[i].style.top=(0.5*(standardHeight-imgList[i].clientHeight)+"px");
					imgList[i].style.left="0";
				}
			}
			else
			{
				imgList[i].style.height = (standardHeight + "px");
				imgList[i].style.width = (standardWidth + "px");
				imgList[i].style.top="0";
				imgList[i].style.left="0";
			}
		}
	}
}

window.addEventListener("load",stretchImage());

// document.getElementById("img0").addEventListener("load",stretchImage());

window.addEventListener("resize",stretchImage());
