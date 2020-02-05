module ApplicationHelper
  include Pagy::Frontend

  include MetaHelper
  include UsersHelper

  # Just this works
  def activelink_class(name)
    controller_name.eql?(name) || current_page?(name) ? 'activelink' : ''
  end

  #Footer Copyright
  def copyright_generator
    RodcodeViewTool::Renderer.copyright 'Website-Name | All rights reserved'
  end
end
