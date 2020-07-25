const refresh = (function ()
{
	const IMG_FOLDER_URL = "../../sources/img/travel-images/normal/medium/";
	const contentElement = document.getElementById('contRight');
	const contImgList = contentElement.getElementsByClassName('contImg');
	const titleList=contentElement.getElementsByClassName("imgTitle");
	const descriptionList = contentElement.getElementsByClassName("description");
	const allImgInfoLi = document.getElementById("imgList").getElementsByClassName("oneImgInfo");
	const numberOfImages=allImgInfoLi.length;
	const existingImg = [0, 1, 2, 3, 4, 5];

	return function ()
	{
		for (let i = 0; i < 6; i++)
		{
			let j;
			if (i===0)
			{
				j=Math.floor((Math.random()*numberOfImages));
				existingImg[i]=j;
			}
			else
			{
				let isRepeatImage=false;
				while (true)
				{
					j = Math.floor((Math.random() * numberOfImages));
					for (let k = 0; k < i; k++)
						if (existingImg[k] === j)
						{
							isRepeatImage = true;
							break;
						}
					if (!isRepeatImage)
						break;
				}
				existingImg[i]=j;
			}
			contImgList[i].src = IMG_FOLDER_URL + allImgInfoLi[j].getElementsByTagName('p')[0].innerHTML;
			contImgList[i].imageID = parseInt(allImgInfoLi[j].getElementsByTagName('h5')[0].innerHTML);
			contImgList[i].style.cursor = 'pointer';
			contImgList[i].onclick=function ()
			{
				goToDetailPage(this.imageID,this.src);
			};
			titleList[i].getElementsByTagName("h3")[0].innerHTML=allImgInfoLi[j].getElementsByTagName('h6')[0].innerHTML;
			descriptionList[i].getElementsByTagName("p")[0].innerHTML=allImgInfoLi[j].getElementsByTagName('article')[0].innerHTML;
		}
	}
})();

const set6HotImg=(function ()
{
	const IMG_FOLDER_URL = "../../sources/img/travel-images/normal/medium/";
	const contentElement = document.getElementById('contRight');
	const contImgList = contentElement.getElementsByClassName('contImg');
	const titleList=contentElement.getElementsByClassName("imgTitle");
	const descriptionList = contentElement.getElementsByClassName("description");
	const allImgInfoLi = document.getElementById("imgList").getElementsByClassName("oneImgInfo");
	const numberOfImages=allImgInfoLi.length;
	return function ()
	{
		for (let i = 0; i < 6; i++)
		{
			contImgList[i].src = IMG_FOLDER_URL + allImgInfoLi[i].getElementsByTagName('p')[0].innerHTML;
			contImgList[i].imageID = parseInt(allImgInfoLi[i].getElementsByTagName('h5')[0].innerHTML);
			contImgList[i].style.cursor = 'pointer';
			contImgList[i].onclick=function ()
			{
				goToDetailPage(this.imageID,this.src);
			};
			titleList[i].getElementsByTagName("h3")[0].innerHTML=allImgInfoLi[i].getElementsByTagName('h6')[0].innerHTML;
			descriptionList[i].getElementsByTagName("p")[0].innerHTML=allImgInfoLi[i].getElementsByTagName('article')[0].innerHTML;
		}
	}
})();

const goToDetailPage = (function ()
{
	const imageIDForm = document.getElementById('imageIDForm');
	const imageIDInput = document.getElementById('imageIDInput');
	const imagePathInput = document.getElementById('imagePathInput');
	return function (imageID, imagePath)
	{
		imageIDInput.value = imageID;
		imagePathInput.value = imagePath;
		imageIDForm.submit();
	}
})();


const setHottestImg=(function ()
{
	const IMG_FOLDER_URL = "../../sources/img/travel-images/normal/medium/";
	const hottestImgElement=document.getElementById("contLeft").getElementsByClassName("contImg")[0];
	const hottestImgInfo=document.getElementById("hottestImgInfo");
	return function ()
	{
		hottestImgElement.src=IMG_FOLDER_URL +hottestImgInfo.getElementsByTagName("p")[0].innerHTML;
		hottestImgElement.imageID=parseInt(hottestImgInfo.getElementsByTagName("h5")[0].innerHTML);
		hottestImgElement.style.cursor="pointer";
		hottestImgElement.onclick=function ()
		{
			goToDetailPage(this.imageID,this.src);
		}
	}
})();

