require 'tappay/request/pay'
require 'tappay/response/pay_by_card_token'

module TapPay
  module Request
    class PayByCardToken < Pay
      attr_reader :card_key
      attr_reader :card_token

      def initialize(*args)
        super
      end

      def to_hash
        hash = super
        hash[:card_key] = @card_key
        hash[:card_token] = @card_token
        hash
      end

      def request
        res = send_request('tpc/payment/pay-by-token', to_hash)
        Response::PayByCardToken.new(JSON.parse(res.body), res)
      end

      def card_key=(card_key)
        @card_key = card_key.to_s
      end

      def card_token=(card_token)
        @card_token = card_token.to_s
      end
    end
  end
end
