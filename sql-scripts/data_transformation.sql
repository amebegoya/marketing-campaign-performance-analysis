create or replace view marketing_campaigns_clean as
select
  "Campaign_ID"::bigint        as campaign_id,
  "Company"                   as company,
  "Campaign_Type"             as campaign_type,
  "Target_Audience"           as target_audience,
  "Duration"                  as duration,
  "Channel_Used"              as channel_used,
  "Conversion_Rate"::numeric  as conversion_rate,

  -- "$16,174.00" → 16174.00
  regexp_replace("Acquisition_Cost", '[$,]', '', 'g')::numeric
                               as acquisition_cost,

  "ROI"::numeric              as roi,
  "Location"                  as location,
  "Language"                  as language,
  "Clicks"::bigint            as clicks,
  "Impressions"::bigint       as impressions,
  "Engagement_Score"::numeric as engagement_score,
  "Customer_Segment"          as customer_segment,
  "Date"::date                as date
from marketing_campaigns;
