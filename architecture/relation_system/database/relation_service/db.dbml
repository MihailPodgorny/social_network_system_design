// Replication:
// - master-slave (async)
// - replication factor 2

enum relation_type {
  subscriber
  friend
  love
}

// Sharding:
// - key based by src_user_id

Table relations {
  id integer [primary key]
  src_user_id integer [not null] // user_id
  dst_user_id integer [not null] // user_id
  type relation_type [not null]
  created_at timestamp [default: `now()`]
}