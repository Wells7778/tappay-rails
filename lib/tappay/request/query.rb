require 'tappay/request/base'
require 'tappay/response/query'

module TapPay
  module Request
    class Query < Base
      attr_reader :partner_key
      attr_reader :merchant_id
      attr_reader :order_number

      def initialize(*args)
        @partner_key = TapPay.config.partner_key
        @merchant_id = TapPay.config.merchant_id
        super
      end

      def to_hash
        hash = {
          partner_key: @partner_key,
          filters: {
            merchant_id: [@merchant_id],
            order_number: @order_number,
          }
        }
        hash
      end

      def merchant_id=(merchant_id)
        @merchant_id = merchant_id.to_s
      end

      def order_number=(order_number)
        @order_number = order_number.to_s
      end

      def request
        res = send_request('tpc/transaction/query', to_hash)
        Response::Query.new(JSON.parse(res.body), res)
      end
    end
  end
end
