require 'digest'

module Digest
  class VLH
    BASE = 16

    def self.hexdigest(str, len)
      self.new(len).hexdigest(str)
    end

    def self.digest(str, len)
      self.new(len).digest(str)
    end

    def initialize(len)
      @len = len
      @sha512 = Digest::SHA512.new
    end

    def update(str)
      @sha512.update(str)
      self
    end

    def reset
      @sha512.reset
      self
    end

    def digest(str = "")
      return "" if @len <= 0

      update(str)
      digest = (expand_digest.to_i(BASE) % div_num).to_s
      digest.rjust(@len, "0")
    end

    def hexdigest(str = "")
      return "" if @len <= 0

      update(str)
      digest = (expand_digest.to_i(BASE) % div_hex).to_s(BASE)
      digest.rjust(@len, "0")
    end

    alias_method :<<, :update

    private

    def expand_digest
      strlen = @sha512.digest_length * 2
      digest = @sha512.hexdigest
      repeat = (@len.to_f / strlen).ceil

      digest * repeat
    end

    def div_hex
      ("f" * @len).to_i(BASE)
    end

    def div_num
      10 ** @len
    end
  end
end
