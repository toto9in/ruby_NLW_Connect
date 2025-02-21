module Subscribers
  class SubscriberCreatorService
    def create(params)
      existing_subscriber_reponse = check_subscriber(params[:email], params[:event_id])
      return existing_subscriber_reponse if existing_subscriber_reponse

      existing_event_response = check_event(params[:event_id])
      return existing_event_response if existing_event_response

      subscriber = Subscriber.create(name: params[:name], email: params[:email], link: params[:link], event_id: params[:event_id])

      format_response(subscriber) if subscriber.valid?
    end



    private

    def check_subscriber(subscriber_email, event_id)
      result = Subscriber.find_by(email: subscriber_email, event_id: event_id)
      if result.present?
        return {
          body: {
            errors: [ "Subscriber already exists" ]
          },
          status_code: 409
        }
      end
      nil
    end

    def check_event(event_id)
      result = Event.find_by(id: event_id)
      if result.nil?
        return {
          body: {
            errors: [ "Event is not valid" ]
          },
          status_code: 422
        }
      end
      nil
    end

    def format_response(subscriber)
      {
        body: {
          data: {
            Type: "Subscriber",
            count: 1,
            attributes: {
              subscriber_name: subscriber.name,
              subscriber_email: subscriber.email,
              subscriber_link: subscriber.link,
              event_id: subscriber.event_id
            }
          }
        },
        status_code: 201
      }
    end
  end
end
