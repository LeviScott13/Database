/*************************/
/*Name: Levi Sutton      */
/*Term: Spring 2019      */
/*Lab 3 Part 1		 */
/*************************/

/* Multiplication */

/* What are all the possible combinations of pets and owners? */

SELECT ID, Owner, Owner_ID
FROM PET, OWNER;


/* Join */

/* Who are the pets and who are their owners? */

SELECT ID, Owner, Owner_ID
FROM PET, OWNER
WHERE PET.Owner_ID = OWNER.Owner_ID;

/* What are the pet names,species, breeds, and owner names? */

SELECT Names, Species, Breed, OwnerName
FROM PET, OWNER
WHERE PET.Owner_ID = OWNER.Owner_ID;

/* What are the pet ID's and owner ID's? */

SELECT ID, Owner_ID
FROM PET, OWNER
WHERE PET.Owner_ID = OWNER.Owner_ID;


/* Outer Join */

/* Who are the pets and their owners, as well as people without pets? */

SELECT Names, OwnerName
FROM PET, OWNER
WHERE PET.OwnerId(+) = OWNER.Owner_ID;

/* What are the pet ID's and owner ID's of the pets and their owners, as well as people
without pets? */

SELECT ID, OWNER.Owner_ID, OWNER.Ownername
FROM PET, OWNER
WHERE PET.Owner_ID(+) = Owner.Owner_ID;

/* What are the pet names,species, breeds, and owner names of the pets and their
owners, as well as people without pets? */

Select Names, Species, Breed, Ownername
FROM PET, OWNER
WHERE PET.Owner_ID(+) = OWNER.Owner_ID;

/* Who are the pets and their owners, as well animals without owners? */

SELECT Names, Ownername
FROM PET, OWNER
WHERE PET.Owner_ID = OWNER.Owner_ID(+);

/* What are the pet ID's and owner ID's of the pets and their owners, as well animals
without owners? */

SELECT ID, OWNER.Owner_ID, OWNER.Ownername
FROM PET, OWNER
WHERE PET.Owner_ID = Owner.Owner_ID(+);


/* Union */

/* Who are the shelter animals and registered pets? */

SELECT * 
FROM SHELTER 
UNION 
SELECT * 
FROM PETS;

/* What are ID numbers of the registered pets as well as the shelter animals? */

SELECT ID 
FROM PETS 
UNION 
SELECT ID 
FROM SHELTER;


/* Intersection */

/* What registered pets are from the shelter? */

SELECT * 
FROM SHELTER 
INTERSECT
SELECT * 
FROM PETS;

/* What are the ID numbers of the registered petsthat are from the shelter? */

SELECT ID 
FROM SHELTER 
INTERSECT 
SELECT ID 
FROM PETS;


/* Difference */

/* What shelter animals are not registered pets? */

SELECT * 
FROM SHELTER 
MINUS
SELECT * 
FROM PETS;

/* What are the ID numbers of the registered pets not from the shelter? */

SELECT ID 
FROM PETS 
MINUS 
SELECT ID
FROM SHELTER;