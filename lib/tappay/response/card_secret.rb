require 'tappay/response/base'

module TapPay
  module Response
    class CardSecret < Base
      attr_reader :card_token
      attr_reader :card_key
    end
  end
end
