module FormsHelper
  def bootstrap_input(field_name, &block)
    render "shared/bootstrap_input", field_name: field_name, block: block
  end
end
