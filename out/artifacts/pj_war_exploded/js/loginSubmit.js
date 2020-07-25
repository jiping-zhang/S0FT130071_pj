function submitForm()
{
    let loginForm = document.getElementById("loginForm");
    let imgCheckInput = document.getElementById("imgCheckInput");
    if (imgCheckInput.value==1)
        loginForm.submit()
    else
        alert("请完成图片验证")
}