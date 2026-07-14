{% macro margin_percent(revenue, purchase_cost, round_decimal_places=2) %}
    ROUND(SAFE_DIVIDE(({{ revenue }} - {{purchase_cost}}), {{revenue}}), {{round_decimal_places}}) * 100
{% endmacro %} 