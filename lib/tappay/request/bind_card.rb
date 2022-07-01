require 'tappay/request/base'
require 'tappay/request/card_holder'

module TapPay
  module Request
    class BindCard < Base
      attr_reader :partner_key,
                  :merchant_id,
                  :currency,
                  :cardholder


      def initialize(*args)
        @merchant_id = TapPay.config.merchant_id
        @partner_key = TapPay.config.partner_key
        @currency = TapPay.config.default_currency
        @card_holder = TapPay::Request::CardHolder.new
        super
      end

      def to_hash
        {
          prime: @prime,
          partner_key: @partner_key,
          merchant_id: @merchant_id,
          currency: @currency,
          cardholder: @card_holder.to_hash
        }
      end

      def request
        res = send_request('tpc/card/bind', to_hash)
        Response::BindCard.new(JSON.parse(res.body), res)
      end

      def prime=(prime)
        @prime = prime.to_s
      end

      def partner_key=(partner_key)
        @partner_key = partner_key.to_s
      end

      def merchant_id=(merchant_id)
        @merchant_id = merchant_id.to_s
      end

      def currency=(currency)
        @currency = currency.to_s
      end

      def phone=(phone_number)
        @card_holder.phone_number = phone_number
      end

      def name=(name)
        @card_holder.name = name
      end

      def email=(email)
        @card_holder.email = email
      end

      def member_id=(member_id)
        @card_holder.member_id = member_id
      end
    end
  end
end
