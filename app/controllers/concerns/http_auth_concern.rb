module HttpAuthConcern
  extend ActiveSupport::Concern

  included do
    before_action :basic_auth
  end

  def basic_auth
    return true if Rails.env.test?
    authenticate_or_request_with_http_basic do |username, password|
      username == 'cars' && password == 'thrive'
    end
  end
end
