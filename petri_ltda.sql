drop database petri_ltda;

create database petri_ltda;

use petri_ltda;

create table petriLTDA(
	idEmpresa int primary key not null,
    nome varchar(100),
    cnpj numeric(14),
    email varchar(100),
    telefone numeric(14)    
);

create table clientes(
	idCliente int primary key not null auto_increment,
    idEmpresa int,
    nome varchar(200),
    telefone numeric(14),
    cpf numeric(11),
    senha varchar(100),
    email varchar(100),
    
    foreign key (idEmpresa) references petriLTDA(idEmpresa)
);

create table enderecos(
	idEndereco int primary key not null auto_increment,
    idCliente int,
    cep numeric(9),
    cidade varchar(150),
    bairro varchar(150),
    rua varchar(150),
    complemento varchar(150),
    
    foreign key (idCliente) references clientes(idCliente)
);

create table categorias(
	idCategoria int primary key not null auto_increment,
    nome varchar(100),
    qntd_produtos int
);

create table produtos(
	idProduto int primary key not null auto_increment,
    idCategoria int,
    nome varchar(150),
    descricao varchar(200),
    preco numeric(5),
    link_img_produtos varchar(150),
    marca varchar(100),
    
    foreign key (idCategoria) references categorias(idCategoria)
);

create table compras(
	idCompra int primary key not null auto_increment,
    idProduto int,
    idCliente int,
    data_hora_pedido datetime,
    data_hora_entrega datetime,
    valorTotal numeric(5),
    
    foreign key (idProduto) references produtos(idProduto),
    foreign key (idCliente) references clientes(idCliente) 
);