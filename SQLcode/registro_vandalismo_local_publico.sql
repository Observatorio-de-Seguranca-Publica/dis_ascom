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
               WHERE oco.data_hora_fato >= '2023-01-01 00:00:00.000'
               AND oco.data_hora_fato < '2025-03-01 00:00:00.000'
               AND oco.ocorrencia_uf = 'MG'
               AND oco.ind_estado IN ('F', 'R')
               AND oco.natureza_codigo = 'C01163'
               AND oco.local_imediato_longa IN ('CADEIA PUBLICA', 'CAMARA MUNICIPAL', 'CAPELA/ IGREJA/ TEMPLO RELIGIOSO', 'CASA OU POSTO DE SAÚDE', 'CEMITERIO/ CREMATORIO', 'CENTRO DE CONVENCAO/ EXPOSICAO/ AUDITORIO', 'CENTRO DE REEDUCACAO', 'CONSULADO', 'FORUM ', 'INSTITUICAO DE ENSINO PARTICULAR ', 'INSTITUICAO DE ENSINO PUBLICO ESTADUAL', 'INSTITUICAO DE ENSINO PUBLICO FEDERAL', 'INSTITUICAO DE ENSINO PUBLICO MUNICIPAL ', 'JARDIM/ PARQUE/ PRACA ', 'LOCAL DE EVENTO', 'ESPORTIVO/ ESTADIO/ AUTODROMO', 'MANICOMIO', 'MICROONIBUS', 'ONIBUS ', 'ORGAO DE DEFESA SOCIAL', 'ORGAO/ SECRETARIA FEDERAL', 'ORGAO/ SECRETARIA ESTADUAL ', 'ORGAO/SECRETARIA MUNICIPAL ', 'OUTROS - INSTITUICOES PUBLICAS', 'PARQUE ESTADUAL', 'PARQUE MUNICIPAL', 'PARQUE NACIONAL', 'PENITENCIARIA ', 'PREFEITURA', 'PRONTO-SOCORRO ', 'SECRETARIA FEDERAL/ ESTADUAL/ MUNICIPAL ', 'UNIDADE DA POLÍCIA CIVIL', 'UNIDADE DA POLÍCIA MILITAR ', 'UNIDADE DO CORPO DE BOMBEIROS MILITAR', 'VIA DE ACESSO PUBLICA E ZOOLOGICO')
