require_relative 'lib/paypal_event/version'

Gem::Specification.new do |spec|
  spec.name        = 'paypal_event'
  spec.version     = PaypalEvent::VERSION
  spec.authors     = ['Vlad Mikhailov']
  spec.email       = ['just.raeno@icloud.com']
  spec.homepage    = 'https://github.com/raeno/paypal-event'
  spec.summary     = 'Handle PayPal webhooks'
  spec.description = 'Based on StripeEvent gem.'
  spec.license     = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/raeno/paypal-event'
  spec.metadata['changelog_uri'] = 'https://github.com/raeno/paypal-event'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'activesupport', '>= 6.1'
end
