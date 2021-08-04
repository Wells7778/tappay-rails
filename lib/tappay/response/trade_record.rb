require 'tappay/response/pay_by_prime'

module TapPay
  module Response
    class TradeRecord < PayByPrime
      attr_reader :record_status
      attr_reader :bank_transaction_start_millis
      attr_reader :bank_transaction_end_millis
      attr_reader :time

    end
  end
end
