CREATE TABLE Funcionario
(
Nome_F varchar(50) NOT NULL,
pk_Cpf_F number(11) primary key,
Pis_F number(11) NOT NULL,
cidade_F varchar(50) NOT NULL,
bairro_F varchar(50) NOT NULL,
rua_F varchar(50) NOT NULL,
estado_F varchar(50) NOT NULL,
ddd_F number(3) NOT NULL,
telefone_F number(9) NOT NULL
);

CREATE TABLE Setor
(
Nome_S varchar(50) NOT NULL,
Nome_S_Supervisor varchar(50) NOT NULL,
Cod_S number(4) PRIMARY KEY,
cidade_S varchar(50) NOT NULL,
bairro_S varchar(50) NOT NULL,
rua_S varchar(50) NOT NULL,
estado_S varchar(50) NOT NULL,
ddd_S number(3) NOT NULL,
telefone_S number(9) NOT NULL
);

CREATE TABLE Cargo
(
Nome_C varchar(50) NOT NULL,
Cod_C number(4) PRIMARY KEY,
Valor_base number(9,2) NOT NULL,
Valor_horaTrab number(9,2) NOT NULL
);

CREATE TABLE Funcionario_Cargo
(
fk_pk_Cod_C number(4) NOT NULL,
fk_pk_Cpf_F number(11) NOT NULL,
Data_Começo date NOT NULL,
Data_Fim date NULL,
CONSTRAINT fk_pk_Cod_C FOREIGN KEY (fk_pk_Cod_C)
REFERENCES Cargo (Cod_C),
CONSTRAINT fk_pk_Cpf_F FOREIGN KEY (fk_pk_Cpf_F)
REFERENCES Funcionario (pk_Cpf_F),
CONSTRAINT pk_Fun_Cargo PRIMARY KEY (fk_pk_Cod_C,
fk_pk_Cpf_F)
);

CREATE TABLE Funcionario_Setor
(
fk_pk_Cod_S number(6) NOT NULL,
fk_pk_Cpf_F number(11) NOT NULL,
Data_inicio date NOT NULL,
Data_fim date NULL,
CONSTRAINT fk_pkCod_S FOREIGN KEY (fk_pk_Cod_S)
REFERENCES Setor (Cod_S),
CONSTRAINT fk_pkCpf_F FOREIGN KEY (fk_pk_Cpf_F)
REFERENCES Funcionario (pk_Cpf_F),
CONSTRAINT pk_Func_Setor PRIMARY KEY (fk_pk_Cod_S,
fk_pk_Cpf_F)
);

CREATE TABLE Pagamento
(
Fk_pk_Cpf_F number(11) NOT NULL,
Cod_P number(4) NOT NULL,
Data_Pago date NOT NULL,
Fgts_P number(9,2) NULL,
Inss_P number(9,2) NULL,
fgtsAux number(1) NULL,
inssAux number(1) NULL,
AdComissao_P number(9,2) NULL,
AdInsalubridade_P number(9,2) NULL,
AdPericulosidade_P number(9,2) NULL,
AdHoraExtra_P number(9,2) NULL,
horasExtraTrabalhadas number(9) NULL,
CONSTRAINT Fk_pk_CpfF FOREIGN KEY (Fk_pk_Cpf_F)
REFERENCES Funcionario (pk_Cpf_f),
CONSTRAINT pk_Pagamento PRIMARY KEY (Fk_pk_Cpf_F,Cod_P)
);

CREATE OR REPLACE TRIGGER Horario_de_trabalho
BEFORE INSERT OR UPDATE OR DELETE ON Pagamento
BEGIN
IF TO_CHAR (SYSDATE, 'HH24') NOT BETWEEN '08' AND '17' THEN
RAISE_APPLICATION_ERROR(-20205,'Alterações são permitidas apenas no horário de
expediente');
END IF;
END Horario_de_trabalho;


