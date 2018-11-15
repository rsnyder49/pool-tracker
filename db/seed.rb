pool_list = {
  "Pool_1" => {
    :address => "1 Any Rd San Jose Ca 95123"
    },
  "Pool_2" => {
    :address => "2 Fake Way Campbell Ca 95000"
    },
  "Pool_3" => {
    :address => "3 Madeup Ave Mountain View Ca 94090"
  }
}

pool_list.each do |name, hash|
  pool = Pool.new 
  pool.name = name 
  hash.each do |address, value|
    pool[address] = value 
  end 
  pool.save 
end 

user_list = {
  "User_1" => {
    :username => "User1",
    :email => "fakeemail@mail.com",
    :password => "password"
  },
  "User_2" => {
    :username => "User2",
    :email => "madeupemail@mail.com",
    :password => "password"
  },
  "User_3" => {
    :username => "User3",
    :email => "yournamehere@mail.com",
    :password => "password"
  }
}

user_list.each do |name, hash|
  user = User.new 
  user.name = name 
  hash.each do |key, value|
    user[username] = value 
    user[email] = value 
    user[password] = value 
  end
  user.save
end 



