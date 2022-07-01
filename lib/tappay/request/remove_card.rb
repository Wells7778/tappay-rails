require 'tappay/request/base'

module TapPay
  module Request
    class RemoveCard < Base
      attr_reader :partner_key
      attr_reader :card_key
      attr_reader :card_token

      def initialize(*args)
        @partner_key = TapPay.config.partner_key
        super
      end

      def to_hash
        {
          partner_key: @partner_key,
          card_key: @card_key,
          card_token: @card_token
        }
      end

      def card_key=(card_key)
        @card_key = card_key.to_s
      end

      def card_token=(card_token)
        @card_token = card_token.to_s
      end

      def request
        res = send_request('tpc/card/remove', to_hash)
        Response::Pay.new(JSON.parse(res.body), res)
      end
    end
  end
end
