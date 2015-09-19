class Payment < ActiveRecord::Base
  has_many :payment_events

  after_save do |payment|
    payment.payment_events.build(action: payment.state).save
  end
end
