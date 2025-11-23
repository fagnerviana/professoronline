
-- TABELA: escola
CREATE TABLE escola (
    id_escola SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    criacao_date DATE NOT NULL DEFAULT CURRENT_DATE
);

-- TABELA: semestre
CREATE TABLE semestre (
    id_semestre SERIAL PRIMARY KEY,
    ano INT NOT NULL,
    periodo_ano VARCHAR(20) NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT uq_semestre_ano_periodo UNIQUE (ano, periodo_ano)
);

-- TABELA: disciplina
CREATE TABLE disciplina (
    id_disciplina SERIAL PRIMARY KEY,
    sigla VARCHAR(20) NOT NULL,
    descricao VARCHAR(150) NOT NULL,
    carga_horaria INT NOT NULL,
    status BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT uq_disciplina_sigla UNIQUE (sigla)
);

-- TABELA: horario_padrao
CREATE TABLE horario_padrao (
    id_horario_padrao SERIAL PRIMARY KEY,
    turno VARCHAR(50) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fim TIME NOT NULL,
    dia_semana VARCHAR(20) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT ck_horario_intervalo CHECK (hora_inicio < hora_fim)
);

-- TABELA: disponibilidade
CREATE TABLE disponibilidade (
    id_disponibilidade SERIAL PRIMARY KEY,
    id_professor INT NOT NULL,       -- via REST do ProfessorService
    id_horario_padrao INT NOT NULL,
    id_semestre INT NOT NULL,
    CONSTRAINT fk_disp_horario FOREIGN KEY (id_horario_padrao) REFERENCES horario_padrao (id_horario_padrao) ON DELETE CASCADE,
    CONSTRAINT fk_disp_semestre FOREIGN KEY (id_semestre) REFERENCES semestre (id_semestre),
    CONSTRAINT uq_disp_prof_hor_sem UNIQUE (id_professor, id_horario_padrao, id_semestre)
);

-- TABELA: professor_disciplina
CREATE TABLE professor_disciplina (
    id_professor_disciplina SERIAL PRIMARY KEY,
    prioridade INT NOT NULL CHECK (prioridade IN (1, 2)),
    id_professor INT NOT NULL,     -- via REST
    id_disciplina INT NOT NULL,
    id_semestre INT NOT NULL,
    CONSTRAINT fk_pd_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplina (id_disciplina),
    CONSTRAINT fk_pd_semestre FOREIGN KEY (id_semestre) REFERENCES semestre (id_semestre),
    CONSTRAINT uq_pd_prof_disc_sem UNIQUE (id_professor, id_disciplina, id_semestre)
);

-- TABELA: turma
CREATE TABLE turma (
    id_turma SERIAL PRIMARY KEY,
    codigo VARCHAR(20) NOT NULL,
    vagas INT NOT NULL,
    id_disciplina INT NOT NULL,
    id_semestre INT NOT NULL,
    id_horario_padrao INT NOT NULL,
    id_professor INT NOT NULL,    -- via REST
    CONSTRAINT fk_turma_disciplina FOREIGN KEY (id_disciplina) REFERENCES disciplina (id_disciplina),
    CONSTRAINT fk_turma_semestre FOREIGN KEY (id_semestre) REFERENCES semestre (id_semestre),
    CONSTRAINT fk_turma_horario FOREIGN KEY (id_horario_padrao) REFERENCES horario_padrao (id_horario_padrao),
    CONSTRAINT uq_turma_codigo_sem UNIQUE (codigo, id_semestre)
);
