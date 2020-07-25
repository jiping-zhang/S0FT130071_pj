/*请在该区域内声明或者获取所要使用的全局变量*/
/********************************************begin************************************/

/*Global Variable Area */
let currentPageIndex = 1; //当前图片的页码（注意，这里从1开始而非从0开始）
let isPlaying = false;  //是否有动画正在播放
let autoPlay = true; //是否自动播放动画（鼠标不在图片展示区上的时候为true）
const timePerAnimation = 500;  //每次翻一页的过渡动画时长（单位：ms）
const timePerFrame = 20;   //每一帧持续时长（单位：ms）
const framesPerAnimation = timePerAnimation / timePerFrame; //每次翻一页的过渡动画帧数
const widthPerImg = 600;
const movementPerFrame = widthPerImg / framesPerAnimation; //每一帧滚轮应该向前或向后滚的距离
const imgWheel = document.getElementById("contLeft").getElementsByClassName("wrap")[0];
const formerImgBt = document.getElementById("contLeft").getElementsByClassName("arrow_left")[0];
const latterImgBt = document.getElementById("contLeft").getElementsByClassName("arrow_right")[0];
const pageBts = document.getElementById("contLeft").getElementsByClassName("buttons")[0].getElementsByTagName("span");
const numberOfPages = pageBts.length;
const wheelWidth=widthPerImg*numberOfPages;
const container = document.getElementsByClassName("container")[0];

const gotoFormerPage = (function ()
{
    let framesHasPlayed = 0;
    let currentLeft;
    return function (shiftPageTimes)//向前翻页次数
    {
        if (!isPlaying)
        {
            let framesInThisAnimation = framesPerAnimation * shiftPageTimes;
            isPlaying = true;
            pageBts[currentPageIndex - 1].removeAttribute("class");
            currentLeft = currentPageIndex * widthPerImg;
            currentPageIndex -= shiftPageTimes;
            if (currentPageIndex <= 0)
                currentPageIndex += numberOfPages;
            let timer = setInterval(function ()
            {
                framesHasPlayed++;
                currentLeft -= movementPerFrame;
                if (currentLeft <= 0)
                    currentLeft += wheelWidth;
                imgWheel.style.left = ("-" + currentLeft + "px");
                if (framesHasPlayed >= framesInThisAnimation)
                {
                    pageBts[currentPageIndex - 1].setAttribute("class", "on");
                    framesHasPlayed = 0;
                    isPlaying = false;
                    clearInterval(timer);
                }
            }, timePerFrame)
        }
    }
})();
const gotoLatterPage = (function ()
{
    let framesHasPlayed = 0;
    let currentLeft;
    return function (shiftPageTimes)
    {
        if (!isPlaying)
        {
            let framesInThisAnimation = framesPerAnimation * shiftPageTimes;
            isPlaying = true;
            pageBts[currentPageIndex - 1].removeAttribute("class");
            currentLeft = currentPageIndex * widthPerImg;
            currentPageIndex += shiftPageTimes;
            if (currentPageIndex > numberOfPages)
                currentPageIndex -= numberOfPages;
            let timer = setInterval(function ()
            {
                framesHasPlayed++;
                currentLeft += movementPerFrame;
                if (currentLeft >= wheelWidth)
                    currentLeft -= wheelWidth;
                imgWheel.style.left = ("-" + currentLeft + "px");
                if (framesHasPlayed >= framesInThisAnimation)
                {
                    pageBts[currentPageIndex - 1].setAttribute("class", "on");
                    framesHasPlayed = 0;
                    isPlaying = false;
                    clearInterval(timer);
                }
            }, timePerFrame)
        }
    }
})();

/*********************************************end*************************************/


/* 任务一
 * 请参考css中的style参数、html中的内容、下方的效果要求，然后在下面区域内编写代码。
 * 效果要求：
 * ①点击左箭头prev和右箭头next的时候，可以切换到前一张图片和下一张图片。（左右箭头为html中的a标签）
 * ②每切换一张图片，右下角的数字标记对应变化。
 *      如：一开始，第1张图片显示出来，右下角的1-5的数值中，数值1位红色，2-4为绿色，表示当前显示第1张图片。
 *      点击next箭头，图片切换到第2张，同时，右下角红色数值从1切换为2，数值1,3,4,5为绿色。
 * ③当当前图片为第1张时，点击prev箭头，切换到第5张图片，且数值5置为红色。
 * 当当前图片为第5张时，点击next箭头，切换到第1张图片，且数值1置为红色。
 * ④切换图片的过程不要求，可直接切换，也可动画切换，但要求保证一定的切换动画合理性，不能出去明显的衔接不当。
 * ⑤本部分只能使用原生JS。
 */
/********************************************begin************************************/

/*Code Here*/
formerImgBt.onclick = function ()
{
    gotoFormerPage(1)
};
latterImgBt.onclick = function ()
{
    gotoLatterPage(1);
};

/*********************************************end*************************************/


/* 任务二
 * 请参考css中的style参数、html中的内容、下方的效果要求，然后在下面区域内编写代码。
 * 效果要求：
 * ①轮播可以自动播放，切换图片间隔为2s，每一次切换的效果与点击next箭头的效果一致。
 * ②当鼠标移入轮播区域内时，停止自动播放。
 * ③当鼠标不在轮播区域内时，开始自动播放。
 * ④页面刚加载完成时，如果鼠标不在轮播区域内，自动开始自动播放；否则，等待直到鼠标移出轮播区域，再进行自动播放。
 * ⑤本部分只能使用原生JS。
 */
/********************************************begin************************************/

/*Code Here*/
/*container.onmouseover = function ()
{
	autoPlay = false;
};
container.onmouseleave = function ()
{
	autoPlay = true;
};
setInterval(function ()
{
	if (autoPlay)
		gotoLatterPage(1);
}, 2000);*/

/*********************************************end*************************************/


/* 任务三
 * 请参考css中的style参数、html中的内容、下方的效果要求，然后在下面区域内编写代码。
 * 效果要求：
 * ①点击右下角的任意一个数值，能够切换到对应图片，且相应数值变为红色。
 * ②进行①操作过后，是否自动播放，其规则与上一个任务一致。
 * ③本部分只能使用原生JS。
 */
/********************************************begin************************************/

/*Code Here*/
const turnToPage = (function ()
{
    let former,latter;
    return function (targetIndex)
    {
        if (targetIndex!==currentPageIndex)
        {
            former=currentPageIndex-targetIndex;
            if (former<0)
                former+=numberOfPages;
            latter=targetIndex-currentPageIndex;
            if (latter<0)
                latter+=numberOfPages;
            if (former<latter)
                gotoFormerPage(former);
            else
                gotoLatterPage(latter);
        }
        /*if (targetIndex>currentPageIndex)
            gotoLatterPage(targetIndex-currentPageIndex);
        else if (targetIndex<currentPageIndex)
            gotoFormerPage(currentPageIndex-targetIndex);*/
    }
})();
for (let i = 0; i < numberOfPages; i++)
{
    pageBts[i].onclick=function ()
    {
        turnToPage(i+1);
    }
}

/*********************************************end*************************************/


/*任务四
 * 请参考css中的style参数、html中的内容、下方的效果要求，然后在下面区域内编写代码。
 * 效果要求：
 * ①点击某一非表头的单元格，可以编辑其内容，编辑完毕后点击其他部位，可以在界面上显示修改后的内容。
 * ②点击单元格后，光标自动定位于单元格的首个字符或者汉字前。
 * ③本部分可以使用jQuery，也可以使用原生JS。
 */
/********************************************begin************************************/

/*Code Here*/



/*********************************************end*************************************/