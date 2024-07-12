<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Bidder_request.aspx.cs" Inherits="Tender_Bidder_request" %>

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

        function ConfirmDelete() {

            if (confirm("Are you sure to want to Delete?") == true)

                return true;

            else

                return false;

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
        <%--  </li>
            <li class="nav-item">
            <a class="nav-link" href="Buy_Request.aspx">View Requests</a>
          </li>--%>
        
              
          <li class="nav-item">
            <a class="nav-link" href="contact.html">Contact</a>
          </li>
              <li class="nav-item">
            <a class="nav-link" href="logout.aspx">Logout</a>
          </li>
        </ul>
  
    </div>
  </nav>
  <!--/ Nav End /-->


  <!--/ Intro Single End /-->

  <!--/ Contact Star /-->
  <section class="contact">
    <div class="container">
     
       
        <div class="col-sm-12 section-t8">
      
            
                <form if="form1" runat="server">
                <div id="sendmessage">View Bidder Request!</div>
                <div id="errormessage"></div>
                		  

		  <div class="card-deck">
			<div class="card col-lg-12 px-0 mb-4">
			  <div class="card-body">
				<h5 class="card-title">Bidder Requests</h5>
				<%--<h5 class="card-title"><a href="Add_Property.aspx?msg=add">Add New Property</a></h5>--%>
                  

 <div class="container">
         <asp:GridView ID="gvRequest" runat="server" CssClass="gv" AutoGenerateColumns="false" DataKeyNames="Rid" 
             OnRowCommand="gvRequest_RowCommand" HeaderStyle-HorizontalAlign="Center" HeaderStyle-BackColor="Black"
             HeaderStyle-ForeColor="White">
             <Columns>
                 <asp:BoundField DataField="Rid" HeaderText="ID" ItemStyle-HorizontalAlign="Center"/>
                 <asp:BoundField DataField="Bname" HeaderText="Bidder Name" ItemStyle-HorizontalAlign="Center"/>
                 <asp:BoundField DataField="Tender_name" HeaderText="Tender Name" ItemStyle-HorizontalAlign="Center"/>
                 <asp:BoundField DataField="amount" HeaderText="amount" ItemStyle-HorizontalAlign="Center"/>
                 <asp:BoundField DataField="Rdate" HeaderText="Date" ItemStyle-HorizontalAlign="Center"/>
                   <asp:BoundField DataField="Requestname" HeaderText="Request Status" ItemStyle-HorizontalAlign="Center"/>
                 <asp:TemplateField ShowHeader="False" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Button ID="btnAccept" runat="server" Text="Accept" CommandName="Accept" CausesValidation="false" CommandArgument='<%# Eval("Rid") %>' 
                             CssClass="btn btn-outline-success" Enabled='<%# Eval("Requestname").ToString() == "Pending" ? true : false %>'/>
                    </ItemTemplate>

                 </asp:TemplateField>   
             
             </Columns>
         </asp:GridView>
    </div>
			
			  </div>
			</div>
                  


              </form>
            </div>
           
          </div>
       
      
  
  </section>
  <!--/ Contact End /-->

 <!--/ footer Star /-->
  <section class="section-footer">
    <div class="container">
      <div class="row">
        <div class="col-sm-12 col-md-4">
          <div class="widget-a">
            <div class="w-header-a">
              <h3 class="w-title-a text-brand">ETender</h3>
            </div>
          
            <div class="w-footer-a">
              <ul class="list-unstyled">
                <li class="color-a">
                  <span class="color-text-a">Phone .</span> contact@example.com</li>
                <li class="color-a">
                  <span class="color-text-a">Email .</span> +54 356 945234</li>
              </ul>
            </div>
          </div>
        </div>
      
        
        
          </div>
        </div>
      </div>
    </div>
  </section>
  <footer>
    <div class="container">

        
        
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