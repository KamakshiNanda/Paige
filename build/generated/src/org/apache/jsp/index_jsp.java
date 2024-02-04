package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import classes.Connectivity;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"description\" content=\"\">\n");
      out.write("        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->\n");
      out.write("\n");
      out.write("        <!-- Title  -->\n");
      out.write("        <title>Paige | Home</title>\n");
      out.write("\n");
      out.write("        <!-- Favicon  -->\n");
      out.write("        <link rel=\"icon\" href=\"img/core-img/favicon.ico\">\n");
      out.write("\n");
      out.write("        <!-- Core Style CSS -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/core-style.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"style.css\">\n");
      out.write("        ");

            Connectivity c=new Connectivity();
            Connection con=c.createConnection();
            PreparedStatement pst=con.prepareStatement("SELECT sellingPrice FROM seller_book_details WHERE category=? ORDER BY sellingPrice");
            pst.setString(1,"best sellers");
            ResultSet rs=pst.executeQuery();
            if(rs.next())
            
      out.write("\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <!-- ##### Main Content Wrapper Start ##### -->\n");
      out.write("        <div class=\"main-content-wrapper d-flex clearfix\">\n");
      out.write("\n");
      out.write("            <!-- Mobile Nav (max width 767px)-->\n");
      out.write("            <div class=\"mobile-nav\">\n");
      out.write("                <!-- Navbar Brand -->\n");
      out.write("                <div class=\"amado-navbar-brand\">\n");
      out.write("                    <a href=\"index.jsp\"><img src=\"img/core-img/logo2.jpeg\" alt=\"\"></a>\n");
      out.write("                </div>\n");
      out.write("                <!-- Navbar Toggler -->\n");
      out.write("                <div class=\"amado-navbar-toggler\">\n");
      out.write("                    <span></span><span></span><span></span>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <!-- Header Area Start -->\n");
      out.write("            <header class=\"header-area clearfix\">\n");
      out.write("                <!-- Close Icon -->\n");
      out.write("                <div class=\"nav-close\">\n");
      out.write("                    <i class=\"fa fa-close\" aria-hidden=\"true\"></i>\n");
      out.write("                </div>\n");
      out.write("                <!-- Logo -->\n");
      out.write("                <div class=\"logo\">\n");
      out.write("                    <a href=\"index.jsp\"><img src=\"img/core-img/logo2.jpeg\" alt=\"\"></a>\n");
      out.write("                </div>\n");
      out.write("                <!-- Amado Nav -->\n");
      out.write("                <nav class=\"amado-nav\">\n");
      out.write("                    <ul>\n");
      out.write("                        <li class=\"active\"><a href=\"index.jsp\">Home</a></li>\n");
      out.write("                        <li><a href=\"shop.jsp\">Shop</a></li>\n");
      out.write("                        <li><a href=\"SellerForm.jsp\">Sell</a></li>\n");
      out.write("                        <li><a href=\"wishlist.jsp\">Wishlist</a></li>\n");
      out.write("                        <li><a href=\"LogOut\" onclick=\"signOut();\">\n");
      out.write("                                ");

                                    if (session.getAttribute("uid") == null) {
                                        out.print("Login / Signup");
                                    } else {
                                        out.print("Logout");
                                    } 
                                
      out.write("\n");
      out.write("                            </a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </nav>\n");
      out.write("                <script>\n");
      out.write("                    function signOut() {\n");
      out.write("                        var auth2 = gapi.auth2.getAuthInstance();\n");
      out.write("                        auth2.signOut().then(function () {\n");
      out.write("                            console.log('User signed out.');\n");
      out.write("                        });\n");
      out.write("                    }\n");
      out.write("                </script>\n");
      out.write("                <!-- Button Group -->\n");
      out.write("                <div class=\"amado-btn-group mt-30 mb-100\">\n");
      out.write("                    <a href=\"MyBooks.jsp\" class=\"btn amado-btn mb-15\">My Books</a>\n");
      out.write("                    <a href=\"NewBooks.jsp\" class=\"btn amado-btn active\">New this week</a>\n");
      out.write("                </div>\n");
      out.write("                <!-- Cart Menu -->\n");
      out.write("                <div class=\"cart-fav-search mb-100\">\n");
      out.write("                    <a href=\"wishlist.jsp\" class=\"cart-nav\"><img src=\"img/core-img/cart.png\" alt=\"\"> Wishlist</a>\n");
      out.write("                    <a href=\"AccountDetails.jsp\" class=\"fav-nav\"><img src=\"img/core-img/user.png\" alt=\"\"> User</a>\n");
      out.write("                </div>\n");
      out.write("                <!-- Social Button -->\n");
      out.write("                <div class=\"social-info d-flex justify-content-between\">\n");
      out.write("                    <a href=\"#\"><i class=\"fa fa-pinterest\" aria-hidden=\"true\"></i></a>\n");
      out.write("                    <a href=\"#\"><i class=\"fa fa-instagram\" aria-hidden=\"true\"></i></a>\n");
      out.write("                    <a href=\"#\"><i class=\"fa fa-facebook\" aria-hidden=\"true\"></i></a>\n");
      out.write("                    <a href=\"#\"><i class=\"fa fa-twitter\" aria-hidden=\"true\"></i></a>\n");
      out.write("                </div>\n");
      out.write("            </header>\n");
      out.write("            <!-- Header Area End -->\n");
      out.write("\n");
      out.write("            <!-- Product Catagories Area Start -->\n");
      out.write("            <div class=\"products-catagories-area clearfix\">\n");
      out.write("                <div class=\"amado-pro-catagory clearfix\">\n");
      out.write("\n");
      out.write("                    <!-- Single Catagory -->\n");
      out.write("                    <div class=\"single-products-catagory clearfix\">\n");
      out.write("                        <a href=\"shop.jsp?category='best sellers'\">\n");
      out.write("                            <img src=\"bookImages/a bestsellers5.jpg\" style=\"height: auto; width: fit-content;\" alt=\"Bestsellers image\">\n");
      out.write("                            <!-- Hover Content -->\n");
      out.write("                            <div class=\"hover-content\">\n");
      out.write("                                <div class=\"line\"></div>\n");
      out.write("                                <p class=\"frm\">From ₹");
      out.print(rs.getString(1));
      out.write("</p>\n");
      out.write("                                <h4>Best Sellers</h4>\n");
      out.write("                            </div>\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <!-- Single Catagory -->\n");
      out.write("                    ");

                        pst=con.prepareStatement("SELECT sellingPrice FROM seller_book_details WHERE category=? ORDER BY sellingPrice");
                        pst.setString(1,"literature and fiction");
                        rs=pst.executeQuery();
                        if(rs.next())
                    
      out.write("\n");
      out.write("                    <div class=\"single-products-catagory clearfix\">\n");
      out.write("                        <a href=\"shop.jsp?category='literature and fiction'\">\n");
      out.write("                            <img src=\"bookImages/a literature and fiction.jfif\" alt=\"Literature and fiction\">\n");
      out.write("                            <!-- Hover Content -->\n");
      out.write("                            <div class=\"hover-content\">\n");
      out.write("                                <div class=\"line\"></div>\n");
      out.write("                                <p class=\"frm\">From ₹");
      out.print(rs.getString(1));
      out.write("</p>\n");
      out.write("                                <h4>Literature and Fiction</h4>\n");
      out.write("                            </div>\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                    ");

                        pst=con.prepareStatement("SELECT sellingPrice FROM seller_book_details WHERE category=? ORDER BY sellingPrice");
                        pst.setString(1,"textbook");
                        rs=pst.executeQuery();
                        if(rs.next())
                    
      out.write("\n");
      out.write("                    <!-- Single Catagory -->\n");
      out.write("                    <div class=\"single-products-catagory clearfix\">\n");
      out.write("                        <a href=\"shop.jsp?category='textbook'\">\n");
      out.write("                            <img src=\"bookImages/a textbook3.jpg\" alt=\"Textbooks image\">\n");
      out.write("                            <!-- Hover Content -->\n");
      out.write("                            <div class=\"hover-content\">\n");
      out.write("                                <div class=\"line\"></div>\n");
      out.write("                                <p class=\"frm\">From ₹");
      out.print(rs.getString(1));
      out.write("</p>\n");
      out.write("                                <h4>Textbooks</h4>\n");
      out.write("                            </div>\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                    ");

                        pst=con.prepareStatement("SELECT sellingPrice FROM seller_book_details WHERE category=? ORDER BY sellingPrice");
                        pst.setString(1,"children");
                        rs=pst.executeQuery();
                        if(rs.next())
                    
      out.write("\n");
      out.write("                    <!-- Single Catagory -->\n");
      out.write("                    <div class=\"single-products-catagory clearfix\">\n");
      out.write("                        <a href=\"shop.jsp?category='children'\">\n");
      out.write("                            <img src=\"bookImages/a children2.jpg\" alt=\"Children\">\n");
      out.write("                            <!-- Hover Content -->\n");
      out.write("                            <div class=\"hover-content\">\n");
      out.write("                                <div class=\"line\"></div>\n");
      out.write("                                <p class=\"frm\">From ₹");
      out.print(rs.getString(1));
      out.write("</p>\n");
      out.write("                                <h4>Children</h4>\n");
      out.write("                            </div>\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                     ");

                        pst=con.prepareStatement("SELECT sellingPrice FROM seller_book_details WHERE category=? ORDER BY sellingPrice");
                        pst.setString(1,"nonfiction");
                        rs=pst.executeQuery();
                        if(rs.next())
                    
      out.write("\n");
      out.write("                    <!-- Single Catagory -->\n");
      out.write("                    <div class=\"single-products-catagory clearfix\">\n");
      out.write("                        <a href=\"shop.jsp?category='nonfiction'\">\n");
      out.write("                            <img src=\"bookImages/a nonfiction2.jpeg\" alt=\"Nonfiction image\">\n");
      out.write("                            <!-- Hover Content -->\n");
      out.write("                            <div class=\"hover-content\">\n");
      out.write("                                <div class=\"line\"></div>\n");
      out.write("                                <p>From ₹");
      out.print(rs.getString(1));
      out.write("</p>\n");
      out.write("                                <h4>Nonfiction</h4>\n");
      out.write("                            </div>\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                    ");

                        pst=con.prepareStatement("SELECT sellingPrice FROM seller_book_details WHERE category=? ORDER BY sellingPrice");
                        pst.setString(1,"classics");
                        rs=pst.executeQuery();
                        if(rs.next())
                    
      out.write("\n");
      out.write("                    <!-- Single Catagory -->\n");
      out.write("                    <div class=\"single-products-catagory clearfix\">\n");
      out.write("                        <a href=\"shop.jsp?category='classics'\">\n");
      out.write("                            <img src=\"bookImages/images4.jpg\" alt=\"\">\n");
      out.write("                            <!-- Hover Content -->\n");
      out.write("                            <div class=\"hover-content\">\n");
      out.write("                                <div class=\"line\"></div>\n");
      out.write("                                <p>From ₹");
      out.print(rs.getString(1));
      out.write("</p>\n");
      out.write("                                <h4>Classics</h4>\n");
      out.write("                            </div>\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                    ");

                        pst=con.prepareStatement("SELECT sellingPrice FROM seller_book_details WHERE category=? ORDER BY sellingPrice");
                        pst.setString(1,"crime and thriller");
                        rs=pst.executeQuery();
                        if(rs.next())
                    
      out.write("\n");
      out.write("                    <!-- Single Catagory -->\n");
      out.write("                    <div class=\"single-products-catagory clearfix\">\n");
      out.write("                        <a href=\"shop.jsp?category='crime and thriller'\">\n");
      out.write("                            <img src=\"bookImages/a crime and thrillers.jpg\" alt=\"Crime and Thriller\">\n");
      out.write("                            <!-- Hover Content -->\n");
      out.write("                            <div class=\"hover-content\">\n");
      out.write("                                <div class=\"line\"></div>\n");
      out.write("                                <p>From ₹");
      out.print(rs.getString(1));
      out.write("</p>\n");
      out.write("                                <h4>Crime and Thriller</h4>\n");
      out.write("                            </div>\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                    ");

                        pst=con.prepareStatement("SELECT sellingPrice FROM seller_book_details WHERE category=? ORDER BY sellingPrice");
                        pst.setString(1,"romantic");
                        rs=pst.executeQuery();
                        if(rs.next())
                    
      out.write("\n");
      out.write("                    <!-- Single Catagory -->\n");
      out.write("                    <div class=\"single-products-catagory clearfix\">\n");
      out.write("                        <a href=\"shop.jsp?category='romantic'\">\n");
      out.write("                            <img src=\"bookImages/a romantic3.jpg\" alt=\"\">\n");
      out.write("                            <!-- Hover Content -->\n");
      out.write("                            <div class=\"hover-content\">\n");
      out.write("                                <div class=\"line\"></div>\n");
      out.write("                                <p>From ₹");
      out.print(rs.getString(1));
      out.write("</p>\n");
      out.write("                                <h4>Romantic</h4>\n");
      out.write("                            </div>\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("                    ");

                        pst=con.prepareStatement("SELECT sellingPrice FROM seller_book_details WHERE category=? ORDER BY sellingPrice");
                        pst.setString(1,"science and fiction");
                        rs=pst.executeQuery();
                        if(rs.next())
                    
      out.write("\n");
      out.write("                    <!-- Single Catagory -->\n");
      out.write("                    <div class=\"single-products-catagory clearfix\">\n");
      out.write("                        <a href=\"shop.jsp?category='science and fiction'\">\n");
      out.write("                            <img src=\"bookImages/a science_fiction3.jpg\" alt=\"science and fiction image\">\n");
      out.write("                            <!-- Hover Content -->\n");
      out.write("                            <div class=\"hover-content\">\n");
      out.write("                                <div class=\"line\"></div>\n");
      out.write("                                <p>From ₹");
      out.print(rs.getString(1));
      out.write("</p>\n");
      out.write("                                <h4>Science and Fiction</h4>\n");
      out.write("                            </div>\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <!-- Product Catagories Area End -->\n");
      out.write("        </div>\n");
      out.write("        <!-- ##### Main Content Wrapper End ##### -->\n");
      out.write("\n");
      out.write("        <!-- ##### Newsletter Area Start ##### -->\n");
      out.write("        <section class=\"newsletter-area section-padding-100-0\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row align-items-center\">\n");
      out.write("                    <!-- Newsletter Text -->\n");
      out.write("                    <div class=\"col-12 col-lg-6 col-xl-7\">\n");
      out.write("                        <div class=\"newsletter-text mb-100\">\n");
      out.write("                            <h2>Get yourself <span>Registered</span></h2>\n");
      out.write("                            <p>Get yourself registered to get access to our services.</p>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <!-- Newsletter Form -->\n");
      out.write("                    <div class=\"col-12 col-lg-6 col-xl-5\">\n");
      out.write("                        <div class=\"newsletter-form mb-100\">\n");
      out.write("                            <form action=\"login_signup.jsp\" method=\"post\">\n");
      out.write("                                <input type=\"email\" name=\"email\" class=\"nl-email\" placeholder=\"Your E-mail\">\n");
      out.write("                                <input type=\"submit\" value=\"Register\">\n");
      out.write("                            </form>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("        <!-- ##### Newsletter Area End ##### -->\n");
      out.write("\n");
      out.write("        <!-- ##### Footer Area Start ##### -->\n");
      out.write("        <footer class=\"footer_area clearfix\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row align-items-center\">\n");
      out.write("                    <!-- Single Widget Area -->\n");
      out.write("                    <div class=\"col-12 col-lg-4\">\n");
      out.write("                        <div class=\"single_widget_area\">\n");
      out.write("                            <!-- Logo -->\n");
      out.write("                            <div class=\"footer-logo mr-50\">\n");
      out.write("                                <a href=\"index.html\"><img src=\"img/core-img/logo2.png\" alt=\"\"></a>\n");
      out.write("                            </div>\n");
      out.write("                            <!-- Copywrite Text -->\n");
      out.write("                            <p class=\"copywrite\"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->\n");
      out.write("                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made by <a href=\"https://www.msu-cyberia.com\" target=\"_blank\">Team Paige. </a>\n");
      out.write("                            </p>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <!-- Single Widget Area -->\n");
      out.write("                    <div class=\"col-12 col-lg-8\">\n");
      out.write("                        <div class=\"single_widget_area\">\n");
      out.write("                            <!-- Footer Menu -->\n");
      out.write("                            <div class=\"footer_menu\">\n");
      out.write("                                <nav class=\"navbar navbar-expand-lg justify-content-end\">\n");
      out.write("                                    <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#footerNavContent\" aria-controls=\"footerNavContent\" aria-expanded=\"false\" aria-label=\"Toggle navigation\"><i class=\"fa fa-bars\"></i></button>\n");
      out.write("                                    <div class=\"collapse navbar-collapse\" id=\"footerNavContent\">\n");
      out.write("                                        <ul class=\"navbar-nav ml-auto\">\n");
      out.write("                                            <li class=\"nav-item active\">\n");
      out.write("                                                <a class=\"nav-link\" href=\"index.jsp\">Home</a>\n");
      out.write("                                            </li>\n");
      out.write("                                            <li class=\"nav-item\">\n");
      out.write("                                                <a class=\"nav-link\" href=\"shop.jsp\">Shop</a>\n");
      out.write("                                            </li>\n");
      out.write("                                            <li class=\"nav-item\">\n");
      out.write("                                                <a class=\"nav-link\" href=\"product-description.jsp\">Product</a>\n");
      out.write("                                            </li>\n");
      out.write("                                            <li class=\"nav-item\">\n");
      out.write("                                                <a class=\"nav-link\" href=\"wishlist.jsp\">WishList</a>\n");
      out.write("                                            </li>\n");
      out.write("                                        </ul>\n");
      out.write("                                    </div>\n");
      out.write("                                </nav>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </footer>\n");
      out.write("        <!-- ##### Footer Area End ##### -->\n");
      out.write("\n");
      out.write("        <!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->\n");
      out.write("        <script src=\"js/jquery/jquery-2.2.4.min.js\"></script>\n");
      out.write("        <!-- Popper js -->\n");
      out.write("        <script src=\"js/popper.min.js\"></script>\n");
      out.write("        <!-- Bootstrap js -->\n");
      out.write("        <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("        <!-- Plugins js -->\n");
      out.write("        <script src=\"js/plugins.js\"></script>\n");
      out.write("        <!-- Active js -->\n");
      out.write("        <script src=\"js/active.js\"></script>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
