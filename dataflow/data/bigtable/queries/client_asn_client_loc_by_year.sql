SELECT type,
       client_asn_number,
       client_location_key,
       client_asn_name,
       [date],
       rtt_avg,
       retransmit_avg,
       download_speed_mbps_median,
       upload_speed_mbps_median,
       count,
       client_continent,
       client_continent_code,
       client_country,
       client_country_code,
       client_region,
       client_region_code,
       client_city
FROM
 (SELECT "city" as type,
         client_asn_number,
         REPLACE(LOWER(CONCAT(IFNULL(client_continent_code, ""), IFNULL(client_country_code, ""), IFNULL(client_region_code, ""), IFNULL(client_city, ""), "")), " ", "") AS client_location_key,
         client_asn_name,
         STRFTIME_UTC_USEC(TIMESTAMP_TO_USEC([local_test_date]), "%Y") as date,
         SUM(rtt_sum) / SUM(rtt_count) AS rtt_avg,
         AVG(packet_retransmit_rate) AS retransmit_avg,
         nth(51, quantiles(download_speed_mbps, 101)) AS download_speed_mbps_median,
         nth(51, quantiles(upload_speed_mbps, 101)) AS upload_speed_mbps_median,
         COUNT(*) AS count,
         client_continent,
         client_continent_code,
         client_country,
         client_country_code,
         client_region,
         client_region_code,
         client_city
  FROM {0}
  WHERE LENGTH(client_asn_number) > 0
   AND LENGTH(client_continent) > 0
   AND LENGTH(client_continent_code) > 0
   AND LENGTH(client_country) > 0
   AND LENGTH(client_country_code) > 0
   AND LENGTH(client_region) > 0
   AND LENGTH(client_region_code) > 0
   AND LENGTH(client_city) > 0
  GROUP BY type,
           client_asn_number,
           client_location_key,
           client_asn_name,
           [date],
           client_continent,
           client_continent_code,
           client_country,
           client_country_code,
           client_region,
           client_region_code,
           client_city),
 (SELECT "region" as type,
         client_asn_number,
         REPLACE(LOWER(CONCAT(IFNULL(client_continent_code, ""), IFNULL(client_country_code, ""), IFNULL(client_region_code, ""), "")), " ", "") AS client_location_key,
         client_asn_name,
         STRFTIME_UTC_USEC(TIMESTAMP_TO_USEC([local_test_date]), "%Y") as date,
         SUM(rtt_sum) / SUM(rtt_count) AS rtt_avg,
         AVG(packet_retransmit_rate) AS retransmit_avg,
         nth(51, quantiles(download_speed_mbps, 101)) AS download_speed_mbps_median,
         nth(51, quantiles(upload_speed_mbps, 101)) AS upload_speed_mbps_median,
         COUNT(*) AS count,
         client_continent,
         client_continent_code,
         client_country,
         client_country_code,
         client_region,
         client_region_code
  FROM {0}
  WHERE LENGTH(client_asn_number) > 0
   AND LENGTH(client_continent) > 0
   AND LENGTH(client_continent_code) > 0
   AND LENGTH(client_country) > 0
   AND LENGTH(client_country_code) > 0
   AND LENGTH(client_region) > 0
   AND LENGTH(client_region_code) > 0
  GROUP BY type,
           client_asn_number,
           client_location_key,
           client_asn_name,
           [date],
           client_continent,
           client_continent_code,
           client_country,
           client_country_code,
           client_region,
           client_region_code),
 (SELECT "continent" as type,
         client_asn_number,
         REPLACE(LOWER(CONCAT(IFNULL(client_continent_code, ""), "")), " ", "") AS client_location_key,
         client_asn_name,
         STRFTIME_UTC_USEC(TIMESTAMP_TO_USEC([local_test_date]), "%Y") as date,
         SUM(rtt_sum) / SUM(rtt_count) AS rtt_avg,
         AVG(packet_retransmit_rate) AS retransmit_avg,
         nth(51, quantiles(download_speed_mbps, 101)) AS download_speed_mbps_median,
         nth(51, quantiles(upload_speed_mbps, 101)) AS upload_speed_mbps_median,
         COUNT(*) AS count,
         client_continent,
         client_continent_code
  FROM {0}
  WHERE LENGTH(client_asn_number) > 0
   AND LENGTH(client_continent) > 0
   AND LENGTH(client_continent_code) > 0
  GROUP BY type,
           client_asn_number,
           client_location_key,
           client_asn_name,
           [date],
           client_continent,
           client_continent_code),
 (SELECT "country" as type,
         client_asn_number,
         REPLACE(LOWER(CONCAT(IFNULL(client_continent_code, ""), IFNULL(client_country_code, ""), "")), " ", "") AS client_location_key,
         client_asn_name,
         STRFTIME_UTC_USEC(TIMESTAMP_TO_USEC([local_test_date]), "%Y") as date,
         SUM(rtt_sum) / SUM(rtt_count) AS rtt_avg,
         AVG(packet_retransmit_rate) AS retransmit_avg,
         nth(51, quantiles(download_speed_mbps, 101)) AS download_speed_mbps_median,
         nth(51, quantiles(upload_speed_mbps, 101)) AS upload_speed_mbps_median,
         COUNT(*) AS count,
         client_continent,
         client_continent_code,
         client_country,
         client_country_code
  FROM {0}
  WHERE LENGTH(client_asn_number) > 0
   AND LENGTH(client_continent) > 0
   AND LENGTH(client_continent_code) > 0
   AND LENGTH(client_country) > 0
   AND LENGTH(client_country_code) > 0
  GROUP BY type,
           client_asn_number,
           client_location_key,
           client_asn_name,
           [date],
           client_continent,
           client_continent_code,
           client_country,
           client_country_code)