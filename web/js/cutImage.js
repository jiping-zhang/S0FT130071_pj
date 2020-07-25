const cutImage = (function ()
{
	return function ()
	{
		let containerList = document.getElementsByClassName('imgContainer');
		let imgList = document.getElementsByClassName('contImg');
		for (let i = 0; i < imgList.length; i++)
		{
			let container = containerList[i];
			let standardWidth = container.clientWidth;
			let standardHeight = container.clientHeight;
			if ((imgList[i].clientWidth / standardWidth) !== (imgList[i].clientHeight / standardHeight))
			{
				if ((imgList[i].clientWidth / standardWidth) > (imgList[i].clientHeight / standardHeight))
				{
					imgList[i].style.height = (standardHeight + "px");
					imgList[i].style.width = "auto";
					imgList[i].style.left = ("-" + 0.5 * (imgList[i].clientWidth - standardWidth) + "px");
					imgList[i].style.top = '0';
				}
				else
				{
					imgList[i].style.width = (standardWidth + "px");
					imgList[i].style.height = "auto";
					imgList[i].style.top = ("-" + 0.5 * (imgList[i].clientHeight - standardHeight) + "px");
					imgList[i].style.left = '0';
				}
			}
			else
			{
				imgList[i].style.height = (standardHeight + "px");
				imgList[i].style.width = (standardWidth + "px");
				imgList[i].style.top = '0';
				imgList[i].style.left = '0';
			}
		}
	}
})();

window.addEventListener("load",cutImage);
/*
let containerList=document.getElementsByClassName('imgContainer');
for (let i = 0; i < containerList.length; i++)
{
	containerList[i].getElementsByClassName('contImg')[0].onchange=cutImage(containerList[i]);
}*/
