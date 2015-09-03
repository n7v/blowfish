module Blowfish
  module Key
    # Generation of the key by password.
    def self.generate(pass)
      key = OpenStruct.new(
        S1: Blowfish::Key::Init::S1.dup,
        S2: Blowfish::Key::Init::S2.dup,
        S3: Blowfish::Key::Init::S3.dup,
        S4: Blowfish::Key::Init::S4.dup,
        P:  Blowfish::Key::Init::P.dup
      )

      pass = pass.ljust(key.P.size * 4, pass)

      (0...(key.P.size)).step(4) do |i|
        key.P[i] ^= pass.byteslice(i, 4).unpack('I>').first
      end

      b = 0.chr * 8
      (0...(key.P.size)).step(2) do |i|
        b = Blowfish::Block.encrypt(b, key)
        key.P[i], key.P[i + 1] = b.unpack('I>I>')
      end

      (0...(key.S1.size)).step(2) do |i|
        b = Blowfish::Block.encrypt(b, key)
        key.S1[i], key.S1[i + 1] = b.unpack('I>I>')
      end

      (0...(key.S2.size)).step(2) do |i|
        b = Blowfish::Block.encrypt(b, key)
        key.S2[i], key.S2[i + 1] = b.unpack('I>I>')
      end

      (0...(key.S3.size)).step(2) do |i|
        b = Blowfish::Block.encrypt(b, key)
        key.S3[i], key.S3[i + 1] = b.unpack('I>I>')
      end

      (0...(key.S4.size)).step(2) do |i|
        b = Blowfish::Block.encrypt(b, key)
        key.S4[i], key.S4[i + 1] = b.unpack('I>I>')
      end

      key
    end
  end
end
