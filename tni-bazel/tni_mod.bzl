load("@bazel_skylib//rules:copy_file.bzl", "copy_file")
load("@rules_pkg//pkg:zip.bzl", "pkg_zip")

def _tni_sandbox_transition_impl(settings, attr):
    return {
        "//command_line_option:platforms": "//tni-bazel:tni-sandbox",
        "//command_line_option:copt": settings["//command_line_option:copt"] + [
            "-Oz",
            "-march=rv64gcv_zba_zbb_zbs_zbc",
            "-fno-stack-protector",
            "-fno-threadsafe-statics",
        ],
    }

tni_sandbox_transition = transition(
    implementation = _tni_sandbox_transition_impl,
    inputs = ["//command_line_option:copt"],
    outputs = ["//command_line_option:platforms", "//command_line_option:copt"],
)

def _tni_mod_dir_impl(ctx):
    p = ctx.actions.declare_file("package/mod.jsonc")
    program = ctx.actions.declare_file("package/entry.elf")

    ctx.actions.symlink(
        output = p,
        target_file = ctx.file.json,
    )

    ctx.actions.symlink(
        output = program,
        target_file = ctx.file.program,
    )

    return DefaultInfo(
        files = depset([p, program]),
    )

tni_mod_dir = rule(
    implementation = _tni_mod_dir_impl,
    attrs = {
        "json": attr.label(mandatory = True, allow_single_file = [".jsonc"]),
        "program": attr.label(mandatory = True, allow_single_file = True),
    },
    cfg = tni_sandbox_transition,
)

def _tni_mod_impl(name, visibility, program, json, **kwargs):
    tni_mod_dir(
        name = name,
        json = json,
        program = program,
    )

    pkg_zip(
        name = name + ".zip",
        out = name + ".zip",
        srcs = [name],
    )

tni_mod = macro(
    implementation = _tni_mod_impl,
    attrs = {
        "program": attr.label(mandatory = True),
        "json": attr.label(mandatory = True, configurable = False),
    },
)
