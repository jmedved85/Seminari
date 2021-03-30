SELECT COUNT(naziv) AS "Broj polaznika" FROM seminar s
JOIN predbiljezba p ON s.ID_seminar = p.ID_seminar
GROUP BY s.naziv
GO
