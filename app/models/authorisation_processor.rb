class AuthorisationProcessor


  def initialize(payment)
    super()
    @payment = payment
    self.state = payment.state
  end

  state_machine :state, :initial => :pending do
    event :authorise do
      transition :pending => :authorised, :unless => :need_second_authorisation?
      transition :pending => :authorised1
    end

    event :authorise2 do
      transition :authorised1 => :authorised
    end

    event :send_to_repair do
      transition :pending => :in_repair
    end

    event :repair do
      transition :in_repair => :pending
    end

    after_transition  :do => :save_current_state
  end

  def save_current_state
    if @payment.state != self.state
      @payment.state = self.state
      @payment.save
    end
  end

  def need_second_authorisation?
    @payment.amount > 100
  end

end