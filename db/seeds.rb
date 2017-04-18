# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |blog|
  Blog.create!(
    title: "My Blog Post #{blog}",
    body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed varius felis. Cras eu dictum mi, ut tincidunt augue. Curabitur blandit leo at risus faucibus, in efficitur augue cursus. Duis non purus ut lectus varius interdum. Donec magna mauris, suscipit ut sem a, viverra vulputate est. Vestibulum sodales metus non orci pulvinar fringilla. Nunc pretium hendrerit ante sed porttitor. Maecenas tempus nisl non pharetra pretium. Morbi dui enim, bibendum sit amet porttitor auctor, lobortis quis justo. Curabitur porta neque nec velit varius scelerisque."
  )
end

puts "#{Blog.count} blog posts created."

6.times do |challenge|
  Challenge.create!(
    name: "Challenge #{challenge}",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed varius felis. Cras eu dictum mi, ut tincidunt augue. Curabitur blandit leo at risus faucibus, in efficitur augue cursus. Duis non purus ut lectus varius interdum. Donec magna mauris, suscipit ut sem a, viverra vulputate est. Vestibulum sodales metus non orci pulvinar fringilla. Nunc pretium hendrerit ante sed porttitor. Maecenas tempus nisl non pharetra pretium. Morbi dui enim, bibendum sit amet porttitor auctor, lobortis quis justo. Curabitur porta neque nec velit varius scelerisque.",
    main_image: "http://placehold.it/600x400",
    thumb_image: "http://placehold.it/350x200",
    official_link: "http://example.com",
    register_link: "http://example.com"
  )
end

puts "#{Challenge.count} challenges created."

9.times do |project|
  Project.create!(
    title: "Project Title #{project}",
    subtitle: "My great service",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed varius felis. Cras eu dictum mi, ut tincidunt augue. Curabitur blandit leo at risus faucibus, in efficitur augue cursus. Duis non purus ut lectus varius interdum. Donec magna mauris, suscipit ut sem a, viverra vulputate est. Vestibulum sodales metus non orci pulvinar fringilla. Nunc pretium hendrerit ante sed porttitor. Maecenas tempus nisl non pharetra pretium. Morbi dui enim, bibendum sit amet porttitor auctor, lobortis quis justo. Curabitur porta neque nec velit varius scelerisque.",
    main_image: "http://placehold.it/600x400",
    thumb_image: "http://placehold.it/350x200",
    source_link: "http://github.com",
    view_link: "http://example.com"
  )
end

puts "#{Project.count} projects created."