require 'tappay/response/base'
require 'tappay/response/trade_record'

module TapPay
  module Response
    class Query < Base
      attr_reader :status
      attr_reader :msg
      attr_reader :page
      attr_reader :total_page_count
      attr_reader :number_of_transactions
      attr_reader :trade_records

      def records
        trade_records.map do |record|
          TradeRecord.new record
        end
      end

    end
  end
end
