// Replication:
// - master-slave (async)
// - replication factor 2

enum feed_type {
  home
  user
}

// Sharding:
// - key based by user_id

Table feeds {
  user_id integer
  feed_type feed_type
  posts list

  indexes {
    (user_id, feed_type) [pk]
  }
}