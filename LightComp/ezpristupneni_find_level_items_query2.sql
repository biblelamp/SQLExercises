with recursive cte (level_view_id, parent_id, `position`, expanded) as
(
	-- vyberu vsechny koreny a nastavim jestli je expandovany
	select level_view_id, parent_id, `position`, level_view_id in (9223372036854775807)
	from level_view
	where order_id=1 and level_view.parent_id is null and level_view.hidden=false
	union distinct
	-- pridam podurovne pokud jsou expandovane a jejich rodic je expandovany
	select zu.level_view_id, zu.parent_id, zu.`position`, true
	from cte
	join level_view zu on cte.level_view_id=zu.parent_id and zu.level_view_id in (9223372036854775807) and cte.expanded=true and zu.hidden=false
)
select distinct zu.level_view_id as id, zu.description as name, zu.depth as depth, zu.leaf, zu.parent_id, zu.`position`, cart_item_id
from cte
join level_view zu on (cte.level_view_id=zu.level_view_id or (zu.parent_id=cte.level_view_id and cte.expanded=true)) and zu.hidden=false
left join cart_item ci on cte.level_view_id=ci.level_view_id
order by zu.position