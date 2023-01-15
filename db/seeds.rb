# frozen_string_literal: true
require 'faker'

Book.create!(
  title: "Shadow of the Wind",
  author: "Carlos Ruiz Zafon",
  genre: "Fiction",
  description: "Barcelona, 1945: A city slowly heals from its war wounds, and Daniel, an antiquarian book dealer's son who mourns the loss of his mother, finds solace in a mysterious book entitled The Shadow of the Wind, by one Julian Carax. But when he sets out to find the author's other works, he makes a shocking discovery: someone has been systematically destroying every copy of every book Carax has written. In fact, Daniel may have the last of Carax's books in existence. Soon Daniel's seemingly innocent quest opens a door into one of Barcelona's darkest secrets--an epic story of murder, madness, and doomed love.
  
  The New York Times bestseller

  “The Shadow of the Wind is ultimately a love letter to literature, intended for readers as passionate about storytelling as its young hero.” —Entertainment Weekly (Editor's Choice)
  
  “One gorgeous read.” —Stephen King"
)

# generate 30 books
30.times do
  Book.create!(
    title: Faker::Book.title,
    author: Faker::Book.author,
    genre: Faker::Book.genre,
    description: Faker::Lorem.paragraph(sentence_count: 5)
  )
end

