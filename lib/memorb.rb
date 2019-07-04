require_relative 'memorb/core'
require_relative 'memorb/class_methods'
require_relative 'memorb/instance_methods'

module Memorb

  include InstanceMethods

  class << self

    def [](*methods)
      self
    end

  end
end
