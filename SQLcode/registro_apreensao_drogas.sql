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
                      mat.tipo_objeto_descricao,
                      mat.situacao_descricao
               FROM db_bisp_reds_reporting.tb_ocorrencia AS oco
               LEFT JOIN db_bisp_reds_reporting.tb_material_apreendido_ocorrencia AS mat
                    ON oco.numero_ocorrencia = mat.numero_ocorrencia
               WHERE oco.data_hora_fato >= '2023-01-01 00:00:00.000'
               AND oco.data_hora_fato < '2025-02-10 00:00:00.000'
               AND oco.ocorrencia_uf = 'MG'
               AND oco.ind_estado IN ('F', 'R')
               AND mat.situacao_descricao IN ('APREENDIDO', 'RECOLHIDO')
               AND mat.tipo_objeto_descricao IN ('PAPELOTES DE COCAINA', 'PASTA DE COCAINA', 'COCAINA EM PO', 'PINO DE COCAINA', 'OUTROS - COCAINA', 'CRACK EM PEDRAS', 'CRACK EM QUILOGRAMAS', 'OUTROS - CRACK', 'HAXIXE EM BOLA', 'HAXIXE EM TABLETE (QUILOGRAMA)', 'OUTROS - HAXIXE', 'OUTROS - LSD', 'CLOROFORMIO', 'COLA DE SAPATEIRO', 'LANCA-PERFUME', 'LOLO', 'THINNER', 'OUTROS - INALAVEIS', 'BUCHA DE MACONHA', 'CIGARRO DE MACONHA', 'PLANTACAO (PE) DE MACONHA', 'MACONHA PRENSADA (BARRA / TABLETE)', 'SEMENTE DE MACONHA', 'OUTROS - MACONHA', 'ARTANE', 'DIAZEPAN', 'DIEMPAX', 'ECSTASY / MDMA', 'INIBEX', 'ROHYPNOL', 'XAROPE', 'DROGAS K', 'OUTROS - MEDICAMENTOS / SINTETICOS', 'MERLA', 'HEROINA', 'MORFINA', 'OPIO', 'OUTROS - OPIACEOS')
