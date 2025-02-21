module EventLink
  class EventsLinkCreatorService
    def create(params)
      event_id = params[:event_id]
      subscriber_id = params[:subscriber_id]

      subscriber_response = check_subscriber(subscriber_id)
      return subscriber_response if subscriber_response

      existing_event_response = check_event(event_id)
      return existing_event_response if existing_event_response

      existing_event_link_response = check_event_link(event_id, subscriber_id)
      return existing_event_link_response if existing_event_link_response

      link = Array.new(7) { rand(0..9) }.join
      formatted_link = "evento-#{event_id}-#{subscriber_id}-#{link}"

      events_link = EventsLink.create(event_id: event_id, subscriber_id: subscriber_id, link: formatted_link)
      puts events_link.errors.full_messages

      format_response(events_link) if events_link.valid?
    end


    private

    def check_event_link(event_id, subscriber_id)
      result = EventsLink.find_by(event_id: event_id, subscriber_id: subscriber_id)
      if result.present?
        return {
          body: {
            errors: [ "Event link already exists" ]
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

    def check_subscriber(subscriber_id)
      result = Subscriber.find_by(id: subscriber_id)
      if result.nil?
        return {
          body: {
            errors: [ "Subscriber is not valid" ]
          },
          status_code: 422
        }
      end
      nil
    end

    def format_response(event_link)
      {
        body: {
          data: {
            Type: "EventLink",
            count: 1,
            attributes: {
              event_id: event_link.event_id,
              subscriber_id: event_link.subscriber_id
            }
          }
        },
        status_code: 201
      }
    end
  end
end
