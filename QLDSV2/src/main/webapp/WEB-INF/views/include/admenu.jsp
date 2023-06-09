<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <base href="${pageContext.servletContext.contextPath}/">
    <header class="header" id="header">
        <div class="header_toggle"> <i class='fas fa-th-list' id="header-toggle"></i> </div>
        <div class="header_img"> <img src="resources/images/admin_icon.jpg" alt=""> </div>
    </header>
    <div class="l-navbar" id="nav-bar">
        <nav class="nav">
            <div> 
                <a href="#" class="nav_logo"> 
                <i class='bx bx-layer nav_logo-icon'></i> 
                <span class="nav_logo-name">Quản trị viên</span> 
                </a>
                <div class="nav_list">
                     <a href="#" class="nav_link active"> 
                        <i class='bx bx-grid-alt nav_icon'></i> 
                        <span class="nav_name">Dashboard</span>
                     </a> 
                    <a href="#" class="nav_link"> 
                        <i class='bx bx-user nav_icon'></i> 
                         <span class="nav_name">Users</span> 
                    </a>
                     <a href="#" class="nav_link"> 
                        <i class='bx bx-message-square-detail nav_icon'></i>
                        <span class="nav_name">Messages</span> 
                    </a> 
                    <a href="#" class="nav_link"> 
                        <i class='bx bx-bookmark nav_icon'></i> 
                        <span class="nav_name">Bookmark</span> 
                    </a> 
                    <a href="#" class="nav_link"> 
                        <i class='bx bx-folder nav_icon'></i>
                        <span class="nav_name">Files</span>
                     </a> 
                     <a href="#" class="nav_link"> 
                         <i class='bx bx-bar-chart-alt-2 nav_icon'></i> 
                         <span class="nav_name">Stats</span> 
                     </a>
                 </div>
            </div>
             <a href="#" class="nav_link"> 
                <i class='fas fa-user'></i>
                <span class="nav_name">SignOut</span> 
            </a>
        </nav>
    </div>
  
  

    <script src="resources/js/index.js"></script>
