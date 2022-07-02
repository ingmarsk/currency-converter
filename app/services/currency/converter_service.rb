module Currency
  class ConverterService
    attr_reader :from_currency, :to_currency, :amount

    NET_HTTP_ERRORS = [
      Timeout::Error,
      Net::HTTPBadResponse,
      Net::HTTPHeaderSyntaxError,
      Net::ProtocolError
    ].freeze

    def initialize(params)
      @from_currency = params[:from_currency]
      @to_currency = params[:to_currency]
      @amount = params[:amount].to_d
    end

    def call
      return false unless from_currency.present? || to_currency.present? || amount.present?

      uri = URI(ExchangeRateApi.currency_conversion_url(from_currency))
      response = Net::HTTP.get(uri)
      response_obj = JSON.parse(response)
      
      if response_obj
        conversion_rate = response_obj['rates'][to_currency]
        amount * conversion_rate
      else
        false
      end
    rescue *NET_HTTP_ERRORS => exception
      Rails.logger.error("ERROR - Submitting currency to OpenExchangeRate Api: #{exception.backtrace}")
      false
    end
  end
end