require 'tappay/request/base'

module TapPay
  module Request
    class CardHolder < Base
      attr_reader :phone_number
      attr_reader :name
      attr_reader :email
      attr_reader :zip_code
      attr_reader :address
      attr_reader :national_id
      attr_reader :member_id

      def initialize(*args)
        @zip_code = ''
        @address = ''
        @national_id = ''
        super
      end

      def to_hash
        {
          phone_number: @phone_number,
          name: @name,
          email: @email,
          zip_code: @zip_code,
          address: @address,
          national_id: @national_id,
          member_id: @member_id,
        }.compact
      end

      def phone_number=(phone_number)
        @phone_number = phone_number.to_s
      end

      def name=(name)
        @name = name.to_s
      end

      def email=(email)
        @email = email.to_s
      end

      def zip_code=(zip_code)
        @zip_code = zip_code.to_s
      end

      def address=(address)
        @address = address.to_s
      end

      def national_id=(national_id)
        @national_id = national_id.to_s
      end

      def member_id=(member_id)
        @member_id = member_id.to_s
      end
    end
  end
end
