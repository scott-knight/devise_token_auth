module DeviseTokenAuth::Concerns::ActiveRecordSupport
  extend ActiveSupport::Concern

  included do
    if Gem::Version.new(Rails::VERSION::STRING) >= '7.1'
      serialize :tokens, coder: DeviseTokenAuth::Concerns::TokensSerialization
    else
      serialize :tokens, DeviseTokenAuth::Concerns::TokensSerialization
    end
  end

  class_methods do
    # It's abstract replacement .find_by
    def dta_find_by(attrs = {})
      find_by(attrs)
    end
  end
end
