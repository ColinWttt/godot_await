# Copyright (c) godot-rust; Bromeon and contributors.
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

extends TestSuite

# Note: GDScript only uses ptrcalls if it has the full type information available at "compile" (parse) time.
# That includes all arguments (including receiver) as well as function signature (parameters + return type).
# Otherwise, GDScript will use varcall. Both are tested below.
# It is thus important that `ffi` is initialized using = for varcalls, and using := for ptrcalls.


func test_varcall_i64():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_i64()
	_check_callconv("return_i64", "varcall")

	assert_that(ffi.accept_i64(from_rust), "ffi.accept_i64(from_rust)")
	_check_callconv("accept_i64", "varcall")

	var from_gdscript: Variant = -922337203685477580
	var mirrored: Variant = ffi.mirror_i64(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_i64", "varcall")

func test_varcall_i32():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_i32()
	_check_callconv("return_i32", "varcall")

	assert_that(ffi.accept_i32(from_rust), "ffi.accept_i32(from_rust)")
	_check_callconv("accept_i32", "varcall")

	var from_gdscript: Variant = -2147483648
	var mirrored: Variant = ffi.mirror_i32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_i32", "varcall")

func test_varcall_u32():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_u32()
	_check_callconv("return_u32", "varcall")

	assert_that(ffi.accept_u32(from_rust), "ffi.accept_u32(from_rust)")
	_check_callconv("accept_u32", "varcall")

	var from_gdscript: Variant = 4294967295
	var mirrored: Variant = ffi.mirror_u32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_u32", "varcall")

func test_varcall_i16():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_i16()
	_check_callconv("return_i16", "varcall")

	assert_that(ffi.accept_i16(from_rust), "ffi.accept_i16(from_rust)")
	_check_callconv("accept_i16", "varcall")

	var from_gdscript: Variant = -32767
	var mirrored: Variant = ffi.mirror_i16(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_i16", "varcall")

func test_varcall_u16():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_u16()
	_check_callconv("return_u16", "varcall")

	assert_that(ffi.accept_u16(from_rust), "ffi.accept_u16(from_rust)")
	_check_callconv("accept_u16", "varcall")

	var from_gdscript: Variant = 65535
	var mirrored: Variant = ffi.mirror_u16(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_u16", "varcall")

func test_varcall_i8():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_i8()
	_check_callconv("return_i8", "varcall")

	assert_that(ffi.accept_i8(from_rust), "ffi.accept_i8(from_rust)")
	_check_callconv("accept_i8", "varcall")

	var from_gdscript: Variant = -128
	var mirrored: Variant = ffi.mirror_i8(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_i8", "varcall")

func test_varcall_u8():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_u8()
	_check_callconv("return_u8", "varcall")

	assert_that(ffi.accept_u8(from_rust), "ffi.accept_u8(from_rust)")
	_check_callconv("accept_u8", "varcall")

	var from_gdscript: Variant = 255
	var mirrored: Variant = ffi.mirror_u8(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_u8", "varcall")

func test_varcall_f32():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_f32()
	_check_callconv("return_f32", "varcall")

	assert_that(ffi.accept_f32(from_rust), "ffi.accept_f32(from_rust)")
	_check_callconv("accept_f32", "varcall")

	var from_gdscript: Variant = 12.5
	var mirrored: Variant = ffi.mirror_f32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_f32", "varcall")

func test_varcall_f64():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_f64()
	_check_callconv("return_f64", "varcall")

	assert_that(ffi.accept_f64(from_rust), "ffi.accept_f64(from_rust)")
	_check_callconv("accept_f64", "varcall")

	var from_gdscript: Variant = 127.83156478
	var mirrored: Variant = ffi.mirror_f64(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_f64", "varcall")

func test_varcall_bool():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_bool()
	_check_callconv("return_bool", "varcall")

	assert_that(ffi.accept_bool(from_rust), "ffi.accept_bool(from_rust)")
	_check_callconv("accept_bool", "varcall")

	var from_gdscript: Variant = true
	var mirrored: Variant = ffi.mirror_bool(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_bool", "varcall")

func test_varcall_color():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_color()
	_check_callconv("return_color", "varcall")

	assert_that(ffi.accept_color(from_rust), "ffi.accept_color(from_rust)")
	_check_callconv("accept_color", "varcall")

	var from_gdscript: Variant = Color(0.7, 0.5, 0.3, 0.2)
	var mirrored: Variant = ffi.mirror_color(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_color", "varcall")

func test_varcall_gstring():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_gstring()
	_check_callconv("return_gstring", "varcall")

	assert_that(ffi.accept_gstring(from_rust), "ffi.accept_gstring(from_rust)")
	_check_callconv("accept_gstring", "varcall")

	var from_gdscript: Variant = "hello"
	var mirrored: Variant = ffi.mirror_gstring(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_gstring", "varcall")

func test_varcall_stringname():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_stringname()
	_check_callconv("return_stringname", "varcall")

	assert_that(ffi.accept_stringname(from_rust), "ffi.accept_stringname(from_rust)")
	_check_callconv("accept_stringname", "varcall")

	var from_gdscript: Variant = &"hello"
	var mirrored: Variant = ffi.mirror_stringname(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_stringname", "varcall")

func test_varcall_nodepath():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_nodepath()
	_check_callconv("return_nodepath", "varcall")

	assert_that(ffi.accept_nodepath(from_rust), "ffi.accept_nodepath(from_rust)")
	_check_callconv("accept_nodepath", "varcall")

	var from_gdscript: Variant = ^"hello"
	var mirrored: Variant = ffi.mirror_nodepath(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_nodepath", "varcall")

func test_varcall_vector2():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_vector2()
	_check_callconv("return_vector2", "varcall")

	assert_that(ffi.accept_vector2(from_rust), "ffi.accept_vector2(from_rust)")
	_check_callconv("accept_vector2", "varcall")

	var from_gdscript: Variant = Vector2(12.5, -3.5)
	var mirrored: Variant = ffi.mirror_vector2(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_vector2", "varcall")

func test_varcall_vector3():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_vector3()
	_check_callconv("return_vector3", "varcall")

	assert_that(ffi.accept_vector3(from_rust), "ffi.accept_vector3(from_rust)")
	_check_callconv("accept_vector3", "varcall")

	var from_gdscript: Variant = Vector3(117.5, 100.0, -323.25)
	var mirrored: Variant = ffi.mirror_vector3(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_vector3", "varcall")

func test_varcall_vector4():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_vector4()
	_check_callconv("return_vector4", "varcall")

	assert_that(ffi.accept_vector4(from_rust), "ffi.accept_vector4(from_rust)")
	_check_callconv("accept_vector4", "varcall")

	var from_gdscript: Variant = Vector4(-18.5, 24.75, -1.25, 777.875)
	var mirrored: Variant = ffi.mirror_vector4(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_vector4", "varcall")

func test_varcall_vector2i():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_vector2i()
	_check_callconv("return_vector2i", "varcall")

	assert_that(ffi.accept_vector2i(from_rust), "ffi.accept_vector2i(from_rust)")
	_check_callconv("accept_vector2i", "varcall")

	var from_gdscript: Variant = Vector2i(-2147483648, 2147483647)
	var mirrored: Variant = ffi.mirror_vector2i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_vector2i", "varcall")

func test_varcall_vector3i():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_vector3i()
	_check_callconv("return_vector3i", "varcall")

	assert_that(ffi.accept_vector3i(from_rust), "ffi.accept_vector3i(from_rust)")
	_check_callconv("accept_vector3i", "varcall")

	var from_gdscript: Variant = Vector3i(-1, -2147483648, 2147483647)
	var mirrored: Variant = ffi.mirror_vector3i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_vector3i", "varcall")

func test_varcall_vector4i():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_vector4i()
	_check_callconv("return_vector4i", "varcall")

	assert_that(ffi.accept_vector4i(from_rust), "ffi.accept_vector4i(from_rust)")
	_check_callconv("accept_vector4i", "varcall")

	var from_gdscript: Variant = Vector4i(-1, -2147483648, 2147483647, 1000)
	var mirrored: Variant = ffi.mirror_vector4i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_vector4i", "varcall")

func test_varcall_callable():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_callable()
	_check_callconv("return_callable", "varcall")

	assert_that(ffi.accept_callable(from_rust), "ffi.accept_callable(from_rust)")
	_check_callconv("accept_callable", "varcall")

	var from_gdscript: Variant = Callable()
	var mirrored: Variant = ffi.mirror_callable(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_callable", "varcall")

func test_varcall_signal():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_signal()
	_check_callconv("return_signal", "varcall")

	assert_that(ffi.accept_signal(from_rust), "ffi.accept_signal(from_rust)")
	_check_callconv("accept_signal", "varcall")

	var from_gdscript: Variant = Signal()
	var mirrored: Variant = ffi.mirror_signal(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_signal", "varcall")

func test_varcall_rect2():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_rect2()
	_check_callconv("return_rect2", "varcall")

	assert_that(ffi.accept_rect2(from_rust), "ffi.accept_rect2(from_rust)")
	_check_callconv("accept_rect2", "varcall")

	var from_gdscript: Variant = Rect2()
	var mirrored: Variant = ffi.mirror_rect2(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_rect2", "varcall")

func test_varcall_rect2i():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_rect2i()
	_check_callconv("return_rect2i", "varcall")

	assert_that(ffi.accept_rect2i(from_rust), "ffi.accept_rect2i(from_rust)")
	_check_callconv("accept_rect2i", "varcall")

	var from_gdscript: Variant = Rect2i()
	var mirrored: Variant = ffi.mirror_rect2i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_rect2i", "varcall")

func test_varcall_transform2d():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_transform2d()
	_check_callconv("return_transform2d", "varcall")

	assert_that(ffi.accept_transform2d(from_rust), "ffi.accept_transform2d(from_rust)")
	_check_callconv("accept_transform2d", "varcall")

	var from_gdscript: Variant = Transform2D()
	var mirrored: Variant = ffi.mirror_transform2d(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_transform2d", "varcall")

func test_varcall_plane():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_plane()
	_check_callconv("return_plane", "varcall")

	assert_that(ffi.accept_plane(from_rust), "ffi.accept_plane(from_rust)")
	_check_callconv("accept_plane", "varcall")

	var from_gdscript: Variant = Plane()
	var mirrored: Variant = ffi.mirror_plane(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_plane", "varcall")

func test_varcall_quaternion():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_quaternion()
	_check_callconv("return_quaternion", "varcall")

	assert_that(ffi.accept_quaternion(from_rust), "ffi.accept_quaternion(from_rust)")
	_check_callconv("accept_quaternion", "varcall")

	var from_gdscript: Variant = Quaternion()
	var mirrored: Variant = ffi.mirror_quaternion(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_quaternion", "varcall")

func test_varcall_aabb():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_aabb()
	_check_callconv("return_aabb", "varcall")

	assert_that(ffi.accept_aabb(from_rust), "ffi.accept_aabb(from_rust)")
	_check_callconv("accept_aabb", "varcall")

	var from_gdscript: Variant = AABB()
	var mirrored: Variant = ffi.mirror_aabb(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_aabb", "varcall")

func test_varcall_basis():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_basis()
	_check_callconv("return_basis", "varcall")

	assert_that(ffi.accept_basis(from_rust), "ffi.accept_basis(from_rust)")
	_check_callconv("accept_basis", "varcall")

	var from_gdscript: Variant = Basis()
	var mirrored: Variant = ffi.mirror_basis(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_basis", "varcall")

func test_varcall_transform3d():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_transform3d()
	_check_callconv("return_transform3d", "varcall")

	assert_that(ffi.accept_transform3d(from_rust), "ffi.accept_transform3d(from_rust)")
	_check_callconv("accept_transform3d", "varcall")

	var from_gdscript: Variant = Transform3D()
	var mirrored: Variant = ffi.mirror_transform3d(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_transform3d", "varcall")

func test_varcall_projection():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_projection()
	_check_callconv("return_projection", "varcall")

	assert_that(ffi.accept_projection(from_rust), "ffi.accept_projection(from_rust)")
	_check_callconv("accept_projection", "varcall")

	var from_gdscript: Variant = Projection()
	var mirrored: Variant = ffi.mirror_projection(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_projection", "varcall")

func test_varcall_rid():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_rid()
	_check_callconv("return_rid", "varcall")

	assert_that(ffi.accept_rid(from_rust), "ffi.accept_rid(from_rust)")
	_check_callconv("accept_rid", "varcall")

	var from_gdscript: Variant = RID()
	var mirrored: Variant = ffi.mirror_rid(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_rid", "varcall")

func test_varcall_option_gd_node():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_option_gd_node()
	_check_callconv("return_option_gd_node", "varcall")

	assert_that(ffi.accept_option_gd_node(from_rust), "ffi.accept_option_gd_node(from_rust)")
	_check_callconv("accept_option_gd_node", "varcall")

	var from_gdscript: Variant = null
	var mirrored: Variant = ffi.mirror_option_gd_node(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_option_gd_node", "varcall")

func test_varcall_option_gd_resource():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_option_gd_resource()
	_check_callconv("return_option_gd_resource", "varcall")

	assert_that(ffi.accept_option_gd_resource(from_rust), "ffi.accept_option_gd_resource(from_rust)")
	_check_callconv("accept_option_gd_resource", "varcall")

	var from_gdscript: Variant = null
	var mirrored: Variant = ffi.mirror_option_gd_resource(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_option_gd_resource", "varcall")

func test_varcall_packedbytearray():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_packedbytearray()
	_check_callconv("return_packedbytearray", "varcall")

	assert_that(ffi.accept_packedbytearray(from_rust), "ffi.accept_packedbytearray(from_rust)")
	_check_callconv("accept_packedbytearray", "varcall")

	var from_gdscript: Variant = PackedByteArray()
	var mirrored: Variant = ffi.mirror_packedbytearray(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_packedbytearray", "varcall")

func test_varcall_packedint32array():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_packedint32array()
	_check_callconv("return_packedint32array", "varcall")

	assert_that(ffi.accept_packedint32array(from_rust), "ffi.accept_packedint32array(from_rust)")
	_check_callconv("accept_packedint32array", "varcall")

	var from_gdscript: Variant = PackedInt32Array()
	var mirrored: Variant = ffi.mirror_packedint32array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_packedint32array", "varcall")

func test_varcall_packedint64array():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_packedint64array()
	_check_callconv("return_packedint64array", "varcall")

	assert_that(ffi.accept_packedint64array(from_rust), "ffi.accept_packedint64array(from_rust)")
	_check_callconv("accept_packedint64array", "varcall")

	var from_gdscript: Variant = PackedInt64Array()
	var mirrored: Variant = ffi.mirror_packedint64array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_packedint64array", "varcall")

func test_varcall_packedfloat32array():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_packedfloat32array()
	_check_callconv("return_packedfloat32array", "varcall")

	assert_that(ffi.accept_packedfloat32array(from_rust), "ffi.accept_packedfloat32array(from_rust)")
	_check_callconv("accept_packedfloat32array", "varcall")

	var from_gdscript: Variant = PackedFloat32Array()
	var mirrored: Variant = ffi.mirror_packedfloat32array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_packedfloat32array", "varcall")

func test_varcall_packedfloat64array():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_packedfloat64array()
	_check_callconv("return_packedfloat64array", "varcall")

	assert_that(ffi.accept_packedfloat64array(from_rust), "ffi.accept_packedfloat64array(from_rust)")
	_check_callconv("accept_packedfloat64array", "varcall")

	var from_gdscript: Variant = PackedFloat64Array()
	var mirrored: Variant = ffi.mirror_packedfloat64array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_packedfloat64array", "varcall")

func test_varcall_packedstringarray():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_packedstringarray()
	_check_callconv("return_packedstringarray", "varcall")

	assert_that(ffi.accept_packedstringarray(from_rust), "ffi.accept_packedstringarray(from_rust)")
	_check_callconv("accept_packedstringarray", "varcall")

	var from_gdscript: Variant = PackedStringArray()
	var mirrored: Variant = ffi.mirror_packedstringarray(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_packedstringarray", "varcall")

func test_varcall_packedvector2array():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_packedvector2array()
	_check_callconv("return_packedvector2array", "varcall")

	assert_that(ffi.accept_packedvector2array(from_rust), "ffi.accept_packedvector2array(from_rust)")
	_check_callconv("accept_packedvector2array", "varcall")

	var from_gdscript: Variant = PackedVector2Array()
	var mirrored: Variant = ffi.mirror_packedvector2array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_packedvector2array", "varcall")

func test_varcall_packedvector3array():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_packedvector3array()
	_check_callconv("return_packedvector3array", "varcall")

	assert_that(ffi.accept_packedvector3array(from_rust), "ffi.accept_packedvector3array(from_rust)")
	_check_callconv("accept_packedvector3array", "varcall")

	var from_gdscript: Variant = PackedVector3Array()
	var mirrored: Variant = ffi.mirror_packedvector3array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_packedvector3array", "varcall")

func test_varcall_packedvector4array():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_packedvector4array()
	_check_callconv("return_packedvector4array", "varcall")

	assert_that(ffi.accept_packedvector4array(from_rust), "ffi.accept_packedvector4array(from_rust)")
	_check_callconv("accept_packedvector4array", "varcall")

	var from_gdscript: Variant = PackedVector4Array()
	var mirrored: Variant = ffi.mirror_packedvector4array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_packedvector4array", "varcall")

func test_varcall_packedcolorarray():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_packedcolorarray()
	_check_callconv("return_packedcolorarray", "varcall")

	assert_that(ffi.accept_packedcolorarray(from_rust), "ffi.accept_packedcolorarray(from_rust)")
	_check_callconv("accept_packedcolorarray", "varcall")

	var from_gdscript: Variant = PackedColorArray()
	var mirrored: Variant = ffi.mirror_packedcolorarray(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_packedcolorarray", "varcall")

func test_varcall_newi64():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_newi64()
	_check_callconv("return_newi64", "varcall")

	assert_that(ffi.accept_newi64(from_rust), "ffi.accept_newi64(from_rust)")
	_check_callconv("accept_newi64", "varcall")

	var from_gdscript: Variant = -922337203685477580
	var mirrored: Variant = ffi.mirror_newi64(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newi64", "varcall")

func test_varcall_newi32():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_newi32()
	_check_callconv("return_newi32", "varcall")

	assert_that(ffi.accept_newi32(from_rust), "ffi.accept_newi32(from_rust)")
	_check_callconv("accept_newi32", "varcall")

	var from_gdscript: Variant = -2147483648
	var mirrored: Variant = ffi.mirror_newi32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newi32", "varcall")

func test_varcall_newu32():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_newu32()
	_check_callconv("return_newu32", "varcall")

	assert_that(ffi.accept_newu32(from_rust), "ffi.accept_newu32(from_rust)")
	_check_callconv("accept_newu32", "varcall")

	var from_gdscript: Variant = 4294967295
	var mirrored: Variant = ffi.mirror_newu32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newu32", "varcall")

func test_varcall_newi16():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_newi16()
	_check_callconv("return_newi16", "varcall")

	assert_that(ffi.accept_newi16(from_rust), "ffi.accept_newi16(from_rust)")
	_check_callconv("accept_newi16", "varcall")

	var from_gdscript: Variant = -32767
	var mirrored: Variant = ffi.mirror_newi16(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newi16", "varcall")

func test_varcall_newu16():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_newu16()
	_check_callconv("return_newu16", "varcall")

	assert_that(ffi.accept_newu16(from_rust), "ffi.accept_newu16(from_rust)")
	_check_callconv("accept_newu16", "varcall")

	var from_gdscript: Variant = 65535
	var mirrored: Variant = ffi.mirror_newu16(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newu16", "varcall")

func test_varcall_newi8():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_newi8()
	_check_callconv("return_newi8", "varcall")

	assert_that(ffi.accept_newi8(from_rust), "ffi.accept_newi8(from_rust)")
	_check_callconv("accept_newi8", "varcall")

	var from_gdscript: Variant = -128
	var mirrored: Variant = ffi.mirror_newi8(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newi8", "varcall")

func test_varcall_newu8():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_newu8()
	_check_callconv("return_newu8", "varcall")

	assert_that(ffi.accept_newu8(from_rust), "ffi.accept_newu8(from_rust)")
	_check_callconv("accept_newu8", "varcall")

	var from_gdscript: Variant = 255
	var mirrored: Variant = ffi.mirror_newu8(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newu8", "varcall")

func test_varcall_newf32():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_newf32()
	_check_callconv("return_newf32", "varcall")

	assert_that(ffi.accept_newf32(from_rust), "ffi.accept_newf32(from_rust)")
	_check_callconv("accept_newf32", "varcall")

	var from_gdscript: Variant = 12.5
	var mirrored: Variant = ffi.mirror_newf32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newf32", "varcall")

func test_varcall_newf64():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_newf64()
	_check_callconv("return_newf64", "varcall")

	assert_that(ffi.accept_newf64(from_rust), "ffi.accept_newf64(from_rust)")
	_check_callconv("accept_newf64", "varcall")

	var from_gdscript: Variant = 127.83156478
	var mirrored: Variant = ffi.mirror_newf64(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newf64", "varcall")

func test_varcall_newbool():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_newbool()
	_check_callconv("return_newbool", "varcall")

	assert_that(ffi.accept_newbool(from_rust), "ffi.accept_newbool(from_rust)")
	_check_callconv("accept_newbool", "varcall")

	var from_gdscript: Variant = true
	var mirrored: Variant = ffi.mirror_newbool(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newbool", "varcall")

func test_varcall_newcolor():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_newcolor()
	_check_callconv("return_newcolor", "varcall")

	assert_that(ffi.accept_newcolor(from_rust), "ffi.accept_newcolor(from_rust)")
	_check_callconv("accept_newcolor", "varcall")

	var from_gdscript: Variant = Color(0.7, 0.5, 0.3, 0.2)
	var mirrored: Variant = ffi.mirror_newcolor(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newcolor", "varcall")

func test_varcall_newstring():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_newstring()
	_check_callconv("return_newstring", "varcall")

	assert_that(ffi.accept_newstring(from_rust), "ffi.accept_newstring(from_rust)")
	_check_callconv("accept_newstring", "varcall")

	var from_gdscript: Variant = "hello"
	var mirrored: Variant = ffi.mirror_newstring(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newstring", "varcall")

func test_varcall_newstringname():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_newstringname()
	_check_callconv("return_newstringname", "varcall")

	assert_that(ffi.accept_newstringname(from_rust), "ffi.accept_newstringname(from_rust)")
	_check_callconv("accept_newstringname", "varcall")

	var from_gdscript: Variant = &"hello"
	var mirrored: Variant = ffi.mirror_newstringname(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newstringname", "varcall")

func test_varcall_newnodepath():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_newnodepath()
	_check_callconv("return_newnodepath", "varcall")

	assert_that(ffi.accept_newnodepath(from_rust), "ffi.accept_newnodepath(from_rust)")
	_check_callconv("accept_newnodepath", "varcall")

	var from_gdscript: Variant = ^"hello"
	var mirrored: Variant = ffi.mirror_newnodepath(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newnodepath", "varcall")

func test_varcall_newvector2():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_newvector2()
	_check_callconv("return_newvector2", "varcall")

	assert_that(ffi.accept_newvector2(from_rust), "ffi.accept_newvector2(from_rust)")
	_check_callconv("accept_newvector2", "varcall")

	var from_gdscript: Variant = Vector2(12.5, -3.5)
	var mirrored: Variant = ffi.mirror_newvector2(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newvector2", "varcall")

func test_varcall_newvector3():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_newvector3()
	_check_callconv("return_newvector3", "varcall")

	assert_that(ffi.accept_newvector3(from_rust), "ffi.accept_newvector3(from_rust)")
	_check_callconv("accept_newvector3", "varcall")

	var from_gdscript: Variant = Vector3(117.5, 100.0, -323.25)
	var mirrored: Variant = ffi.mirror_newvector3(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newvector3", "varcall")

func test_varcall_newvector4():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_newvector4()
	_check_callconv("return_newvector4", "varcall")

	assert_that(ffi.accept_newvector4(from_rust), "ffi.accept_newvector4(from_rust)")
	_check_callconv("accept_newvector4", "varcall")

	var from_gdscript: Variant = Vector4(-18.5, 24.75, -1.25, 777.875)
	var mirrored: Variant = ffi.mirror_newvector4(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newvector4", "varcall")

func test_varcall_newvector2i():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_newvector2i()
	_check_callconv("return_newvector2i", "varcall")

	assert_that(ffi.accept_newvector2i(from_rust), "ffi.accept_newvector2i(from_rust)")
	_check_callconv("accept_newvector2i", "varcall")

	var from_gdscript: Variant = Vector2i(-2147483648, 2147483647)
	var mirrored: Variant = ffi.mirror_newvector2i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newvector2i", "varcall")

func test_varcall_newvector3i():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_newvector3i()
	_check_callconv("return_newvector3i", "varcall")

	assert_that(ffi.accept_newvector3i(from_rust), "ffi.accept_newvector3i(from_rust)")
	_check_callconv("accept_newvector3i", "varcall")

	var from_gdscript: Variant = Vector3i(-1, -2147483648, 2147483647)
	var mirrored: Variant = ffi.mirror_newvector3i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newvector3i", "varcall")

func test_varcall_newvector4i():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_newvector4i()
	_check_callconv("return_newvector4i", "varcall")

	assert_that(ffi.accept_newvector4i(from_rust), "ffi.accept_newvector4i(from_rust)")
	_check_callconv("accept_newvector4i", "varcall")

	var from_gdscript: Variant = Vector4i(-1, -2147483648, 2147483647, 1)
	var mirrored: Variant = ffi.mirror_newvector4i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newvector4i", "varcall")

func test_varcall_newcallable():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_newcallable()
	_check_callconv("return_newcallable", "varcall")

	assert_that(ffi.accept_newcallable(from_rust), "ffi.accept_newcallable(from_rust)")
	_check_callconv("accept_newcallable", "varcall")

	var from_gdscript: Variant = Callable()
	var mirrored: Variant = ffi.mirror_newcallable(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newcallable", "varcall")

func test_varcall_variantarray():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_variantarray()
	_check_callconv("return_variantarray", "varcall")

	assert_that(ffi.accept_variantarray(from_rust), "ffi.accept_variantarray(from_rust)")
	_check_callconv("accept_variantarray", "varcall")

	var from_gdscript: Variant = [-7, "godot", false, Vector2i(-77, 88)]
	var mirrored: Variant = ffi.mirror_variantarray(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_variantarray", "varcall")

func test_varcall_dictionary():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_dictionary()
	_check_callconv("return_dictionary", "varcall")

	assert_that(ffi.accept_dictionary(from_rust), "ffi.accept_dictionary(from_rust)")
	_check_callconv("accept_dictionary", "varcall")

	var from_gdscript: Variant = {"key": 83, -3: Vector2(1, 2), 0.03: true}
	var mirrored: Variant = ffi.mirror_dictionary(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_dictionary", "varcall")

func test_varcall_instanceid():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_instanceid()
	_check_callconv("return_instanceid", "varcall")

	assert_that(ffi.accept_instanceid(from_rust), "ffi.accept_instanceid(from_rust)")
	_check_callconv("accept_instanceid", "varcall")

	var from_gdscript: Variant = -1
	var mirrored: Variant = ffi.mirror_instanceid(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_instanceid", "varcall")

func test_varcall_variant():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_variant()
	_check_callconv("return_variant", "varcall")

	assert_that(ffi.accept_variant(from_rust), "ffi.accept_variant(from_rust)")
	_check_callconv("accept_variant", "varcall")

	var from_gdscript: Variant = 123
	var mirrored: Variant = ffi.mirror_variant(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_variant", "varcall")

func test_varcall_error():
	var ffi = GenFfi.new()

	var from_rust: Variant = ffi.return_error()
	_check_callconv("return_error", "varcall")

	assert_that(ffi.accept_error(from_rust), "ffi.accept_error(from_rust)")
	_check_callconv("accept_error", "varcall")

	var from_gdscript: Variant = 0
	var mirrored: Variant = ffi.mirror_error(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_error", "varcall")


# Godot currently does not support calling static methods via reflection, which is why we use an instance for the return_static_IDENT() call.
# The call must be dynamic, as otherwise, Godot would have the static type info available and could use ptrcall.
# This is only needed for return_static_IDENT() which takes no parameters -- the other two methods take Variant parameters,
# so Godot cannot use ptrcalls anyway.

func test_varcall_static_i64():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_i64()
	_check_callconv("return_static_i64", "varcall")

	assert_that(GenFfi.accept_static_i64(from_rust), "ffi.accept_static_i64(from_rust)")
	_check_callconv("accept_static_i64", "varcall")

	var from_gdscript: Variant = -922337203685477580
	var mirrored: Variant = GenFfi.mirror_static_i64(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_i64", "varcall")

func test_varcall_static_i32():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_i32()
	_check_callconv("return_static_i32", "varcall")

	assert_that(GenFfi.accept_static_i32(from_rust), "ffi.accept_static_i32(from_rust)")
	_check_callconv("accept_static_i32", "varcall")

	var from_gdscript: Variant = -2147483648
	var mirrored: Variant = GenFfi.mirror_static_i32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_i32", "varcall")

func test_varcall_static_u32():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_u32()
	_check_callconv("return_static_u32", "varcall")

	assert_that(GenFfi.accept_static_u32(from_rust), "ffi.accept_static_u32(from_rust)")
	_check_callconv("accept_static_u32", "varcall")

	var from_gdscript: Variant = 4294967295
	var mirrored: Variant = GenFfi.mirror_static_u32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_u32", "varcall")

func test_varcall_static_i16():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_i16()
	_check_callconv("return_static_i16", "varcall")

	assert_that(GenFfi.accept_static_i16(from_rust), "ffi.accept_static_i16(from_rust)")
	_check_callconv("accept_static_i16", "varcall")

	var from_gdscript: Variant = -32767
	var mirrored: Variant = GenFfi.mirror_static_i16(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_i16", "varcall")

func test_varcall_static_u16():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_u16()
	_check_callconv("return_static_u16", "varcall")

	assert_that(GenFfi.accept_static_u16(from_rust), "ffi.accept_static_u16(from_rust)")
	_check_callconv("accept_static_u16", "varcall")

	var from_gdscript: Variant = 65535
	var mirrored: Variant = GenFfi.mirror_static_u16(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_u16", "varcall")

func test_varcall_static_i8():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_i8()
	_check_callconv("return_static_i8", "varcall")

	assert_that(GenFfi.accept_static_i8(from_rust), "ffi.accept_static_i8(from_rust)")
	_check_callconv("accept_static_i8", "varcall")

	var from_gdscript: Variant = -128
	var mirrored: Variant = GenFfi.mirror_static_i8(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_i8", "varcall")

func test_varcall_static_u8():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_u8()
	_check_callconv("return_static_u8", "varcall")

	assert_that(GenFfi.accept_static_u8(from_rust), "ffi.accept_static_u8(from_rust)")
	_check_callconv("accept_static_u8", "varcall")

	var from_gdscript: Variant = 255
	var mirrored: Variant = GenFfi.mirror_static_u8(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_u8", "varcall")

func test_varcall_static_f32():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_f32()
	_check_callconv("return_static_f32", "varcall")

	assert_that(GenFfi.accept_static_f32(from_rust), "ffi.accept_static_f32(from_rust)")
	_check_callconv("accept_static_f32", "varcall")

	var from_gdscript: Variant = 12.5
	var mirrored: Variant = GenFfi.mirror_static_f32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_f32", "varcall")

func test_varcall_static_f64():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_f64()
	_check_callconv("return_static_f64", "varcall")

	assert_that(GenFfi.accept_static_f64(from_rust), "ffi.accept_static_f64(from_rust)")
	_check_callconv("accept_static_f64", "varcall")

	var from_gdscript: Variant = 127.83156478
	var mirrored: Variant = GenFfi.mirror_static_f64(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_f64", "varcall")

func test_varcall_static_bool():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_bool()
	_check_callconv("return_static_bool", "varcall")

	assert_that(GenFfi.accept_static_bool(from_rust), "ffi.accept_static_bool(from_rust)")
	_check_callconv("accept_static_bool", "varcall")

	var from_gdscript: Variant = true
	var mirrored: Variant = GenFfi.mirror_static_bool(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_bool", "varcall")

func test_varcall_static_color():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_color()
	_check_callconv("return_static_color", "varcall")

	assert_that(GenFfi.accept_static_color(from_rust), "ffi.accept_static_color(from_rust)")
	_check_callconv("accept_static_color", "varcall")

	var from_gdscript: Variant = Color(0.7, 0.5, 0.3, 0.2)
	var mirrored: Variant = GenFfi.mirror_static_color(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_color", "varcall")

func test_varcall_static_gstring():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_gstring()
	_check_callconv("return_static_gstring", "varcall")

	assert_that(GenFfi.accept_static_gstring(from_rust), "ffi.accept_static_gstring(from_rust)")
	_check_callconv("accept_static_gstring", "varcall")

	var from_gdscript: Variant = "hello"
	var mirrored: Variant = GenFfi.mirror_static_gstring(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_gstring", "varcall")

func test_varcall_static_stringname():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_stringname()
	_check_callconv("return_static_stringname", "varcall")

	assert_that(GenFfi.accept_static_stringname(from_rust), "ffi.accept_static_stringname(from_rust)")
	_check_callconv("accept_static_stringname", "varcall")

	var from_gdscript: Variant = &"hello"
	var mirrored: Variant = GenFfi.mirror_static_stringname(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_stringname", "varcall")

func test_varcall_static_nodepath():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_nodepath()
	_check_callconv("return_static_nodepath", "varcall")

	assert_that(GenFfi.accept_static_nodepath(from_rust), "ffi.accept_static_nodepath(from_rust)")
	_check_callconv("accept_static_nodepath", "varcall")

	var from_gdscript: Variant = ^"hello"
	var mirrored: Variant = GenFfi.mirror_static_nodepath(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_nodepath", "varcall")

func test_varcall_static_vector2():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_vector2()
	_check_callconv("return_static_vector2", "varcall")

	assert_that(GenFfi.accept_static_vector2(from_rust), "ffi.accept_static_vector2(from_rust)")
	_check_callconv("accept_static_vector2", "varcall")

	var from_gdscript: Variant = Vector2(12.5, -3.5)
	var mirrored: Variant = GenFfi.mirror_static_vector2(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_vector2", "varcall")

func test_varcall_static_vector3():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_vector3()
	_check_callconv("return_static_vector3", "varcall")

	assert_that(GenFfi.accept_static_vector3(from_rust), "ffi.accept_static_vector3(from_rust)")
	_check_callconv("accept_static_vector3", "varcall")

	var from_gdscript: Variant = Vector3(117.5, 100.0, -323.25)
	var mirrored: Variant = GenFfi.mirror_static_vector3(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_vector3", "varcall")

func test_varcall_static_vector4():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_vector4()
	_check_callconv("return_static_vector4", "varcall")

	assert_that(GenFfi.accept_static_vector4(from_rust), "ffi.accept_static_vector4(from_rust)")
	_check_callconv("accept_static_vector4", "varcall")

	var from_gdscript: Variant = Vector4(-18.5, 24.75, -1.25, 777.875)
	var mirrored: Variant = GenFfi.mirror_static_vector4(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_vector4", "varcall")

func test_varcall_static_vector2i():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_vector2i()
	_check_callconv("return_static_vector2i", "varcall")

	assert_that(GenFfi.accept_static_vector2i(from_rust), "ffi.accept_static_vector2i(from_rust)")
	_check_callconv("accept_static_vector2i", "varcall")

	var from_gdscript: Variant = Vector2i(-2147483648, 2147483647)
	var mirrored: Variant = GenFfi.mirror_static_vector2i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_vector2i", "varcall")

func test_varcall_static_vector3i():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_vector3i()
	_check_callconv("return_static_vector3i", "varcall")

	assert_that(GenFfi.accept_static_vector3i(from_rust), "ffi.accept_static_vector3i(from_rust)")
	_check_callconv("accept_static_vector3i", "varcall")

	var from_gdscript: Variant = Vector3i(-1, -2147483648, 2147483647)
	var mirrored: Variant = GenFfi.mirror_static_vector3i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_vector3i", "varcall")

func test_varcall_static_vector4i():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_vector4i()
	_check_callconv("return_static_vector4i", "varcall")

	assert_that(GenFfi.accept_static_vector4i(from_rust), "ffi.accept_static_vector4i(from_rust)")
	_check_callconv("accept_static_vector4i", "varcall")

	var from_gdscript: Variant = Vector4i(-1, -2147483648, 2147483647, 1000)
	var mirrored: Variant = GenFfi.mirror_static_vector4i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_vector4i", "varcall")

func test_varcall_static_callable():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_callable()
	_check_callconv("return_static_callable", "varcall")

	assert_that(GenFfi.accept_static_callable(from_rust), "ffi.accept_static_callable(from_rust)")
	_check_callconv("accept_static_callable", "varcall")

	var from_gdscript: Variant = Callable()
	var mirrored: Variant = GenFfi.mirror_static_callable(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_callable", "varcall")

func test_varcall_static_signal():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_signal()
	_check_callconv("return_static_signal", "varcall")

	assert_that(GenFfi.accept_static_signal(from_rust), "ffi.accept_static_signal(from_rust)")
	_check_callconv("accept_static_signal", "varcall")

	var from_gdscript: Variant = Signal()
	var mirrored: Variant = GenFfi.mirror_static_signal(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_signal", "varcall")

func test_varcall_static_rect2():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_rect2()
	_check_callconv("return_static_rect2", "varcall")

	assert_that(GenFfi.accept_static_rect2(from_rust), "ffi.accept_static_rect2(from_rust)")
	_check_callconv("accept_static_rect2", "varcall")

	var from_gdscript: Variant = Rect2()
	var mirrored: Variant = GenFfi.mirror_static_rect2(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_rect2", "varcall")

func test_varcall_static_rect2i():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_rect2i()
	_check_callconv("return_static_rect2i", "varcall")

	assert_that(GenFfi.accept_static_rect2i(from_rust), "ffi.accept_static_rect2i(from_rust)")
	_check_callconv("accept_static_rect2i", "varcall")

	var from_gdscript: Variant = Rect2i()
	var mirrored: Variant = GenFfi.mirror_static_rect2i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_rect2i", "varcall")

func test_varcall_static_transform2d():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_transform2d()
	_check_callconv("return_static_transform2d", "varcall")

	assert_that(GenFfi.accept_static_transform2d(from_rust), "ffi.accept_static_transform2d(from_rust)")
	_check_callconv("accept_static_transform2d", "varcall")

	var from_gdscript: Variant = Transform2D()
	var mirrored: Variant = GenFfi.mirror_static_transform2d(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_transform2d", "varcall")

func test_varcall_static_plane():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_plane()
	_check_callconv("return_static_plane", "varcall")

	assert_that(GenFfi.accept_static_plane(from_rust), "ffi.accept_static_plane(from_rust)")
	_check_callconv("accept_static_plane", "varcall")

	var from_gdscript: Variant = Plane()
	var mirrored: Variant = GenFfi.mirror_static_plane(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_plane", "varcall")

func test_varcall_static_quaternion():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_quaternion()
	_check_callconv("return_static_quaternion", "varcall")

	assert_that(GenFfi.accept_static_quaternion(from_rust), "ffi.accept_static_quaternion(from_rust)")
	_check_callconv("accept_static_quaternion", "varcall")

	var from_gdscript: Variant = Quaternion()
	var mirrored: Variant = GenFfi.mirror_static_quaternion(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_quaternion", "varcall")

func test_varcall_static_aabb():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_aabb()
	_check_callconv("return_static_aabb", "varcall")

	assert_that(GenFfi.accept_static_aabb(from_rust), "ffi.accept_static_aabb(from_rust)")
	_check_callconv("accept_static_aabb", "varcall")

	var from_gdscript: Variant = AABB()
	var mirrored: Variant = GenFfi.mirror_static_aabb(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_aabb", "varcall")

func test_varcall_static_basis():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_basis()
	_check_callconv("return_static_basis", "varcall")

	assert_that(GenFfi.accept_static_basis(from_rust), "ffi.accept_static_basis(from_rust)")
	_check_callconv("accept_static_basis", "varcall")

	var from_gdscript: Variant = Basis()
	var mirrored: Variant = GenFfi.mirror_static_basis(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_basis", "varcall")

func test_varcall_static_transform3d():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_transform3d()
	_check_callconv("return_static_transform3d", "varcall")

	assert_that(GenFfi.accept_static_transform3d(from_rust), "ffi.accept_static_transform3d(from_rust)")
	_check_callconv("accept_static_transform3d", "varcall")

	var from_gdscript: Variant = Transform3D()
	var mirrored: Variant = GenFfi.mirror_static_transform3d(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_transform3d", "varcall")

func test_varcall_static_projection():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_projection()
	_check_callconv("return_static_projection", "varcall")

	assert_that(GenFfi.accept_static_projection(from_rust), "ffi.accept_static_projection(from_rust)")
	_check_callconv("accept_static_projection", "varcall")

	var from_gdscript: Variant = Projection()
	var mirrored: Variant = GenFfi.mirror_static_projection(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_projection", "varcall")

func test_varcall_static_rid():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_rid()
	_check_callconv("return_static_rid", "varcall")

	assert_that(GenFfi.accept_static_rid(from_rust), "ffi.accept_static_rid(from_rust)")
	_check_callconv("accept_static_rid", "varcall")

	var from_gdscript: Variant = RID()
	var mirrored: Variant = GenFfi.mirror_static_rid(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_rid", "varcall")

func test_varcall_static_option_gd_node():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_option_gd_node()
	_check_callconv("return_static_option_gd_node", "varcall")

	assert_that(GenFfi.accept_static_option_gd_node(from_rust), "ffi.accept_static_option_gd_node(from_rust)")
	_check_callconv("accept_static_option_gd_node", "varcall")

	var from_gdscript: Variant = null
	var mirrored: Variant = GenFfi.mirror_static_option_gd_node(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_option_gd_node", "varcall")

func test_varcall_static_option_gd_resource():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_option_gd_resource()
	_check_callconv("return_static_option_gd_resource", "varcall")

	assert_that(GenFfi.accept_static_option_gd_resource(from_rust), "ffi.accept_static_option_gd_resource(from_rust)")
	_check_callconv("accept_static_option_gd_resource", "varcall")

	var from_gdscript: Variant = null
	var mirrored: Variant = GenFfi.mirror_static_option_gd_resource(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_option_gd_resource", "varcall")

func test_varcall_static_packedbytearray():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_packedbytearray()
	_check_callconv("return_static_packedbytearray", "varcall")

	assert_that(GenFfi.accept_static_packedbytearray(from_rust), "ffi.accept_static_packedbytearray(from_rust)")
	_check_callconv("accept_static_packedbytearray", "varcall")

	var from_gdscript: Variant = PackedByteArray()
	var mirrored: Variant = GenFfi.mirror_static_packedbytearray(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_packedbytearray", "varcall")

func test_varcall_static_packedint32array():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_packedint32array()
	_check_callconv("return_static_packedint32array", "varcall")

	assert_that(GenFfi.accept_static_packedint32array(from_rust), "ffi.accept_static_packedint32array(from_rust)")
	_check_callconv("accept_static_packedint32array", "varcall")

	var from_gdscript: Variant = PackedInt32Array()
	var mirrored: Variant = GenFfi.mirror_static_packedint32array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_packedint32array", "varcall")

func test_varcall_static_packedint64array():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_packedint64array()
	_check_callconv("return_static_packedint64array", "varcall")

	assert_that(GenFfi.accept_static_packedint64array(from_rust), "ffi.accept_static_packedint64array(from_rust)")
	_check_callconv("accept_static_packedint64array", "varcall")

	var from_gdscript: Variant = PackedInt64Array()
	var mirrored: Variant = GenFfi.mirror_static_packedint64array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_packedint64array", "varcall")

func test_varcall_static_packedfloat32array():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_packedfloat32array()
	_check_callconv("return_static_packedfloat32array", "varcall")

	assert_that(GenFfi.accept_static_packedfloat32array(from_rust), "ffi.accept_static_packedfloat32array(from_rust)")
	_check_callconv("accept_static_packedfloat32array", "varcall")

	var from_gdscript: Variant = PackedFloat32Array()
	var mirrored: Variant = GenFfi.mirror_static_packedfloat32array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_packedfloat32array", "varcall")

func test_varcall_static_packedfloat64array():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_packedfloat64array()
	_check_callconv("return_static_packedfloat64array", "varcall")

	assert_that(GenFfi.accept_static_packedfloat64array(from_rust), "ffi.accept_static_packedfloat64array(from_rust)")
	_check_callconv("accept_static_packedfloat64array", "varcall")

	var from_gdscript: Variant = PackedFloat64Array()
	var mirrored: Variant = GenFfi.mirror_static_packedfloat64array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_packedfloat64array", "varcall")

func test_varcall_static_packedstringarray():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_packedstringarray()
	_check_callconv("return_static_packedstringarray", "varcall")

	assert_that(GenFfi.accept_static_packedstringarray(from_rust), "ffi.accept_static_packedstringarray(from_rust)")
	_check_callconv("accept_static_packedstringarray", "varcall")

	var from_gdscript: Variant = PackedStringArray()
	var mirrored: Variant = GenFfi.mirror_static_packedstringarray(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_packedstringarray", "varcall")

func test_varcall_static_packedvector2array():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_packedvector2array()
	_check_callconv("return_static_packedvector2array", "varcall")

	assert_that(GenFfi.accept_static_packedvector2array(from_rust), "ffi.accept_static_packedvector2array(from_rust)")
	_check_callconv("accept_static_packedvector2array", "varcall")

	var from_gdscript: Variant = PackedVector2Array()
	var mirrored: Variant = GenFfi.mirror_static_packedvector2array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_packedvector2array", "varcall")

func test_varcall_static_packedvector3array():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_packedvector3array()
	_check_callconv("return_static_packedvector3array", "varcall")

	assert_that(GenFfi.accept_static_packedvector3array(from_rust), "ffi.accept_static_packedvector3array(from_rust)")
	_check_callconv("accept_static_packedvector3array", "varcall")

	var from_gdscript: Variant = PackedVector3Array()
	var mirrored: Variant = GenFfi.mirror_static_packedvector3array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_packedvector3array", "varcall")

func test_varcall_static_packedvector4array():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_packedvector4array()
	_check_callconv("return_static_packedvector4array", "varcall")

	assert_that(GenFfi.accept_static_packedvector4array(from_rust), "ffi.accept_static_packedvector4array(from_rust)")
	_check_callconv("accept_static_packedvector4array", "varcall")

	var from_gdscript: Variant = PackedVector4Array()
	var mirrored: Variant = GenFfi.mirror_static_packedvector4array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_packedvector4array", "varcall")

func test_varcall_static_packedcolorarray():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_packedcolorarray()
	_check_callconv("return_static_packedcolorarray", "varcall")

	assert_that(GenFfi.accept_static_packedcolorarray(from_rust), "ffi.accept_static_packedcolorarray(from_rust)")
	_check_callconv("accept_static_packedcolorarray", "varcall")

	var from_gdscript: Variant = PackedColorArray()
	var mirrored: Variant = GenFfi.mirror_static_packedcolorarray(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_packedcolorarray", "varcall")

func test_varcall_static_newi64():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_newi64()
	_check_callconv("return_static_newi64", "varcall")

	assert_that(GenFfi.accept_static_newi64(from_rust), "ffi.accept_static_newi64(from_rust)")
	_check_callconv("accept_static_newi64", "varcall")

	var from_gdscript: Variant = -922337203685477580
	var mirrored: Variant = GenFfi.mirror_static_newi64(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newi64", "varcall")

func test_varcall_static_newi32():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_newi32()
	_check_callconv("return_static_newi32", "varcall")

	assert_that(GenFfi.accept_static_newi32(from_rust), "ffi.accept_static_newi32(from_rust)")
	_check_callconv("accept_static_newi32", "varcall")

	var from_gdscript: Variant = -2147483648
	var mirrored: Variant = GenFfi.mirror_static_newi32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newi32", "varcall")

func test_varcall_static_newu32():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_newu32()
	_check_callconv("return_static_newu32", "varcall")

	assert_that(GenFfi.accept_static_newu32(from_rust), "ffi.accept_static_newu32(from_rust)")
	_check_callconv("accept_static_newu32", "varcall")

	var from_gdscript: Variant = 4294967295
	var mirrored: Variant = GenFfi.mirror_static_newu32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newu32", "varcall")

func test_varcall_static_newi16():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_newi16()
	_check_callconv("return_static_newi16", "varcall")

	assert_that(GenFfi.accept_static_newi16(from_rust), "ffi.accept_static_newi16(from_rust)")
	_check_callconv("accept_static_newi16", "varcall")

	var from_gdscript: Variant = -32767
	var mirrored: Variant = GenFfi.mirror_static_newi16(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newi16", "varcall")

func test_varcall_static_newu16():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_newu16()
	_check_callconv("return_static_newu16", "varcall")

	assert_that(GenFfi.accept_static_newu16(from_rust), "ffi.accept_static_newu16(from_rust)")
	_check_callconv("accept_static_newu16", "varcall")

	var from_gdscript: Variant = 65535
	var mirrored: Variant = GenFfi.mirror_static_newu16(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newu16", "varcall")

func test_varcall_static_newi8():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_newi8()
	_check_callconv("return_static_newi8", "varcall")

	assert_that(GenFfi.accept_static_newi8(from_rust), "ffi.accept_static_newi8(from_rust)")
	_check_callconv("accept_static_newi8", "varcall")

	var from_gdscript: Variant = -128
	var mirrored: Variant = GenFfi.mirror_static_newi8(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newi8", "varcall")

func test_varcall_static_newu8():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_newu8()
	_check_callconv("return_static_newu8", "varcall")

	assert_that(GenFfi.accept_static_newu8(from_rust), "ffi.accept_static_newu8(from_rust)")
	_check_callconv("accept_static_newu8", "varcall")

	var from_gdscript: Variant = 255
	var mirrored: Variant = GenFfi.mirror_static_newu8(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newu8", "varcall")

func test_varcall_static_newf32():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_newf32()
	_check_callconv("return_static_newf32", "varcall")

	assert_that(GenFfi.accept_static_newf32(from_rust), "ffi.accept_static_newf32(from_rust)")
	_check_callconv("accept_static_newf32", "varcall")

	var from_gdscript: Variant = 12.5
	var mirrored: Variant = GenFfi.mirror_static_newf32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newf32", "varcall")

func test_varcall_static_newf64():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_newf64()
	_check_callconv("return_static_newf64", "varcall")

	assert_that(GenFfi.accept_static_newf64(from_rust), "ffi.accept_static_newf64(from_rust)")
	_check_callconv("accept_static_newf64", "varcall")

	var from_gdscript: Variant = 127.83156478
	var mirrored: Variant = GenFfi.mirror_static_newf64(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newf64", "varcall")

func test_varcall_static_newbool():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_newbool()
	_check_callconv("return_static_newbool", "varcall")

	assert_that(GenFfi.accept_static_newbool(from_rust), "ffi.accept_static_newbool(from_rust)")
	_check_callconv("accept_static_newbool", "varcall")

	var from_gdscript: Variant = true
	var mirrored: Variant = GenFfi.mirror_static_newbool(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newbool", "varcall")

func test_varcall_static_newcolor():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_newcolor()
	_check_callconv("return_static_newcolor", "varcall")

	assert_that(GenFfi.accept_static_newcolor(from_rust), "ffi.accept_static_newcolor(from_rust)")
	_check_callconv("accept_static_newcolor", "varcall")

	var from_gdscript: Variant = Color(0.7, 0.5, 0.3, 0.2)
	var mirrored: Variant = GenFfi.mirror_static_newcolor(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newcolor", "varcall")

func test_varcall_static_newstring():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_newstring()
	_check_callconv("return_static_newstring", "varcall")

	assert_that(GenFfi.accept_static_newstring(from_rust), "ffi.accept_static_newstring(from_rust)")
	_check_callconv("accept_static_newstring", "varcall")

	var from_gdscript: Variant = "hello"
	var mirrored: Variant = GenFfi.mirror_static_newstring(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newstring", "varcall")

func test_varcall_static_newstringname():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_newstringname()
	_check_callconv("return_static_newstringname", "varcall")

	assert_that(GenFfi.accept_static_newstringname(from_rust), "ffi.accept_static_newstringname(from_rust)")
	_check_callconv("accept_static_newstringname", "varcall")

	var from_gdscript: Variant = &"hello"
	var mirrored: Variant = GenFfi.mirror_static_newstringname(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newstringname", "varcall")

func test_varcall_static_newnodepath():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_newnodepath()
	_check_callconv("return_static_newnodepath", "varcall")

	assert_that(GenFfi.accept_static_newnodepath(from_rust), "ffi.accept_static_newnodepath(from_rust)")
	_check_callconv("accept_static_newnodepath", "varcall")

	var from_gdscript: Variant = ^"hello"
	var mirrored: Variant = GenFfi.mirror_static_newnodepath(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newnodepath", "varcall")

func test_varcall_static_newvector2():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_newvector2()
	_check_callconv("return_static_newvector2", "varcall")

	assert_that(GenFfi.accept_static_newvector2(from_rust), "ffi.accept_static_newvector2(from_rust)")
	_check_callconv("accept_static_newvector2", "varcall")

	var from_gdscript: Variant = Vector2(12.5, -3.5)
	var mirrored: Variant = GenFfi.mirror_static_newvector2(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newvector2", "varcall")

func test_varcall_static_newvector3():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_newvector3()
	_check_callconv("return_static_newvector3", "varcall")

	assert_that(GenFfi.accept_static_newvector3(from_rust), "ffi.accept_static_newvector3(from_rust)")
	_check_callconv("accept_static_newvector3", "varcall")

	var from_gdscript: Variant = Vector3(117.5, 100.0, -323.25)
	var mirrored: Variant = GenFfi.mirror_static_newvector3(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newvector3", "varcall")

func test_varcall_static_newvector4():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_newvector4()
	_check_callconv("return_static_newvector4", "varcall")

	assert_that(GenFfi.accept_static_newvector4(from_rust), "ffi.accept_static_newvector4(from_rust)")
	_check_callconv("accept_static_newvector4", "varcall")

	var from_gdscript: Variant = Vector4(-18.5, 24.75, -1.25, 777.875)
	var mirrored: Variant = GenFfi.mirror_static_newvector4(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newvector4", "varcall")

func test_varcall_static_newvector2i():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_newvector2i()
	_check_callconv("return_static_newvector2i", "varcall")

	assert_that(GenFfi.accept_static_newvector2i(from_rust), "ffi.accept_static_newvector2i(from_rust)")
	_check_callconv("accept_static_newvector2i", "varcall")

	var from_gdscript: Variant = Vector2i(-2147483648, 2147483647)
	var mirrored: Variant = GenFfi.mirror_static_newvector2i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newvector2i", "varcall")

func test_varcall_static_newvector3i():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_newvector3i()
	_check_callconv("return_static_newvector3i", "varcall")

	assert_that(GenFfi.accept_static_newvector3i(from_rust), "ffi.accept_static_newvector3i(from_rust)")
	_check_callconv("accept_static_newvector3i", "varcall")

	var from_gdscript: Variant = Vector3i(-1, -2147483648, 2147483647)
	var mirrored: Variant = GenFfi.mirror_static_newvector3i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newvector3i", "varcall")

func test_varcall_static_newvector4i():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_newvector4i()
	_check_callconv("return_static_newvector4i", "varcall")

	assert_that(GenFfi.accept_static_newvector4i(from_rust), "ffi.accept_static_newvector4i(from_rust)")
	_check_callconv("accept_static_newvector4i", "varcall")

	var from_gdscript: Variant = Vector4i(-1, -2147483648, 2147483647, 1)
	var mirrored: Variant = GenFfi.mirror_static_newvector4i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newvector4i", "varcall")

func test_varcall_static_newcallable():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_newcallable()
	_check_callconv("return_static_newcallable", "varcall")

	assert_that(GenFfi.accept_static_newcallable(from_rust), "ffi.accept_static_newcallable(from_rust)")
	_check_callconv("accept_static_newcallable", "varcall")

	var from_gdscript: Variant = Callable()
	var mirrored: Variant = GenFfi.mirror_static_newcallable(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newcallable", "varcall")

func test_varcall_static_variantarray():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_variantarray()
	_check_callconv("return_static_variantarray", "varcall")

	assert_that(GenFfi.accept_static_variantarray(from_rust), "ffi.accept_static_variantarray(from_rust)")
	_check_callconv("accept_static_variantarray", "varcall")

	var from_gdscript: Variant = [-7, "godot", false, Vector2i(-77, 88)]
	var mirrored: Variant = GenFfi.mirror_static_variantarray(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_variantarray", "varcall")

func test_varcall_static_dictionary():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_dictionary()
	_check_callconv("return_static_dictionary", "varcall")

	assert_that(GenFfi.accept_static_dictionary(from_rust), "ffi.accept_static_dictionary(from_rust)")
	_check_callconv("accept_static_dictionary", "varcall")

	var from_gdscript: Variant = {"key": 83, -3: Vector2(1, 2), 0.03: true}
	var mirrored: Variant = GenFfi.mirror_static_dictionary(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_dictionary", "varcall")

func test_varcall_static_instanceid():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_instanceid()
	_check_callconv("return_static_instanceid", "varcall")

	assert_that(GenFfi.accept_static_instanceid(from_rust), "ffi.accept_static_instanceid(from_rust)")
	_check_callconv("accept_static_instanceid", "varcall")

	var from_gdscript: Variant = -1
	var mirrored: Variant = GenFfi.mirror_static_instanceid(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_instanceid", "varcall")

func test_varcall_static_variant():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_variant()
	_check_callconv("return_static_variant", "varcall")

	assert_that(GenFfi.accept_static_variant(from_rust), "ffi.accept_static_variant(from_rust)")
	_check_callconv("accept_static_variant", "varcall")

	var from_gdscript: Variant = 123
	var mirrored: Variant = GenFfi.mirror_static_variant(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_variant", "varcall")

func test_varcall_static_error():
	var instance = GenFfi.new() # workaround
	var from_rust: Variant = instance.return_static_error()
	_check_callconv("return_static_error", "varcall")

	assert_that(GenFfi.accept_static_error(from_rust), "ffi.accept_static_error(from_rust)")
	_check_callconv("accept_static_error", "varcall")

	var from_gdscript: Variant = 0
	var mirrored: Variant = GenFfi.mirror_static_error(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_error", "varcall")



func test_ptrcall_i64():
	var ffi := GenFfi.new()

	var from_rust: int = ffi.return_i64()
	_check_callconv("return_i64", "ptrcall")

	assert_that(ffi.accept_i64(from_rust), "ffi.accept_i64(from_rust)")
	_check_callconv("accept_i64", "ptrcall")

	var from_gdscript: int = -922337203685477580
	var mirrored: int = ffi.mirror_i64(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_i64", "ptrcall")

func test_ptrcall_i32():
	var ffi := GenFfi.new()

	var from_rust: int = ffi.return_i32()
	_check_callconv("return_i32", "ptrcall")

	assert_that(ffi.accept_i32(from_rust), "ffi.accept_i32(from_rust)")
	_check_callconv("accept_i32", "ptrcall")

	var from_gdscript: int = -2147483648
	var mirrored: int = ffi.mirror_i32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_i32", "ptrcall")

func test_ptrcall_u32():
	var ffi := GenFfi.new()

	var from_rust: int = ffi.return_u32()
	_check_callconv("return_u32", "ptrcall")

	assert_that(ffi.accept_u32(from_rust), "ffi.accept_u32(from_rust)")
	_check_callconv("accept_u32", "ptrcall")

	var from_gdscript: int = 4294967295
	var mirrored: int = ffi.mirror_u32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_u32", "ptrcall")

func test_ptrcall_i16():
	var ffi := GenFfi.new()

	var from_rust: int = ffi.return_i16()
	_check_callconv("return_i16", "ptrcall")

	assert_that(ffi.accept_i16(from_rust), "ffi.accept_i16(from_rust)")
	_check_callconv("accept_i16", "ptrcall")

	var from_gdscript: int = -32767
	var mirrored: int = ffi.mirror_i16(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_i16", "ptrcall")

func test_ptrcall_u16():
	var ffi := GenFfi.new()

	var from_rust: int = ffi.return_u16()
	_check_callconv("return_u16", "ptrcall")

	assert_that(ffi.accept_u16(from_rust), "ffi.accept_u16(from_rust)")
	_check_callconv("accept_u16", "ptrcall")

	var from_gdscript: int = 65535
	var mirrored: int = ffi.mirror_u16(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_u16", "ptrcall")

func test_ptrcall_i8():
	var ffi := GenFfi.new()

	var from_rust: int = ffi.return_i8()
	_check_callconv("return_i8", "ptrcall")

	assert_that(ffi.accept_i8(from_rust), "ffi.accept_i8(from_rust)")
	_check_callconv("accept_i8", "ptrcall")

	var from_gdscript: int = -128
	var mirrored: int = ffi.mirror_i8(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_i8", "ptrcall")

func test_ptrcall_u8():
	var ffi := GenFfi.new()

	var from_rust: int = ffi.return_u8()
	_check_callconv("return_u8", "ptrcall")

	assert_that(ffi.accept_u8(from_rust), "ffi.accept_u8(from_rust)")
	_check_callconv("accept_u8", "ptrcall")

	var from_gdscript: int = 255
	var mirrored: int = ffi.mirror_u8(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_u8", "ptrcall")

func test_ptrcall_f32():
	var ffi := GenFfi.new()

	var from_rust: float = ffi.return_f32()
	_check_callconv("return_f32", "ptrcall")

	assert_that(ffi.accept_f32(from_rust), "ffi.accept_f32(from_rust)")
	_check_callconv("accept_f32", "ptrcall")

	var from_gdscript: float = 12.5
	var mirrored: float = ffi.mirror_f32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_f32", "ptrcall")

func test_ptrcall_f64():
	var ffi := GenFfi.new()

	var from_rust: float = ffi.return_f64()
	_check_callconv("return_f64", "ptrcall")

	assert_that(ffi.accept_f64(from_rust), "ffi.accept_f64(from_rust)")
	_check_callconv("accept_f64", "ptrcall")

	var from_gdscript: float = 127.83156478
	var mirrored: float = ffi.mirror_f64(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_f64", "ptrcall")

func test_ptrcall_bool():
	var ffi := GenFfi.new()

	var from_rust: bool = ffi.return_bool()
	_check_callconv("return_bool", "ptrcall")

	assert_that(ffi.accept_bool(from_rust), "ffi.accept_bool(from_rust)")
	_check_callconv("accept_bool", "ptrcall")

	var from_gdscript: bool = true
	var mirrored: bool = ffi.mirror_bool(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_bool", "ptrcall")

func test_ptrcall_color():
	var ffi := GenFfi.new()

	var from_rust: Color = ffi.return_color()
	_check_callconv("return_color", "ptrcall")

	assert_that(ffi.accept_color(from_rust), "ffi.accept_color(from_rust)")
	_check_callconv("accept_color", "ptrcall")

	var from_gdscript: Color = Color(0.7, 0.5, 0.3, 0.2)
	var mirrored: Color = ffi.mirror_color(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_color", "ptrcall")

func test_ptrcall_gstring():
	var ffi := GenFfi.new()

	var from_rust: String = ffi.return_gstring()
	_check_callconv("return_gstring", "ptrcall")

	assert_that(ffi.accept_gstring(from_rust), "ffi.accept_gstring(from_rust)")
	_check_callconv("accept_gstring", "ptrcall")

	var from_gdscript: String = "hello"
	var mirrored: String = ffi.mirror_gstring(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_gstring", "ptrcall")

func test_ptrcall_stringname():
	var ffi := GenFfi.new()

	var from_rust: StringName = ffi.return_stringname()
	_check_callconv("return_stringname", "ptrcall")

	assert_that(ffi.accept_stringname(from_rust), "ffi.accept_stringname(from_rust)")
	_check_callconv("accept_stringname", "ptrcall")

	var from_gdscript: StringName = &"hello"
	var mirrored: StringName = ffi.mirror_stringname(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_stringname", "ptrcall")

func test_ptrcall_nodepath():
	var ffi := GenFfi.new()

	var from_rust: NodePath = ffi.return_nodepath()
	_check_callconv("return_nodepath", "ptrcall")

	assert_that(ffi.accept_nodepath(from_rust), "ffi.accept_nodepath(from_rust)")
	_check_callconv("accept_nodepath", "ptrcall")

	var from_gdscript: NodePath = ^"hello"
	var mirrored: NodePath = ffi.mirror_nodepath(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_nodepath", "ptrcall")

func test_ptrcall_vector2():
	var ffi := GenFfi.new()

	var from_rust: Vector2 = ffi.return_vector2()
	_check_callconv("return_vector2", "ptrcall")

	assert_that(ffi.accept_vector2(from_rust), "ffi.accept_vector2(from_rust)")
	_check_callconv("accept_vector2", "ptrcall")

	var from_gdscript: Vector2 = Vector2(12.5, -3.5)
	var mirrored: Vector2 = ffi.mirror_vector2(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_vector2", "ptrcall")

func test_ptrcall_vector3():
	var ffi := GenFfi.new()

	var from_rust: Vector3 = ffi.return_vector3()
	_check_callconv("return_vector3", "ptrcall")

	assert_that(ffi.accept_vector3(from_rust), "ffi.accept_vector3(from_rust)")
	_check_callconv("accept_vector3", "ptrcall")

	var from_gdscript: Vector3 = Vector3(117.5, 100.0, -323.25)
	var mirrored: Vector3 = ffi.mirror_vector3(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_vector3", "ptrcall")

func test_ptrcall_vector4():
	var ffi := GenFfi.new()

	var from_rust: Vector4 = ffi.return_vector4()
	_check_callconv("return_vector4", "ptrcall")

	assert_that(ffi.accept_vector4(from_rust), "ffi.accept_vector4(from_rust)")
	_check_callconv("accept_vector4", "ptrcall")

	var from_gdscript: Vector4 = Vector4(-18.5, 24.75, -1.25, 777.875)
	var mirrored: Vector4 = ffi.mirror_vector4(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_vector4", "ptrcall")

func test_ptrcall_vector2i():
	var ffi := GenFfi.new()

	var from_rust: Vector2i = ffi.return_vector2i()
	_check_callconv("return_vector2i", "ptrcall")

	assert_that(ffi.accept_vector2i(from_rust), "ffi.accept_vector2i(from_rust)")
	_check_callconv("accept_vector2i", "ptrcall")

	var from_gdscript: Vector2i = Vector2i(-2147483648, 2147483647)
	var mirrored: Vector2i = ffi.mirror_vector2i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_vector2i", "ptrcall")

func test_ptrcall_vector3i():
	var ffi := GenFfi.new()

	var from_rust: Vector3i = ffi.return_vector3i()
	_check_callconv("return_vector3i", "ptrcall")

	assert_that(ffi.accept_vector3i(from_rust), "ffi.accept_vector3i(from_rust)")
	_check_callconv("accept_vector3i", "ptrcall")

	var from_gdscript: Vector3i = Vector3i(-1, -2147483648, 2147483647)
	var mirrored: Vector3i = ffi.mirror_vector3i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_vector3i", "ptrcall")

func test_ptrcall_vector4i():
	var ffi := GenFfi.new()

	var from_rust: Vector4i = ffi.return_vector4i()
	_check_callconv("return_vector4i", "ptrcall")

	assert_that(ffi.accept_vector4i(from_rust), "ffi.accept_vector4i(from_rust)")
	_check_callconv("accept_vector4i", "ptrcall")

	var from_gdscript: Vector4i = Vector4i(-1, -2147483648, 2147483647, 1000)
	var mirrored: Vector4i = ffi.mirror_vector4i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_vector4i", "ptrcall")

func test_ptrcall_callable():
	var ffi := GenFfi.new()

	var from_rust: Callable = ffi.return_callable()
	_check_callconv("return_callable", "ptrcall")

	assert_that(ffi.accept_callable(from_rust), "ffi.accept_callable(from_rust)")
	_check_callconv("accept_callable", "ptrcall")

	var from_gdscript: Callable = Callable()
	var mirrored: Callable = ffi.mirror_callable(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_callable", "ptrcall")

func test_ptrcall_signal():
	var ffi := GenFfi.new()

	var from_rust: Signal = ffi.return_signal()
	_check_callconv("return_signal", "ptrcall")

	assert_that(ffi.accept_signal(from_rust), "ffi.accept_signal(from_rust)")
	_check_callconv("accept_signal", "ptrcall")

	var from_gdscript: Signal = Signal()
	var mirrored: Signal = ffi.mirror_signal(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_signal", "ptrcall")

func test_ptrcall_rect2():
	var ffi := GenFfi.new()

	var from_rust: Rect2 = ffi.return_rect2()
	_check_callconv("return_rect2", "ptrcall")

	assert_that(ffi.accept_rect2(from_rust), "ffi.accept_rect2(from_rust)")
	_check_callconv("accept_rect2", "ptrcall")

	var from_gdscript: Rect2 = Rect2()
	var mirrored: Rect2 = ffi.mirror_rect2(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_rect2", "ptrcall")

func test_ptrcall_rect2i():
	var ffi := GenFfi.new()

	var from_rust: Rect2i = ffi.return_rect2i()
	_check_callconv("return_rect2i", "ptrcall")

	assert_that(ffi.accept_rect2i(from_rust), "ffi.accept_rect2i(from_rust)")
	_check_callconv("accept_rect2i", "ptrcall")

	var from_gdscript: Rect2i = Rect2i()
	var mirrored: Rect2i = ffi.mirror_rect2i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_rect2i", "ptrcall")

func test_ptrcall_transform2d():
	var ffi := GenFfi.new()

	var from_rust: Transform2D = ffi.return_transform2d()
	_check_callconv("return_transform2d", "ptrcall")

	assert_that(ffi.accept_transform2d(from_rust), "ffi.accept_transform2d(from_rust)")
	_check_callconv("accept_transform2d", "ptrcall")

	var from_gdscript: Transform2D = Transform2D()
	var mirrored: Transform2D = ffi.mirror_transform2d(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_transform2d", "ptrcall")

func test_ptrcall_plane():
	var ffi := GenFfi.new()

	var from_rust: Plane = ffi.return_plane()
	_check_callconv("return_plane", "ptrcall")

	assert_that(ffi.accept_plane(from_rust), "ffi.accept_plane(from_rust)")
	_check_callconv("accept_plane", "ptrcall")

	var from_gdscript: Plane = Plane()
	var mirrored: Plane = ffi.mirror_plane(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_plane", "ptrcall")

func test_ptrcall_quaternion():
	var ffi := GenFfi.new()

	var from_rust: Quaternion = ffi.return_quaternion()
	_check_callconv("return_quaternion", "ptrcall")

	assert_that(ffi.accept_quaternion(from_rust), "ffi.accept_quaternion(from_rust)")
	_check_callconv("accept_quaternion", "ptrcall")

	var from_gdscript: Quaternion = Quaternion()
	var mirrored: Quaternion = ffi.mirror_quaternion(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_quaternion", "ptrcall")

func test_ptrcall_aabb():
	var ffi := GenFfi.new()

	var from_rust: AABB = ffi.return_aabb()
	_check_callconv("return_aabb", "ptrcall")

	assert_that(ffi.accept_aabb(from_rust), "ffi.accept_aabb(from_rust)")
	_check_callconv("accept_aabb", "ptrcall")

	var from_gdscript: AABB = AABB()
	var mirrored: AABB = ffi.mirror_aabb(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_aabb", "ptrcall")

func test_ptrcall_basis():
	var ffi := GenFfi.new()

	var from_rust: Basis = ffi.return_basis()
	_check_callconv("return_basis", "ptrcall")

	assert_that(ffi.accept_basis(from_rust), "ffi.accept_basis(from_rust)")
	_check_callconv("accept_basis", "ptrcall")

	var from_gdscript: Basis = Basis()
	var mirrored: Basis = ffi.mirror_basis(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_basis", "ptrcall")

func test_ptrcall_transform3d():
	var ffi := GenFfi.new()

	var from_rust: Transform3D = ffi.return_transform3d()
	_check_callconv("return_transform3d", "ptrcall")

	assert_that(ffi.accept_transform3d(from_rust), "ffi.accept_transform3d(from_rust)")
	_check_callconv("accept_transform3d", "ptrcall")

	var from_gdscript: Transform3D = Transform3D()
	var mirrored: Transform3D = ffi.mirror_transform3d(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_transform3d", "ptrcall")

func test_ptrcall_projection():
	var ffi := GenFfi.new()

	var from_rust: Projection = ffi.return_projection()
	_check_callconv("return_projection", "ptrcall")

	assert_that(ffi.accept_projection(from_rust), "ffi.accept_projection(from_rust)")
	_check_callconv("accept_projection", "ptrcall")

	var from_gdscript: Projection = Projection()
	var mirrored: Projection = ffi.mirror_projection(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_projection", "ptrcall")

func test_ptrcall_rid():
	var ffi := GenFfi.new()

	var from_rust: RID = ffi.return_rid()
	_check_callconv("return_rid", "ptrcall")

	assert_that(ffi.accept_rid(from_rust), "ffi.accept_rid(from_rust)")
	_check_callconv("accept_rid", "ptrcall")

	var from_gdscript: RID = RID()
	var mirrored: RID = ffi.mirror_rid(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_rid", "ptrcall")

func test_ptrcall_option_gd_node():
	var ffi := GenFfi.new()

	var from_rust: Node = ffi.return_option_gd_node()
	_check_callconv("return_option_gd_node", "ptrcall")

	assert_that(ffi.accept_option_gd_node(from_rust), "ffi.accept_option_gd_node(from_rust)")
	_check_callconv("accept_option_gd_node", "ptrcall")

	var from_gdscript: Node = null
	var mirrored: Node = ffi.mirror_option_gd_node(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_option_gd_node", "ptrcall")

func test_ptrcall_option_gd_resource():
	var ffi := GenFfi.new()

	var from_rust: Resource = ffi.return_option_gd_resource()
	_check_callconv("return_option_gd_resource", "ptrcall")

	assert_that(ffi.accept_option_gd_resource(from_rust), "ffi.accept_option_gd_resource(from_rust)")
	_check_callconv("accept_option_gd_resource", "ptrcall")

	var from_gdscript: Resource = null
	var mirrored: Resource = ffi.mirror_option_gd_resource(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_option_gd_resource", "ptrcall")

func test_ptrcall_packedbytearray():
	var ffi := GenFfi.new()

	var from_rust: PackedByteArray = ffi.return_packedbytearray()
	_check_callconv("return_packedbytearray", "ptrcall")

	assert_that(ffi.accept_packedbytearray(from_rust), "ffi.accept_packedbytearray(from_rust)")
	_check_callconv("accept_packedbytearray", "ptrcall")

	var from_gdscript: PackedByteArray = PackedByteArray()
	var mirrored: PackedByteArray = ffi.mirror_packedbytearray(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_packedbytearray", "ptrcall")

func test_ptrcall_packedint32array():
	var ffi := GenFfi.new()

	var from_rust: PackedInt32Array = ffi.return_packedint32array()
	_check_callconv("return_packedint32array", "ptrcall")

	assert_that(ffi.accept_packedint32array(from_rust), "ffi.accept_packedint32array(from_rust)")
	_check_callconv("accept_packedint32array", "ptrcall")

	var from_gdscript: PackedInt32Array = PackedInt32Array()
	var mirrored: PackedInt32Array = ffi.mirror_packedint32array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_packedint32array", "ptrcall")

func test_ptrcall_packedint64array():
	var ffi := GenFfi.new()

	var from_rust: PackedInt64Array = ffi.return_packedint64array()
	_check_callconv("return_packedint64array", "ptrcall")

	assert_that(ffi.accept_packedint64array(from_rust), "ffi.accept_packedint64array(from_rust)")
	_check_callconv("accept_packedint64array", "ptrcall")

	var from_gdscript: PackedInt64Array = PackedInt64Array()
	var mirrored: PackedInt64Array = ffi.mirror_packedint64array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_packedint64array", "ptrcall")

func test_ptrcall_packedfloat32array():
	var ffi := GenFfi.new()

	var from_rust: PackedFloat32Array = ffi.return_packedfloat32array()
	_check_callconv("return_packedfloat32array", "ptrcall")

	assert_that(ffi.accept_packedfloat32array(from_rust), "ffi.accept_packedfloat32array(from_rust)")
	_check_callconv("accept_packedfloat32array", "ptrcall")

	var from_gdscript: PackedFloat32Array = PackedFloat32Array()
	var mirrored: PackedFloat32Array = ffi.mirror_packedfloat32array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_packedfloat32array", "ptrcall")

func test_ptrcall_packedfloat64array():
	var ffi := GenFfi.new()

	var from_rust: PackedFloat64Array = ffi.return_packedfloat64array()
	_check_callconv("return_packedfloat64array", "ptrcall")

	assert_that(ffi.accept_packedfloat64array(from_rust), "ffi.accept_packedfloat64array(from_rust)")
	_check_callconv("accept_packedfloat64array", "ptrcall")

	var from_gdscript: PackedFloat64Array = PackedFloat64Array()
	var mirrored: PackedFloat64Array = ffi.mirror_packedfloat64array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_packedfloat64array", "ptrcall")

func test_ptrcall_packedstringarray():
	var ffi := GenFfi.new()

	var from_rust: PackedStringArray = ffi.return_packedstringarray()
	_check_callconv("return_packedstringarray", "ptrcall")

	assert_that(ffi.accept_packedstringarray(from_rust), "ffi.accept_packedstringarray(from_rust)")
	_check_callconv("accept_packedstringarray", "ptrcall")

	var from_gdscript: PackedStringArray = PackedStringArray()
	var mirrored: PackedStringArray = ffi.mirror_packedstringarray(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_packedstringarray", "ptrcall")

func test_ptrcall_packedvector2array():
	var ffi := GenFfi.new()

	var from_rust: PackedVector2Array = ffi.return_packedvector2array()
	_check_callconv("return_packedvector2array", "ptrcall")

	assert_that(ffi.accept_packedvector2array(from_rust), "ffi.accept_packedvector2array(from_rust)")
	_check_callconv("accept_packedvector2array", "ptrcall")

	var from_gdscript: PackedVector2Array = PackedVector2Array()
	var mirrored: PackedVector2Array = ffi.mirror_packedvector2array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_packedvector2array", "ptrcall")

func test_ptrcall_packedvector3array():
	var ffi := GenFfi.new()

	var from_rust: PackedVector3Array = ffi.return_packedvector3array()
	_check_callconv("return_packedvector3array", "ptrcall")

	assert_that(ffi.accept_packedvector3array(from_rust), "ffi.accept_packedvector3array(from_rust)")
	_check_callconv("accept_packedvector3array", "ptrcall")

	var from_gdscript: PackedVector3Array = PackedVector3Array()
	var mirrored: PackedVector3Array = ffi.mirror_packedvector3array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_packedvector3array", "ptrcall")

func test_ptrcall_packedvector4array():
	var ffi := GenFfi.new()

	var from_rust: PackedVector4Array = ffi.return_packedvector4array()
	_check_callconv("return_packedvector4array", "ptrcall")

	assert_that(ffi.accept_packedvector4array(from_rust), "ffi.accept_packedvector4array(from_rust)")
	_check_callconv("accept_packedvector4array", "ptrcall")

	var from_gdscript: PackedVector4Array = PackedVector4Array()
	var mirrored: PackedVector4Array = ffi.mirror_packedvector4array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_packedvector4array", "ptrcall")

func test_ptrcall_packedcolorarray():
	var ffi := GenFfi.new()

	var from_rust: PackedColorArray = ffi.return_packedcolorarray()
	_check_callconv("return_packedcolorarray", "ptrcall")

	assert_that(ffi.accept_packedcolorarray(from_rust), "ffi.accept_packedcolorarray(from_rust)")
	_check_callconv("accept_packedcolorarray", "ptrcall")

	var from_gdscript: PackedColorArray = PackedColorArray()
	var mirrored: PackedColorArray = ffi.mirror_packedcolorarray(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_packedcolorarray", "ptrcall")

func test_ptrcall_newi64():
	var ffi := GenFfi.new()

	var from_rust: int = ffi.return_newi64()
	_check_callconv("return_newi64", "ptrcall")

	assert_that(ffi.accept_newi64(from_rust), "ffi.accept_newi64(from_rust)")
	_check_callconv("accept_newi64", "ptrcall")

	var from_gdscript: int = -922337203685477580
	var mirrored: int = ffi.mirror_newi64(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newi64", "ptrcall")

func test_ptrcall_newi32():
	var ffi := GenFfi.new()

	var from_rust: int = ffi.return_newi32()
	_check_callconv("return_newi32", "ptrcall")

	assert_that(ffi.accept_newi32(from_rust), "ffi.accept_newi32(from_rust)")
	_check_callconv("accept_newi32", "ptrcall")

	var from_gdscript: int = -2147483648
	var mirrored: int = ffi.mirror_newi32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newi32", "ptrcall")

func test_ptrcall_newu32():
	var ffi := GenFfi.new()

	var from_rust: int = ffi.return_newu32()
	_check_callconv("return_newu32", "ptrcall")

	assert_that(ffi.accept_newu32(from_rust), "ffi.accept_newu32(from_rust)")
	_check_callconv("accept_newu32", "ptrcall")

	var from_gdscript: int = 4294967295
	var mirrored: int = ffi.mirror_newu32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newu32", "ptrcall")

func test_ptrcall_newi16():
	var ffi := GenFfi.new()

	var from_rust: int = ffi.return_newi16()
	_check_callconv("return_newi16", "ptrcall")

	assert_that(ffi.accept_newi16(from_rust), "ffi.accept_newi16(from_rust)")
	_check_callconv("accept_newi16", "ptrcall")

	var from_gdscript: int = -32767
	var mirrored: int = ffi.mirror_newi16(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newi16", "ptrcall")

func test_ptrcall_newu16():
	var ffi := GenFfi.new()

	var from_rust: int = ffi.return_newu16()
	_check_callconv("return_newu16", "ptrcall")

	assert_that(ffi.accept_newu16(from_rust), "ffi.accept_newu16(from_rust)")
	_check_callconv("accept_newu16", "ptrcall")

	var from_gdscript: int = 65535
	var mirrored: int = ffi.mirror_newu16(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newu16", "ptrcall")

func test_ptrcall_newi8():
	var ffi := GenFfi.new()

	var from_rust: int = ffi.return_newi8()
	_check_callconv("return_newi8", "ptrcall")

	assert_that(ffi.accept_newi8(from_rust), "ffi.accept_newi8(from_rust)")
	_check_callconv("accept_newi8", "ptrcall")

	var from_gdscript: int = -128
	var mirrored: int = ffi.mirror_newi8(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newi8", "ptrcall")

func test_ptrcall_newu8():
	var ffi := GenFfi.new()

	var from_rust: int = ffi.return_newu8()
	_check_callconv("return_newu8", "ptrcall")

	assert_that(ffi.accept_newu8(from_rust), "ffi.accept_newu8(from_rust)")
	_check_callconv("accept_newu8", "ptrcall")

	var from_gdscript: int = 255
	var mirrored: int = ffi.mirror_newu8(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newu8", "ptrcall")

func test_ptrcall_newf32():
	var ffi := GenFfi.new()

	var from_rust: float = ffi.return_newf32()
	_check_callconv("return_newf32", "ptrcall")

	assert_that(ffi.accept_newf32(from_rust), "ffi.accept_newf32(from_rust)")
	_check_callconv("accept_newf32", "ptrcall")

	var from_gdscript: float = 12.5
	var mirrored: float = ffi.mirror_newf32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newf32", "ptrcall")

func test_ptrcall_newf64():
	var ffi := GenFfi.new()

	var from_rust: float = ffi.return_newf64()
	_check_callconv("return_newf64", "ptrcall")

	assert_that(ffi.accept_newf64(from_rust), "ffi.accept_newf64(from_rust)")
	_check_callconv("accept_newf64", "ptrcall")

	var from_gdscript: float = 127.83156478
	var mirrored: float = ffi.mirror_newf64(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newf64", "ptrcall")

func test_ptrcall_newbool():
	var ffi := GenFfi.new()

	var from_rust: bool = ffi.return_newbool()
	_check_callconv("return_newbool", "ptrcall")

	assert_that(ffi.accept_newbool(from_rust), "ffi.accept_newbool(from_rust)")
	_check_callconv("accept_newbool", "ptrcall")

	var from_gdscript: bool = true
	var mirrored: bool = ffi.mirror_newbool(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newbool", "ptrcall")

func test_ptrcall_newcolor():
	var ffi := GenFfi.new()

	var from_rust: Color = ffi.return_newcolor()
	_check_callconv("return_newcolor", "ptrcall")

	assert_that(ffi.accept_newcolor(from_rust), "ffi.accept_newcolor(from_rust)")
	_check_callconv("accept_newcolor", "ptrcall")

	var from_gdscript: Color = Color(0.7, 0.5, 0.3, 0.2)
	var mirrored: Color = ffi.mirror_newcolor(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newcolor", "ptrcall")

func test_ptrcall_newstring():
	var ffi := GenFfi.new()

	var from_rust: String = ffi.return_newstring()
	_check_callconv("return_newstring", "ptrcall")

	assert_that(ffi.accept_newstring(from_rust), "ffi.accept_newstring(from_rust)")
	_check_callconv("accept_newstring", "ptrcall")

	var from_gdscript: String = "hello"
	var mirrored: String = ffi.mirror_newstring(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newstring", "ptrcall")

func test_ptrcall_newstringname():
	var ffi := GenFfi.new()

	var from_rust: StringName = ffi.return_newstringname()
	_check_callconv("return_newstringname", "ptrcall")

	assert_that(ffi.accept_newstringname(from_rust), "ffi.accept_newstringname(from_rust)")
	_check_callconv("accept_newstringname", "ptrcall")

	var from_gdscript: StringName = &"hello"
	var mirrored: StringName = ffi.mirror_newstringname(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newstringname", "ptrcall")

func test_ptrcall_newnodepath():
	var ffi := GenFfi.new()

	var from_rust: NodePath = ffi.return_newnodepath()
	_check_callconv("return_newnodepath", "ptrcall")

	assert_that(ffi.accept_newnodepath(from_rust), "ffi.accept_newnodepath(from_rust)")
	_check_callconv("accept_newnodepath", "ptrcall")

	var from_gdscript: NodePath = ^"hello"
	var mirrored: NodePath = ffi.mirror_newnodepath(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newnodepath", "ptrcall")

func test_ptrcall_newvector2():
	var ffi := GenFfi.new()

	var from_rust: Vector2 = ffi.return_newvector2()
	_check_callconv("return_newvector2", "ptrcall")

	assert_that(ffi.accept_newvector2(from_rust), "ffi.accept_newvector2(from_rust)")
	_check_callconv("accept_newvector2", "ptrcall")

	var from_gdscript: Vector2 = Vector2(12.5, -3.5)
	var mirrored: Vector2 = ffi.mirror_newvector2(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newvector2", "ptrcall")

func test_ptrcall_newvector3():
	var ffi := GenFfi.new()

	var from_rust: Vector3 = ffi.return_newvector3()
	_check_callconv("return_newvector3", "ptrcall")

	assert_that(ffi.accept_newvector3(from_rust), "ffi.accept_newvector3(from_rust)")
	_check_callconv("accept_newvector3", "ptrcall")

	var from_gdscript: Vector3 = Vector3(117.5, 100.0, -323.25)
	var mirrored: Vector3 = ffi.mirror_newvector3(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newvector3", "ptrcall")

func test_ptrcall_newvector4():
	var ffi := GenFfi.new()

	var from_rust: Vector4 = ffi.return_newvector4()
	_check_callconv("return_newvector4", "ptrcall")

	assert_that(ffi.accept_newvector4(from_rust), "ffi.accept_newvector4(from_rust)")
	_check_callconv("accept_newvector4", "ptrcall")

	var from_gdscript: Vector4 = Vector4(-18.5, 24.75, -1.25, 777.875)
	var mirrored: Vector4 = ffi.mirror_newvector4(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newvector4", "ptrcall")

func test_ptrcall_newvector2i():
	var ffi := GenFfi.new()

	var from_rust: Vector2i = ffi.return_newvector2i()
	_check_callconv("return_newvector2i", "ptrcall")

	assert_that(ffi.accept_newvector2i(from_rust), "ffi.accept_newvector2i(from_rust)")
	_check_callconv("accept_newvector2i", "ptrcall")

	var from_gdscript: Vector2i = Vector2i(-2147483648, 2147483647)
	var mirrored: Vector2i = ffi.mirror_newvector2i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newvector2i", "ptrcall")

func test_ptrcall_newvector3i():
	var ffi := GenFfi.new()

	var from_rust: Vector3i = ffi.return_newvector3i()
	_check_callconv("return_newvector3i", "ptrcall")

	assert_that(ffi.accept_newvector3i(from_rust), "ffi.accept_newvector3i(from_rust)")
	_check_callconv("accept_newvector3i", "ptrcall")

	var from_gdscript: Vector3i = Vector3i(-1, -2147483648, 2147483647)
	var mirrored: Vector3i = ffi.mirror_newvector3i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newvector3i", "ptrcall")

func test_ptrcall_newvector4i():
	var ffi := GenFfi.new()

	var from_rust: Vector4i = ffi.return_newvector4i()
	_check_callconv("return_newvector4i", "ptrcall")

	assert_that(ffi.accept_newvector4i(from_rust), "ffi.accept_newvector4i(from_rust)")
	_check_callconv("accept_newvector4i", "ptrcall")

	var from_gdscript: Vector4i = Vector4i(-1, -2147483648, 2147483647, 1)
	var mirrored: Vector4i = ffi.mirror_newvector4i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newvector4i", "ptrcall")

func test_ptrcall_newcallable():
	var ffi := GenFfi.new()

	var from_rust: Callable = ffi.return_newcallable()
	_check_callconv("return_newcallable", "ptrcall")

	assert_that(ffi.accept_newcallable(from_rust), "ffi.accept_newcallable(from_rust)")
	_check_callconv("accept_newcallable", "ptrcall")

	var from_gdscript: Callable = Callable()
	var mirrored: Callable = ffi.mirror_newcallable(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_newcallable", "ptrcall")

func test_ptrcall_variantarray():
	var ffi := GenFfi.new()

	var from_rust: Array = ffi.return_variantarray()
	_check_callconv("return_variantarray", "ptrcall")

	assert_that(ffi.accept_variantarray(from_rust), "ffi.accept_variantarray(from_rust)")
	_check_callconv("accept_variantarray", "ptrcall")

	var from_gdscript: Array = [-7, "godot", false, Vector2i(-77, 88)]
	var mirrored: Array = ffi.mirror_variantarray(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_variantarray", "ptrcall")

func test_ptrcall_dictionary():
	var ffi := GenFfi.new()

	var from_rust: Dictionary = ffi.return_dictionary()
	_check_callconv("return_dictionary", "ptrcall")

	assert_that(ffi.accept_dictionary(from_rust), "ffi.accept_dictionary(from_rust)")
	_check_callconv("accept_dictionary", "ptrcall")

	var from_gdscript: Dictionary = {"key": 83, -3: Vector2(1, 2), 0.03: true}
	var mirrored: Dictionary = ffi.mirror_dictionary(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_dictionary", "ptrcall")

func test_ptrcall_instanceid():
	var ffi := GenFfi.new()

	var from_rust: int = ffi.return_instanceid()
	_check_callconv("return_instanceid", "ptrcall")

	assert_that(ffi.accept_instanceid(from_rust), "ffi.accept_instanceid(from_rust)")
	_check_callconv("accept_instanceid", "ptrcall")

	var from_gdscript: int = -1
	var mirrored: int = ffi.mirror_instanceid(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_instanceid", "ptrcall")

func test_ptrcall_variant():
	var ffi := GenFfi.new()

	var from_rust: Variant = ffi.return_variant()
	_check_callconv("return_variant", "ptrcall")

	assert_that(ffi.accept_variant(from_rust), "ffi.accept_variant(from_rust)")
	_check_callconv("accept_variant", "ptrcall")

	var from_gdscript: Variant = 123
	var mirrored: Variant = ffi.mirror_variant(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_variant", "ptrcall")

func test_ptrcall_error():
	var ffi := GenFfi.new()

	var from_rust: int = ffi.return_error()
	_check_callconv("return_error", "ptrcall")

	assert_that(ffi.accept_error(from_rust), "ffi.accept_error(from_rust)")
	_check_callconv("accept_error", "ptrcall")

	var from_gdscript: int = 0
	var mirrored: int = ffi.mirror_error(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored == from_gdscript")
	_check_callconv("mirror_error", "ptrcall")



func test_ptrcall_static_i64():
	var from_rust: int = GenFfi.return_static_i64()
	_check_callconv("return_static_i64", "ptrcall")

	assert_that(GenFfi.accept_static_i64(from_rust), "ffi.accept_static_i64(from_rust)")
	_check_callconv("accept_static_i64", "ptrcall")

	var from_gdscript: int = -922337203685477580
	var mirrored: int = GenFfi.mirror_static_i64(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_i64", "ptrcall")

func test_ptrcall_static_i32():
	var from_rust: int = GenFfi.return_static_i32()
	_check_callconv("return_static_i32", "ptrcall")

	assert_that(GenFfi.accept_static_i32(from_rust), "ffi.accept_static_i32(from_rust)")
	_check_callconv("accept_static_i32", "ptrcall")

	var from_gdscript: int = -2147483648
	var mirrored: int = GenFfi.mirror_static_i32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_i32", "ptrcall")

func test_ptrcall_static_u32():
	var from_rust: int = GenFfi.return_static_u32()
	_check_callconv("return_static_u32", "ptrcall")

	assert_that(GenFfi.accept_static_u32(from_rust), "ffi.accept_static_u32(from_rust)")
	_check_callconv("accept_static_u32", "ptrcall")

	var from_gdscript: int = 4294967295
	var mirrored: int = GenFfi.mirror_static_u32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_u32", "ptrcall")

func test_ptrcall_static_i16():
	var from_rust: int = GenFfi.return_static_i16()
	_check_callconv("return_static_i16", "ptrcall")

	assert_that(GenFfi.accept_static_i16(from_rust), "ffi.accept_static_i16(from_rust)")
	_check_callconv("accept_static_i16", "ptrcall")

	var from_gdscript: int = -32767
	var mirrored: int = GenFfi.mirror_static_i16(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_i16", "ptrcall")

func test_ptrcall_static_u16():
	var from_rust: int = GenFfi.return_static_u16()
	_check_callconv("return_static_u16", "ptrcall")

	assert_that(GenFfi.accept_static_u16(from_rust), "ffi.accept_static_u16(from_rust)")
	_check_callconv("accept_static_u16", "ptrcall")

	var from_gdscript: int = 65535
	var mirrored: int = GenFfi.mirror_static_u16(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_u16", "ptrcall")

func test_ptrcall_static_i8():
	var from_rust: int = GenFfi.return_static_i8()
	_check_callconv("return_static_i8", "ptrcall")

	assert_that(GenFfi.accept_static_i8(from_rust), "ffi.accept_static_i8(from_rust)")
	_check_callconv("accept_static_i8", "ptrcall")

	var from_gdscript: int = -128
	var mirrored: int = GenFfi.mirror_static_i8(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_i8", "ptrcall")

func test_ptrcall_static_u8():
	var from_rust: int = GenFfi.return_static_u8()
	_check_callconv("return_static_u8", "ptrcall")

	assert_that(GenFfi.accept_static_u8(from_rust), "ffi.accept_static_u8(from_rust)")
	_check_callconv("accept_static_u8", "ptrcall")

	var from_gdscript: int = 255
	var mirrored: int = GenFfi.mirror_static_u8(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_u8", "ptrcall")

func test_ptrcall_static_f32():
	var from_rust: float = GenFfi.return_static_f32()
	_check_callconv("return_static_f32", "ptrcall")

	assert_that(GenFfi.accept_static_f32(from_rust), "ffi.accept_static_f32(from_rust)")
	_check_callconv("accept_static_f32", "ptrcall")

	var from_gdscript: float = 12.5
	var mirrored: float = GenFfi.mirror_static_f32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_f32", "ptrcall")

func test_ptrcall_static_f64():
	var from_rust: float = GenFfi.return_static_f64()
	_check_callconv("return_static_f64", "ptrcall")

	assert_that(GenFfi.accept_static_f64(from_rust), "ffi.accept_static_f64(from_rust)")
	_check_callconv("accept_static_f64", "ptrcall")

	var from_gdscript: float = 127.83156478
	var mirrored: float = GenFfi.mirror_static_f64(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_f64", "ptrcall")

func test_ptrcall_static_bool():
	var from_rust: bool = GenFfi.return_static_bool()
	_check_callconv("return_static_bool", "ptrcall")

	assert_that(GenFfi.accept_static_bool(from_rust), "ffi.accept_static_bool(from_rust)")
	_check_callconv("accept_static_bool", "ptrcall")

	var from_gdscript: bool = true
	var mirrored: bool = GenFfi.mirror_static_bool(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_bool", "ptrcall")

func test_ptrcall_static_color():
	var from_rust: Color = GenFfi.return_static_color()
	_check_callconv("return_static_color", "ptrcall")

	assert_that(GenFfi.accept_static_color(from_rust), "ffi.accept_static_color(from_rust)")
	_check_callconv("accept_static_color", "ptrcall")

	var from_gdscript: Color = Color(0.7, 0.5, 0.3, 0.2)
	var mirrored: Color = GenFfi.mirror_static_color(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_color", "ptrcall")

func test_ptrcall_static_gstring():
	var from_rust: String = GenFfi.return_static_gstring()
	_check_callconv("return_static_gstring", "ptrcall")

	assert_that(GenFfi.accept_static_gstring(from_rust), "ffi.accept_static_gstring(from_rust)")
	_check_callconv("accept_static_gstring", "ptrcall")

	var from_gdscript: String = "hello"
	var mirrored: String = GenFfi.mirror_static_gstring(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_gstring", "ptrcall")

func test_ptrcall_static_stringname():
	var from_rust: StringName = GenFfi.return_static_stringname()
	_check_callconv("return_static_stringname", "ptrcall")

	assert_that(GenFfi.accept_static_stringname(from_rust), "ffi.accept_static_stringname(from_rust)")
	_check_callconv("accept_static_stringname", "ptrcall")

	var from_gdscript: StringName = &"hello"
	var mirrored: StringName = GenFfi.mirror_static_stringname(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_stringname", "ptrcall")

func test_ptrcall_static_nodepath():
	var from_rust: NodePath = GenFfi.return_static_nodepath()
	_check_callconv("return_static_nodepath", "ptrcall")

	assert_that(GenFfi.accept_static_nodepath(from_rust), "ffi.accept_static_nodepath(from_rust)")
	_check_callconv("accept_static_nodepath", "ptrcall")

	var from_gdscript: NodePath = ^"hello"
	var mirrored: NodePath = GenFfi.mirror_static_nodepath(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_nodepath", "ptrcall")

func test_ptrcall_static_vector2():
	var from_rust: Vector2 = GenFfi.return_static_vector2()
	_check_callconv("return_static_vector2", "ptrcall")

	assert_that(GenFfi.accept_static_vector2(from_rust), "ffi.accept_static_vector2(from_rust)")
	_check_callconv("accept_static_vector2", "ptrcall")

	var from_gdscript: Vector2 = Vector2(12.5, -3.5)
	var mirrored: Vector2 = GenFfi.mirror_static_vector2(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_vector2", "ptrcall")

func test_ptrcall_static_vector3():
	var from_rust: Vector3 = GenFfi.return_static_vector3()
	_check_callconv("return_static_vector3", "ptrcall")

	assert_that(GenFfi.accept_static_vector3(from_rust), "ffi.accept_static_vector3(from_rust)")
	_check_callconv("accept_static_vector3", "ptrcall")

	var from_gdscript: Vector3 = Vector3(117.5, 100.0, -323.25)
	var mirrored: Vector3 = GenFfi.mirror_static_vector3(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_vector3", "ptrcall")

func test_ptrcall_static_vector4():
	var from_rust: Vector4 = GenFfi.return_static_vector4()
	_check_callconv("return_static_vector4", "ptrcall")

	assert_that(GenFfi.accept_static_vector4(from_rust), "ffi.accept_static_vector4(from_rust)")
	_check_callconv("accept_static_vector4", "ptrcall")

	var from_gdscript: Vector4 = Vector4(-18.5, 24.75, -1.25, 777.875)
	var mirrored: Vector4 = GenFfi.mirror_static_vector4(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_vector4", "ptrcall")

func test_ptrcall_static_vector2i():
	var from_rust: Vector2i = GenFfi.return_static_vector2i()
	_check_callconv("return_static_vector2i", "ptrcall")

	assert_that(GenFfi.accept_static_vector2i(from_rust), "ffi.accept_static_vector2i(from_rust)")
	_check_callconv("accept_static_vector2i", "ptrcall")

	var from_gdscript: Vector2i = Vector2i(-2147483648, 2147483647)
	var mirrored: Vector2i = GenFfi.mirror_static_vector2i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_vector2i", "ptrcall")

func test_ptrcall_static_vector3i():
	var from_rust: Vector3i = GenFfi.return_static_vector3i()
	_check_callconv("return_static_vector3i", "ptrcall")

	assert_that(GenFfi.accept_static_vector3i(from_rust), "ffi.accept_static_vector3i(from_rust)")
	_check_callconv("accept_static_vector3i", "ptrcall")

	var from_gdscript: Vector3i = Vector3i(-1, -2147483648, 2147483647)
	var mirrored: Vector3i = GenFfi.mirror_static_vector3i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_vector3i", "ptrcall")

func test_ptrcall_static_vector4i():
	var from_rust: Vector4i = GenFfi.return_static_vector4i()
	_check_callconv("return_static_vector4i", "ptrcall")

	assert_that(GenFfi.accept_static_vector4i(from_rust), "ffi.accept_static_vector4i(from_rust)")
	_check_callconv("accept_static_vector4i", "ptrcall")

	var from_gdscript: Vector4i = Vector4i(-1, -2147483648, 2147483647, 1000)
	var mirrored: Vector4i = GenFfi.mirror_static_vector4i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_vector4i", "ptrcall")

func test_ptrcall_static_callable():
	var from_rust: Callable = GenFfi.return_static_callable()
	_check_callconv("return_static_callable", "ptrcall")

	assert_that(GenFfi.accept_static_callable(from_rust), "ffi.accept_static_callable(from_rust)")
	_check_callconv("accept_static_callable", "ptrcall")

	var from_gdscript: Callable = Callable()
	var mirrored: Callable = GenFfi.mirror_static_callable(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_callable", "ptrcall")

func test_ptrcall_static_signal():
	var from_rust: Signal = GenFfi.return_static_signal()
	_check_callconv("return_static_signal", "ptrcall")

	assert_that(GenFfi.accept_static_signal(from_rust), "ffi.accept_static_signal(from_rust)")
	_check_callconv("accept_static_signal", "ptrcall")

	var from_gdscript: Signal = Signal()
	var mirrored: Signal = GenFfi.mirror_static_signal(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_signal", "ptrcall")

func test_ptrcall_static_rect2():
	var from_rust: Rect2 = GenFfi.return_static_rect2()
	_check_callconv("return_static_rect2", "ptrcall")

	assert_that(GenFfi.accept_static_rect2(from_rust), "ffi.accept_static_rect2(from_rust)")
	_check_callconv("accept_static_rect2", "ptrcall")

	var from_gdscript: Rect2 = Rect2()
	var mirrored: Rect2 = GenFfi.mirror_static_rect2(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_rect2", "ptrcall")

func test_ptrcall_static_rect2i():
	var from_rust: Rect2i = GenFfi.return_static_rect2i()
	_check_callconv("return_static_rect2i", "ptrcall")

	assert_that(GenFfi.accept_static_rect2i(from_rust), "ffi.accept_static_rect2i(from_rust)")
	_check_callconv("accept_static_rect2i", "ptrcall")

	var from_gdscript: Rect2i = Rect2i()
	var mirrored: Rect2i = GenFfi.mirror_static_rect2i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_rect2i", "ptrcall")

func test_ptrcall_static_transform2d():
	var from_rust: Transform2D = GenFfi.return_static_transform2d()
	_check_callconv("return_static_transform2d", "ptrcall")

	assert_that(GenFfi.accept_static_transform2d(from_rust), "ffi.accept_static_transform2d(from_rust)")
	_check_callconv("accept_static_transform2d", "ptrcall")

	var from_gdscript: Transform2D = Transform2D()
	var mirrored: Transform2D = GenFfi.mirror_static_transform2d(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_transform2d", "ptrcall")

func test_ptrcall_static_plane():
	var from_rust: Plane = GenFfi.return_static_plane()
	_check_callconv("return_static_plane", "ptrcall")

	assert_that(GenFfi.accept_static_plane(from_rust), "ffi.accept_static_plane(from_rust)")
	_check_callconv("accept_static_plane", "ptrcall")

	var from_gdscript: Plane = Plane()
	var mirrored: Plane = GenFfi.mirror_static_plane(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_plane", "ptrcall")

func test_ptrcall_static_quaternion():
	var from_rust: Quaternion = GenFfi.return_static_quaternion()
	_check_callconv("return_static_quaternion", "ptrcall")

	assert_that(GenFfi.accept_static_quaternion(from_rust), "ffi.accept_static_quaternion(from_rust)")
	_check_callconv("accept_static_quaternion", "ptrcall")

	var from_gdscript: Quaternion = Quaternion()
	var mirrored: Quaternion = GenFfi.mirror_static_quaternion(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_quaternion", "ptrcall")

func test_ptrcall_static_aabb():
	var from_rust: AABB = GenFfi.return_static_aabb()
	_check_callconv("return_static_aabb", "ptrcall")

	assert_that(GenFfi.accept_static_aabb(from_rust), "ffi.accept_static_aabb(from_rust)")
	_check_callconv("accept_static_aabb", "ptrcall")

	var from_gdscript: AABB = AABB()
	var mirrored: AABB = GenFfi.mirror_static_aabb(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_aabb", "ptrcall")

func test_ptrcall_static_basis():
	var from_rust: Basis = GenFfi.return_static_basis()
	_check_callconv("return_static_basis", "ptrcall")

	assert_that(GenFfi.accept_static_basis(from_rust), "ffi.accept_static_basis(from_rust)")
	_check_callconv("accept_static_basis", "ptrcall")

	var from_gdscript: Basis = Basis()
	var mirrored: Basis = GenFfi.mirror_static_basis(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_basis", "ptrcall")

func test_ptrcall_static_transform3d():
	var from_rust: Transform3D = GenFfi.return_static_transform3d()
	_check_callconv("return_static_transform3d", "ptrcall")

	assert_that(GenFfi.accept_static_transform3d(from_rust), "ffi.accept_static_transform3d(from_rust)")
	_check_callconv("accept_static_transform3d", "ptrcall")

	var from_gdscript: Transform3D = Transform3D()
	var mirrored: Transform3D = GenFfi.mirror_static_transform3d(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_transform3d", "ptrcall")

func test_ptrcall_static_projection():
	var from_rust: Projection = GenFfi.return_static_projection()
	_check_callconv("return_static_projection", "ptrcall")

	assert_that(GenFfi.accept_static_projection(from_rust), "ffi.accept_static_projection(from_rust)")
	_check_callconv("accept_static_projection", "ptrcall")

	var from_gdscript: Projection = Projection()
	var mirrored: Projection = GenFfi.mirror_static_projection(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_projection", "ptrcall")

func test_ptrcall_static_rid():
	var from_rust: RID = GenFfi.return_static_rid()
	_check_callconv("return_static_rid", "ptrcall")

	assert_that(GenFfi.accept_static_rid(from_rust), "ffi.accept_static_rid(from_rust)")
	_check_callconv("accept_static_rid", "ptrcall")

	var from_gdscript: RID = RID()
	var mirrored: RID = GenFfi.mirror_static_rid(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_rid", "ptrcall")

func test_ptrcall_static_option_gd_node():
	var from_rust: Node = GenFfi.return_static_option_gd_node()
	_check_callconv("return_static_option_gd_node", "ptrcall")

	assert_that(GenFfi.accept_static_option_gd_node(from_rust), "ffi.accept_static_option_gd_node(from_rust)")
	_check_callconv("accept_static_option_gd_node", "ptrcall")

	var from_gdscript: Node = null
	var mirrored: Node = GenFfi.mirror_static_option_gd_node(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_option_gd_node", "ptrcall")

func test_ptrcall_static_option_gd_resource():
	var from_rust: Resource = GenFfi.return_static_option_gd_resource()
	_check_callconv("return_static_option_gd_resource", "ptrcall")

	assert_that(GenFfi.accept_static_option_gd_resource(from_rust), "ffi.accept_static_option_gd_resource(from_rust)")
	_check_callconv("accept_static_option_gd_resource", "ptrcall")

	var from_gdscript: Resource = null
	var mirrored: Resource = GenFfi.mirror_static_option_gd_resource(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_option_gd_resource", "ptrcall")

func test_ptrcall_static_packedbytearray():
	var from_rust: PackedByteArray = GenFfi.return_static_packedbytearray()
	_check_callconv("return_static_packedbytearray", "ptrcall")

	assert_that(GenFfi.accept_static_packedbytearray(from_rust), "ffi.accept_static_packedbytearray(from_rust)")
	_check_callconv("accept_static_packedbytearray", "ptrcall")

	var from_gdscript: PackedByteArray = PackedByteArray()
	var mirrored: PackedByteArray = GenFfi.mirror_static_packedbytearray(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_packedbytearray", "ptrcall")

func test_ptrcall_static_packedint32array():
	var from_rust: PackedInt32Array = GenFfi.return_static_packedint32array()
	_check_callconv("return_static_packedint32array", "ptrcall")

	assert_that(GenFfi.accept_static_packedint32array(from_rust), "ffi.accept_static_packedint32array(from_rust)")
	_check_callconv("accept_static_packedint32array", "ptrcall")

	var from_gdscript: PackedInt32Array = PackedInt32Array()
	var mirrored: PackedInt32Array = GenFfi.mirror_static_packedint32array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_packedint32array", "ptrcall")

func test_ptrcall_static_packedint64array():
	var from_rust: PackedInt64Array = GenFfi.return_static_packedint64array()
	_check_callconv("return_static_packedint64array", "ptrcall")

	assert_that(GenFfi.accept_static_packedint64array(from_rust), "ffi.accept_static_packedint64array(from_rust)")
	_check_callconv("accept_static_packedint64array", "ptrcall")

	var from_gdscript: PackedInt64Array = PackedInt64Array()
	var mirrored: PackedInt64Array = GenFfi.mirror_static_packedint64array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_packedint64array", "ptrcall")

func test_ptrcall_static_packedfloat32array():
	var from_rust: PackedFloat32Array = GenFfi.return_static_packedfloat32array()
	_check_callconv("return_static_packedfloat32array", "ptrcall")

	assert_that(GenFfi.accept_static_packedfloat32array(from_rust), "ffi.accept_static_packedfloat32array(from_rust)")
	_check_callconv("accept_static_packedfloat32array", "ptrcall")

	var from_gdscript: PackedFloat32Array = PackedFloat32Array()
	var mirrored: PackedFloat32Array = GenFfi.mirror_static_packedfloat32array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_packedfloat32array", "ptrcall")

func test_ptrcall_static_packedfloat64array():
	var from_rust: PackedFloat64Array = GenFfi.return_static_packedfloat64array()
	_check_callconv("return_static_packedfloat64array", "ptrcall")

	assert_that(GenFfi.accept_static_packedfloat64array(from_rust), "ffi.accept_static_packedfloat64array(from_rust)")
	_check_callconv("accept_static_packedfloat64array", "ptrcall")

	var from_gdscript: PackedFloat64Array = PackedFloat64Array()
	var mirrored: PackedFloat64Array = GenFfi.mirror_static_packedfloat64array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_packedfloat64array", "ptrcall")

func test_ptrcall_static_packedstringarray():
	var from_rust: PackedStringArray = GenFfi.return_static_packedstringarray()
	_check_callconv("return_static_packedstringarray", "ptrcall")

	assert_that(GenFfi.accept_static_packedstringarray(from_rust), "ffi.accept_static_packedstringarray(from_rust)")
	_check_callconv("accept_static_packedstringarray", "ptrcall")

	var from_gdscript: PackedStringArray = PackedStringArray()
	var mirrored: PackedStringArray = GenFfi.mirror_static_packedstringarray(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_packedstringarray", "ptrcall")

func test_ptrcall_static_packedvector2array():
	var from_rust: PackedVector2Array = GenFfi.return_static_packedvector2array()
	_check_callconv("return_static_packedvector2array", "ptrcall")

	assert_that(GenFfi.accept_static_packedvector2array(from_rust), "ffi.accept_static_packedvector2array(from_rust)")
	_check_callconv("accept_static_packedvector2array", "ptrcall")

	var from_gdscript: PackedVector2Array = PackedVector2Array()
	var mirrored: PackedVector2Array = GenFfi.mirror_static_packedvector2array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_packedvector2array", "ptrcall")

func test_ptrcall_static_packedvector3array():
	var from_rust: PackedVector3Array = GenFfi.return_static_packedvector3array()
	_check_callconv("return_static_packedvector3array", "ptrcall")

	assert_that(GenFfi.accept_static_packedvector3array(from_rust), "ffi.accept_static_packedvector3array(from_rust)")
	_check_callconv("accept_static_packedvector3array", "ptrcall")

	var from_gdscript: PackedVector3Array = PackedVector3Array()
	var mirrored: PackedVector3Array = GenFfi.mirror_static_packedvector3array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_packedvector3array", "ptrcall")

func test_ptrcall_static_packedvector4array():
	var from_rust: PackedVector4Array = GenFfi.return_static_packedvector4array()
	_check_callconv("return_static_packedvector4array", "ptrcall")

	assert_that(GenFfi.accept_static_packedvector4array(from_rust), "ffi.accept_static_packedvector4array(from_rust)")
	_check_callconv("accept_static_packedvector4array", "ptrcall")

	var from_gdscript: PackedVector4Array = PackedVector4Array()
	var mirrored: PackedVector4Array = GenFfi.mirror_static_packedvector4array(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_packedvector4array", "ptrcall")

func test_ptrcall_static_packedcolorarray():
	var from_rust: PackedColorArray = GenFfi.return_static_packedcolorarray()
	_check_callconv("return_static_packedcolorarray", "ptrcall")

	assert_that(GenFfi.accept_static_packedcolorarray(from_rust), "ffi.accept_static_packedcolorarray(from_rust)")
	_check_callconv("accept_static_packedcolorarray", "ptrcall")

	var from_gdscript: PackedColorArray = PackedColorArray()
	var mirrored: PackedColorArray = GenFfi.mirror_static_packedcolorarray(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_packedcolorarray", "ptrcall")

func test_ptrcall_static_newi64():
	var from_rust: int = GenFfi.return_static_newi64()
	_check_callconv("return_static_newi64", "ptrcall")

	assert_that(GenFfi.accept_static_newi64(from_rust), "ffi.accept_static_newi64(from_rust)")
	_check_callconv("accept_static_newi64", "ptrcall")

	var from_gdscript: int = -922337203685477580
	var mirrored: int = GenFfi.mirror_static_newi64(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newi64", "ptrcall")

func test_ptrcall_static_newi32():
	var from_rust: int = GenFfi.return_static_newi32()
	_check_callconv("return_static_newi32", "ptrcall")

	assert_that(GenFfi.accept_static_newi32(from_rust), "ffi.accept_static_newi32(from_rust)")
	_check_callconv("accept_static_newi32", "ptrcall")

	var from_gdscript: int = -2147483648
	var mirrored: int = GenFfi.mirror_static_newi32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newi32", "ptrcall")

func test_ptrcall_static_newu32():
	var from_rust: int = GenFfi.return_static_newu32()
	_check_callconv("return_static_newu32", "ptrcall")

	assert_that(GenFfi.accept_static_newu32(from_rust), "ffi.accept_static_newu32(from_rust)")
	_check_callconv("accept_static_newu32", "ptrcall")

	var from_gdscript: int = 4294967295
	var mirrored: int = GenFfi.mirror_static_newu32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newu32", "ptrcall")

func test_ptrcall_static_newi16():
	var from_rust: int = GenFfi.return_static_newi16()
	_check_callconv("return_static_newi16", "ptrcall")

	assert_that(GenFfi.accept_static_newi16(from_rust), "ffi.accept_static_newi16(from_rust)")
	_check_callconv("accept_static_newi16", "ptrcall")

	var from_gdscript: int = -32767
	var mirrored: int = GenFfi.mirror_static_newi16(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newi16", "ptrcall")

func test_ptrcall_static_newu16():
	var from_rust: int = GenFfi.return_static_newu16()
	_check_callconv("return_static_newu16", "ptrcall")

	assert_that(GenFfi.accept_static_newu16(from_rust), "ffi.accept_static_newu16(from_rust)")
	_check_callconv("accept_static_newu16", "ptrcall")

	var from_gdscript: int = 65535
	var mirrored: int = GenFfi.mirror_static_newu16(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newu16", "ptrcall")

func test_ptrcall_static_newi8():
	var from_rust: int = GenFfi.return_static_newi8()
	_check_callconv("return_static_newi8", "ptrcall")

	assert_that(GenFfi.accept_static_newi8(from_rust), "ffi.accept_static_newi8(from_rust)")
	_check_callconv("accept_static_newi8", "ptrcall")

	var from_gdscript: int = -128
	var mirrored: int = GenFfi.mirror_static_newi8(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newi8", "ptrcall")

func test_ptrcall_static_newu8():
	var from_rust: int = GenFfi.return_static_newu8()
	_check_callconv("return_static_newu8", "ptrcall")

	assert_that(GenFfi.accept_static_newu8(from_rust), "ffi.accept_static_newu8(from_rust)")
	_check_callconv("accept_static_newu8", "ptrcall")

	var from_gdscript: int = 255
	var mirrored: int = GenFfi.mirror_static_newu8(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newu8", "ptrcall")

func test_ptrcall_static_newf32():
	var from_rust: float = GenFfi.return_static_newf32()
	_check_callconv("return_static_newf32", "ptrcall")

	assert_that(GenFfi.accept_static_newf32(from_rust), "ffi.accept_static_newf32(from_rust)")
	_check_callconv("accept_static_newf32", "ptrcall")

	var from_gdscript: float = 12.5
	var mirrored: float = GenFfi.mirror_static_newf32(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newf32", "ptrcall")

func test_ptrcall_static_newf64():
	var from_rust: float = GenFfi.return_static_newf64()
	_check_callconv("return_static_newf64", "ptrcall")

	assert_that(GenFfi.accept_static_newf64(from_rust), "ffi.accept_static_newf64(from_rust)")
	_check_callconv("accept_static_newf64", "ptrcall")

	var from_gdscript: float = 127.83156478
	var mirrored: float = GenFfi.mirror_static_newf64(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newf64", "ptrcall")

func test_ptrcall_static_newbool():
	var from_rust: bool = GenFfi.return_static_newbool()
	_check_callconv("return_static_newbool", "ptrcall")

	assert_that(GenFfi.accept_static_newbool(from_rust), "ffi.accept_static_newbool(from_rust)")
	_check_callconv("accept_static_newbool", "ptrcall")

	var from_gdscript: bool = true
	var mirrored: bool = GenFfi.mirror_static_newbool(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newbool", "ptrcall")

func test_ptrcall_static_newcolor():
	var from_rust: Color = GenFfi.return_static_newcolor()
	_check_callconv("return_static_newcolor", "ptrcall")

	assert_that(GenFfi.accept_static_newcolor(from_rust), "ffi.accept_static_newcolor(from_rust)")
	_check_callconv("accept_static_newcolor", "ptrcall")

	var from_gdscript: Color = Color(0.7, 0.5, 0.3, 0.2)
	var mirrored: Color = GenFfi.mirror_static_newcolor(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newcolor", "ptrcall")

func test_ptrcall_static_newstring():
	var from_rust: String = GenFfi.return_static_newstring()
	_check_callconv("return_static_newstring", "ptrcall")

	assert_that(GenFfi.accept_static_newstring(from_rust), "ffi.accept_static_newstring(from_rust)")
	_check_callconv("accept_static_newstring", "ptrcall")

	var from_gdscript: String = "hello"
	var mirrored: String = GenFfi.mirror_static_newstring(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newstring", "ptrcall")

func test_ptrcall_static_newstringname():
	var from_rust: StringName = GenFfi.return_static_newstringname()
	_check_callconv("return_static_newstringname", "ptrcall")

	assert_that(GenFfi.accept_static_newstringname(from_rust), "ffi.accept_static_newstringname(from_rust)")
	_check_callconv("accept_static_newstringname", "ptrcall")

	var from_gdscript: StringName = &"hello"
	var mirrored: StringName = GenFfi.mirror_static_newstringname(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newstringname", "ptrcall")

func test_ptrcall_static_newnodepath():
	var from_rust: NodePath = GenFfi.return_static_newnodepath()
	_check_callconv("return_static_newnodepath", "ptrcall")

	assert_that(GenFfi.accept_static_newnodepath(from_rust), "ffi.accept_static_newnodepath(from_rust)")
	_check_callconv("accept_static_newnodepath", "ptrcall")

	var from_gdscript: NodePath = ^"hello"
	var mirrored: NodePath = GenFfi.mirror_static_newnodepath(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newnodepath", "ptrcall")

func test_ptrcall_static_newvector2():
	var from_rust: Vector2 = GenFfi.return_static_newvector2()
	_check_callconv("return_static_newvector2", "ptrcall")

	assert_that(GenFfi.accept_static_newvector2(from_rust), "ffi.accept_static_newvector2(from_rust)")
	_check_callconv("accept_static_newvector2", "ptrcall")

	var from_gdscript: Vector2 = Vector2(12.5, -3.5)
	var mirrored: Vector2 = GenFfi.mirror_static_newvector2(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newvector2", "ptrcall")

func test_ptrcall_static_newvector3():
	var from_rust: Vector3 = GenFfi.return_static_newvector3()
	_check_callconv("return_static_newvector3", "ptrcall")

	assert_that(GenFfi.accept_static_newvector3(from_rust), "ffi.accept_static_newvector3(from_rust)")
	_check_callconv("accept_static_newvector3", "ptrcall")

	var from_gdscript: Vector3 = Vector3(117.5, 100.0, -323.25)
	var mirrored: Vector3 = GenFfi.mirror_static_newvector3(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newvector3", "ptrcall")

func test_ptrcall_static_newvector4():
	var from_rust: Vector4 = GenFfi.return_static_newvector4()
	_check_callconv("return_static_newvector4", "ptrcall")

	assert_that(GenFfi.accept_static_newvector4(from_rust), "ffi.accept_static_newvector4(from_rust)")
	_check_callconv("accept_static_newvector4", "ptrcall")

	var from_gdscript: Vector4 = Vector4(-18.5, 24.75, -1.25, 777.875)
	var mirrored: Vector4 = GenFfi.mirror_static_newvector4(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newvector4", "ptrcall")

func test_ptrcall_static_newvector2i():
	var from_rust: Vector2i = GenFfi.return_static_newvector2i()
	_check_callconv("return_static_newvector2i", "ptrcall")

	assert_that(GenFfi.accept_static_newvector2i(from_rust), "ffi.accept_static_newvector2i(from_rust)")
	_check_callconv("accept_static_newvector2i", "ptrcall")

	var from_gdscript: Vector2i = Vector2i(-2147483648, 2147483647)
	var mirrored: Vector2i = GenFfi.mirror_static_newvector2i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newvector2i", "ptrcall")

func test_ptrcall_static_newvector3i():
	var from_rust: Vector3i = GenFfi.return_static_newvector3i()
	_check_callconv("return_static_newvector3i", "ptrcall")

	assert_that(GenFfi.accept_static_newvector3i(from_rust), "ffi.accept_static_newvector3i(from_rust)")
	_check_callconv("accept_static_newvector3i", "ptrcall")

	var from_gdscript: Vector3i = Vector3i(-1, -2147483648, 2147483647)
	var mirrored: Vector3i = GenFfi.mirror_static_newvector3i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newvector3i", "ptrcall")

func test_ptrcall_static_newvector4i():
	var from_rust: Vector4i = GenFfi.return_static_newvector4i()
	_check_callconv("return_static_newvector4i", "ptrcall")

	assert_that(GenFfi.accept_static_newvector4i(from_rust), "ffi.accept_static_newvector4i(from_rust)")
	_check_callconv("accept_static_newvector4i", "ptrcall")

	var from_gdscript: Vector4i = Vector4i(-1, -2147483648, 2147483647, 1)
	var mirrored: Vector4i = GenFfi.mirror_static_newvector4i(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newvector4i", "ptrcall")

func test_ptrcall_static_newcallable():
	var from_rust: Callable = GenFfi.return_static_newcallable()
	_check_callconv("return_static_newcallable", "ptrcall")

	assert_that(GenFfi.accept_static_newcallable(from_rust), "ffi.accept_static_newcallable(from_rust)")
	_check_callconv("accept_static_newcallable", "ptrcall")

	var from_gdscript: Callable = Callable()
	var mirrored: Callable = GenFfi.mirror_static_newcallable(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_newcallable", "ptrcall")

func test_ptrcall_static_variantarray():
	var from_rust: Array = GenFfi.return_static_variantarray()
	_check_callconv("return_static_variantarray", "ptrcall")

	assert_that(GenFfi.accept_static_variantarray(from_rust), "ffi.accept_static_variantarray(from_rust)")
	_check_callconv("accept_static_variantarray", "ptrcall")

	var from_gdscript: Array = [-7, "godot", false, Vector2i(-77, 88)]
	var mirrored: Array = GenFfi.mirror_static_variantarray(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_variantarray", "ptrcall")

func test_ptrcall_static_dictionary():
	var from_rust: Dictionary = GenFfi.return_static_dictionary()
	_check_callconv("return_static_dictionary", "ptrcall")

	assert_that(GenFfi.accept_static_dictionary(from_rust), "ffi.accept_static_dictionary(from_rust)")
	_check_callconv("accept_static_dictionary", "ptrcall")

	var from_gdscript: Dictionary = {"key": 83, -3: Vector2(1, 2), 0.03: true}
	var mirrored: Dictionary = GenFfi.mirror_static_dictionary(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_dictionary", "ptrcall")

func test_ptrcall_static_instanceid():
	var from_rust: int = GenFfi.return_static_instanceid()
	_check_callconv("return_static_instanceid", "ptrcall")

	assert_that(GenFfi.accept_static_instanceid(from_rust), "ffi.accept_static_instanceid(from_rust)")
	_check_callconv("accept_static_instanceid", "ptrcall")

	var from_gdscript: int = -1
	var mirrored: int = GenFfi.mirror_static_instanceid(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_instanceid", "ptrcall")

func test_ptrcall_static_variant():
	var from_rust: Variant = GenFfi.return_static_variant()
	_check_callconv("return_static_variant", "ptrcall")

	assert_that(GenFfi.accept_static_variant(from_rust), "ffi.accept_static_variant(from_rust)")
	_check_callconv("accept_static_variant", "ptrcall")

	var from_gdscript: Variant = 123
	var mirrored: Variant = GenFfi.mirror_static_variant(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_variant", "ptrcall")

func test_ptrcall_static_error():
	var from_rust: int = GenFfi.return_static_error()
	_check_callconv("return_static_error", "ptrcall")

	assert_that(GenFfi.accept_static_error(from_rust), "ffi.accept_static_error(from_rust)")
	_check_callconv("accept_static_error", "ptrcall")

	var from_gdscript: int = 0
	var mirrored: int = GenFfi.mirror_static_error(from_gdscript)
	assert_eq(mirrored, from_gdscript, "mirrored_static == from_gdscript")
	_check_callconv("mirror_static_error", "ptrcall")


func _check_callconv(function: String, expected: String) -> void:
	# Godot does not yet implement ptrcall for functions that involve at least 1 parameter of type Variant
	# (interestingly not a return value).
	if function in ["accept_variant", "mirror_variant", "accept_static_variant", "mirror_static_variant"]:
		# This test deliberately fails in case Godot implements support for either of the above, to notify us.
		expected = "varcall"

	var ok = GenFfi.check_last_notrace(function, expected)

	# A lot of this has only been fixed for Godot 4.3; tracking regressions for older versions doesn't make much sense.
	# Do not move version check to the beginning -- traced function needs to be popped.
	if Engine.get_version_info().minor >= 3:
		assert_that(ok, str("calling convention mismatch in function '", function, "'"))
