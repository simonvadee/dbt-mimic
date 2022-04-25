SELECT json_build_object(
        'resourceType', 'Patient',
        'id', fhir_id('mimic_mimiciii.patients', id::TEXT),
        -- the mapping for gender has been done in ./patients.sql
        'gender', CASE gender
            WHEN 'F' THEN 'female'
            WHEN 'M' THEN 'male'
            ELSE 'unknown'
        END,
        -- dob is a datetime, we need to cast to date datatype
        'birthDate', dob::DATE,
        'deceasedDateTime', fhir_datetime(dod)
    ) AS fhir
FROM
    patients -- dbt-ref(patients)
