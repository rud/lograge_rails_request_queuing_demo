class EchoController < ApplicationController

  def index
    queueing = RequestStore[:lograge_request_queueing]
    render json: {
      request_queued_raw: queueing.request_queued_raw,
      request_started_at: queueing.request_started_at,
      queued_ms: queueing.queued_ms,
    }
  end

end
