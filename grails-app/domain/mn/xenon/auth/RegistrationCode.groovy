package mn.xenon.auth

class RegistrationCode implements Serializable{

  Long userId
  String token = UUID.randomUUID().toString().replaceAll('-', '')
  
  Date dateCreated = new Date()

  static mapping = {
    version false
  }
}
