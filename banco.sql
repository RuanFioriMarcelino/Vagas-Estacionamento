
-- TABELAS
CREATE TABLE estacionamento (
    id_estacionamento SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cnpj VARCHAR(14) NOT NULL,
    endereco VARCHAR(255) NOT NULL,
    capacidade_total INT NOT NULL
);

CREATE TABLE tipo_veiculo (
    id_tipo_veiculo SERIAL PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL,
    multiplicador_tarifa DECIMAL(5,2) NOT NULL
);


CREATE TABLE cliente (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf_cnpj VARCHAR(14) NOT NULL,
    telefone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE vaga (
    id_vaga SERIAL PRIMARY KEY,
    codigo_vaga VARCHAR(10) NOT NULL,
    status VARCHAR(20) NOT NULL,
	id_estacionamento INT NOT NULL REFERENCES estacionamento(id_estacionamento),
    id_tipo_veiculo INT NOT NULL REFERENCES tipo_veiculo(id_tipo_veiculo)
);

CREATE TABLE veiculo (
    id_veiculo SERIAL PRIMARY KEY,
    placa VARCHAR(7) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    cor VARCHAR(20) NOT NULL,
	id_cliente INT REFERENCES cliente(id_cliente),
    id_tipo_veiculo INT NOT NULL REFERENCES tipo_veiculo(id_tipo_veiculo)
);

CREATE TABLE contrato_mensalista (
    id_contrato SERIAL PRIMARY KEY,
    nome_plano VARCHAR(50) NOT NULL,
    valor_mensal DECIMAL(10,2) NOT NULL,
    regras_horario TEXT,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    dia_vencimento INT NOT NULL,
	id_cliente INT NOT NULL REFERENCES cliente(id_cliente),
    id_estacionamento INT NOT NULL REFERENCES estacionamento(id_estacionamento)
);

CREATE TABLE regra_tarifaria (
    id_regra_tarifaria SERIAL PRIMARY KEY,
    valor_primeira_hora DECIMAL(10,2) NOT NULL,
    valor_demais_horas DECIMAL(10,2) NOT NULL,
    valor_diaria DECIMAL(10,2) NOT NULL,
    tempo_tolerancia_minutos INT NOT NULL,
    empresa_parceira VARCHAR(100),
    tipo_desconto VARCHAR(20),
    valor_desconto DECIMAL(10,2),
	id_estacionamento INT NOT NULL REFERENCES estacionamento(id_estacionamento),
    id_tipo_veiculo INT NOT NULL REFERENCES tipo_veiculo(id_tipo_veiculo)
);

CREATE TABLE movimentacao_vaga (
    id_movimentacao SERIAL PRIMARY KEY,
    data_entrada TIMESTAMP NOT NULL,
    data_saida TIMESTAMP,
    valor_bruto DECIMAL(10,2),
    valor_pago DECIMAL(10,2),
    forma_pagamento VARCHAR(30),
	id_vaga INT REFERENCES vaga(id_vaga),
    id_veiculo INT NOT NULL REFERENCES veiculo(id_veiculo),
    id_regra_tarifaria INT REFERENCES regra_tarifaria(id_regra_tarifaria)
);



-- INSERTS

INSERT INTO estacionamento (nome, cnpj, endereco, capacidade_total) VALUES
('Central Park', '11111111000101', 'Rua A, 100 - Centro', 120),
('Parking Sul', '22222222000102', 'Av. Brasil, 250', 80),
('Garage Norte', '33333333000103', 'Rua das Flores, 450', 60),
('Auto Park', '44444444000104', 'Av. Atlântica, 900', 150),
('Prime Parking', '55555555000105', 'Rua XV de Novembro, 50', 200),
('Park Fácil', '66666666000106', 'Rua Joinville, 320', 90),
('Mega Estacionamento', '77777777000107', 'Av. Centenário, 400', 300),
('Top Parking', '88888888000108', 'Rua Urussanga, 88', 75),
('Express Parking', '99999999000109', 'Av. Universitária, 600', 110),
('Estacione Bem', '10101010000110', 'Rua Criciúma, 700', 130);


INSERT INTO tipo_veiculo (descricao, multiplicador_tarifa) VALUES
('Passeio', 1.00),
('Motocicleta', 0.70),
('SUV', 1.30),
('Caminhonete', 1.50),
('Van', 1.80),
('Elétrico', 1.10),
('Utilitário', 1.40),
('Esportivo', 2.00),
('Micro-ônibus', 2.50),
('Bicicleta', 0.30);


INSERT INTO cliente (nome, cpf_cnpj, telefone, email) VALUES
('João Silva', '12345678901', '48999990001', 'joao@email.com'),
('Maria Souza', '12345678902', '48999990002', 'maria@email.com'),
('Carlos Lima', '12345678903', '48999990003', 'carlos@email.com'),
('Ana Costa', '12345678904', '48999990004', 'ana@email.com'),
('Pedro Rocha', '12345678905', '48999990005', 'pedro@email.com'),
('Fernanda Alves', '12345678906', '48999990006', 'fernanda@email.com'),
('Lucas Martins', '12345678907', '48999990007', 'lucas@email.com'),
('Juliana Mendes', '12345678908', '48999990008', 'juliana@email.com'),
('Ricardo Gomes', '12345678909', '48999990009', 'ricardo@email.com'),
('Patrícia Oliveira', '12345678910', '48999990010', 'patricia@email.com');


INSERT INTO vaga (id_estacionamento, id_tipo_veiculo, codigo_vaga, status) VALUES
(1, 1, 'A-01', 'Disponível'),
(1, 2, 'A-02', 'Ocupada'),
(2, 1, 'B-01', 'Disponível'),
(2, 3, 'B-02', 'Manutenção'),
(3, 4, 'C-01', 'Disponível'),
(4, 5, 'D-01', 'Ocupada'),
(5, 6, 'E-01', 'Disponível'),
(6, 7, 'F-01', 'Disponível'),
(7, 8, 'G-01', 'Ocupada'),
(8, 9, 'H-01', 'Disponível');


INSERT INTO veiculo (id_cliente, id_tipo_veiculo, placa, marca, modelo, cor) VALUES
(1, 1, 'ABC1234', 'Toyota', 'Corolla', 'Prata'),
(2, 2, 'DEF5678', 'Honda', 'CG 160', 'Vermelha'),
(3, 3, 'GHI9012', 'Jeep', 'Compass', 'Preto'),
(4, 4, 'JKL3456', 'Ford', 'Ranger', 'Branca'),
(5, 5, 'MNO7890', 'Mercedes', 'Sprinter', 'Cinza'),
(6, 6, 'PQR1122', 'Tesla', 'Model 3', 'Azul'),
(7, 7, 'STU3344', 'Fiat', 'Fiorino', 'Branco'),
(8, 8, 'VWX5566', 'BMW', 'M4', 'Amarelo'),
(9, 9, 'YZA7788', 'Volvo', 'B270F', 'Prata'),
(10, 10, 'BCD9900', 'Caloi', 'Elite', 'Preta');


INSERT INTO contrato_mensalista (id_cliente,id_estacionamento,nome_plano,valor_mensal,regras_horario,data_inicio,data_fim,dia_vencimento) VALUES
(1, 1, 'Mensal Integral', 350.00, '24 horas', '2026-01-01', NULL, 5),
(2, 2, 'Plano Diurno', 250.00, '06h às 18h', '2026-01-10', NULL, 10),
(3, 3, 'Plano Noturno', 180.00, '18h às 06h', '2026-02-01', NULL, 15),
(4, 4, 'Plano Executivo', 500.00, 'Vaga exclusiva', '2026-02-15', NULL, 20),
(5, 5, 'Plano Premium', 650.00, 'Lavagem inclusa', '2026-03-01', NULL, 25),
(6, 6, 'Plano Básico', 200.00, 'Horário comercial', '2026-03-10', NULL, 8),
(7, 7, 'Plano Empresarial', 800.00, 'Multi veículos', '2026-04-01', NULL, 12),
(8, 8, 'Plano VIP', 1000.00, 'Cobertura total', '2026-04-15', NULL, 18),
(9, 9, 'Plano Econômico', 150.00, 'Somente dias úteis', '2026-05-01', NULL, 22),
(10, 10, 'Plano Weekend', 120.00, 'Finais de semana', '2026-05-10', NULL, 30);


INSERT INTO regra_tarifaria (id_estacionamento,id_tipo_veiculo,valor_primeira_hora,valor_demais_horas,valor_diaria,tempo_tolerancia_minutos,empresa_parceira,tipo_desconto,valor_desconto) VALUES
(1, 1, 10.00, 5.00, 50.00, 15, NULL, NULL, NULL),
(1, 2, 7.00, 3.00, 35.00, 10, 'Shopping Central', 'Percentual', 10.00),
(2, 3, 15.00, 8.00, 70.00, 20, NULL, NULL, NULL),
(3, 4, 18.00, 10.00, 90.00, 15, 'Restaurante Sul', 'Valor Fixo', 5.00),
(4, 5, 20.00, 12.00, 120.00, 30, NULL, NULL, NULL),
(5, 6, 12.00, 6.00, 60.00, 15, 'Cinema Max', 'Horas Grátis', 2.00),
(6, 7, 14.00, 7.00, 75.00, 10, NULL, NULL, NULL),
(7, 8, 25.00, 15.00, 150.00, 5, 'Hotel Prime', 'Percentual', 15.00),
(8, 9, 30.00, 20.00, 200.00, 10, NULL, NULL, NULL),
(9, 10, 3.00, 1.00, 10.00, 60, 'Bike Store', 'Valor Fixo', 2.00);


INSERT INTO movimentacao_vaga (id_vaga,id_veiculo,id_regra_tarifaria,data_entrada,data_saida,valor_bruto,valor_pago,forma_pagamento) VALUES
(1, 1, 1, '2026-06-01 08:00:00', '2026-06-01 10:00:00', 20.00, 20.00, 'Pix'),
(2, 2, 2, '2026-06-01 09:00:00', '2026-06-01 11:00:00', 13.00, 11.70, 'Cartão'),
(3, 3, 3, '2026-06-02 07:30:00', '2026-06-02 12:00:00', 39.00, 39.00, 'Dinheiro'),
(4, 4, 4, '2026-06-02 13:00:00', '2026-06-02 18:00:00', 58.00, 53.00, 'Pix'),
(5, 5, 5, '2026-06-03 06:00:00', '2026-06-03 20:00:00', 120.00, 120.00, 'Cartão'),
(6, 6, 6, '2026-06-03 08:30:00', '2026-06-03 11:30:00', 24.00, 24.00, 'Pix'),
(7, 7, 7, '2026-06-04 09:15:00', '2026-06-04 14:15:00', 42.00, 42.00, 'Dinheiro'),
(8, 8, 8, '2026-06-04 10:00:00', '2026-06-04 16:00:00', 100.00, 85.00, 'Cartão'),
(9, 9, 9, '2026-06-05 07:00:00', '2026-06-05 19:00:00', 200.00, 200.00, 'Pix'),
(10, 10, 10, '2026-06-05 12:00:00', '2026-06-05 14:00:00', 5.00, 3.00, 'Dinheiro');

select*from cliente;
select*from vaga;
select*from veiculo;
select*from tipo_veiculo;
select*from regra_tarifaria;
select*from movimentacao_vaga;
select*from estacionamento;
select*from contrato_mensalista;



--  FUNCTIONS 

CREATE OR REPLACE FUNCTION calcular_tempo_permanencia(p_entrada TIMESTAMP,p_saida TIMESTAMP)
RETURNS INT AS
$$
DECLARE
    minutos_totais INT;
BEGIN
    minutos_totais := EXTRACT(EPOCH FROM (p_saida - p_entrada)) / 60;
    RETURN minutos_totais;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION contar_vagas_disponiveis(p_id_estacionamento INT)
RETURNS INT AS
$$
DECLARE
    total INT;
BEGIN
    SELECT COUNT (*) INTO total FROM vaga
    WHERE id_estacionamento = p_id_estacionamento AND status = 'Disponível';
    RETURN total;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION calcular_desconto(p_valor DECIMAL,p_desconto DECIMAL)
RETURNS DECIMAL AS
$$
DECLARE
    valor_final DECIMAL;
BEGIN
    valor_final := p_valor - p_desconto;
    IF valor_final < 0 THEN
        valor_final := 0;
    END IF;
    RETURN valor_final;
END;
$$ LANGUAGE plpgsql;



-- PROCEDURES 

CREATE OR REPLACE PROCEDURE cadastrar_cliente(p_nome VARCHAR,p_cpf_cnpj VARCHAR,p_telefone VARCHAR,p_email VARCHAR)
LANGUAGE plpgsql
AS
$$
BEGIN
    INSERT INTO cliente (nome,cpf_cnpj,telefone,email)
    VALUES (p_nome,p_cpf_cnpj,p_telefone,p_email);
END;
$$;


CREATE OR REPLACE PROCEDURE alterar_status_vaga(p_id_vaga INT,p_status VARCHAR)
LANGUAGE plpgsql
AS
$$
BEGIN
    UPDATE vaga SET status = p_status 
	WHERE id_vaga = p_id_vaga;
END;
$$;


CREATE OR REPLACE PROCEDURE registrar_saida(p_id_movimentacao INT,p_data_saida TIMESTAMP,p_valor_pago DECIMAL,p_forma_pagamento VARCHAR)
LANGUAGE plpgsql
AS
$$
BEGIN
    UPDATE movimentacao_vaga
    SET
        data_saida = p_data_saida,
        valor_pago = p_valor_pago,
        forma_pagamento = p_forma_pagamento
    WHERE id_movimentacao = p_id_movimentacao;
END;
$$;



-- TRIGGER 

-- FUNÇÃO DA TRIGGER
-- ALTERAR STATUS DA VAGA AUTOMATICAMENTE

CREATE OR REPLACE FUNCTION atualizar_status_vaga()
RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.data_saida IS NULL THEN
        UPDATE vaga
        SET status = 'Ocupada'
        WHERE id_vaga = NEW.id_vaga;
    ELSE
        UPDATE vaga
        SET status = 'Disponível'
        WHERE id_vaga = NEW.id_vaga;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_status_vaga
AFTER INSERT OR UPDATE
ON movimentacao_vaga
FOR EACH ROW
EXECUTE FUNCTION atualizar_status_vaga();



--  VIEWS

CREATE VIEW vw_clientes_veiculos AS
SELECT c.id_cliente,c.nome,c.telefone,v.placa,v.marca,v.modelo
FROM cliente c
INNER JOIN veiculo v ON c.id_cliente = v.id_cliente;


CREATE VIEW vw_movimentacoes AS
SELECT mv.id_movimentacao,v.placa,vg.codigo_vaga,mv.data_entrada,mv.data_saida,mv.valor_pago
FROM movimentacao_vaga mv
INNER JOIN veiculo v ON mv.id_veiculo = v.id_veiculo
INNER JOIN vaga vg ON mv.id_vaga = vg.id_vaga;


CREATE VIEW vw_contratos_ativos AS
SELECT c.nome,cm.nome_plano,cm.valor_mensal,cm.data_inicio,cm.data_fim
FROM contrato_mensalista cm
INNER JOIN cliente c ON cm.id_cliente = c.id_cliente
WHERE cm.data_fim IS NULL;
