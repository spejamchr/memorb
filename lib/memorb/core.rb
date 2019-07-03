require 'set'

module Memorb
  module Core

    IGNORED_INSTANCE_METHODS = Set[:initialize].freeze

    class << self

      def fresh_cache
        Hash.new
      end

      def generate_mixin(methods)
        Module.new do
          def self.included(base)
            base.extend(ClassMethods)
            base.send(:prepend, InstanceMethods)
            @name = "Memorb(#{ base.name })"
          end

          def self.name
            defined?(@name) ? @name : 'Memorb()'
          end

          def self.inspect
            name
          end

          def self.address
            (object_id << 1).to_s(16)
          end
        end
      end

    end

  end
end
