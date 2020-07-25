let contentRecommendBox=document.getElementById("contentRecommendBox");
let hotContentLi=document.getElementById("hotContent").getElementsByTagName('li');
for (let i = 0; i < hotContentLi.length; i++)
{
	if (i>0)
		contentRecommendBox.appendChild(document.createElement("br"));
	let singleColumn=document.createElement("span");
	singleColumn.innerHTML=hotContentLi[i].innerHTML;
	singleColumn.setAttribute("class","singleItem");
	let onclickStr="document.getElementById('contentSelect').value='"+hotContentLi[i].innerHTML+"';document.getElementById('contentForm').submit();"
	singleColumn.setAttribute("onclick",onclickStr);
	contentRecommendBox.appendChild(singleColumn);
}
let countryRecommendBox=document.getElementById("countryRecommendBox");
let hotCountryLi=document.getElementById("hotCountries").getElementsByTagName("li");
for (let i = 0; i < hotCountryLi.length; i++)
{
	if (i>0)
		countryRecommendBox.appendChild(document.createElement("br"));
	let singleColumn=document.createElement("span");
	singleColumn.innerHTML=hotCountryLi[i].innerHTML;
	singleColumn.setAttribute("class","singleItem");
	let onclickStr="document.getElementById('country').value='"+hotCountryLi[i].innerHTML+"';document.getElementById('contentForm').submit();"
	singleColumn.setAttribute("onclick",onclickStr);
	countryRecommendBox.appendChild(singleColumn);
}
let cityRecommendBox=document.getElementById("cityRecommendBox");
let hotCityLi=document.getElementById("hotCities").getElementsByTagName("li");
for (let i = 0; i < hotCountryLi.length; i++)
{
	if (i>0)
		contentRecommendBox.appendChild(document.createElement("br"));
	let singleColumn=document.createElement("span");
	let countryName=hotCityLi[i].getElementsByTagName("h5")[0].innerHTML;
	let cityName=hotCityLi[i].getElementsByTagName("p")[0].innerHTML;
	singleColumn.innerHTML=cityName;
	singleColumn.setAttribute("class","singleItem");
	let onclickStr="document.getElementById('country').value='"+countryName+"';setCity(document.getElementById('country'),document.getElementById('city'));document.getElementById('city').value='"+cityName+"';document.getElementById('contentForm').submit();";
	singleColumn.setAttribute("onclick",onclickStr);
	cityRecommendBox.appendChild(singleColumn);
}