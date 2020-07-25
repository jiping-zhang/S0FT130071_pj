/*const setCity = (function ()
{
	let cityAndCountryInfo = document.getElementById("cityAndCountryInfo");
	let countryNameArray = [];
	let city = {};
	let countryNameElements = cityAndCountryInfo.getElementsByClassName('countryName');
	for (let i = 0; i < countryNameElements.length; i++)
	{
		countryNameArray.push(countryNameElements[i].innerHTML);
		let cityNameElements = cityAndCountryInfo.getElementsByClassName('countryInfo')[i].getElementsByClassName('cityName');
		let citiesInThisCountry = [];
		for (let j = 0; j < cityNameElements.length; j++)
			citiesInThisCountry.push(cityNameElements[j].innerHTML);
		city[countryNameArray[i]] = citiesInThisCountry;
	}
	countrySelect = document.getElementById("country");
	citySelect = document.getElementById("city");
	for (i = 0; i < countryNameArray.length; i++)
	{
		j = i + 1;
		countrySelect.options[j] = new Option();
		countrySelect.options[j].text = countryNameArray[i];
		countrySelect.options[j].value = countryNameArray[i];
	}
	return function (countrySelect, citySelect)
	{
		var countryValue = countrySelect.value;
		var i, j;
		citySelect.length = 1;
		if (countryValue === '0') return;
		if (typeof (city[countryValue]) == 'undefined') return;
		for (i = 0; i < city[countryValue].length; i++)
		{
			j = i + 1;
			citySelect.options[j] = new Option();
			citySelect.options[j].text = city[countryValue][i];
			citySelect.options[j].value = city[countryValue][i];
		}
	}
})();*/

let countrySelect = document.getElementById("country");
let citySelect = document.getElementById("city");
const setCity = function()
{
    let countrySelect = document.getElementById("country");
    let citySelect = document.getElementById("city");
    return function ()
    {
        let countryValue=countrySelect.value;
        citySelect.length=1;
        if(countryValue=='0') return;
        if(typeof(cities[countryValue])=='undefined') return;
        let cityInThisCountry=cities[countryValue];
        for(i=0; i<cityInThisCountry.length; i++)
        {
            citySelect.options[i+1] = new Option();
            citySelect.options[i+1].text = cityInThisCountry[i];
            citySelect.options[i+1].value = cityInThisCountry[i];
        }
    }
}()
countrySelect.onchange = function()
{
	/*let index = countrySelect.options[countrySelect.selectedIndex].value;

	for(let k = 1; k < citySelect.length; k++)
	{
		citySelect.removeChild(citySelect.children[k--]);
	}

	for(let i in city[index])
	{
		let option_city = document.createElement('option');
		option_city.innerHTML = city[index][i];
		option_city.setAttribute('value', city[index][i]);
		citySelect.appendChild(option_city);
	}*/
	let countryValue=countrySelect.value;
	citySelect.length=1;
	if(countryValue=='0') return;
	if(typeof(cities[countryValue])=='undefined') return;
	let cityInThisCountry=cities[countryValue];
	for(i=0; i<cityInThisCountry.length; i++)
	{
		citySelect.options[i+1] = new Option();
		citySelect.options[i+1].text = cityInThisCountry[i];
		citySelect.options[i+1].value = cityInThisCountry[i];
	}
}
