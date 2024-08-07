﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Property.aspx.cs" Inherits="Buyer_Property" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>EstateAgency Bootstrap Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="lib/animate/animate.min.css" rel="stylesheet">
  <link href="lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="css/style.css" rel="stylesheet">

  <!-- =======================================================
    Theme Name: EstateAgency
    Theme URL: https://bootstrapmade.com/real-estate-agency-bootstrap-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
</head>

<body>

  <div class="click-closed"></div>


  <!--/ Nav Star /-->
  <nav class="navbar navbar-default navbar-trans navbar-expand-lg fixed-top">
    <div class="container">
      <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault"
        aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span></span>
        <span></span>
        <span></span>
      </button>
       <a class="navbar-brand text-brand" href="index.html">E_<span class="color-b">Tenders</span></a>
      <button type="button" class="btn btn-link nav-search navbar-toggle-box-collapse d-md-none" data-toggle="collapse"
        data-target="#navbarTogglerDemo01" aria-expanded="false">
        <span class="fa fa-search" aria-hidden="true"></span>
      </button>
    <div class="navbar-collapse collapse justify-content-center" id="navbarDefault">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" href="Home.aspx">Home</a>
          </li>
           <li class="nav-item">
            <a class="nav-link" href="Property.aspx">Tenders</a>
          </li>
              <li class="nav-item">
            <a class="nav-link" href="history.aspx">History</a>
          </li>
       
          
          <li class="nav-item">
            <a class="nav-link" href="contact.html">Contact</a>
          </li>
            <li class="nav-item">
            <a class="nav-link" href="Logout.aspx">Logout</a>
          </li>
        </ul>
      </div>
  
    </div>
  </nav>
  <!--/ Nav End /-->

  <!--/ Intro Single star /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single">Our Amazing Tenders</h1>
            <span class="color-text-a">Grid Tenders</span>
          </div>
        </div>
        <div class="col-md-12 col-lg-4">
          <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
            <ol class="breadcrumb">
              <li class="breadcrumb-item">
                <a href="#">Home</a>
              </li>
              <li class="breadcrumb-item active" aria-current="page">
                Properties Grid
              </li>
            </ol>
          </nav>
        </div>
      </div>
    </div>
  </section>
  <!--/ Intro Single End /-->

  <!--/ Property Grid Star /-->
  <section class="property-grid grid">
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <div class="grid-option">
            
          </div>
        </div>
           <% if (flag == true)
                   {
                       foreach (System.Data.DataRow row in dt.Rows)
                       {%>
                            <div class="col-md-4">
                              <div class="card-box-a card-shadow">
                                <div class="img-box-a">
                                  <img src="/Tender/img/<%=row["Timage"]%>" alt="" class="img-a img-fluid" >
                                </div>
                                <div class="card-overlay">
                                  <div class="card-overlay-a-content">
                                    <div class="card-header-a">
                                      <h2 class="card-title-a">
                                        <a href="#"><%=row["tender_name"]%>
                                          
                                      </h2>
                                    </div>
                                    <div class="card-body-a">
                                      <div class="price-box d-flex">
                                        <span class="price-a"> ₹ <%=row["Tvalue"]%></span>
                                      </div>
                                      <a href="Property_single.aspx?id=<%=row["Tid"]%>" class="link-a">Click here to view
                                        <span class="ion-ios-arrow-forward"></span>
                                      </a>
                                    </div>
                                    <div class="card-footer-a">
                                      <ul class="card-info d-flex justify-content-around">
                                        <li>
                                          <h4 class="card-info-title">Location</h4>
                                          <span><%=row["Tlocation"]%>
                                          </span>
                                        </li>
                                        <li>
                                          <%--<h4 class="card-info-title">Length</h4>
                                          <span><%=row["Lenghtt"]%></span>--%>
                                        </li>
                                        <li>
                                          <%--<h4 class="card-info-title">Wiedth</h4>
                                          <span><%=row["Weidth"]%></span>--%>
                                        </li>
                                       <%-- <li>
                                          <h4 class="card-info-title">Garages</h4>
                                          <span><%=row["garage"]%></span>
                                        </li>--%>
                                      </ul>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                     <%  }
                      
                       
                               }%>
                    <%  else
                             {%>
                      
                               <%}%> 
      
    </div>
  </section>
  <!--/ Property Grid End /-->

  <!--/ footer Star /-->
 
  

  <!--/ Footer End /-->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
  <div id="preloader"></div>

  <!-- JavaScript Libraries -->
  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/jquery/jquery-migrate.min.js"></script>
  <script src="lib/popper/popper.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="lib/easing/easing.min.js"></script>
  <script src="lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="lib/scrollreveal/scrollreveal.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="js/main.js"></script>
</form>
</body>
</html>

