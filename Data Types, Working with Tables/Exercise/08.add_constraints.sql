ALTER TABLE minions_info

ADD CONSTRAINT unique_constaint UNIQUE (id, email),

ADD CONSTRAINT banana_check CHECK ( banana > 0);