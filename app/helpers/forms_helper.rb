module FormsHelper
  class KnockoutForm
    attr_accessor :custom_bindings
    def initialize(view_context)
      @view_context = view_context
    end
    def self.form_for(view_context, model, &block)
      a = KnockoutForm.new(view_context)
      a.form_for(model) do
        block.call a
      end
    end
    def input(field_name, options={})
      @view_context.render "shared/bootstrap/input", field_name: field_name, options: options
    end
    def submit(field_name, options={})
      @view_context.render "shared/bootstrap/submit", field_name: field_name, options: options
    end
    def fields_for(model=nil, &block)
      @view_context.content_tag :div, "data-bind" => "with: $root.section($data,'#{model}')".html_safe, &block
    end
    def form_for(model=nil, &block)
      @view_context.content_tag :div, "data-bind" => "with: $data.section(formRoot,'#{model}',#{model})".html_safe, &block
    end
  end
  def ko_form_for(model, &block)
    KnockoutForm.form_for(self, model, &block)
  end
end
