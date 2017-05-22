/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/5/21 23:20:21                           */
/*==============================================================*/


drop table if exists Cinema;

drop table if exists Movie;

drop table if exists MovieType;

drop table if exists Order;

drop table if exists Room;

drop table if exists RoomType;

drop table if exists Show;

drop table if exists Ticket;

drop table if exists User;

drop table if exists cinemaShowMovie;

/*==============================================================*/
/* Table: Cinema                                                */
/*==============================================================*/
create table Cinema
(
   cinema_id            varchar(100) not null,
   cinema_name          varchar(64),
   cinema_address       varchar(100),
   cinema_phone         varchar(20),
   primary key (cinema_id)
);

/*==============================================================*/
/* Table: Movie                                                 */
/*==============================================================*/
create table Movie
(
   movie_id             varchar(100) not null,
   movie_type_id        varchar(100) not null,
   movie_name           varchar(20),
   movie_release_date   varchar(100),
   movie_cover          varchar(1000),
   movie_onshow         bool,
   movie_description    varchar(100),
   movie_score          float,
   primary key (movie_id)
);

/*==============================================================*/
/* Table: MovieType                                             */
/*==============================================================*/
create table MovieType
(
   movie_type_id        varchar(100) not null,
   movie_type_name      varchar(100),
   primary key (movie_type_id)
);

/*==============================================================*/
/* Table: Order                                               */
/*==============================================================*/
create table Order
(
   order_id             varchar(100) not null,
   user_id              varchar(100) not null,
   order_date           varchar(100) not null,
   order_payment_method varchar(100),
   order_ispaid         bool,
   primary key (order_id)
);

/*==============================================================*/
/* Table: Room                                                  */
/*==============================================================*/
create table Room
(
   room_id              varchar(100) not null,
   cinema_id            varchar(100) not null,
   room_type_id         varchar(100) not null,
   room_name            varchar(16) not null,
   primary key (room_id)
);

/*==============================================================*/
/* Table: RoomType                                              */
/*==============================================================*/
create table RoomType
(
   room_type_id         varchar(100) not null,
   room_type_name       varchar(16) not null,
   row                  int not null,
   col                  int not null,
   primary key (room_type_id)
);

/*==============================================================*/
/* Table: Show                                                  */
/*==============================================================*/
create table Show
(
   show_id              varchar(100) not null,
   movie_id             varchar(100) not null,
   room_id              varchar(100) not null,
   show_time            varchar(100) not null,
   primary key (show_id)
);

/*==============================================================*/
/* Table: Ticket                                                */
/*==============================================================*/
create table Ticket
(
   ticket_id            varchar(100) not null,
   show_id              varchar(100) not null,
   order_id             varchar(100),
   ticket_price         float not null,
   ticket_seat          int,
   ticket_issold        bool,
   primary key (ticket_id)
);

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
   user_id              varchar(100) not null,
   user_name            varchar(100) not null,
   user_password        varchar(30) not null,
   user_gender          varchar(10),
   user_age             int,
   user_phone           varchar(11) not null,
   user_email           varchar(30),
   user_avatar          varchar(9999),
   primary key (user_id)
);

/*==============================================================*/
/* Table: cinemaShowMovie                                       */
/*==============================================================*/
create table cinemaShowMovie
(
   cinema_id            varchar(100) not null,
   movie_id             varchar(100) not null,
   primary key (cinema_id, movie_id)
);

alter table Movie add constraint FK_movieHasType foreign key (movie_type_id)
      references MovieType (movie_type_id) on delete restrict on update restrict;

alter table Order add constraint FK_userHasOrder foreign key (user_id)
      references User (user_id) on delete restrict on update restrict;

alter table Room add constraint FK_cinemaHasRooms foreign key (cinema_id)
      references Cinema (cinema_id) on delete restrict on update restrict;

alter table Room add constraint FK_roomTypeHasRooms foreign key (room_type_id)
      references RoomType (room_type_id) on delete restrict on update restrict;

alter table Show add constraint FK_movieHasShows foreign key (movie_id)
      references Movie (movie_id) on delete restrict on update restrict;

alter table Show add constraint FK_roomHasShows foreign key (room_id)
      references Room (room_id) on delete restrict on update restrict;

alter table Ticket add constraint FK_orderHasTickets foreign key (order_id)
      references Order (order_id) on delete restrict on update restrict;

alter table Ticket add constraint FK_showHasTickets foreign key (show_id)
      references Show (show_id) on delete restrict on update restrict;

alter table cinemaShowMovie add constraint FK_cinemaShowMovie foreign key (cinema_id)
      references Cinema (cinema_id) on delete restrict on update restrict;

alter table cinemaShowMovie add constraint FK_cinemaShowMovie2 foreign key (movie_id)
      references Movie (movie_id) on delete restrict on update restrict;

