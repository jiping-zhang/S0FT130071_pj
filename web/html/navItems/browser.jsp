<%@ page import="dao.DAO" %>
<%@ page import="pojo.entity.domain.bean.TravelImage" %>
<%@ page import="java.util.*" %>
<%@ page import="pojo.entity.domain.bean.Country" %>
<%@ page import="pojo.entity.domain.bean.City" %>
<%@ page import="pojo.entity.domain.bean.TravelUser" %><%--
  Created by IntelliJ IDEA.
  User: 张稷平
  Date: 2020/7/12
  Time: 12:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>浏览</title>
    <link href="css/reset.css" rel="stylesheet" type="text/css">
    <link href="css/main.css" rel="stylesheet" type="text/css">
    <link href="css/pageBox.css" rel="stylesheet" type="text/css">
    <link href="css/pages/browser.css" rel="stylesheet" type="text/css">
    <link href="css/cutImage.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="js/browserRecommendBox.js" defer></script>
    <script type="text/javascript" src="js/cutImage.js"></script>
</head>
<body>
<div id="container">
    <header id="navBox">
        <%
            TravelUser travelUser_login;
            try
            {
                travelUser_login = (TravelUser) session.getAttribute("travelUser_login");
            }
            catch (NullPointerException e)
            {
                travelUser_login = null;
            }
            if (travelUser_login != null)
            {
        %>
                <div class="singleMenu" id="navRight">
                    <span>个人中心</span>
                    <div class="singleCont">
                        <a href="upload"><span class="singleItem"><img
                                src="sources/img/navBox/upload.jpg">上传</span></a>
                        <br>
                        <a href="myPhotosServlet"><span class="singleItem"><img
                                src="sources/img/navBox/myphotos.jpg">我的照片</span></a>
                        <br>
                        <a href="myFavoriteServlet"><span class="singleItem"><img
                                src="sources/img/navBox/myfavourite.jpg">我的收藏</span></a>
                        <br>
                        <a href="login?fromUri=browserServlet"><span class="singleItem"><img
                                src="sources/img/navBox/login.jpg">登陆</span></a>
                        <br>
                        <a href="myFriendsServlet"><span class="singleItem"><img
                                src="sources/img/navBox/myfriends.jpg">我的好友</span></a>
                    </div>
                </div>
        <%
            }
            else
            {
        %>
                <a href="login?fromUri=browserServlet"><span id="navRight" class="singleItem"><img src="sources/img/navBox/login.jpg">登陆</span></a>
        <%
            }
        %>
        <a href="welcomeServlet"><span class="singleItem">首页</span></a>
        <a href="browserServlet"><span class="singleItem" id="selected">浏览页</span></a>
        <a href="searchServlet"><span class="singleItem">搜索页</span></a>
    </header>

    <aside id="leftNavBox">
        <div class="singleMenu">
            <a><h2>search</h2></a>
            <div class="singleCont">
                <form id="searchForm" method="get">
                    <span class="singleItem"><input type="text" name="keyWord"></span>
                    <br>
                    <span class="singleItem"><input type="submit" name="submit" value="搜索"></span>
                </form>
            </div>
        </div>
        <div class="singleMenu">
            <a><h2>hot content</h2></a>
            <div class="singleCont">
                <a><span class="singleItem"
                         onclick="document.getElementById('contentSelect').value='scenery';document.getElementById('contentForm').submit();"> scenery </span></a>
                <br>
                <a><span class="singleItem"
                         onclick="document.getElementById('contentSelect').value='city';document.getElementById('contentForm').submit();"> city </span></a>
                <br>
                <a><span class="singleItem"
                         onclick="document.getElementById('contentSelect').value='people';document.getElementById('contentForm').submit();"> people </span></a>
                <br>
                <a><span class="singleItem"
                         onclick="document.getElementById('contentSelect').value='animal';document.getElementById('contentForm').submit();"> animal </span></a>
                <br>
                <a><span class="singleItem"
                         onclick="document.getElementById('contentSelect').value='building';document.getElementById('contentForm').submit();"> building </span></a>
                <br>
                <a><span class="singleItem"
                         onclick="document.getElementById('contentSelect').value='wonder';document.getElementById('contentForm').submit();"> wonder </span></a>
            </div>
        </div>
        <div class="singleMenu">
            <a><h2>hot countries</h2></a>
            <div class="singleCont">
                <a><span class="singleItem"
                         onclick="document.getElementById('country').value='China';document.getElementById('contentForm').submit();"> China </span></a>
                <br>
                <a><span class="singleItem"
                         onclick="document.getElementById('country').value='America';document.getElementById('contentForm').submit();"> America </span></a>
                <br>
                <a><span class="singleItem"
                         onclick="document.getElementById('country').value='Japan';document.getElementById('contentForm').submit();"> Japan </span></a>
                <br>
                <a><span class="singleItem"
                         onclick="document.getElementById('country').value='Italy';document.getElementById('contentForm').submit();"> Italy </span></a>
            </div>
        </div>
        <div class="singleMenu">
            <a><h2>hot cities</h2></a>
            <div class="singleCont">
                <a><span class="singleItem"
                         onclick="document.getElementById('country').value='China';setCity(document.getElementById('country'),document.getElementById('city'));document.getElementById('city').value='Shanghai';document.getElementById('contentForm').submit();"> Shanghai </span></a>
                <br>
                <a><span class="singleItem"
                         onclick="document.getElementById('country').value='America';setCity(document.getElementById('country'),document.getElementById('city'));document.getElementById('city').value='New York';document.getElementById('contentForm').submit();"> New York </span></a>
                <br>
                <a><span class="singleItem"
                         onclick="document.getElementById('country').value='Japan';setCity(document.getElementById('country'),document.getElementById('city'));document.getElementById('city').value='Tokyo';document.getElementById('contentForm').submit();"> Tokyo </span></a>
                <br>
                <a><span class="singleItem"
                         onclick="document.getElementById('country').value='China';setCity(document.getElementById('country'),document.getElementById('city'));document.getElementById('city').value='Beijing';document.getElementById('contentForm').submit();"> Beijing </span></a>
                <br>
                <a><span class="singleItem"
                         onclick="document.getElementById('country').value='Italy';setCity(document.getElementById('country'),document.getElementById('city'));document.getElementById('city').value='Roma';document.getElementById('contentForm').submit();"> Roma </span></a>
                <br>
                <a><span class="singleItem"
                         onclick="document.getElementById('country').value='America';setCity(document.getElementById('country'),document.getElementById('city'));document.getElementById('city').value='San Francisco';document.getElementById('contentForm').submit();"> San Francisco </span></a>
            </div>
        </div>
    </aside>
    <section id="content">
        <%
            List<TravelImage> travelImages = (List<TravelImage>) (request.getAttribute("travelImages"));
            int numberOfPictures = travelImages.size();
        %>
        <div class="contRow title">
            筛选
        </div>
        <div class="contRow">
            <div>
                <form name="contentForm" id="contentForm" action="browserServlet" method="get">
                    <select name="content" id="contentSelect">
                        <option value="0">-- content --</option>
                        <option value="scenery">scenery</option>
                        <option value="city">city</option>
                        <option value="people">people</option>
                        <option value="animal">animal</option>
                        <option value="building">building</option>
                        <option value="wonder">wonder</option>
                    </select>
                    <select id="country" name="country">
                        <option value="0">-- country --</option>
                        <option value="Afghanistan">Afghanistan</option>
                        <option value="Aland Islands">Aland Islands</option>
                        <option value="Albania">Albania</option>
                        <option value="Algeria">Algeria</option>
                        <option value="American Samoa">American Samoa</option>
                        <option value="Andorra">Andorra</option>
                        <option value="Angola">Angola</option>
                        <option value="Anguilla">Anguilla</option>
                        <option value="Antarctica">Antarctica</option>
                        <option value="Antigua and Barbuda">Antigua and Barbuda</option>
                        <option value="Argentina">Argentina</option>
                        <option value="Armenia">Armenia</option>
                        <option value="Aruba">Aruba</option>
                        <option value="Australia">Australia</option>
                        <option value="Austria">Austria</option>
                        <option value="Azerbaijan">Azerbaijan</option>
                        <option value="Bahamas">Bahamas</option>
                        <option value="Bahrain">Bahrain</option>
                        <option value="Bangladesh">Bangladesh</option>
                        <option value="Barbados">Barbados</option>
                        <option value="Belarus">Belarus</option>
                        <option value="Belgium">Belgium</option>
                        <option value="Belize">Belize</option>
                        <option value="Benin">Benin</option>
                        <option value="Bermuda">Bermuda</option>
                        <option value="Bhutan">Bhutan</option>
                        <option value="Bolivia">Bolivia</option>
                        <option value="Bonaire, Saint Eustatius and Saba">Bonaire, Saint Eustatius and Saba</option>
                        <option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
                        <option value="Botswana">Botswana</option>
                        <option value="Bouvet Island">Bouvet Island</option>
                        <option value="Brazil">Brazil</option>
                        <option value="British Indian Ocean Territory">British Indian Ocean Territory</option>
                        <option value="British Virgin Islands">British Virgin Islands</option>
                        <option value="Brunei">Brunei</option>
                        <option value="Bulgaria">Bulgaria</option>
                        <option value="Burkina Faso">Burkina Faso</option>
                        <option value="Burundi">Burundi</option>
                        <option value="Cambodia">Cambodia</option>
                        <option value="Cameroon">Cameroon</option>
                        <option value="Canada">Canada</option>
                        <option value="Cape Verde">Cape Verde</option>
                        <option value="Cayman Islands">Cayman Islands</option>
                        <option value="Central African Republic">Central African Republic</option>
                        <option value="Chad">Chad</option>
                        <option value="Chile">Chile</option>
                        <option value="China">China</option>
                        <option value="Christmas Island">Christmas Island</option>
                        <option value="Cocos Islands">Cocos Islands</option>
                        <option value="Colombia">Colombia</option>
                        <option value="Comoros">Comoros</option>
                        <option value="Cook Islands">Cook Islands</option>
                        <option value="Costa Rica">Costa Rica</option>
                        <option value="Croatia">Croatia</option>
                        <option value="Cuba">Cuba</option>
                        <option value="Curacao">Curacao</option>
                        <option value="Cyprus">Cyprus</option>
                        <option value="Czech Republic">Czech Republic</option>
                        <option value="Democratic Republic of the Congo">Democratic Republic of the Congo</option>
                        <option value="Denmark">Denmark</option>
                        <option value="Djibouti">Djibouti</option>
                        <option value="Dominica">Dominica</option>
                        <option value="Dominican Republic">Dominican Republic</option>
                        <option value="East Timor">East Timor</option>
                        <option value="Ecuador">Ecuador</option>
                        <option value="Egypt">Egypt</option>
                        <option value="El Salvador">El Salvador</option>
                        <option value="Equatorial Guinea">Equatorial Guinea</option>
                        <option value="Eritrea">Eritrea</option>
                        <option value="Estonia">Estonia</option>
                        <option value="Ethiopia">Ethiopia</option>
                        <option value="Falkland Islands">Falkland Islands</option>
                        <option value="Faroe Islands">Faroe Islands</option>
                        <option value="Fiji">Fiji</option>
                        <option value="Finland">Finland</option>
                        <option value="France">France</option>
                        <option value="French Guiana">French Guiana</option>
                        <option value="French Polynesia">French Polynesia</option>
                        <option value="French Southern Territories">French Southern Territories</option>
                        <option value="Gabon">Gabon</option>
                        <option value="Gambia">Gambia</option>
                        <option value="Georgia">Georgia</option>
                        <option value="Germany">Germany</option>
                        <option value="Ghana">Ghana</option>
                        <option value="Gibraltar">Gibraltar</option>
                        <option value="Greece">Greece</option>
                        <option value="Greenland">Greenland</option>
                        <option value="Grenada">Grenada</option>
                        <option value="Guadeloupe">Guadeloupe</option>
                        <option value="Guam">Guam</option>
                        <option value="Guatemala">Guatemala</option>
                        <option value="Guernsey">Guernsey</option>
                        <option value="Guinea">Guinea</option>
                        <option value="Guinea-Bissau">Guinea-Bissau</option>
                        <option value="Guyana">Guyana</option>
                        <option value="Haiti">Haiti</option>
                        <option value="Heard Island and McDonald Islands">Heard Island and McDonald Islands</option>
                        <option value="Honduras">Honduras</option>
                        <option value="Hong Kong">Hong Kong</option>
                        <option value="Hungary">Hungary</option>
                        <option value="Iceland">Iceland</option>
                        <option value="India">India</option>
                        <option value="Indonesia">Indonesia</option>
                        <option value="Iran">Iran</option>
                        <option value="Iraq">Iraq</option>
                        <option value="Ireland">Ireland</option>
                        <option value="Isle of Man">Isle of Man</option>
                        <option value="Israel">Israel</option>
                        <option value="Italy">Italy</option>
                        <option value="Ivory Coast">Ivory Coast</option>
                        <option value="Jamaica">Jamaica</option>
                        <option value="Japan">Japan</option>
                        <option value="Jersey">Jersey</option>
                        <option value="Jordan">Jordan</option>
                        <option value="Kazakhstan">Kazakhstan</option>
                        <option value="Kenya">Kenya</option>
                        <option value="Kiribati">Kiribati</option>
                        <option value="Kosovo">Kosovo</option>
                        <option value="Kuwait">Kuwait</option>
                        <option value="Kyrgyzstan">Kyrgyzstan</option>
                        <option value="Laos">Laos</option>
                        <option value="Latvia">Latvia</option>
                        <option value="Lebanon">Lebanon</option>
                        <option value="Lesotho">Lesotho</option>
                        <option value="Liberia">Liberia</option>
                        <option value="Libya">Libya</option>
                        <option value="Liechtenstein">Liechtenstein</option>
                        <option value="Lithuania">Lithuania</option>
                        <option value="Luxembourg">Luxembourg</option>
                        <option value="Macao">Macao</option>
                        <option value="Macedonia">Macedonia</option>
                        <option value="Madagascar">Madagascar</option>
                        <option value="Malawi">Malawi</option>
                        <option value="Malaysia">Malaysia</option>
                        <option value="Maldives">Maldives</option>
                        <option value="Mali">Mali</option>
                        <option value="Malta">Malta</option>
                        <option value="Marshall Islands">Marshall Islands</option>
                        <option value="Martinique">Martinique</option>
                        <option value="Mauritania">Mauritania</option>
                        <option value="Mauritius">Mauritius</option>
                        <option value="Mayotte">Mayotte</option>
                        <option value="Mexico">Mexico</option>
                        <option value="Micronesia">Micronesia</option>
                        <option value="Moldova">Moldova</option>
                        <option value="Monaco">Monaco</option>
                        <option value="Mongolia">Mongolia</option>
                        <option value="Montenegro">Montenegro</option>
                        <option value="Montserrat">Montserrat</option>
                        <option value="Morocco">Morocco</option>
                        <option value="Mozambique">Mozambique</option>
                        <option value="Myanmar">Myanmar</option>
                        <option value="Namibia">Namibia</option>
                        <option value="Nauru">Nauru</option>
                        <option value="Nepal">Nepal</option>
                        <option value="Netherlands">Netherlands</option>
                        <option value="Netherlands Antilles">Netherlands Antilles</option>
                        <option value="New Caledonia">New Caledonia</option>
                        <option value="New Zealand">New Zealand</option>
                        <option value="Nicaragua">Nicaragua</option>
                        <option value="Niger">Niger</option>
                        <option value="Nigeria">Nigeria</option>
                        <option value="Niue">Niue</option>
                        <option value="Norfolk Island">Norfolk Island</option>
                        <option value="North Korea">North Korea</option>
                        <option value="Northern Mariana Islands">Northern Mariana Islands</option>
                        <option value="Norway">Norway</option>
                        <option value="Oman">Oman</option>
                        <option value="Pakistan">Pakistan</option>
                        <option value="Palau">Palau</option>
                        <option value="Palestinian Territory">Palestinian Territory</option>
                        <option value="Panama">Panama</option>
                        <option value="Papua New Guinea">Papua New Guinea</option>
                        <option value="Paraguay">Paraguay</option>
                        <option value="Peru">Peru</option>
                        <option value="Philippines">Philippines</option>
                        <option value="Pitcairn">Pitcairn</option>
                        <option value="Poland">Poland</option>
                        <option value="Portugal">Portugal</option>
                        <option value="Puerto Rico">Puerto Rico</option>
                        <option value="Qatar">Qatar</option>
                        <option value="Republic of the Congo">Republic of the Congo</option>
                        <option value="Reunion">Reunion</option>
                        <option value="Romania">Romania</option>
                        <option value="Russia">Russia</option>
                        <option value="Rwanda">Rwanda</option>
                        <option value="Saint Barthelemy">Saint Barthelemy</option>
                        <option value="Saint Helena">Saint Helena</option>
                        <option value="Saint Kitts and Nevis">Saint Kitts and Nevis</option>
                        <option value="Saint Lucia">Saint Lucia</option>
                        <option value="Saint Martin">Saint Martin</option>
                        <option value="Saint Pierre and Miquelon">Saint Pierre and Miquelon</option>
                        <option value="Saint Vincent and the Grenadines">Saint Vincent and the Grenadines</option>
                        <option value="Samoa">Samoa</option>
                        <option value="San Marino">San Marino</option>
                        <option value="Sao Tome and Principe">Sao Tome and Principe</option>
                        <option value="Saudi Arabia">Saudi Arabia</option>
                        <option value="Senegal">Senegal</option>
                        <option value="Serbia">Serbia</option>
                        <option value="Serbia and Montenegro">Serbia and Montenegro</option>
                        <option value="Seychelles">Seychelles</option>
                        <option value="Sierra Leone">Sierra Leone</option>
                        <option value="Singapore">Singapore</option>
                        <option value="Sint Maarten">Sint Maarten</option>
                        <option value="Slovakia">Slovakia</option>
                        <option value="Slovenia">Slovenia</option>
                        <option value="Solomon Islands">Solomon Islands</option>
                        <option value="Somalia">Somalia</option>
                        <option value="South Africa">South Africa</option>
                        <option value="South Georgia and the South Sandwich Islands">South Georgia and the South
                            Sandwich Islands
                        </option>
                        <option value="South Korea">South Korea</option>
                        <option value="South Sudan">South Sudan</option>
                        <option value="Spain">Spain</option>
                        <option value="Sri Lanka">Sri Lanka</option>
                        <option value="Sudan">Sudan</option>
                        <option value="Suriname">Suriname</option>
                        <option value="Svalbard and Jan Mayen">Svalbard and Jan Mayen</option>
                        <option value="Swaziland">Swaziland</option>
                        <option value="Sweden">Sweden</option>
                        <option value="Switzerland">Switzerland</option>
                        <option value="Syria">Syria</option>
                        <option value="Taiwan">Taiwan</option>
                        <option value="Tajikistan">Tajikistan</option>
                        <option value="Tanzania">Tanzania</option>
                        <option value="Thailand">Thailand</option>
                        <option value="Togo">Togo</option>
                        <option value="Tokelau">Tokelau</option>
                        <option value="Tonga">Tonga</option>
                        <option value="Trinidad and Tobago">Trinidad and Tobago</option>
                        <option value="Tunisia">Tunisia</option>
                        <option value="Turkey">Turkey</option>
                        <option value="Turkmenistan">Turkmenistan</option>
                        <option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
                        <option value="Tuvalu">Tuvalu</option>
                        <option value="U.S. Virgin Islands">U.S. Virgin Islands</option>
                        <option value="Uganda">Uganda</option>
                        <option value="Ukraine">Ukraine</option>
                        <option value="United Arab Emirates">United Arab Emirates</option>
                        <option value="United Kingdom">United Kingdom</option>
                        <option value="United States">United States</option>
                        <option value="United States Minor Outlying Islands">United States Minor Outlying Islands
                        </option>
                        <option value="Uruguay">Uruguay</option>
                        <option value="Uzbekistan">Uzbekistan</option>
                        <option value="Vanuatu">Vanuatu</option>
                        <option value="Vatican">Vatican</option>
                        <option value="Venezuela">Venezuela</option>
                        <option value="Vietnam">Vietnam</option>
                        <option value="Wallis and Futuna">Wallis and Futuna</option>
                        <option value="Western Sahara">Western Sahara</option>
                        <option value="Yemen">Yemen</option>
                        <option value="Zambia">Zambia</option>
                        <option value="Zimbabwe">Zimbabwe</option>
                    </select>
                    <select name="city" id="city" style="min-width: 160px">
                        <option value="0">-- city --</option>
                    </select>
                    <input type="submit" class="submit" value="filter">

                </form>
            </div>
        </div>
        <div class="contRow">
            <%
                Iterator<TravelImage> iterator = travelImages.iterator();
                boolean hasNext;
                TravelImage travelImage=null;
            %>
            <div class="imgContainer">
                <%
                    hasNext=iterator.hasNext();
                    if (iterator.hasNext())
                        travelImage=iterator.next();
                %>
                <a <%= (hasNext?("href='detailServlet?imageID="+travelImage.getImageID()+"'"):"") %> >
                <img class="contImg" src="sources/img/<%=
                    (hasNext?travelImage.getPath():"nomore.jpg")
                %>">
                </a>
            </div>
            <div class="imgContainer">
                <%
                    hasNext=iterator.hasNext();
                    if (iterator.hasNext())
                        travelImage=iterator.next();
                %>
                <a <%= (hasNext?("href='detailServlet?imageID="+travelImage.getImageID()+"'"):"") %> >
                    <img class="contImg" src="sources/img/<%=
                    (hasNext?travelImage.getPath():"nomore.jpg")
                %>">
                </a>
            </div>
            <div class="imgContainer">
                <%
                    hasNext=iterator.hasNext();
                    if (iterator.hasNext())
                        travelImage=iterator.next();
                %>
                <a <%= (hasNext?("href='detailServlet?imageID="+travelImage.getImageID()+"'"):"") %> >
                    <img class="contImg" src="sources/img/<%=
                    (hasNext?travelImage.getPath():"nomore.jpg")
                %>">
                </a>
            </div>
            <div class="imgContainer">
                <%
                    hasNext=iterator.hasNext();
                    if (iterator.hasNext())
                        travelImage=iterator.next();
                %>
                <a <%= (hasNext?("href='detailServlet?imageID="+travelImage.getImageID()+"'"):"") %> >
                    <img class="contImg" src="sources/img/<%=
                    (hasNext?travelImage.getPath():"nomore.jpg")
                %>">
                </a>
            </div>
            <div class="imgContainer">
                <%
                    hasNext=iterator.hasNext();
                    if (iterator.hasNext())
                        travelImage=iterator.next();
                %>
                <a <%= (hasNext?("href='detailServlet?imageID="+travelImage.getImageID()+"'"):"") %> >
                    <img class="contImg" src="sources/img/<%=
                    (hasNext?travelImage.getPath():"nomore.jpg")
                %>">
                </a>
            </div>
            <div class="imgContainer">
                <%
                    hasNext=iterator.hasNext();
                    if (iterator.hasNext())
                        travelImage=iterator.next();
                %>
                <a <%= (hasNext?("href='detailServlet?imageID="+travelImage.getImageID()+"'"):"") %> >
                    <img class="contImg" src="sources/img/<%=
                    (hasNext?travelImage.getPath():"nomore.jpg")
                %>">
                </a>
            </div>
        </div>
        <div class="contRow_bottom" id="pageBox">
            <ul>
                <%
                    int currentPageIndex = (int) request.getAttribute("currentPageIndex");
                    int numberOfPages = (int) request.getAttribute("numberOfPages");
                    String parameterStr = (String) request.getAttribute("parameterStr");
                    String uri = "browserServlet?" + parameterStr + "&pageIndex=";
                %>
                <li><a href="<%=uri+1%>"><span class="singleItem">首页</span></a></li>
                <li><a href="<%=uri+Math.max(currentPageIndex-1,1)%>"><span class="singleItem">上一页</span></a></li>
                <%--<li><a href="#"><span class="singleItem">1</span></a></li>
                <li><a href="#"><span class="singleItem">2</span></a></li>
                <li><a href="#"><span class="singleItem">3</span></a></li>
                <li><a href="#"><span class="singleItem">4</span></a></li>
                <li><a href="#"><span class="singleItem">5</span></a></li>--%>
                <%
                    for (int i = 1; i <= numberOfPages; i++)
                    {
                %>
                <li><a href="<%=uri+i%>"><span
                        class="singleItem" <%=(i == currentPageIndex ? "id='selectedPage'" : "")%>><%=i%></span></a>
                </li>
                <%
                    }
                %>
                <li><a href="<%=uri+(Math.min((currentPageIndex + 1), numberOfPages))%>"><span
                        class="singleItem">下一页</span></a></li>
                <li><a href="<%=uri+numberOfPages%>"><span class="singleItem">末页</span></a></li>
            </ul>
        </div>
    </section>
    <a href="#">
        <div id="returnTop">
            <span>↑</span>
        </div>
    </a>
    <footer id="foot">
        <p>Copy right 19302010022@fudan.edu.cn <img src="sources/img/2dCode.jpg"></p>
    </footer>
</div>
</body>
<script type="text/javascript" src="js/setCity.js"></script>
<script>
    (function () {
        let contentSelect = document.getElementById("contentSelect");
        let chosenContentElement = contentSelect.querySelector("option[value='<%= request.getParameter("content") %>']");
        if (chosenContentElement != null)
            chosenContentElement.setAttribute("selected", "selected");
        let countrySelect2 = document.getElementById("country");
        let citySelect2 = document.getElementById("city");
        let chosenCountryElement = countrySelect2.querySelector("option[value='<%= request.getParameter("country") %>']");
        if (chosenContentElement != null) {
            chosenContentElement.setAttribute("selected", "selected");
            setCity();
            let chosenCityElement = citySelect2.querySelector("option[value='<%= request.getParameter("city") %>']");
            if (chosenCityElement != null)
                chosenCityElement.setAttribute("selected", "selected")
            else
                console.log("no city found")
        } else {
            console.log("no country found")
        }
    })()
</script>
</html>
