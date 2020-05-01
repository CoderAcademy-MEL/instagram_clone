# Cleanup
Post.delete_all
User.delete_all

u1 = User.create(email: "test-user1@test.com", password: 'password', username: 'User1')
u2 = User.create(email: "test-user2@test.com", password: 'password', username: 'User2')
u3 = User.create(email: "test-user3@test.com", password: 'password', username: 'User3')

LOREM = "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Architecto earum sapiente tempora officia porro? Labore qui illo excepturi recusandae distinctio quibusdam delectus veritatis totam.".freeze

5.times do |i|
  u1.posts.create(description: LOREM)
  u2.posts.create(description: LOREM)
  u3.posts.create(description: LOREM)
end