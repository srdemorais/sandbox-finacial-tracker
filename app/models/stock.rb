class Stock < ApplicationRecord

  def self.new_lookup(ticker)
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
      endpoint: 'https://cloud.iexapis.com/v1'
    )

    new(ticker: ticker, name: client.company(ticker).company_name, last_price: client.quote(ticker)["latest_price"])
  end
end
