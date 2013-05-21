# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

Fog.mock!
Fog::Mock.delay=0


RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  config.before(:each) do
    @conn = Fog::Compute::AWS.new(aws_access_key_id: "t", aws_secret_access_key: "t")
    @staging = @conn.servers.create({
        "tags" => {
                 "Name" => "sk-stage-1",
                 "Role" => "web nginx backoffice marketing partners",
          "Environment" => "staging"
        }
      })
    @production_web_1 = @conn.servers.create({
        "tags" => {
          "Name"        => "sk-backoffice-production-web-1",
          "Role"        => "web backoffice",
          "Environment" => "production"
        }
      })
    @production_worker_1 = @conn.servers.create({
        "tags" => {
          "Name"        => "sk-backoffice-production-worker-1",
          "Role"        => "worker backoffice",
          "Environment" => "production"
        }
      })
    @production_web_stopped_1 = @conn.servers.create({
        "tags" => {
          "Name"        => "sk-backoffice-production-web-2",
          "Role"        => "web backoffice",
          "Environment" => "production"
        }
      })
    @production_web_stopped_1.stop

    @production_web_marketing_1 = @conn.servers.create({
        "tags" => {
          "Name"        => "sk-marketing-production-web-1",
          "Role"        => "web marketing",
          "Environment" => "production"
        }
      })
    @production_no_tags_1 = @conn.servers.create()

    @all_ec2_instances = [@staging, @production_web_1, @production_worker_1, @production_web_stopped_1, @production_web_marketing_1, @production_no_tags_1]
  end
  config.after(:each) do
    @all_ec2_instances.each(&:destroy)
  end
end
