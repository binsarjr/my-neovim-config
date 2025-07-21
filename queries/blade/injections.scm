;; extends

; AlpineJS attributes
(attribute
  (quoted_attribute_value
    (attribute_value) @injection.content)
  (#set! injection.language "javascript"))

; Blade PHP attributes
(attribute
  (quoted_attribute_value
    (attribute_value) @injection.content)
  (#set! injection.language "php"))

; Blade escaped JS attributes
(element
  (quoted_attribute_value
    (attribute_value) @injection.content)
  (#set! injection.language "javascript"))

; Blade comments
(comment) @injection.content
(#set! injection.language "comment")