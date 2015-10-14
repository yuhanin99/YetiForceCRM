{strip}
<div class='actionMenu '>
	<div class="row">
		<div class="dropdown quickAction historyBtn">
			<div class="pull-left">
				{vtranslate('LBL_PAGES_HISTORY',$MODULE)}
			</div>						
			<div class="pull-right">
				<a data-placement="left" data-toggle="dropdown" class="btn btn-default btn-sm showHistoryBtn" aria-expanded="false" href="#">
					<img class='alignMiddle popoverTooltip' src="{vimage_path('history.png')}" alt="{vtranslate('LBL_PAGES_HISTORY',$MODULE)}" 
						class="dropdown-toggle" data-content="{vtranslate('LBL_PAGES_HISTORY')}" />
				</a>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="remindersNotice quickAction">
			<div class="pull-left">
				{vtranslate('LBL_CHAT',$MODULE)}
			</div>	
			<div class="pull-right">
				<a class="btn btn-default" title="{vtranslate('LBL_CHAT',$MODULE)}" href="#">
					<span class="glyphicon glyphicon-bell" aria-hidden="true"></span>
					<span class="badge hide">0</span>
				</a>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="headerLinksAJAXChat quickAction">
			<div class="pull-left">
				{vtranslate('LBL_CHAT',$MODULE)}
			</div>
			<div class="pull-right">
				<a class="btn btn-default ChatIcon" title="{vtranslate('LBL_CHAT',$MODULE)}" href="#">
					<span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
				</a>
			</div>
		</div>
	</div>
	{if !empty($announcement)}
		<div class="row">
			<div class="quickAction">
				<div class="pull-left">
					{vtranslate('LBL_ANNOUNCEMENT',$MODULE)}
				</div>
				<div class='pull-right'>
					<a class="btn btn-default" href="#">
						<img class='alignMiddle imgAnnouncement' src="{vimage_path('btnAnnounceOff.png')}" alt="{vtranslate('LBL_ANNOUNCEMENT',$MODULE)}" title="{vtranslate('LBL_ANNOUNCEMENT',$MODULE)}" id="announcementBtn" />
					</a>
				</div>
			</div>
		</div>
	{/if}
	<div class='row'>
		<div class="dropdown quickAction">
			<div class='pull-left'>
				{vtranslate('LBL_QUICK_CREATE',$MODULE)}
			</div>
			<div class='pull-right'>
				<a id="menubar_quickCreate" class="dropdown-toggle btn btn-default" data-toggle="dropdown" title="{vtranslate('LBL_QUICK_CREATE',$MODULE)}" href="#">
					<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
				</a>
				<ul class="dropdown-menu dropdown-menu-right commonActionsButtonDropDown">
					<li id="quickCreateModules">
						<div class="panel-default">
							<div class="panel-heading">
								<h4 class="panel-title"><strong>{vtranslate('LBL_QUICK_CREATE',$MODULE)}</strong></h4>
							</div>
							<div class="panel-body paddingLRZero">
								{foreach key=NAME item=MODULEMODEL from=Vtiger_Module_Model::getQuickCreateModules(true)}
									{assign var='quickCreateModule' value=$MODULEMODEL->isQuickCreateSupported()}
									{assign var='singularLabel' value=$MODULEMODEL->getSingularLabelKey()}
									{if $singularLabel == 'SINGLE_Calendar'}
										{assign var='singularLabel' value='LBL_EVENT_OR_TASK'}
									{/if}	
									{if $quickCreateModule == '1'}
										{if $count % 3 == 0}
											<div class="rows">
											{/if}
											<div class="col-xs-4{if $count % 3 != 2} paddingRightZero{/if}">
												<a id="menubar_quickCreate_{$NAME}" class="quickCreateModule list-group-item" data-name="{$NAME}"
												   data-url="{$MODULEMODEL->getQuickCreateUrl()}" href="javascript:void(0)" title="{vtranslate($singularLabel,$NAME)}"><span>{vtranslate($singularLabel,$NAME)}</span></a>
											</div>
											{if $count % 3 == 2}
											</div>
										{/if}
										{assign var='count' value=$count+1}
									{/if}
								{/foreach}
							</div>
						</div>
					</li>
				</ul>
			</div>						
		</div>
	</div>
</div>
{/strip}