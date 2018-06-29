Rails.application.configure do
  config.lograge.enabled = true

  # Keep emitting the verbose logging for easier debug
  config.lograge.keep_original_rails_log = !Rails.env.production?

  config.lograge.custom_options = lambda do |event|
    custom_options = {}

    queued_ms = RequestStore[:lograge_request_queueing].queued_ms
    custom_options[:rq] = queued_ms.round(2) if queued_ms

    if event.payload[:exception_object]
      custom_options[:exception] = event.payload[:exception]
      custom_options[:backtrace] = Array(event.payload[:exception_object].backtrace)
    end

    custom_options
  end

  class ActionDispatch::DebugExceptions
    def log_error *_args
      # pass
    end
  end
end
