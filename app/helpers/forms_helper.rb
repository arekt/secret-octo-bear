module FormsHelper
  def ko_input(field_name, options={}, &block)
    knockout_options = block_given? ? KnockoutDSL.build(&block).custom_bindings : {}
    Rails.logger.debug "********************************
    #{knockout_options}"
    render "shared/bootstrap_input", field_name: field_name, options: options, knockout_options: knockout_options
    end
  class KnockoutDSL
    attr_accessor :custom_bindings
    def initialize
      @custom_bindings = {}
    end
    def self.build(&block)
      a = KnockoutDSL.new
      a.instance_eval &block
      a
    end
    def bindings_for(options={})
      options.each do |k,v|
        @custom_bindings[k] = v
      end
    end
  end
end
