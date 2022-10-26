create database personalListesi

use personalListesi

create table Personal(
per_id int not null primary key identity(1,1),
per_ad nvarchar(20) not null,
per_soyad nvarchar(20) not null,
per_bolum nvarchar(20) not null check (per_bolum in ('kumaskesim','dikim','ütü')),
--per_maas int not null check (per_maas >= 42500) and per_maas <= 10000,
maas int not null check (maas between 4250 and 10000),
istarih date not null  check (istarih>='2001-01-01') default getdate()
)
