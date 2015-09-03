RSpec.describe Blowfish::Key do
  describe '.generate' do
    it 'should generate Blowfish key by password' do
      key = Blowfish::Key.generate('123456')
      expect(key.S1).to_not be_nil
      expect(key.S2).to_not be_nil
      expect(key.S3).to_not be_nil
      expect(key.S4).to_not be_nil
      expect(key.P).to_not be_nil
    end
  end
end
