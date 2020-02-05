class HomeController < ApplicationController
  def index
    @page_title = t('home_page', :default => 'Etusivu')
  end

  def terms
    @page_title = t('terms_link', :default => 'Ehdot')
  end

  def privacy
    @page_title = t('privacy_link', :default => 'Yksityisyys')
  end
end