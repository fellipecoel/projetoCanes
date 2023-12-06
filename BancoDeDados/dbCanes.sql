create database dbCanes;

use dbCanes;

create table Fucionarios (
idFuncionario int primary key auto_increment,
nomeFucionario varchar(60) not null,
login varchar(20) not null unique,
email varchar(50) not null unique,
senha varchar(255) not null,
departamento enum("Administração", "Lideres", "Vendedores Locais",
"Vendedores Externos", "Logistica", "Diretoria")
);

create table Fornecedores(
idForn int primary key auto_increment,
nomeForn varchar(100) not null, 
cnpjForn char(20) not null unique, 
telForn varchar(20) not null,
emailForn varchar(50) not null unique,
cep varchar(9),
enderecoForn varchar(100),
numEndereco varchar(10),
bairro varchar(40),
cidade varchar(40), 
estado char(2)
);



create table Produtos(
idProd int primary key auto_increment,
nomeProd varchar(50),
decriacaoProd text,
precoProd decimal(10,2)not null,
estoqueProd int not null,
categoriaProd enum("Limpeza", "Higiene"),
idForn int not null,
foreign key (idForn) references Fornecedores(idForn)
);

describe Produtos;

create table Clientes(
idCliente int primary key auto_increment,
nome varchar(100) not null,
cpf varchar(15) not null unique,
cnpj varchar(20) unique,
tel varchar(20) not null,
email varchar(50) not null unique,
cep varchar(9),
endereco varchar(100),
numEndereco varchar(10),
bairro varchar(40),
cidade varchar(40),
estado char(2)
);

describe Clientes;

 create table Pedidos(
          idPedido int primary key auto_increment,
          dataPedido timestamp default current_timestamp,
          statusPedido enum("Pendente", "Finalizado", "Cancelado") not null,
		  idFuncionario int not null,
          foreign key (idFuncionario) references Fucionarios (idFuncionario),
          idCliente int not null,
          foreign key (idCliente) references Clientes(idCliente)
          ); 
          
          
create table itensPedidos(
idItensPed int primary key auto_increment,
idPedido int not null,
foreign key (idPedido) references Pedidos (idPedido),
idProd int not null,
foreign key (idProd) references Produtos (idProd),
quantidade int not null
);


