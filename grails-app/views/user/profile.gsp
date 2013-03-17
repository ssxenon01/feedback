<%--
  Created by IntelliJ IDEA.
  User: cosmos
  Date: 2/23/13
  Time: 4:26 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>${user.username}</title>
    <meta name="layout" content="admin">
</head>


<body>
<div class="row-fluid">
    <div class="span12">
        <h3 class="heading">${user.firstname} ${user.lastname}</h3>
        
        <div class="row-fluid">
            <div class="span8">
                <g:form controller="user" id="${user.id}" action="editProfile" method="POST" class="user_reg_valid" enctype="multipart/form-data">
                    <fieldset>
                        <sec:ifAnyGranted roles="ROLE_ADMIN">
                            <strong>Админ болгох эсэх ?</strong> <input type="checkbox" name="promoteAdmin" ${isAdmin?'checked':''} value="${isAdmin}"/> <br>
                        </sec:ifAnyGranted>
                        %{-- <div class="control-group formSep">
                            <label class="control-label">Нэвтрэх нэр</label>

                            <div class="controls text_line">
                                <strong>${user.username}</strong> <br>
                            </div>
                        </div> --}%

                        <div class="control-group formSep">
                            <label for="fileinput" class="control-label">Аватар зураг оруулах</label>

                            <div class="controls">
                                <div data-fileupload="image" class="fileupload fileupload-new"><input type="hidden">
                                    <input type="hidden">

                                    <div style="width: 80px; height: 80px;" class="fileupload-new thumbnail"><img
                                            src="${user.profile?resource(dir: 'tmp', file: user.profile):'http://www.placehold.it/80x80/EFEFEF/AAAAAA'}" alt=""></div>

                                    <div style="width: 80px; height: 80px; line-height: 80px;" class="fileupload-preview fileupload-exists thumbnail"></div>
                                    <span class="btn btn-file"><span class="fileupload-new">Select image</span><span
                                            class="fileupload-exists">Change</span><input type="file" id="fileinput" name="file" accept="image/*"></span>
                                    <a data-dismiss="fileupload" class="btn fileupload-exists" href="#">Remove</a>
                                </div>
                            </div>
                        </div>

                        <div class="control-group formSep">
                            <label for="u_fname" class="control-label">Хэрэглэгчийн нэр</label>
                            <div class="controls">
                                <input required="" type="text" id="u_fname" name="firstname" class="input-xlarge" placeholder="Жишээ нь: Болд" value="${user.firstname}">
                            </div>
                        </div>

                        <div class="control-group formSep">
                            <label for="u_email" class="control-label">Имэйл</label>

                            <div class="controls">
                                <input required="" type="text" id="u_email" name="email" class="input-xlarge" value="${user.email}" placeholder="Жишээ нь: user@gmail.com">
                            </div>
                        </div>

                        <div class="control-group formSep">
                            <label for="u_registerNumber" class="control-label">Регистерийн дугаар</label>

                            <div class="controls">
                                <input required="" id="registerId" name="registerId" type="text" id="u_registerNumber" class="input-xlarge" value="${user.registerId}" placeholder="Жишээ нь: УЗ85064521">
                            </div>
                        </div>
                        <div class="control-group formSep">
                            <label for="phone" class="control-label">Харилцах утас</label>

                            <div class="controls">
                                <input required="" type="text" id="phone" name="phone" class="input-xlarge" value="${user.phone}" placeholder="Жишээ нь: 99199999">
                            </div>
                        </div>
                        %{-- <div class="control-group formSep">
                            <label class="control-label">Хүйс</label>

                            <div class="controls">
                                <label class="radio inline">
                                    <input type="radio" value="male" id="s_male" name="f_gender" checked="checked">
                                    Эрэгтэй
                                </label>
                                <label class="radio inline">
                                    <input type="radio" value="female" id="s_female" name="f_gender">
                                    Эмэгтэй
                                </label>
                            </div>
                        </div> --}%

                        <div class="control-group formSep">
                            <label for="about" class="control-label">Товч танилцуулга</label>

                            <div class="controls">
                                <textarea rows="4" id="about" name="about" class="input-xlarge" placeholder="Жишээ нь: Барилгын салбарт ажилладаг"
                                          style="overflow: hidden; word-wrap: break-word; max-height: 72px; min-height: 72px; height: 72px;">${user.about}</textarea>
                                <span class="help-block">Бөглөхгүй байж болно</span>
                            </div>
                        </div>

                        <div class="control-group">
                            <div class="controls">
                                <button class="btn btn-gebo" type="submit">Хадгалах</button>
                                <button class="btn">Болих</button>
                            </div>
                        </div>
                    </fieldset>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>