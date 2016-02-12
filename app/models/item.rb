class Item < ActiveRecord::Base
  serialize :raw_info , Hash

  has_many :ownerships  , foreign_key: "item_id" , dependent: :destroy
  has_many :users , through: :ownerships
  # プロパティの設定
  attr_accessor :title, :image_url, :url, :asin

  def initialize(title, image_url, url, asin)
    @title = title
    @image_url = image_url
    @url = url
    @asin = asin
  end
end
