
SELECT
  finance.date_date
  ,ROUND(finance.operational_margin - campaigns_day.ads_cost,2) AS ads_margin
  ,finance.average_basket
  ,finance.operational_margin
  ,campaigns_day.ads_cost
  ,campaigns_day.impression
  ,campaigns_day.clicks
  ,finance.nb_of_transactions AS quantity
  ,finance.total_revenue AS revenue
  ,finance.total_purchase_cost AS purchase_cost
  ,finance.margin 
  ,finance.total_shipping_fees AS shipping_fee
  ,finance.total_log_cost AS log_cost
  ,finance.ship_cost
FROM {{ref('finance_days')}}  AS finance
JOIN  {{ref('int_campaigns_day')}}  AS campaigns_day
    ON finance.date_date = campaigns_day.date_date