1:

test> use 20P-0750
switched to db 20P-0750


2:


20P-0750> db.createCollection("Users")
{ ok: 1 }
20P-0750> show collections;
Users

3:

20P-0750> db.Users.insert({username:"Ali",password:"def123",email:"ali123@yahoo.com",DOB:"1996-03-04",Address:"Peshawar",Contact:"+923332233322"})
DeprecationWarning: Collection.insert() is deprecated. Use insertOne, insertMany, or bulkWrite.
{
  acknowledged: true,
  insertedIds: { '0': ObjectId("63639eedeec70588bd081ae5") }
}
20P-0750> db.Users.find()
[
  {
    _id: ObjectId("63639eedeec70588bd081ae5"),
    username: 'Ali',
    password: 'def123',
    email: 'ali123@yahoo.com',
    DOB: '1996-03-04',
    Address: 'Peshawar',
    Contact: '+923332233322'
  }
]

20P-0750> db.Users.insert({username:"Haroon",password:"fast123",email:"haroon123@gmail.com",Address:"Karachi"})
{
  acknowledged: true,
  insertedIds: { '0': ObjectId("63639fffeec70588bd081ae6") }
}
20P-0750> db.Users.find()
[
  {
    _id: ObjectId("63639eedeec70588bd081ae5"),
    username: 'Ali',
    password: 'def123',
    email: 'ali123@yahoo.com',
    DOB: '1996-03-04',
    Address: 'Peshawar',
    Contact: '+923332233322'
  },
  {
    _id: ObjectId("63639fffeec70588bd081ae6"),
    username: 'Haroon',
    password: 'fast123',
    email: 'haroon123@gmail.com',
    Address: 'Karachi'
  }
]
20P-0750> db.Users.insert({username:"Zain",password:"abc123",email:"zain123@gmail.com",DOB:"1997-02-13",Address:"Islamabad"})
{
  acknowledged: true,
  insertedIds: { '0': ObjectId("6363a07ceec70588bd081ae7") }
}
20P-0750> db.Users.find()
[
  {
    _id: ObjectId("63639eedeec70588bd081ae5"),
    username: 'Ali',
    password: 'def123',
    email: 'ali123@yahoo.com',
    DOB: '1996-03-04',
    Address: 'Peshawar',
    Contact: '+923332233322'
  },
  {
    _id: ObjectId("63639fffeec70588bd081ae6"),
    username: 'Haroon',
    password: 'fast123',
    email: 'haroon123@gmail.com',
    Address: 'Karachi'
  },
  {
    _id: ObjectId("6363a07ceec70588bd081ae7"),
    username: 'Zain',
    password: 'abc123',
    email: 'zain123@gmail.com',
    DOB: '1997-02-13',
    Address: 'Islamabad'
  }
]
20P-0750> db.Users.insert({username:"Atif",password:"QWe123",email:"atif@gmail.com",Address:"Islamabad",Contact:"+923139834276"})
{
  acknowledged: true,
  insertedIds: { '0': ObjectId("6363a0f6eec70588bd081ae8") }
}
20P-0750> db.Users.find()
[
  {
    _id: ObjectId("63639eedeec70588bd081ae5"),
    username: 'Ali',
    password: 'def123',
    email: 'ali123@yahoo.com',
    DOB: '1996-03-04',
    Address: 'Peshawar',
    Contact: '+923332233322'
  },
  {
    _id: ObjectId("63639fffeec70588bd081ae6"),
    username: 'Haroon',
    password: 'fast123',
    email: 'haroon123@gmail.com',
    Address: 'Karachi'
  },
  {
    _id: ObjectId("6363a07ceec70588bd081ae7"),
    username: 'Zain',
    password: 'abc123',
    email: 'zain123@gmail.com',
    DOB: '1997-02-13',
    Address: 'Islamabad'
  },
  {
    _id: ObjectId("6363a0f6eec70588bd081ae8"),
    username: 'Atif',
    password: 'QWe123',
    email: 'atif@gmail.com',
    Address: 'Islamabad',
    Contact: '+923139834276'
  }
]

20P-0750> db.Users.insert({username:"Noman",password:"def456",email:"nomi3@yahoo.com",DOB:"1996-03-04",Address:"Peshawar",Contact:"+923349056432"})
{
  acknowledged: true,
  insertedIds: { '0': ObjectId("6363a177eec70588bd081aea") }
}
20P-0750> db.Users.find()
[
  {
    _id: ObjectId("63639eedeec70588bd081ae5"),
    username: 'Ali',
    password: 'def123',
    email: 'ali123@yahoo.com',
    DOB: '1996-03-04',
    Address: 'Peshawar',
    Contact: '+923332233322'
  },
  {
    _id: ObjectId("63639fffeec70588bd081ae6"),
    username: 'Haroon',
    password: 'fast123',
    email: 'haroon123@gmail.com',
    Address: 'Karachi'
  },
  {
    _id: ObjectId("6363a07ceec70588bd081ae7"),
    username: 'Zain',
    password: 'abc123',
    email: 'zain123@gmail.com',
    DOB: '1997-02-13',
    Address: 'Islamabad'
  },
  {
    _id: ObjectId("6363a0f6eec70588bd081ae8"),
    username: 'Atif',
    password: 'QWe123',
    email: 'atif@gmail.com',
    Address: 'Islamabad',
    Contact: '+923139834276'
  },
  {
    _id: ObjectId("6363a177eec70588bd081aea"),
    username: 'Noman',
    password: 'def456',
    email: 'nomi3@yahoo.com',
    DOB: '1996-03-04',
    Address: 'Peshawar',
    Contact: '+923349056432'
  }
]
20P-0750> db.Users.find({ Address:"Islamabad"})
[
  {
    _id: ObjectId("6363a07ceec70588bd081ae7"),
    username: 'Zain',
    password: 'abc123',
    email: 'zain123@gmail.com',
    DOB: '1997-02-13',
    Address: 'Islamabad'
  },
  {
    _id: ObjectId("6363a0f6eec70588bd081ae8"),
    username: 'Atif',
    password: 'QWe123',
    email: 'atif@gmail.com',
    Address: 'Islamabad',
    Contact: '+923139834276'
  }
]
20P-0750> db.Users.find({ Address:{ $in: ["Peshawar","Karachi"] }})
[
  {
    _id: ObjectId("63639eedeec70588bd081ae5"),
    username: 'Ali',
    password: 'def123',
    email: 'ali123@yahoo.com',
    DOB: '1996-03-04',
    Address: 'Peshawar',
    Contact: '+923332233322'
  },
  {
    _id: ObjectId("63639fffeec70588bd081ae6"),
    username: 'Haroon',
    password: 'fast123',
    email: 'haroon123@gmail.com',
    Address: 'Karachi'
  },
  {
    _id: ObjectId("6363a177eec70588bd081aea"),
    username: 'Noman',
    password: 'def456',
    email: 'nomi3@yahoo.com',
    DOB: '1996-03-04',
    Address: 'Peshawar',
    Contact: '+923349056432'
  }
]




