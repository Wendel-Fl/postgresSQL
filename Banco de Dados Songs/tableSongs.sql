DROP TABLE albums, artists;

CREATE TABLE IF NOT EXISTS public.albums
(
    id numeric(6,0) NOT NULL,
    artist_id numeric(6,0),
    album_title character varying(100) COLLATE pg_catalog."default",
    genre character varying(20) COLLATE pg_catalog."default",
    year_of_pub numeric(4,0),
    num_of_tracks numeric(2,0),
    num_of_sales numeric(8,0),
    rolling_stone_critic numeric(2,1),
    mtv_critic numeric(2,1),
    music_maniac_critic numeric(2,1),
    CONSTRAINT albums_pkey PRIMARY KEY (id)
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.albums
    OWNER to postgres;

CREATE TABLE IF NOT EXISTS public.artists
(
    id numeric NOT NULL,
    art_name character varying(100) COLLATE pg_catalog."default",
    real_name character varying(100) COLLATE pg_catalog."default",
    role character varying(20) COLLATE pg_catalog."default",
    year_of_birth numeric(4,0),
    country character varying(100) COLLATE pg_catalog."default",
    city character varying(100) COLLATE pg_catalog."default",
    email character varying(80) COLLATE pg_catalog."default",
    zip_code character varying(20) COLLATE pg_catalog."default",
    CONSTRAINT artists_pkey PRIMARY KEY (id)
)
TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.artists
    OWNER to postgres; 
