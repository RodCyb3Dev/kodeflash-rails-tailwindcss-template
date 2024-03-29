# config/initializers/lazyload.rb
Lazyload::Rails.configure do |config|
  # By default, a 1x1 grey gif is used as placeholder ("data:image/gif;base64,...").
  # This can be easily customized:
  config.placeholder = "/public/img/grey.gif"
  #config.placeholder = "https://res.cloudinary.com/dwougdhor/image/upload/c_limit,w_48/v1569695707/kodeflash-assets/images/img-lazyload.gif"

  # image_tag can return lazyload-friendly images by default,
  # no need to pass the { lazy: true } option
  #config.lazy_by_default = true
end