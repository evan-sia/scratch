require 'csv'
require "zlib"

def print_stats(file_name, zipped)
  original_size = File.size(file_name)
  zipped_size = File.size(zipped)
  percentage_difference = ((original_size - zipped_size).to_f/original_size)*100
  puts "#{file_name}: #{original_size}"
  puts "#{zipped}: #{zipped_size}"
  puts "difference - #{'%.2f' % percentage_difference}%"
end

def compress_file(file_name)
  zipped = "#{file_name}.gz"

  Zlib::GzipWriter.open(zipped) do |gz|
    gz.mtime = File.mtime(file_name)
    gz.orig_name = file_name
    gz.write IO.binread(file_name)
  end

  puts zipped
  # print_stats(file_name, zipped)
end

rows = []
cnt = 0
batch = 0
CSV.foreach("nudges.csv", headers: true) do |row|
    # if cnt == 0
    #   cnt += 1
    #   next
    # end

    # puts "0,#{row['USER_DRN_ID']},#{row['ADDRESS_DRN_ID']},col4,col5,col6,col7,#{row['TYPE_OF_NUDGE']}"
  
    rows << "#{row['user_id']},#{row['user_drn_id']},#{row['address_drn_id']},col4,col5,col6,col7,#{row['type_of_nudge']}"
    cnt += 1

    if cnt % 5000 == 0
      file_name = "tmp/nudges_#{batch}.csv"

      File.open(file_name, 'w') do |file| 
        rows.each do |r|
          file.write("#{r}\n")
        end
      end

      # CSV.open(file_name, "wb") do |csv|
      #   rows.each do |r|
      #     csv << r
      #   end
      # end

      compress_file(file_name)
      File.delete(file_name)

      batch += 1
      rows = []

    end
end

if rows.length != 0
  file_name = "tmp/nudges_#{batch}.txt"

  File.open(file_name, 'w') do |file| 
    rows.each do |r|
      file.write("#{r}\n")
    end
  end

  compress_file(file_name)
  File.delete(file_name)

  batch += 1
  rows = []
end

puts cnt