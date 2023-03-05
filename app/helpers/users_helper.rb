module UsersHelper
  def attribute_placeholer(attribute)
    attribute.present? ? "Edit" : "Enter"
  end
end
