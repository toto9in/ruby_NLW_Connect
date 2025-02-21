class SubscribersController < ApplicationController
  include HttpParamsValidation

  def create
    params = validate_params!(CreateSubscriberValidator.new, create_subscriber_params)

    response = Subscribers::SubscriberCreatorService.new.create(params)

    render json: response[:body], status: response[:status_code]
  end


  private

  def create_subscriber_params
    params.expect(data: [ :name, :email, :link, :event_id ]).to_h
  end
end
