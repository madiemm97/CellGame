﻿--Allow answers to point to a ID Whether or not it is in a scenario
--THESE WILL ONLY BE USED TO SEND SOMEONE TO WINNER/LOSER SCREEN

--SET IDENTITY_INSERT SCENARIOS ON
--INSERT INTO SCENARIOS (SCENARIO_ID, SCENARIO_NAME, SCENARIO_DESCRIPTION, SCENARIO_FIRST_QUESTION) VALUES (0,'WINNER/LOSER','WINNER/LOSER',0);
--SET IDENTITY_INSERT SCENARIOS OFF
--SET IDENTITY_INSERT QUESTIONS ON
--INSERT INTO QUESTIONS (QUESTION_ID, QUESTION_TITLE, QUESTION_SCENARIO, QUESTION_DESCRIPTION, QUESTION_NUM_IN_SCENARIO) VALUES (0, 'Winner', 0, 'Winner', 0);
--INSERT INTO QUESTIONS (QUESTION_ID, QUESTION_TITLE, QUESTION_SCENARIO, QUESTION_DESCRIPTION, QUESTION_NUM_IN_SCENARIO) VALUES (-1, 'LOSER', 0, 'LOSER', 0);
--SET IDENTITY_INSERT QUESTIONS OFF


-- test scenario

--INSERT INTO SCENARIOS (SCENARIO_NAME, SCENARIO_DESCRIPTION) VALUES ('TEST SCENARIO','SCENARIO DESCRIPTION')

--INSERT INTO ANSWERS(ANSWER_FOR_QUESTION, ANSWER_TEXT) VALUES (1, 'QUESTION DESCRIPTION')

--INSERT INTO QUESTIONS (QUESTION_TITLE, QUESTION_SCENARIO, QUESTION_DESCRIPTION, QUESTION_NUM_IN_SCENARIO) VALUES ('QUESTION 1', 1, 'QUESTION DESCRIPTION', 1)
--INSERT INTO QUESTIONS (QUESTION_TITLE, QUESTION_SCENARIO, QUESTION_DESCRIPTION, QUESTION_NUM_IN_SCENARIO) VALUES ('QUESTION 2', 1, 'QUESTION DESCRIPTION', 2)

--INSERT INTO ANSWERS (ANSWER_FOR_QUESTION, ANSWER_TEXT, ANSWER_NUM_IN_QUESTION, ANSWER_REFERENCES) VALUES (7, 'ANSWER 1', 1, 8)
--INSERT INTO ANSWERS (ANSWER_FOR_QUESTION, ANSWER_TEXT, ANSWER_NUM_IN_QUESTION, ANSWER_REFERENCES) VALUES (7, 'ANSWER 2', 2, 8)
--INSERT INTO ANSWERS (ANSWER_FOR_QUESTION, ANSWER_TEXT, ANSWER_NUM_IN_QUESTION, ANSWER_REFERENCES) VALUES (7, 'ANSWER 3', 3, 8)
--INSERT INTO ANSWERS (ANSWER_FOR_QUESTION, ANSWER_TEXT, ANSWER_NUM_IN_QUESTION, ANSWER_REFERENCES) VALUES (7, 'ANSWER 4', 4, 8)

--INSERT INTO ANSWERS (ANSWER_FOR_QUESTION, ANSWER_TEXT, ANSWER_NUM_IN_QUESTION, ANSWER_REFERENCES) VALUES (8, 'ANSWER 1', 1, 7)
--INSERT INTO ANSWERS (ANSWER_FOR_QUESTION, ANSWER_TEXT, ANSWER_NUM_IN_QUESTION, ANSWER_REFERENCES) VALUES (8, 'ANSWER 2', 2, 7)
--INSERT INTO ANSWERS (ANSWER_FOR_QUESTION, ANSWER_TEXT, ANSWER_NUM_IN_QUESTION, ANSWER_REFERENCES) VALUES (8, 'ANSWER 3', 3, 7)
--INSERT INTO ANSWERS (ANSWER_FOR_QUESTION, ANSWER_TEXT, ANSWER_NUM_IN_QUESTION, ANSWER_REFERENCES) VALUES (8, 'ANSWER 4', 4, 7)


--Example Scenario 1
--
--These are some statements that I think should create a new scenario. There are only two questions, each with two possible answers. Picking the wrong answer
--for the first question leads to a question with no answers, meaning it's the end. They died.
--

--INSERT INTO SCENARIOS (SCENARIO_NAME, SCENARIO_DESCRIPTION) VALUES ('Hiking', 'To divide, or not to divide? That is the question.')
--INSERT INTO QUESTIONS (QUESTION_TITLE, QUESTION_SCENARIO, QUESTION_DESCRIPTION, QUESTION_NUM_IN_SCENARIO) VALUES ('On a hike!!', 2,
--                                                                              'Sheila's blood glucose is around 65 mg/dL. There is a debate in your heighborhood - some argue That
--                                                                               increasing the number of cells will help provide Sheila with more energy, others argue that they are
--                                                                               too tired to divide.', 0)
--INSERT INTO ANSWERS (ANSWER_FOR_QUESTION, ANSWER_TEXT, ANSWER_REFERENCES) VALUES (0, 'That's a great idea, more cells = more energy! Move to S phase.', ID FOR NEXT QUESTION)
--INSERT INTO QUENSIONS (QUESTION_TITLE, QUESTION_SCENARIO, QUESTION_DESCRIPTION, QUESTION_NUM_IN_SCENARIO) VALUES ('Bad choice.', 2,
--                                                                              'You will now proceed to S phase. You get to continue for a bit, but you will die because of your
--                                                                               decision to enter a sickly S phase.', 1)


--INSERT INTO ANSWERS (ANSWER_FOR_QUESTION, ANSWER_TEXT, ANSWER_REFERENCES) VALUES (12, 'Ehh, is it lazy to not divide? I think I'll wait.', 14)
--INSERT INTO QUENSIONS (QUESTION_TITLE, QUESTION_SCENARIO, QUESTION_DESCRIPTION, QUESTION_NUM_IN_SCENARIO) VALUES ('Finally, some food!!', 2,
--                                                                              'Simon and Sheila finally reach the car. They find a melted chocolate bar under the seat and share it.
--                                                                               This raises Sheila's blood glucose level to 120 mg/dL. You are at a crossroads. What will you do?', 2)

--INSERT INTO ANSWERS (ANSWER_FOR_QUESTION, ANSWER_TEXT, ANSWER_REFERENCES) VALUES (0, 'Move to the next stage of life: S phase.', ID FOR NEXT QUESTION)
--INSERT INTO QUESTION (QUESTION_TITLE, QUESTION_SCENARIO, QUESTION_DESCRIPTION, QUESTION_NUM_IN_SCENARIO) VALUES ('You made it!!', 2,
--                                                                              'You will now proceed to S phase. This is a healthy pathway.', 3)

--INSERT INTO ANSWERS (ANSWER_FOR_QUESTION, ANSWER_TEXT, ANSWER_REFERENCES) VALUES (0, 'Dividing is a lot of work. You decide to remove youreself from the cell cycle and enter G0.', ID FOR NEXT QUESTION)
--INSERT INTO QUENSIONS (QUESTION_TITLE, QUESTION_SCENARIO, QUESTION_DESCRIPTION, QUESTION_NUM_IN_SCENARIO) VALUES ('Sorry, bad choice.', 2,
--                                                                              'You have made a poor decision to delay movement to S phase, you were clearly ready.', 4)


--INSERT INTO QUESTIONS (QUESTION_TITLE, QUESTION_SCENARIO, QUESTION_DESCRIPTION, QUESTION_NUM_IN_SCENARIO) VALUES ('Sorry, bad choice.', 2, 'You have made a poor decision to delay movement to S phase, you were clearly ready.', 4)
--INSERT INTO ANSWERS (ANSWER_FOR_QUESTION, ANSWER_TEXT, ANSWER_REFERENCES, ANSWER_NUM_IN_QUESTION) VALUES (16, 'Sorry, you lose. Go back to the beginning.', 12, 1);

SELECT * FROM QUESTIONS
SELECT * FROM ANSWERS

--UPDATE ANSWERS
--SET ANSWER_REFERENCES = 0
--WHERE ANSWER_ID = 65;


DECLARE @SCENARIO_TO_DELETE INT;
SET @SCENARIO_TO_DELETE = 34;
DELETE FROM ANSWER_QUESTIONS WHERE ANSWER_QUESTIONS.QUESTION_REFERENCE_ID IN (SELECT QUESTIONS.QUESTION_ID FROM QUESTIONS WHERE QUESTIONS.QUESTION_SCENARIO = @SCENARIO_TO_DELETE);
DELETE FROM ANSWER_QUESTIONS WHERE ANSWER_QUESTIONS.ANSWER_ID IN (SELECT ANSWERS.ANSWER_ID FROM ANSWERS WHERE ANSWERS.ANSWER_FOR_QUESTION IN (SELECT QUESTIONS.QUESTION_ID FROM QUESTIONS WHERE QUESTIONS.QUESTION_SCENARIO = @SCENARIO_TO_DELETE));
DELETE FROM ANSWERS WHERE ANSWERS.ANSWER_FOR_QUESTION IN (SELECT QUESTIONS.QUESTION_ID FROM QUESTIONS WHERE QUESTIONS.QUESTION_SCENARIO = @SCENARIO_TO_DELETE);
DELETE FROM QUESTIONS WHERE QUESTIONS.QUESTION_SCENARIO = @SCENARIO_TO_DELETE;
DELETE FROM SCENARIOS WHERE SCENARIO_ID = @SCENARIO_TO_DELETE;
SELECT * FROM SCENARIOS;

ALTER TABLE SCENARIOS
  ADD SCENARIO_CELL_FUNCTION VARCHAR (1000),
   SCENARIO_CELL_SHAPE_AND_FEATURES VARCHAR (1000),
   SCENARIO_CELL_LIFESPAN VARCHAR (1000),
   SCENARIO_CELL_NUTRITION VARCHAR (1000);

ALTER TABLE SCENARIOS
	ALTER COLUMN SCENARIO_NAME VARCHAR (100);
ALTER TABLE SCENARIOS
	ALTER COLUMN SCENARIO_DESCRIPTION VARCHAR (1000);

ALTER TABLE ANSWERS
	ADD ANSWER_REQUIRES_COMMENT BIT NOT NULL
	
	
DBCC CHECKIDENT ('[SCENARIOS]',RESEED,-1);
DBCC CHECKIDENT ('[QUESTIONS]',RESEED,-1);
DBCC CHECKIDENT ('[ANSWERS]',RESEED,0);
DBCC CHECKIDENT ('[SCENARIOS_TO_GRADE]',RESEED,0);
DBCC CHECKIDENT ('[STUDENT_ANSWERS]',RESEED,0);
