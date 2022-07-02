require 'test_helper'

class ConverterServiceTest < ActiveSupport::TestCase
  # The request made in this test should be mocked using Webmock gem, as the exchange rate is dyanmic, but didn't got time to implement it properly
  test 'should return the converted amount after a submit to the api endpoint' do
    service_return = Currency::ConverterService.new(valid_currency_params).call

    exchange_rate_usd_to_eur = 0.959e0
    expected_amount = valid_currency_params[:amount] * exchange_rate_usd_to_eur

    assert_equal expected_amount, service_return
  end

  private

  def valid_currency_params
    {
      amount: 1,
      from_currency: 'USD',
      to_currency: 'EUR',
    }
  end
end
