SELECT json_build_object(
        'resourceType', 'Observation',
        'id', fhir_id('mimic_mimiciii.chartevents', id::TEXT),
        'meta.profile.0', 'http://hl7.org/fhir/StructureDefinition/heartrate'::TEXT,
        'status', 'final',
        'category.0.coding.0', json_build_object(
            'system', 'http://terminology.hl7.org/CodeSystem/observation-category',
            'code', 'vital-signs',
            'display', 'vital-signs'
        ),
        'code.coding.0', json_build_object(
            'system', 'http://loinc.org',
            'code', '8867-4',
            'display', 'Heart rate'
        ),
        'valueQuantity', json_build_object(
            'value', valuenum,
            'unit', '/min',
            'system', 'http://unitsofmeasure.org',
            'code', '/min'
        ),
        'effectiveDateTime', fhir_datetime(charttime),
        'subject.reference', fhir_ref('Patient', 'mimic_mimiciii.patients', subject_id::TEXT)
    ) AS fhir
FROM
    heartrate -- dbt-ref(heartrate)
