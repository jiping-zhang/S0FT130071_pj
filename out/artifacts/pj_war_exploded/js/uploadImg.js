document.getElementById("file0").addEventListener('change',function ()
{
	let objUrl = getObjectURL(document.getElementById("file0").files[0]);
	if (objUrl!="")
	{
		document.getElementById("imgContainer0").innerHTML='<img src="'+objUrl+'" class="contImg" id="img0">';
		/*document.getElementById('img0').onload=function ()
		{
			stretchImage();
		}*/
		document.getElementById('img0').addEventListener('load',function (){const container = document.getElementsByClassName('imgContainer')[0];
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
			}});
	}
});

function getObjectURL(file) {
	let url = null;
	if(window.createObjectURL!=undefined) {
		url = window.createObjectURL(file) ;
	}else if (window.URL!=undefined) { // mozilla(firefox)
		url = window.URL.createObjectURL(file) ;
	}else if (window.webkitURL!=undefined) { // webkit or chrome
		url = window.webkitURL.createObjectURL(file) ;
	}
	return url ;
}