
/*=================================================================================================================================================================
                         --=================================     PROYECTS       ---------------------
=================================================================================================================================================================
*/
INSERT INTO Projects (project_id, project_key, project_name, description, project_enabled, client_id, author_id)

VALUES ( unhex('CAAAAAAABBBBCCCCDDDDEEEEEEEEEEE1'), "PROJECT_X","Project X",

"Proyecto super asombroso", 1,unhex('FE3F7DBF751545C29D31F8A7658CDB13'),unhex('00000000000000000000000000000001'));



INSERT INTO Projects ( project_id, project_key, project_name, description, project_enabled, client_id, author_id)

VALUES ( unhex('CAAAAAAABBBBCCCCDDDDEEEEEEEEEEE2'), "PROJECT_A","Project A",

"Proyecto para usuarios", 1,unhex('FE3F7DBF751545C29D31F8A7658CDB14'),unhex('00000000000000000000000000000002'));




INSERT INTO Projects (project_id, project_key, project_name, description, project_enabled, client_id, author_id)

VALUES ( unhex('CAAAAAAABBBBCCCCDDDDEEEEEEEEEEE3'), "PROJECT_B","Project B",

"Proyecto para clientes", 1,unhex('FE3F7DBF751545C29D31F8A7658CDB15'),unhex('00000000000000000000000000000003'));




INSERT INTO Projects (project_id, project_key, project_name, description, project_enabled, client_id, author_id)

VALUES ( unhex('CAAAAAAABBBBCCCCDDDDEEEEEEEEEEE4'), "PROJECT_C","Project C",

"Proyecto para noticias", 1,unhex('FE3F7DBF751545C29D31F8A7658CDB16'),unhex('00000000000000000000000000000004'));




INSERT INTO Projects (project_id, project_key, project_name, description, project_enabled, client_id, author_id)

VALUES ( unhex('CAAAAAAABBBBCCCCDDDDEEEEEEEEEEE5'), "PROJECT_D","Project D",

"Proyecto para proyectos",1,unhex('FE3F7DBF751545C29D31F8A7658CDB17'),unhex('00000000000000000000000000000005'));




INSERT INTO Projects (project_id, project_key, project_name, description, project_enabled, client_id, author_id)

VALUES ( unhex('CAAAAAAABBBBCCCCDDDDEEEEEEEEEEE6'), "PROJECT_E","Project E",

"Proyecto para activity record",1,unhex('FE3F7DBF751545C29D31F8A7658CDB18'),unhex('00000000000000000000000000000006'));




INSERT INTO Projects ( project_id, project_key, project_name, description, project_enabled, client_id, author_id)

VALUES ( unhex('CAAAAAAABBBBCCCCDDDDEEEEEEEEEEE7'), "PROJECT_F","Project F",

"Proyecto para dockerizar",1,unhex('FE3F7DBF751545C29D31F8A7658CDB19'),unhex('00000000000000000000000000000007'));

/*=================================================================================================================================================================
                              --=================================     ACTIVITY       ---------------------
=================================================================================================================================================================
*/
INSERT INTO Activities ( activity_id, activity_key, activity_name, description, activity_enabled, author_id)
VALUES              ( unhex('AAAAAAAABBBBCCCCDDDDEEEEEEEEEEE1'),  'ACTIVITY_A_KEY','ACTIVIDAD CLIENTES',
                    '-- CLIENTES',1, unhex('00000000000000000000000000000001'));


INSERT INTO Activities ( activity_id, activity_key, activity_name, description, activity_enabled, author_id)
VALUES              ( unhex('AAAAAAAABBBBCCCCDDDDEEEEEEEEEEE2'),  'ACTIVITY_B_KEY','ACTIVIDAD DE USUARIOS',
                    '-- USUARIOS',1, unhex('00000000000000000000000000000002'));


INSERT INTO Activities (activity_id,  activity_key, activity_name, description, activity_enabled, author_id)
VALUES              ( unhex('AAAAAAAABBBBCCCCDDDDEEEEEEEEEEE3'),  'ACTIVITY_C_KEY','ACTIVIDAD DE NEWS',
                    '-- NEWS',1, unhex('00000000000000000000000000000003'));


INSERT INTO Activities (activity_id,  activity_key, activity_name, description, activity_enabled, author_id)
VALUES              (  unhex('AAAAAAAABBBBCCCCDDDDEEEEEEEEEEE4'), 'ACTIVITY_D_KEY','ACTIVIDAD DE PROJECTS',
                    '-- PROJECTS',1, unhex('00000000000000000000000000000004'));


INSERT INTO Activities (activity_id,  activity_key, activity_name, description, activity_enabled, author_id)
VALUES              (  unhex('AAAAAAAABBBBCCCCDDDDEEEEEEEEEEE5'), 'ACTIVITY_E_KEY','ACTIVITY DE RECORD',
                    '-- RECORD',1, unhex('00000000000000000000000000000005'));


INSERT INTO Activities (activity_id,  activity_key, activity_name, description, activity_enabled, author_id)
VALUES              ( unhex('AAAAAAAABBBBCCCCDDDDEEEEEEEEEEE6'),  'ACTIVITY_F_KEY','ACTIVITY DE JENKINS',
                    '--jenkins',1, unhex('00000000000000000000000000000007'));


INSERT INTO Activities (activity_id,  activity_key, activity_name, description, activity_enabled, author_id)
VALUES              ( unhex('AAAAAAAABBBBCCCCDDDDEEEEEEEEEEE7'), 'ACTIVITY_X_KEY','Nombre de la actividad',
                    'Descripción de la actividad',1, unhex('00000000000000000000000000000008'));

/*=================================================================================================================================================================
                        =================================     ACTIVITY_RECORD      ---------------------
=================================================================================================================================================================
*/

INSERT INTO ActivityRecord (activity_duration, activity_record_date,activity_record_enabled,project_id, user_id, activity_id)
VALUES              ('2','2020-08-26',1,unhex('CAAAAAAABBBBCCCCDDDDEEEEEEEEEEE1'),
                                        unhex('00000000000000000000000000000001'),
                                        unhex('AAAAAAAABBBBCCCCDDDDEEEEEEEEEEE1'));

INSERT INTO ActivityRecord (activity_duration, activity_record_date,activity_record_enabled,project_id, user_id, activity_id)
VALUES              ('2','2020-08-26',1,unhex('CAAAAAAABBBBCCCCDDDDEEEEEEEEEEE2'),
                                        unhex('00000000000000000000000000000002'),
                                        unhex('AAAAAAAABBBBCCCCDDDDEEEEEEEEEEE2'));

INSERT INTO ActivityRecord (activity_duration, activity_record_date,activity_record_enabled,project_id, user_id, activity_id)
VALUES              ('2','2020-08-26',1,unhex('CAAAAAAABBBBCCCCDDDDEEEEEEEEEEE3'),
                                        unhex('00000000000000000000000000000003'),
                                        unhex('AAAAAAAABBBBCCCCDDDDEEEEEEEEEEE3'));

INSERT INTO ActivityRecord (activity_duration, activity_record_date,activity_record_enabled,project_id, user_id, activity_id)
VALUES              ('2','2020-08-26',1,unhex('CAAAAAAABBBBCCCCDDDDEEEEEEEEEEE4'),
                                        unhex('00000000000000000000000000000004'),
                                        unhex('AAAAAAAABBBBCCCCDDDDEEEEEEEEEEE4'));

INSERT INTO ActivityRecord (activity_duration, activity_record_date,activity_record_enabled,project_id, user_id, activity_id)
VALUES              ('2','2020-08-26',1,unhex('CAAAAAAABBBBCCCCDDDDEEEEEEEEEEE5'),
                                        unhex('00000000000000000000000000000005'),
                                        unhex('AAAAAAAABBBBCCCCDDDDEEEEEEEEEEE5'));

INSERT INTO ActivityRecord (activity_duration, activity_record_date,activity_record_enabled,project_id, user_id, activity_id)
VALUES              ('2','2020-08-26',1,unhex('CAAAAAAABBBBCCCCDDDDEEEEEEEEEEE6'),
                                        unhex('00000000000000000000000000000006'),
                                        unhex('AAAAAAAABBBBCCCCDDDDEEEEEEEEEEE6'));

INSERT INTO ActivityRecord (activity_duration, activity_record_date,activity_record_enabled,project_id, user_id, activity_id)
VALUES              ('2','2020-08-26',1,unhex('CAAAAAAABBBBCCCCDDDDEEEEEEEEEEE7'),
                                        unhex('00000000000000000000000000000007'),
                                        unhex('AAAAAAAABBBBCCCCDDDDEEEEEEEEEEE7'));


