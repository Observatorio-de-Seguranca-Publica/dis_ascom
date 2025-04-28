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
                      env.qtd_envolvido,
                      env.condicao_fisica_descricao
               FROM db_bisp_reds_reporting.tb_ocorrencia AS oco
               LEFT JOIN db_bisp_reds_reporting.tb_envolvido_ocorrencia AS env
                    ON oco.numero_ocorrencia = env.numero_ocorrencia
               WHERE oco.data_hora_fato >= '2022-01-01 00:00:00.000'
               AND oco.data_hora_fato < '2025-01-01 00:00:00.000'
               AND oco.ocorrencia_uf = 'MG'
               AND oco.ind_estado IN ('F', 'R')
               AND env.envolvimento_descricao IN ('VITIMA','VITIMA - OUTROS','VITIMA DE ACAO CRIMINAL / CIVEL','VITIMA E PASSAGEIRO (TRANSITO)','VITIMA E PEDESTRE (TRANSITO)','VITIMA E PROPRIETARIO/FUNCIONARIO ESTABELECECIM','CONDUTOR DE VEICULO E VITIMA')
               AND env.natureza_ocorrencia_descricao = 'ABANDONO DE INCAPAZ'
               AND env.ind_consumado = 'S'
