// used in navItems/browserPage.php

var setCity = (function ()
	{
		let cities = new Object();
		cities['China'] = ['Shanghai', 'Kunming', 'Beijing', 'Yantai'];
		cities['United States'] = ['New York', 'San Francisco', 'Washington'];
		cities['Japan'] = ['Tokyo', 'Osaka-shi', 'Kamakura'];
		cities['Italy'] = ['Roma', 'Milano', 'Venezia', 'Firenze'];
		return function (countryForm, cityForm)
		{
			var countryValue = countryForm.value;
			var i, j;
			cityForm.length = 1;
			if (countryValue == '0') return;
			if (typeof (cities[countryValue]) == 'undefined') return;
			for (i = 0; i < cities[countryValue].length; i++)
			{
				j = i + 1;
				cityForm.options[j] = new Option();
				cityForm.options[j].text = cities[countryValue][i];
				cityForm.options[j].value = cities[countryValue][i];
			}
		}
	}
)();

/*var setCity=(function ()
	{
		cities = new Object();
		cities['China']=['Shanghai','Kunming','Beijing','Yantai'];
		cities['America']=['New York','San Francisco', 'Washington'];
		cities['Japan']=['Tokyo', 'Osaka', 'Kamakura'];
		cities['Italy']=['Roma','Milan','Venice','Florence'];
		var countryForm=document.getElementById("country");
		var cityForm=document.getElementById("city");
		return function ()
		{
			var countryValue=countryForm.value;
			var i, j;
			cityForm.length=1;
			if(countryValue=='0') return;
			if(typeof(cities[countryValue])=='undefined') return;
			for(i=0; i<cities[countryValue].length; i++)
			{
				j = i+1;
				cityForm.options[j] = new Option();
				cityForm.options[j].text = cities[countryValue][i];
				cityForm.options[j].value = cities[countryValue][i];
			}
		}
	}
)();*/

setCity(document.getElementById("country"), document.getElementById("city"));
