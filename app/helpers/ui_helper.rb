module UiHelper
  # --- Buttons ---
  def btn_primary(text, url = nil, **options)
    base_classes = "inline-block px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition"
    build_button(text, url, base_classes, options)
  end

  def btn_secondary(text, url = nil, **options)
    base_classes = "inline-block px-4 py-2 bg-gray-200 text-gray-800 rounded-lg hover:bg-gray-300 transition"
    build_button(text, url, base_classes, options)
  end

  def btn_danger(text, url = nil, **options)
    base_classes = "inline-block px-4 py-2 bg-red-600 text-white rounded-lg hover:bg-red-700 transition"
    build_button(text, url, base_classes, options)
  end

  # --- Karten / Container ---
  def card_box(options = {}, &block)
    classes = "bg-white border border-gray-200 rounded-xl shadow-md p-6 #{options.delete(:class)}"
    content_tag(:div, capture(&block), class: classes)
  end

  private

  def build_button(text, url, classes, options)
    if url.present?
      link_to text, url, { class: [ classes, options[:class] ].compact.join(" ") }
    else
      tag.button text, type: "button", class: [ classes, options[:class] ].compact.join(" ")
    end
  end
end
