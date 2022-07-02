class CurrencyConverterController < ApplicationController
  def new
  end

  def convert
    if converted_amount = Currency::ConverterService.new(currency_params).call
      redirect_back(fallback_location: root_path, notice: successfull_notice(converted_amount))
    else
      alert = "Something went wrong, please try again."
      redirect_back(fallback_location: root_path, alert: alert)
    end
  end

  private

  # NOTE:
  # I'd have liked to add a proper Currency model to validate the input data with a @curency object if I had more time.
  def currency_params
    params.require(:currency).permit(:amount, :from_currency, :to_currency)
  end

  def successfull_notice(converted_amount)
    "#{currency_params[:amount]} #{currency_params[:from_currency]} = #{converted_amount} #{currency_params[:to_currency]}"
  end
end
