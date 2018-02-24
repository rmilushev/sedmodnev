class Article < ActiveRecord::Base
  include PgSearch
  has_many :images
  pg_search_scope :search_for,
                  against: [:title, :content],
                  order_within_rank: 'articles.updated_at DESC'

  validates :title, presence: true
  attachment :article_image
  acts_as_taggable

  scope :desc_order, -> { order('created_at DESC') }
  scope :recent, -> { where('created_at >= ?', 5.days.ago) }
  scope :importance, -> { order('importance ASC') }

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
