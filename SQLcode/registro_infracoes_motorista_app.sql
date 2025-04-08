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
                      oco.natureza_ind_consumado,
                      oco.ind_transporte_aplicativo,
                      oco.ind_motorista_aplicativo,
                      env.numero_envolvido,
                      env.envolvimento_descricao,
                      env.natureza_ocorrencia_codigo,
                      env.natureza_ocorrencia_descricao,
                      env.qtd_envolvido,
                      env.condicao_fisica_descricao,
                      env.ind_consumado
               FROM db_bisp_reds_reporting.tb_ocorrencia AS oco
               LEFT JOIN db_bisp_reds_reporting.tb_envolvido_ocorrencia AS env
                    ON oco.numero_ocorrencia = env.numero_ocorrencia
               WHERE oco.data_hora_fato >= '2022-01-01 00:00:00.000'
               AND oco.data_hora_fato < '2025-02-01 00:00:00.000'
               AND oco.ocorrencia_uf = 'MG'
               AND oco.ind_estado IN ('F', 'R')
               AND oco.natureza_codigo IN ('K06063', 'K06064', 'K06065', 'K06066', 'K06067', 'K06068', 'K06069', 'K06070', 'K06071', 'K06072', 'K06073', 'K06074', 'K06630', 'K06631', 'K06640', 'K06641', 'K06650', 'K06660', 'K06670', 'K06680', 'K06690', 'K06700', 'K06710', 'K06720', 'K06730', 'K06740', 'K07002', 'K07003', 'K07004', 'K07005', 'K07006', 'K07007', 'K07008', 'K07009', 'K07010', 'K07011', 'K07012', 'K07013', 'K07014', 'K07020', 'K07030', 'K07040', 'K07050', 'K07060', 'K07070', 'K07080', 'K07090', 'K07100', 'K07110', 'K07120', 'K07130', 'K07140', 'K07200', 'K07201', 'K11000', 'K11003', 'K11004', 'K11009', 'K11010', 'K11012', 'K11013', 'K11015', 'K11016', 'K11018', 'K11019', 'K11020', 'K11021', 'K11022', 'K11023', 'K11024', 'K11025', 'K11027', 'K11028', 'K11029', 'K11030', 'K11031', 'K11032', 'K11033', 'K11036', 'K11037', 'K11038', 'K11040', 'K11500', 'K12001', 'K12002', 'K12011', 'K12012', 'K12020', 'K12021', 'K14101', 'K14102', 'K14103', 'K14104', 'K14105', 'K14106', 'K14107', 'K14108', 'K14109', 'K14110', 'K14111', 'K14112', 'K14113', 'K14', '14', 'K14115', 'K14116', 'K14117', 'K14118', 'K14119', 'K14120', 'K14121', 'K14122', 'K14123', 'K15001', 'K15011', 'K15012', 'K15013', 'K15014', 'K15015', 'K16008', 'K16009', 'K16010', 'K16011', 'K16012', 'K16013', 'K16014', 'K16015', 'K16016', 'K16017', 'K16018', 'K16019', 'K16020', 'K16021', 'K16022', 'K16023', 'K16024', 'K16025', 'K16026', 'K16027', 'K16028', 'K16029', 'K16080', 'K16090', 'K16100', 'K16110', 'K16120', 'K16130', 'K16131', 'K16132', 'K16133', 'K16134', 'K16140', 'K16150', 'K16160', 'K16170', 'K16180', 'K16190', 'K16200', 'K16210', 'K16221', 'K16222', 'K16223', 'K16224', 'K16231', 'K16232', 'K16233', 'K16234', 'K16240', 'K16250', 'K16260', 'K16270', 'K16280', 'K16290', 'K17002', 'K17003', 'K17004', 'K17005', 'K17006', 'K17007', 'K17008', 'K17009', 'K17010', 'K17011', 'K17012', 'K17014', 'K17015', 'K17016', 'K17017', 'K17018', 'K17019', 'K17020', 'K17021', 'K17022', 'K17023', 'K17030', 'K17040', 'K17050', 'K17060', 'K17071', 'K17072', 'K17073', 'K17074', 'K17080', 'K17090', 'K17100', 'K171', '0', 'K17120', 'K17140', 'K17150', 'K17160', 'K17170', 'K17180', 'K17190', 'K17200', 'K17210', 'K17220', 'K17230', 'K19581', 'K19582', 'K19583', 'K21001', 'K21011', 'K21012', 'K21013', 'K21014', 'K21015', 'K21016', 'K21017', 'K21018', 'K21501', 'K21502', 'K21503', 'K23001', 'K23002', 'K23003', 'K23004', 'K23005', 'K23006', 'K23007', 'K23011', 'K23012', 'K23013', 'K23014', 'K23015', 'K23021', 'K23022', 'K23023', 'K23024', 'K23025', 'K23031', 'K23032', 'K23033', 'K23041', 'K23042', 'K23043', 'K23044', 'K23045', 'K23046', 'K23047', 'K23051', 'K23052', 'K23053', 'K23054', 'K23061', 'K23062', 'K23063', 'K23071', 'K23072', 'K23073', 'K23074', 'K23075', 'K23076', 'K23077', 'K23078', 'K23079', 'K24036', 'K24037', 'K24038', 'K24039', 'K24040', 'K24041', 'K24042', 'K25183', 'K26056', 'K26070', 'K26154', 'K27089', 'K27090', 'K27091', 'K27092', 'K27093', 'K27094', 'K27095', 'K27096', 'K27097', 'K27098', 'K27999', 'K35041', 'K35411', 'K35412', 'K35413', 'K35414', 'K35415', 'K35416', 'K35417', 'K99000', 'D01213', 'D0121', '', 'D01215', 'D01216', 'D01217', 'D01218', 'D01219', 'D01220', 'D01227', 'D01228', 'D01229', 'D01230', 'D01231', 'D01233', 'D01234', 'D01235', 'D01236', 'D01237', 'D01238', 'D01239', 'D01240', 'D01241', 'D01242', 'D01243', 'D01244', 'D01245', 'D01246', 'D01247', 'D01248', 'D01249', 'D01502', 'D01503', 'D01504', 'D01505', 'D01506', 'D01516', 'D01530', 'D08050', 'D08051', 'D08058', 'D08059', 'D08061', 'D08062', 'D08063', 'D08064', 'D08065', 'D08500', 'D08510', 'D08580', 'D08590', 'D08600', 'D08610', 'D08620', 'D08630', 'D08640', 'D08650', 'D99000', 'B01121', 'B01122', 'B01123', 'B01124', 'B01125', 'B01126', 'B01129', 'B01130', 'B01131', 'B01132', 'B01133', 'B01134', 'B01135', 'B01136', 'B01137', 'B01138', 'B01139', 'B01140', 'B01146', 'B01147', 'B01148', 'B01149', 'B01150', 'B01151', 'B01152', 'B01153', 'B01154', 'B01155', 'B01500', 'B01501', 'B01502', 'B01503', 'B02001', 'B02010', 'B05228', 'B05229', 'B05230', 'B05231', 'B05232', 'B05234', 'B05235', 'B05236', 'B05237', 'B05238', 'B05239', 'B05240', 'B05241', 'B05242', 'B05243', 'B05244', 'B05501', 'B05502', 'B05503', 'B05504', 'B05505', 'B05506', 'B08020', 'B08021', 'B08200', 'B08210', 'B13096', 'B13097', 'B13098', 'B13099', 'B13100', 'B13101', 'B13102', 'B13103', 'B13104', 'B13105', 'B13106', 'B13107', 'B13108', 'B13109', 'B24000', 'B24036', 'B24037', 'B24038', 'B24039', 'B24040', 'B24041', 'B24042', 'B25000', 'B25183', 'B26056', 'B26070', 'B99000', 'C99000', 'C01155', 'C01156', 'C01157', 'C01158', 'C01159', 'C01160', 'C01161', 'C01162', 'C01163', 'C01164', 'C01168', 'C01169', 'C01171', 'C01172', 'C01173', 'C01174', 'C01176', 'C01177', 'C01178', 'C01179', 'C01180', 'C01181', 'C01182', 'C01184', 'C01501', 'C01502', 'C08024', 'C08025', 'C08026', 'C08240', 'C08250', 'C08260', 'C09183', 'C09184', 'C09185', 'C09187', 'C09188', 'C09189', 'C09190', 'C09191', 'C09192', 'C09193', 'C09194', 'C09195', 'C22120', 'C41054', 'I04028', 'I04033', 'I04034', 'I04035', 'I04036', 'I04037', 'I04038', 'I04039', 'I04120', 'I04121', 'I04122', 'I04130', 'I04140', 'I04150', 'I04160', 'I04170', 'I04280', 'I04330', 'I04331', 'I04332', 'I04333', 'I04334', 'I04335', 'I04340', 'I04350', 'I04351', 'I04360', 'I04370', 'I04380', 'I04390', 'I99000')
               AND oco.ind_transporte_aplicativo = 'S'
               AND env.envolvimento_descricao IN ('VITIMA','VITIMA - OUTROS','VITIMA DE ACAO CRIMINAL / CIVEL','VITIMA E PASSAGEIRO (TRANSITO)','VITIMA E PEDESTRE (TRANSITO)','VITIMA E PROPRIETARIO/FUNCIONARIO ESTABELECECIM','CONDUTOR DE VEICULO E VITIMA')
