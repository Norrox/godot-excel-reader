GDPC                 �                                                                      *   X   res://.godot/exported/133200997/export-01275cef7de1685a5f50a6a79dd48428-check_label.scn �O      �      7�]�U��SӐ��8�z    T   res://.godot/exported/133200997/export-362256a061aa8890e9a1e558b11e5ec3-node_2d.scn �+     |      �;o�<Ο�d=eF6�+    `   res://.godot/exported/133200997/export-788e591e0bfff3aac1534fa73587e45c-script_method_list.scn   f      3      ��ƚ��E�
�W�4    P   res://.godot/exported/133200997/export-9227c4ae631be0a76db23c59dd995d25-rad.scn �9     <      $�!'٬��6cK    T   res://.godot/exported/133200997/export-acc09bf0cfd99bfaa5a30414b77230c9-dialog.scn  �p      �      �b�TVVy�<��S�S|    X   res://.godot/exported/133200997/export-b6bfe05e28cacfe76153c3434be0a680-item_list.scn   �[      7      ��pwW������R    ,   res://.godot/global_script_class_cache.cfg  PA     �      V<�
j������їa    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�
     |      K��t������Q�2��       res://.godot/uid_cache.bin  x     �      ��\o�.����"n���M       res://Node2D.gd       �      �"���0B���*�       res://Rad.gd 9     X       ��߿3����f�HO    $   res://addons/excel_reader/plugin.gd P9      �       3x�WG�#����%��u    ,   res://addons/excel_reader/src/excel_file.gd         +      �YL]�o^O'd��    (   res://addons/excel_reader/src/sheet.gd  0      �      ʀ���5�2$sQ��'    ,   res://addons/excel_reader/src/workbook.gd   �      �      ��w��X�m�I`G�    ,   res://addons/excel_reader/src/xml_data.gd   �$      u      &a'U��쎏�i|�KF�    ,   res://addons/excel_reader/src/xml_node.gd    ,      F      3�,F��]S{����    $   res://addons/excel_reader/test.gd    :      �      �P
����{��&v7    0   res://addons/script_comment_menu/data_util.gd   �      �"      ��-q؎����s`�    ,   res://addons/script_comment_menu/plugin.gd  ��      /      a���n Bbf�.�    0   res://addons/script_comment_menu/script_util.gd ��      �3      �YP�}����)��    8   res://addons/script_comment_menu/sub_item/@sub_item.gd   �      7	      ���m�#���W*    <   res://addons/script_comment_menu/sub_item/comment/comment.gd =            ΁���V?�Bƻ�7o    <   res://addons/script_comment_menu/sub_item/override/dialog.gd@j      �      f�K�4g/Ρ��A^�4    D   res://addons/script_comment_menu/sub_item/override/dialog.tscn.remap@     c       �/��ne5C�}"B����    @   res://addons/script_comment_menu/sub_item/override/override.gd  �u            m�k��/®��#����    H   res://addons/script_comment_menu/sub_item/override/scene/check_label.gd L      �      ����B�%�C�愣�    P   res://addons/script_comment_menu/sub_item/override/scene/check_label.tscn.remap �>     h       ��c-�ٱ������j�    H   res://addons/script_comment_menu/sub_item/override/scene/item_list.gd   @S      �      =N�$V��>(��_���    P   res://addons/script_comment_menu/sub_item/override/scene/item_list.tscn.remap   0?     f       ���q�+D	0    P   res://addons/script_comment_menu/sub_item/override/scene/script_method_list.gd  _      �      -���3	��/���    X   res://addons/script_comment_menu/sub_item/override/scene/script_method_list.tscn.remap  �?     o       �0��o��Q��Q��    4   res://addons/script_comment_menu/util/@constant.gd  @�      �      Ǯ[��G�Ų{��.?[    4   res://addons/script_comment_menu/util/add_menu.gd   Ћ      V
      4K��b�H��	��D    <   res://addons/script_comment_menu/util/menu_item_builder.gd  0�      �      ׮���N����s���    8   res://addons/script_comment_menu/util/popup_menu_util.gd��      �      ��4#��m%pi�&    <   res://addons/script_comment_menu/util/script_editor_util.gd `�      �      �U���SɳΏ)Z�Q�       res://icon.svg  0H     �/      ��J��BCSM�ob�L       res://icon.svg.import   @     �       ǉeKR�iJ�L�o���.       res://node_2d.tscn.remap�@     d       s�OR��0*�FC       res://project.binary�y     �      L�{��ϓ����RCl$       res://rad.tscn.remap�@     `       �4֛�5!a�[�p'=        #============================================================
#    Excel File
#============================================================
# - author: zhangxuetu
# - datetime: 2023-05-27 21:51:54
# - version: 4.0
#============================================================
class_name ExcelFile


var _zip_reader : ZIPReader
var _workbook: ExcelWorkbook


#============================================================
#  内置
#============================================================
func _notification(what):
	if what == NOTIFICATION_PREDELETE:
		if _zip_reader:
			_zip_reader.close()
			_zip_reader = null


func _to_string():
	return "<%s#%s>" % ["ExcelFile", get_instance_id()]


#============================================================
#  自定义
#============================================================
static func open_file(path: String, auto_close: bool = false) -> ExcelFile:
	if FileAccess.file_exists(path):
		var excel_file = ExcelFile.new()
		excel_file.open(path)
		if auto_close:
			Engine.get_main_loop() \
				.process_frame \
				.connect(excel_file.close, Object.CONNECT_ONE_SHOT)
		return excel_file
	return null


func close() -> void:
	if _zip_reader:
		_zip_reader.close()
		_zip_reader = null


func open(path: String) -> Error:
	if _zip_reader != null:
		_zip_reader.close()
	_zip_reader = ZIPReader.new()
	
	var err = _zip_reader.open(path)
	if err != OK:
		print("Open failed: ", error_string(err))
		return err
	
	_workbook = ExcelWorkbook.new(_zip_reader)
	
	return OK


func get_workbook() -> ExcelWorkbook:
	return _workbook


     #============================================================
#    Sheet
#============================================================
# - author: zhangxuetu
# - datetime: 2023-05-27 21:51:59
# - version: 4.0
#============================================================
class_name ExcelSheet


var xml_data : ExcelXMLData:
	set(v):
		assert(xml_data == null)
		xml_data = v
var workbook : ExcelWorkbook

var _coord_reg : RegEx = RegEx.new()
var _image_reg : RegEx = RegEx.new()


#============================================================
#  内置 
#============================================================
func _init(zip_reader: ZIPReader, workbook: ExcelWorkbook, sheet_xml_path: String):
	self.workbook = workbook
	self.xml_data = ExcelXMLData.new(zip_reader, sheet_xml_path)
	
	self._image_reg.compile("=DISPIMG\\(\"(?<rid>\\w+)\",\\d+\\)")
	self._coord_reg.compile("([A-Z]+)([0-9]+)")


func _to_string():
	return "<%s#%s>" % ["Sheet", get_instance_id()]


#============================================================
#  自定义
#============================================================
func get_xml_root() -> ExcelXMLNode:
	return xml_data.get_root()


## Return Data Format Example
##[codeblock]
##var table_data = sheet.get_table_data()
##var value = table_data[row][column]
##[/codeblock]
func get_table_data() -> Dictionary:
	const KEY = &"table_data"
	if not has_meta(KEY):
		
		var row_to_column_data = {}
		var sheet_data = get_xml_root().find_first_node("sheetData")
		
		for row_node in sheet_data.get_children():
	#		var spans = row_node.get_attr("spans")
	#		var from_column = spans.split(":")[0]
	#		var to_column = spans.split(":")[1]
	#		prints(from_column, to_column)
			
			var column_to_data : Dictionary = {}
			for column_node in row_node.get_children():
				var value_node = column_node.find_first_child_node("v")
				if value_node == null:
					continue
				var value = value_node.get_value()
				# 所在行列坐标
				var coords = to_coords(column_node.get_attr("r"))
				# 判断数据类型
				var data_type = column_node.get_attr("t")
				if data_type == "s":
					var value_idx = int(value)
					# 如果是字符串，则进行转换
					column_to_data[coords.x] = workbook.shared_strings[value_idx]
				elif data_type == "str":
					column_to_data[coords.x] = convert_image(value)
				else:
					var json = JSON.new()
					if json.parse(value) == OK:
						column_to_data[coords.x] = json.data
					else:
						column_to_data[coords.x] = value
			
			var row = row_node.get_attr("r")
			row_to_column_data[int(row)] = column_to_data
		
		set_meta(KEY, row_to_column_data)
	return get_meta(KEY)


func to_coords(r: String) -> Vector2i:
	var result = _coord_reg.search(r)
	var column_str = result.get_string(1)
	var row_str = result.get_string(2)
	
	var x : int = 0
	var column_length : int = column_str.length()
	for i in column_length:
		var num = (column_str.unicode_at(i) - 64)
		x += num * pow(26, column_length - 1 - i) 
	return Vector2i(x, row_str.to_int())


func convert_image(value):
	# 嵌入单元格的图片
	var result = _image_reg.search(value)
	if result:
		var rid = result.get_string("rid")
		return workbook.cellimages[rid]
	else:
		return value
	

          #============================================================
#    Workbook
#============================================================
# - author: zhangxuetu
# - datetime: 2023-05-27 21:52:01
# - version: 4.0
#============================================================
class_name ExcelWorkbook


var xml_data : ExcelXMLData:
	set(v):
		assert(xml_data == null)
		xml_data = v
var shared_strings : Array = []
var cellimages : Dictionary = {}: # name to image map
	get:
		if cellimages.is_empty():
			# 读取 rid 对应的图片
			var rels_cellimages_xml_data = ExcelXMLData.new(_zip_reader, "xl/_rels/cellimages.xml.rels")
			var rid_to_images = {}
			for child in rels_cellimages_xml_data.get_root().get_children():
				var rid = child.get_attr("Id")
				var path = child.get_attr("Target")
				rid_to_images[rid] = _zip_reader.read_file("xl".path_join(path))
			
			# 读取数据引用
			var cellimages_xml_data = ExcelXMLData.new(_zip_reader, "xl/cellimages.xml")
			for child in cellimages_xml_data.get_root().get_children():
				# 名称
				var xdr_pic = child.get_child(0)
				var xdr_nv_pic_pr = xdr_pic.find_first_child_node("xdr:nvPicPr")
				var xdr_cNvPr = xdr_nv_pic_pr.find_first_child_node("xdr:cNvPr")
				var name = xdr_cNvPr.get_attr("name")
				# rid
				var xdr_blip_fill = xdr_pic.find_first_child_node("xdr:blipFill")
				var a_blip = xdr_blip_fill.find_first_child_node("a:blip")
				var rid = a_blip.get_attr("r:embed")
				# 记录
				var image = Image.new()
				image.load_png_from_buffer(PackedByteArray(rid_to_images[rid]))
				cellimages[name] = ImageTexture.create_from_image(image)
		return cellimages

var _zip_reader : ZIPReader
var _sheets : Dictionary = {}
var _sheet_data_list : Array[Dictionary] = []

var _rels : ExcelXMLData  # rid data
var _rid_to_path_map : Dictionary = {}


#============================================================
#  内置
#============================================================
func _init(zip_reader: ZIPReader):
	self._zip_reader = zip_reader
	self.xml_data = ExcelXMLData.new(_zip_reader, "xl/workbook.xml")
	self._rels = ExcelXMLData.new(_zip_reader, "xl/_rels/workbook.xml.rels")
	
	# RID file path
	for child in _rels.get_root().get_children():
		var id = child.get_attr("Id")
		var target_path = child.get_attr("Target") # Files in the xl directory
		self._rid_to_path_map[id] = target_path
	
	# Sheets 
	var sheets = xml_data.get_root().find_first_node("sheets")
	var rid : String
	var sheet_name : String
	for child in sheets.get_children():
		rid = child.get_attr("r:id")
		sheet_name = child.get_attr("name")
		_sheet_data_list.append({
			"rid": rid,
			"sheet_name": sheet_name,
			"path": _rid_to_path_map[rid],
		})
	
	# 获取值列表，string 类型单元格数据的缓存（共享的字符串）
	var sharedStrings = ExcelXMLData.new(_zip_reader, "xl/sharedStrings.xml")
	for si_node in sharedStrings.get_root().get_children():
		shared_strings.append(si_node.get_full_value())


func _to_string():
	return "<%s#%s>" % ["Workbook", get_instance_id()]


#============================================================
#  自定义
#============================================================
func _create_sheet(xml_path: String) -> ExcelSheet:
	return ExcelSheet.new(_zip_reader, self,  "xl".path_join(xml_path))


func get_sheet_files() -> Array[String]:
	return Array(_sheet_data_list.map(func(item): 
		return item["path"]
	), TYPE_STRING, &"", null)


func get_sheet_name_list() -> Array[String]:
	return Array(_sheet_data_list.map(func(item): 
		return item["sheet_name"]
	), TYPE_STRING, &"", null)


func get_sheets() -> Array[ExcelSheet]:
	if _sheets.is_empty():
		for xml_path in get_sheet_files():
			_sheets[xml_path] = _create_sheet(xml_path)
	return Array(_sheets.values(), TYPE_OBJECT, "RefCounted", ExcelSheet)


func get_path_by_sheet_name(sheet_name: String) -> String:
	for data in _sheet_data_list:
		if data["sheet_name"] == sheet_name:
			return data["path"]
	return ""


func get_sheet(idx_or_sheet_name) -> ExcelSheet:
	var xml_path : String = get_sheet_files()[idx_or_sheet_name] \
		if idx_or_sheet_name is int \
		else get_path_by_sheet_name(idx_or_sheet_name)
	
	if not xml_path.ends_with(".xml"):
		xml_path += ".xml"
	
	# 没有这个 sheet 路径
	if not get_sheet_files().has(xml_path):
		printerr("没有这个文件：", xml_path)
		return null
	
	# 还没加载这个数据则进行加载
	if not _sheets.has(xml_path):
		_sheets[xml_path] = _create_sheet(xml_path)
	
	return _sheets[xml_path]

#============================================================
#    Xml Data
#============================================================
# - author: zhangxuetu
# - datetime: 2023-05-27 21:52:06
# - version: 4.0
#============================================================
class_name ExcelXMLData


var _root : ExcelXMLNode
var _source_code : String = "":
	set(v):
		_source_code = v
		_source_code_buffer = v.to_utf8_buffer()
var _source_code_buffer : PackedByteArray


#============================================================
#  内置
#============================================================
func _to_string():
	return "<%s#%s>" % ["XMLData", get_instance_id()]


func _init(zip_reader: ZIPReader, xml_path: String):
	var res := zip_reader.read_file(xml_path)
	var stack = []
	_source_code = PackedByteArray(res).get_string_from_utf8()
	var parser = XMLParser.new()
	if parser.open_buffer(_source_code_buffer) == OK:
		# 第一个节点
		while parser.read() == OK:
			if parser.get_node_type() == XMLParser.NODE_ELEMENT:
				_root = _parse(parser)
				break


#============================================================
#  自定义
#============================================================
func _parse(parser: XMLParser) -> ExcelXMLNode:
	var ret: ExcelXMLNode = ExcelXMLNode.new(parser)
	ret._closure = parser.is_empty()

	if not ret._closure:
		while parser.read() == OK:
			match parser.get_node_type():
				XMLParser.NODE_ELEMENT:
					var child: ExcelXMLNode = _parse(parser)
					ret.add_child(child)

				XMLParser.NODE_ELEMENT_END:
					if parser.get_node_name() != ret._type:
						push_warning("</%s> mismatch with <%s>" % [parser.get_node_name(), ret._type])
					return ret

				XMLParser.NODE_TEXT:
					ret.value = parser.get_node_data()

	return ret

func get_root() -> ExcelXMLNode:
	return _root as ExcelXMLNode

func get_source_code() -> String:
	return _source_code


           #============================================================
#    Xml Node
#============================================================
# - author: zhangxuetu
# - datetime: 2023-05-27 21:52:09
# - version: 4.0
#============================================================
class_name ExcelXMLNode


var value = ""

var _type : String = "" # XML节点类型
var _parent: ExcelXMLNode 
var _children : Array[ExcelXMLNode] = []
var _attributes : Dictionary = {}
var _closure : bool = true
var _indent : int = 0


#============================================================
#  内置
#============================================================
func _init(xml_parser: XMLParser):
	self._type = xml_parser.get_node_name()
	for idx in xml_parser.get_attribute_count():
		var attr_name = xml_parser.get_attribute_name(idx)
		self._attributes[attr_name] = xml_parser.get_attribute_value(idx)


func _to_string():
	return "<%s#%s:type=%s>" % ["ExcelXMLNode", get_instance_id(), _type]


#============================================================
#  自定义
#============================================================
## XML格式化输出
func to_xml():
	# 参数
	var params_list = []
	for k in _attributes:
		params_list.append("%s=\"%s\"" % [k, _attributes[k]])
	var params_str = (" " + " ".join(params_list)) \
		if not params_list.is_empty() \
		else ""
	
	if not _closure:
		# 子节点
		var children_str = ""
		for child in _children:
			child._indent = _indent + 1
			children_str += "\n\t%s%s" % ["\t".repeat(_indent), child.to_xml()]
		
		# 缩进
		var indent_str = ""
		if _indent > 0 and children_str:
			indent_str = "\t".repeat(_indent)
		
		return "<{name}{params}>{_children}{indent}</{name}>".format({
			"name": _type,
			"indent": indent_str,
			"params": params_str,
			"_children": (children_str + "\n") if children_str else value
		})
		
	else:
		return "<{name}{params}/>".format({
			"name": _type,
			"params": params_str,
		})

func is_closure() -> bool:
	return _closure

func get_type() -> String:
	return _type

func get_parent() -> ExcelXMLNode:
	return _parent

func get_attr(property) -> String:
	return _attributes.get(property, "")

func has_attr(property) -> bool:
	return _attributes.has(property)

func get_attr_names() -> Array[String]:
	return Array(_attributes.keys(), TYPE_STRING, "", null)


func add_child(node: ExcelXMLNode) -> void:
	_children.append(node)
	node._parent = self


func get_children() -> Array[ExcelXMLNode]:
	return _children


func get_child(idx: int) -> ExcelXMLNode:
	if idx < _children.size():
		return _children[idx]
	return null


func get_child_count() -> int:
	return _children.size()


func find_first_node(path: String) -> ExcelXMLNode:
	var list = path.split("/")
	var node = find_first_child_node(list[0])
	if node and list.size() > 1:
		return node.find_first_node("/".join(list.slice(1)))
	return node


func find_first_child_node(_type: String) -> ExcelXMLNode:
	for child in get_children():
		if child._type == _type:
			return child
	return null

func find_nodes(_type: String) -> Array[ExcelXMLNode]:
	var list : Array[ExcelXMLNode] = []
	for child in get_children():
		if child._type == _type:
			list.append(child)
	return list

func get_value():
	return value

func get_full_value():
	if value != "":
		return value
	var ret: String = ""
	for child in get_children():
		ret += child.get_full_value()
	return ret
          @tool
extends EditorPlugin


func _enter_tree():
	# Initialization of the plugin goes here.
	pass
	


func _exit_tree():
	# Clean-up of the plugin goes here.
	pass
            #============================================================
#    Test
#============================================================
# - author: zhangxuetu
# - datetime: 2023-05-27 19:06:07
# - version: 4.0
#============================================================
@tool
extends EditorScript


var excel = ExcelFile.open_file("C:\\Users\\z\\Desktop\\example.xlsx")


func _run():
	var workbook = excel.get_workbook()
	print(workbook.get_sheet_files())
	print(workbook.get_sheet_name_list())
	
	
	var sheet = workbook.get_sheet(0) as ExcelSheet
	var table_data = sheet.get_table_data()
	print(JSON.stringify(table_data, "\t"))
	
	return
	
	
	for row in table_data:
		var column_data = table_data[row]
		for column in column_data:
			print(column_data[column])
	

 #============================================================
#    Comment
#============================================================
# - datetime: 2022-07-17 14:49:15
#============================================================
## 脚本注释
class_name _ScriptMenu_Comments
extends _ScriptMenu_SubItem


const SEPARATE_LENGTH = 60


var util_script_editor := ScriptCommentMenuConstant.ScriptEditorUtil.new()
var util_script := ScriptCommentMenu_ScriptUtil.new()

var regex = RegEx.new()


#============================================================
#  内置
#============================================================
func _init():
	var pattern = "(?<indent>\\s*)(static\\s+)?func\\s+(?<method>[^\\(]+)"
	regex.compile(pattern)


#============================================================
#  自定义
#============================================================
#(override)
func _init_menu(menu_button: MenuButton):
	# 设置添加菜单项
	var menu : PopupMenu = menu_button.get_popup()
	add_menu_item(menu_button, "脚本注释", {}, _script_comment)
	add_separator(menu_button)
	add_menu_item(menu_button, "方法注释", {
		"key": KEY_C,
		"ctrl": true,
		"shift": true,
	}, _func_comment)
	add_menu_item(menu_button, "类别分隔", {
		"key": KEY_SLASH,
		"ctrl": true,
		"shift": true,
	}, _category_comment)


#============================================================
#  功能
#============================================================
##  方法注释
func _func_comment():
	var text_edit : TextEdit = util_script_editor.get_current_code_editor()
	var line : int = text_edit.get_caret_line()
	
	for i in range(line, text_edit.get_line_count()):
		var line_code : String = text_edit.get_line(i)
		var result = regex.search(line_code)
		if result:
			var method = result.get_string("method").strip_edges()
			printt(method
				, util_script_editor.get_current_script()
				, util_script_editor.get_current_script().resource_path
			)
			
			var indent = result.get_string("indent")
			var data = util_script.find_method_data(util_script_editor.get_current_script(), method)
			if data.size() == 0:
				printerr('没有找到', method,'方法的数据，脚本是否还未保存？')
				return
			
			var code : String = "##  %s\n" % data['name']
			if data['args'].size() > 0:
				code += (indent + "##[br]\n")
				for arg in data['args']:
					code += (indent + "##[br][code]%s[/code]  \n" % arg['name'])
			if data['return']['type'] != TYPE_NIL:
				code += (indent + "##[br][code]return[/code]  ")
			code = code.trim_suffix("\n")
			util_script_editor.insert_code_current_pos(code, true)
			break

##  脚本注释
func _script_comment():
	var script = util_script_editor.get_current_script()
	if script == null:
		return
	
	var separa = "=".repeat(SEPARATE_LENGTH)
	
	# 脚本名
	var script_name = script.resource_path.get_file().get_basename().capitalize()
	# 时间
	var datetime = Time.get_datetime_dict_from_system()
	var datetime_str = "%02d-%02d-%02d %02d:%02d:%02d" % [
		datetime['year'], datetime['month'], datetime['day'],
		datetime['hour'], datetime['minute'], datetime['second'],
	]
	
	var code = """#{sep}
#    {name}
#{sep}
# - author: zhangxuetu
# - datetime: {datetime}
# - version: 4.0
#{sep}
""".format({
	"sep": separa,
	"name": script_name,
	"datetime": datetime_str,
})
	# 插入到顶部
	var textedit = util_script_editor.get_current_code_editor()
	textedit.set_caret_line(0)
	textedit.set_caret_column(0)
	textedit.insert_text_at_caret(code)


## 类别分隔
func _category_comment():
	var separa = "=".repeat(SEPARATE_LENGTH)
	var code = """#{sep}
#  
#{sep}""".format({
		"sep": separa,
	})
	
	var textedit = util_script_editor.get_current_code_editor()
	textedit.set_caret_column(0)
	textedit.insert_text_at_caret(code)
	textedit.set_caret_line(textedit.get_caret_line() - 1)


        #============================================================
#    Check check_box
#============================================================
# - datetime: 2022-07-16 22:30:22
#============================================================
@tool
extends HBoxContainer


signal pressed


@export
var text : String = "":
	set(value):
		text = value
		if check_box == null:
			await ready
		check_box.text = value
	get:
		return check_box.text

@export
var selected : bool = false :
	set(value):
		selected = value
		if check_box == null:
			await ready
		check_box.button_pressed = value
	get:
		return check_box.button_pressed

@export
var color : Color = Color.WHITE :
	set(value):
		color = value
		if check_box == null:
			await ready
		check_box.modulate = color


@onready var check_box = $CheckBox as CheckBox


func _ready():
	check_box.pressed.connect(_pressed)


func _pressed():
	pressed.emit()

      RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script H   res://addons/script_comment_menu/sub_item/override/scene/check_label.gd ��������      local://PackedScene_y4scy ?         PackedScene          	         names "   	      CheckLabel    offset_right    offset_bottom    size_flags_horizontal    size_flags_vertical    script    HBoxContainer 	   CheckBox    layout_mode    	   variants            �C     �A                                   node_count             nodes        ��������       ����                                                    ����                         conn_count              conns               node_paths              editable_instances              version             RSRC            #============================================================
#    Item List
#============================================================
# - datetime: 2022-07-17 15:02:44
#============================================================
@tool
extends VBoxContainer


const CHECK_LABEL_SCENE = preload("check_label.tscn")
const CHECK_LABEL_SCRIPT = preload("check_label.gd")


var last_press_check : CHECK_LABEL_SCRIPT


##  添加 Item
##[br]
##[br][code]label[/code]  
##[br][code]color[/code]  
##[br]
##[br][code]return[/code]  
func add_item(label: String, color : Color = Color.WHITE) -> CHECK_LABEL_SCRIPT:
	var check_label = CHECK_LABEL_SCENE.instantiate()
	add_child(check_label)
	check_label.text = label
	check_label.color = color
	# 上一次点击的对象
	check_label.pressed.connect(_pressed.bind(check_label)) 
	return check_label


##  添加组别标签
##[br]
##[br][code]text[/code]  标签名
func add_label(text: String):
	var space = Control.new()
	space.custom_minimum_size.y = 4
	add_child(space)
	var panel = Panel.new()
	panel.custom_minimum_size.y = 1
	add_child(panel)
	var label = Label.new()
	label.text = text
	add_child(label)


##  获取所有项
func get_all_item() -> Array:
	var list = []
	for child in get_children():
		if child is CHECK_LABEL_SCRIPT:
			list.append(child)
	return list


##  获取选中的项
func get_selected_items() -> Array:
	var list = []
	for item in get_all_item():
		item = item as CHECK_LABEL_SCRIPT
		if item.selected:
			list.append(item)
	return list

## 清除所有
func clear():
	for child in get_children():
		child.queue_free()



#============================================================
#  连接信号
#============================================================
func _pressed(check: CHECK_LABEL_SCRIPT):
	# 如果是按着 Shift 键
	var all_item = get_all_item()
	if Input.is_key_pressed(KEY_SHIFT):
		if last_press_check != check:
			var last_index = all_item.find(last_press_check)
			var curr_index = all_item.find(check)
			var selected = check.selected
			for i in range(last_index, curr_index, sign(curr_index - last_index)):
				all_item[i].selected = selected
	
	last_press_check = check

            RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script F   res://addons/script_comment_menu/sub_item/override/scene/item_list.gd ��������      local://PackedScene_odjuj =         PackedScene          	         names "      	   ItemList    offset_right    offset_bottom    size_flags_horizontal    size_flags_vertical    script    VBoxContainer    	   variants            �D     D                      node_count             nodes        ��������       ����                                            conn_count              conns               node_paths              editable_instances              version             RSRC         #============================================================
#    Script Method List
#============================================================
# - datetime: 2022-07-17 15:22:58
#============================================================
@tool
extends MarginContainer


const ITEM_LIST_SCRIPT = preload("item_list.gd")


@onready var item_list = $ScrollContainer/ItemList as ITEM_LIST_SCRIPT
@onready var scroll_container = $ScrollContainer


##  获取所有选中的项
func get_selected_items() -> Array: 
	return item_list.get_selected_items()


##  更新数据
##[br]
##[br][code]script[/code]  脚本
func update_data(script: Script):
	# 获取脚本的继承的所有脚本类
	var scripts = []
	script = script.get_base_script()
	while script != null:
		scripts.append(script)
		script = script.get_base_script()
	# 显示脚本的数据
	show_script_list_data(scripts)
	
	# 滚动到下面
#	await get_tree().create_timer(0.1).timeout
#	scroll_container.scroll_vertical = 2000


##  展示脚本列表数据
##[br]
##[br][code]scripts[/code]  
func show_script_list_data(scripts: Array):
	item_list.clear()
	# 已添加过的（防止重复获取）
	var added : Dictionary = {}
	# 开始遍历
	scripts.reverse()
	for script in scripts:
		var path = script.resource_path.get_file()
		item_list.add_label(path)
		
		# 获取数据
		var data = {}
		for method_data in script.get_script_method_list():
			var method_name : String = method_data['name']
			if not added.has(method_name):
				data[method_name] = method_data
				added[method_name] = null
		
		# 排序
		var list = data.keys()
		list.sort()
		for key in list:
			var method_data : Dictionary = data[key]
			var method : String = method_data['name']
			item_list.add_item(method)
	

               RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script O   res://addons/script_comment_menu/sub_item/override/scene/script_method_list.gd ��������   PackedScene H   res://addons/script_comment_menu/sub_item/override/scene/item_list.tscn �*���Jo      local://PackedScene_j73wn �         PackedScene          	         names "   
      ScriptMethodList    anchor_right    anchor_bottom    size_flags_horizontal    size_flags_vertical    script    MarginContainer    ScrollContainer    layout_mode 	   ItemList    	   variants            �?                                     node_count             nodes     #   ��������       ����                                                     ����                    ���	                         conn_count              conns               node_paths              editable_instances              version             RSRC             #============================================================
#    Dialog
#============================================================
# - datetime: 2022-07-17 15:49:30
#============================================================
@tool
extends Control


signal selected_method(method_names : Array)


const SCRIPT_METHOD_LIST_SCRIPT = preload("res://addons/script_comment_menu/sub_item/override/scene/script_method_list.gd")
const CHECK_LABEL = preload("res://addons/script_comment_menu/sub_item/override/scene/check_label.gd")


@onready var confirmation_dialog = find_child("ConfirmationDialog") 
@onready var script_method_list = find_child("ScriptMethodList") as SCRIPT_METHOD_LIST_SCRIPT


#============================================================
#  自定义
#============================================================
##  显示弹窗
func show_popup(script: Script):
	confirmation_dialog.popup_centered_ratio(0.6)
	script_method_list.update_data(script)


#============================================================
#  自定义
#============================================================
func _ready():
	confirmation_dialog.confirmed.connect(_confirmed)
	if not Engine.is_editor_hint():
		confirmation_dialog.popup_centered()


#============================================================
#  连接信号
#============================================================
func _confirmed():
	var selected_items = script_method_list.get_selected_items()
	
	var method_list = {}
	for item in selected_items:
		item = item as CHECK_LABEL
		var method_name : String = item.text
		method_list[method_name] = null
		item.selected = false
	selected_method.emit(method_list.keys())


  RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script =   res://addons/script_comment_menu/sub_item/override/dialog.gd ��������   PackedScene Q   res://addons/script_comment_menu/sub_item/override/scene/script_method_list.tscn )�!��3      local://PackedScene_21tuq �         PackedScene          	         names "         Dialog    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    mouse_filter    script    metadata/_edit_lock_    Control    ConfirmationDialog    dialog_close_on_escape    ScriptMethodList    offset_right    offset_bottom    	   variants                        �?                                                  D     �C      node_count             nodes     1   ��������
       ����	                                                    	                        ����                    ���                        	      
             conn_count              conns               node_paths              editable_instances              version             RSRC      #============================================================
#    Override
#============================================================
# - datetime: 2022-07-17 15:53:56
#============================================================

## 重写
class_name _ScriptMenu_Overrides
extends _ScriptMenu_SubItem


const DIALOG_SCRIPT = preload("dialog.gd")
const DIALOG_SCENE = preload("dialog.tscn")


var dialog = DIALOG_SCENE.instantiate() as DIALOG_SCRIPT


#============================================================
#  自定义
#============================================================
#(override)
func _init_menu(menu_button: MenuButton):
	# 添加弹窗
	dialog.selected_method.connect(_selected_method)
	get_editor_interface().get_base_control().add_child(dialog)
	dialog.theme = get_editor_interface().get_base_control().theme
	# 添加菜单
	add_separator(menu_button)
	add_menu_item(menu_button, "重写方法", {
		"key": KEY_O,
		"ctrl": true,
		"shift": true,
	}, _show_popup)


#(override)
func _uninstall():
	super._uninstall()
	dialog.queue_free()


#============================================================
#  连接信号
#============================================================
## 显示弹窗
func _show_popup():
	var script = get_script_editor_util().get_current_script() as Script
	dialog.show_popup(script)


const FORMAT = """
#(override)
func {method_name}({arguments}){return_type}:
	{return_value}super.{method_name}({parameters})

"""

func _selected_method(method_names : Array):
	
	var text_edit = get_script_editor_util().get_current_code_editor() as TextEdit
	var script = get_script_editor_util().get_current_script() as Script
	
	var code : String = ""
	
	var added = {}
	for method_data in script.get_script_method_list():
		if added.has(method_data['name']) or not method_data['name'] in method_names:
			continue
		
		added[method_data['name']] = null
		
		var method_name = method_data['name']
		var method_type = method_data.get("type", 0)
		var method_args = method_data['args'] as Array
		var method_return = method_data['return']
		
		# 参数列表
		var arguments : String = ", ".join(method_args.map(func(arg): return arg['name']))
		arguments = arguments.strip_edges().trim_suffix(",")
		
		# 类型
		var return_type : String = ScriptCommentMenu_ScriptUtil.get_type_name(method_type)
		var return_value : String = ""
		if return_type == "null":
			return_type = ""
		if return_type != "":
			return_type = " -> " + return_type
			return_value = "return "
		
		code += FORMAT.format({
			"method_name": method_name,
			"method_type": ScriptCommentMenu_ScriptUtil.get_type_name(method_type),
			"return_type": return_type,
			"return_value": "",
			"arguments": arguments,
			"parameters": arguments,
		})
	
	text_edit.set_caret_column(0)
	text_edit.insert_text_at_caret(code)
	




       #============================================================
#    @sub Tem
#============================================================
# - datetime: 2022-07-17 16:32:29
#============================================================
class_name _ScriptMenu_SubItem


const MenuItemBuilder := ScriptCommentMenuConstant.MenuItemBuilder


var _editor_plugin = EditorPlugin.new()
var _util_script : ScriptCommentMenu_ScriptUtil
var _util_script_editor : ScriptCommentMenuConstant.ScriptEditorUtil


#============================================================
#  Set/Get
#============================================================
func get_editor_interface() -> EditorInterface:
	return _editor_plugin.get_editor_interface()

func get_script_editor_util():
	return _util_script_editor

func get_script_util() -> ScriptCommentMenu_ScriptUtil:
	return _util_script


#============================================================
#  自定义
#============================================================
##  外部调用初始化菜单
##[br]
##[br][code]menu_button[/code]  菜单按钮
func init_menu(menu_button: MenuButton) -> void:
	if not menu_button.has_meta("IsInit"):
		_util_script_editor = ScriptCommentMenuConstant.ScriptEditorUtil.new()
		_util_script =  ScriptCommentMenu_ScriptUtil.new()
		menu_button.set_meta("IsInit", {
			"_util_script_editor": _util_script_editor,
			"_util_script": _util_script,
		})
	
	var data : Dictionary = menu_button.get_meta("IsInit")
	for property in data:
		var value = data[property]
		set(property, value)
	
	_init_menu(menu_button)


## 添加分隔符
func add_separator(menu_button: MenuButton):
	(MenuItemBuilder.instance()
		.set_menu_by_menu_button(menu_button)
		.add_separator()
		.build()
	)

## 添加菜单
func add_menu_item(menu_button: MenuButton, name: String, key_map: Dictionary, callable: Callable):
	# 添加菜单
	(MenuItemBuilder.instance()
		.set_menu(menu_button.get_popup())
		.set_item_name(name)
		.set_connect(callable)
		.set_key(key_map.get("key", false))
		.set_ctrl(key_map.get("ctrl", false))
		.set_shift(key_map.get("shift", false))
		.set_alt(key_map.get("alt", false))
		.build()
	)



##  重写方法，初始化菜单
##[br]
##[br][code]menu_button[/code]  菜单按钮
func _init_menu(menu_button: MenuButton) -> void:
	pass


##  卸载子项
func _uninstall():
	pass


         class_name ScriptCommentMenuConstant


const AddMenu = preload("res://addons/script_comment_menu/util/add_menu.gd")
const MenuItemBuilder = preload("res://addons/script_comment_menu/util/menu_item_builder.gd")
const PopupMenuUtil = preload("res://addons/script_comment_menu/util/popup_menu_util.gd")
const ScriptEditorUtil = preload("res://addons/script_comment_menu/util/script_editor_util.gd")
    extends EditorScript


const EditorUtil_PopupMenu = preload("popup_menu_util.gd")


var json = JSON.new()
var util_popup_menu = EditorUtil_PopupMenu.new()


func _run():
	pass
	
	var menu = MenuButton.new()
	menu.text = "测试菜单"
	add_editor_menu(menu)
	await get_tree().create_timer(2).timeout
	menu.queue_free()



var _top_container: HBoxContainer
func _get_top_container() -> HBoxContainer:
	if _top_container == null:
		for child in get_editor_interface().get_base_control().get_children():
			if child is VBoxContainer:
				_top_container = child.get_child(0)
				break
	return _top_container

var _editor_menu_container : HBoxContainer
func get_editor_menu_container() -> HBoxContainer:
	if _editor_menu_container == null:
		_editor_menu_container = _get_top_container().get_child(0)
	return _editor_menu_container


func add_editor_menu(menu_button: MenuButton):
	get_editor_menu_container().add_child(menu_button)


func get_tree():
	return get_editor_interface().get_tree()


## 添加脚本菜单按钮
func add_script_editor_menu(menu_button: MenuButton, items: Array = []):
	var popup = menu_button.get_popup()
	for item in items:
		if item.begins_with("-"):
			popup.add_separator()
		else:
			while item.begins_with("-"):
				item = item.trim_prefix("-")
			popup.add_item(item)
	
	var menu_container : Control
	while true:
		var tmp = get_editor_interface() \
			.get_script_editor() \
			.get_current_editor()
		if tmp == null:
			await Engine.get_main_loop().create_timer(1).timeout
			continue
		for i in 4:
			tmp = tmp.get_parent_control()
			if tmp == null:
				break
		if tmp == null:
			await Engine.get_main_loop().create_timer(1).timeout
			continue
		menu_container = tmp.get_child(0) as Control
		break
	
	var node_index : int = 0
	for i in range(menu_container.get_child_count() - 1, -1, -1):
		if menu_container.get_child(i) is MenuButton:
			node_index = i + 1
			break
	menu_container.add_child(menu_button)
	menu_container.move_child(menu_button, node_index)


func connect_menu(menu, item_name: String, callable, method: String = ""):
	var popup : PopupMenu
	if menu is MenuButton:
		popup = menu.get_popup()
	elif menu is PopupMenu:
		popup = menu
	if method:
		util_popup_menu.connect_popup_item(menu.get_popup(), item_name, callable, method)
	else:
		util_popup_menu.connect_popup_item(menu.get_popup(), item_name, callable.get_object(), callable.get_method())


static func add_menu_item_shortcut(
	menu: MenuButton
	, item_name: String
	, keycode: int
	, ctrl : bool
	, alt : bool
	, shift : bool
):
	EditorUtil_PopupMenu.add_popup_shortcut(
		menu.get_popup(), item_name, keycode, ctrl, alt, shift
	)
          #============================================================
#    Menu Item Builder
#============================================================
# - datetime: 2022-07-17 14:14:42
#============================================================
# 菜单项建造器

var _menu : PopupMenu
var _name : String
var _method : Callable
var _short : Dictionary = {
	key = KEY_NONE,
	ctrl = false,
	alt = false,
	shift = false,
}
var _as_separator : bool = false

var _id : int = -1


#============================================================
#  Set/Get
#============================================================
##  设置添加的菜单
##[br]
##[br][code]menu[/code]  菜单
func set_menu(menu: PopupMenu):
	self._menu = menu
	return self

##  设置菜单按钮对象
func set_menu_by_menu_button(menu_button: MenuButton):
	set_menu( menu_button.get_popup() )
	return self


##  设置菜单名
##[br]
##[br][code]name[/code]  
func set_item_name(name: String):
	self._name = name
	return self

##  设置连接的方法
##[br]
##[br][code]method[/code]  连接的方法
func set_connect(method: Callable):
	self._method = method
	return self

##  设置快捷键
##[br]
##[br][code]key[/code]  按键 Key 值
##[br][code]ctrl[/code]  Ctrl
##[br][code]alt[/code]  Alt
##[br][code]shift[/code]  Shift
func set_shortcut(
	key: int
	, ctrl: bool = false
	, alt: bool = false
	, shift: bool = false
):
	self._short.key = key
	self._short.ctrl = ctrl
	self._short.alt = alt
	self._short.shift = shift
	return self

func set_key(key : int):
	self._short.key = key
	return self

func set_ctrl(value : bool = true):
	self._short.ctrl = value
	return self

func set_shift(value : bool = true):
	self._short.shift = value
	return self

func set_alt(value : bool = true):
	self._short.alt = value
	return self


#============================================================
#  自定义
#============================================================
##  实例化一个 Builder
##[br]
##[br][code]return[/code]  返回实例化对象
static func instance():
	var builder = load("res://addons/script_comment_menu/util/menu_item_builder.gd").new()
	return builder


##  添加分隔符
func add_separator():
	_as_separator = true
	return self


## 构建添加
##[br]
##[br][code]return[/code]  返回菜单的 id 值
func build() -> int:
	_id = _menu.item_count
	
	# 引用这个 builder，不这样则会因为引用消失而造成下面的 _id_pressed 失效
	_menu.set_meta("MenuItemMenu_%d" % _id, self)
	
	if _menu.id_pressed.connect( _id_pressed ) != OK:
		printerr("  > id_pressed 信号连接方法失败")
	
	if not _as_separator:
		_menu.add_item(_name)
	else:
		_menu.add_separator(_name)
	
	if _short.key != KEY_NONE:
		var input = InputEventKey.new()
		input.keycode = _short.key
		input.ctrl_pressed = _short.ctrl
		input.alt_pressed = _short.alt
		input.shift_pressed = _short.shift
		var shortcut = Shortcut.new()
		shortcut.events.append(input)
		_menu.set_item_shortcut(_id, shortcut)
	
	return _id


#============================================================
#  连接信号
#============================================================
func _id_pressed(id):
	if id == _id:
		_method.call()
              extends RefCounted


static func find_popup_menu_id(popup: PopupMenu, item_name: String) -> int:
	for idx in popup.get_item_count():
		# 找到这个菜单
		if popup.get_item_text(idx) == item_name:
			return idx
	return -1


static func add_popup_shortcut(
	popup: PopupMenu
	, item_name: String
	, keycode: int
	, ctrl : bool
	, alt : bool
	, shift : bool
):
	var idx = find_popup_menu_id(popup, item_name)
	if idx > -1:
		var shortcut = Shortcut.new()
		var input = InputEventKey.new()
		input.keycode = keycode
		input.ctrl_pressed = ctrl
		input.alt_pressed = alt
		input.shift_pressed = shift
		shortcut.events.append(input)
		popup.set_item_shortcut(idx, shortcut)
	else:
		printerr("没有这个名称 ", item_name, " 的菜单项")



var _popup_data := {}
func connect_popup_item(popup: PopupMenu, item_name: String, target: Object, method: String) -> int:
	var idx = find_popup_menu_id(popup, item_name)
	if idx > -1:
		if not popup.id_pressed.is_connected(self._popup_id_pressed):
			popup.id_pressed.connect(self._popup_id_pressed.bind(popup))
		if not _popup_data.has(popup):
			_popup_data[popup] = {}
		if not _popup_data[popup].has(idx):
			_popup_data[popup][idx] = []
		# 记录这个菜单的 id 的点击数据
		_popup_data[popup][idx].append({
			"target": target,
			"method": method,
		})
	else:
		printerr("这个菜单 popup 没有 ", item_name, " 的菜单项")
	
	return idx


func _popup_id_pressed(idx: int, popup: PopupMenu):
	if _popup_data.has(popup):
		var connected_data_list : Array = _popup_data[popup][idx]
		for data in connected_data_list:
			var target : Object = data['target']
			var method : String = data['method']
			target.call(method)
           extends EditorScript


## 当前代码编辑器
func get_current_code_editor() -> TextEdit:
	return (get_editor_interface()
			.get_script_editor()
			.get_current_editor()
			.get_base_editor()) as TextEdit


## 当前脚本的代码
func get_current_script_code() -> String:
	return get_current_code_editor().text


var _script_popup_id : int = -1
var _script_popup := {}
## 添加脚本弹窗
## @return  返回添加的弹窗菜单的[code]id[/code]
func add_script_popup(popup: PopupMenu) -> int:
	_script_popup_id += 1
	_script_popup[_script_popup_id] = popup
	get_editor_interface().get_script_editor().add_child(popup)
	return _script_popup_id


## 弹出菜单
## @id  菜单 [code]id[/code] 为 [method add_script_popup]add_script_popup[/method] 后返回的值
func popup_menu(id: int):
	if _script_popup.has(id):
		var editor = get_current_code_editor() as TextEdit
		var popup : PopupMenu = _script_popup[id]
		popup.position = (get_current_code_editor().global_position
			+ get_current_code_editor().get_caret_draw_pos()
			+ Vector2(0, 50)
		)
		popup.popup()

func get_current_script() -> Script:
	return get_editor_interface() \
		.get_script_editor() \
		.get_current_script()


func insert_code_current_pos(code: String, insert_first: bool = false):
	var textedit = get_current_code_editor()
	if insert_first:
		textedit.set_caret_column(0)
	textedit.insert_text_at_caret(code)


func _run():
	pass
	
	var popup = PopupMenu.new()
	popup.add_item("test_01")
	popup.add_item("test_02")
	popup.add_item("test_03")
	var id = add_script_popup(popup)
	popup_menu(id)
	
	await get_editor_interface().get_tree().create_timer(1).timeout
	popup.queue_free()
	
          #============================================================
#    Data Util
#============================================================
# - datetime: 2022-12-21 21:19:10
#============================================================
## 数据工具
##
##用作全局获取数据使用
class_name ScriptCommentMenu_DataUtil


##  获取场景树 [SceneTree] 对象的 meta 数据作为单例数据，如果返回的数据为 [code]null[/code] 则会在下次继续调用这个 
##default 回调方法，直到返回的数据不为 [code]null[/code] 为止 
##[br]
##[br][code]meta_key[/code]  数据key
##[br][code]default[/code]  如果没有这个key，则默认返回的数据
##[br][code]ignore_null[/code]  忽略 null 值。如果为 true，则在默认值为 null 的时候不记录到元数据，直到有数据为止
static func get_meta_data(meta_key: StringName, default: Callable, ignore_null: bool = true):
	if Engine.has_meta(meta_key) and Engine.get_meta(meta_key) != null:
		return Engine.get_meta(meta_key)
	else:
		var value = default.call()
		if ignore_null:
			if value != null:
				set_meta_data(meta_key, value)
		else:
			set_meta_data(meta_key, value)
		
		return value


##  设置数据
##[br]
##[br][code]meta_key[/code]  数据key
##[br][code]value[/code]  设置的值
static func set_meta_data(meta_key: StringName, value):
	Engine.set_meta(meta_key, value)


## 是否有这个 key 的据
static func has_meta_data(meta_key: StringName) -> bool:
	return  Engine.has_meta(meta_key)


##  移除数据
static func remove_meta_data(meta_key: StringName) -> bool:
	if Engine.has_meta(meta_key):
		Engine.remove_meta(meta_key)
		return true
	return false


## 移除所有meta数据
static func clear_all_meta() -> void:
	for key in Engine.get_meta_list():
		Engine.remove_meta(key)


##  获取 Dictionary 数据
static func get_meta_dict_data(meta_key: StringName, default: Dictionary = {}) -> Dictionary:
	if Engine.has_meta(meta_key):
		return Engine.get_meta(meta_key)
	else:
		Engine.set_meta(meta_key, default)
		return default


##  获取 Array 数据
static func get_meta_array_data(meta_key: StringName, default: Array = []) -> Array:
	if Engine.has_meta(meta_key):
		return Engine.get_meta(meta_key)
	else:
		Engine.set_meta(meta_key, default)
		return default


## 获取目标的默认数据，以目标对象作为基础存储数据
static func get_object_data(object: Object, key: StringName, default: Callable ):
	if object.has_meta(key):
		return object.get_meta(key)
	else:
		var data = default.call()
		object.set_meta(key, data)
		return data


## 获取标 [Dictionary] 类型数据 
static func get_object_dict_data(object: Object, key: StringName, default: Dictionary = {}) -> Dictionary:
	return get_object_data(object, key, func(): return default)


class _ClassInfo:
	var _type : int = TYPE_NIL
	var _class_name : StringName = &""
	var _script : Script = null
	
	func _to_string():
		return str({
			"_type": _type,
			"_class_name": _class_name,
			"_script": _script,
		})
	

## 获取类的数据
##[br]
##[br][code]_class[/code]  类型。这个值可以是类名称，也可以是 [int] 类的数据型枚举的值。最大
## [constant TYPE_MAX]，最小 [constant TYPE_NIL]
##[br][code]return[/code]  返回这个类的信息
static func get_class_info(_class) -> _ClassInfo:
	var map = get_meta_dict_data("DataUtil_get_type_cache_data_for_array", {})
	if map.has(_class):
		return map[_class] as _ClassInfo
		
	else:
		var type : int = TYPE_NIL
		var _class_name : StringName = &""
		var script = null
		if _class is Script:
			type = TYPE_OBJECT
			_class_name = _class.get_instance_base_type()
			script =  _class
		elif _class is int and _class > 0 and _class < TYPE_MAX:
			type = _class
			_class = ScriptCommentMenu_ScriptUtil.get_type_name(_class)
		elif _class is Object:
			var _class_type_ = str(_class)
			if _class_type_.contains("GDScriptNativeClass"):
				var obj = _class.new()
				type = typeof(obj)
				_class_name = obj.get_class()
			else:
				type = TYPE_OBJECT
				_class_name = "Object"
		elif _class is String:
			if ScriptCommentMenu_ScriptUtil.is_base_data_type(_class):
				type = ScriptCommentMenu_ScriptUtil.get_type_of(_class)
				_class = ScriptCommentMenu_ScriptUtil.get_built_in_class(_class)
			else:
				type = TYPE_OBJECT
		
		var data = _ClassInfo.new()
		data._type = type
		data._class_name = _class_name
		data._script = script
		map[_class] = data
		return data


## 获取类型化数组
##[br]
##[br][code]_class[/code]  数据的类型。比如 [code]"Dictionary", Node, Sprite2D[/code] 等类名（基础数据类型需要加双引号），
##或者自定义类名 Player，或者字符串形式的类名，或者 TYPE_INT, TYPE_DICTIONARY
##[br][code]default[/code]  默认有哪些数据
static func get_type_array(_class, default : Array = []) -> Array:
	var data : _ClassInfo = get_class_info(_class)
	# 返回类型化数组
	return Array(default, data._type, data._class_name, data._script )


## 转为类型化数组
static func to_type_array(_class, array: Array) -> Array:
	return get_type_array(_class, array)


## 数组转为字典
##
##[codeblock]
##var dict_data = ScriptCommentMenu_DataUtil.array_to_dictionary( 
##    node_list, 
##    func(node): return node.name, # key 键
##    func(node): return {} 
##) 
##[/codeblock]
static func array_to_dictionary(
	list: Array, 
	get_key: Callable = func(item): return item, 
	get_value: Callable = func(item): return null 
) -> Dictionary:
	var data = {}
	var key
	var value
	for i in list:
		key = get_key.call(i)
		value = get_value.call(i)
		data[key] = value
	return data


## 引用数据
class RefData:
	var value
	
	func get_value():
		return value
	
	func _init(value) -> void:
		self.value = value
	
	func _to_string():
		return str(value)


## 获取引用数据。
##[br]
##[br][b]Note:[/b] 主要用在匿名函数里，以处理基本数据类型的值。因为匿名函数之外的基本数据类型的值
##在匿名函数修改不会发生改变。
static func get_ref_data(default) -> RefData:
	return RefData.new(default)


## 获取字典的值，如果没有，则获取并设置默认值
##[br]
##[br][code]dict[/code]  获取的字典
##[br][code]key[/code]  key 键
##[br][code]not_exists_set[/code]  没有则返回值设置这个值。这个回调方法返回要设置的数据
static func get_value_or_set(dict: Dictionary, key, not_exists_set: Callable):
	if dict.has(key) and not typeof(dict[key]) == TYPE_NIL:
		return dict[key]
	else:
		dict[key] = not_exists_set.call()
		return dict[key]


## 生成id
static func generate_id(data_list: Array) -> StringName:
	var list = []
	for i in data_list:
		list.append(hash(i))
	return ",".join(list).sha1_text()


## 如果不为空值结果值
class NotNullValueChain:
	
	func _init(value):
		set_meta("value", value)
	
	func get_value(default = null):
		return get_meta("value", default)
	
	func or_else(object, else_object: Callable) -> NotNullValueChain:
		return NotNullValueChain.new( object if object else else_object.call() )
	
	## 返回结果不为空时，这个方法需要一个参数接收值
	func if_not_null(else_object: Callable, default = null) -> NotNullValueChain:
		var value = get_value()
		return NotNullValueChain.new( else_object.call(value) if value else default )


##  如果对象不为 null 则调用。
## 可以链式调用逐步执行功能
##[codeblock]
##func get_data(object: Object):
##    return ScriptCommentMenu_DataUtil.if_not_null(object, func():
##        return object.get_script()
##    ).or_else(func():
##        print("")
##    )
##[/codeblock]
static func if_not_null(object, else_object: Callable) -> NotNullValueChain:
	return NotNullValueChain.new((
		else_object.call() if object != null else object
	))


## 获取正则
static func get_regex(pattern: String) -> RegEx:
	var re = RegEx.new()
	re.compile(pattern)
	return re


##  合并数据
##[br]
##[br][code]merge_target[/code]  合并到的目标
##[br][code]data[/code]  要追加合并的数据
##[br][return]return[/return]  返回合并后的数据
static func merge(merge_target, data):
	if merge_target is Dictionary:
		merge_target.merge(data)
		return merge_target
	elif merge_target is Array or merge_target is String:
		merge_target += merge_target
		return merge_target
	else:
		assert(false, "错误的数据类型！只能合并 [Dictionary, Array, String] 中的一种！")


## 获取一个唯一的数字 ID，从 0 始
static func get_id() -> int:
	const KEY = "DataUtil_get_id"
	if Engine.has_meta(KEY):
		var id = Engine.get_meta(KEY)
		id += 1
		Engine.set_meta(KEY, id)
		return id
	else:
		var id = 0
		Engine.set_meta(KEY, id)
		return id


## 列表转为集合hash值，这样即便列表顺序不一致他的值也是相同的
static func as_set_hash(list: Array) -> int:
	var h : int = 0
	for i in list:
		h += hash(i)
	return h

    #============================================================
#    Plugin
#============================================================
# - datetime: 2022-06-11 11:26:00
# - datetime: 2022-07-17 14:54:39
#============================================================
@tool
extends EditorPlugin



var menu_button : MenuButton 
var util_add_menu := ScriptCommentMenuConstant.AddMenu.new()

var _sub_menus = [
	_ScriptMenu_Comments.new(),
	_ScriptMenu_Overrides.new(),
]


func _enter_tree():
	# 编辑器启动不超过 5 秒时
	if Time.get_ticks_msec() < 5000:
		await Engine.get_main_loop().create_timer(10).timeout
	_init_data.call_deferred()


func _exit_tree():
	if menu_button:
		menu_button.queue_free()
	for sub in _sub_menus:
		sub._uninstall()


func _init_data():
	# 添加菜单按钮
	menu_button = MenuButton.new()
	menu_button.text = "代码工具"
	menu_button.switch_on_hover = true
	menu_button.size_flags_horizontal = Control.SIZE_SHRINK_BEGIN
	util_add_menu.add_script_editor_menu(menu_button)
	
	for sub in _sub_menus:
		sub.init_menu(menu_button)



 #============================================================
#    Scirpt Util
#============================================================
# - datetime: 2022-07-17 17:25:00
#============================================================
## 处理脚本的工具
class_name ScriptCommentMenu_ScriptUtil


const DATA_TYPE_TO_NAME = {
	TYPE_NIL: &"null",
	TYPE_BOOL: &"bool",
	TYPE_INT: &"int",
	TYPE_FLOAT: &"float",
	TYPE_STRING: &"String",
	TYPE_RECT2: &"Rect2",
	TYPE_VECTOR2: &"Vector2",
	TYPE_VECTOR2I: &"Vector2i",
	TYPE_VECTOR3: &"Vector3",
	TYPE_VECTOR3I: &"Vector3i",
	TYPE_TRANSFORM2D: &"Transform2D",
	TYPE_VECTOR4: &"Vector4",
	TYPE_VECTOR4I: &"Vector4i",
	TYPE_PLANE: &"Plane",
	TYPE_QUATERNION: &"Quaternion",
	TYPE_AABB: &"AABB",
	TYPE_BASIS: &"Basis",
	TYPE_TRANSFORM3D: &"Transform3D",
	TYPE_PROJECTION: &"Projection",
	TYPE_COLOR: &"Color",
	TYPE_STRING_NAME: &"StringName",
	TYPE_NODE_PATH: &"NodePath",
	TYPE_RID: &"RID",
	TYPE_OBJECT: &"Object",
	TYPE_CALLABLE: &"Callable",
	TYPE_SIGNAL: &"Signal",
	TYPE_DICTIONARY: &"Dictionary",
	TYPE_ARRAY: &"Array",
	TYPE_PACKED_BYTE_ARRAY: &"PackedByteArray",
	TYPE_PACKED_INT32_ARRAY: &"PackedInt32Array",
	TYPE_PACKED_INT64_ARRAY: &"PackedInt64Array",
	TYPE_PACKED_STRING_ARRAY: &"PackedStringArray",
	TYPE_PACKED_VECTOR2_ARRAY: &"PackedVector2Array",
	TYPE_PACKED_VECTOR3_ARRAY: &"PackedVector3Array",
	TYPE_PACKED_FLOAT32_ARRAY: &"PackedFloat32Array",
	TYPE_PACKED_FLOAT64_ARRAY: &"PackedFloat64Array",
	TYPE_PACKED_COLOR_ARRAY: &"PackedColorArray",
}

const NAME_TO_DATA_TYPE = {
	&"null": TYPE_NIL,
	&"bool": TYPE_BOOL,
	&"int": TYPE_INT,
	&"float": TYPE_FLOAT,
	&"String": TYPE_STRING,
	&"Rect2": TYPE_RECT2,
	&"Vector2": TYPE_VECTOR2,
	&"Vector2i": TYPE_VECTOR2I,
	&"Vector3": TYPE_VECTOR3,
	&"Vector3i": TYPE_VECTOR3I,
	&"Transform2D": TYPE_TRANSFORM2D,
	&"Vector4": TYPE_VECTOR4,
	&"Vector4i": TYPE_VECTOR4I,
	&"Plane": TYPE_PLANE,
	&"Quaternion": TYPE_QUATERNION,
	&"AABB": TYPE_AABB,
	&"Basis": TYPE_BASIS,
	&"Transform3D": TYPE_TRANSFORM3D,
	&"Projection": TYPE_PROJECTION,
	&"Color": TYPE_COLOR,
	&"StringName": TYPE_STRING_NAME,
	&"NodePath": TYPE_NODE_PATH,
	&"RID": TYPE_RID,
	&"Object": TYPE_OBJECT,
	&"Callable": TYPE_CALLABLE,
	&"Signal": TYPE_SIGNAL,
	&"Dictionary": TYPE_DICTIONARY,
	&"Array": TYPE_ARRAY,
	&"PackedByteArray": TYPE_PACKED_BYTE_ARRAY,
	&"PackedInt32Array": TYPE_PACKED_INT32_ARRAY,
	&"PackedInt64Array": TYPE_PACKED_INT64_ARRAY,
	&"PackedStringArray": TYPE_PACKED_STRING_ARRAY,
	&"PackedVector2Array": TYPE_PACKED_VECTOR2_ARRAY,
	&"PackedVector3Array": TYPE_PACKED_VECTOR3_ARRAY,
	&"PackedFloat32Array": TYPE_PACKED_FLOAT32_ARRAY,
	&"PackedFloat64Array": TYPE_PACKED_FLOAT64_ARRAY,
	&"PackedColorArray": TYPE_PACKED_COLOR_ARRAY,
}


static func _get_script_data_cache(script: Script) -> Dictionary:
	return ScriptCommentMenu_DataUtil.get_meta_dict_data("ScriptCommentMenu_ScriptUtil__get_script_data_cache")

##  数据类型名称
##[br][code]type[/code]: 数据类型枚举值
##[br][code]return[/code]: 返回数据类型的字符串
static func get_type_name(type: int) -> StringName:
	return DATA_TYPE_TO_NAME.get(type)

## 获取这个类名的类型
static func get_type_of(_class_name: StringName) -> int:
	return NAME_TO_DATA_TYPE.get(_class_name, -1)

## 是否有这个类型的枚举
static func has_type(type: int) -> bool:
	return DATA_TYPE_TO_NAME.has(type)

## 是否是基础数据类型
static func is_base_data_type(_class_name: StringName) -> bool:
	return NAME_TO_DATA_TYPE.has(_class_name)

##  获取属性列表
##[br]
##[br]返回类似如下格式的数据
##[codeblock]
##{ 
##    "name": "RefCounted", 
##    "class_name": &"", 
##    "type": 0, 
##    "hint": 0, 
##    "hint_string": "", 
##    "usage": 128 
##}
##[/codeblock]
static func get_property_data_list(script: Script) -> Array[Dictionary]:
	if is_instance_valid(script):
		return script.get_script_property_list()
	return Array([], TYPE_DICTIONARY, "Dictionary", null)

##  获取方法列表
static func get_method_data_list(script: Script) -> Array[Dictionary]:
	if is_instance_valid(script):
		return script.get_script_method_list()
	ScriptCommentMenu_DataUtil.get_type_array("int")
	return Array([], TYPE_DICTIONARY, "Dictionary", null)


## 获取方法的参数列表数据
static func get_method_arguments_list(script: Script, method_name: StringName) -> Array[Dictionary]:
	var data = get_method_data(script, method_name)
	if data:
		return data.get("args", ScriptCommentMenu_DataUtil.get_type_array("Dictionary"))
	return ScriptCommentMenu_DataUtil.get_type_array("Dictionary")


##  获取信号列表
static func get_signal_data_list(script: Script) -> Array[Dictionary]:
	if is_instance_valid(script):
		return script.get_script_signal_list()
	return Array([], TYPE_DICTIONARY, "Dictionary", null)

## 获取这个属性名称数据
static func get_property_data(script: Script, property: StringName) -> Dictionary:
	var data = _get_script_data_cache(script)
	var p_cache_data : Dictionary = ScriptCommentMenu_DataUtil.get_value_or_set(data, "propery_data_cache", func():
		var property_data : Dictionary = {}
		for i in script.get_script_property_list():
			property_data[i['name']] = i
		return property_data
	)
	return p_cache_data.get(property, {})

## 获取这个名称的方法的数据
static func get_method_data(script: Script, method_name: StringName) -> Dictionary:
	var data = _get_script_data_cache(script)
	var m_cache_data : Dictionary = ScriptCommentMenu_DataUtil.get_value_or_set(data, "method_data_cache", func():
		var method_data : Dictionary = {}
		for i in script.get_script_method_list():
			method_data[i['name']]=i
		return method_data
	)
	return m_cache_data.get(method_name, {})

## 获取这个名称的信号的数据
static func get_signal_data(script: Script, signal_name: StringName):
	var data = _get_script_data_cache(script)
	var s_cache_data : Dictionary = ScriptCommentMenu_DataUtil.get_value_or_set(data, "script_data_cache", func():
		var signal_data : Dictionary = {}
		for i in script.get_script_signal_list():
			signal_data[i['name']]=i
		return signal_data
	)
	return s_cache_data.get(signal_name, {})


##  获取方法数据
## [br]
## [br][code]script[/code]： 脚本
## [br][code]method[/code]： 要获取的方法数据的方法名
## [br]
## [br][code]return[/code]： 返回脚本的数据信息。
##  包括的 key 有 [code]name[/code], [code]args[/code], [code]default_args[/code]
## , [code]flags[/code], [code]return[/code], [code]id[/code]
func find_method_data(script: Script, method: String) -> Dictionary:
	var method_data = script.get_script_method_list()
	for m in method_data:
		if m['name'] == method:
			return m
	return {}


##  获取扩展脚本链（扩展的所有脚本）
##[br]
##[br][code]script[/code]  Object 对象或脚本
##[br][code]return[/code]  返回继承的脚本路径列表
static func get_extends_link(script: Script) -> PackedStringArray:
	var list := PackedStringArray()
	while script:
		if FileAccess.file_exists(script.resource_path):
			list.push_back(script.resource_path)
		script = script.get_base_script()
	return list


##  获取基础类型继承链类列表
##[br]
##[br][code]_class[/code]  基础类型类名
##[br][code]return[/code]  返回基础的类名列表
static func get_extends_link_base(_class) -> PackedStringArray:
	if _class is Script:
		_class = _class.get_instance_base_type()
	elif _class is Object:
		_class = _class.get_class()
	
	var c = _class
	var list = []
	while c != "":
		list.append(c)
		c = ClassDB.get_parent_class(c)
	return PackedStringArray(list)


##  生成方法代码
##[br]
##[br][code]method_data[/code]  方法数据
##[br][code]return[/code]  返回生成的代码
static func generate_method_code(method_data: Dictionary) -> String:
	var temp := method_data.duplicate(true)
	var args := ""
	for i in temp['args']:
		var arg_name = i['name']
		var arg_type = ( get_type_name(i['type']) if i['type'] != TYPE_NIL else "")
		if arg_type.strip_edges() == "":
			arg_type = str(i['class_name'])
		if arg_type.strip_edges() != "":
			arg_type = ": " + arg_type
		args += "%s%s, " % [arg_name, arg_type]
	temp['args'] = args.trim_suffix(", ")
	if temp['return']['type'] != TYPE_NIL:
		temp['return_type'] = get_type_name(temp['return']['type'])
	
	if temp.has('return_type') and temp['return_type'] != "":
		temp['return_type'] = " -> " + str(temp['return_type'])
		temp['return_sentence'] = "pass\n\treturn super." + temp['name'] + "()"
	else:
		temp['return_type'] = ""
		temp['return_sentence'] = "pass"
	
	return "func {name}({args}){return_type}:\n\t{return_sentence}\n".format(temp)


##  获取对象的脚本
static func get_object_script(object: Object) -> Script:
	if object == null:
		return null
	if object is Script:
		return object
	return object.get_script() as Script


##  对象是否是 tool 状态
##[br]
##[br][code]object[/code]  返回这个对象的脚本是否是开启 tool 的状态
static func is_tool(object: Object) -> bool:
	var script = get_object_script(object)
	return script.is_tool() if script else false


## 获取对象的脚本路径，如果不存在脚本，则返回空的字符串
static func get_object_script_path(object: Object) -> String:
	var script = get_object_script(object)
	return script.resource_path if script else ""


##  获取这个对象的这个方法的信息
##[br]
##[br][code]object[/code]  对象
##[br][code]method_name[/code]  方法名
##[br][code]return[/code]  返回方法的信息
static func get_object_method_data(object: Object, method_name: StringName) -> Dictionary:
	if not is_instance_valid(object):
		return {}
	var script = get_object_script(object)
	if script:
		return get_method_data(script, method_name)
	return {}


## 获取这个信号的数据
static func get_object_signal_data(object: Object, signal_name: StringName) -> Dictionary:
	if not is_instance_valid(object):
		return {}
	var script = get_object_script(object)
	if script:
		return get_signal_data(script, signal_name)
	return {}


## 获取对象的属性数据
static func get_object_property_data(object: Object, proprety_name: StringName) -> Dictionary:
	if not is_instance_valid(object):
		return {}
	var script = get_object_script(object)
	if script:
		return get_property_data(script, proprety_name)
	return {}


##  获取内置类名称转为对象。比如将 "Node" 字符串转为 [Node] 这种 GDScriptNativeClass 类型数据
##[br]
##[br][code]_class[/code]  类名称
static func get_built_in_class (_class: StringName):
	if not ClassDB.class_exists(_class):
		return null
	var _class_db = ScriptCommentMenu_DataUtil.get_meta_dict_data("ScriptCommentMenu_ScriptUtil_get_built_in_class")
	return ScriptCommentMenu_DataUtil.get_value_or_set(_class_db, _class, func():
		var script = GDScript.new()
		script.source_code = "var type = " + _class
		if script.reload() == OK:
			var obj = script.new()
			_class_db[_class] = obj.type
			return _class_db[_class]
		else:
			push_error("错误的类名：", _class)
		return null
	)


## 根据类名返回类对象
static func get_script_class(_class: StringName):
	if ClassDB.class_exists(_class):
		return null
	var _class_db = ScriptCommentMenu_DataUtil.get_meta_dict_data("ScriptCommentMenu_ScriptUtil_get_script_class")
	return ScriptCommentMenu_DataUtil.get_value_or_set(_class_db, _class, func():
		var script = GDScript.new()
		script.source_code = "var type = " + _class
		if script.reload() == OK:
			var obj = script.new()
			_class_db[_class] = obj.type
			return _class_db[_class]
		else:
			push_error("错误的类名：", _class)
		return null
	)


## 创建脚本
static func create_script(source_code: String) -> GDScript:
	var data = ScriptCommentMenu_DataUtil.get_meta_dict_data("ScriptCommentMenu_ScriptUtil_create_script")
	return ScriptCommentMenu_DataUtil.get_value_or_set(data, source_code.sha256_text(), func():
		var script := GDScript.new()
		script.source_code = source_code
		script.reload()
		return script
	)


## 获取这个类的场景。这个场景的位置和名称需要和脚本一致，只有后缀名不一样。这个类不能是内部类
static func get_script_scene(script: GDScript) -> PackedScene:
	var data = ScriptCommentMenu_DataUtil.get_meta_dict_data("ScriptCommentMenu_ScriptUtil_get_script_scene")
	if data.has(script):
		return data[script]
	else:
		var path := script.resource_path
		if path == "":
			return null
		
		var ext := path.get_extension()
		var file = path.substr(0, len(path) - len(ext))
		
		var scene: PackedScene
		if FileAccess.file_exists(file + "tscn"):
			scene = ResourceLoader.load(file + "tscn", "PackedScene") as PackedScene
		elif FileAccess.file_exists(file + "scn"):
			scene = ResourceLoader.load(file + "scn", "PackedScene") as PackedScene
		else:
			printerr("这个类目录下没有相同名称的场景文件！")
			return null
		data[script] = scene
		return scene


##  获取对象的类。如果是自定义类返回 [GDScript] 类；如果是内置类，则返回 [GDScriptNativeClass] 类
static func get_object_class(object: Object):
	if object:
		if object is Script:
			return object
		if object.get_script() != null:
			return object.get_script()
		return get_built_in_class (object.get_class())
	return &""
   GST2   �   �      ����               � �        D  RIFF<  WEBPVP8L/  /�͈IS�����k\l���>�X5m$9� � �ٖ�Em#9��$&�=��6 e�� 𥤹����'�a�6��W�����YcfwֻO���m۶��m۶��ݧ��wg1�npL�$��<z�?m[�vL�t=��Gdd�m۶m̜��m�q�k۶�mw)3"��ض�l�m[��W����f�3#Ӝ	��L�L�tczӛ3333H���C�m����϶m�Q�q:�5~E��_۶[�y�*��1�m�Htv�Ξ��a��� @9	����g<̰��dE%}f�)�.��b?��JH+`�9�� �u��  {X�Z�16PS6�fm��}快�Ά���f�CY��@2L���+�?���}�ZٔiTԔt܊rPQ#�s���������M
ph!��DJ��-�edCf  (�)RWS���+3�=Nmi�+��x)@�$�������(� �
�%����JU|�˿|8�r#4i��st���R  V$
PoE6 �`�ހ 5�fV����
���'�m���1��ΣjHU@��΂@�0���hF7  ^(��<�3  ~Az`�iv�@C� ��>8'z5˞L �P�F�� ���f�
GتW�$- ��- ��ze$��/�Ms�I���'q���(�^��\�?�,W����&�EZ�XQ�῝�(�Eoe0��_S��}R 0U��kZ�j@g�d0��8`�s�Z���5�Q ��`��>���  hh�,�b��ݕ~�*�֬&��(�f�ڑ�����*�4S���5Z��W�"��N+$�-���k���`2��,�h�L��*R�3��@g6�%��4�Ƨ���� ��i-����G��?!��]���N��c9�ۣ�YU	Y�D�J@�*�(Y���'��h�T�"�޷^5T4��T�Ȋ�S���i��O,��#�9瞽�� dL�k���z�»z�AF
:�~���?K���߶��[$��{��?�4�y�r��k֞y��1��p:�eyQ�Χ�5��g)S׶jl9���'�b%��9���[<1mb�Ļ�i���֕���H�' >�^�ֹw�磚���SOkZ��#\f7 D;GM��j����v��=Z��D�4�[���{�M�͑ӊZ t��-��[���#�pJ���t��!��'��:`bb'θc��7���:�O'O���K��
�R�Q�*tf5��a�i75�9�~�9`���[�<,��#3:4���1�Je	L��.���	ȱ�B����=���ZKz	3�&���ޙA�aY/ m�u� Ʋi�D^���b�;@�Li��� ut��+�tEf�bw-,Y]�yY��!�i7���"��Ũ��#k(�j��# A,y�R�!�r�,K�5���BJ$og�2v<v���p8Ch�Mm�N|�tŜ�ҰIxF~����|�]/.c� �b�ѣ�Hv�1Vq�K�|	ߊ�5���ǭ��Ll#�*��Y��<G��)g_T%��V��M��5��<�0�J�~*/�kٝ�(����'.�k��b7�x�9,?y��a��LK �ǲ꿫&�8;G� @�І$�Z��/�9t�'/ �½�I/����O��]�K���3��g/ og\);a��s�gz �}�g�+�@	߸n4  y�!�� U����^����k��v��Hl�|)#���k�z�j�3�FU��8�O: ���ͿD��+W p^ƣ�qz�N �����6�|�R�
0������[�|㺀���w�OY?� ����Fǟ�Ig�-�Q��	��I���b���}�ZZ
 ���ѧ�g��gsH�M��Vg/ V�{��D$�H  kN�3�a��Ǻ���>�pk�h���{$� nvX{2����4�@�ql?�<{l;�����a�� ۏ�g���  &2�&�����7�Le�� ��<ŗÑ��Ǽ^�S�s/����-@��x�z~9z+2�U�%����*���F7�p;�WJ���H�f���-��z���6i�> vg� �� �{n��w����>�%���w_?��F9��������O�\~��ڷ X[� d�˕\x����W�~�+n����J��W��W?�e�]���I-_�$�s�;��С�p*bK~����. 2�+C���P�H ��[]�7<q��m=�z��9/=��g_��x���P�+��=z�V9�ڛO�\>6����&]��?��� P�) GV��h� ���}����Tu�����T��+=���a����f�:'�Ȓ^�~�j,k �Y]cMb$>�H���ݤ?�8��X>�L*F��X��C^�A�i�H��`e ��_��2�j�4���ɧJq�V��2c���Ӆn��٫P�h�z�����2��o���[2�k�Y`�C�_��f8�a�XÖt�O�կe_����W@n���T�?�kc�?�+���J�_?3���(��w@��2��S#���F_{��6�X˧�~�y���CJ�(��3j�dO���~��,%��ݟU\�\M�Z{-V��fb`����Z�fI�b�@���՗�%��Ⱦ1�o$��a��غL%+�v���ұ�V�8JE�z�|��L���d�0��+�S;s�f'�"��Bպ7j�����jSѕ�b��9} v�j8���.��x�<�=��!'m�\E�7��$|�ii|�%��}"�`-N�DkZ�kW��>�P�2i��x3� ��sl��fU�T��"� !	O,N�@h��1�� � �⧥3��5�n b�u��f'�� ���( �pC��! �F�;��t9� ��N�o�䦫.��ڙ��T�T ��F��)�����a��<I.):a��4'��O�  �Ȱᩩ 	�4X 4��`G�l����p̝ғ�F��4 ���[Š46@ 3` �y��;  0���|� �O�O ����3� 0�8�#�%�fx�3P�U  �.i� t�����$�`V&���&ݕI�
K �����@��ؙ������]5 �h8���AX�i�����C�������J���5z�f��J��+b$9��f	w� �
5����S�o��~���WJ�=�;���o����=���V�T��9�/�~.K?���I�;G�ۢ-���}�Џ@SV�L( �����xu�=�Ƨ����~~�Ǩ�e/}¾�o|눏J����'���m����[�w8|��W�����rwB�����G�� ������ň�qh���2�Ӓ'/&��'�7��FO��A5֭�m����+��C^Iv�W!��g�Z�@&���r�P"X�̕��O3oO��(['��a�8��9�\T��[cvV  `�,i	��#;*�&2ᜍ q@�sk�3OM�7��%�kȰ��kh��
ҌϬxb��C� ��G7 �Ld<1K!���rZ��I����׬��tH*��['��(V�d��<��ؘ�2s"����E�P ���|�JCg�i ĒK�W�;��7Ϫ1ǮWH�#��"���ƬIM:�T̔�F��;uLc�P3�c�����[�E��Gf�al�1 |`�"�V��ucn�E0 �aN3�	�X��ݳxl�a��dܾb�� �!- �l���	;<6O�K�\9��h �I{3�i��>2�`�m�u�^[|d�,W��;�� 6^��{˵yC��qk���X���1���V����p�<V ��@����l6.Z�gv(f�xdŪr	�> p�fvY8- ���1ώ�kf5e�� <>Æ��2gÐ��D�$MV"�=�Ӷֿ�V^ �tN�Z�m�Wր����� ���z�o�q�P��bl8m#��� ��ʿ9m#�j���H�<�%bAojdcD��T�� &�����!  `a�RU"� 0.b��h�b�&�NKK4�%Z�sv2g��d�O�����J�����H���X]i�M\�����\��m/uu��HRw���@B#�5^H�h� �YJ"˘���G��ч*v������V �! Y��5��(�<���T�q�k����m�!�E�}cѧ��� �︣t�b'��;�/��c2 ѐ�,2'����\�{���z�R�89�c���:� �Y-	�%#g�u;����_�C�r']��-��/�	T+l^8B����u��8 �!
i�pD��e(��B�E�{Pw�����S&�	e��^v�\Ěk�q�!s�5�ïqW���b� ~�~3��;դŒf1 v(��CTA;+s�S  m�����N�
偝# �_�}�U8G���,��� �<�� �(����Tq�  �e�	 �q@��{��� tk���XC�<Q�8 ԩ��$�!���<�� e�a�@ @E<DR7�r�.2^�  J�.��e ����<�  �ٓ��t됝��3z�C�_ng��2�U\���s@�}�}m̹.�� �Ξ ��Y�2����d���c �g�Yu��O��M�9��p7.�V��c����g`:��V�3�سƦz������9n2d�H�#J��uGû�,� @e\[`q(�N&z�pyh��*z��L:�q�#�T��Toյ �����<�u�û����A1�B��3V]     [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://phh8pmo4ylhb"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 extends Node2D

var excel
var workbook
var sheet
var table_data
var summaTotal : float = 0

func _ready():
	excel = ExcelFile.open_file("res://Beställningar 2023.xlsx") # Öppna xlsx-filen
	workbook = excel.get_workbook() # Hämta arbetsboken
	sheet = workbook.get_sheet(0) # Hämta det första arket
	table_data = sheet.get_table_data() # Hämta tabellens data som en array av arrayer
	#print(JSON.stringify(table_data, "\t")) # Skriv ut data i JSON-format

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		_on_btn_search_pressed()

func _on_button_pressed():
	table_data = sheet.get_table_data()
	var artikelnummer = int($LineEdit.text) # Det artikelnummer du vill söka efter
	print("TEXT IN: " + str(artikelnummer))
	for row in table_data: # Loopa över varje rad i tabellen
		var column_data : Dictionary = table_data[row]
		#print(column_data)
		if column_data[1] == artikelnummer: # Om första kolumnen i raden matchar artikelnumret
			print(column_data[2]) # Skriv ut den tredje kolumnen i raden
			$Label.text = "Artikel: " + str(column_data[2]) + " Pris: " + str(column_data[3]) + "kr"
			break # Avsluta loopen
		else:
			print("No matched id")
			#break


func _on_btn_search_pressed():
	$ItemList.clear()
	table_data = sheet.get_table_data()
	var partial_key = $leSEARCH.text
	for row in table_data:
		var column_data : Dictionary = table_data[row]
		if column_data.has(2):
			#print(column_data[2]) #Printar allt i kolumn 2
			if partial_key in column_data[2] : # Om första kolumnen i raden matchar
				$ItemList.add_item(column_data[2])
				print(column_data[2]) # Skriv ut den tredje kolumnen i raden
		#for column in column_data:
		#	print(column_data[column])


func _on_btn_add_pressed():
	if $ItemList.get_selected_items().size() > 0:
		print($ItemList.get_item_text($ItemList.get_selected_items()[0]))
		table_data = sheet.get_table_data()
		for row in table_data:
			var column_data : Dictionary = table_data[row]
			if column_data.has(2):
				if column_data[2] == $ItemList.get_item_text($ItemList.get_selected_items()[0]):
					for child in $Panel/VBoxContainer.get_children():
						print(child.name + str(child.hasData))
						if not child.hasData:
							child.hasData = true
							if column_data.has(1):
								child.get_node("leRSK").text = str(column_data[1])
							if column_data.has(2):
								child.get_node("leArtikel").text = str(column_data[2])
								child.get_node("leAntal").text = $leAntal.text + " st/m"
							if column_data.has(6):
								child.get_node("leApris").text = str(column_data[6]) + " Kr/st"
								var sum : float = float(column_data[6]) * float($leAntal.text)
								summaTotal += sum
								child.get_node("leSum").text = str(sum) + " Kr"
								$leSumma.text = str(summaTotal) + " kr"
							break
						elif child.name == "Rad10" and child.hasData:
							print("ALL CHILDREN FILLED WITH DATA")
							break
					
					
					break
		




func _on_btn_clear_pressed() -> void:
	$Panel/VBoxContainer/Rad1.hasData = false
	$Panel/VBoxContainer/Rad2.hasData = false
	$Panel/VBoxContainer/Rad3.hasData = false
	$Panel/VBoxContainer/Rad4.hasData = false
	$Panel/VBoxContainer/Rad5.hasData = false
	$Panel/VBoxContainer/Rad6.hasData = false
	$Panel/VBoxContainer/Rad7.hasData = false
	$Panel/VBoxContainer/Rad8.hasData = false
	$Panel/VBoxContainer/Rad9.hasData = false
	$Panel/VBoxContainer/Rad10.hasData = false
	
	$Show.clear()
	summaTotal = 0
	$leSumma.text = str(summaTotal) + " kr"
 RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://Node2D.gd ��������   PackedScene    res://rad.tscn ��{�ze�Y      local://PackedScene_0skph 2         PackedScene          	         names "   -      Node2D    script 	   LineEdit    visible    offset_right    offset_bottom 	   leSEARCH    offset_left    offset_top    Button    text    Label 	   ItemList 
   btnSearch    btnAdd    Label2    leSumma    placeholder_text 	   editable    leAntal    layout_mode 	   btnClear 
   btnExport    Panel    VBoxContainer    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    Rad1    Rad2    Rad3    Rad4    Rad5    Rad6    Rad7    Rad8    Rad9    Rad10    _on_button_pressed    pressed    _on_btn_search_pressed    _on_btn_add_pressed    _on_btn_clear_pressed    	   variants    A                         �B     �A     �?     ,B    ��C     �B     �B     C      B   	   Get Data      /C     �@    ��C     �A      DATA      @@     �B    � D    ��C    ��C      SÖK      C    ��C     7C      Lägg till      �C     5C    ��D     LC   �   RSK                                                   Artikel                                        Antal        á-pris         Summa      hD    �D    ��D    @ D      SUMMA      �C     �B   ��C     C      1             ��     8B     ��      Antal:     ��C     �A    �D     �B      RENSA     �RD     �A    �pD     �B      EXPORT     ��C     OC    @�D    @D                                 node_count             nodes     `  ��������        ����                            ����                                       ����                                       	   	   ����                        	      
   
                        ����                                 
                        ����                                       	      ����                           
                  	      ����                           
                        ����                           
                        ����             !      "      #      $                           ����      %      &      '      (   
   )       
             ����      *      +      ,      -   
   .               	      ����      /      0      1      2   
   3               	      ����      4      5      6      7   
   8                     ����      9      :      ;      <                    ����      =      >                  ?      ?              ���   @         ?              ���   @         ?              ���    @         ?              ���!   @         ?              ���"   @         ?              ���#   @         ?              ���$   @         ?              ���%   @         ?              ���&   @         ?              ���'   @         ?             conn_count             conns               )   (                     )   *                     )   +                     )   ,                    node_paths              editable_instances              version             RSRC    extends Control

var hasData : bool = false

func changeHasData(a : bool):
	hasData = a
        RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://Rad.gd ��������      local://PackedScene_tdggh          PackedScene          	         names "         Rad1    layout_mode    anchors_preset    size_flags_vertical    script    Control    leRSK    offset_left    offset_top    offset_right    offset_bottom 	   editable 	   LineEdit 
   leArtikel    leAntal    leApris    leSum    	   variants                                         �@     �B     B            C    ��C    ��C    �D    @D    � D    �#D    �9D      node_count             nodes     l   ��������       ����                                               ����                     	      
                              ����                     	   	   
                              ����            
         	      
                        ����                     	      
                              ����                     	      
                      conn_count              conns               node_paths              editable_instances              version             RSRC    [remap]

path="res://.godot/exported/133200997/export-01275cef7de1685a5f50a6a79dd48428-check_label.scn"
        [remap]

path="res://.godot/exported/133200997/export-b6bfe05e28cacfe76153c3434be0a680-item_list.scn"
          [remap]

path="res://.godot/exported/133200997/export-788e591e0bfff3aac1534fa73587e45c-script_method_list.scn"
 [remap]

path="res://.godot/exported/133200997/export-acc09bf0cfd99bfaa5a30414b77230c9-dialog.scn"
             [remap]

path="res://.godot/exported/133200997/export-362256a061aa8890e9a1e558b11e5ec3-node_2d.scn"
            [remap]

path="res://.godot/exported/133200997/export-9227c4ae631be0a76db23c59dd995d25-rad.scn"
list=Array[Dictionary]([{
"base": &"RefCounted",
"class": &"ExcelFile",
"icon": "",
"language": &"GDScript",
"path": "res://addons/excel_reader/src/excel_file.gd"
}, {
"base": &"RefCounted",
"class": &"ExcelSheet",
"icon": "",
"language": &"GDScript",
"path": "res://addons/excel_reader/src/sheet.gd"
}, {
"base": &"RefCounted",
"class": &"ExcelWorkbook",
"icon": "",
"language": &"GDScript",
"path": "res://addons/excel_reader/src/workbook.gd"
}, {
"base": &"RefCounted",
"class": &"ExcelXMLData",
"icon": "",
"language": &"GDScript",
"path": "res://addons/excel_reader/src/xml_data.gd"
}, {
"base": &"RefCounted",
"class": &"ExcelXMLNode",
"icon": "",
"language": &"GDScript",
"path": "res://addons/excel_reader/src/xml_node.gd"
}, {
"base": &"RefCounted",
"class": &"ScriptCommentMenuConstant",
"icon": "",
"language": &"GDScript",
"path": "res://addons/script_comment_menu/util/@constant.gd"
}, {
"base": &"RefCounted",
"class": &"ScriptCommentMenu_DataUtil",
"icon": "",
"language": &"GDScript",
"path": "res://addons/script_comment_menu/data_util.gd"
}, {
"base": &"RefCounted",
"class": &"ScriptCommentMenu_ScriptUtil",
"icon": "",
"language": &"GDScript",
"path": "res://addons/script_comment_menu/script_util.gd"
}, {
"base": &"_ScriptMenu_SubItem",
"class": &"_ScriptMenu_Comments",
"icon": "",
"language": &"GDScript",
"path": "res://addons/script_comment_menu/sub_item/comment/comment.gd"
}, {
"base": &"_ScriptMenu_SubItem",
"class": &"_ScriptMenu_Overrides",
"icon": "",
"language": &"GDScript",
"path": "res://addons/script_comment_menu/sub_item/override/override.gd"
}, {
"base": &"RefCounted",
"class": &"_ScriptMenu_SubItem",
"icon": "",
"language": &"GDScript",
"path": "res://addons/script_comment_menu/sub_item/@sub_item.gd"
}])
          <?xml version="1.0" encoding="UTF-8" standalone="no"?>
<svg
   height="128"
   width="128"
   version="1.1"
   id="svg26"
   sodipodi:docname="icon.svg"
   xml:space="preserve"
   inkscape:version="1.2.1 (9c6d41e410, 2022-07-14)"
   xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
   xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
   xmlns="http://www.w3.org/2000/svg"
   xmlns:svg="http://www.w3.org/2000/svg"><defs
     id="defs30" /><sodipodi:namedview
     id="namedview28"
     pagecolor="#ffffff"
     bordercolor="#000000"
     borderopacity="0.25"
     inkscape:showpageshadow="2"
     inkscape:pageopacity="0.0"
     inkscape:pagecheckerboard="0"
     inkscape:deskcolor="#d1d1d1"
     showgrid="false"
     inkscape:zoom="4.0117188"
     inkscape:cx="41.877313"
     inkscape:cy="73.783836"
     inkscape:window-width="2560"
     inkscape:window-height="1369"
     inkscape:window-x="-8"
     inkscape:window-y="-8"
     inkscape:window-maximized="1"
     inkscape:current-layer="svg26" /><g
     transform="translate(32 32)"
     id="g6"><path
       d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99z"
       fill="#363d52"
       id="path2" /><path
       d="m-16-32c-8.86 0-16 7.13-16 15.99v95.98c0 8.86 7.13 15.99 16 15.99h96c8.86 0 16-7.13 16-15.99v-95.98c0-8.85-7.14-15.99-16-15.99zm0 4h96c6.64 0 12 5.35 12 11.99v95.98c0 6.64-5.35 11.99-12 11.99h-96c-6.64 0-12-5.35-12-11.99v-95.98c0-6.64 5.36-11.99 12-11.99z"
       fill-opacity=".4"
       id="path4" /></g><g
     stroke-width="9.92746"
     transform="matrix(.10073078 0 0 .10073078 12.425923 2.256365)"
     id="g24"><path
       d="m0 0s-.325 1.994-.515 1.976l-36.182-3.491c-2.879-.278-5.115-2.574-5.317-5.459l-.994-14.247-27.992-1.997-1.904 12.912c-.424 2.872-2.932 5.037-5.835 5.037h-38.188c-2.902 0-5.41-2.165-5.834-5.037l-1.905-12.912-27.992 1.997-.994 14.247c-.202 2.886-2.438 5.182-5.317 5.46l-36.2 3.49c-.187.018-.324-1.978-.511-1.978l-.049-7.83 30.658-4.944 1.004-14.374c.203-2.91 2.551-5.263 5.463-5.472l38.551-2.75c.146-.01.29-.016.434-.016 2.897 0 5.401 2.166 5.825 5.038l1.959 13.286h28.005l1.959-13.286c.423-2.871 2.93-5.037 5.831-5.037.142 0 .284.005.423.015l38.556 2.75c2.911.209 5.26 2.562 5.463 5.472l1.003 14.374 30.645 4.966z"
       fill="#fff"
       transform="matrix(4.162611 0 0 -4.162611 919.24059 771.67186)"
       id="path8" /><path
       d="m0 0v-47.514-6.035-5.492c.108-.001.216-.005.323-.015l36.196-3.49c1.896-.183 3.382-1.709 3.514-3.609l1.116-15.978 31.574-2.253 2.175 14.747c.282 1.912 1.922 3.329 3.856 3.329h38.188c1.933 0 3.573-1.417 3.855-3.329l2.175-14.747 31.575 2.253 1.115 15.978c.133 1.9 1.618 3.425 3.514 3.609l36.182 3.49c.107.01.214.014.322.015v4.711l.015.005v54.325c5.09692 6.4164715 9.92323 13.494208 13.621 19.449-5.651 9.62-12.575 18.217-19.976 26.182-6.864-3.455-13.531-7.369-19.828-11.534-3.151 3.132-6.7 5.694-10.186 8.372-3.425 2.751-7.285 4.768-10.946 7.118 1.09 8.117 1.629 16.108 1.846 24.448-9.446 4.754-19.519 7.906-29.708 10.17-4.068-6.837-7.788-14.241-11.028-21.479-3.842.642-7.702.88-11.567.926v.006c-.027 0-.052-.006-.075-.006-.024 0-.049.006-.073.006v-.006c-3.872-.046-7.729-.284-11.572-.926-3.238 7.238-6.956 14.642-11.03 21.479-10.184-2.264-20.258-5.416-29.703-10.17.216-8.34.755-16.331 1.848-24.448-3.668-2.35-7.523-4.367-10.949-7.118-3.481-2.678-7.036-5.24-10.188-8.372-6.297 4.165-12.962 8.079-19.828 11.534-7.401-7.965-14.321-16.562-19.974-26.182 4.4426579-6.973692 9.2079702-13.9828876 13.621-19.449z"
       fill="#478cbf"
       transform="matrix(4.162611 0 0 -4.162611 104.69892 525.90697)"
       id="path10" /><path
       d="m0 0-1.121-16.063c-.135-1.936-1.675-3.477-3.611-3.616l-38.555-2.751c-.094-.007-.188-.01-.281-.01-1.916 0-3.569 1.406-3.852 3.33l-2.211 14.994h-31.459l-2.211-14.994c-.297-2.018-2.101-3.469-4.133-3.32l-38.555 2.751c-1.936.139-3.476 1.68-3.611 3.616l-1.121 16.063-32.547 3.138c.015-3.498.06-7.33.06-8.093 0-34.374 43.605-50.896 97.781-51.086h.066.067c54.176.19 97.766 16.712 97.766 51.086 0 .777.047 4.593.063 8.093z"
       fill="#478cbf"
       transform="matrix(4.162611 0 0 -4.162611 784.07144 817.24284)"
       id="path12" /><path
       d="m0 0c0-12.052-9.765-21.815-21.813-21.815-12.042 0-21.81 9.763-21.81 21.815 0 12.044 9.768 21.802 21.81 21.802 12.048 0 21.813-9.758 21.813-21.802"
       fill="#fff"
       transform="matrix(4.162611 0 0 -4.162611 389.21484 625.67104)"
       id="path14" /><path
       d="m0 0c0-7.994-6.479-14.473-14.479-14.473-7.996 0-14.479 6.479-14.479 14.473s6.483 14.479 14.479 14.479c8 0 14.479-6.485 14.479-14.479"
       fill="#414042"
       transform="matrix(4.162611 0 0 -4.162611 367.36686 631.05679)"
       id="path16" /><path
       d="m0 0c-3.878 0-7.021 2.858-7.021 6.381v20.081c0 3.52 3.143 6.381 7.021 6.381s7.028-2.861 7.028-6.381v-20.081c0-3.523-3.15-6.381-7.028-6.381"
       fill="#fff"
       transform="matrix(4.162611 0 0 -4.162611 511.99336 724.73954)"
       id="path18" /><path
       d="m0 0c0-12.052 9.765-21.815 21.815-21.815 12.041 0 21.808 9.763 21.808 21.815 0 12.044-9.767 21.802-21.808 21.802-12.05 0-21.815-9.758-21.815-21.802"
       fill="#fff"
       transform="matrix(4.162611 0 0 -4.162611 634.78706 625.67104)"
       id="path20" /><path
       d="m0 0c0-7.994 6.477-14.473 14.471-14.473 8.002 0 14.479 6.479 14.479 14.473s-6.477 14.479-14.479 14.479c-7.994 0-14.471-6.485-14.471-14.479"
       fill="#414042"
       transform="matrix(4.162611 0 0 -4.162611 656.64056 631.05679)"
       id="path22" /></g><g
     id="g521"
     transform="matrix(1.1166302,0,0,1.0498745,-21.728342,-9.0267084)"><path
       style="fill:#06763f;stroke:none;stroke-width:0.0881892"
       d="m 93.148333,79.489725 c -2.803108,0.331277 -5.302582,2.127858 -5.614698,4.531408 -0.335156,2.581012 -0.01684,5.33283 -0.01684,7.929918 v 16.020039 5.76721 c 0,1.39478 -0.09704,2.74383 0.764704,4.00501 1.71517,2.51002 4.655953,2.72341 7.779722,2.72341 h 15.341129 c 2.5741,0 5.42561,0.28123 7.96186,-0.0869 2.49069,-0.3615 4.55019,-1.95661 5.10481,-3.99828 0.46956,-1.7288 0.13836,-3.75855 0.13836,-5.52692 v -10.73338 -5.927419 c 0,-0.757828 0.26332,-1.908147 -0.0549,-2.620478 -0.34576,-0.774168 -1.60043,-1.424823 -2.25903,-2.025334 -2.07436,-1.891245 -4.28416,-3.683406 -6.42105,-5.526912 -1.26612,-1.092366 -2.49545,-2.213993 -3.79051,-3.284107 -0.45296,-0.3743 -0.93806,-1.045769 -1.55355,-1.233271 -0.47461,-0.14458 -1.15049,-0.04833 -1.65061,-0.04833 h -3.59257 -7.961837 c -1.361861,0 -2.826451,-0.125083 -4.175112,0.0343"
       id="path202"
       sodipodi:nodetypes="csscscssscscssccssscsc" /><g
       aria-label="XLSX"
       id="text971"
       style="font-size:15.5081px;fill:#ffffff;stroke-width:1.29235"><path
         d="m 99.492645,107.92039 q 0.136302,0.26503 0.174164,0.42405 0.04543,0.15902 -0.04543,0.24232 -0.09087,0.0833 -0.333182,0.10601 -0.234742,0.0227 -0.658791,0.0227 -0.355899,0 -0.560352,-0.0152 -0.204452,-0.0151 -0.325609,-0.0454 -0.113585,-0.0379 -0.166591,-0.0984 -0.05301,-0.0606 -0.09087,-0.15145 l -1.840072,-3.53627 -1.8325,3.53627 q -0.04543,0.0909 -0.09844,0.15145 -0.05301,0.0606 -0.174164,0.0984 -0.113584,0.0303 -0.325609,0.0454 -0.204453,0.0152 -0.545207,0.0152 -0.39376,0 -0.613357,-0.0227 -0.212025,-0.0227 -0.287748,-0.10601 -0.07572,-0.0833 -0.03029,-0.24232 0.04543,-0.15902 0.189308,-0.42405 l 2.347417,-4.27836 -2.180827,-4.020894 q -0.136301,-0.272603 -0.189307,-0.431622 -0.04543,-0.166591 0.03786,-0.242314 0.09087,-0.08329 0.32561,-0.09844 0.234741,-0.02272 0.666363,-0.02272 0.355899,0 0.560352,0.01515 0.212024,0.01514 0.333181,0.05301 0.121157,0.03029 0.166591,0.09087 0.05301,0.06058 0.09844,0.151446 l 1.718916,3.240954 1.673481,-3.240954 q 0.04543,-0.09087 0.09087,-0.151446 0.05301,-0.06058 0.159019,-0.09087 0.113584,-0.03786 0.302892,-0.05301 0.19688,-0.01515 0.537634,-0.01515 0.378616,0 0.598213,0.02272 0.219597,0.01515 0.302893,0.09844 0.08329,0.0833 0.03786,0.242314 -0.03786,0.159019 -0.16659,0.431622 l -2.180827,3.998184 z"
         style="-inkscape-font-specification:'Calibri Bold'"
         id="path1070" /><path
         d="m 106.43646,107.8371 q 0,0.22717 -0.0227,0.38619 -0.0151,0.15144 -0.053,0.25745 -0.0379,0.0984 -0.0984,0.14388 -0.053,0.0454 -0.12872,0.0454 h -4.49039 q -0.24988,0 -0.42405,-0.14387 -0.16659,-0.15145 -0.16659,-0.48463 v -8.89747 q 0,-0.07572 0.0454,-0.136301 0.053,-0.06058 0.16659,-0.09844 0.11358,-0.03786 0.30289,-0.06058 0.19688,-0.02272 0.48463,-0.02272 0.29532,0 0.48463,0.02272 0.1893,0.02272 0.30289,0.06058 0.11358,0.03786 0.15902,0.09844 0.053,0.06058 0.053,0.136301 v 7.88278 h 3.08194 q 0.0757,0 0.12872,0.0454 0.0606,0.0379 0.0984,0.1363 0.0379,0.0909 0.053,0.24989 0.0227,0.15145 0.0227,0.37862 z"
         style="-inkscape-font-specification:'Calibri Bold'"
         id="path1072" /><path
         d="m 113.41813,105.73199 q 0,0.77238 -0.28775,1.35545 -0.28774,0.58307 -0.77994,0.97683 -0.4922,0.38618 -1.151,0.58306 -0.65879,0.19688 -1.40845,0.19688 -0.50734,0 -0.94654,-0.0833 -0.43162,-0.0833 -0.7648,-0.19688 -0.33318,-0.12116 -0.56035,-0.24989 -0.2196,-0.12873 -0.31804,-0.22717 -0.0984,-0.0984 -0.14387,-0.28017 -0.0379,-0.18931 -0.0379,-0.53764 0,-0.23474 0.0151,-0.39376 0.0151,-0.15902 0.0454,-0.25746 0.0379,-0.0984 0.0909,-0.1363 0.0606,-0.0454 0.1363,-0.0454 0.10602,0 0.29532,0.12873 0.19689,0.12116 0.49978,0.2726 0.30289,0.15145 0.71937,0.28018 0.42405,0.12115 0.97683,0.12115 0.36347,0 0.65122,-0.0833 0.28774,-0.0909 0.48462,-0.24989 0.20446,-0.15902 0.31047,-0.39376 0.10601,-0.23474 0.10601,-0.52249 0,-0.33318 -0.18174,-0.56792 -0.18173,-0.24232 -0.47705,-0.42405 -0.28775,-0.18931 -0.65879,-0.34833 -0.37105,-0.16659 -0.76481,-0.34832 -0.39376,-0.18174 -0.7648,-0.40891 -0.37104,-0.23474 -0.66636,-0.55278 -0.28775,-0.32561 -0.46949,-0.7648 -0.18173,-0.4392 -0.18173,-1.05255 0,-0.70423 0.25746,-1.23429 0.26503,-0.537635 0.70422,-0.885961 0.44677,-0.355899 1.04498,-0.530062 0.60579,-0.174163 1.27972,-0.174163 0.34833,0 0.69665,0.05301 0.34833,0.05301 0.65122,0.143874 0.3029,0.09087 0.53764,0.204452 0.23474,0.113585 0.31046,0.189308 0.0757,0.07572 0.0984,0.12873 0.0303,0.05301 0.0454,0.143874 0.0227,0.08329 0.0303,0.219597 0.008,0.128729 0.008,0.325601 0,0.2196 -0.0152,0.37105 -0.008,0.15144 -0.0379,0.24988 -0.0227,0.0984 -0.0757,0.14388 -0.0454,0.0454 -0.12873,0.0454 -0.0833,0 -0.26503,-0.10601 -0.18174,-0.10601 -0.44677,-0.22717 -0.26503,-0.12873 -0.61335,-0.22717 -0.34833,-0.10601 -0.76481,-0.10601 -0.32561,0 -0.56792,0.0833 -0.24232,0.0757 -0.40891,0.2196 -0.15902,0.1363 -0.24231,0.33318 -0.0757,0.19688 -0.0757,0.41648 0,0.32561 0.17416,0.56792 0.18173,0.23475 0.47705,0.42405 0.3029,0.18174 0.68151,0.34833 0.37862,0.15902 0.77238,0.34075 0.39376,0.18174 0.77237,0.41648 0.37862,0.22717 0.67394,0.55278 0.29532,0.31804 0.47706,0.75723 0.18173,0.43162 0.18173,1.02226 z"
         style="-inkscape-font-specification:'Calibri Bold'"
         id="path1074" /><path
         d="m 121.77797,107.92039 q 0.1363,0.26503 0.17416,0.42405 0.0454,0.15902 -0.0454,0.24232 -0.0909,0.0833 -0.33319,0.10601 -0.23474,0.0227 -0.65879,0.0227 -0.3559,0 -0.56035,-0.0152 -0.20445,-0.0151 -0.32561,-0.0454 -0.11358,-0.0379 -0.16659,-0.0984 -0.053,-0.0606 -0.0909,-0.15145 l -1.84007,-3.53627 -1.8325,3.53627 q -0.0454,0.0909 -0.0984,0.15145 -0.053,0.0606 -0.17416,0.0984 -0.11359,0.0303 -0.32561,0.0454 -0.20446,0.0152 -0.54521,0.0152 -0.39376,0 -0.61336,-0.0227 -0.21202,-0.0227 -0.28774,-0.10601 -0.0757,-0.0833 -0.0303,-0.24232 0.0454,-0.15902 0.1893,-0.42405 l 2.34742,-4.27836 -2.18083,-4.020894 q -0.1363,-0.272603 -0.1893,-0.431622 -0.0454,-0.166591 0.0379,-0.242314 0.0909,-0.08329 0.32561,-0.09844 0.23474,-0.02272 0.66636,-0.02272 0.3559,0 0.56035,0.01515 0.21203,0.01514 0.33318,0.05301 0.12116,0.03029 0.1666,0.09087 0.053,0.06058 0.0984,0.151446 l 1.71891,3.240954 1.67348,-3.240954 q 0.0454,-0.09087 0.0909,-0.151446 0.053,-0.06058 0.15902,-0.09087 0.11358,-0.03786 0.30289,-0.05301 0.19688,-0.01515 0.53764,-0.01515 0.37861,0 0.59821,0.02272 0.2196,0.01515 0.30289,0.09844 0.0833,0.0833 0.0379,0.242314 -0.0379,0.159019 -0.16659,0.431622 l -2.18082,3.998184 z"
         style="-inkscape-font-specification:'Calibri Bold'"
         id="path1076" /></g></g></svg>
       q�޶��5I   res://addons/script_comment_menu/sub_item/override/scene/check_label.tscn�*���JoG   res://addons/script_comment_menu/sub_item/override/scene/item_list.tscn)�!��3P   res://addons/script_comment_menu/sub_item/override/scene/script_method_list.tscn��;|ZٔO>   res://addons/script_comment_menu/sub_item/override/dialog.tscnk�cy�   res://icon.svg�j���%�f   res://node_2d.tscn��{�ze�Y   res://rad.tscn            ECFG      application/config/name         godot-excel-reader     application/run/main_scene         res://node_2d.tscn     application/config/features$   "         4.2    Forward Plus       application/config/icon         res://icon.svg     editor_plugins/enabledd   "      %   res://addons/excel_reader/plugin.cfg    ,   res://addons/script_comment_menu/plugin.cfg #   rendering/renderer/rendering_method         gl_compatibility            