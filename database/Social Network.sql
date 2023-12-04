CREATE TABLE "users" (
  "id" integer PRIMARY KEY,
  "first_name" varchar(255),
  "last_name" varchar(255),
  "description" varchar(255),
  "photo_id" varchar(255),
  "city" varchar(255),
  "interests" text
);

CREATE TABLE "posts" (
  "id" integer PRIMARY KEY,
  "user_id" integer NOT NULL,
  "description" varchar(255),
  "photo_id" varchar(255),
  "audio_id" varchar(255),
  "video_id" varchar(255),
  "hastags" varchar(255),
  "likes" integer NOT NULL DEFAULT 0,
  "views" integer NOT NULL DEFAULT 0
);

CREATE TABLE "hashtags" (
  "id" integer PRIMARY KEY,
  "name" varchar(255)
);

CREATE TABLE "chats" (
  "id" integer PRIMARY KEY,
  "name" varchar(255)
);

CREATE TABLE "messages" (
  "id" integer PRIMARY KEY,
  "user_id" integer NOT NULL,
  "chat_id" integer NOT NULL,
  "text" text NOT NULL,
  "created_at" datetime,
  "updated_at" datetime,
  "is_read" boolean DEFAULT false
);

CREATE TABLE "relations" (
  "id" integer PRIMARY KEY,
  "user_id" integer,
  "target_user_id" integer,
  "is_subscription" boolean,
  "relation_type" varchar(255)
);

CREATE TABLE "photos" (
  "id" integer PRIMARY KEY,
  "link" varchar(255) NOT NULL
);

CREATE TABLE "audio" (
  "id" integer PRIMARY KEY,
  "link" varchar(255) NOT NULL
);

CREATE TABLE "videos" (
  "id" integer PRIMARY KEY,
  "link" varchar(255) NOT NULL
);

CREATE TABLE "chats_users_junction" (
  "user_id" integer,
  "chat_id" integer
);

CREATE TABLE "posts_hashtags_junction" (
  "post_id" integer,
  "hashtag_id" integer
);

ALTER TABLE "users" ADD FOREIGN KEY ("photo_id") REFERENCES "photos" ("id");

ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "posts" ADD FOREIGN KEY ("photo_id") REFERENCES "photos" ("id");

ALTER TABLE "posts" ADD FOREIGN KEY ("audio_id") REFERENCES "audio" ("id");

ALTER TABLE "posts" ADD FOREIGN KEY ("video_id") REFERENCES "videos" ("id");

ALTER TABLE "posts_hashtags_junction" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("id");

ALTER TABLE "posts_hashtags_junction" ADD FOREIGN KEY ("hashtag_id") REFERENCES "hashtags" ("id");

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "relations" ("user_id");

ALTER TABLE "users" ADD FOREIGN KEY ("id") REFERENCES "relations" ("target_user_id");

ALTER TABLE "chats_users_junction" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "chats_users_junction" ADD FOREIGN KEY ("chat_id") REFERENCES "chats" ("id");

ALTER TABLE "messages" ADD FOREIGN KEY ("chat_id") REFERENCES "chats" ("id");

ALTER TABLE "messages" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");
