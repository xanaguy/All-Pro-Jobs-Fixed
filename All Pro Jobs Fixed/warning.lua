function MenuManager:show_warning_allprojobmod()
	local dialog_data = {}
	dialog_data.title = "!! WARNING !!"
	dialog_data.text = " You're activating 'All Pro Job MOD' \n You should only play with your friends."
	local ok_button = {}
	ok_button.text = managers.localization:text("dialog_ok")
	dialog_data.button_list = {ok_button}
	managers.system_menu:show(dialog_data)
end