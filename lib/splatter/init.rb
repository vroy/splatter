module Splatter
  module Init

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def splat(*args)
        if args.empty?
          @splatter_args
        else
          @splatter_args = args
        end
      end
    end

    def initialize(*args)
      self.class.splat.each do |name|
        instance_variable_set("@#{name}", args.shift)
      end
    end

  end
end
