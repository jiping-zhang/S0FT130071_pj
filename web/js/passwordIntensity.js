let passInput = document.getElementById("password");
passInput.addEventListener("keyup", function ()
{
	let passStr = passInput.value;
	let number = 0, lowerLetter = 0, upperLetter = 0;
	for (let i = 0; i < passStr.length; i++)
	{
		let thisChar = passStr.charAt(i);
		if ("0" <= thisChar && "9" >= thisChar)
			number++;
		else if ("a" <= thisChar && "z" >= thisChar)
			lowerLetter++;
		else if ("A" <= thisChar && "Z" >= thisChar)
			upperLetter++;
	}
	let intensity = 0;
	let intensityText=document.getElementById("intensity");
	if (number > 0)
	{
		if ((lowerLetter + upperLetter) > 0)
			intensity = 12 * number + 36 * (lowerLetter + upperLetter);
		else
			intensity = 10 * number;
	}
	else
		intensity = 26 * (lowerLetter + upperLetter);
	if (intensity<=100)
	{
		intensityText.innerHTML="极弱";
		intensityText.style.color="#ff8c93";
	}
	else if (intensity>100&&intensity<=200)
	{
		intensityText.innerHTML="　弱";
		intensityText.style.color="#ffd5b4";
	}
	else if (intensity>200&&intensity<=320)
	{
		intensityText.innerHTML="　中";
		intensityText.style.color="#fffdc7";
	}
	else if (intensity>320&&intensity<=420)
	{
		intensityText.innerHTML="　强";
		intensityText.style.color="#e8ffc6";
	}
	else if (intensity>420)
	{
		intensityText.innerHTML="很强";
		intensityText.style.color="#bbffc5";
	}
})