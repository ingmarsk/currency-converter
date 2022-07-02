class ExchangeRateApi
  API_ENDPOINT = 'https://open.er-api.com/v6/latest/'.freeze

  def self.currency_conversion_url(base_currency)
    API_ENDPOINT + base_currency
  end
end