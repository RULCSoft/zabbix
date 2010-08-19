ALTER TABLE drules MODIFY druleid DEFAULT NULL;
ALTER TABLE drules MODIFY proxy_hostid DEFAULT NULL;
ALTER TABLE drules MODIFY proxy_hostid NULL;
ALTER TABLE drules MODIFY unique_dcheckid DEFAULT NULL;
ALTER TABLE drules MODIFY unique_dcheckid NULL;
UPDATE drules SET proxy_hostid=NULL WHERE NOT proxy_hostid IN (SELECT hostid FROM hosts);
UPDATE drules SET unique_dcheckid=NULL WHERE NOT unique_dcheckid IN (SELECT dcheckid FROM dchecks);
ALTER TABLE drules ADD CONSTRAINT c_drules_1 FOREIGN KEY (proxy_hostid) REFERENCES hosts (hostid);
ALTER TABLE drules ADD CONSTRAINT c_drules_2 FOREIGN KEY (unique_dcheckid) REFERENCES dchecks (dcheckid);
