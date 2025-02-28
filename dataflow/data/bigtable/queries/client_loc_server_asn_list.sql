
        SELECT
        location_key, 
server_asn_number, 
 server_asn_name, 
test_count, 
type, 
client_city, 
client_region, 
client_region_code, 
client_country, 
client_country_code, 
client_continent, 
client_continent_code, 
 last_three_months_test_count, 
last_three_months_download_speed_mbps_median, 
last_three_months_upload_speed_mbps_median, 
last_three_months_download_speed_mbps_avg, 
last_three_months_upload_speed_mbps_avg, 
last_three_months_download_speed_mbps_min, 
last_three_months_upload_speed_mbps_min, 
last_three_months_download_speed_mbps_max, 
last_three_months_upload_speed_mbps_max, 
last_three_months_download_speed_mbps_stddev, 
last_three_months_upload_speed_mbps_stddev, 
last_three_months_rtt_avg, 
last_three_months_retransmit_avg, 
last_six_months_test_count, 
last_six_months_download_speed_mbps_median, 
last_six_months_upload_speed_mbps_median, 
last_six_months_download_speed_mbps_avg, 
last_six_months_upload_speed_mbps_avg, 
last_six_months_download_speed_mbps_min, 
last_six_months_upload_speed_mbps_min, 
last_six_months_download_speed_mbps_max, 
last_six_months_upload_speed_mbps_max, 
last_six_months_download_speed_mbps_stddev, 
last_six_months_upload_speed_mbps_stddev, 
last_six_months_rtt_avg, 
last_six_months_retransmit_avg, 
last_year_test_count, 
last_year_download_speed_mbps_median, 
last_year_upload_speed_mbps_median, 
last_year_download_speed_mbps_avg, 
last_year_upload_speed_mbps_avg, 
last_year_download_speed_mbps_min, 
last_year_upload_speed_mbps_min, 
last_year_download_speed_mbps_max, 
last_year_upload_speed_mbps_max, 
last_year_download_speed_mbps_stddev, 
last_year_upload_speed_mbps_stddev, 
last_year_rtt_avg, 
last_year_retransmit_avg,
        "0,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,88,92,96,100" as speed_mbps_bins,
        last_three_months_download_speed_mbps_bins,
last_three_months_upload_speed_mbps_bins,
last_three_months_rtt_avg_bins,
last_three_months_packet_retransmit_rate_bins,
last_six_months_download_speed_mbps_bins,
last_six_months_upload_speed_mbps_bins,
last_six_months_rtt_avg_bins,
last_six_months_packet_retransmit_rate_bins,
last_year_download_speed_mbps_bins,
last_year_upload_speed_mbps_bins,
last_year_rtt_avg_bins,
last_year_packet_retransmit_rate_bins
        from
    -- ============
-- Type: city
-- ============
(SELECT
  REPLACE(LOWER(CONCAT(IFNULL(all.client_continent_code, ""), ""
,IFNULL(all.client_country_code, ""), ""
,IFNULL(all.client_region_code, ""), ""
,IFNULL(all.client_city, ""), ""
)), " ", "") AS location_key,

  -- what is its type?
  "city" AS type,
  count(*) as test_count,

  -- meta fields we are selecting
  all.client_city as client_city,
all.client_region as client_region,
all.client_country as client_country,
all.client_continent as client_continent,
all.client_region_code as client_region_code,
all.client_country_code as client_country_code,
all.client_continent_code as client_continent_code,
all.server_asn_number as server_asn_number,
all.server_asn_name as server_asn_name,

  -- timed fields
  last_three_months.test_count as last_three_months_test_count,
last_three_months.download_speed_mbps_median as last_three_months_download_speed_mbps_median,
last_three_months.upload_speed_mbps_median as last_three_months_upload_speed_mbps_median,
last_three_months.download_speed_mbps_avg as last_three_months_download_speed_mbps_avg,
last_three_months.upload_speed_mbps_avg as last_three_months_upload_speed_mbps_avg,
last_three_months.download_speed_mbps_min as last_three_months_download_speed_mbps_min,
last_three_months.upload_speed_mbps_min as last_three_months_upload_speed_mbps_min,
last_three_months.download_speed_mbps_max as last_three_months_download_speed_mbps_max,
last_three_months.upload_speed_mbps_max as last_three_months_upload_speed_mbps_max,
last_three_months.download_speed_mbps_stddev as last_three_months_download_speed_mbps_stddev,
last_three_months.upload_speed_mbps_stddev as last_three_months_upload_speed_mbps_stddev,
last_three_months.rtt_avg as last_three_months_rtt_avg,
last_three_months.retransmit_avg as last_three_months_retransmit_avg,
last_six_months.test_count as last_six_months_test_count,
last_six_months.download_speed_mbps_median as last_six_months_download_speed_mbps_median,
last_six_months.upload_speed_mbps_median as last_six_months_upload_speed_mbps_median,
last_six_months.download_speed_mbps_avg as last_six_months_download_speed_mbps_avg,
last_six_months.upload_speed_mbps_avg as last_six_months_upload_speed_mbps_avg,
last_six_months.download_speed_mbps_min as last_six_months_download_speed_mbps_min,
last_six_months.upload_speed_mbps_min as last_six_months_upload_speed_mbps_min,
last_six_months.download_speed_mbps_max as last_six_months_download_speed_mbps_max,
last_six_months.upload_speed_mbps_max as last_six_months_upload_speed_mbps_max,
last_six_months.download_speed_mbps_stddev as last_six_months_download_speed_mbps_stddev,
last_six_months.upload_speed_mbps_stddev as last_six_months_upload_speed_mbps_stddev,
last_six_months.rtt_avg as last_six_months_rtt_avg,
last_six_months.retransmit_avg as last_six_months_retransmit_avg,
last_year.test_count as last_year_test_count,
last_year.download_speed_mbps_median as last_year_download_speed_mbps_median,
last_year.upload_speed_mbps_median as last_year_upload_speed_mbps_median,
last_year.download_speed_mbps_avg as last_year_download_speed_mbps_avg,
last_year.upload_speed_mbps_avg as last_year_upload_speed_mbps_avg,
last_year.download_speed_mbps_min as last_year_download_speed_mbps_min,
last_year.upload_speed_mbps_min as last_year_upload_speed_mbps_min,
last_year.download_speed_mbps_max as last_year_download_speed_mbps_max,
last_year.upload_speed_mbps_max as last_year_upload_speed_mbps_max,
last_year.download_speed_mbps_stddev as last_year_download_speed_mbps_stddev,
last_year.upload_speed_mbps_stddev as last_year_upload_speed_mbps_stddev,
last_year.rtt_avg as last_year_rtt_avg,
last_year.retransmit_avg as last_year_retransmit_avg,
last_three_months.download_speed_mbps_bins as last_three_months_download_speed_mbps_bins, 
last_three_months.upload_speed_mbps_bins as last_three_months_upload_speed_mbps_bins, 
last_three_months.rtt_avg_bins as last_three_months_rtt_avg_bins, 
last_three_months.packet_retransmit_rate_bins as last_three_months_packet_retransmit_rate_bins, 
last_year.download_speed_mbps_bins as last_year_download_speed_mbps_bins, 
last_year.upload_speed_mbps_bins as last_year_upload_speed_mbps_bins, 
last_year.rtt_avg_bins as last_year_rtt_avg_bins, 
last_year.packet_retransmit_rate_bins as last_year_packet_retransmit_rate_bins, 
last_six_months.download_speed_mbps_bins as last_six_months_download_speed_mbps_bins, 
last_six_months.upload_speed_mbps_bins as last_six_months_upload_speed_mbps_bins, 
last_six_months.rtt_avg_bins as last_six_months_rtt_avg_bins, 
last_six_months.packet_retransmit_rate_bins as last_six_months_packet_retransmit_rate_bins

  FROM {0} all

  -- left join madness here!
  left join
(
  SELECT
    count(*) as test_count,

    -- which location fields?
    client_city, 
client_region, 
client_country, 
client_continent, 
client_region_code, 
client_country_code, 
client_continent_code, 
server_asn_number, 
server_asn_name,

    -- measurements:
    nth(51, quantiles(download_speed_mbps, 101)) AS download_speed_mbps_median,
    nth(51, quantiles(upload_speed_mbps, 101)) AS upload_speed_mbps_median,

    AVG(download_speed_mbps) AS download_speed_mbps_avg,
    AVG(upload_speed_mbps) AS upload_speed_mbps_avg,

    MIN(download_speed_mbps) AS download_speed_mbps_min,
    MAX(download_speed_mbps) AS download_speed_mbps_max,

    MIN(upload_speed_mbps) AS upload_speed_mbps_min,
    MAX(upload_speed_mbps) AS upload_speed_mbps_max,

    STDDEV(download_speed_mbps) AS download_speed_mbps_stddev,
    STDDEV(upload_speed_mbps) AS upload_speed_mbps_stddev,

    SUM(rtt_sum) / SUM(rtt_count) AS rtt_avg,
    AVG(packet_retransmit_rate) AS retransmit_avg,

    -- other:
    concat(STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 0 AND IFNULL(download_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 4 AND IFNULL(download_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 8 AND IFNULL(download_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 12 AND IFNULL(download_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 16 AND IFNULL(download_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 20 AND IFNULL(download_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 24 AND IFNULL(download_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 28 AND IFNULL(download_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 32 AND IFNULL(download_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 36 AND IFNULL(download_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 40 AND IFNULL(download_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 44 AND IFNULL(download_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 48 AND IFNULL(download_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 52 AND IFNULL(download_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 56 AND IFNULL(download_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 60 AND IFNULL(download_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 64 AND IFNULL(download_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 68 AND IFNULL(download_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 72 AND IFNULL(download_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 76 AND IFNULL(download_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 80 AND IFNULL(download_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 84 AND IFNULL(download_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 88 AND IFNULL(download_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 92 AND IFNULL(download_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 96 AND IFNULL(download_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 100, 1,0)))
) as download_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 0 AND IFNULL(upload_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 4 AND IFNULL(upload_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 8 AND IFNULL(upload_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 12 AND IFNULL(upload_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 16 AND IFNULL(upload_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 20 AND IFNULL(upload_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 24 AND IFNULL(upload_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 28 AND IFNULL(upload_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 32 AND IFNULL(upload_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 36 AND IFNULL(upload_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 40 AND IFNULL(upload_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 44 AND IFNULL(upload_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 48 AND IFNULL(upload_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 52 AND IFNULL(upload_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 56 AND IFNULL(upload_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 60 AND IFNULL(upload_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 64 AND IFNULL(upload_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 68 AND IFNULL(upload_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 72 AND IFNULL(upload_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 76 AND IFNULL(upload_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 80 AND IFNULL(upload_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 84 AND IFNULL(upload_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 88 AND IFNULL(upload_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 92 AND IFNULL(upload_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 96 AND IFNULL(upload_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 100, 1,0)))
) as upload_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 50 AND IFNULL(rtt_avg, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 100 AND IFNULL(rtt_avg, 0) < 150, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 150 AND IFNULL(rtt_avg, 0) < 200, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 200 AND IFNULL(rtt_avg, 0) < 250, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 250 AND IFNULL(rtt_avg, 0) < 300, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 300 AND IFNULL(rtt_avg, 0) < 350, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 350 AND IFNULL(rtt_avg, 0) < 400, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 400 AND IFNULL(rtt_avg, 0) < 450, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 450 AND IFNULL(rtt_avg, 0) < 500, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 500 AND IFNULL(rtt_avg, 0) < 550, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 550 AND IFNULL(rtt_avg, 0) < 600, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 600 AND IFNULL(rtt_avg, 0) < 650, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 650 AND IFNULL(rtt_avg, 0) < 700, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 700 AND IFNULL(rtt_avg, 0) < 750, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 750 AND IFNULL(rtt_avg, 0) < 800, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 800 AND IFNULL(rtt_avg, 0) < 850, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 850 AND IFNULL(rtt_avg, 0) < 900, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 900 AND IFNULL(rtt_avg, 0) < 950, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 950 AND IFNULL(rtt_avg, 0) < 1000, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 1000, 1,0)))
) as rtt_avg_bins, 
concat(STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.01 AND IFNULL(packet_retransmit_rate, 0) < 0.02, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.02 AND IFNULL(packet_retransmit_rate, 0) < 0.03, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.03 AND IFNULL(packet_retransmit_rate, 0) < 0.04, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.04 AND IFNULL(packet_retransmit_rate, 0) < 0.05, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.05 AND IFNULL(packet_retransmit_rate, 0) < 0.06, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.06 AND IFNULL(packet_retransmit_rate, 0) < 0.07, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.07 AND IFNULL(packet_retransmit_rate, 0) < 0.08, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.08 AND IFNULL(packet_retransmit_rate, 0) < 0.09, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.09 AND IFNULL(packet_retransmit_rate, 0) < 0.1, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.1, 1,0)))
) as packet_retransmit_rate_bins

  from {0}
  where
    test_date >= DATE_ADD(USEC_TO_TIMESTAMP(NOW()), -3, "MONTH") and
    client_city is not null
  group by
    -- group by location fields
    client_city, 
client_region, 
client_country, 
client_continent, 
client_region_code, 
client_country_code, 
client_continent_code, 
server_asn_number, 
server_asn_name

) last_three_months on
  -- join on location fields from the all table.
  all.client_city = last_three_months.client_city and 
all.client_region = last_three_months.client_region and 
all.client_country = last_three_months.client_country and 
all.client_continent = last_three_months.client_continent and 
all.client_region_code = last_three_months.client_region_code and 
all.client_country_code = last_three_months.client_country_code and 
all.client_continent_code = last_three_months.client_continent_code and 
all.server_asn_number = last_three_months.server_asn_number and 
all.server_asn_name = last_three_months.server_asn_name
left join
(
  SELECT
    count(*) as test_count,

    -- which location fields?
    client_city, 
client_region, 
client_country, 
client_continent, 
client_region_code, 
client_country_code, 
client_continent_code, 
server_asn_number, 
server_asn_name,

    -- measurements:
    nth(51, quantiles(download_speed_mbps, 101)) AS download_speed_mbps_median,
    nth(51, quantiles(upload_speed_mbps, 101)) AS upload_speed_mbps_median,

    AVG(download_speed_mbps) AS download_speed_mbps_avg,
    AVG(upload_speed_mbps) AS upload_speed_mbps_avg,

    MIN(download_speed_mbps) AS download_speed_mbps_min,
    MAX(download_speed_mbps) AS download_speed_mbps_max,

    MIN(upload_speed_mbps) AS upload_speed_mbps_min,
    MAX(upload_speed_mbps) AS upload_speed_mbps_max,

    STDDEV(download_speed_mbps) AS download_speed_mbps_stddev,
    STDDEV(upload_speed_mbps) AS upload_speed_mbps_stddev,

    SUM(rtt_sum) / SUM(rtt_count) AS rtt_avg,
    AVG(packet_retransmit_rate) AS retransmit_avg,

    -- other:
    concat(STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 0 AND IFNULL(download_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 4 AND IFNULL(download_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 8 AND IFNULL(download_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 12 AND IFNULL(download_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 16 AND IFNULL(download_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 20 AND IFNULL(download_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 24 AND IFNULL(download_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 28 AND IFNULL(download_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 32 AND IFNULL(download_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 36 AND IFNULL(download_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 40 AND IFNULL(download_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 44 AND IFNULL(download_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 48 AND IFNULL(download_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 52 AND IFNULL(download_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 56 AND IFNULL(download_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 60 AND IFNULL(download_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 64 AND IFNULL(download_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 68 AND IFNULL(download_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 72 AND IFNULL(download_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 76 AND IFNULL(download_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 80 AND IFNULL(download_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 84 AND IFNULL(download_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 88 AND IFNULL(download_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 92 AND IFNULL(download_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 96 AND IFNULL(download_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 100, 1,0)))
) as download_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 0 AND IFNULL(upload_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 4 AND IFNULL(upload_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 8 AND IFNULL(upload_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 12 AND IFNULL(upload_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 16 AND IFNULL(upload_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 20 AND IFNULL(upload_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 24 AND IFNULL(upload_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 28 AND IFNULL(upload_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 32 AND IFNULL(upload_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 36 AND IFNULL(upload_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 40 AND IFNULL(upload_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 44 AND IFNULL(upload_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 48 AND IFNULL(upload_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 52 AND IFNULL(upload_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 56 AND IFNULL(upload_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 60 AND IFNULL(upload_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 64 AND IFNULL(upload_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 68 AND IFNULL(upload_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 72 AND IFNULL(upload_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 76 AND IFNULL(upload_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 80 AND IFNULL(upload_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 84 AND IFNULL(upload_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 88 AND IFNULL(upload_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 92 AND IFNULL(upload_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 96 AND IFNULL(upload_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 100, 1,0)))
) as upload_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 50 AND IFNULL(rtt_avg, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 100 AND IFNULL(rtt_avg, 0) < 150, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 150 AND IFNULL(rtt_avg, 0) < 200, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 200 AND IFNULL(rtt_avg, 0) < 250, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 250 AND IFNULL(rtt_avg, 0) < 300, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 300 AND IFNULL(rtt_avg, 0) < 350, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 350 AND IFNULL(rtt_avg, 0) < 400, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 400 AND IFNULL(rtt_avg, 0) < 450, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 450 AND IFNULL(rtt_avg, 0) < 500, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 500 AND IFNULL(rtt_avg, 0) < 550, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 550 AND IFNULL(rtt_avg, 0) < 600, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 600 AND IFNULL(rtt_avg, 0) < 650, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 650 AND IFNULL(rtt_avg, 0) < 700, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 700 AND IFNULL(rtt_avg, 0) < 750, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 750 AND IFNULL(rtt_avg, 0) < 800, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 800 AND IFNULL(rtt_avg, 0) < 850, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 850 AND IFNULL(rtt_avg, 0) < 900, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 900 AND IFNULL(rtt_avg, 0) < 950, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 950 AND IFNULL(rtt_avg, 0) < 1000, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 1000, 1,0)))
) as rtt_avg_bins, 
concat(STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.01 AND IFNULL(packet_retransmit_rate, 0) < 0.02, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.02 AND IFNULL(packet_retransmit_rate, 0) < 0.03, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.03 AND IFNULL(packet_retransmit_rate, 0) < 0.04, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.04 AND IFNULL(packet_retransmit_rate, 0) < 0.05, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.05 AND IFNULL(packet_retransmit_rate, 0) < 0.06, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.06 AND IFNULL(packet_retransmit_rate, 0) < 0.07, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.07 AND IFNULL(packet_retransmit_rate, 0) < 0.08, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.08 AND IFNULL(packet_retransmit_rate, 0) < 0.09, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.09 AND IFNULL(packet_retransmit_rate, 0) < 0.1, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.1, 1,0)))
) as packet_retransmit_rate_bins

  from {0}
  where
    test_date >= DATE_ADD(USEC_TO_TIMESTAMP(NOW()), -1, "YEAR") and
    client_city is not null
  group by
    -- group by location fields
    client_city, 
client_region, 
client_country, 
client_continent, 
client_region_code, 
client_country_code, 
client_continent_code, 
server_asn_number, 
server_asn_name

) last_year on
  -- join on location fields from the all table.
  all.client_city = last_year.client_city and 
all.client_region = last_year.client_region and 
all.client_country = last_year.client_country and 
all.client_continent = last_year.client_continent and 
all.client_region_code = last_year.client_region_code and 
all.client_country_code = last_year.client_country_code and 
all.client_continent_code = last_year.client_continent_code and 
all.server_asn_number = last_year.server_asn_number and 
all.server_asn_name = last_year.server_asn_name
left join
(
  SELECT
    count(*) as test_count,

    -- which location fields?
    client_city, 
client_region, 
client_country, 
client_continent, 
client_region_code, 
client_country_code, 
client_continent_code, 
server_asn_number, 
server_asn_name,

    -- measurements:
    nth(51, quantiles(download_speed_mbps, 101)) AS download_speed_mbps_median,
    nth(51, quantiles(upload_speed_mbps, 101)) AS upload_speed_mbps_median,

    AVG(download_speed_mbps) AS download_speed_mbps_avg,
    AVG(upload_speed_mbps) AS upload_speed_mbps_avg,

    MIN(download_speed_mbps) AS download_speed_mbps_min,
    MAX(download_speed_mbps) AS download_speed_mbps_max,

    MIN(upload_speed_mbps) AS upload_speed_mbps_min,
    MAX(upload_speed_mbps) AS upload_speed_mbps_max,

    STDDEV(download_speed_mbps) AS download_speed_mbps_stddev,
    STDDEV(upload_speed_mbps) AS upload_speed_mbps_stddev,

    SUM(rtt_sum) / SUM(rtt_count) AS rtt_avg,
    AVG(packet_retransmit_rate) AS retransmit_avg,

    -- other:
    concat(STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 0 AND IFNULL(download_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 4 AND IFNULL(download_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 8 AND IFNULL(download_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 12 AND IFNULL(download_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 16 AND IFNULL(download_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 20 AND IFNULL(download_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 24 AND IFNULL(download_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 28 AND IFNULL(download_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 32 AND IFNULL(download_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 36 AND IFNULL(download_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 40 AND IFNULL(download_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 44 AND IFNULL(download_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 48 AND IFNULL(download_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 52 AND IFNULL(download_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 56 AND IFNULL(download_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 60 AND IFNULL(download_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 64 AND IFNULL(download_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 68 AND IFNULL(download_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 72 AND IFNULL(download_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 76 AND IFNULL(download_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 80 AND IFNULL(download_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 84 AND IFNULL(download_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 88 AND IFNULL(download_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 92 AND IFNULL(download_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 96 AND IFNULL(download_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 100, 1,0)))
) as download_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 0 AND IFNULL(upload_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 4 AND IFNULL(upload_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 8 AND IFNULL(upload_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 12 AND IFNULL(upload_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 16 AND IFNULL(upload_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 20 AND IFNULL(upload_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 24 AND IFNULL(upload_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 28 AND IFNULL(upload_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 32 AND IFNULL(upload_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 36 AND IFNULL(upload_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 40 AND IFNULL(upload_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 44 AND IFNULL(upload_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 48 AND IFNULL(upload_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 52 AND IFNULL(upload_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 56 AND IFNULL(upload_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 60 AND IFNULL(upload_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 64 AND IFNULL(upload_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 68 AND IFNULL(upload_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 72 AND IFNULL(upload_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 76 AND IFNULL(upload_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 80 AND IFNULL(upload_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 84 AND IFNULL(upload_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 88 AND IFNULL(upload_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 92 AND IFNULL(upload_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 96 AND IFNULL(upload_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 100, 1,0)))
) as upload_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 50 AND IFNULL(rtt_avg, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 100 AND IFNULL(rtt_avg, 0) < 150, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 150 AND IFNULL(rtt_avg, 0) < 200, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 200 AND IFNULL(rtt_avg, 0) < 250, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 250 AND IFNULL(rtt_avg, 0) < 300, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 300 AND IFNULL(rtt_avg, 0) < 350, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 350 AND IFNULL(rtt_avg, 0) < 400, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 400 AND IFNULL(rtt_avg, 0) < 450, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 450 AND IFNULL(rtt_avg, 0) < 500, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 500 AND IFNULL(rtt_avg, 0) < 550, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 550 AND IFNULL(rtt_avg, 0) < 600, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 600 AND IFNULL(rtt_avg, 0) < 650, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 650 AND IFNULL(rtt_avg, 0) < 700, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 700 AND IFNULL(rtt_avg, 0) < 750, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 750 AND IFNULL(rtt_avg, 0) < 800, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 800 AND IFNULL(rtt_avg, 0) < 850, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 850 AND IFNULL(rtt_avg, 0) < 900, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 900 AND IFNULL(rtt_avg, 0) < 950, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 950 AND IFNULL(rtt_avg, 0) < 1000, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 1000, 1,0)))
) as rtt_avg_bins, 
concat(STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.01 AND IFNULL(packet_retransmit_rate, 0) < 0.02, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.02 AND IFNULL(packet_retransmit_rate, 0) < 0.03, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.03 AND IFNULL(packet_retransmit_rate, 0) < 0.04, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.04 AND IFNULL(packet_retransmit_rate, 0) < 0.05, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.05 AND IFNULL(packet_retransmit_rate, 0) < 0.06, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.06 AND IFNULL(packet_retransmit_rate, 0) < 0.07, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.07 AND IFNULL(packet_retransmit_rate, 0) < 0.08, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.08 AND IFNULL(packet_retransmit_rate, 0) < 0.09, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.09 AND IFNULL(packet_retransmit_rate, 0) < 0.1, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.1, 1,0)))
) as packet_retransmit_rate_bins

  from {0}
  where
    test_date >= DATE_ADD(USEC_TO_TIMESTAMP(NOW()), -6, "MONTH") and
    client_city is not null
  group by
    -- group by location fields
    client_city, 
client_region, 
client_country, 
client_continent, 
client_region_code, 
client_country_code, 
client_continent_code, 
server_asn_number, 
server_asn_name

) last_six_months on
  -- join on location fields from the all table.
  all.client_city = last_six_months.client_city and 
all.client_region = last_six_months.client_region and 
all.client_country = last_six_months.client_country and 
all.client_continent = last_six_months.client_continent and 
all.client_region_code = last_six_months.client_region_code and 
all.client_country_code = last_six_months.client_country_code and 
all.client_continent_code = last_six_months.client_continent_code and 
all.server_asn_number = last_six_months.server_asn_number and 
all.server_asn_name = last_six_months.server_asn_name


  GROUP BY

  location_key, 
server_asn_number,
client_city, 
client_region, 
client_country, 
client_continent, 
client_region_code, 
client_country_code, 
client_continent_code, 
server_asn_number, 
server_asn_name,
last_three_months_test_count, 
last_three_months_download_speed_mbps_median, 
last_three_months_upload_speed_mbps_median, 
last_three_months_download_speed_mbps_avg, 
last_three_months_upload_speed_mbps_avg, 
last_three_months_download_speed_mbps_min, 
last_three_months_upload_speed_mbps_min, 
last_three_months_download_speed_mbps_max, 
last_three_months_upload_speed_mbps_max, 
last_three_months_download_speed_mbps_stddev, 
last_three_months_upload_speed_mbps_stddev, 
last_three_months_rtt_avg, 
last_three_months_retransmit_avg, 
last_six_months_test_count, 
last_six_months_download_speed_mbps_median, 
last_six_months_upload_speed_mbps_median, 
last_six_months_download_speed_mbps_avg, 
last_six_months_upload_speed_mbps_avg, 
last_six_months_download_speed_mbps_min, 
last_six_months_upload_speed_mbps_min, 
last_six_months_download_speed_mbps_max, 
last_six_months_upload_speed_mbps_max, 
last_six_months_download_speed_mbps_stddev, 
last_six_months_upload_speed_mbps_stddev, 
last_six_months_rtt_avg, 
last_six_months_retransmit_avg, 
last_year_test_count, 
last_year_download_speed_mbps_median, 
last_year_upload_speed_mbps_median, 
last_year_download_speed_mbps_avg, 
last_year_upload_speed_mbps_avg, 
last_year_download_speed_mbps_min, 
last_year_upload_speed_mbps_min, 
last_year_download_speed_mbps_max, 
last_year_upload_speed_mbps_max, 
last_year_download_speed_mbps_stddev, 
last_year_upload_speed_mbps_stddev, 
last_year_rtt_avg, 
last_year_retransmit_avg, 
last_three_months_download_speed_mbps_bins, 
last_three_months_upload_speed_mbps_bins, 
last_three_months_rtt_avg_bins, 
last_three_months_packet_retransmit_rate_bins, 
last_year_download_speed_mbps_bins, 
last_year_upload_speed_mbps_bins, 
last_year_rtt_avg_bins, 
last_year_packet_retransmit_rate_bins, 
last_six_months_download_speed_mbps_bins, 
last_six_months_upload_speed_mbps_bins, 
last_six_months_rtt_avg_bins, 
last_six_months_packet_retransmit_rate_bins

)
, 
-- ============
-- Type: region
-- ============
(SELECT
  REPLACE(LOWER(CONCAT(IFNULL(all.client_continent_code, ""), ""
,IFNULL(all.client_country_code, ""), ""
,IFNULL(all.client_region_code, ""), ""
)), " ", "") AS location_key,

  -- what is its type?
  "region" AS type,
  count(*) as test_count,

  -- meta fields we are selecting
  all.client_region as client_region,
all.client_country as client_country,
all.client_continent as client_continent,
all.client_region_code as client_region_code,
all.client_country_code as client_country_code,
all.client_continent_code as client_continent_code,
all.server_asn_number as server_asn_number,
all.server_asn_name as server_asn_name,

  -- timed fields
  last_three_months.test_count as last_three_months_test_count,
last_three_months.download_speed_mbps_median as last_three_months_download_speed_mbps_median,
last_three_months.upload_speed_mbps_median as last_three_months_upload_speed_mbps_median,
last_three_months.download_speed_mbps_avg as last_three_months_download_speed_mbps_avg,
last_three_months.upload_speed_mbps_avg as last_three_months_upload_speed_mbps_avg,
last_three_months.download_speed_mbps_min as last_three_months_download_speed_mbps_min,
last_three_months.upload_speed_mbps_min as last_three_months_upload_speed_mbps_min,
last_three_months.download_speed_mbps_max as last_three_months_download_speed_mbps_max,
last_three_months.upload_speed_mbps_max as last_three_months_upload_speed_mbps_max,
last_three_months.download_speed_mbps_stddev as last_three_months_download_speed_mbps_stddev,
last_three_months.upload_speed_mbps_stddev as last_three_months_upload_speed_mbps_stddev,
last_three_months.rtt_avg as last_three_months_rtt_avg,
last_three_months.retransmit_avg as last_three_months_retransmit_avg,
last_six_months.test_count as last_six_months_test_count,
last_six_months.download_speed_mbps_median as last_six_months_download_speed_mbps_median,
last_six_months.upload_speed_mbps_median as last_six_months_upload_speed_mbps_median,
last_six_months.download_speed_mbps_avg as last_six_months_download_speed_mbps_avg,
last_six_months.upload_speed_mbps_avg as last_six_months_upload_speed_mbps_avg,
last_six_months.download_speed_mbps_min as last_six_months_download_speed_mbps_min,
last_six_months.upload_speed_mbps_min as last_six_months_upload_speed_mbps_min,
last_six_months.download_speed_mbps_max as last_six_months_download_speed_mbps_max,
last_six_months.upload_speed_mbps_max as last_six_months_upload_speed_mbps_max,
last_six_months.download_speed_mbps_stddev as last_six_months_download_speed_mbps_stddev,
last_six_months.upload_speed_mbps_stddev as last_six_months_upload_speed_mbps_stddev,
last_six_months.rtt_avg as last_six_months_rtt_avg,
last_six_months.retransmit_avg as last_six_months_retransmit_avg,
last_year.test_count as last_year_test_count,
last_year.download_speed_mbps_median as last_year_download_speed_mbps_median,
last_year.upload_speed_mbps_median as last_year_upload_speed_mbps_median,
last_year.download_speed_mbps_avg as last_year_download_speed_mbps_avg,
last_year.upload_speed_mbps_avg as last_year_upload_speed_mbps_avg,
last_year.download_speed_mbps_min as last_year_download_speed_mbps_min,
last_year.upload_speed_mbps_min as last_year_upload_speed_mbps_min,
last_year.download_speed_mbps_max as last_year_download_speed_mbps_max,
last_year.upload_speed_mbps_max as last_year_upload_speed_mbps_max,
last_year.download_speed_mbps_stddev as last_year_download_speed_mbps_stddev,
last_year.upload_speed_mbps_stddev as last_year_upload_speed_mbps_stddev,
last_year.rtt_avg as last_year_rtt_avg,
last_year.retransmit_avg as last_year_retransmit_avg,
last_three_months.download_speed_mbps_bins as last_three_months_download_speed_mbps_bins, 
last_three_months.upload_speed_mbps_bins as last_three_months_upload_speed_mbps_bins, 
last_three_months.rtt_avg_bins as last_three_months_rtt_avg_bins, 
last_three_months.packet_retransmit_rate_bins as last_three_months_packet_retransmit_rate_bins, 
last_year.download_speed_mbps_bins as last_year_download_speed_mbps_bins, 
last_year.upload_speed_mbps_bins as last_year_upload_speed_mbps_bins, 
last_year.rtt_avg_bins as last_year_rtt_avg_bins, 
last_year.packet_retransmit_rate_bins as last_year_packet_retransmit_rate_bins, 
last_six_months.download_speed_mbps_bins as last_six_months_download_speed_mbps_bins, 
last_six_months.upload_speed_mbps_bins as last_six_months_upload_speed_mbps_bins, 
last_six_months.rtt_avg_bins as last_six_months_rtt_avg_bins, 
last_six_months.packet_retransmit_rate_bins as last_six_months_packet_retransmit_rate_bins

  FROM {0} all

  -- left join madness here!
  left join
(
  SELECT
    count(*) as test_count,

    -- which location fields?
    client_region, 
client_country, 
client_continent, 
client_region_code, 
client_country_code, 
client_continent_code, 
server_asn_number, 
server_asn_name,

    -- measurements:
    nth(51, quantiles(download_speed_mbps, 101)) AS download_speed_mbps_median,
    nth(51, quantiles(upload_speed_mbps, 101)) AS upload_speed_mbps_median,

    AVG(download_speed_mbps) AS download_speed_mbps_avg,
    AVG(upload_speed_mbps) AS upload_speed_mbps_avg,

    MIN(download_speed_mbps) AS download_speed_mbps_min,
    MAX(download_speed_mbps) AS download_speed_mbps_max,

    MIN(upload_speed_mbps) AS upload_speed_mbps_min,
    MAX(upload_speed_mbps) AS upload_speed_mbps_max,

    STDDEV(download_speed_mbps) AS download_speed_mbps_stddev,
    STDDEV(upload_speed_mbps) AS upload_speed_mbps_stddev,

    SUM(rtt_sum) / SUM(rtt_count) AS rtt_avg,
    AVG(packet_retransmit_rate) AS retransmit_avg,

    -- other:
    concat(STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 0 AND IFNULL(download_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 4 AND IFNULL(download_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 8 AND IFNULL(download_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 12 AND IFNULL(download_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 16 AND IFNULL(download_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 20 AND IFNULL(download_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 24 AND IFNULL(download_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 28 AND IFNULL(download_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 32 AND IFNULL(download_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 36 AND IFNULL(download_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 40 AND IFNULL(download_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 44 AND IFNULL(download_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 48 AND IFNULL(download_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 52 AND IFNULL(download_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 56 AND IFNULL(download_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 60 AND IFNULL(download_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 64 AND IFNULL(download_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 68 AND IFNULL(download_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 72 AND IFNULL(download_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 76 AND IFNULL(download_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 80 AND IFNULL(download_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 84 AND IFNULL(download_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 88 AND IFNULL(download_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 92 AND IFNULL(download_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 96 AND IFNULL(download_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 100, 1,0)))
) as download_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 0 AND IFNULL(upload_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 4 AND IFNULL(upload_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 8 AND IFNULL(upload_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 12 AND IFNULL(upload_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 16 AND IFNULL(upload_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 20 AND IFNULL(upload_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 24 AND IFNULL(upload_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 28 AND IFNULL(upload_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 32 AND IFNULL(upload_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 36 AND IFNULL(upload_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 40 AND IFNULL(upload_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 44 AND IFNULL(upload_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 48 AND IFNULL(upload_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 52 AND IFNULL(upload_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 56 AND IFNULL(upload_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 60 AND IFNULL(upload_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 64 AND IFNULL(upload_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 68 AND IFNULL(upload_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 72 AND IFNULL(upload_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 76 AND IFNULL(upload_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 80 AND IFNULL(upload_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 84 AND IFNULL(upload_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 88 AND IFNULL(upload_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 92 AND IFNULL(upload_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 96 AND IFNULL(upload_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 100, 1,0)))
) as upload_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 50 AND IFNULL(rtt_avg, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 100 AND IFNULL(rtt_avg, 0) < 150, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 150 AND IFNULL(rtt_avg, 0) < 200, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 200 AND IFNULL(rtt_avg, 0) < 250, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 250 AND IFNULL(rtt_avg, 0) < 300, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 300 AND IFNULL(rtt_avg, 0) < 350, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 350 AND IFNULL(rtt_avg, 0) < 400, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 400 AND IFNULL(rtt_avg, 0) < 450, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 450 AND IFNULL(rtt_avg, 0) < 500, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 500 AND IFNULL(rtt_avg, 0) < 550, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 550 AND IFNULL(rtt_avg, 0) < 600, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 600 AND IFNULL(rtt_avg, 0) < 650, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 650 AND IFNULL(rtt_avg, 0) < 700, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 700 AND IFNULL(rtt_avg, 0) < 750, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 750 AND IFNULL(rtt_avg, 0) < 800, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 800 AND IFNULL(rtt_avg, 0) < 850, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 850 AND IFNULL(rtt_avg, 0) < 900, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 900 AND IFNULL(rtt_avg, 0) < 950, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 950 AND IFNULL(rtt_avg, 0) < 1000, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 1000, 1,0)))
) as rtt_avg_bins, 
concat(STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.01 AND IFNULL(packet_retransmit_rate, 0) < 0.02, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.02 AND IFNULL(packet_retransmit_rate, 0) < 0.03, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.03 AND IFNULL(packet_retransmit_rate, 0) < 0.04, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.04 AND IFNULL(packet_retransmit_rate, 0) < 0.05, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.05 AND IFNULL(packet_retransmit_rate, 0) < 0.06, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.06 AND IFNULL(packet_retransmit_rate, 0) < 0.07, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.07 AND IFNULL(packet_retransmit_rate, 0) < 0.08, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.08 AND IFNULL(packet_retransmit_rate, 0) < 0.09, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.09 AND IFNULL(packet_retransmit_rate, 0) < 0.1, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.1, 1,0)))
) as packet_retransmit_rate_bins

  from {0}
  where
    test_date >= DATE_ADD(USEC_TO_TIMESTAMP(NOW()), -3, "MONTH") and
    client_region is not null
  group by
    -- group by location fields
    client_region, 
client_country, 
client_continent, 
client_region_code, 
client_country_code, 
client_continent_code, 
server_asn_number, 
server_asn_name

) last_three_months on
  -- join on location fields from the all table.
  all.client_region = last_three_months.client_region and 
all.client_country = last_three_months.client_country and 
all.client_continent = last_three_months.client_continent and 
all.client_region_code = last_three_months.client_region_code and 
all.client_country_code = last_three_months.client_country_code and 
all.client_continent_code = last_three_months.client_continent_code and 
all.server_asn_number = last_three_months.server_asn_number and 
all.server_asn_name = last_three_months.server_asn_name
left join
(
  SELECT
    count(*) as test_count,

    -- which location fields?
    client_region, 
client_country, 
client_continent, 
client_region_code, 
client_country_code, 
client_continent_code, 
server_asn_number, 
server_asn_name,

    -- measurements:
    nth(51, quantiles(download_speed_mbps, 101)) AS download_speed_mbps_median,
    nth(51, quantiles(upload_speed_mbps, 101)) AS upload_speed_mbps_median,

    AVG(download_speed_mbps) AS download_speed_mbps_avg,
    AVG(upload_speed_mbps) AS upload_speed_mbps_avg,

    MIN(download_speed_mbps) AS download_speed_mbps_min,
    MAX(download_speed_mbps) AS download_speed_mbps_max,

    MIN(upload_speed_mbps) AS upload_speed_mbps_min,
    MAX(upload_speed_mbps) AS upload_speed_mbps_max,

    STDDEV(download_speed_mbps) AS download_speed_mbps_stddev,
    STDDEV(upload_speed_mbps) AS upload_speed_mbps_stddev,

    SUM(rtt_sum) / SUM(rtt_count) AS rtt_avg,
    AVG(packet_retransmit_rate) AS retransmit_avg,

    -- other:
    concat(STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 0 AND IFNULL(download_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 4 AND IFNULL(download_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 8 AND IFNULL(download_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 12 AND IFNULL(download_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 16 AND IFNULL(download_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 20 AND IFNULL(download_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 24 AND IFNULL(download_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 28 AND IFNULL(download_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 32 AND IFNULL(download_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 36 AND IFNULL(download_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 40 AND IFNULL(download_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 44 AND IFNULL(download_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 48 AND IFNULL(download_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 52 AND IFNULL(download_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 56 AND IFNULL(download_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 60 AND IFNULL(download_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 64 AND IFNULL(download_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 68 AND IFNULL(download_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 72 AND IFNULL(download_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 76 AND IFNULL(download_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 80 AND IFNULL(download_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 84 AND IFNULL(download_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 88 AND IFNULL(download_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 92 AND IFNULL(download_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 96 AND IFNULL(download_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 100, 1,0)))
) as download_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 0 AND IFNULL(upload_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 4 AND IFNULL(upload_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 8 AND IFNULL(upload_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 12 AND IFNULL(upload_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 16 AND IFNULL(upload_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 20 AND IFNULL(upload_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 24 AND IFNULL(upload_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 28 AND IFNULL(upload_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 32 AND IFNULL(upload_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 36 AND IFNULL(upload_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 40 AND IFNULL(upload_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 44 AND IFNULL(upload_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 48 AND IFNULL(upload_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 52 AND IFNULL(upload_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 56 AND IFNULL(upload_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 60 AND IFNULL(upload_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 64 AND IFNULL(upload_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 68 AND IFNULL(upload_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 72 AND IFNULL(upload_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 76 AND IFNULL(upload_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 80 AND IFNULL(upload_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 84 AND IFNULL(upload_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 88 AND IFNULL(upload_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 92 AND IFNULL(upload_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 96 AND IFNULL(upload_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 100, 1,0)))
) as upload_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 50 AND IFNULL(rtt_avg, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 100 AND IFNULL(rtt_avg, 0) < 150, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 150 AND IFNULL(rtt_avg, 0) < 200, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 200 AND IFNULL(rtt_avg, 0) < 250, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 250 AND IFNULL(rtt_avg, 0) < 300, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 300 AND IFNULL(rtt_avg, 0) < 350, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 350 AND IFNULL(rtt_avg, 0) < 400, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 400 AND IFNULL(rtt_avg, 0) < 450, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 450 AND IFNULL(rtt_avg, 0) < 500, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 500 AND IFNULL(rtt_avg, 0) < 550, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 550 AND IFNULL(rtt_avg, 0) < 600, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 600 AND IFNULL(rtt_avg, 0) < 650, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 650 AND IFNULL(rtt_avg, 0) < 700, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 700 AND IFNULL(rtt_avg, 0) < 750, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 750 AND IFNULL(rtt_avg, 0) < 800, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 800 AND IFNULL(rtt_avg, 0) < 850, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 850 AND IFNULL(rtt_avg, 0) < 900, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 900 AND IFNULL(rtt_avg, 0) < 950, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 950 AND IFNULL(rtt_avg, 0) < 1000, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 1000, 1,0)))
) as rtt_avg_bins, 
concat(STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.01 AND IFNULL(packet_retransmit_rate, 0) < 0.02, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.02 AND IFNULL(packet_retransmit_rate, 0) < 0.03, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.03 AND IFNULL(packet_retransmit_rate, 0) < 0.04, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.04 AND IFNULL(packet_retransmit_rate, 0) < 0.05, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.05 AND IFNULL(packet_retransmit_rate, 0) < 0.06, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.06 AND IFNULL(packet_retransmit_rate, 0) < 0.07, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.07 AND IFNULL(packet_retransmit_rate, 0) < 0.08, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.08 AND IFNULL(packet_retransmit_rate, 0) < 0.09, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.09 AND IFNULL(packet_retransmit_rate, 0) < 0.1, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.1, 1,0)))
) as packet_retransmit_rate_bins

  from {0}
  where
    test_date >= DATE_ADD(USEC_TO_TIMESTAMP(NOW()), -1, "YEAR") and
    client_region is not null
  group by
    -- group by location fields
    client_region, 
client_country, 
client_continent, 
client_region_code, 
client_country_code, 
client_continent_code, 
server_asn_number, 
server_asn_name

) last_year on
  -- join on location fields from the all table.
  all.client_region = last_year.client_region and 
all.client_country = last_year.client_country and 
all.client_continent = last_year.client_continent and 
all.client_region_code = last_year.client_region_code and 
all.client_country_code = last_year.client_country_code and 
all.client_continent_code = last_year.client_continent_code and 
all.server_asn_number = last_year.server_asn_number and 
all.server_asn_name = last_year.server_asn_name
left join
(
  SELECT
    count(*) as test_count,

    -- which location fields?
    client_region, 
client_country, 
client_continent, 
client_region_code, 
client_country_code, 
client_continent_code, 
server_asn_number, 
server_asn_name,

    -- measurements:
    nth(51, quantiles(download_speed_mbps, 101)) AS download_speed_mbps_median,
    nth(51, quantiles(upload_speed_mbps, 101)) AS upload_speed_mbps_median,

    AVG(download_speed_mbps) AS download_speed_mbps_avg,
    AVG(upload_speed_mbps) AS upload_speed_mbps_avg,

    MIN(download_speed_mbps) AS download_speed_mbps_min,
    MAX(download_speed_mbps) AS download_speed_mbps_max,

    MIN(upload_speed_mbps) AS upload_speed_mbps_min,
    MAX(upload_speed_mbps) AS upload_speed_mbps_max,

    STDDEV(download_speed_mbps) AS download_speed_mbps_stddev,
    STDDEV(upload_speed_mbps) AS upload_speed_mbps_stddev,

    SUM(rtt_sum) / SUM(rtt_count) AS rtt_avg,
    AVG(packet_retransmit_rate) AS retransmit_avg,

    -- other:
    concat(STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 0 AND IFNULL(download_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 4 AND IFNULL(download_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 8 AND IFNULL(download_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 12 AND IFNULL(download_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 16 AND IFNULL(download_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 20 AND IFNULL(download_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 24 AND IFNULL(download_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 28 AND IFNULL(download_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 32 AND IFNULL(download_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 36 AND IFNULL(download_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 40 AND IFNULL(download_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 44 AND IFNULL(download_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 48 AND IFNULL(download_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 52 AND IFNULL(download_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 56 AND IFNULL(download_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 60 AND IFNULL(download_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 64 AND IFNULL(download_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 68 AND IFNULL(download_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 72 AND IFNULL(download_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 76 AND IFNULL(download_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 80 AND IFNULL(download_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 84 AND IFNULL(download_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 88 AND IFNULL(download_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 92 AND IFNULL(download_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 96 AND IFNULL(download_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 100, 1,0)))
) as download_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 0 AND IFNULL(upload_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 4 AND IFNULL(upload_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 8 AND IFNULL(upload_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 12 AND IFNULL(upload_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 16 AND IFNULL(upload_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 20 AND IFNULL(upload_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 24 AND IFNULL(upload_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 28 AND IFNULL(upload_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 32 AND IFNULL(upload_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 36 AND IFNULL(upload_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 40 AND IFNULL(upload_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 44 AND IFNULL(upload_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 48 AND IFNULL(upload_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 52 AND IFNULL(upload_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 56 AND IFNULL(upload_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 60 AND IFNULL(upload_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 64 AND IFNULL(upload_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 68 AND IFNULL(upload_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 72 AND IFNULL(upload_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 76 AND IFNULL(upload_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 80 AND IFNULL(upload_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 84 AND IFNULL(upload_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 88 AND IFNULL(upload_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 92 AND IFNULL(upload_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 96 AND IFNULL(upload_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 100, 1,0)))
) as upload_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 50 AND IFNULL(rtt_avg, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 100 AND IFNULL(rtt_avg, 0) < 150, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 150 AND IFNULL(rtt_avg, 0) < 200, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 200 AND IFNULL(rtt_avg, 0) < 250, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 250 AND IFNULL(rtt_avg, 0) < 300, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 300 AND IFNULL(rtt_avg, 0) < 350, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 350 AND IFNULL(rtt_avg, 0) < 400, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 400 AND IFNULL(rtt_avg, 0) < 450, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 450 AND IFNULL(rtt_avg, 0) < 500, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 500 AND IFNULL(rtt_avg, 0) < 550, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 550 AND IFNULL(rtt_avg, 0) < 600, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 600 AND IFNULL(rtt_avg, 0) < 650, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 650 AND IFNULL(rtt_avg, 0) < 700, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 700 AND IFNULL(rtt_avg, 0) < 750, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 750 AND IFNULL(rtt_avg, 0) < 800, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 800 AND IFNULL(rtt_avg, 0) < 850, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 850 AND IFNULL(rtt_avg, 0) < 900, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 900 AND IFNULL(rtt_avg, 0) < 950, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 950 AND IFNULL(rtt_avg, 0) < 1000, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 1000, 1,0)))
) as rtt_avg_bins, 
concat(STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.01 AND IFNULL(packet_retransmit_rate, 0) < 0.02, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.02 AND IFNULL(packet_retransmit_rate, 0) < 0.03, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.03 AND IFNULL(packet_retransmit_rate, 0) < 0.04, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.04 AND IFNULL(packet_retransmit_rate, 0) < 0.05, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.05 AND IFNULL(packet_retransmit_rate, 0) < 0.06, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.06 AND IFNULL(packet_retransmit_rate, 0) < 0.07, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.07 AND IFNULL(packet_retransmit_rate, 0) < 0.08, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.08 AND IFNULL(packet_retransmit_rate, 0) < 0.09, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.09 AND IFNULL(packet_retransmit_rate, 0) < 0.1, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.1, 1,0)))
) as packet_retransmit_rate_bins

  from {0}
  where
    test_date >= DATE_ADD(USEC_TO_TIMESTAMP(NOW()), -6, "MONTH") and
    client_region is not null
  group by
    -- group by location fields
    client_region, 
client_country, 
client_continent, 
client_region_code, 
client_country_code, 
client_continent_code, 
server_asn_number, 
server_asn_name

) last_six_months on
  -- join on location fields from the all table.
  all.client_region = last_six_months.client_region and 
all.client_country = last_six_months.client_country and 
all.client_continent = last_six_months.client_continent and 
all.client_region_code = last_six_months.client_region_code and 
all.client_country_code = last_six_months.client_country_code and 
all.client_continent_code = last_six_months.client_continent_code and 
all.server_asn_number = last_six_months.server_asn_number and 
all.server_asn_name = last_six_months.server_asn_name


  GROUP BY

  location_key, 
server_asn_number,
client_region, 
client_country, 
client_continent, 
client_region_code, 
client_country_code, 
client_continent_code, 
server_asn_number, 
server_asn_name,
last_three_months_test_count, 
last_three_months_download_speed_mbps_median, 
last_three_months_upload_speed_mbps_median, 
last_three_months_download_speed_mbps_avg, 
last_three_months_upload_speed_mbps_avg, 
last_three_months_download_speed_mbps_min, 
last_three_months_upload_speed_mbps_min, 
last_three_months_download_speed_mbps_max, 
last_three_months_upload_speed_mbps_max, 
last_three_months_download_speed_mbps_stddev, 
last_three_months_upload_speed_mbps_stddev, 
last_three_months_rtt_avg, 
last_three_months_retransmit_avg, 
last_six_months_test_count, 
last_six_months_download_speed_mbps_median, 
last_six_months_upload_speed_mbps_median, 
last_six_months_download_speed_mbps_avg, 
last_six_months_upload_speed_mbps_avg, 
last_six_months_download_speed_mbps_min, 
last_six_months_upload_speed_mbps_min, 
last_six_months_download_speed_mbps_max, 
last_six_months_upload_speed_mbps_max, 
last_six_months_download_speed_mbps_stddev, 
last_six_months_upload_speed_mbps_stddev, 
last_six_months_rtt_avg, 
last_six_months_retransmit_avg, 
last_year_test_count, 
last_year_download_speed_mbps_median, 
last_year_upload_speed_mbps_median, 
last_year_download_speed_mbps_avg, 
last_year_upload_speed_mbps_avg, 
last_year_download_speed_mbps_min, 
last_year_upload_speed_mbps_min, 
last_year_download_speed_mbps_max, 
last_year_upload_speed_mbps_max, 
last_year_download_speed_mbps_stddev, 
last_year_upload_speed_mbps_stddev, 
last_year_rtt_avg, 
last_year_retransmit_avg, 
last_three_months_download_speed_mbps_bins, 
last_three_months_upload_speed_mbps_bins, 
last_three_months_rtt_avg_bins, 
last_three_months_packet_retransmit_rate_bins, 
last_year_download_speed_mbps_bins, 
last_year_upload_speed_mbps_bins, 
last_year_rtt_avg_bins, 
last_year_packet_retransmit_rate_bins, 
last_six_months_download_speed_mbps_bins, 
last_six_months_upload_speed_mbps_bins, 
last_six_months_rtt_avg_bins, 
last_six_months_packet_retransmit_rate_bins

)
, 
-- ============
-- Type: country
-- ============
(SELECT
  REPLACE(LOWER(CONCAT(IFNULL(all.client_continent_code, ""), ""
,IFNULL(all.client_country_code, ""), ""
)), " ", "") AS location_key,

  -- what is its type?
  "country" AS type,
  count(*) as test_count,

  -- meta fields we are selecting
  all.client_country as client_country,
all.client_continent as client_continent,
all.client_country_code as client_country_code,
all.client_continent_code as client_continent_code,
all.server_asn_number as server_asn_number,
all.server_asn_name as server_asn_name,

  -- timed fields
  last_three_months.test_count as last_three_months_test_count,
last_three_months.download_speed_mbps_median as last_three_months_download_speed_mbps_median,
last_three_months.upload_speed_mbps_median as last_three_months_upload_speed_mbps_median,
last_three_months.download_speed_mbps_avg as last_three_months_download_speed_mbps_avg,
last_three_months.upload_speed_mbps_avg as last_three_months_upload_speed_mbps_avg,
last_three_months.download_speed_mbps_min as last_three_months_download_speed_mbps_min,
last_three_months.upload_speed_mbps_min as last_three_months_upload_speed_mbps_min,
last_three_months.download_speed_mbps_max as last_three_months_download_speed_mbps_max,
last_three_months.upload_speed_mbps_max as last_three_months_upload_speed_mbps_max,
last_three_months.download_speed_mbps_stddev as last_three_months_download_speed_mbps_stddev,
last_three_months.upload_speed_mbps_stddev as last_three_months_upload_speed_mbps_stddev,
last_three_months.rtt_avg as last_three_months_rtt_avg,
last_three_months.retransmit_avg as last_three_months_retransmit_avg,
last_six_months.test_count as last_six_months_test_count,
last_six_months.download_speed_mbps_median as last_six_months_download_speed_mbps_median,
last_six_months.upload_speed_mbps_median as last_six_months_upload_speed_mbps_median,
last_six_months.download_speed_mbps_avg as last_six_months_download_speed_mbps_avg,
last_six_months.upload_speed_mbps_avg as last_six_months_upload_speed_mbps_avg,
last_six_months.download_speed_mbps_min as last_six_months_download_speed_mbps_min,
last_six_months.upload_speed_mbps_min as last_six_months_upload_speed_mbps_min,
last_six_months.download_speed_mbps_max as last_six_months_download_speed_mbps_max,
last_six_months.upload_speed_mbps_max as last_six_months_upload_speed_mbps_max,
last_six_months.download_speed_mbps_stddev as last_six_months_download_speed_mbps_stddev,
last_six_months.upload_speed_mbps_stddev as last_six_months_upload_speed_mbps_stddev,
last_six_months.rtt_avg as last_six_months_rtt_avg,
last_six_months.retransmit_avg as last_six_months_retransmit_avg,
last_year.test_count as last_year_test_count,
last_year.download_speed_mbps_median as last_year_download_speed_mbps_median,
last_year.upload_speed_mbps_median as last_year_upload_speed_mbps_median,
last_year.download_speed_mbps_avg as last_year_download_speed_mbps_avg,
last_year.upload_speed_mbps_avg as last_year_upload_speed_mbps_avg,
last_year.download_speed_mbps_min as last_year_download_speed_mbps_min,
last_year.upload_speed_mbps_min as last_year_upload_speed_mbps_min,
last_year.download_speed_mbps_max as last_year_download_speed_mbps_max,
last_year.upload_speed_mbps_max as last_year_upload_speed_mbps_max,
last_year.download_speed_mbps_stddev as last_year_download_speed_mbps_stddev,
last_year.upload_speed_mbps_stddev as last_year_upload_speed_mbps_stddev,
last_year.rtt_avg as last_year_rtt_avg,
last_year.retransmit_avg as last_year_retransmit_avg,
last_three_months.download_speed_mbps_bins as last_three_months_download_speed_mbps_bins, 
last_three_months.upload_speed_mbps_bins as last_three_months_upload_speed_mbps_bins, 
last_three_months.rtt_avg_bins as last_three_months_rtt_avg_bins, 
last_three_months.packet_retransmit_rate_bins as last_three_months_packet_retransmit_rate_bins, 
last_year.download_speed_mbps_bins as last_year_download_speed_mbps_bins, 
last_year.upload_speed_mbps_bins as last_year_upload_speed_mbps_bins, 
last_year.rtt_avg_bins as last_year_rtt_avg_bins, 
last_year.packet_retransmit_rate_bins as last_year_packet_retransmit_rate_bins, 
last_six_months.download_speed_mbps_bins as last_six_months_download_speed_mbps_bins, 
last_six_months.upload_speed_mbps_bins as last_six_months_upload_speed_mbps_bins, 
last_six_months.rtt_avg_bins as last_six_months_rtt_avg_bins, 
last_six_months.packet_retransmit_rate_bins as last_six_months_packet_retransmit_rate_bins

  FROM {0} all

  -- left join madness here!
  left join
(
  SELECT
    count(*) as test_count,

    -- which location fields?
    client_country, 
client_continent, 
client_country_code, 
client_continent_code, 
server_asn_number, 
server_asn_name,

    -- measurements:
    nth(51, quantiles(download_speed_mbps, 101)) AS download_speed_mbps_median,
    nth(51, quantiles(upload_speed_mbps, 101)) AS upload_speed_mbps_median,

    AVG(download_speed_mbps) AS download_speed_mbps_avg,
    AVG(upload_speed_mbps) AS upload_speed_mbps_avg,

    MIN(download_speed_mbps) AS download_speed_mbps_min,
    MAX(download_speed_mbps) AS download_speed_mbps_max,

    MIN(upload_speed_mbps) AS upload_speed_mbps_min,
    MAX(upload_speed_mbps) AS upload_speed_mbps_max,

    STDDEV(download_speed_mbps) AS download_speed_mbps_stddev,
    STDDEV(upload_speed_mbps) AS upload_speed_mbps_stddev,

    SUM(rtt_sum) / SUM(rtt_count) AS rtt_avg,
    AVG(packet_retransmit_rate) AS retransmit_avg,

    -- other:
    concat(STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 0 AND IFNULL(download_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 4 AND IFNULL(download_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 8 AND IFNULL(download_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 12 AND IFNULL(download_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 16 AND IFNULL(download_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 20 AND IFNULL(download_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 24 AND IFNULL(download_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 28 AND IFNULL(download_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 32 AND IFNULL(download_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 36 AND IFNULL(download_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 40 AND IFNULL(download_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 44 AND IFNULL(download_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 48 AND IFNULL(download_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 52 AND IFNULL(download_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 56 AND IFNULL(download_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 60 AND IFNULL(download_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 64 AND IFNULL(download_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 68 AND IFNULL(download_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 72 AND IFNULL(download_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 76 AND IFNULL(download_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 80 AND IFNULL(download_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 84 AND IFNULL(download_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 88 AND IFNULL(download_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 92 AND IFNULL(download_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 96 AND IFNULL(download_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 100, 1,0)))
) as download_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 0 AND IFNULL(upload_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 4 AND IFNULL(upload_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 8 AND IFNULL(upload_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 12 AND IFNULL(upload_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 16 AND IFNULL(upload_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 20 AND IFNULL(upload_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 24 AND IFNULL(upload_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 28 AND IFNULL(upload_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 32 AND IFNULL(upload_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 36 AND IFNULL(upload_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 40 AND IFNULL(upload_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 44 AND IFNULL(upload_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 48 AND IFNULL(upload_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 52 AND IFNULL(upload_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 56 AND IFNULL(upload_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 60 AND IFNULL(upload_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 64 AND IFNULL(upload_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 68 AND IFNULL(upload_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 72 AND IFNULL(upload_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 76 AND IFNULL(upload_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 80 AND IFNULL(upload_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 84 AND IFNULL(upload_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 88 AND IFNULL(upload_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 92 AND IFNULL(upload_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 96 AND IFNULL(upload_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 100, 1,0)))
) as upload_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 50 AND IFNULL(rtt_avg, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 100 AND IFNULL(rtt_avg, 0) < 150, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 150 AND IFNULL(rtt_avg, 0) < 200, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 200 AND IFNULL(rtt_avg, 0) < 250, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 250 AND IFNULL(rtt_avg, 0) < 300, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 300 AND IFNULL(rtt_avg, 0) < 350, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 350 AND IFNULL(rtt_avg, 0) < 400, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 400 AND IFNULL(rtt_avg, 0) < 450, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 450 AND IFNULL(rtt_avg, 0) < 500, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 500 AND IFNULL(rtt_avg, 0) < 550, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 550 AND IFNULL(rtt_avg, 0) < 600, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 600 AND IFNULL(rtt_avg, 0) < 650, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 650 AND IFNULL(rtt_avg, 0) < 700, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 700 AND IFNULL(rtt_avg, 0) < 750, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 750 AND IFNULL(rtt_avg, 0) < 800, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 800 AND IFNULL(rtt_avg, 0) < 850, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 850 AND IFNULL(rtt_avg, 0) < 900, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 900 AND IFNULL(rtt_avg, 0) < 950, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 950 AND IFNULL(rtt_avg, 0) < 1000, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 1000, 1,0)))
) as rtt_avg_bins, 
concat(STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.01 AND IFNULL(packet_retransmit_rate, 0) < 0.02, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.02 AND IFNULL(packet_retransmit_rate, 0) < 0.03, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.03 AND IFNULL(packet_retransmit_rate, 0) < 0.04, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.04 AND IFNULL(packet_retransmit_rate, 0) < 0.05, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.05 AND IFNULL(packet_retransmit_rate, 0) < 0.06, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.06 AND IFNULL(packet_retransmit_rate, 0) < 0.07, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.07 AND IFNULL(packet_retransmit_rate, 0) < 0.08, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.08 AND IFNULL(packet_retransmit_rate, 0) < 0.09, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.09 AND IFNULL(packet_retransmit_rate, 0) < 0.1, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.1, 1,0)))
) as packet_retransmit_rate_bins

  from {0}
  where
    test_date >= DATE_ADD(USEC_TO_TIMESTAMP(NOW()), -3, "MONTH") and
    client_country is not null
  group by
    -- group by location fields
    client_country, 
client_continent, 
client_country_code, 
client_continent_code, 
server_asn_number, 
server_asn_name

) last_three_months on
  -- join on location fields from the all table.
  all.client_country = last_three_months.client_country and 
all.client_continent = last_three_months.client_continent and 
all.client_country_code = last_three_months.client_country_code and 
all.client_continent_code = last_three_months.client_continent_code and 
all.server_asn_number = last_three_months.server_asn_number and 
all.server_asn_name = last_three_months.server_asn_name
left join
(
  SELECT
    count(*) as test_count,

    -- which location fields?
    client_country, 
client_continent, 
client_country_code, 
client_continent_code, 
server_asn_number, 
server_asn_name,

    -- measurements:
    nth(51, quantiles(download_speed_mbps, 101)) AS download_speed_mbps_median,
    nth(51, quantiles(upload_speed_mbps, 101)) AS upload_speed_mbps_median,

    AVG(download_speed_mbps) AS download_speed_mbps_avg,
    AVG(upload_speed_mbps) AS upload_speed_mbps_avg,

    MIN(download_speed_mbps) AS download_speed_mbps_min,
    MAX(download_speed_mbps) AS download_speed_mbps_max,

    MIN(upload_speed_mbps) AS upload_speed_mbps_min,
    MAX(upload_speed_mbps) AS upload_speed_mbps_max,

    STDDEV(download_speed_mbps) AS download_speed_mbps_stddev,
    STDDEV(upload_speed_mbps) AS upload_speed_mbps_stddev,

    SUM(rtt_sum) / SUM(rtt_count) AS rtt_avg,
    AVG(packet_retransmit_rate) AS retransmit_avg,

    -- other:
    concat(STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 0 AND IFNULL(download_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 4 AND IFNULL(download_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 8 AND IFNULL(download_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 12 AND IFNULL(download_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 16 AND IFNULL(download_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 20 AND IFNULL(download_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 24 AND IFNULL(download_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 28 AND IFNULL(download_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 32 AND IFNULL(download_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 36 AND IFNULL(download_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 40 AND IFNULL(download_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 44 AND IFNULL(download_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 48 AND IFNULL(download_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 52 AND IFNULL(download_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 56 AND IFNULL(download_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 60 AND IFNULL(download_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 64 AND IFNULL(download_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 68 AND IFNULL(download_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 72 AND IFNULL(download_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 76 AND IFNULL(download_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 80 AND IFNULL(download_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 84 AND IFNULL(download_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 88 AND IFNULL(download_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 92 AND IFNULL(download_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 96 AND IFNULL(download_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 100, 1,0)))
) as download_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 0 AND IFNULL(upload_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 4 AND IFNULL(upload_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 8 AND IFNULL(upload_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 12 AND IFNULL(upload_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 16 AND IFNULL(upload_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 20 AND IFNULL(upload_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 24 AND IFNULL(upload_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 28 AND IFNULL(upload_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 32 AND IFNULL(upload_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 36 AND IFNULL(upload_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 40 AND IFNULL(upload_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 44 AND IFNULL(upload_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 48 AND IFNULL(upload_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 52 AND IFNULL(upload_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 56 AND IFNULL(upload_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 60 AND IFNULL(upload_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 64 AND IFNULL(upload_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 68 AND IFNULL(upload_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 72 AND IFNULL(upload_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 76 AND IFNULL(upload_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 80 AND IFNULL(upload_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 84 AND IFNULL(upload_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 88 AND IFNULL(upload_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 92 AND IFNULL(upload_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 96 AND IFNULL(upload_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 100, 1,0)))
) as upload_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 50 AND IFNULL(rtt_avg, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 100 AND IFNULL(rtt_avg, 0) < 150, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 150 AND IFNULL(rtt_avg, 0) < 200, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 200 AND IFNULL(rtt_avg, 0) < 250, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 250 AND IFNULL(rtt_avg, 0) < 300, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 300 AND IFNULL(rtt_avg, 0) < 350, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 350 AND IFNULL(rtt_avg, 0) < 400, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 400 AND IFNULL(rtt_avg, 0) < 450, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 450 AND IFNULL(rtt_avg, 0) < 500, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 500 AND IFNULL(rtt_avg, 0) < 550, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 550 AND IFNULL(rtt_avg, 0) < 600, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 600 AND IFNULL(rtt_avg, 0) < 650, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 650 AND IFNULL(rtt_avg, 0) < 700, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 700 AND IFNULL(rtt_avg, 0) < 750, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 750 AND IFNULL(rtt_avg, 0) < 800, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 800 AND IFNULL(rtt_avg, 0) < 850, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 850 AND IFNULL(rtt_avg, 0) < 900, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 900 AND IFNULL(rtt_avg, 0) < 950, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 950 AND IFNULL(rtt_avg, 0) < 1000, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 1000, 1,0)))
) as rtt_avg_bins, 
concat(STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.01 AND IFNULL(packet_retransmit_rate, 0) < 0.02, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.02 AND IFNULL(packet_retransmit_rate, 0) < 0.03, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.03 AND IFNULL(packet_retransmit_rate, 0) < 0.04, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.04 AND IFNULL(packet_retransmit_rate, 0) < 0.05, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.05 AND IFNULL(packet_retransmit_rate, 0) < 0.06, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.06 AND IFNULL(packet_retransmit_rate, 0) < 0.07, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.07 AND IFNULL(packet_retransmit_rate, 0) < 0.08, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.08 AND IFNULL(packet_retransmit_rate, 0) < 0.09, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.09 AND IFNULL(packet_retransmit_rate, 0) < 0.1, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.1, 1,0)))
) as packet_retransmit_rate_bins

  from {0}
  where
    test_date >= DATE_ADD(USEC_TO_TIMESTAMP(NOW()), -1, "YEAR") and
    client_country is not null
  group by
    -- group by location fields
    client_country, 
client_continent, 
client_country_code, 
client_continent_code, 
server_asn_number, 
server_asn_name

) last_year on
  -- join on location fields from the all table.
  all.client_country = last_year.client_country and 
all.client_continent = last_year.client_continent and 
all.client_country_code = last_year.client_country_code and 
all.client_continent_code = last_year.client_continent_code and 
all.server_asn_number = last_year.server_asn_number and 
all.server_asn_name = last_year.server_asn_name
left join
(
  SELECT
    count(*) as test_count,

    -- which location fields?
    client_country, 
client_continent, 
client_country_code, 
client_continent_code, 
server_asn_number, 
server_asn_name,

    -- measurements:
    nth(51, quantiles(download_speed_mbps, 101)) AS download_speed_mbps_median,
    nth(51, quantiles(upload_speed_mbps, 101)) AS upload_speed_mbps_median,

    AVG(download_speed_mbps) AS download_speed_mbps_avg,
    AVG(upload_speed_mbps) AS upload_speed_mbps_avg,

    MIN(download_speed_mbps) AS download_speed_mbps_min,
    MAX(download_speed_mbps) AS download_speed_mbps_max,

    MIN(upload_speed_mbps) AS upload_speed_mbps_min,
    MAX(upload_speed_mbps) AS upload_speed_mbps_max,

    STDDEV(download_speed_mbps) AS download_speed_mbps_stddev,
    STDDEV(upload_speed_mbps) AS upload_speed_mbps_stddev,

    SUM(rtt_sum) / SUM(rtt_count) AS rtt_avg,
    AVG(packet_retransmit_rate) AS retransmit_avg,

    -- other:
    concat(STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 0 AND IFNULL(download_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 4 AND IFNULL(download_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 8 AND IFNULL(download_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 12 AND IFNULL(download_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 16 AND IFNULL(download_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 20 AND IFNULL(download_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 24 AND IFNULL(download_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 28 AND IFNULL(download_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 32 AND IFNULL(download_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 36 AND IFNULL(download_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 40 AND IFNULL(download_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 44 AND IFNULL(download_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 48 AND IFNULL(download_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 52 AND IFNULL(download_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 56 AND IFNULL(download_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 60 AND IFNULL(download_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 64 AND IFNULL(download_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 68 AND IFNULL(download_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 72 AND IFNULL(download_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 76 AND IFNULL(download_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 80 AND IFNULL(download_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 84 AND IFNULL(download_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 88 AND IFNULL(download_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 92 AND IFNULL(download_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 96 AND IFNULL(download_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 100, 1,0)))
) as download_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 0 AND IFNULL(upload_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 4 AND IFNULL(upload_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 8 AND IFNULL(upload_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 12 AND IFNULL(upload_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 16 AND IFNULL(upload_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 20 AND IFNULL(upload_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 24 AND IFNULL(upload_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 28 AND IFNULL(upload_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 32 AND IFNULL(upload_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 36 AND IFNULL(upload_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 40 AND IFNULL(upload_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 44 AND IFNULL(upload_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 48 AND IFNULL(upload_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 52 AND IFNULL(upload_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 56 AND IFNULL(upload_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 60 AND IFNULL(upload_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 64 AND IFNULL(upload_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 68 AND IFNULL(upload_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 72 AND IFNULL(upload_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 76 AND IFNULL(upload_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 80 AND IFNULL(upload_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 84 AND IFNULL(upload_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 88 AND IFNULL(upload_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 92 AND IFNULL(upload_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 96 AND IFNULL(upload_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 100, 1,0)))
) as upload_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 50 AND IFNULL(rtt_avg, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 100 AND IFNULL(rtt_avg, 0) < 150, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 150 AND IFNULL(rtt_avg, 0) < 200, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 200 AND IFNULL(rtt_avg, 0) < 250, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 250 AND IFNULL(rtt_avg, 0) < 300, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 300 AND IFNULL(rtt_avg, 0) < 350, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 350 AND IFNULL(rtt_avg, 0) < 400, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 400 AND IFNULL(rtt_avg, 0) < 450, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 450 AND IFNULL(rtt_avg, 0) < 500, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 500 AND IFNULL(rtt_avg, 0) < 550, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 550 AND IFNULL(rtt_avg, 0) < 600, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 600 AND IFNULL(rtt_avg, 0) < 650, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 650 AND IFNULL(rtt_avg, 0) < 700, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 700 AND IFNULL(rtt_avg, 0) < 750, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 750 AND IFNULL(rtt_avg, 0) < 800, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 800 AND IFNULL(rtt_avg, 0) < 850, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 850 AND IFNULL(rtt_avg, 0) < 900, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 900 AND IFNULL(rtt_avg, 0) < 950, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 950 AND IFNULL(rtt_avg, 0) < 1000, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 1000, 1,0)))
) as rtt_avg_bins, 
concat(STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.01 AND IFNULL(packet_retransmit_rate, 0) < 0.02, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.02 AND IFNULL(packet_retransmit_rate, 0) < 0.03, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.03 AND IFNULL(packet_retransmit_rate, 0) < 0.04, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.04 AND IFNULL(packet_retransmit_rate, 0) < 0.05, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.05 AND IFNULL(packet_retransmit_rate, 0) < 0.06, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.06 AND IFNULL(packet_retransmit_rate, 0) < 0.07, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.07 AND IFNULL(packet_retransmit_rate, 0) < 0.08, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.08 AND IFNULL(packet_retransmit_rate, 0) < 0.09, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.09 AND IFNULL(packet_retransmit_rate, 0) < 0.1, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.1, 1,0)))
) as packet_retransmit_rate_bins

  from {0}
  where
    test_date >= DATE_ADD(USEC_TO_TIMESTAMP(NOW()), -6, "MONTH") and
    client_country is not null
  group by
    -- group by location fields
    client_country, 
client_continent, 
client_country_code, 
client_continent_code, 
server_asn_number, 
server_asn_name

) last_six_months on
  -- join on location fields from the all table.
  all.client_country = last_six_months.client_country and 
all.client_continent = last_six_months.client_continent and 
all.client_country_code = last_six_months.client_country_code and 
all.client_continent_code = last_six_months.client_continent_code and 
all.server_asn_number = last_six_months.server_asn_number and 
all.server_asn_name = last_six_months.server_asn_name


  GROUP BY

  location_key, 
server_asn_number,
client_country, 
client_continent, 
client_country_code, 
client_continent_code, 
server_asn_number, 
server_asn_name,
last_three_months_test_count, 
last_three_months_download_speed_mbps_median, 
last_three_months_upload_speed_mbps_median, 
last_three_months_download_speed_mbps_avg, 
last_three_months_upload_speed_mbps_avg, 
last_three_months_download_speed_mbps_min, 
last_three_months_upload_speed_mbps_min, 
last_three_months_download_speed_mbps_max, 
last_three_months_upload_speed_mbps_max, 
last_three_months_download_speed_mbps_stddev, 
last_three_months_upload_speed_mbps_stddev, 
last_three_months_rtt_avg, 
last_three_months_retransmit_avg, 
last_six_months_test_count, 
last_six_months_download_speed_mbps_median, 
last_six_months_upload_speed_mbps_median, 
last_six_months_download_speed_mbps_avg, 
last_six_months_upload_speed_mbps_avg, 
last_six_months_download_speed_mbps_min, 
last_six_months_upload_speed_mbps_min, 
last_six_months_download_speed_mbps_max, 
last_six_months_upload_speed_mbps_max, 
last_six_months_download_speed_mbps_stddev, 
last_six_months_upload_speed_mbps_stddev, 
last_six_months_rtt_avg, 
last_six_months_retransmit_avg, 
last_year_test_count, 
last_year_download_speed_mbps_median, 
last_year_upload_speed_mbps_median, 
last_year_download_speed_mbps_avg, 
last_year_upload_speed_mbps_avg, 
last_year_download_speed_mbps_min, 
last_year_upload_speed_mbps_min, 
last_year_download_speed_mbps_max, 
last_year_upload_speed_mbps_max, 
last_year_download_speed_mbps_stddev, 
last_year_upload_speed_mbps_stddev, 
last_year_rtt_avg, 
last_year_retransmit_avg, 
last_three_months_download_speed_mbps_bins, 
last_three_months_upload_speed_mbps_bins, 
last_three_months_rtt_avg_bins, 
last_three_months_packet_retransmit_rate_bins, 
last_year_download_speed_mbps_bins, 
last_year_upload_speed_mbps_bins, 
last_year_rtt_avg_bins, 
last_year_packet_retransmit_rate_bins, 
last_six_months_download_speed_mbps_bins, 
last_six_months_upload_speed_mbps_bins, 
last_six_months_rtt_avg_bins, 
last_six_months_packet_retransmit_rate_bins

)
, 
-- ============
-- Type: continent
-- ============
(SELECT
  LOWER(IFNULL(all.client_continent_code, "")) AS location_key,

  -- what is its type?
  "continent" AS type,
  count(*) as test_count,

  -- meta fields we are selecting
  all.client_continent as client_continent,
all.client_continent_code as client_continent_code,
all.server_asn_number as server_asn_number,
all.server_asn_name as server_asn_name,

  -- timed fields
  last_three_months.test_count as last_three_months_test_count,
last_three_months.download_speed_mbps_median as last_three_months_download_speed_mbps_median,
last_three_months.upload_speed_mbps_median as last_three_months_upload_speed_mbps_median,
last_three_months.download_speed_mbps_avg as last_three_months_download_speed_mbps_avg,
last_three_months.upload_speed_mbps_avg as last_three_months_upload_speed_mbps_avg,
last_three_months.download_speed_mbps_min as last_three_months_download_speed_mbps_min,
last_three_months.upload_speed_mbps_min as last_three_months_upload_speed_mbps_min,
last_three_months.download_speed_mbps_max as last_three_months_download_speed_mbps_max,
last_three_months.upload_speed_mbps_max as last_three_months_upload_speed_mbps_max,
last_three_months.download_speed_mbps_stddev as last_three_months_download_speed_mbps_stddev,
last_three_months.upload_speed_mbps_stddev as last_three_months_upload_speed_mbps_stddev,
last_three_months.rtt_avg as last_three_months_rtt_avg,
last_three_months.retransmit_avg as last_three_months_retransmit_avg,
last_six_months.test_count as last_six_months_test_count,
last_six_months.download_speed_mbps_median as last_six_months_download_speed_mbps_median,
last_six_months.upload_speed_mbps_median as last_six_months_upload_speed_mbps_median,
last_six_months.download_speed_mbps_avg as last_six_months_download_speed_mbps_avg,
last_six_months.upload_speed_mbps_avg as last_six_months_upload_speed_mbps_avg,
last_six_months.download_speed_mbps_min as last_six_months_download_speed_mbps_min,
last_six_months.upload_speed_mbps_min as last_six_months_upload_speed_mbps_min,
last_six_months.download_speed_mbps_max as last_six_months_download_speed_mbps_max,
last_six_months.upload_speed_mbps_max as last_six_months_upload_speed_mbps_max,
last_six_months.download_speed_mbps_stddev as last_six_months_download_speed_mbps_stddev,
last_six_months.upload_speed_mbps_stddev as last_six_months_upload_speed_mbps_stddev,
last_six_months.rtt_avg as last_six_months_rtt_avg,
last_six_months.retransmit_avg as last_six_months_retransmit_avg,
last_year.test_count as last_year_test_count,
last_year.download_speed_mbps_median as last_year_download_speed_mbps_median,
last_year.upload_speed_mbps_median as last_year_upload_speed_mbps_median,
last_year.download_speed_mbps_avg as last_year_download_speed_mbps_avg,
last_year.upload_speed_mbps_avg as last_year_upload_speed_mbps_avg,
last_year.download_speed_mbps_min as last_year_download_speed_mbps_min,
last_year.upload_speed_mbps_min as last_year_upload_speed_mbps_min,
last_year.download_speed_mbps_max as last_year_download_speed_mbps_max,
last_year.upload_speed_mbps_max as last_year_upload_speed_mbps_max,
last_year.download_speed_mbps_stddev as last_year_download_speed_mbps_stddev,
last_year.upload_speed_mbps_stddev as last_year_upload_speed_mbps_stddev,
last_year.rtt_avg as last_year_rtt_avg,
last_year.retransmit_avg as last_year_retransmit_avg,
last_three_months.download_speed_mbps_bins as last_three_months_download_speed_mbps_bins, 
last_three_months.upload_speed_mbps_bins as last_three_months_upload_speed_mbps_bins, 
last_three_months.rtt_avg_bins as last_three_months_rtt_avg_bins, 
last_three_months.packet_retransmit_rate_bins as last_three_months_packet_retransmit_rate_bins, 
last_year.download_speed_mbps_bins as last_year_download_speed_mbps_bins, 
last_year.upload_speed_mbps_bins as last_year_upload_speed_mbps_bins, 
last_year.rtt_avg_bins as last_year_rtt_avg_bins, 
last_year.packet_retransmit_rate_bins as last_year_packet_retransmit_rate_bins, 
last_six_months.download_speed_mbps_bins as last_six_months_download_speed_mbps_bins, 
last_six_months.upload_speed_mbps_bins as last_six_months_upload_speed_mbps_bins, 
last_six_months.rtt_avg_bins as last_six_months_rtt_avg_bins, 
last_six_months.packet_retransmit_rate_bins as last_six_months_packet_retransmit_rate_bins

  FROM {0} all

  -- left join madness here!
  left join
(
  SELECT
    count(*) as test_count,

    -- which location fields?
    client_continent, 
client_continent_code, 
server_asn_number, 
server_asn_name,

    -- measurements:
    nth(51, quantiles(download_speed_mbps, 101)) AS download_speed_mbps_median,
    nth(51, quantiles(upload_speed_mbps, 101)) AS upload_speed_mbps_median,

    AVG(download_speed_mbps) AS download_speed_mbps_avg,
    AVG(upload_speed_mbps) AS upload_speed_mbps_avg,

    MIN(download_speed_mbps) AS download_speed_mbps_min,
    MAX(download_speed_mbps) AS download_speed_mbps_max,

    MIN(upload_speed_mbps) AS upload_speed_mbps_min,
    MAX(upload_speed_mbps) AS upload_speed_mbps_max,

    STDDEV(download_speed_mbps) AS download_speed_mbps_stddev,
    STDDEV(upload_speed_mbps) AS upload_speed_mbps_stddev,

    SUM(rtt_sum) / SUM(rtt_count) AS rtt_avg,
    AVG(packet_retransmit_rate) AS retransmit_avg,

    -- other:
    concat(STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 0 AND IFNULL(download_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 4 AND IFNULL(download_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 8 AND IFNULL(download_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 12 AND IFNULL(download_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 16 AND IFNULL(download_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 20 AND IFNULL(download_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 24 AND IFNULL(download_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 28 AND IFNULL(download_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 32 AND IFNULL(download_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 36 AND IFNULL(download_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 40 AND IFNULL(download_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 44 AND IFNULL(download_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 48 AND IFNULL(download_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 52 AND IFNULL(download_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 56 AND IFNULL(download_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 60 AND IFNULL(download_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 64 AND IFNULL(download_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 68 AND IFNULL(download_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 72 AND IFNULL(download_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 76 AND IFNULL(download_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 80 AND IFNULL(download_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 84 AND IFNULL(download_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 88 AND IFNULL(download_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 92 AND IFNULL(download_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 96 AND IFNULL(download_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 100, 1,0)))
) as download_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 0 AND IFNULL(upload_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 4 AND IFNULL(upload_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 8 AND IFNULL(upload_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 12 AND IFNULL(upload_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 16 AND IFNULL(upload_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 20 AND IFNULL(upload_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 24 AND IFNULL(upload_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 28 AND IFNULL(upload_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 32 AND IFNULL(upload_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 36 AND IFNULL(upload_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 40 AND IFNULL(upload_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 44 AND IFNULL(upload_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 48 AND IFNULL(upload_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 52 AND IFNULL(upload_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 56 AND IFNULL(upload_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 60 AND IFNULL(upload_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 64 AND IFNULL(upload_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 68 AND IFNULL(upload_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 72 AND IFNULL(upload_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 76 AND IFNULL(upload_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 80 AND IFNULL(upload_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 84 AND IFNULL(upload_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 88 AND IFNULL(upload_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 92 AND IFNULL(upload_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 96 AND IFNULL(upload_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 100, 1,0)))
) as upload_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 50 AND IFNULL(rtt_avg, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 100 AND IFNULL(rtt_avg, 0) < 150, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 150 AND IFNULL(rtt_avg, 0) < 200, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 200 AND IFNULL(rtt_avg, 0) < 250, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 250 AND IFNULL(rtt_avg, 0) < 300, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 300 AND IFNULL(rtt_avg, 0) < 350, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 350 AND IFNULL(rtt_avg, 0) < 400, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 400 AND IFNULL(rtt_avg, 0) < 450, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 450 AND IFNULL(rtt_avg, 0) < 500, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 500 AND IFNULL(rtt_avg, 0) < 550, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 550 AND IFNULL(rtt_avg, 0) < 600, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 600 AND IFNULL(rtt_avg, 0) < 650, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 650 AND IFNULL(rtt_avg, 0) < 700, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 700 AND IFNULL(rtt_avg, 0) < 750, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 750 AND IFNULL(rtt_avg, 0) < 800, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 800 AND IFNULL(rtt_avg, 0) < 850, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 850 AND IFNULL(rtt_avg, 0) < 900, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 900 AND IFNULL(rtt_avg, 0) < 950, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 950 AND IFNULL(rtt_avg, 0) < 1000, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 1000, 1,0)))
) as rtt_avg_bins, 
concat(STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.01 AND IFNULL(packet_retransmit_rate, 0) < 0.02, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.02 AND IFNULL(packet_retransmit_rate, 0) < 0.03, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.03 AND IFNULL(packet_retransmit_rate, 0) < 0.04, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.04 AND IFNULL(packet_retransmit_rate, 0) < 0.05, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.05 AND IFNULL(packet_retransmit_rate, 0) < 0.06, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.06 AND IFNULL(packet_retransmit_rate, 0) < 0.07, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.07 AND IFNULL(packet_retransmit_rate, 0) < 0.08, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.08 AND IFNULL(packet_retransmit_rate, 0) < 0.09, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.09 AND IFNULL(packet_retransmit_rate, 0) < 0.1, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.1, 1,0)))
) as packet_retransmit_rate_bins

  from {0}
  where
    test_date >= DATE_ADD(USEC_TO_TIMESTAMP(NOW()), -3, "MONTH") and
    client_continent is not null
  group by
    -- group by location fields
    client_continent, 
client_continent_code, 
server_asn_number, 
server_asn_name

) last_three_months on
  -- join on location fields from the all table.
  all.client_continent = last_three_months.client_continent and 
all.client_continent_code = last_three_months.client_continent_code and 
all.server_asn_number = last_three_months.server_asn_number and 
all.server_asn_name = last_three_months.server_asn_name
left join
(
  SELECT
    count(*) as test_count,

    -- which location fields?
    client_continent, 
client_continent_code, 
server_asn_number, 
server_asn_name,

    -- measurements:
    nth(51, quantiles(download_speed_mbps, 101)) AS download_speed_mbps_median,
    nth(51, quantiles(upload_speed_mbps, 101)) AS upload_speed_mbps_median,

    AVG(download_speed_mbps) AS download_speed_mbps_avg,
    AVG(upload_speed_mbps) AS upload_speed_mbps_avg,

    MIN(download_speed_mbps) AS download_speed_mbps_min,
    MAX(download_speed_mbps) AS download_speed_mbps_max,

    MIN(upload_speed_mbps) AS upload_speed_mbps_min,
    MAX(upload_speed_mbps) AS upload_speed_mbps_max,

    STDDEV(download_speed_mbps) AS download_speed_mbps_stddev,
    STDDEV(upload_speed_mbps) AS upload_speed_mbps_stddev,

    SUM(rtt_sum) / SUM(rtt_count) AS rtt_avg,
    AVG(packet_retransmit_rate) AS retransmit_avg,

    -- other:
    concat(STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 0 AND IFNULL(download_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 4 AND IFNULL(download_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 8 AND IFNULL(download_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 12 AND IFNULL(download_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 16 AND IFNULL(download_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 20 AND IFNULL(download_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 24 AND IFNULL(download_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 28 AND IFNULL(download_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 32 AND IFNULL(download_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 36 AND IFNULL(download_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 40 AND IFNULL(download_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 44 AND IFNULL(download_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 48 AND IFNULL(download_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 52 AND IFNULL(download_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 56 AND IFNULL(download_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 60 AND IFNULL(download_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 64 AND IFNULL(download_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 68 AND IFNULL(download_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 72 AND IFNULL(download_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 76 AND IFNULL(download_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 80 AND IFNULL(download_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 84 AND IFNULL(download_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 88 AND IFNULL(download_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 92 AND IFNULL(download_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 96 AND IFNULL(download_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 100, 1,0)))
) as download_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 0 AND IFNULL(upload_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 4 AND IFNULL(upload_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 8 AND IFNULL(upload_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 12 AND IFNULL(upload_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 16 AND IFNULL(upload_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 20 AND IFNULL(upload_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 24 AND IFNULL(upload_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 28 AND IFNULL(upload_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 32 AND IFNULL(upload_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 36 AND IFNULL(upload_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 40 AND IFNULL(upload_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 44 AND IFNULL(upload_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 48 AND IFNULL(upload_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 52 AND IFNULL(upload_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 56 AND IFNULL(upload_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 60 AND IFNULL(upload_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 64 AND IFNULL(upload_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 68 AND IFNULL(upload_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 72 AND IFNULL(upload_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 76 AND IFNULL(upload_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 80 AND IFNULL(upload_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 84 AND IFNULL(upload_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 88 AND IFNULL(upload_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 92 AND IFNULL(upload_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 96 AND IFNULL(upload_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 100, 1,0)))
) as upload_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 50 AND IFNULL(rtt_avg, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 100 AND IFNULL(rtt_avg, 0) < 150, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 150 AND IFNULL(rtt_avg, 0) < 200, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 200 AND IFNULL(rtt_avg, 0) < 250, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 250 AND IFNULL(rtt_avg, 0) < 300, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 300 AND IFNULL(rtt_avg, 0) < 350, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 350 AND IFNULL(rtt_avg, 0) < 400, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 400 AND IFNULL(rtt_avg, 0) < 450, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 450 AND IFNULL(rtt_avg, 0) < 500, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 500 AND IFNULL(rtt_avg, 0) < 550, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 550 AND IFNULL(rtt_avg, 0) < 600, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 600 AND IFNULL(rtt_avg, 0) < 650, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 650 AND IFNULL(rtt_avg, 0) < 700, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 700 AND IFNULL(rtt_avg, 0) < 750, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 750 AND IFNULL(rtt_avg, 0) < 800, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 800 AND IFNULL(rtt_avg, 0) < 850, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 850 AND IFNULL(rtt_avg, 0) < 900, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 900 AND IFNULL(rtt_avg, 0) < 950, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 950 AND IFNULL(rtt_avg, 0) < 1000, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 1000, 1,0)))
) as rtt_avg_bins, 
concat(STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.01 AND IFNULL(packet_retransmit_rate, 0) < 0.02, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.02 AND IFNULL(packet_retransmit_rate, 0) < 0.03, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.03 AND IFNULL(packet_retransmit_rate, 0) < 0.04, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.04 AND IFNULL(packet_retransmit_rate, 0) < 0.05, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.05 AND IFNULL(packet_retransmit_rate, 0) < 0.06, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.06 AND IFNULL(packet_retransmit_rate, 0) < 0.07, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.07 AND IFNULL(packet_retransmit_rate, 0) < 0.08, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.08 AND IFNULL(packet_retransmit_rate, 0) < 0.09, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.09 AND IFNULL(packet_retransmit_rate, 0) < 0.1, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.1, 1,0)))
) as packet_retransmit_rate_bins

  from {0}
  where
    test_date >= DATE_ADD(USEC_TO_TIMESTAMP(NOW()), -1, "YEAR") and
    client_continent is not null
  group by
    -- group by location fields
    client_continent, 
client_continent_code, 
server_asn_number, 
server_asn_name

) last_year on
  -- join on location fields from the all table.
  all.client_continent = last_year.client_continent and 
all.client_continent_code = last_year.client_continent_code and 
all.server_asn_number = last_year.server_asn_number and 
all.server_asn_name = last_year.server_asn_name
left join
(
  SELECT
    count(*) as test_count,

    -- which location fields?
    client_continent, 
client_continent_code, 
server_asn_number, 
server_asn_name,

    -- measurements:
    nth(51, quantiles(download_speed_mbps, 101)) AS download_speed_mbps_median,
    nth(51, quantiles(upload_speed_mbps, 101)) AS upload_speed_mbps_median,

    AVG(download_speed_mbps) AS download_speed_mbps_avg,
    AVG(upload_speed_mbps) AS upload_speed_mbps_avg,

    MIN(download_speed_mbps) AS download_speed_mbps_min,
    MAX(download_speed_mbps) AS download_speed_mbps_max,

    MIN(upload_speed_mbps) AS upload_speed_mbps_min,
    MAX(upload_speed_mbps) AS upload_speed_mbps_max,

    STDDEV(download_speed_mbps) AS download_speed_mbps_stddev,
    STDDEV(upload_speed_mbps) AS upload_speed_mbps_stddev,

    SUM(rtt_sum) / SUM(rtt_count) AS rtt_avg,
    AVG(packet_retransmit_rate) AS retransmit_avg,

    -- other:
    concat(STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 0 AND IFNULL(download_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 4 AND IFNULL(download_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 8 AND IFNULL(download_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 12 AND IFNULL(download_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 16 AND IFNULL(download_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 20 AND IFNULL(download_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 24 AND IFNULL(download_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 28 AND IFNULL(download_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 32 AND IFNULL(download_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 36 AND IFNULL(download_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 40 AND IFNULL(download_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 44 AND IFNULL(download_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 48 AND IFNULL(download_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 52 AND IFNULL(download_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 56 AND IFNULL(download_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 60 AND IFNULL(download_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 64 AND IFNULL(download_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 68 AND IFNULL(download_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 72 AND IFNULL(download_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 76 AND IFNULL(download_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 80 AND IFNULL(download_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 84 AND IFNULL(download_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 88 AND IFNULL(download_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 92 AND IFNULL(download_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 96 AND IFNULL(download_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(download_speed_mbps, 0) >= 100, 1,0)))
) as download_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 0 AND IFNULL(upload_speed_mbps, 0) < 4, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 4 AND IFNULL(upload_speed_mbps, 0) < 8, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 8 AND IFNULL(upload_speed_mbps, 0) < 12, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 12 AND IFNULL(upload_speed_mbps, 0) < 16, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 16 AND IFNULL(upload_speed_mbps, 0) < 20, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 20 AND IFNULL(upload_speed_mbps, 0) < 24, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 24 AND IFNULL(upload_speed_mbps, 0) < 28, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 28 AND IFNULL(upload_speed_mbps, 0) < 32, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 32 AND IFNULL(upload_speed_mbps, 0) < 36, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 36 AND IFNULL(upload_speed_mbps, 0) < 40, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 40 AND IFNULL(upload_speed_mbps, 0) < 44, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 44 AND IFNULL(upload_speed_mbps, 0) < 48, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 48 AND IFNULL(upload_speed_mbps, 0) < 52, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 52 AND IFNULL(upload_speed_mbps, 0) < 56, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 56 AND IFNULL(upload_speed_mbps, 0) < 60, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 60 AND IFNULL(upload_speed_mbps, 0) < 64, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 64 AND IFNULL(upload_speed_mbps, 0) < 68, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 68 AND IFNULL(upload_speed_mbps, 0) < 72, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 72 AND IFNULL(upload_speed_mbps, 0) < 76, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 76 AND IFNULL(upload_speed_mbps, 0) < 80, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 80 AND IFNULL(upload_speed_mbps, 0) < 84, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 84 AND IFNULL(upload_speed_mbps, 0) < 88, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 88 AND IFNULL(upload_speed_mbps, 0) < 92, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 92 AND IFNULL(upload_speed_mbps, 0) < 96, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 96 AND IFNULL(upload_speed_mbps, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(upload_speed_mbps, 0) >= 100, 1,0)))
) as upload_speed_mbps_bins, 
concat(STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 50 AND IFNULL(rtt_avg, 0) < 100, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 100 AND IFNULL(rtt_avg, 0) < 150, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 150 AND IFNULL(rtt_avg, 0) < 200, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 200 AND IFNULL(rtt_avg, 0) < 250, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 250 AND IFNULL(rtt_avg, 0) < 300, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 300 AND IFNULL(rtt_avg, 0) < 350, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 350 AND IFNULL(rtt_avg, 0) < 400, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 400 AND IFNULL(rtt_avg, 0) < 450, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 450 AND IFNULL(rtt_avg, 0) < 500, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 500 AND IFNULL(rtt_avg, 0) < 550, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 550 AND IFNULL(rtt_avg, 0) < 600, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 600 AND IFNULL(rtt_avg, 0) < 650, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 650 AND IFNULL(rtt_avg, 0) < 700, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 700 AND IFNULL(rtt_avg, 0) < 750, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 750 AND IFNULL(rtt_avg, 0) < 800, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 800 AND IFNULL(rtt_avg, 0) < 850, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 850 AND IFNULL(rtt_avg, 0) < 900, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 900 AND IFNULL(rtt_avg, 0) < 950, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 950 AND IFNULL(rtt_avg, 0) < 1000, 1,0))), ",",
STRING(SUM(IF(IFNULL(rtt_avg, 0) >= 1000, 1,0)))
) as rtt_avg_bins, 
concat(STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.01 AND IFNULL(packet_retransmit_rate, 0) < 0.02, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.02 AND IFNULL(packet_retransmit_rate, 0) < 0.03, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.03 AND IFNULL(packet_retransmit_rate, 0) < 0.04, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.04 AND IFNULL(packet_retransmit_rate, 0) < 0.05, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.05 AND IFNULL(packet_retransmit_rate, 0) < 0.06, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.06 AND IFNULL(packet_retransmit_rate, 0) < 0.07, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.07 AND IFNULL(packet_retransmit_rate, 0) < 0.08, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.08 AND IFNULL(packet_retransmit_rate, 0) < 0.09, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.09 AND IFNULL(packet_retransmit_rate, 0) < 0.1, 1,0))), ",",
STRING(SUM(IF(IFNULL(packet_retransmit_rate, 0) >= 0.1, 1,0)))
) as packet_retransmit_rate_bins

  from {0}
  where
    test_date >= DATE_ADD(USEC_TO_TIMESTAMP(NOW()), -6, "MONTH") and
    client_continent is not null
  group by
    -- group by location fields
    client_continent, 
client_continent_code, 
server_asn_number, 
server_asn_name

) last_six_months on
  -- join on location fields from the all table.
  all.client_continent = last_six_months.client_continent and 
all.client_continent_code = last_six_months.client_continent_code and 
all.server_asn_number = last_six_months.server_asn_number and 
all.server_asn_name = last_six_months.server_asn_name


  GROUP BY

  location_key, 
server_asn_number,
client_continent, 
client_continent_code, 
server_asn_number, 
server_asn_name,
last_three_months_test_count, 
last_three_months_download_speed_mbps_median, 
last_three_months_upload_speed_mbps_median, 
last_three_months_download_speed_mbps_avg, 
last_three_months_upload_speed_mbps_avg, 
last_three_months_download_speed_mbps_min, 
last_three_months_upload_speed_mbps_min, 
last_three_months_download_speed_mbps_max, 
last_three_months_upload_speed_mbps_max, 
last_three_months_download_speed_mbps_stddev, 
last_three_months_upload_speed_mbps_stddev, 
last_three_months_rtt_avg, 
last_three_months_retransmit_avg, 
last_six_months_test_count, 
last_six_months_download_speed_mbps_median, 
last_six_months_upload_speed_mbps_median, 
last_six_months_download_speed_mbps_avg, 
last_six_months_upload_speed_mbps_avg, 
last_six_months_download_speed_mbps_min, 
last_six_months_upload_speed_mbps_min, 
last_six_months_download_speed_mbps_max, 
last_six_months_upload_speed_mbps_max, 
last_six_months_download_speed_mbps_stddev, 
last_six_months_upload_speed_mbps_stddev, 
last_six_months_rtt_avg, 
last_six_months_retransmit_avg, 
last_year_test_count, 
last_year_download_speed_mbps_median, 
last_year_upload_speed_mbps_median, 
last_year_download_speed_mbps_avg, 
last_year_upload_speed_mbps_avg, 
last_year_download_speed_mbps_min, 
last_year_upload_speed_mbps_min, 
last_year_download_speed_mbps_max, 
last_year_upload_speed_mbps_max, 
last_year_download_speed_mbps_stddev, 
last_year_upload_speed_mbps_stddev, 
last_year_rtt_avg, 
last_year_retransmit_avg, 
last_three_months_download_speed_mbps_bins, 
last_three_months_upload_speed_mbps_bins, 
last_three_months_rtt_avg_bins, 
last_three_months_packet_retransmit_rate_bins, 
last_year_download_speed_mbps_bins, 
last_year_upload_speed_mbps_bins, 
last_year_rtt_avg_bins, 
last_year_packet_retransmit_rate_bins, 
last_six_months_download_speed_mbps_bins, 
last_six_months_upload_speed_mbps_bins, 
last_six_months_rtt_avg_bins, 
last_six_months_packet_retransmit_rate_bins

)

WHERE last_year_test_count > 60