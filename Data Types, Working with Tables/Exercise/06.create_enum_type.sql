CREATE TYPE type_mood AS ENUM ('happy', 'relaxed', 'stressed', 'sad');

ALTER TABLE minions_info
ADD COLUMN MOOD type_mood;