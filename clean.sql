insert into Amazon_SMA (Timestamp, SMA)
Select
Key:: Timestamp AS Timestamp, 
(value->>'SMA')::NUMERIC(10, 4) AS SMA   
FROM
    RawData2,
    jsonb_each(raw_json->'Technical Analysis: SMA') AS timeseries(key, value)
ON CONFLICT (Timestamp)
DO NOTHING;