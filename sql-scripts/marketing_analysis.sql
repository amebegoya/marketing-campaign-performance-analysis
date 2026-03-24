select
  count(*) as total_campaigns,
  sum(clicks) as total_clicks,
  sum(impressions) as total_impressions,
  round(avg(conversion_rate), 4) as avg_conversion_rate,
  round(avg(roi), 2) as avg_roi,
  round(avg(acquisition_cost), 2) as avg_acquisition_cost
from marketing_campaigns_clean;

-- calculating click-through rate
select
  round(sum(clicks)::numeric / nullif(sum(impressions),0), 4) as ctr
from marketing_campaigns_clean;

-- calculating what channel performed best 
select
  channel_used,
  count(*) as campaigns,
  sum(clicks) as total_clicks,
  sum(impressions) as total_impressions,
  round(
    sum(clicks)::numeric / nullif(sum(impressions), 0),
    4
  ) as ctr,
  round(avg(conversion_rate), 4) as avg_conversion_rate,
  round(avg(roi), 2) as avg_roi
from marketing_campaigns_clean
group by channel_used
order by avg_roi desc;

-- successful campaigns 
select
  campaign_type,
  count(*) as campaigns, 
  round(avg(conversion_rate), 4) as avg_conversion_rate,
  round(avg(roi), 2) as avg_roi
from marketing_campaigns_clean
group by campaign_type
order by avg_roi desc;

-- performance over time 
select
  date,
  sum(clicks) as total_clicks,
  sum(impressions) as total_impressions,
  round(
    sum(clicks)::numeric / nullif(sum(impressions), 0),
    4
  ) as ctr,
  round(avg(conversion_rate), 4) as avg_conversion_rate,
  round(avg(roi), 2) as avg_roi
from marketing_campaigns_clean
group by date
order by date;

