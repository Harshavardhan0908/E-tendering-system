<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Property_Single.aspx.cs" Inherits="Buyer_Property_Single" %>

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
    <a href="Property_Single.aspx.cs">Property_Single.aspx.cs</a>
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
 
  </nav>
  <!--/ Nav End /-->

  <!--/ Intro Single star /-->
  <section class="intro-single">
    <div class="container">
      <div class="row">
        <div class="col-md-12 col-lg-8">
          <div class="title-single-box">
            <h1 class="title-single"><%=_name%></h1>
            <span class="color-text-a"><%=_addr%></span>
          </div>
        </div>
        <div class="col-md-12 col-lg-4">
          <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
          <ol class="breadcrumb">
        <li class="breadcrumb-item">
                <asp:HyperLink ID="HyperLink1" runat="server"  Text="Download Discription"   Font-Bold="True" ForeColor="#009900"></asp:HyperLink>
              </li>
              
                
            </ol>
          </nav>
        </div>
      </div>
    </div>
  </section>
  <!--/ Intro Single End /-->

  <!--/ Property Single Star /-->
    <form id="form1" runat="server">
  <section class="property-single nav-arrow-b">
    <div class="container">
      <div class="row">
        <div class="col-sm-12">
          <div id="property-single-carousel" class="owl-carousel owl-arrow gallery-property">
            <div class="carousel-item-b">
              <img src="<%=_image%>" alt="">
            </div>
            <div class="carousel-item-b">
              <img src="<%=_image%>" alt="">
            </div>
            <div class="carousel-item-b">
              <img src="<%=_image%>" alt="">
            </div>
          </div>
          <div class="row justify-content-between">
            <div class="col-md-5 col-lg-4">
              <div class="property-price d-flex justify-content-center foo">
                <div class="card-header-c d-flex">
                  <div class="card-box-ico">
                    <span class="ion-money">₹</span>
                  </div>
                  <div class="card-title-c align-self-center">
                    <h5 class="title-c"><%=_price%></h5>
                  </div>
                </div>
              </div>
              <div class="property-summary">
                <div class="row">
                  <div class="col-sm-12">
                    <div class="title-box-d section-t4">
                      <h3 class="title-d">Quick Summary</h3>
                    </div>
                  </div>
                </div>
                <div class="summary-list">
                  <ul class="list">
                    <li class="d-flex justify-content-between">
                      <strong>Tender ID:</strong>
                      <span><%=_id%></span>
                    </li>
                    <%--<li class="d-flex justify-content-between">
                      <strong>Location:</strong>
                      <span><%=_addr%></span>
                    </li>--%>
                  <%--  <li class="d-flex justify-content-between">
                      <strong>Property Type:</strong>
                      <span>House</span>
                    </li>
                    <li class="d-flex justify-content-between">
                      <strong>Status:</strong>
                      <span><%=_status%></span>
                    </li>--%>
                    <li class="d-flex justify-content-between">
                      <strong>Area:</strong>
                      <span><%=_area%>
                      </span>
                    </li>
                    <li class="d-flex justify-content-between">
                     <%-- <strong>Length</strong>
                      <span><%=Lenghtt%></span>--%>
                    </li>
                    <li class="d-flex justify-content-between">
                     <%-- <strong>Weidth</strong>
                      <span><%=Weidth%></span>--%>
                    </li>
                 <li class="d-flex justify-content-between">
                      <strong>Tender Type:</strong>
                      <span><%=TType%></span>
                    </li>
                       <li class="d-flex justify-content-between">
                      <%--<strong>Roadtype:</strong>
                      <span><%=Rtype%></span>--%>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="col-md-7 col-lg-7 section-md-t3">
              <div class="row">
                <div class="col-sm-12">
                  <div class="title-box-d">
                    <h3 class="title-d">Property Description</h3>
                  </div>
                </div>
              </div>
              <div class="property-description">
                <span><%=Discription%></span>
                
              </div>
              <div class="row section-t3">
                <div class="col-sm-12">
                  <div class="title-box-d">
                    <h3 class="title-d">Amenities</h3>
                  </div>
                </div>
              </div>
           <%--   <div class="amenities-list color-text-a">
                <ul class="list-a no-margin">
                  <li>Balcony</li>
                  <li>Outdoor Kitchen</li>
                  <li>Cable Tv</li>
                  <li>Deck</li>
                  <li>Tennis Courts</li>
                  <li>Internet</li>
                  <li>Parking</li>
                  <li>Sun Room</li>
                  <li>Concrete Flooring</li>
                </ul>
              </div>--%>
                <div class="col-md-12">
                     <%-- <button type="submit" class="btn btn-a">Buy Property</button>--%>

                     <asp:TextBox runat="server" ID="Amount"  placeholder="Enter amount" type="text" class="form-control form-control-lg form-control-a"   data-msg="Please enter location" ></asp:TextBox> <br  />
                    <asp:Button ID="Button1" runat="server" Text="Bid Tender"  class="btn btn-a" OnClick="Button1_Click"/>
                    </div>
            </div>
          </div>
        </div>
       
       
  </section>
  <!--/ Property Single End /-->

  <!--/ footer Star /-->
  <section class="section-footer">
    <div class="container">
    
      </div>
  
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
