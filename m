Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718539;
	b=A+VDL+wbgQT0wc1TSPeNOX8OtlFT7s9GM+2QmEt+pRgbPf53fian7zsMxqb9mvUlqcEF
	 wBC1Q1tWTgmxDj3057Whn6GLE54kXLWFeIZc6I2SdSnMX8iLWQGdC3IJDaEqgDT2Pq2TQ
	 wbMmml9TjTOcco29fykhb2R288jmPeOO+2H7F/hP/kUXOoDPhtIOWS+BvKm3d7retOWNM
	 Bkw7kPLCjp/3Ti7B68/dRjIcD2HYlL6+fUB5Aj4C0jIsVeaj/IyNS7vWbBqxVmNwQ7h8t
	 PNg3RvN4OF182O0jFSqIlmGg/gtPhMU2879p1HlVeKdmW4pPestM6ow2OGQVQTS/c5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Dp6aJNGB8lo0vS7oBSbCWY8gtENxx6aHpIo+LlsAank=;
	b=vIbSXMElRJUyiKhYH7oUGdz0u+/snnkYolqk4fkM3wGYWMOfMjkx4Hp4l6/0O4H8X9o9
	 OJ/kE//CH5vEqk49jpeKr2PwSnG5PXPcGtWjMSBNZyFRs4p9opNQ+Gvc94Fh6mAElWMPv
	 atAMIHYzBAyuAI9BUM7+9vLUV55ghd1hlCtZLvEowmfeKCbNDerSaou7BTkbMpGQp9bLf
	 rMXPyGsrI+h0eqqyKeUMh2QsLEHvoGCiIbzZVKPA6TOQw96cheuOTNEFt2RJNoT1S4HKo
	 bDYd3lVgvWsq29pBPcqRC8MgLX54ydV7W/Rclyl5QSxaPdWvUolweM99/rb0AtnoDgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dw4SVkPI;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C945606EEB2
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 15:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C945606EEB2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dw4SVkPI
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4a75a5fa32dso1030632fac.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 07:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718537; x=1794323337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dp6aJNGB8lo0vS7oBSbCWY8gtENxx6aHpIo+LlsAank=;
        b=dw4SVkPIAhGVb8A5bqDSuAhmBFZVLL288jS/9HXRAGHmPCAolOsl1cBL9PtoAZxpJ6
         TkMg++r3BTb5CWOPAMHxBTDCGxKoL0W+Xk9xJCvIIsBnbXn3YU6dpeqj6FJ+rb0MvRZl
         +EhF2V65djYkf0hhTsNmlM1kvPV3y8qqGGU3+57LQTP2mBNlE+WwCRiJwup0FPn/fbbI
         67bT5ALaB83KuKJYXruBHVpFEjXVX8phfg1eb6sEfoQVPtEIguISF/9Yt0pCDxuL3+ss
         VRKN0qdOdxGyhjZ0ko3dZxHPenmGLCRh8+8zRDwP4wclatBm5AMkNBKYlFnK9e2sgdY+
         B2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718537; x=1794323337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dp6aJNGB8lo0vS7oBSbCWY8gtENxx6aHpIo+LlsAank=;
        b=lKFHlLsUH9dUnI2633IqwqlsQpD7BSkE0P0e2Cd0Q30980Bun/GpdhTKkquM5s552G
         /K1BW5mI0u/Q/9auRnGihiIxbETXPekkN0LCpzJxD95bpCGhsyi5lv5+v3e7cA9dcY5s
         ynA5SVarhQlkXZ+Ob1BG+e21ds8QaIgExsvWLJ1UFbk/5LeiLhq8kFyuC4uykMYwJGfy
         xxiNeylF7y25/LcsIyuT+QxOhK4JnJSbksJ7mUFH7W1m5ffKymwQ/ejFXYtC6tuXa1cK
         W9FIN8Vs8417UAVMgTBo4xVO56DdF33GngYlCmkqSMdF6ot5XZcwjJH4RqZxvOI8Ye2x
         0eBw==
X-Gm-Message-State: APuU4Z9DznUqvkzyMdER9K46mQA0yi3o+dtMqhWEhO/BGLaqrN5YGc/W
	qrunZW/A1AUhjvqrNsmq3z8zRF949sxbgE4yIsc9yPEZ9Lyl7aw1Yt/L
X-Gm-Gg: AYBFou2HdsFOKvmZ8iOyNEf5Kwn2yIRp6hfVau2HFfb7hiNevDfGt9tYKmwNhWG8hDX
	G8qdqrVbc2hlqCFLIo5YmQjGNbQbA839kimlgOMQWPrKKbetP+v6bVjA1E0g8Xc5CMnG/y5ewvm
	zeItWmRIScC75mJc8UH/o3z8HYTLzkY+51pPnxNIoV1SKt2oktu023hCYiIhYK6fVasPBfyQjBY
	+fau2OBmvmLIGnHlhlSUM9K5YMo1AwSOSyLuYC69Hf90SOCsHEv5PjNFBFB8U2/kHwMXfnTHaQG
	1RJW/1OT9KKlB4QjNcNMaVI9/DtHYjO6eTk4cNbTJoSO0VTED8gCeQC2CGqRLjZIEiyevMIdcDm
	3HLOL2k9sWf2UL5nunstGakfYOgsVG5PlfvglNe2vHZEN1Bvai5QQ23UyqvFIxFB9oE7XE8i+5q
	HjA6Fy0n1C0IRKmIP8jzmR4dci5cqD320vrtZWwoP0iBXcqrTwMwOnnw/84oCtgb4zAr4gaStXC
	/G3csfx3DPa3lgujSnQ9W+h5BN8wIApCReGuxokIKz2hhF/7yjXUaiTH+YefHhHmF9zBNm7deL7
	4/xkXun/ffNnPmqN/VNMOMux2pz/pQlDgdLKTWg=
X-Received: by 2002:a05:6870:8a07:b0:48f:e0f6:c45c with SMTP id 586e51a60fabf-4a90771acb3mr7517359fac.42.1793718536446;
        Tue, 03 Nov 2026 07:08:56 -0800 (PST)
Received: from penguin.lxd ([2605:3f84:842:3300:216:3eff:fe58:9322])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a95d970b9bsm4730448fac.8.2026.11.03.07.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:08:54 -0800 (PST)
From: Matthew Weber <matthew.l.weber@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	kasan-dev@googlegroups.com,
	Matthew Weber <matthew.l.weber@gmail.com>
Subject: [PATCH 2/4] scripts: Add kernel-sloc helper script
Date: Tue,  3 Nov 2026 09:08:43 -0600
Message-Id: <20261103150845.13008-3-matthew.l.weber@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261103150845.13008-1-matthew.l.weber@gmail.com>
References: <20261103150845.13008-1-matthew.l.weber@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a helper script scripts/kernel-sloc to count source lines of code
(SLOC) for a configured Linux kernel build. It supports counting whole
compiled sources from compile_commands.json as well as estimating
distinct source lines represented in a vmlinux ELF using DWARF
line-table addresses.

It is intended for system integrators and application developers who
analyze a trimmed kernel, for example for safety critical applications,
and need to report how much kernel code a given configuration builds
and links. Add a MAINTAINERS entry for the script.

Signed-off-by: Matthew Weber <matthew.l.weber@gmail.com>
---
 MAINTAINERS         |   6 +
 scripts/kernel-sloc | 299 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 305 insertions(+)
 create mode 100755 scripts/kernel-sloc

diff --git a/MAINTAINERS b/MAINTAINERS
index d009e2da2..d83f37c3a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13762,6 +13762,12 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git
 F:	Documentation/dev-tools/kselftest*
 F:	tools/testing/selftests/
 
+KERNEL SLOC HELPER
+M:	Matthew Weber <matthew.l.weber@gmail.com>
+L:	linux-kbuild@vger.kernel.org
+S:	Maintained
+F:	scripts/kernel-sloc
+
 KERNEL SMB3 SERVER (KSMBD)
 M:	Namjae Jeon <linkinjeon@kernel.org>
 M:	Namjae Jeon <linkinjeon@samba.org>
diff --git a/scripts/kernel-sloc b/scripts/kernel-sloc
new file mode 100755
index 000000000..ed8b787e5
--- /dev/null
+++ b/scripts/kernel-sloc
@@ -0,0 +1,299 @@
+#!/bin/sh
+# SPDX-License-Identifier: BSD-3-Clause
+#
+# kernel-sloc - Count source lines of code for a configured kernel build.
+#
+# Adapted from the Unikraft build-time SLOC reporting approach
+# (https://github.com/orgs/unikraft/discussions/1849#discussioncomment-19352529),
+# which counts compiled sources rather than the whole source tree.
+#
+# The kernel mode counts whole compiled files, including inactive #if branches,
+# but not the headers they include. The dwarf mode estimates source lines
+# represented by debug information in a linked ELF; it does not measure runtime
+# coverage. Neither count is a certification or structural-coverage result.
+
+set -eu
+
+die() {
+	echo "ERROR: $*" >&2
+	exit 1
+}
+
+need_command() {
+	command -v "$1" >/dev/null 2>&1 || die "required command not found: $1"
+}
+
+need_cloc() {
+	command -v cloc >/dev/null 2>&1 ||
+		die "required command not found: cloc (install cloc to use kernel, tree, or files mode)"
+}
+
+usage() {
+	printf 'Usage: %s [--report JSON_FILE] MODE TARGET...\n' "$0"
+	printf '%s\n' \
+		'  kernel BUILD_DIR  Count whole compiled sources from compile_commands.json.' \
+		'                    Requires cloc and python3. Generate the database after' \
+		'                    a clean build of the configuration being measured.' \
+		'  dwarf ELF         Estimate distinct source lines using DWARF addresses.' \
+		'                    Requires GNU objdump, addr2line, and python3, plus' \
+		'                    an ELF built with debug information (CONFIG_DEBUG_INFO).' \
+		'                    Set OBJDUMP and ADDR2LINE for cross builds, or set' \
+		'                    CROSS_COMPILE to the toolchain prefix.' \
+		'  tree DIR          Count all C, C++, and header sources; requires cloc.' \
+		'  files FILE...     Count individual source files; requires cloc.' \
+		'  --report FILE     JSON inventory for kernel or dwarf; parent must exist.' \
+		'                    Lists compiled files, or DWARF source_lines and functions.' \
+		'                    Does not measure execution or list every linked symbol.' \
+		'  -h, --help        Show this help and exit successfully.' \
+		'' \
+		'Success prints one integer on stdout and a summary on stderr.' \
+		'Errors exit non-zero without printing a count.' \
+		'Counts depend on the tool versions and build options; record both.' \
+		'' \
+		'Examples:'
+	printf '  %s --report compiled.json kernel .\n' "$0"
+	printf '  %s --report linked.json dwarf vmlinux\n' "$0"
+	printf '  %s files foo.c\n' "$0"
+	printf '  %s tree /path/to/files\n' "$0"
+	printf '%s\n' \
+		'files omits linked libc; tree includes unused C/C++/headers, not other' \
+		'languages. Neither is a deployed-footprint total.'
+}
+
+# Extract the code total from cloc CSV, including the empty-tree case.
+cloc_sum() {
+	awk -F',' '$2 == "SUM" {total = $5} END {print total + 0}'
+}
+
+cloc_sum_from_list() {
+	cloc --list-file="$1" --skip-uniqueness --csv --quiet >"$2" ||
+		die "cloc failed while counting source files"
+	cloc_sum <"$2"
+}
+
+# Write the report before printing the count; failed writes are not success.
+write_report() {
+	[ -n "$report" ] || return 0
+	python3 - "$report" "$mode" "$target" "$1" "$2" <<'PYREPORT'
+import json
+import os
+import sys
+import tempfile
+
+path, mode, target, count, inventory = sys.argv[1:]
+with open(inventory, encoding="utf-8") as stream:
+    data = ({"files": sorted(stream.read().splitlines())} if mode == "kernel"
+            else json.load(stream))
+data.update(mode=mode, target=os.path.abspath(target), sloc=int(count))
+protected = [target] + data["files"]
+if mode == "kernel":
+    protected.append(os.path.join(target, "compile_commands.json"))
+if os.path.realpath(path) in {os.path.realpath(p) for p in protected}:
+    sys.exit("ERROR: report must not overwrite a measured input")
+if os.path.exists(path) and any(os.path.exists(p) and os.path.samefile(path, p)
+                                for p in protected):
+    sys.exit("ERROR: report must not overwrite a measured input")
+temporary = None
+try:
+    with tempfile.NamedTemporaryFile(mode="w", encoding="utf-8",
+                                     dir=os.path.dirname(os.path.abspath(path)),
+                                     delete=False) as output:
+        temporary = output.name
+        json.dump(data, output, indent=2, sort_keys=True)
+        output.write("\n")
+    os.replace(temporary, path)
+except OSError as error:
+    sys.exit(f"ERROR: cannot write report {path}: {error}")
+finally:
+    if temporary and os.path.exists(temporary):
+        os.unlink(temporary)
+PYREPORT
+}
+
+report=""
+if [ "${1:-}" = --report ]; then
+	if [ "$#" -lt 4 ] || [ -z "$2" ]; then
+		usage >&2
+		exit 2
+	fi
+	case "$2" in
+	-*) usage >&2; exit 2 ;;
+	esac
+	report="$2"
+	shift 2
+fi
+case "${1:-}" in
+-h|--help)
+	[ "$#" -eq 1 ] && [ -z "$report" ] || { usage >&2; exit 2; }
+	usage
+	exit 0
+	;;
+kernel|dwarf|tree)
+	[ "$#" -eq 2 ] || { usage >&2; exit 2; }
+	;;
+files)
+	[ "$#" -ge 2 ] || { usage >&2; exit 2; }
+	;;
+*)
+	usage >&2
+	exit 2
+	;;
+esac
+
+mode="$1"
+target="$2"
+if [ -n "$report" ] && [ "$mode" != kernel ] && [ "$mode" != dwarf ]; then
+	die "--report supports only kernel and dwarf modes"
+fi
+
+case "$mode" in
+kernel)
+	need_cloc
+	need_command python3
+	[ -d "$target" ] || die "kernel build dir not found: $target"
+	ccj="$target/compile_commands.json"
+	if [ ! -f "$ccj" ]; then
+		# Use the source-tree generator even for an out-of-tree build.
+		script_dir="$(cd "$(dirname "$0")" && pwd)"
+		gen="$script_dir/clang-tools/gen_compile_commands.py"
+		[ -f "$gen" ] || die "no compile_commands.json or generator (build the kernel first)"
+		echo "generating compile_commands.json ..." >&2
+		python3 "$gen" -d "$target" -o "$ccj" ||
+			die "gen_compile_commands.py failed"
+	fi
+	tmpdir="$(mktemp -d)" || die "cannot create temporary directory"
+	trap 'rm -rf "$tmpdir"' 0
+	trap 'exit 1' HUP INT TERM
+	list="$tmpdir/sources"
+	python3 - "$ccj" >"$list" <<'PY'
+import json
+import os
+import sys
+
+with open(sys.argv[1], encoding="utf-8") as database:
+    commands = json.load(database)
+base = os.path.dirname(os.path.abspath(sys.argv[1]))
+seen = set()
+for entry in commands:
+    source = entry.get("file")
+    if not source:
+        continue
+    directory = os.path.join(base, entry.get("directory", ""))
+    path = os.path.realpath(os.path.join(directory, source))
+    if not os.path.isfile(path):
+        sys.exit(f"ERROR: compiled source not found: {path}")
+    if "\n" in path or "\r" in path:
+        sys.exit("ERROR: source paths must not contain newlines")
+    if path not in seen:
+        seen.add(path)
+        print(path)
+PY
+	[ -s "$list" ] || die "no compiled sources found (build the kernel first)"
+	n="$(cloc_sum_from_list "$list" "$tmpdir/cloc.csv")"
+	write_report "$n" "$list"
+	echo "kernel compiled sources: $(wc -l <"$list") files, ${n} SLOC" >&2
+	echo "$n"
+	;;
+dwarf)
+	[ -f "$target" ] || die "ELF not found: $target (build with debug information)"
+	OBJDUMP="${OBJDUMP:-${CROSS_COMPILE:-}objdump}"
+	# Preserve the prefix when only a conventional OBJDUMP name is overridden.
+	case "$OBJDUMP" in
+	*objdump)
+		ADDR2LINE="${ADDR2LINE:-${OBJDUMP%objdump}addr2line}"
+		;;
+	*)
+		ADDR2LINE="${ADDR2LINE:-${CROSS_COMPILE:-}addr2line}"
+		;;
+	esac
+	need_command "$OBJDUMP"
+	need_command "$ADDR2LINE"
+	need_command python3
+	tmpdir="$(mktemp -d)" || die "cannot create temporary directory"
+	trap 'rm -rf "$tmpdir"' 0
+	trap 'exit 1' HUP INT TERM
+	inventory="$tmpdir/inventory.json"
+	# Resolve full paths before deduplicating line-table addresses.
+	LC_ALL=C "$OBJDUMP" --dwarf=decodedline "$target" >"$tmpdir/decodedline"
+	awk 'NF >= 3 && $2 ~ /^[0-9]+$/ {print $3}' "$tmpdir/decodedline" \
+		>"$tmpdir/addresses"
+	sort -u "$tmpdir/addresses" >"$tmpdir/sorted-addresses"
+	if [ -n "$report" ]; then
+		LC_ALL=C "$ADDR2LINE" -f -e "$target" <"$tmpdir/sorted-addresses" >"$tmpdir/locations"
+	else
+		LC_ALL=C "$ADDR2LINE" -e "$target" <"$tmpdir/sorted-addresses" >"$tmpdir/locations"
+	fi
+	python3 -c '
+import json
+import os
+import re
+import sys
+
+seen = set()
+functions = set()
+rows = iter(sys.stdin)
+for row in rows:
+    function = None
+    if sys.argv[1]:
+        function = row.strip()
+        row = next(rows, None)
+        if row is None:
+            sys.exit("ERROR: incomplete addr2line function/location pair")
+    match = re.fullmatch(r"(.*):([0-9]+)(?: \(discriminator [0-9]+\))?", row.strip())
+    if match and match[1] != "??" and int(match[2]) > 0:
+        file = os.path.normpath(match[1])
+        seen.add((file, int(match[2])))
+        if function and function != "??":
+            functions.add((function, file))
+if sys.argv[1]:
+    with open(sys.argv[2], "w", encoding="utf-8") as output:
+        json.dump({"files": sorted({file for file, line in seen}),
+                   "source_lines": [{"file": file, "line": line}
+                                    for file, line in sorted(seen)],
+                   "functions": [{"name": name, "file": file}
+                                 for name, file in sorted(functions)]}, output)
+print(len(seen))
+' "$report" "$inventory" <"$tmpdir/locations" >"$tmpdir/count"
+	n="$(cat "$tmpdir/count")"
+	[ "$n" -gt 0 ] || die "no DWARF source lines found (build with CONFIG_DEBUG_INFO)"
+	write_report "$n" "$inventory"
+	echo "dwarf distinct source lines (debug-info estimate): ${n}" >&2
+	echo "$n"
+	;;
+tree)
+	need_cloc
+	[ -d "$target" ] || die "source dir not found: $target"
+	tmpfile="$(mktemp)" || die "cannot create temporary file"
+	trap 'rm -f "$tmpfile"' 0
+	trap 'exit 1' HUP INT TERM
+	cloc --include-lang=C,C++,'C/C++ Header' --skip-uniqueness \
+		--csv --quiet "$target" >"$tmpfile" ||
+		die "cloc failed while counting source tree"
+	n="$(cloc_sum <"$tmpfile")"
+	echo "source tree $target (C/C++ and headers): ${n} SLOC" >&2
+	echo "$n"
+	;;
+files)
+	need_cloc
+	shift
+	newline='
+'
+	carriage_return="$(printf '\r')"
+	for source in "$@"; do
+		[ -f "$source" ] || die "source file not found: $source"
+		case "$source" in
+		*"$newline"*|*"$carriage_return"*)
+			die "source paths must not contain newlines"
+			;;
+		esac
+	done
+	tmpdir="$(mktemp -d)" || die "cannot create temporary directory"
+	trap 'rm -rf "$tmpdir"' 0
+	trap 'exit 1' HUP INT TERM
+	list="$tmpdir/sources"
+	printf '%s\n' "$@" >"$list"
+	n="$(cloc_sum_from_list "$list" "$tmpdir/cloc.csv")"
+	echo "files: $# path(s), ${n} SLOC" >&2
+	echo "$n"
+	;;
+esac
-- 
2.39.5
