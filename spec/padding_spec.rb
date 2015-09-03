RSpec.describe Blowfish::Padding do
  describe '.pad' do
    it 'should pad data using ANSI X.923 method by default' do
      s = Blowfish::Padding.pad('abcde')
      expect(s).to eq("abcde\x00\x00\x03")
    end

    it 'should return padded data of correct size' do
      s = Blowfish::Padding.pad('abcde')
      expect(s.bytes.size).to eq(8)
    end

    context 'when invalid padding mode' do
      it 'should raise exception when invalid padding mode' do
        expect do
          Blowfish::Padding.pad('abcde', :abcdef)
        end.to raise_error(Blowfish::UnknownPaddingModeError)
      end
    end

    context 'when padding mode :none and data size is not multiple of 8' do
      it 'should raise exception' do
        expect do
          Blowfish::Padding.pad('abcde', :none)
        end.to raise_error(Blowfish::InvalidDataSizeError)
      end
    end
  end

  describe '.unpad' do
    it 'should unpad data using ANSI X.923 method by default' do
      s = Blowfish::Padding.unpad("abcde\x00\x00\x03")
      expect(s).to eq('abcde')
    end

    it 'should revert padding' do
      expect(Blowfish::Padding.unpad(Blowfish::Padding.pad(''))).to eq('')
      expect(Blowfish::Padding.unpad(Blowfish::Padding.pad('a'))).to eq('a')
      expect(
        Blowfish::Padding.unpad(Blowfish::Padding.pad('abcd'))
      ).to eq('abcd')
      expect(
        Blowfish::Padding.unpad(Blowfish::Padding.pad('abcdefgh'))
      ).to eq('abcdefgh')
    end

    context 'when invalid padding mode' do
      it 'should raise exception when invalid padding mode' do
        expect do
          Blowfish::Padding.unpad('abcde', :abcdef)
        end.to raise_error(Blowfish::UnknownPaddingModeError)
      end
    end

    context 'when data size is not multiple of 8' do
      it 'should raise exception' do
        expect do
          Blowfish::Padding.unpad('abcde')
        end.to raise_error(Blowfish::InvalidDataSizeError)
      end
    end
  end
end
