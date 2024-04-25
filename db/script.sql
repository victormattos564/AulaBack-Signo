CREATE DATABASE aulabackend;

CREATE TABLE usuários (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    birthdate DATE NOT NULL,
    age INTEGER NOT NULL,
    signo_zodiacal VARCHAR(100) NOT NULL
);

CREATE FUNCTION calculate_age(birthdate DATE) RETURNS INTEGER AS $$
DECLARE
    age INTEGER;
BEGIN
    age := EXTRACT(YEAR FROM AGE(NOW(), birthdate));
    RETURN age;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION calculate_signo_zodiacal(birthdate DATE) RETURNS VARCHAR AS $$
DECLARE
    signo_zodiacal VARCHAR;
BEGIN

    IF (EXTRACT(MONTH FROM birthdate) = 1 AND EXTRACT(DAY FROM birthdate) >= 20) OR (EXTRACT(MONTH FROM birthdate) = 2 AND EXTRACT(DAY FROM birthdate) <= 18) THEN
        signo_zodiacal := 'Aquarius';
    ELSIF (EXTRACT(MONTH FROM birthdate) = 2 AND EXTRACT(DAY FROM birthdate) >= 19) OR (EXTRACT(MONTH FROM birthdate) = 3 AND EXTRACT(DAY FROM birthdate) <= 20) THEN
        signo_zodiacal := 'Pisces';
    ELSIF (EXTRACT(MONTH FROM birthdate) = 3 AND EXTRACT(DAY FROM birthdate) >= 21) OR (EXTRACT(MONTH FROM birthdate) = 4 AND EXTRACT(DAY FROM birthdate) <= 19) THEN
        signo_zodiacal := 'Aries';
    ELSIF (EXTRACT(MONTH FROM birthdate) = 4 AND EXTRACT(DAY FROM birthdate) >= 20) OR (EXTRACT(MONTH FROM birthdate) = 5 AND EXTRACT(DAY FROM birthdate) <= 20) THEN
        signo_zodiacal := 'Taurus';
    ELSIF (EXTRACT(MONTH FROM birthdate) = 5 AND EXTRACT(DAY FROM birthdate) >= 21) OR (EXTRACT(MONTH FROM birthdate) = 6 AND EXTRACT(DAY FROM birthdate) <= 20) THEN
        signo_zodiacal := 'Gemini';
    ELSIF (EXTRACT(MONTH FROM birthdate) = 6 AND EXTRACT(DAY FROM birthdate) >= 21) OR (EXTRACT(MONTH FROM birthdate) = 7 AND EXTRACT(DAY FROM birthdate) <= 22) THEN
        signo_zodiacal := 'Cancer';
    ELSIF (EXTRACT(MONTH FROM birthdate) = 7 AND EXTRACT(DAY FROM birthdate) >= 23) OR (EXTRACT(MONTH FROM birthdate) = 8 AND EXTRACT(DAY FROM birthdate) <= 22) THEN
        signo_zodiacal := 'Leo';
    ELSIF (EXTRACT(MONTH FROM birthdate) = 8 AND EXTRACT(DAY FROM birthdate) >= 23) OR (EXTRACT(MONTH FROM birthdate) = 9 AND EXTRACT(DAY FROM birthdate) <= 22) THEN
        signo_zodiacal := 'Virgo';
    ELSIF (EXTRACT(MONTH FROM birthdate) = 9 AND EXTRACT(DAY FROM birthdate) >= 23) OR (EXTRACT(MONTH FROM birthdate) = 10 AND EXTRACT(DAY FROM birthdate) <= 22) THEN
        signo_zodiacal := 'Libra';
    ELSIF (EXTRACT(MONTH FROM birthdate) = 10 AND EXTRACT(DAY FROM birthdate) >= 23) OR (EXTRACT(MONTH FROM birthdate) = 11 AND EXTRACT(DAY FROM birthdate) <= 21) THEN
        signo_zodiacal := 'Scorpio';
    ELSIF (EXTRACT(MONTH FROM birthdate) = 11 AND EXTRACT(DAY FROM birthdate) >= 22) OR (EXTRACT(MONTH FROM birthdate) = 12 AND EXTRACT(DAY FROM birthdate) <= 21) THEN
        signo_zodiacal := 'Sagittarius';
    ELSE
        signo_zodiacal := 'Capricorn';
    END IF;

    RETURN signo_zodiacal;

END;
$$ LANGUAGE plpgsql;


INSERT INTO usuários (first_name, last_name, email, birthdate, age, signo_zodiacal)
VALUES (
  'João1', 
  'Silva1', 
  'joao.silv1a@example.com', 
  '1990-09-15',
  calculate_age('1990-09-15'), 
  calculate_signo_zodiacal('1990-09-15')
);

SELECT * FROM usuários;
