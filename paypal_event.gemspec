require_relative "lib/paypal_event/version"

Gem::Specification.new do |spec|
  spec.name        = "paypal_event"
  spec.version     = PaypalEvent::VERSION
  spec.authors     = ["Vlad Mikhailov"]
  spec.email       = ["just.raeno@icloud.com"]
  spec.homepage    = "http://combatreg.com"
  spec.summary     = "Handle PayPal webhooks"
  spec.description = "Based on StripeEvent gem."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mmareg/combatregcom"
  spec.metadata["changelog_uri"] = "https://github.com/mmareg/combatregcom"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  #spec.add_dependency "rails", "~> 6.1.5"
  spec.add_dependency "activesupport", ">= 6.1"
end
