SELECT
    1 AS drug_exposure_id,
    1 AS person_id,
    0 AS drug_concept_id,
    now()::DATE AS drug_exposure_start_date,
    now()::TIMESTAMP AS drug_exposure_start_datetime,
    now()::DATE AS drug_exposure_end_date,
    now()::TIMESTAMP AS drug_exposure_end_datetime,
    now()::DATE AS verbatim_end_date,
    0 AS drug_type_concept_id,
    '' AS stop_reason,
    1 AS refills,
    1.0 AS quantity,
    1 AS days_supply,
    '' AS sig,
    0 AS route_concept_id,
    '' AS lot_number,
    1 AS provider_id,
    1 AS visit_occurrence_id,
    1 AS visit_detail_id,
    '' AS drug_source_value,
    0 AS drug_source_concept_id,
    '' AS route_source_value,
    '' AS dose_unit_source_value