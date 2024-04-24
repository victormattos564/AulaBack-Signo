CREATE DATABASE aulabackend;

CREATE TABLE usuarios (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sobrenome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    idade INTEGER NOT NULL,
    signo_zodiacal VARCHAR(100) NOT NULL
);

CREATE FUNCTION calcular_idade(data_nascimento DATE) RETURNS INTEGER AS $$
DECLARE
    idade INTEGER;
BEGIN
    idade := EXTRACT(YEAR FROM AGE(NOW(), data_nascimento));
    RETURN idade;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION calcular_signo_zodiacal(data_nascimento DATE) RETURNS VARCHAR AS $$
DECLARE
    signo_zodiacal VARCHAR;
BEGIN

    IF (EXTRACT(MONTH FROM data_nascimento) = 1 AND EXTRACT(DAY FROM data_nascimento) >= 20) OR (EXTRACT(MONTH FROM data_nascimento) = 2 AND EXTRACT(DAY FROM data_nascimento) <= 18) THEN
        signo_zodiacal := 'Aquário';
    ELSIF (EXTRACT(MONTH FROM data_nascimento) = 2 AND EXTRACT(DAY FROM data_nascimento) >= 19) OR (EXTRACT(MONTH FROM data_nascimento) = 3 AND EXTRACT(DAY FROM data_nascimento) <= 20) THEN
        signo_zodiacal := 'Peixes';
    ELSIF (EXTRACT(MONTH FROM data_nascimento) = 3 AND EXTRACT(DAY FROM data_nascimento) >= 21) OR (EXTRACT(MONTH FROM data_nascimento) = 4 AND EXTRACT(DAY FROM data_nascimento) <= 19) THEN
        signo_zodiacal := 'Áries';
    ELSIF (EXTRACT(MONTH FROM data_nascimento) = 4 AND EXTRACT(DAY FROM data_nascimento) >= 20) OR (EXTRACT(MONTH FROM data_nascimento) = 5 AND EXTRACT(DAY FROM data_nascimento) <= 20) THEN
        signo_zodiacal := 'Touro';
    ELSIF (EXTRACT(MONTH FROM data_nascimento) = 5 AND EXTRACT(DAY FROM data_nascimento) >= 21) OR (EXTRACT(MONTH FROM data_nascimento) = 6 AND EXTRACT(DAY FROM data_nascimento) <= 20) THEN
        signo_zodiacal := 'Gêmeos';
    ELSIF (EXTRACT(MONTH FROM data_nascimento) = 6 AND EXTRACT(DAY FROM data_nascimento) >= 21) OR (EXTRACT(MONTH FROM data_nascimento) = 7 AND EXTRACT(DAY FROM data_nascimento) <= 22) THEN
        signo_zodiacal := 'Câncer';
    ELSIF (EXTRACT(MONTH FROM data_nascimento) = 7 AND EXTRACT(DAY FROM data_nascimento) >= 23) OR (EXTRACT(MONTH FROM data_nascimento) = 8 AND EXTRACT(DAY FROM data_nascimento) <= 22) THEN
        signo_zodiacal := 'Leão';
    ELSIF (EXTRACT(MONTH FROM data_nascimento) = 8 AND EXTRACT(DAY FROM data_nascimento) >= 23) OR (EXTRACT(MONTH FROM data_nascimento) = 9 AND EXTRACT(DAY FROM data_nascimento) <= 22) THEN
        signo_zodiacal := 'Virgem';
    ELSIF (EXTRACT(MONTH FROM data_nascimento) = 9 AND EXTRACT(DAY FROM data_nascimento) >= 23) OR (EXTRACT(MONTH FROM data_nascimento) = 10 AND EXTRACT(DAY FROM data_nascimento) <= 22) THEN
        signo_zodiacal := 'Libra';
    ELSIF (EXTRACT(MONTH FROM data_nascimento) = 10 AND EXTRACT(DAY FROM data_nascimento) >= 23) OR (EXTRACT(MONTH FROM data_nascimento) = 11 AND EXTRACT(DAY FROM data_nascimento) <= 21) THEN
        signo_zodiacal := 'Escorpião';
    ELSIF (EXTRACT(MONTH FROM data_nascimento) = 11 AND EXTRACT(DAY FROM data_nascimento) >= 22) OR (EXTRACT(MONTH FROM data_nascimento) = 12 AND EXTRACT(DAY FROM data_nascimento) <= 21) THEN
        signo_zodiacal := 'Sagitário';
    ELSE
        signo_zodiacal := 'Capricórnio';
    END IF;

    RETURN signo_zodiacal;

END;
$$ LANGUAGE plpgsql;


INSERT INTO usuarios (nome, sobrenome, email, data_nascimento, idade, signo_zodiacal)
VALUES (
  'João1', 
  'Silva1', 
  'joao.silv1a@example.com', 
  '1990-09-15',
  calcular_idade('1990-09-15'), 
  calcular_signo_zodiacal('1990-09-15')
);

SELECT * FROM usuarios;