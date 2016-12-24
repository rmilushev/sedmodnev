require 'rubygems'
require 'active_record'
require 'uri'
namespace :mysql do
  desc "Import and map records from legacy mysql to postgres"
  task import: :environment do
    puts "This is MySQL import task :), ENV: #{Rails.env}"
    ActiveRecord::Base.establish_connection(
      adapter: 'mysql2',
      host: 'localhost',
      database: 'brep',
      user: 'root'
    )
    class WpPost < ActiveRecord::Base
    end
    post_types = WpPost.distinct.pluck(:post_type)
    post_types.each do |t|
      pst = WpPost.where(post_type: t).count
      puts "Count of posts of type #{t}: #{pst}"
    end

    @posts = WpPost.where(post_type: 'post').where.not(post_content: [nil, ''])
    @posts.find_each do |p|
      # puts "ID: #{p.id}, Title: #{p.post_title}, date: #{p.post_date}"
      ActiveRecord::Base.establish_connection(Rails.env)
      Article.find_or_create_by(leg_id: p.id) do |ar|
        puts "Post title: #{p.post_title}"
        puts "Instance: #{ar}"
        ar.created_at = p.post_date
        ar.title = p.post_title
        ar.content = p.post_content
        ar.leg_url = p.guid
        ActiveRecord::Base.establish_connection(
          adapter: 'mysql2',
          host: 'localhost',
          database: 'brep',
          user: 'root'
        )
        attach = WpPost.where(post_type: 'attachment').where(post_parent: p.id)
        upl = attach.first.try(:guid)
        ActiveRecord::Base.establish_connection(Rails.env)
        if upl
          begin
            ar.leg_attach = URI.parse(upl).path
          rescue
            ar.leg_attach = ''
          end
        end
      end
        ActiveRecord::Base.establish_connection(
          adapter: 'mysql2',
          host: 'localhost',
          database: 'brep',
          user: 'root'
        )
        puts "Added article with id: #{p.id}"
    end
    # @posts = WpPost.where(post_type: 'post').count
    # @all_posts = WpPost.all.count
    # puts "Post count: #{@posts}, all posts: #{@all_posts}"
  end
end
