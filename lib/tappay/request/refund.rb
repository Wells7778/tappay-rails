require 'tappay/request/base'

module TapPay
  module Request
    class Refund < Base
      attr_reader :partner_key
      attr_reader :rec_trade_id
      attr_reader :amount

      def initialize(*args)
        @partner_key = TapPay.config.partner_key
        @amount = 0
        super
      end

      def to_hash
        hash = {
          partner_key: @partner_key,
          rec_trade_id: @rec_trade_id,
          amount: @amount
        }
        hash
      end

      def partner_key=(partner_key)
        @partner_key = partner_key.to_s
      end

      def rec_trade_id=(rec_trade_id)
        @rec_trade_id = rec_trade_id.to_s
      end

      def amount=(amount)
        @amount = amount.to_i
      end

      def request
        res = send_request('tpc/transaction/refund', to_hash)
        Response::Refund.new(JSON.parse(res.body), res)
      end
    end
  end
end
