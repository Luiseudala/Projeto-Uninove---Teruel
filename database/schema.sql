-- rodar somente uma vez, quando o banco de dados for instalado pela primeira vez
use banco;

create table curso (
    codigo varchar(50) primary key,
    nome varchar(50) not null,
    duracao varchar(50) not null,
    periodo varchar(50) not null
);

