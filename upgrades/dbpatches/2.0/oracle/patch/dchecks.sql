ALTER TABLE dchecks MODIFY dcheckid DEFAULT NULL;
ALTER TABLE dchecks MODIFY druleid DEFAULT NULL;
DELETE FROM dchecks WHERE NOT druleid IN (SELECT druleid FROM drules);
ALTER TABLE dchecks ADD CONSTRAINT c_dchecks_1 FOREIGN KEY (druleid) REFERENCES drules (druleid) ON DELETE CASCADE;
