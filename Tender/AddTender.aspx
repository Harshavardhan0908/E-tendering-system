<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddTender.aspx.cs" Inherits="Tender_AddTender" %>

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

    <script type="text/javascript">
        var chkvalue = "";


        function showimg() {
            debugger;
            var showimage = document.querySelector('#<%=showimge.ClientID %>');
            var file = document.querySelector('#<%=fileuplogo.ClientID%>').files[0];

            var reader = new window.FileReader();

            reader.onload = function () {
                showimage.src = reader.result;

            }
            if (file) {
                //reader.readasdataurl(file);
                reader.readAsDataURL(file);

            }
            else {
                showimage.src = "";
            }
        }

    </script>
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
            <a class="nav-link" href="Manage_TEnder.aspx">Manage Tender</a>
         <%-- </li>
            <li class="nav-item">
            <a class="nav-link" href="Buy_Request.aspx">View Requests</a>
          </li>--%>
       
             <li class="nav-item">
            <a class="nav-link" href="Ledger.aspx">Ledger</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="contact.html">Contact</a>
          </li>
              <li class="nav-item">
            <a class="nav-link" href="logout.aspx">Logout</a>
          </li>
        </ul>
      </div>
    
      </button>
    </div>
  </nav>
  <!--/ Nav End /-->


  <!--/ Intro Single End /-->

  <!--/ Contact Star /-->
  <section class="contact">
    <div class="container">
      <div class="row">
       
        <div class="col-sm-12 section-t8">
          <div class="row">
            <div class="col-md-7">
                <form if="form1" runat="server">
              <%--  <div id="sendmessage">Add Tenders Details!</div>--%>
                <div id="errormessage"></div>
                <div class="row">
                  <div class="col-md-6 mb-3">
                    <div class="form-group">
                         <label for="bathrooms">Name</label>
                         <asp:TextBox runat="server" ID="name"  placeholder="name" type="text" class="form-control form-control-lg form-control-a" required="required"  data-msg="Please enter name" ></asp:TextBox> 
         
                      <div class="validation"></div>
                    </div>
                  </div>
                  <div class="col-md-6 mb-3">
                    <div class="form-group">
                <label for="bathrooms">Location</label>
                    <asp:TextBox runat="server" ID="Location"  placeholder="Location" type="text" class="form-control form-control-lg form-control-a"   data-msg="Please enter location" required="required"></asp:TextBox> 
                    <%--  <input name="Location" type="text" class="form-control form-control-lg form-control-a" placeholder="Location"   data-msg="Please enter a valid area" required="required"value="<%=_area %>">--%>
                      <div class="validation"></div>
                    </div>
                  </div>
                  <div class="col-md-6 mb-3">
                    <div class="form-group">
                      <label for="bedrooms">Type of Tender</label>
                          <asp:DropDownList id="TOtt" name="Tenders"  runat="server"  Class="form-control form-control-lg form-control-a">
                        </asp:DropDownList>
                     
                   
                      <div class="validation"></div>
                    </div>
                  </div>
                    <div class="col-md-6 mb-3">
                    <div class="form-group">
                    <%-- <label for="garages">Type of Road</label>
                         <asp:DropDownList id="tor" name="Road" runat="server"  Class="form-control form-control-lg form-control-a">
                        </asp:DropDownList>
                    --%> 
                      <div class="validation"></div>
                    </div>
                  </div>
                <div class="col-md-6 mb-3">
                    <div class="form-group">
                     <%--<label for="bathrooms">No of Lane</label>--%>
                      <%--<select class="form-control form-control-lg form-control-a" id="lane"  runat="server" name="bathrooms" required="required">
                        <option>Any</option>
                        <option>01</option>
                        <option>02</option>
                        <option>03</option>
                      </select>--%>
                      <div class="validation"></div>
                    </div>
                  </div>
                    <div class="col-md-6 mb-3">
                    <div class="form-group">
                        <%--<label for="garages">Length</label>
                        <asp:TextBox runat="server" ID="Length" placeholder="Length"  type="text" class="form-control form-control-lg form-control-a"   data-msg="Please enter location" required="required" ></asp:TextBox> --%>
                     <%-- <input type="text" name="Length" class="form-control form-control-lg form-control-a"  placeholder="Length"  required="required" value="<%=length %>">--%>
                      <div class="validation"></div>
                    </div>
                  </div>
                     <div class="col-md-6 mb-3">
                    <div class="form-group">
                         <label for="garages">Reference no.</label>
                         <asp:TextBox runat="server" ID="Ref"  type="text" class="form-control form-control-lg form-control-a"   data-msg="Please enter location"  required="required"></asp:TextBox> 
                     <%-- <input type="text" name="Ref" class="form-control form-control-lg form-control-a"  placeholder="Reference"  required="required" value="<%=reference %>">--%>
                      <div class="validation"></div>
                    </div>
                  </div>
                  <div class="col-md-6 mb-3">
                    <div class="form-group">
                         <%--<label for="garages">Weidth</label>
                        <asp:TextBox runat="server" ID="Height"  type="text" class="form-control form-control-lg form-control-a"   data-msg="Please enter location"  required="required"></asp:TextBox> --%>
                     <%-- <input name="Height" type="text" class="form-control form-control-lg form-control-a" placeholder="Height"   data-msg="Please enter a valid area" required="required"value="<%=height %>">--%>
                      <div class="validation"></div>
                    </div>
                  </div>
                <div class="col-md-6 mb-3">
                    <div class="form-group">
                     <label for="bathrooms">price</label>
                        <asp:TextBox runat="server" ID="Price"  type="text" class="form-control form-control-lg form-control-a"   data-msg="Please enter location"  required="required"></asp:TextBox> 
<%--                      <input name="price" type="text" class="form-control form-control-lg form-control-a" placeholder="Value"  data-msg="Please enter a valid prie" required="required" value="<%=_price %>">--%>
                      <div class="validation"></div>
                    </div>
                  </div>
                     <div class="col-md-6 mb-3">
                    <div class="form-group">
                     <label for="bathrooms">Closing Date</label>
                        <asp:TextBox runat="server" ID="txtDate"  type="text" class="form-control form-control-lg form-control-a"   data-msg="Please enter location" ></asp:TextBox> 
                          <asp:ImageButton ID="ImageButton1" runat="server" OnClick="imgCal_Click1" ImageUrl="img/calendar.png" CausesValidation="false"/>
                             <asp:Calendar ID="Calendar1" runat="server" Visible="false" OnSelectionChanged="cal_SelectionChanged1"/>
<%--                      <input name="price" type="text" class="form-control form-control-lg form-control-a" placeholder="Value"  data-msg="Please enter a valid prie" required="required" value="<%=_price %>">--%>
                      <div class="validation"></div>
                    </div>
                  </div>

                    
                       
                   


                 <%--   <div class="col-md-6 mb-3">
                    <div class="form-group">
                     <label for="bathrooms">CLosing Date</label>
                      <input name="CLosing Date" type="text" class="form-control form-control-lg form-control-a" placeholder="Value"  data-msg="Please enter a valid prie" required="required" value="<%=_Closing %>">
                      <div class="validation"></div>
                    </div>
                  </div>--%>
                  <div class="col-md-12 mb-3">
                    <div class="form-group">
                          <label for="garages">Discription</label>
                        <asp:TextBox ID="disc"  runat="server" TextMode="MultiLine" Height="100"  class="form-control"  cols="45" rows="8"  data-msg="Please write something for us" required="required"></asp:TextBox>
                     <%-- <textarea name="Discription" id="disc" class="form-control"  cols="45" rows="8" data-rule="required" data-msg="Please write something for us" placeholder="Address" required="required" ></textarea>--%>
                      <div class="validation"></div>
                    </div>
                  </div>
                <div class="col-md-12 mb-3">
                    <label for="fileuplogo">Image</label>
                    <div class="form-group">
                      <asp:FileUpload ID="fileuplogo" runat="server" onchange="showimg()" class="form-control form-control-lg form-control-a"  />
                      <div class="validation"></div>
                    </div>
                  </div>
                <div class="col-md-12 mb-3">
                     <label  for="FileUpload1">Document</label>
                    <div class="form-group">
                      <asp:FileUpload ID="FileUpload1" runat="server"  class="form-control form-control-lg form-control-a"/>
                      <div class="validation"></div>
                    </div>
                  </div>
                  <div class="col-md-12">
                    <%--<button type="submit" class="btn btn-a">Send Message</button>--%>
                      <asp:Button ID="Button1" runat="server" Text="Submit"  class="btn btn-a" OnClick="Button1_Click"/>

                  </div>
                </div>
              </form>
            </div>
            <div class="col-md-5 section-md-t3">
              <div class="icon-box section-b2">
                   <div class="icon-box-icon">
                         <span > Property Image</span>
                    </div>
                     <div class="form-group">              
                         <asp:Image ID="showimge" runat="server" Height="250" Width="500" />                            
		            </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--/ Contact End /-->

<!--/ footer Star /-->
  <section class="section-footer">
 
    </div>
  </footer>
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

