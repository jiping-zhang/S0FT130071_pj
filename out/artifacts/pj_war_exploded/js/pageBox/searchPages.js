const setPageBox = (function ()
{
	return function ()
	{
		let pageBoxElement = document.getElementById('pageBox');
		let imgULFromPHP = document.getElementById("imgList");
		let imgsOnEachPage = imgULFromPHP.getElementsByClassName('onePageInfo');
		let innerHTMLOfPageBox = "<ul><li><span class=\"singleItem\" id='firstPageBt'>首页</span></li><li><span class=\"singleItem\" id='formerPageBt'>上一页</span></li>";
		for (let i = 0; i < Math.max(imgsOnEachPage.length,1); i++)
		{
			innerHTMLOfPageBox = innerHTMLOfPageBox + "<li><span class=\"singleItem pageNumberBt\">" + (i + 1) + "</span></li>";
		}
		innerHTMLOfPageBox = innerHTMLOfPageBox + "<li><span class=\"singleItem\" id='latterPageBt'>下一页</span></li><li><span class=\"singleItem\" id='lastPageBt'>末页</span></li></ul>"
		pageBoxElement.innerHTML = innerHTMLOfPageBox;
		let pageNumberBtArray = pageBoxElement.getElementsByClassName('pageNumberBt');
		for (let i = 0; i < pageNumberBtArray.length; i++)
		{
			pageNumberBtArray[i].onclick = function ()
			{
				setPageNumber(i)  //  button'1' in pageBox relates to page 0 ; button'2' to 1 ; ...... ; button'n' relates to page n-1 .
			}
		}
		document.getElementById('firstPageBt').onclick=function (){setPageNumber(0)};
		document.getElementById('lastPageBt').onclick=function(){setPageNumber(pageNumberBtArray.length-1)};
		document.getElementById('formerPageBt').onclick=function(){
			setPageNumber(Math.max(parseInt(document.getElementById('selectedPage').innerHTML)-2,0))
		};
		document.getElementById('latterPageBt').onclick=function(){
			setPageNumber(Math.min(parseInt(document.getElementById('selectedPage').innerHTML),pageNumberBtArray.length-1))
		};
		setPageNumber(0);
	}
})();

const setPageNumber = (function ()
{
	const IMG_FOLDER_URL = "sources/img/";
	let lastSelectPage;
	const numberBtList=document.getElementById('pageBox').getElementsByClassName('pageNumberBt');
	const contentElement=document.getElementById('content');
	const contImgList = contentElement.getElementsByClassName('contImg');
	const descriptionList=contentElement.getElementsByClassName("description");
	const linksList=contentElement.getElementsByClassName("linkToDetailPage");

	return function (pageIndex) // if there are n pages , than pageIndex can be : 0 , 1 , 2 , ...... , n-1
	{
		try{
			numberBtList[lastSelectPage].removeAttribute('id');
		}
		catch (ignored)
		{

		}
		numberBtList[pageIndex].setAttribute('id','selectedPage');
		lastSelectPage=pageIndex;
		let imgULFromPHP = document.getElementById("imgList");
		let imgsOnEachPage = imgULFromPHP.getElementsByClassName('onePageInfo');
		let imgsInfoLIList = imgsOnEachPage[pageIndex].getElementsByTagName('ul')[0].getElementsByClassName('oneImgInfo');
		for (let i = 0; i < 6; i++)
		{
			try
			{
				contImgList[i].src = IMG_FOLDER_URL + imgsInfoLIList[i].getElementsByTagName('p')[0].innerHTML;
				linksList[i].setAttribute("href","detailServlet?imageID="+imgsInfoLIList[i].getElementsByTagName('h5')[0].innerHTML)
				descriptionList[i].getElementsByTagName("h3")[0].innerHTML=imgsInfoLIList[i].getElementsByTagName('h6')[0].innerHTML;
				descriptionList[i].getElementsByTagName("p")[0].innerHTML=imgsInfoLIList[i].getElementsByTagName('article')[0].innerHTML;
			} catch (e)
			{
				contImgList[i].src = IMG_FOLDER_URL + 'nomore.jpg';
				linksList[i].setAttribute("href","#")
				descriptionList[i].getElementsByTagName("h3")[0].innerHTML="";
				descriptionList[i].getElementsByTagName("p")[0].innerHTML="";
			}
		}
	}
})(0);

/*
const goToDetailPage = (function ()
{
	const imageIDForm = document.getElementById('imageIDForm');
	const imageIDInput= document.getElementById('imageIDInput');
	const imagePathInput= document.getElementById('imagePathInput');
	return function (imageID,imagePath)
	{
		imageIDInput.value=imageID;
		imagePathInput.value=imagePath;
		imageIDForm.submit();
	}
})();*/