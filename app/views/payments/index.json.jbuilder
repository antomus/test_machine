json.array!(@payments) do |payment|
  json.extract! payment, :id, :benficiary, :from, :amount, :state
  json.url payment_url(payment, format: :json)
end
