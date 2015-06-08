package ventas



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class LoginController {
  def form(String id){
    [username: id]
  }
}