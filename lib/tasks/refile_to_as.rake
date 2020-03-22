require 'rubygems'
require 'active_record'
require 'uri'
require 'aws-sdk-s3'
namespace :refile do
  desc "Import and map records from legacy mysql to postgres"
  task to_active_storage: :environment do
    s3 = Aws::S3::Resource.new(region: 'eu-central-1',
                               access_key_id: ENV['ACCESS_KEY_ID_AMZ'],
                               secret_access_key: ENV['SECRET_ACCESS_KEY_AMZ'])
    puts "This is refile to active_storage export task :), ENV: #{Rails.env}"
    puts "Articles: #{Article.count}"
    s3_url = ['https://', ENV['S3_BUCKET_NAME'], '.s3.eu-central-1.amazonaws.com/store/'].join
    in_tmpdir do |tmpdir|
      Article.first(20).each do |art|
        puts "Article # #{art.id} : #{art.article_image_id}"
        if art.article_image_id
          begin
            s3_object = s3.bucket(ENV['S3_BUCKET_NAME']).object("store/#{art.article_image_id}")
            s3_object.get(response_target: File.join(tmpdir, "tmp_#{art.id}.jpg"))
            puts "Attaching: #{[s3_url, art.article_image_id].join} ..."
            art.main_image.attach(io: File.open(File.join(tmpdir, "tmp_#{art.id}.jpg")),
                                  filename: "main_img_#{art.id}.jpg")
          rescue
            puts "Key #{art.article_image_id} is not on S3"
          end
        end
      end
    end
  end
end

def in_tmpdir
  path = Rails.root.join('tmp', 'refile_old')
  FileUtils.mkdir_p path
  yield path
ensure
  FileUtils.rm_rf( path ) if File.exists?( path )
end
