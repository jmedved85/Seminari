SELECT * FROM seminar
GO
SELECT COUNT(naziv) FROM seminar s
JOIN predbiljezba p ON s.ID_seminar = p.ID_seminar
GROUP BY s.naziv
GO