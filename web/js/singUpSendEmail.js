/*
const sendEmailBt=document.getElementById("sendEmailBt");
const sendEmail=function ()
{
	const userName = document.getElementById("userName");
	const sendEmailBt=document.getElementById("sendEmailBt");
	let resendTime=0;
	const sendEmailForm=document.getElementById("emailForm");
	const imgCheckInput=document.getElementById("imgCheckInput");
	function refreshResendTime()
	{
		const resendTimeP=document.getElementById("resendTime");
		return function ()
		{
			resendTime--;
			if (resendTime>0)
			{
				resendTimeP.innerHTML=(resendTime+"秒");
			}
			else
			{
				resendTimeP.innerHTML="";
				sendEmailBt.removeAttribute("disabled");
			}
		}
	}
	return function ()
	{
		if (userName.checkValidity())
		{
			if (imgCheckInput.value==1)
			{
				resendTime=60;
				sendEmailBt.setAttribute("disabled","disabled");
				let resendTimer=setInterval(refreshResendTime(),1000);
				sendEmailForm.submit();
			}
			else
			{
				alert("请先完成图片验证");
			}
		}
		else
		{
			alert('必须输入有效的邮箱地址才能发送验证邮件！！');
		}
	}
}();
sendEmailBt.onclick=function ()
{
	sendEmail()
};

document.getElementById("userName").addEventListener("blur",function ()
{
	document.getElementById("emailAddressInput").value=this.value;
});*/
