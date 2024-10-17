create table if not exists writer
(
    writer_id serial not null
        constraint writer_pk
            primary key,
    writer_first_name varchar(255) not null,
    writer_last_name  varchar(255)
);

create table if not exists age_rating
(
    age_rating_id  serial      not null
        constraint age_rating_pk
            primary key,
    age_rating_name varchar(255) not null
);

create table if not exists genre
(
    genre_id   serial not null
        constraint genre_pk
            primary key,
    genre_name varchar(255)
);

create table if not exists book
(
    book_id          serial      not null
        constraint book_pk
            primary key,
    book_name        varchar(255) not null,
    book_description varchar(1000),
    is_rent          boolean      not null,
    book_release     date         not null,
    age_rating_id    integer      not null
);

create table if not exists book_genre
(
    book_id  integer not null
        constraint book_genre_book_book_id_fk
            references book
            on update cascade on delete cascade,
    genre_id integer not null
        constraint book_genre_genre_genre_id_fk
            references genre
            on update cascade on delete cascade
);

create table if not exists book_writer
(
    book_id   integer not null
        constraint book_writer_book_book_id_fk
            references book
            on update cascade on delete cascade,
    writer_id integer not null
        constraint book_writer_writer_writer_id_fk
            references writer
);

create table if not exists reader
(
    reader_id         serial      not null
        constraint reader_pk
            primary key,
    reader_first_name varchar(255) not null,
    reader_last_name  varchar(255) not null,
    reader_age        integer      not null
);

create table if not exists book_for_rent
(
    book_id   integer not null
        constraint book_for_rent_book_book_id_fk
            references book
            on update cascade on delete cascade,
    reader_id integer not null
        constraint book_for_rent_reader_reader_id_fk
            references reader
            on update cascade on delete cascade
);
