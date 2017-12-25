require 'tappay/response/base'
require 'tappay/response/card_info'

module TapPay
  module Response
    class Refund < Base
      attr_reader :status
      attr_reader :msg
      attr_reader :refund_amount
      attr_reader :is_captured
      attr_reader :bank_result_code
      attr_reader :bank_result_msg
      
      def initialize(*args)
        super
      end
    end
  end
end
