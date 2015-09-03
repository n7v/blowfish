require 'ostruct'
require 'yaml'

require 'blowfish/version'
require 'blowfish/block'
require 'blowfish/keys'
require 'blowfish/padding'

# This is an implementation of Blowfish -- symmetric block cipher designed in
# 1993 by Bruce Schneier.
#
# @example
#    key = Blowfish::Key.generate('123456')
#    str = "abc"
#    encrypted_str = Blowfish.encrypt(str, key)
#    decrypted_str = Blowfish.decrypt(encrypted_str, key)
module Blowfish

  class Error < RuntimeError; end
  class UnknownPaddingModeError < Error; end
  class InvalidDataSizeError < Error; end

  # Encrypt string of data.
  # @param [Hash] options the options of encryption
  # @option options [Symbol] :padding (:ansi_x923) the padding mode
  def self.encrypt(data, key, options = {})
    data = Padding.pad(data, options[:padding])
    res = ''
    0.step(data.size - 8, 8) do |i|
      res += Block.encrypt(data.byteslice(i..(i + 7)), key)
    end
    res
  end

  # Decrypt string of data.
  # @param [Hash] options options of decryption
  # @option options [Symbol] :padding (:ansi_x923) the padding mode, must be
  #   same as in encrypt
  def self.decrypt(data, key, options = {})
    res = ''
    0.step(data.size - 8, 8) do |i|
      res += Block.decrypt(data.byteslice(i..(i + 7)), key)
    end
    Padding.unpad(res, options[:padding])
  end
end
