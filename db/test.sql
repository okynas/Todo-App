CREATE TABLE IF NOT EXISTS `projects` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`project_id`), 
  FOREIGN KEY (`user_id`) REFERENCES users(`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

INSERT INTO `projects` (`project_id`, `project_name`, `user_id`) VALUES 
(1, "School", 1);

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

INSERT INTO `users` (`user_id`, `username`, `password`) VALUES 
(1, 'Stian', 'Stian');

CREATE TABLE IF NOT EXISTS `tasks` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `archived` BOOLEAN DEFAULT 0,
  `date` varchar(255) NOT NULL,
  `project_id` int(11) NOT NULL,
  `task` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`task_id`),
  FOREIGN KEY (`project_id`) REFERENCES projects(`project_id`),
  FOREIGN KEY (`user_id`) REFERENCES users(`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

INSERT INTO `tasks` (`task_id`, `archived`, `date`, `project_id`, `task`, `user_id`) VALUES 
(1, 0, "29-09-20", 1, "test-todo", 1),
(2, 0, "29-09-20", 1, "test-todo2", 1);



/*

SELECT *
FROM projects
INNER JOIN users
ON projects.user_id = users.user_id;

SELECT 
*
FROM tasks
INNER JOIN projects
    on tasks.project_id = projects.project_id
INNER JOIN users
    on projects.user_id = users.user_id

// 1 indicate user number 1.
SELECT * FROM tasks
INNER JOIN projects
    on tasks.project_id = projects.project_id
INNER JOIN users
    on projects.user_id = users.user_id
WHERE users.user_id=1

// only get one of id's
SELECT 
tasks.task_id,
tasks.archived,
tasks.date, 
tasks.project_id,
tasks.task, 
tasks.user_id, 
projects.name, 
users.name
FROM tasks
INNER JOIN projects
    on tasks.project_id = projects.project_id
INNER JOIN users
    on projects.user_id = users.user_id
WHERE users.user_id=1

*/

