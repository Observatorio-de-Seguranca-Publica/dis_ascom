SELECT oco.numero_ocorrencia,
                      oco.qtd_ocorrencia,
                      oco.natureza_descricao,
                      oco.natureza_consumado,
                      CAST (oco.data_hora_fato as date) as data_fato,
                      YEAR (oco.data_hora_fato) as ano_fato,
                      MONTH (oco.data_hora_fato) as mes_numerico_fato,
                      SUBSTRING(CAST(oco.data_hora_fato AS STRING), 12, 8) AS horario_fato,
                      oco.motivo_presumido_descricao_longa,
                      oco.instrumento_utilizado_descricao_longa,
                      oco.local_imediato_longa,
                      oco.complemento_natureza_descricao,
                      oco.tipo_logradouro_descricao,
                      oco.descricao_endereco,
                      oco.nome_bairro,
                      oco.nome_municipio,
                      oco.codigo_municipio,
                      oco.ocorrencia_uf,
                      oco.unidade_responsavel_registro_nome,
                      oco.numero_latitude,
                      oco.numero_longitude,
                      oco.tipo_local_descricao,
                      oco.natureza_ind_consumado
               FROM db_bisp_reds_reporting.tb_ocorrencia AS oco
               WHERE oco.data_hora_fato >= '2020-01-01 00:00:00.000'
               AND oco.data_hora_fato < '2025-02-01 00:00:00.000'
               AND oco.ocorrencia_uf = 'MG'
               AND oco.ind_estado IN ('F', 'R')
               AND oco.natureza_codigo IN ('K07002', 'K07003', 'K07004', 'K07005', 'K07006', 'K07007', 'K07008', 'K07009', 'K07010', 'K07011', 'K07012', 'K07013', 'K07014', 'K07020', 'K07030', 'K07040', 'K07050', 'K07060', 'K07070', 'K07080', 'K07090', 'K07100', 'K07110', 'K07120', 'K07130', 'K07140', 'K07200', 'K07201')
               AND oco.natureza_consumado = 'CONSUMADO'
