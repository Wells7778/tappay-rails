require 'tappay/request/base'

module TapPay
  module Request
    class Pay < Base
      attr_reader :partner_key
      attr_reader :merchant_id

      attr_reader :amount
      attr_reader :currency
      attr_reader :bank_transaction_id
      attr_reader :order_number
      attr_reader :details

      attr_reader :instalment
      attr_reader :delay_capture_in_days

      attr_reader :fraud_id
      attr_reader :card_ccv

      def initialize(*args)
        @instalment = 0
        @delay_capture_in_days = 0
        @merchant_id = TapPay.config.merchant_id
        @partner_key = TapPay.config.partner_key
        @currency = TapPay.config.default_currency
        super
      end

      def to_hash
        hash = {
          partner_key: @partner_key,
          merchant_id: @merchant_id,
          amount: @amount,
          currency: @currency,
          details: @details,
          instalment: @instalment,
          delay_capture_in_days: @delay_capture_in_days
        }
        hash[:bank_transaction_id] = @bank_transaction_id if @bank_transaction_id
        hash[:order_number] = @order_number if @order_number
        hash[:fraud_id] = @fraud_id if @fraud_id
        hash[:card_ccv] = @card_ccv if @card_ccv
        hash
      end

      def partner_key=(partner_key)
        @partner_key = partner_key.to_s
      end

      def merchant_id=(merchant_id)
        @merchant_id = merchant_id.to_s
      end

      def amount=(amount)
        @amount = amount.to_i
      end

      def currency=(currency)
        @currency = currency.to_s
      end

      def bank_transaction_id=(bank_transaction_id)
        @bank_transaction_id = bank_transaction_id.to_s
      end

      def order_number=(order_number)
        @order_number = order_number.to_s
      end

      def details=(details)
        @details = details.to_s
      end

      def instalment=(instalment)
        @instalment = instalment.to_i
      end

      def delay_capture_in_days=(delay_capture_in_days)
        @delay_capture_in_days = delay_capture_in_days.to_i
      end

      def fraud_id=(fraud_id)
        @fraud_id = fraud_id.to_s
      end

      def card_ccv=(card_ccv)
        @card_ccv = card_ccv.to_s
      end

    end
  end
end
