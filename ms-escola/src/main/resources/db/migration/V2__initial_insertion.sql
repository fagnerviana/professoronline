-- 1. ESCOLAS
-- Baseado nos documentos fornecidos que listam as escolas da UCSAL [cite: 9, 10, 11]
INSERT INTO escola (nome, status, criacao_date) VALUES
('Escola de Ciências Tecnológicas', true, '2025-01-01'),
('Escola de Educação, Cultura e Humanidades', true, '2025-01-01'),
('Escola de Ciências Sociais Aplicadas', true, '2025-01-01'),
('Escola de Ciências Naturais e da Saúde', true, '2025-01-01');

-- 2. SEMESTRE
-- Definindo o semestre letivo atual
INSERT INTO semestre (ano, periodo_ano, status) VALUES
(2025, '2025.1', true);

-- 3. DISCIPLINAS
-- Variedade de disciplinas para cobrir as diferentes escolas cadastradas acima [cite: 20]
INSERT INTO disciplina (sigla, descricao, carga_horaria, status) VALUES
('POO', 'Programação Orientada a Objetos', 80, true), -- ID 1
('BD1', 'Banco de Dados I', 80, true),                -- ID 2
('DIR01', 'Introdução ao Direito', 80, true),         -- ID 3
('PSI01', 'Psicologia Comportamental', 80, true),     -- ID 4
('ENF01', 'Anatomia Humana', 80, true),               -- ID 5
('ECO01', 'Microeconomia', 60, true),                 -- ID 6
('ADM01', 'Teoria Geral da Administração', 40, true), -- ID 7
('LOG01', 'Lógica de Programação', 80, true),         -- ID 8
('ARQ01', 'Arquitetura de Computadores', 60, true),   -- ID 9
('BIO01', 'Biologia Celular', 60, true),              -- ID 10
('PED01', 'Didática do Ensino Superior', 40, true),   -- ID 11
('MK01', 'Marketing Digital', 40, true);              -- ID 12

-- 4. HORÁRIOS PADRÃO
-- Configurados estritamente conforme as regras da UCSAL (Manhã inicia 07:00, Noite 19:30) [cite: 15, 16, 17]
INSERT INTO horario_padrao (turno, hora_inicio, hora_fim, dia_semana, ativo) VALUES
-- Manhã (Duração 02:30)
('Matutino', '07:00:00', '09:30:00', 'Segunda-feira', true), -- ID 1
('Matutino', '09:50:00', '12:20:00', 'Segunda-feira', true), -- ID 2
('Matutino', '07:00:00', '09:30:00', 'Quarta-feira', true),  -- ID 3
-- Tarde (Início 13:30)
('Vespertino', '13:30:00', '16:00:00', 'Terça-feira', true), -- ID 4
('Vespertino', '16:20:00', '18:50:00', 'Quinta-feira', true),-- ID 5
-- Noite (Início 19:30)
('Noturno', '19:30:00', '22:00:00', 'Segunda-feira', true),  -- ID 6
('Noturno', '19:30:00', '22:00:00', 'Quarta-feira', true),   -- ID 7
('Noturno', '19:30:00', '22:00:00', 'Sexta-feira', true);    -- ID 8