ALTER TABLE ONLY dchecks ALTER dcheckid DROP DEFAULT,
			 ALTER druleid DROP DEFAULT;
DELETE FROM dchecks WHERE NOT druleid IN (SELECT druleid FROM drules);
ALTER TABLE ONLY dchecks ADD CONSTRAINT c_dchecks_1 FOREIGN KEY (druleid) REFERENCES drules (druleid) ON DELETE CASCADE;
