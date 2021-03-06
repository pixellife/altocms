{if $oUserCurrent}
	{literal}
	<script language="JavaScript" type="text/javascript">
		jQuery(document).ready( function() {
			jQuery('#userfeed_users_complete').keydown(function (event) {
				if (event.which == 13) {
					ls.userfeed.appendUser()
				}
			});
		 });
	</script>
	{/literal}


	<section class="b-widget block-type-activity">
		<header class="b-widget-header">
			{$aLang.userfeed_block_users_title}
		</header>
		
		<div class="b-widget-content">
			<small class="note">{$aLang.userfeed_settings_note_follow_user}</small>
			
			<div class="stream-settings-userlist">
				<p><input type="text" id="userfeed_users_complete" autocomplete="off" class="autocomplete-users input-text input-width-200" />
				<a href="javascript:ls.userfeed.appendUser()" class="btn">{$aLang.userfeed_block_users_append}</a></p>
				
				{if count($aUserfeedSubscribedUsers)}
					<ul id="userfeed_block_users_list" class="max-height-200">
						{foreach from=$aUserfeedSubscribedUsers item=oUser}
							{assign var=iUserId value=$oUser->getId()}
							
							{if !isset($aUserfeedFriends.$iUserId)}
								<li><input class="userfeedUserCheckbox input-checkbox"
											type="checkbox"
											id="usf_u_{$iUserId}"
											checked="checked"
											onClick="if (jQuery(this).prop('checked')) { ls.userfeed.subscribe('users',{$iUserId}) } else { ls.userfeed.unsubscribe('users',{$iUserId}) } " />
									<a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a>
								</li>
							{/if}
						{/foreach}
					 </ul>
				{else}
					<ul id="userfeed_block_users_list"></ul>
				{/if}
			</div>
		</div>
	</section>
	
	
	{if count($aUserfeedFriends)}
		<section class="b-widget block-type-activity">
			<header class="b-widget-header">
				{$aLang.userfeed_block_users_friends}
			</header>
			
			<div class="b-widget-content">
				<small class="note">{$aLang.userfeed_settings_note_follow_friend}</small>
				
				<ul class="stream-settings-friends max-height-200">
					{foreach from=$aUserfeedFriends item=oUser}
						{assign var=iUserId value=$oUser->getId()}
						
						<li><input class="userfeedUserCheckbox input-checkbox"
									type="checkbox"
									id="usf_u_{$iUserId}"
									{if isset($aUserfeedSubscribedUsers.$iUserId)} checked="checked"{/if}
									onClick="if (jQuery(this).prop('checked')) { ls.userfeed.subscribe('users',{$iUserId}) } else { ls.userfeed.unsubscribe('users',{$iUserId}) } " />
							<a href="{$oUser->getUserWebPath()}">{$oUser->getLogin()}</a>
						</li>
					{/foreach}
				</ul>
			</div>
		</section>
	{/if}
{/if}