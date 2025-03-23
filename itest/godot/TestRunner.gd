# Copyright (c) godot-rust; Bromeon and contributors.
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

@tool # To ensure that itest is not run from the editor; see below.

extends Node
class_name GDScriptTestRunner

func _ready():
	# Check that tests are invoked from the command line. Loading the editor may break some parts (e.g. generated test code).
	# Both checks are needed (it's possible to invoke `godot -e --headless`).
	if Engine.is_editor_hint() || DisplayServer.get_name() != 'headless':
		push_error("Integration tests must be run in headless mode (without editor).")
		get_tree().quit(2)
		return

	# Ensure physics is initialized, for tests that require it.
	await get_tree().physics_frame

	var allow_focus := true
	var filters: Array = []
	var unrecognized_args: Array = []
	for arg in OS.get_cmdline_user_args():
		match arg:
			"--disallow-focus":
				allow_focus = false
			_:
				if not arg.begins_with("[") or not arg.ends_with("]"):
					unrecognized_args.push_back(arg)

				var args = arg.lstrip("[").rstrip("]").split(",")
				filters.append_array(args)

	if unrecognized_args:
		push_error("Unrecognized arguments: ", unrecognized_args)
		get_tree().quit(2)
		return

	var rust_runner = IntegrationTests.new()

	# Run benchmarks after all synchronous and asynchronous tests have completed.
	var run_benchmarks = func (success: bool):
		if success:
			rust_runner.run_all_benchmarks(self)

		var exit_code: int = 0 if success else 1
		get_tree().quit(exit_code)

	rust_runner.run_all_tests(
		allow_focus,
		self,
		filters,

		run_benchmarks
	)



class GDScriptTestCase:
	var suite: Object
	var method_name: String
	var suite_name: String
	
	func _init(suite: Object, method_name: String):
		self.suite = suite
		self.method_name = method_name
		self.suite_name = _suite_name(suite)

	func run():
		push_error("run unimplemented")
		return false
	
	static func _suite_name(suite: Object) -> String:
		var script: GDScript = suite.get_script()
		return str(script.resource_path.get_file().get_basename(), ".gd")

# Standard test case used for whenever something can be tested by just running a GDScript function.
class GDScriptExecutableTestCase extends GDScriptTestCase:
	func run():
		# This is a no-op if the suite doesn't have this property.
		suite.set("_assertion_failed", false)
		var result = suite.call(method_name)
		var ok: bool = (result == true or result == null) and not suite.get("_assertion_failed")
		return ok

# Hardcoded test case used for special cases where the standard testing API is not sufficient.
#
# Stores the errors generated during the execution, so they can be printed when it is appropriate to do so.
# As we may not run this test case at the time we say we do in the terminal.
class GDScriptHardcodedTestCase extends GDScriptTestCase:
	# Errors generated during execution of the test.
	var errors: Array[String] = []
	var execution_time_seconds: float = 0
	var result: bool = false

	func run():
		return result
