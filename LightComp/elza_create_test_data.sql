INSERT INTO arr_dao_batch_info(dao_batch_info_id, code, label)
VALUES (1, 'abcd', 'abcd');

INSERT INTO sys_external_system(external_system_id, code, name)
VALUES (1, 'abcde', 'name');

INSERT INTO arr_digital_repository(external_system_id, send_notification)
VALUES (1, false);

INSERT INTO arr_dao_package(dao_package_id, digital_repository_id, fund_id, dao_batch_info_id)
VALUES (1, 1, 1, 1);

INSERT INTO arr_dao(dao_id, dao_package_id, valid, code, dao_type)
VALUES (1, 1, true, 'package#1', 'LEVEL')