class CreateSubscriberValidator < Dry::Validation::Contract
  params do
    required(:name).filled(:string)
    required(:email).filled(:string)
    optional(:link).filled(:string)
    required(:event_id).filled(:integer)
  end
end
