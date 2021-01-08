class UrlShortener
    ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  
  def bijective_encode(i)
    # from http://refactormycode.com/codes/125-base-62-encoding
    # with only minor modification
    return ALPHABET[0] if i == 0
    s = ''
    base = ALPHABET.length
    while i > 0
      s << ALPHABET[i.modulo(base)]
      i /= base
    end
    s.reverse
  end
end