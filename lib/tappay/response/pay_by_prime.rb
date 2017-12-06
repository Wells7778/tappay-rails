require 'tappay/response/pay'
require 'tappay/response/card_secret'

module TapPay
  module Response
    class PayByPrime < Pay
      attr_reader :card_secret
      attr_reader :payment_url

      def initialize(*args)
        super
        @card_secret = CardSecret.new(@card_secret) if @card_secret
      end
    end
  end
end
