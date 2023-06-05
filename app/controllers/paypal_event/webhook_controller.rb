module PaypalEvent
  class WebhookController < ActionController::Base
    if Rails.application.config.action_controller.default_protect_from_forgery
      skip_before_action :verify_authenticity_token
    end

    def event
      PaypalEvent.instrument(verified_event)
      head :ok
    rescue PaypalEvent::SignatureVerificationError => e
      log_error(e)
      head :bad_request
    rescue PaypalEvent::ProcessError
      head :unprocessable_entity
    end

    private

    def verified_event
      payload = request.body.read
      secret = ""
      signature = ""
      PaypalEvent::Webhook.construct_event(payload, signature, secret.to_s)

      # skip verification for now

      #signature        = request.headers['Stripe-Signature']
      #possible_secrets = secrets(payload, signature)

      # possible_secrets.each_with_index do |secret, i|
      #   begin
      #     return 
      #   rescue => e
      #     raise if i == possible_secrets.length - 1
      #     next
      #   end
      # end
    end

    def secrets(payload, signature)
      return PaypalEvent.signing_secrets if PaypalEvent.signing_secret
      raise PaypalEvent::SignatureVerificationError.new(
              "Cannot verify signature without a `PaypalEvent.signing_secret`",
              signature, http_body: payload)
    end

    def log_error(e)
      logger.error e.message
      e.backtrace.each { |line| logger.error "  #{line}" }
    end
  end
end
