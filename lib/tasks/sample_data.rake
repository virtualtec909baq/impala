# namespace :db do

#   desc "Fill database with sample data"
#   task :populate => :environment do
#     50.times do |n|
#       origins  = Faker::Address.city
#       destination = Faker::Address.city
#       product = Faker::Commerce.product_name
#       kind = "tipo_1"
#       unit = Faker::Internet.slug
#       price = Faker::Commerce.price
#       volumen = Faker::Commerce.price
#       service_start_date = Faker::Time.between(1.weeks.ago, Time.now)
#       service_finish_date = Faker::Time.between(2.days.ago, Time.now)
#       offer_finish_date = Time.now + 3.weeks
#       offer_start_date = Time.now + 5.weeks
#       liquid_load = (1 == rand(2) ? true : false)
#       container = (1 == rand(2) ? true : false)
#       general_load = (1 == rand(2) ? true : false)
#       load_compensation = (1 == rand(2) ? true : false)
#       Offer.create(:origins => origins,
#                    :destination => destination,
#                    :product => product,
#                    :kind => kind,
#                    :unit => unit,
#                    :price => price,
#                    :volumen => volumen,
#                    :service_finish_date => service_finish_date,
#                    :service_start_date => service_start_date,
#                    :offer_start_date => offer_start_date,
#                    :offer_finish_date => offer_finish_date,
#                    :liquid_load => liquid_load,
#                    :container => container,
#                    :general_load => general_load,
#                    :load_compensation => load_compensation
#         )
#     end
#     50.times do |n|
#       ref  = Faker::Code.isbn
#       name = Faker::Commerce.product_name
#       details = Faker::Lorem.characters(10)
#       Product.create(:ref => ref,
#                    :name => name,
#                    :details => details,
#         )
#     end
#     50.times do |n|
#       ref  = Faker::Code.isbn
#       name = Faker::Commerce.product_name
#       location = Faker::Address.state
#       Location.create(:ref => ref,
#                    :name => name,
#                    :location => location,
#         )
#     50.times do |n|
#       unit  = Faker::Lorem.word
#       Measure.create(:unit => unit)
#     end
#   end
# end