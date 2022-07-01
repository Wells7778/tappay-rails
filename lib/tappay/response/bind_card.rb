require 'tappay/response/pay'
require 'tappay/response/card_secret'

module TapPay
  module Response
    class BindCard < Pay
      attr_reader :card_secret

      def initialize(*args)
        super
        @card_secret = CardSecret.new(@card_secret) if @card_secret
      end
    end
  end
end
