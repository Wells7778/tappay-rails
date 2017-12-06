require 'tappay/response/base'
require 'tappay/response/card_info'

module TapPay
  module Response
    class Pay < Base
      attr_reader :status
      attr_reader :msg
      attr_reader :rec_trade_id
      attr_reader :bank_transaction_id
      attr_reader :auth_code
      attr_reader :amount
      attr_reader :card_info
      attr_reader :order_number
      attr_reader :acquirer
      attr_reader :transaction_time_millis
      attr_reader :bank_transaction_time
      attr_reader :bank_result_code
      attr_reader :bank_result_msg
      

      def initialize(*args)
        super
        @card_info = CardInfo.new(@card_info) if @card_info
      end
    end
  end
end
