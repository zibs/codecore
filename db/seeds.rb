# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

["GitHub", "LinkedIn", "Twitter"].each do |link|
  Link.create(title: link)
end

links_array = Link.all

30.times do
  u = User.create first_name:   Faker::Name.first_name,
                  last_name:    Faker::Name.last_name,
                  email:        Faker::Internet.email,
                  description:  Faker::Lorem.sentences(4),
                  password:     Faker::Internet.password

  3.times do
    skill = u.skills.create(title: Faker::Lorem.word, level: Faker::Number.between(1, 10))

    project = u.projects.create(title: Faker::Lorem.word, description:  Faker::Lorem.sentences(2), url: Faker::Internet.url, github: Faker::Internet.url)

    education = u.educations.create(start_date: Faker::Date.between(4.years.ago, 3.years.ago), end_date: Faker::Date.between(2.years.ago, 1.years.ago), institution: Faker::Company.name, program: Faker::Lorem.words(4), url: Faker::Internet.url, description: Faker::Lorem.sentences(2) )

    experience = u.experiences.create(company: Faker::Company.name, title: Faker::Company.profession, description: Faker::Lorem.sentences(2), url: Faker::Internet.url, start_date: Faker::Date.between(4.years.ago, 3.years.ago), end_date: Faker::Date.between(2.years.ago, 1.years.ago))

  end

  linking = u.linkings.create(link: links_array[0], url: Faker::Internet.url)
  linking = u.linkings.create(link: links_array[1], url: Faker::Internet.url)
  linking = u.linkings.create(link: links_array[2], url: Faker::Internet.url)

end
