require 'tappay/request/base'

module TapPay
  module Request
    class MemberCard < Base
      attr_reader :partner_key
      attr_reader :member_id

      def initialize(*args)
        @partner_key = TapPay.config.partner_key
        super
      end

      def to_hash
        {
          partner_key: @partner_key,
          member_id: @member_id
        }
      end

      def request
        res = send_request('tpc/direct-pay/get-member-card', to_hash)
        Response::MemberCard.new(JSON.parse(res.body), res)
      end

      def partner_key=(partner_key)
        @partner_key = partner_key.to_s
      end

      def member_id=(member_id)
        @member_id = member_id.to_s
      end
    end
  end
end
