require 'blowfish'

module Blowfish
  module Padding
    MODES = [:none, :spaces, :ansi_x923]

    def self.pad(s, mode = nil)
      mode ||= :ansi_x923
      unless MODES.include?(mode)
        fail UnknownPaddingModeError, 'Invalid padding mode'
      end

      l = 8 - (s.bytes.count % 8)
      case mode
      when :none
        if s.bytes.count % 8 != 0
          fail InvalidDataSizeError, 'Data size should be divisible by 8'
        end
      when :ansi_x923
        s += 0.chr * (l - 1) + l.chr
      when :spaces
        s += ' ' * l
      end
      s
    end

    def self.unpad(s, mode = nil)
      mode ||= :ansi_x923
      sz = s.bytes.count

      unless MODES.include?(mode)
        fail UnknownPaddingModeError, 'Invalid padding mode'
      end

      fail InvalidDataSizeError, 'Invalid cipher text size' if sz % 8 != 0

      case mode
      when :ansi_x923
        last = s[-1].bytes.to_a[-1]
        s = s.byteslice(0, sz - last)
      when :spaces
        s = s.byteslice(0, sz - 8) + s.byteslice(sz - 8, 8).rstrip
      end
      s
    end
  end
end
