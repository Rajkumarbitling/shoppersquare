
package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author Rajkumar
 */
@WebFilter(servletNames = {"Controller"})
public abstract class SessionTimeoutFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);

        // if session doesn't exist, forward user to welcome page
        if (
            session.getAttribute("userid") != null) {
            chain.doFilter(request, response); // Logged-in user found, so just continue request.
        } else { // change "user" for the session attribute you have defined
            
            req.getRequestDispatcher("/signin.jsp").forward(request, response); // No logged-in user found, so redirect to login page.
        }
    }

    @Override
    public void destroy() {
        // If you have assigned any expensive resources as field of
        // this Filter class, then you could clean/close them here.
    }

    //basic validation of pages that do not require authentication
    private boolean needsAuthentication(String url) {
        String[] validNonAuthenticationUrls =
            { "signin.jsp", "signup.jsp",  "login.jsp", "registration.jsp", "success.jsp", "welcome.jsp"};
        for(String validUrl : validNonAuthenticationUrls) {
            if (url.endsWith(validUrl)) {
                return false;
            }
        }
        return true;
    }



  



   

   
}
