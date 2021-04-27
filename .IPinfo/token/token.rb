require 'base64'
class Token
  def initialize(dato)
    @dato = dato
  end
  def decode_token()
    return dec = Base64.decode64(@dato)
  end
end
