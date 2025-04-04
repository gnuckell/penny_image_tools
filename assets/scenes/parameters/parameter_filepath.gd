@tool class_name ParameterFilepath extends ParameterString

@export var access : FileDialog.Access :
	get: return $file_dialog.access if $file_dialog else FileDialog.Access.ACCESS_FILESYSTEM
	set(value):
		if not find_child("file_dialog"): return
		$file_dialog.access = value

@export var file_mode : FileDialog.FileMode :
	get: return $file_dialog.file_mode if $file_dialog else FileDialog.FileMode.FILE_MODE_OPEN_ANY
	set(value):
		if not find_child("file_dialog"): return
		$file_dialog.file_mode = value


func get_is_valid() -> bool:
	return DirAccess.dir_exists_absolute(text)


func open_file_dialog() -> void:
	$file_dialog.popup_centered_ratio(0.8)


func confirm_file_dialog() -> void:
	text = $file_dialog.current_path
