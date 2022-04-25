SELECT
    -- Identifiers which specify the patient: SUBJECT_ID is unique to a patient,
    -- HADM_ID is unique to a patient hospital stay and ICUSTAY_ID is unique to
    -- a patient ICU stay.
    mimic_mimiciii.chartevents.row_id AS id,
    mimic_mimiciii.chartevents.subject_id,

    -- Identifier for a single measurement type in the database. Each row associated with one
    -- ITEMID (e.g. 212) corresponds to an instantiation of the same measurement (e.g. heart rate).
    mimic_mimiciii.chartevents.itemid,

    mimic_mimiciii.chartevents.charttime,

    -- VALUE contains the value measured for the concept identified by the ITEMID.
    -- If this value is numeric, then VALUENUM contains the same data in a numeric format.
    -- If this data is not numeric, VALUENUM is null.
    -- In some cases (e.g. scores like Glasgow Coma Scale, Richmond Sedation Agitation Scale
    -- and Code Status), VALUENUM contains the score and VALUE contains the score and text
    -- describing the meaning of the score.
    mimic_mimiciii.chartevents.value,
    mimic_mimiciii.chartevents.valuenum,

    -- VALUEUOM is the unit of measurement for the VALUE, if appropriate
    mimic_mimiciii.chartevents.valueuom,

    -- RESULTSTATUS and STOPPED are CareVue specific columns which specify the type of measurement
    -- (RESULTSTATUS is ‘Manual’ or ‘Automatic’) and whether the measurement was stopped.
    mimic_mimiciii.chartevents.resultstatus,

    -- CGID is the identifier for the caregiver who validated the given measurement.
    mimic_mimiciii.chartevents.cgid,

    mimic_mimiciii.d_items.label,
    mimic_mimiciii.d_items.abbreviation,

    -- UNITNAME specifies the unit of measurement used for the ITEMID. This column is not always
    -- available, and this may be because the unit of measurement varies, a unit of measurement does
    -- not make sense for the given data type, or the unit of measurement is simply missing. Note
    -- that there is sometimes additional information on the unit of measurement in the associated
    -- event table, e.g. the VALUEUOM column in CHARTEVENTS.
    mimic_mimiciii.d_items.unitname
FROM
    mimic_mimiciii.chartevents
LEFT JOIN
    mimic_mimiciii.d_items ON mimic_mimiciii.chartevents.itemid = mimic_mimiciii.d_items.itemid
