--- Consulta de Proyectos Activos
SELECT p.* FROM proyectos p  WHERE p.activo = 1 ORDER BY p.fecha_inicio

--- Consulta de Gerencias y Coordinaciones ordenado por Gerencia
SELECT c.gerencia_id, g.nombre as gerencia_nombre, c.id as coord_id, c.nombre as coord_nombre 
FROM coordinaciones c 
INNER JOIN gerencias g ON c.gerencia_id = g.id 
ORDER BY g.id

--- Consulta de empleados ordenado por Gerencia y Coordinacion
SELECT  c.gerencia_id,g.nombre as gerencia_nombre, e.coordinacion_id, c.nombre as coord_nombre,
e.nombre,e.apellido,e.codigo_empleado  
FROM empleados e
INNER JOIN coordinaciones c ON e.coordinacion_id = c.id 
INNER JOIN gerencias g ON c.gerencia_id = g.id 
ORDER BY c.gerencia_id, e.coordinacion_id

-- Consulta de empleados por proyecto ordenada por proyecto id
SELECT ep.proyecto_id, p.nombre, ep.empleado_id, e.nombre, e.apellido  
FROM empleados_proyectos ep
INNER JOIN proyectos p ON ep.proyecto_id = p.id
INNER JOIN empleados e ON ep.empleado_id = e.id
ORDER BY ep.proyecto_id

-- Consulta de Proyectos con la cantidad de empleados por proyecto, agrupado por proyecto y ordenado por numero de empleados descendente
SELECT ep.proyecto_id, p.nombre, p.activo, p.fecha_inicio, p.fecha_final, COUNT(ep.empleado_id) as  num_empleados
FROM empleados_proyectos ep
INNER JOIN proyectos p ON ep.proyecto_id = p.id
INNER JOIN empleados e ON ep.empleado_id = e.id
GROUP BY ep.proyecto_id
ORDER BY COUNT(ep.empleado_id) DESC