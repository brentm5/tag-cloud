Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer if Rails.env.development?
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end

OmniAuth.config.on_failure = Proc.new { |env| 
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
