<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>User profile with friends and chat - Bootdey.com</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link
      href="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="../../assert/css/infor-user.css" />
  </head>
  <%@include file="navbar.jsp" %>
  <body>
    <link
      href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
      rel="stylesheet"
    />
    <div class="container bootstrap snippets bootdeys">
      <div class="row" id="user-profile">
        <div class="col-lg-3 col-md-4 col-sm-4">
          <div class="main-box clearfix">
            <h2>${userInfor.fullName}</h2>
            <div class="profile-status">
              <i class="fa fa-check-circle"></i> Online
            </div>
            <img
              src="${userInformation.avatarUrl}"
              alt
              class="profile-img img-responsive center-block"
            />
            <div class="profile-label">
              <span class="label label-danger">${userInformation.role}</span>
            </div>
            <div class="profile-stars">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star-o"></i>
              <span>Super User</span>
            </div>
            <div class="profile-since">Member since: Jan 2012</div>
            <br/>
            <c:if test="${empty me}">
            <div class="profile-message-btn center-block text-center">
              <a href="/profile?userId=${userInformation.userId}" class="btn btn-success">
                <i class="fa fa-envelope"></i> Send message
              </a>
            </div>
              </c:if>
          </div>
        </div>
        <div class="col-lg-9 col-md-8 col-sm-8">
          <div class="main-box clearfix">
            <div class="profile-header">
              <h3><span>User info</span></h3>
              <c:if test="${not empty me}">
              <a href="/update-profile-form" class="btn btn-primary edit-profile">
                <i class="fa fa-pencil-square fa-lg"></i> Edit profile
              </a>
              </c:if>
            </div>
            <div class="row profile-user-info">
              <div class="col-sm-8">
                <div class="profile-user-details clearfix">
                  <div class="profile-user-details-label">First Name</div>
                  <div class="profile-user-details-value">${userInformation.fullName}&nbsp</div>
                </div>
                <div class="profile-user-details clearfix">
                  <div class="profile-user-details-label">Address</div>
                  <div class="profile-user-details-value">
                      ${userInformation.address}&nbsp
                  </div>
                </div>
                <div class="profile-user-details clearfix">
                  <div class="profile-user-details-label">Email</div>
                  <div class="profile-user-details-value">
                    ${userInformation.email} &nbsp
                  </div>
                </div>
                <div class="profile-user-details clearfix">
                  <div class="profile-user-details-label">Phone number</div>
                  <div class="profile-user-details-value">
                    ${userInformation.phoneNumber}&nbsp
                  </div>
                </div>
                 <div class="profile-user-details clearfix">
                  <div class="profile-user-details-label">Address</div>
                  <div class="profile-user-details-value">
                    ${userInformation.address}&nbsp
                  </div>
                </div>

                 <div class="profile-user-details clearfix">
                  <div class="profile-user-details-label">Decription</div>
                  <div class="profile-user-details-value">
                    ${userInformation.bio}&nbsp
                  </div>
                </div>
              </div>
              <div class="col-sm-4 profile-social">
               <ul class="fa-ul">
  <!-- LinkedIn -->
  <c:if test="${not empty userInformation.linkedinUrl}">
    <li>
      <i class="fa-li fa fa-linkedin-square"></i>
      <a href="${userInformation.linkedinUrl}">Linkedin</a>
    </li>
  </c:if>

  <!-- Facebook -->
  <c:if test="${not empty userInformation.facebookUrl}">
    <li>
      <i class="fa-li fa fa-facebook-square"></i>
      <a href="${userInformation.facebookUrl}">Facebook</a>
    </li>
  </c:if>

  <!-- Instagram -->
  <c:if test="${not empty userInformation.instagramUrl}">
    <li>
      <i class="fa-li fa fa-instagram"></i>
      <a href="${userInformation.instagramUrl}">Instagram</a>
    </li>
  </c:if>

   <c:if test="${not empty userInformation.tiktokUrl}">
    <li>
      <i class="fa-li fa fa-tiktok"></i>
      <a href="${userInformation.tiktokUrl}" class="text-decoration-none">TikTok</a>
    </li>
  </c:if>
</ul>

              </div>
            </div>
            <div class="tabs-wrapper profile-tabs">
              <ul class="nav nav-tabs">
                <li class="active">
                  <a href="#tab-activity" data-toggle="tab">Activity</a>
                </li>
                <li><a href="#tab-chat" data-toggle="tab">Chat</a></li>
              </ul>
              <div class="tab-content">
                <div class="tab-pane fade in active" id="tab-activity">
                  <div class="table-responsive">
                    <table class="table">
                      <tbody>
                        <tr>
                          <td class="text-center">
                            <i class="fa fa-comment"></i>
                          </td>
                          <td>
                            John Doe posted a comment in
                            <a href="#">Avengers Initiative</a> project.
                          </td>
                          <td>2014/08/08 12:08</td>
                        </tr>
                        <tr>
                          <td class="text-center">
                            <i class="fa fa-truck"></i>
                          </td>
                          <td>
                            John Doe changed order status from
                            <span class="label label-primary">Pending</span> to
                            <span class="label label-success">Completed</span>
                          </td>
                          <td>2014/08/08 12:08</td>
                        </tr>
                        <tr>
                          <td class="text-center">
                            <i class="fa fa-check"></i>
                          </td>
                          <td>
                            John Doe posted a comment in
                            <a href="#">Lost in Translation opening scene</a>
                            discussion.
                          </td>
                          <td>2014/08/08 12:08</td>
                        </tr>
                        <tr>
                          <td class="text-center">
                            <i class="fa fa-users"></i>
                          </td>
                          <td>
                            John Doe posted a comment in
                            <a href="#">Avengers Initiative</a> project.
                          </td>
                          <td>2014/08/08 12:08</td>
                        </tr>
                        <tr>
                          <td class="text-center">
                            <i class="fa fa-heart"></i>
                          </td>
                          <td>
                            John Doe changed order status from
                            <span class="label label-warning">On Hold</span> to
                            <span class="label label-danger">Disabled</span>
                          </td>
                          <td>2014/08/08 12:08</td>
                        </tr>
                        <tr>
                          <td class="text-center">
                            <i class="fa fa-check"></i>
                          </td>
                          <td>
                            John Doe posted a comment in
                            <a href="#">Lost in Translation opening scene</a>
                            discussion.
                          </td>
                          <td>2014/08/08 12:08</td>
                        </tr>
                        <tr>
                          <td class="text-center">
                            <i class="fa fa-truck"></i>
                          </td>
                          <td>
                            John Doe changed order status from
                            <span class="label label-primary">Pending</span> to
                            <span class="label label-success">Completed</span>
                          </td>
                          <td>2014/08/08 12:08</td>
                        </tr>
                        <tr>
                          <td class="text-center">
                            <i class="fa fa-users"></i>
                          </td>
                          <td>
                            John Doe posted a comment in
                            <a href="#">Avengers Initiative</a> project.
                          </td>
                          <td>2014/08/08 12:08</td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
                <div class="tab-pane fade" id="tab-chat">
                  <div class="conversation-wrapper">
                    <div class="conversation-content">
                      <div
                        class="slimScrollDiv"
                        style="
                          position: relative;
                          overflow: hidden;
                          width: auto;
                          height: 340px;
                        "
                      >
                        <div
                          class="conversation-inner"
                          style="overflow: hidden; width: auto; height: 340px"
                        >
                          <div class="conversation-item item-left clearfix">
                            <div class="conversation-user">
                              <img
                                src="https://bootdey.com/img/Content/avatar/avatar1.png"
                                class="img-responsive"
                                alt
                              />
                            </div>
                            <div class="conversation-body">
                              <div class="name">Ryan Gossling</div>
                              <div class="time hidden-xs">
                                September 21, 2013 18:28
                              </div>
                              <div class="text">
                                I don't think they tried to market it to the
                                billionaire, spelunking, base-jumping crowd.
                              </div>
                            </div>
                          </div>
                          <div class="conversation-item item-right clearfix">
                            <div class="conversation-user">
                              <img
                                src="https://bootdey.com/img/Content/avatar/avatar1.png"
                                class="img-responsive"
                                alt
                              />
                            </div>
                            <div class="conversation-body">
                              <div class="name">Mila Kunis</div>
                              <div class="time hidden-xs">
                                September 21, 2013 12:45
                              </div>
                              <div class="text">
                                Normally, both your asses would be dead as
                                fucking fried chicken, but you happen to pull
                                this shit while I'm in a transitional period so
                                I don't wanna kill you, I wanna help you.
                              </div>
                            </div>
                          </div>
                          <div class="conversation-item item-right clearfix">
                            <div class="conversation-user">
                              <img
                                src="https://bootdey.com/img/Content/avatar/avatar1.png"
                                class="img-responsive"
                                alt
                              />
                            </div>
                            <div class="conversation-body">
                              <div class="name">Mila Kunis</div>
                              <div class="time hidden-xs">
                                September 21, 2013 12:45
                              </div>
                              <div class="text">
                                Normally, both your asses would be dead as
                                fucking fried chicken, but you happen to pull
                                this shit while I'm in a transitional period so
                                I don't wanna kill you, I wanna help you.
                              </div>
                            </div>
                          </div>
                          <div class="conversation-item item-left clearfix">
                            <div class="conversation-user">
                              <img
                                src="https://bootdey.com/img/Content/avatar/avatar1.png"
                                class="img-responsive"
                                alt
                              />
                            </div>
                            <div class="conversation-body">
                              <div class="name">Ryan Gossling</div>
                              <div class="time hidden-xs">
                                September 21, 2013 18:28
                              </div>
                              <div class="text">
                                I don't think they tried to market it to the
                                billionaire, spelunking, base-jumping crowd.
                              </div>
                            </div>
                          </div>
                          <div class="conversation-item item-right clearfix">
                            <div class="conversation-user">
                              <img
                                src="https://bootdey.com/img/Content/avatar/avatar1.png"
                                class="img-responsive"
                                alt
                              />
                            </div>
                            <div class="conversation-body">
                              <div class="name">Mila Kunis</div>
                              <div class="time hidden-xs">
                                September 21, 2013 12:45
                              </div>
                              <div class="text">
                                Normally, both your asses would be dead as
                                fucking fried chicken, but you happen to pull
                                this shit while I'm in a transitional period so
                                I don't wanna kill you, I wanna help you.
                              </div>
                            </div>
                          </div>
                        </div>
                        <div
                          class="slimScrollBar"
                          style="
                            width: 7px;
                            position: absolute;
                            top: 0px;
                            opacity: 0.4;
                            display: block;
                            border-radius: 7px;
                            z-index: 99;
                            right: 1px;
                            background: rgb(0, 0, 0);
                          "
                        ></div>
                        <div
                          class="slimScrollRail"
                          style="
                            width: 7px;
                            height: 100%;
                            position: absolute;
                            top: 0px;
                            display: none;
                            border-radius: 7px;
                            opacity: 0.2;
                            z-index: 90;
                            right: 1px;
                            background: rgb(51, 51, 51);
                          "
                        ></div>
                      </div>
                    </div>
                    <div class="conversation-new-message">
                      <form>
                        <div class="form-group">
                          <textarea
                            class="form-control"
                            rows="2"
                            placeholder="Enter your message..."
                          ></textarea>
                        </div>
                        <div class="clearfix">
                          <button
                            type="submit"
                            class="btn btn-success pull-right"
                          >
                            Send message
                          </button>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <script
      data-cfasync="false"
      src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"
    ></script>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript"></script>
  </body>
</html>
