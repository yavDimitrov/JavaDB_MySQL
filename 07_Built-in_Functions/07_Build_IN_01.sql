


SELECT SUBSTRING(`title`, 1, 3)
FROM `books`;

#01 1. Find Book Titles

SELECT `title`
FROM `books`
WHERE SUBSTRING(`title`, 1, 3) = "The";