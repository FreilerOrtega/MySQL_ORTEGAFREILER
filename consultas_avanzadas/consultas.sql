use universidad_t2;

select apellido1 as apellido_1,apellido2 as apellido_2,nombre as nombre from alumno order by 1,2,3 asc;

select nombre , apellido1, apellido2 
from alumno where telefono is null;



select * from asignatura where cuatrimestre = 1 and curso = 3 and id_grado =7 ;

select * from asignatura a
inner join grado on a.id_grado = grado.id
where grado.nombre = 'Grado en Ingeniería Informática (Plan 2015)';


select * from alumno_se_matricula_asignatura ;
select * from curso_escolar;

select * from alumno al
inner join alumno_se_matricula_asignatura asm on al.id = asm.id_alumno
inner join asignatura a on asm.id_asignatura = a.id
inner join curso_escolar ce on ce.id = asm.id_curso_escolar
where ce.anyo_inicio = '2017' and ce.anyo_fin = '2018' ;

-- Devuelve el número total de alumnas que hay.

select  count(sexo) as alumnas from alumno where sexo = 'M';

-- Calcula cuántos alumnos nacieron en 1999.

select count(fecha_nacimiento) as alumnos_nacidos_en_1999 from alumno where year(fecha_nacimiento) ='1999';


-- Calcula cuántos profesores hay en cada departamento. 
-- El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento.
-- El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.

select d.nombre, count(p.id_departamento ) as num_profesores  from profesor p 
inner join departamento d on p.id_departamento = d.id
group by 1 order by 2 desc;

-- Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos.
-- Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. 
-- Estos departamentos también tienen que aparecer en el listado

select d.nombre, count(p.id_departamento) as num_profesores from departamento d
left join profesor p on d.id = p.id_departamento
group by 1;


-- Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno.
-- Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. 
-- El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.

select * from grado ;
select g.nombre, count(a.id_grado)as cant_asignatura from asignatura a
right join grado g on a.id_grado = g.id
group by 1 order by cant_asignatura desc;


-- Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.

select g.nombre,count(a.id_grado) as cantidad_asignatura  from grado g 
inner join asignatura a on g.id = a.id_grado
group by 1 having cantidad_asignatura >= 40 ;


-- Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura.
-- El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo.
-- Ordene el resultado de mayor a menor por el número total de crédidos.

select gr.nombre,a.tipo,sum(a.creditos) as cantidad_creditos from grado gr
inner join asignatura a on gr.id = a.id_grado
group by a.tipo,gr.nombre
order by 3 desc;

-- Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares.
-- El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.

select ce.anyo_inicio,count(distinct asm.id_alumno) as alumnos_matriculados
from alumno a inner join alumno_se_matricula_asignatura asm on a.id = asm.id_alumno
inner join asignatura asig on asig.id = asm.id_asignatura
inner join curso_escolar ce on ce.id= asm.id_curso_escolar
group by ce.anyo_inicio;