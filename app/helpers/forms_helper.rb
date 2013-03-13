module FormsHelper
  def bootstrap_input(field_name, options={}, &block)
    render "shared/bootstrap_input", field_name: field_name, options: options, block: block
  end
end
