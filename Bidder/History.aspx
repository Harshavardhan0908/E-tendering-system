<%@ Page Language="C#" AutoEventWireup="true" CodeFile="History.aspx.cs" Inherits="Bidder_History" %>

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
    
      </button>
    </div>
  </nav>
  <!--/ Nav End /-->


  <!--/ Intro Single End /-->

  <!--/ Contact Star /-->
  <section class="contact">
    <div class="container">
     
       
        <div class="col-sm-12 section-t8">
      
            
                <form if="form1" runat="server">
                <div id="sendmessage"> Bidder History</div>
                <div id="errormessage"></div>
                		  

		  <div class="card-deck">
			<div class="card col-lg-12 px-0 mb-4">
			  <div class="card-body">
				
			<%--	<h5 class="card-title"><a href="Add_Property.aspx?msg=add">Add New Property</a></h5>--%>
                  <h5 class="card-title"><a href="AddTender.aspx"></a></h5>
                
                
						</div>


				<div class="table-responsive">
				 <table class="table">
            <thead>
              <tr>
                <th scope="col">ID</th>
               <th scope="col">Bidder name</th>
                <th scope="col">Amount</th>          
                <th scope="col">Status</th>
                <%--  <th scope="col">Reference No</th>
                  <th scope="col">Location</th>
                   <th scope="col">Closing Date</th>
             
                   <th scope="col">Edit</th>
                    <th scope="col">View</th>
                     <th scope="col">Delete</th>--%>
              </tr>
            </thead>
           
                <% if (flag == true)
                   {
                       foreach (System.Data.DataRow row in dt.Rows)
                       {%>
                            <tbody>
                                <tr>
                                    <td><%=row["rid"]%></td>
                                    <td><%=row["bname"]%></td>
                                    <td><%=row["Amount"]%></td>
                                    <td><%=row["Requestname"]%></td>
                                 <%--   <td><%=row["Refno"]%></td>
                                    <td><%=row["Tlocation"]%></td>
                                    <td><%=row["Tclosingdate"]%></td>
                                    <td><a href="Add_Property.aspx?id=<%=row.ItemArray[0]%>&msg=edit" class="btn btn-outline-success ">Edit</a></td>
                                     <td><a href="Bidder_request.aspx?id=<%=row.ItemArray[0]%>" class="btn btn-outline-success ">View</a></td>
                                    <td><a href="Delete_property.aspx?id=<%=row.ItemArray[0]%>" class="btn btn-outline-danger" onclick="return ConfirmDelete()" >Del</a></td>
                 --%>

                                 </tr>
                            </tbody>
                           
                     <%  }
                      
                       
                   }%>
                   <%  else
                 {%>
                      
                   <%}%> 
           
          </table>
				</div>
			  </div>
			</div>
                  


              </form>
            </div>
           
          </div>
       
      
  
  </section>
  <!--/ Contact End /-->

 <!--/ footer Star /-->

  <footer>
  
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

