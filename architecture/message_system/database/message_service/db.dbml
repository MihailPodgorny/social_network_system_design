// Replication:
// - master-less (async)
// - replication factor 3
//
// Sharding:
// - key based by chat_id
//
// Partitioning within the shard:
// - range based by sent_at (per 1 month)

Table messages {
  id integer [primary key]
  chat_id integer [not null]
  sender_id integer [not null] // user_id
  text varchar [not null]
  sent_at timestamp [not null]
  delivered_at timestamp
  seen_at timestamp
}