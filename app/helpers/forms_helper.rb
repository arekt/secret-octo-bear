module FormsHelper
  class KnockoutForm
    attr_accessor :custom_bindings
    def initialize(view_context)
      @view_context = view_context
    end
    def self.form(view_context, &block)
      a = KnockoutForm.new(view_context)
      a.instance_eval &block
      a
    end
    def input(field_name, options={})
      @view_context.render "shared/bootstrap_input", field_name: field_name, options: options
    end
    def fields_for(model, &block)
      @view_context.content_tag :div, "data-bind" => "with: #{model}", &block
    end
  end
  def ko_form(*args, &block)
    KnockoutForm.form(self, &block)
  end
end
