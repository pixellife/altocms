<div class="nav-filter-wrapper">
    <ul class="b-nav-filter">
        <li {if $sMenuItemSelect=='all'}class="active"{/if}><a href="{router page='people'}">{$aLang.people_menu_users_all}</a></li>
        <li {if $sMenuItemSelect=='online'}class="active"{/if}><a href="{router page='people'}online/">{$aLang.people_menu_users_online}</a></li>
        <li {if $sMenuItemSelect=='new'}class="active"{/if}><a href="{router page='people'}new/">{$aLang.people_menu_users_new}</a></li>

        {hook run='menu_people_people_item'}
    </ul>

    {hook run='menu_people'}

</div>

