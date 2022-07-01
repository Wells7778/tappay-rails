require 'tappay/response/base'

module TapPay
  module Response
    class CardInfo < Base
      class EnumNumber
        def initialize(value)
          @value = value.to_i
        end

        def ==(other)
          @value == other
        end

        def method_missing(name, *args, &blk)
          @value.respond_to?(name) ? @value.try(name, *args, &blk) : super
        end

        def respond_to_missing?(name)
          @value.respond_to?(name)
        end

        def value
          @value
        end
      end

      class Funding < EnumNumber
        def to_s
          case @value
          when 0
            'Credit Card'
          when 1
            'Debit Card'
          when 2
            'Prepaid Card'
          else
            'Unknown'
          end
        end

        def to_sym
          case @value
          when 0
            :credit_card
          when 1
            :debit_card
          when 2
            :prepaid_card
          else
            :unknown
          end
        end
      end

      class Type < EnumNumber
        def to_s
          case @value
          when 1
            'VISA'
          when 2
            'MasterCard'
          when 3
            'JCB'
          when 4
            'Union Pay'
          when 5
            'AMEX'
          else
            'Unknown'
          end
        end

        def to_sym
          case @value
          when 1
            :visa
          when 2
            :master_card
          when 3
            :jcb
          when 4
            :union_pay
          when 5
            :amex
          else
            :unknown
          end
        end
      end

      attr_reader :bin_code
      attr_reader :last_four
      attr_reader :issuer
      attr_reader :issuer_zh_tw
      attr_reader :funding
      attr_reader :type
      attr_reader :level
      attr_reader :country
      attr_reader :country_code
      attr_reader :expiry_date

      def initialize(*args)
        super
        @funding = Funding.new(@funding) if @funding
        @type = Type.new(@type) if @type
      end

      def to_hash
        {
          bin_code: bin_code,
          last_four: last_four,
          issuer: issuer,
          issuer_zh_tw: issuer_zh_tw,
          funding: funding,
          type: type,
          level: level,
          country: country,
          country_code: country_code,
          expiry_date: expiry_date,
        }
      end
    end
  end
end
