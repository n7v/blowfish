module Blowfish
  module Block
    def self.f(i, key)
      r = (key.S1[i >> 24] + key.S2[(i >> 16) & 0xff]) % (2**32)
      r ^= key.S3[(i >> 8) & 0xff]
      r += key.S4[i & 0xff]
      r % (2**32)
    end

    # Encrypt one block of data
    def self.encrypt(b, key)
      l, r = b.unpack('I>I>')
      (0..15).step(2) do |i|
        l ^= key.P[i]
        r ^= f(l, key)
        r ^= key.P[i + 1]
        l ^= f(r, key)
      end
      l ^= key.P[16]
      r ^= key.P[17]
      l, r = r, l
      [l, r].pack('I>I>')
    end

    # Decrypt one block of data
    def self.decrypt(b, key)
      l, r = b.unpack('I>I>')
      16.step(1, -2) do |i|
        l ^= key.P[i + 1]
        r ^= f(l, key)
        r ^= key.P[i]
        l ^= f(r, key)
      end
      l ^= key.P[1]
      r ^= key.P[0]
      l, r = r, l
      [l, r].pack('I>I>')
    end
  end
end
