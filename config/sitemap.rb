# config/sitemap.rb

require 'sitemap_generator'

SitemapGenerator::Sitemap.default_host = ENV['BACK_HOST'] # Remplace par l'URL de ton API

SitemapGenerator::Sitemap.create do
  # Ressources principales
  add color_products_path, changefreq: 'daily'
  add categories_path, changefreq: 'daily'
  add colors_path, changefreq: 'daily'
  add products_path, changefreq: 'daily'
  add comments_path, changefreq: 'daily'
  add users_path, changefreq: 'daily'

  # Routes imbriquées
  Product.find_each do |product|
    add product_path(product), changefreq: 'weekly'
    add product_comments_path(product), changefreq: 'weekly'
  end
end
