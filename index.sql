-- Base de datos tienda

-- 1. Llista el nom de tots els productes que hi ha en la taula "producto".
SELECT nombre FROM producto;

-- 2. Llista els noms i els preus de tots els productes de la taula "producto".
SELECT nombre, precio FROM producto;

-- 3. Llista totes les columnes de la taula "producto".
SELECT * FROM producto;
-- o
SHOW COLUMNS FROM producto;

-- 4. Llista el nom dels "productos", el preu en euros i el preu en dòlars nord-americans (USD).
SELECT nombre, precio AS euros, precio * 1.07 AS dolares FROM producto;

-- 5. Llista el nom dels "productos", el preu en euros i el preu en dòlars nord-americans. Utilitza els següents àlies per a les columnes: nom de "producto", euros, dòlars nord-americans.
SELECT nombre AS "nom de producto", precio AS euros, precio * 1.07 AS "dòlars nord-americans" FROM producto;

--6. Llista els noms i els preus de tots els productes de la taula "producto", convertint els noms a majúscula.
SELECT UPPER(nombre), precio FROM producto;

--7. Llista els noms i els preus de tots els productes de la taula "producto", convertint els noms a minúscula.
SELECT LOWER(nombre), precio FROM producto;

-- 8. Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
SELECT nombre, UPPER(LEFT(nombre, 2)) AS dos_primeras_letras FROM fabricante;

--9. Llista els noms i els preus de tots els productes de la taula "producto", arrodonint el valor del preu.
SELECT nombre, ROUND(precio) AS precio_redondeado FROM producto;

--10. Llista els noms i els preus de tots els productes de la taula "producto", truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
SELECT nombre, TRUNCATE(precio, 0) AS precio_truncado FROM producto;

--11. Llista el codi dels fabricants que tenen productes en la taula "producto".
SELECT codigo_fabricante FROM producto;

--12. Llista el codi dels fabricants que tenen productes en la taula "producto", eliminant els codis que apareixen repetits.
SELECT DISTINCT codigo_fabricante FROM producto;

--13. Llista els noms dels fabricants ordenats de manera ascendent.
SELECT nombre FROM fabricante ORDER BY nombre ASC;

--14. Llista els noms dels fabricants ordenats de manera descendent.
SELECT nombre FROM fabricante ORDER BY nombre DESC;

--15. Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

--16. Retorna una llista amb les 5 primeres files de la taula "fabricante".
SELECT * FROM fabricante LIMIT 5;

--17. Retorna una llista amb 2 files a partir de la quarta fila de la taula "fabricante". La quarta fila també s'ha d'incloure en la resposta.
SELECT * FROM fabricante LIMIT 3, 2;

--18. Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podries usar MIN(preu), necessitaries GROUP BY
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

--19. Llista el nom i el preu del producte més car. (Fes servir solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podries usar MAX(preu), necessitaries GROUP BY.
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

--20. Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
SELECT nombre FROM producto WHERE codigo_fabricante = 2;

--21. Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
SELECT p.nombre, p.precio, f.nombre AS fabricante 
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo;

--22. Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
SELECT p.nombre, p.precio, f.nombre AS fabricante 
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo 
ORDER BY f.nombre ASC;

--23. Retorna una llista amb el codi del producte, nom del producte, codi del fabricant i nom del fabricant, de tots els productes de la base de dades.
SELECT p.codigo, p.nombre, f.codigo AS codigo_fabricante, f.nombre AS fabricante
FROM producto p
JOIN fabricante F ON p.codigo_fabricante = f.codigo;

--24. Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio ASC LIMIT 1;

--25. Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio DESC LIMIT 1;

--26. Retorna una llista de tots els productes del fabricant Lenovo.
SELECT p.nombre, f.nombre AS fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Lenovo';

--27. Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
SELECT p.nombre 
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo 
WHERE f.nombre = 'Crucial' AND p.precio > 200;

--28. Retorna una llista amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Sense utilitzar l'operador IN.
SELECT p.nombre, f.nombre AS fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate' ;

--29. Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Usant l'operador IN.
SELECT p.nombre, f.nombre AS fabricante
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo 
WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

--30. Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
SELECT p.nombre, p.precio 
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo 
WHERE f.nombre LIKE '%e';

--31. Retorna un llistat amb el nom i el preu de tots els productes dels fabricants dels quals contingui el caràcter w en el seu nom.
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo 
WHERE f.nombre LIKE '%w%';

--32. Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
SELECT p.nombre, p.precio, f.nombre AS fabricante
FROM producto p
JOIN fabricante f ON p.codigo_fabricante = f.codigo
WHERE p.precio >= 180 
ORDER BY p.precio DESC, p.nombre ASC;

--33. Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
SELECT DISTINCT f.codigo, f.nombre 
FROM fabricante f 
JOIN producto p ON f.codigo = p.codigo_fabricante;

--34. Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
SELECT f.nombre, p.nombre AS producto 
FROM fabricante f 
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

--35. Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
SELECT f.nombre 
FROM fabricante f 
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante 
WHERE p.codigo IS NULL;

--36. Retorna tots els productes del fabricant Lenovo. (Sense utilitzar INNER JOIN).
SELECT p.nombre 
FROM producto p, fabricante f 
WHERE p.codigo_fabricante = f.codigo AND f.nombre = 'Lenovo';

--37. Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense fer servir INNER JOIN).
SELECT * 
FROM producto 
WHERE precio = (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

--38. Llista el nom del producte més car del fabricant Lenovo.
SELECT p.nombre 
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo 
WHERE f.nombre = 'Lenovo' 
ORDER BY p.precio DESC LIMIT 1;

--39. Llista el nom del producte més barat del fabricant Hewlett-Packard.
SELECT p.nombre 
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo 
WHERE f.nombre = 'Hewlett-Packard' 
ORDER BY p.precio ASC LIMIT 1;

--40. Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
SELECT * 
FROM producto 
WHERE precio >= (SELECT MAX(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = 'Lenovo'));

--41. Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
SELECT *
FROM producto p 
JOIN fabricante f ON p.codigo_fabricante = f.codigo 
WHERE f.nombre = 'Asus' AND p.precio > (SELECT AVG(precio) FROM producto WHERE codigo_fabricante = f.codigo);

--Base de dades "Universidad"

--Si us plau, descàrrega la base de dades del fitxer schema_universidad.sql, visualitza el diagrama E-R en un editor i efectua les següents consultes:

--1. Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.
SELECT apellido1, apellido2, nombre
FROM persona
WHERE tipo ='alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;

--2. Esbrina el nom i els dos cognoms dels/les alumnes que no han donat d'alta el seu número de telèfon en la base de dades.
SELECT apellido1, apellido2, nombre
FROM persona
WHERE tipo ='alumno' AND telefono IS NULL;

--3. Retorna el llistat dels/les alumnes que van néixer en 1999.
SELECT apellido1, apellido2, nombre
FROM persona
WHERE tipo ='alumno' AND YEAR(fecha_nacimiento) = 1999;

--4. Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.
SELECT apellido1, apellido2, nombre
FROM persona
WHERE tipo ='profesor' AND telefono IS NULL AND nif LIKE '%K';

--5. Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.
SELECT nombre AS nombre_asignatura
FROM asignatura
WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

--6. Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats/des. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS departamento
FROM persona p
JOIN profesor pr ON p.id = pr.id_profesor 
JOIN departamento d ON pr.id_departamento = d.id
ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

--7. Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.
SELECT a.nombre AS nombre_asignatura, c.anyo_inicio, c.anyo_fin
FROM asignatura a
JOIN alumno_se_matricula_asignatura ama ON a.id = ama.id_asignatura 
JOIN curso_escolar c ON ama.id_curso_escolar = c.id 
JOIN persona p ON ama.id_alumno = p.id
WHERE p.nif = '26902806M';

--8. Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).
SELECT DISTINCT d.nombre
FROM departamento d
JOIN profesor pr ON d.id = pr.id_departamento
JOIN asignatura a ON pr.id_profesor = a.id_profesor
JOIN grado g ON a.id_grado = g.id
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

--9. Retorna un llistat amb tots els/les alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.
SELECT DISTINCT p.nombre, p.apellido1, p.apellido2 
FROM persona p 
JOIN alumno_se_matricula_asignatura ama ON p.id = ama.id_alumno 
JOIN curso_escolar c ON ama.id_curso_escolar = c.id 
WHERE c.anyo_inicio = 2018 AND c.anyo_fin = 2019;

--Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

--1. Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats/des. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.
SELECT d.nombre AS departamento, p.apellido1, p.apellido2, p.nombre 
FROM persona p 
LEFT JOIN profesor pr ON p.id = pr.id_profesor 
LEFT JOIN departamento d ON pr.id_departamento = d.id 
WHERE p.tipo = 'profesor' 
ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

--2. Retorna un llistat amb els professors/es que no estan associats a un departament.
SELECT p.apellido1, p.apellido2, p.nombre 
FROM persona p 
LEFT JOIN profesor pr ON p.id = pr.id_profesor 
WHERE p.tipo = 'profesor' AND pr.id_departamento IS NULL;

--3. Retorna un llistat amb els departaments que no tenen professors/es associats.
SELECT d.nombre
FROM departamento d
LEFT JOIN profesor pr ON d.id = pr.id_departamento
WHERE pr.id_profesor IS NULL;

--4. Retorna un llistat amb els professors/es que no imparteixen cap assignatura.
SELECT p.apellido1, p.apellido2, p.nombre 
FROM persona p 
LEFT JOIN profesor pr ON p.id = pr.id_profesor 
LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor
WHERE p.tipo = 'profesor' AND a.nombre IS NULL;

--5. Retorna un llistat amb les assignatures que no tenen un professor/a assignat.
SELECT a.nombre 
FROM asignatura a 
LEFT JOIN profesor p ON a.id_profesor = p.id_profesor 
WHERE p.id_profesor IS NULL;

--6. Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.
SELECT d.nombre 
FROM departamento d 
LEFT JOIN profesor p ON d.id = p.id_departamento 
LEFT JOIN asignatura a ON p.id_profesor = a.id_profesor 
WHERE a.id IS NULL;

--Consultes resum:

--1. Retorna el nombre total d'alumnes que hi ha.
SELECT COUNT(*) AS total_alumnes 
FROM persona 
WHERE tipo = 'alumno';

--2. Calcula quants/es alumnes van néixer en 1999.
SELECT COUNT(*) AS 1999_alumnes 
FROM persona 
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

--3.Calcula quants/es professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.
SELECT d.nombre AS departamento, COUNT(p.id_profesor) AS num_professors 
FROM departamento d
JOIN profesor p ON d.id = p.id_departamento
GROUP BY d.nombre
ORDER BY COUNT(p.id_profesor) DESC;

--or
SELECT d.nombre AS departamento, COUNT(p.id_profesor) AS num_professors 
FROM departamento d
JOIN profesor p ON d.id = p.id_departamento
GROUP BY departamento
ORDER BY num_professors DESC;

--4.Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Té en compte que poden existir departaments que no tenen professors/es associats/des. Aquests departaments també han d'aparèixer en el llistat.
SELECT d.nombre AS departamento, COUNT(p.id_profesor) AS num_professors 
FROM departamento d
LEFT JOIN profesor p ON d.id = p.id_departamento
GROUP BY departamento
ORDER BY num_professors DESC;

--5. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Té en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.
SELECT g.nombre AS grado, COUNT(a.id) AS num_asignaturas
FROM grado g
LEFT JOIN asignatura a ON g.id = a.id_grado
GROUP BY grado
ORDER BY num_asignaturas DESC;

--6. Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.
SELECT g.nombre AS grado, COUNT(a.id) AS num_asignaturas
FROM grado g
JOIN asignatura a ON g.id = a.id_grado
GROUP BY grado
HAVING num_asignaturas > 40
ORDER BY num_asignaturas DESC;

--7. Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.
SELECT g.nombre AS grau, a.tipo, SUM(a.creditos) AS total_credits 
FROM grado g 
JOIN asignatura a ON g.id = a.id_grado 
GROUP BY grau, a.tipo 
ORDER BY grau, a.tipo;

--8.Retorna un llistat que mostri quants/es alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats/des.
SELECT c.anyo_inicio, COUNT(DISTINCT ama.id_alumno) AS num_alumnes 
FROM curso_escolar c 
JOIN alumno_se_matricula_asignatura ama ON c.id = ama.id_curso_escolar 
GROUP BY c.anyo_inicio;

--9.Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(a.id) AS num_asignaturas
FROM persona p
JOIN profesor pr ON p.id = pr.id_profesor
LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor
WHERE p.tipo = 'profesor'
GROUP BY p.id 
ORDER BY num_asignaturas DESC;

--10. Retorna totes les dades de l'alumne més jove.
SELECT *
FROM persona
WHERE tipo = "alumno"
ORDER BY fecha_nacimiento DESC LIMIT 1;

--11. Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.-
SELECT p.apellido1, p.apellido2, p.nombre 
FROM persona p 
JOIN profesor pr ON p.id = pr.id_profesor 
JOIN departamento d ON pr.id_departamento = d.id
LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor 
WHERE p.tipo = 'profesor' AND a.id IS NULL;