class Article < ApplicationRecord
  has_many :images, dependent: :destroy

  validates :title, presence: true
  validates :title, length: {minimum: 5, maximum: 80}
  # attachment :article_image
  has_one_attached :main_image
  acts_as_taggable

  scope :desc_order, -> { order('created_at DESC') }
  scope :recent, -> { where('created_at >= ?', 5.days.ago) }
  scope :importance, -> { order('importance ASC') }
  scope :published, -> { where(published: nil) }

  def og_host
    ['https://www.', ENV['SITE_NAME']].join
  end

  def og_image
    # [og_host, Refile.attachment_url(self, :article_image, :fit, '600', '315')].join unless self.article_image.nil?
    nil
  end

  def og_fullpath
    [og_host, '/articles/', self.id].join
  end

  def og_content
    ActionController::Base.helpers.strip_tags(self.content).truncate_words(20, omission: '  ... ')
  end

  def author
    ENV['DEFAULT_AUTHOR']
  end

  def publisher
    ENV['PUBLISHER']
  end

  def has_notes?
    return true if notes && notes.size > 10
    false
  end
  # Note that ActiveRecord ARel from() doesn't appear to accommodate "?"
  # param placeholder, hence the need for manual parameter sanitization
  # def self.tsearch_query(search_terms, limit = query_limit)
  #   words = sanitize(search_terms.scan(/\w+/) * "|")
  #
  #   Article.from("articles, to_tsquery('pg_catalog.english', #{words}) as q").
  #     where("tsv @@ q").order("ts_rank_cd(tsv, q) DESC").limit(limit)
  # end
  #
  # # Selects search results with plain text title & body columns.
  # # Select columns are explicitly listed to avoid returning the long redundant tsv strings
  # def self.plain_tsearch(search_terms, limit = query_limit)
  #   select([:title, :content, :id]).tsearch_query(search_terms, limit)
  # end
  #
  # # Select search results with HTML highlighted title & body columns
  # def self.highlight_tsearch(search_terms, limit = query_limit)
  #   content = "ts_headline(content, q, 'StartSel=<em>, StopSel=</em>, HighlightAll=TRUE') as content"
  #   title = "ts_headline(title, q, 'StartSel=<em>, StopSel=</em>, HighlightAll=TRUE') as title"
  #   Article.select([content, title, :id]).tsearch_query(search_terms, limit)
  # end
  #
  # def self.query_limit; 25; end
end
