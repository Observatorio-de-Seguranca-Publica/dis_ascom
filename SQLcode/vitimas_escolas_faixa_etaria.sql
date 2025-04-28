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
                      env.numero_envolvido,
                      env.valor_idade_aparente,
                      env.envolvimento_descricao,
                      env.natureza_ocorrencia_codigo,
                      env.natureza_ocorrencia_descricao,
                      env.ind_consumado,
                      env.qtd_envolvido,
                      env.codigo_sexo,
                      env.valor_idade_aparente,
                      env.condicao_fisica_descricao,
                      env.cor_pele_descricao,
                      CASE 
                        WHEN env.valor_idade_aparente IS NULL THEN 'Não informado'
                        WHEN env.valor_idade_aparente = 0 THEN '0'
                        WHEN env.valor_idade_aparente BETWEEN 1 AND 5 THEN '01 a 05'
                        WHEN env.valor_idade_aparente BETWEEN 6 AND 11 THEN '06 a 11'
                        WHEN env.valor_idade_aparente BETWEEN 12 AND 17 THEN '12 a 17'
                        WHEN env.valor_idade_aparente BETWEEN 18 AND 23 THEN '18 a 23'
                        WHEN env.valor_idade_aparente BETWEEN 24 AND 29 THEN '24 a 29'
                        WHEN env.valor_idade_aparente BETWEEN 30 AND 34 THEN '30 a 34'
                        WHEN env.valor_idade_aparente BETWEEN 35 AND 39 THEN '35 a 39'
                        WHEN env.valor_idade_aparente BETWEEN 40 AND 44 THEN '40 a 44'
                        WHEN env.valor_idade_aparente BETWEEN 45 AND 49 THEN '45 a 49'
                        WHEN env.valor_idade_aparente BETWEEN 50 AND 54 THEN '50 a 54'
                        WHEN env.valor_idade_aparente BETWEEN 55 AND 59 THEN '55 a 59'
                        WHEN env.valor_idade_aparente BETWEEN 60 AND 64 THEN '60 a 64'
                        WHEN env.valor_idade_aparente BETWEEN 65 AND 69 THEN '65 a 69'
                        WHEN env.valor_idade_aparente BETWEEN 70 AND 79 THEN '70 a 79'
                        WHEN env.valor_idade_aparente BETWEEN 80 AND 89 THEN '80 a 89'
                        WHEN env.valor_idade_aparente BETWEEN 90 AND 99 THEN '90 a 99'
                        ELSE 'Não informado'
                    END AS faixa_etaria
               FROM db_bisp_reds_reporting.tb_ocorrencia AS oco
               LEFT JOIN db_bisp_reds_reporting.tb_envolvido_ocorrencia AS env
                    ON oco.numero_ocorrencia = env.numero_ocorrencia
               WHERE oco.data_hora_fato >= '2024-01-01 00:00:00.000'
               AND oco.data_hora_fato < '2025-03-01 00:00:00.000'
               AND oco.ocorrencia_uf = 'MG'
               AND oco.ind_estado IN ('F', 'R')
               AND env.envolvimento_codigo IN ('1300','1301','1302','1303','1304','1305','1399')
               AND env.ind_consumado = 'S'
               AND (env.natureza_ocorrencia_codigo LIKE '%B%'
               OR env.natureza_ocorrencia_codigo LIKE '%C%'
               OR env.natureza_ocorrencia_codigo LIKE '%D%'
               OR env.natureza_ocorrencia_codigo LIKE '%I%'
               OR env.natureza_ocorrencia_codigo LIKE '%K%')
               AND oco.local_imediato_codigo IN ('1101','1102','1103','1104','1105')
