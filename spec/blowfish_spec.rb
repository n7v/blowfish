RSpec.describe Blowfish do
  describe '.encrypt' do
    it 'should encrypt binary string' do
      str = "ab\x00de"
      key = Blowfish::Key.generate('123456')
      c = Blowfish.encrypt(str, key)
      d = Blowfish.decrypt(c, key)
      expect(d).to eq(str)
    end

    it 'should support space padding mode' do
      str = "a\x00c"
      key = Blowfish::Key.generate('123456')
      c = Blowfish.encrypt(str, key, padding: :spaces)
      d = Blowfish.decrypt(c, key, padding: :spaces)
      expect(d).to eq(str)
    end
  end
end
