require 'tappay/response/base'
require 'tappay/response/card_info'

module TapPay
  module Response
    class MemberCard < Base
      attr_reader :status
      attr_reader :msg
      attr_reader :member_id
      attr_reader :cards

      def initialize(*args)
        super
        @cards = @cards.map { |card_info| CardInfo.new(card_info) } if @cards
      end
    end
  end
end
