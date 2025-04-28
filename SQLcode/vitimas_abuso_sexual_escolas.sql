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
                      oco.natureza_codigo,
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
                      oco.local_imediato_longa,
                      env.qtd_envolvido,
                      env.numero_envolvido,
                      env.valor_idade_aparente,
                      env.envolvimento_descricao,
                      env.natureza_ocorrencia_descricao,
                      env.cor_pele_descricao,
                      env.codigo_sexo,
                      env.ind_consumado
               FROM db_bisp_reds_reporting.tb_ocorrencia AS oco
               LEFT JOIN db_bisp_reds_reporting.tb_envolvido_ocorrencia AS env
                    ON oco.numero_ocorrencia = env.numero_ocorrencia
               WHERE oco.data_hora_fato >= '2015-01-01 00:00:00.000'
               AND oco.data_hora_fato < '2025-02-01 00:00:00.000'
               AND oco.natureza_codigo IN ('D01502','D01502','D01214','B05505','D01218','D01213','D01217','D01504','D01228','D08061','D08610','D01505','D99000','D01215','B05501','D01230','D01530','D01217','B05501','V03022')
               AND oco.ocorrencia_uf = 'MG'
               AND oco.ind_estado IN ('F', 'R')
               AND oco.local_imediato_longa IN ('CRECHE', 'INSTITUICAO DE ENSINO PARTICULAR', 'INSTITUICAO DE ENSINO PUBLICO ESTADUAL', 'INSTITUICAO DE ENSINO PUBLICO FEDERAL', 'INSTITUICAO DE ENSINO PUBLICO MUNICIPAL')
               AND env.envolvimento_descricao IN ('VITIMA','VITIMA - OUTROS','VITIMA DE ACAO CRIMINAL / CIVEL','VITIMA E PASSAGEIRO (TRANSITO)','VITIMA E PEDESTRE (TRANSITO)','VITIMA E PROPRIETARIO/FUNCIONARIO ESTABELECECIM','CONDUTOR DE VEICULO E VITIMA')
