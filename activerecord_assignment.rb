### Active Record Query Interface Assignment

### Provide one or more Active Record queries that retrieve the requested data
### below each of the following questions:


# 1a) Find the genre with the name "Hip Hop/Rap".
Genre.where(name: "Hip Hop/Rap")
[0] #<Genre:0x007fc790e602f8> {
               :id => 17,
             :name => "Hip Hop/Rap",
       :created_at => Sun, 20 Jan 2013 02:04:31 UTC +00:00,
       :updated_at => Wed, 29 Jan 2014 22:14:08 UTC +00:00
   }

# 1b) Count how many tracks belong to the "Hip Hop/Rap" genre
Track.where(genre_id: 17).count
(3.7ms)  SELECT COUNT(*) FROM "tracks" WHERE "tracks"."genre_id" = $1  [["genre_id", 17]]
35

# 2) Find the total amount of time required to listen to all the tracks in the database.
Track.sum("milliseconds")
(30.7ms)  SELECT SUM("tracks"."milliseconds") FROM "tracks"
1378575827

# 3a) Find the highest price of any track that has the media type "MPEG audio file".
MediaType.where(name: "MPEG audio file")
Track.where(media_type_id: 1).order(unit_price: :asc)


# 3b) Find the name of the most expensive track that has the media type "MPEG audio file".
Track.where(media_type_id: 1).order(unit_price: :asc).select("name, unit_price").limit(1)
[
    [0] #<Track:0x007fc793a98cd0> {
                :id => nil,
              :name => "Put The Finger On You",
        :unit_price => 0.99
    }
]
# 4) Find the 2 oldest artists.
Artist.order(created_at: :asc).limit(2)
[
    [0] #<Artist:0x007fc793a5af70> {
                :id => 258,
              :name => "Les Arts Florissants & William Christie",
        :created_at => Fri, 13 Feb 2004 06:08:36 UTC +00:00,
        :updated_at => Wed, 29 Jan 2014 22:10:22 UTC +00:00
    },
    [1] #<Artist:0x007fc793a5ade0> {
                :id => 31,
              :name => "Baby Consuelo",
        :created_at => Mon, 16 Feb 2004 22:04:39 UTC +00:00,
        :updated_at => Wed, 29 Jan 2014 22:10:22 UTC +00:00
    }
]

### Stretch Exercise (Active Record Query Interface)


# 1) Find all the albums whose titles start with B.
Album.where("title LIKE 'B%'")
