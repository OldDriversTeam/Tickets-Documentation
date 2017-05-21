/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2017/5/20 10:48:28                           */
/*==============================================================*/


drop table if exists Cinema;

drop table if exists Movie;

drop table if exists MovieInCinema;

drop table if exists MovieType;

drop table if exists "Order";

drop table if exists Room;

drop table if exists RoomType;

drop table if exists Seat;

drop table if exists Show;

drop table if exists Ticket;

drop table if exists User;

/*==============================================================*/
/* Table: Cinema                                                */
/*==============================================================*/
create table Cinema
(
   cinema_id            int not null,
   cinema_name          varchar(64),
   primary key (cinema_id)
);

/*==============================================================*/
/* Table: Movie                                                 */
/*==============================================================*/
create table Movie
(
   movie_id             int not null,
   movie_type_id        int,
   release_date         date,
   onshow               bool,
   primary key (movie_id)
);

/*==============================================================*/
/* Table: MovieInCinema                                         */
/*==============================================================*/
create table MovieInCinema
(
   cinema_id            int not null,
   movie_id             int not null,
   primary key (cinema_id, movie_id)
);

/*==============================================================*/
/* Table: MovieType                                             */
/*==============================================================*/
create table MovieType
(
   movie_type_id        int not null,
   type_name            varchar(16),
   primary key (movie_type_id)
);

/*==============================================================*/
/* Table: "Order"                                               */
/*==============================================================*/
create table "Order"
(
   order_id             int not null,
   user_account         int,
   ticket_number        int,
   primary key (order_id)
);

/*==============================================================*/
/* Table: Room                                                  */
/*==============================================================*/
create table Room
(
   room_id              int not null,
   cinema_id            int,
   room_type_id         int,
   room_name            varchar(16),
   primary key (room_id)
);

/*==============================================================*/
/* Table: RoomType                                              */
/*==============================================================*/
create table RoomType
(
   room_type_id         int not null,
   room_type_name       varchar(16),
   row                  int,
   col                  int,
   primary key (room_type_id)
);

/*==============================================================*/
/* Table: Seat                                                  */
/*==============================================================*/
create table Seat
(
   seat_id              int not null,
   room_id              int,
   ticket_id            varchar(16),
   seat_number          int,
   primary key (seat_id)
);

/*==============================================================*/
/* Table: Show                                                  */
/*==============================================================*/
create table Show
(
   show_id              int not null,
   room_id              int,
   movie_id             int,
   show_time            datetime,
   primary key (show_id)
);

/*==============================================================*/
/* Table: Ticket                                                */
/*==============================================================*/
create table Ticket
(
   ticket_id            varchar(16) not null,
   show_id              int,
   order_id             int,
   seat_id              int,
   ticket_price         int,
   primary key (ticket_id)
);

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
   user_account         int not null,
   user_name            varchar(10),
   user_password        varchar(16),
   primary key (user_account)
);

alter table Movie add constraint FK_Relationship_5 foreign key (movie_type_id)
      references MovieType (movie_type_id) on delete restrict on update restrict;

alter table MovieInCinema add constraint FK_Relationship_1 foreign key (cinema_id)
      references Cinema (cinema_id) on delete restrict on update restrict;

alter table MovieInCinema add constraint FK_Relationship_2 foreign key (movie_id)
      references Movie (movie_id) on delete restrict on update restrict;

alter table "Order" add constraint FK_Relationship_9 foreign key (user_account)
      references User (user_account) on delete restrict on update restrict;

alter table Room add constraint FK_Relationship_11 foreign key (room_type_id)
      references RoomType (room_type_id) on delete restrict on update restrict;

alter table Room add constraint FK_Relationship_4 foreign key (cinema_id)
      references Cinema (cinema_id) on delete restrict on update restrict;

alter table Seat add constraint FK_Relationship_12 foreign key (ticket_id)
      references Ticket (ticket_id) on delete restrict on update restrict;

alter table Seat add constraint FK_Relationship_3 foreign key (room_id)
      references Room (room_id) on delete restrict on update restrict;

alter table Show add constraint FK_Relationship_10 foreign key (room_id)
      references Room (room_id) on delete restrict on update restrict;

alter table Show add constraint FK_Relationship_6 foreign key (movie_id)
      references Movie (movie_id) on delete restrict on update restrict;

alter table Ticket add constraint FK_Relationship_13 foreign key (seat_id)
      references Seat (seat_id) on delete restrict on update restrict;

alter table Ticket add constraint FK_Relationship_7 foreign key (show_id)
      references Show (show_id) on delete restrict on update restrict;

alter table Ticket add constraint FK_Relationship_8 foreign key (order_id)
      references "Order" (order_id) on delete restrict on update restrict;

