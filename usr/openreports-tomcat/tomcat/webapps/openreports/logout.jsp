<%@ taglib prefix="s" uri="/struts-tags" %>

<s:include value="Banner.jsp" />

<div id="air-main-container" class="container air-main-container">
    <div class="row">
        <div class="col-sm-12 col-sm-offset-3 col-md-4 col-md-offset-4">
            <div class="well">
                <div id="dialog" align="center">
                    <div class="bd">
                        <form action="login.action" method="post" name="loginForm">
                            <h2>
                                Login
                            </h2>
                            <div class="form-group">
                                <input type="text" name="userName" id="userName" class="form-control" placeholder="user name">
                            </div>
                            <div class="form-group">
                                <input type="passsword" name="password" id="password" class="form-control" placeholder="password">
                            </div>
                            <div class="form-group">
                                <input class="btn btn-primary" type="submit" value="Login">
                            </div>
							<div class="form-group">
                                <td class="error" colspan="2" align="center">
								<s:actionerror/>
								</td>
                            </div>
                        </form>
                    </div>
                </div><div class="underlay"></div>
            </div>
        </div>
    </div>
</div>

</body>

</html>

