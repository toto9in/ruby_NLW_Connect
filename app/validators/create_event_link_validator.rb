class CreateEventLinkValidator < Dry::Validation::Contract
  params do
    required(:event_id).filled(:integer)
    required(:subscriber_id).filled(:integer)
  end
end
