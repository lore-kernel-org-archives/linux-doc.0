Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2581A705C;
	Fri, 17 Jan 2025 17:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737136795; cv=none; b=BQeqJiKmk/rVfvNKaW6MYY7OwiJ4IYUpFFkAeC93vHoH+8JMqRjLHosV96zIoYI6tCdMZsRt3IavcC3rQE0fIDHqyS1rlZCPg3cCpP4Qy/Ylkd0Lrs0siq5WGw7nQEnUscMRO2QdE6ejnDV+5YwOHqfTjyDo14OEhZFuXKB3FnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737136795; c=relaxed/simple;
	bh=LIPJhhxI9x5E9YFP9vKAabDVgdnVjYMv//IillkBlls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BHT+/68ikBgfm2Wt3cjHLwHDXkckjErsPR1XLmpEpUQ9M79444hZBb91g7L3v52B02SLoisEz5Gnuyn+ZsgwMhAksOtQj/qjDx7QTMAAMe9KBNkxVhW/3sRothWWyClA5DpVaFBhlc4kkxBdBtP2Npgaq9p3WgQ2nwCgvpcre3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kuc1Uhx/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kuc1Uhx/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0739AC4CEE7;
	Fri, 17 Jan 2025 17:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737136795;
	bh=LIPJhhxI9x5E9YFP9vKAabDVgdnVjYMv//IillkBlls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kuc1Uhx/2VM84ZWETTnkU+4HeE2wnfK3KEcBoqhL64CkUa2dLDlqK5Z1FCkxfLhs4
	 csc8jOpEFV07ooB3rC1yig+4x40LwxVMRQDle8NAMgqNj1+7v6C26rykDabaAzhOIV
	 aIO6icsE5fJPgBzOyYjUc16AsY0oTb9o5YUVqf/ADmodPD8S/kygTdwnV0KemLw4RL
	 V+aP8ScrRTSlRxRVlhpEFAqa5OpAgRdN+3rKNCn3wSTLVGpqM+MBwAlYYZAdVPYWlt
	 LrJm8lQ5b1rVTmQ5ojuWz7dcDUpeM2lChLgvFvmr3OMsQW6FPw1V0WKM222cNatKjE
	 HtF8Q1BM58phw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tYqdM-00000006Ajv-2Egp;
	Fri, 17 Jan 2025 18:59:52 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC 07/10] [RFC] scripts: add a get_abi.py tool to generate ReST output
Date: Fri, 17 Jan 2025 18:59:36 +0100
Message-ID: <bcec4ad57fb51f8e0c4e4f817e8098073a63229d.1737135484.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1737135484.git.mchehab+huawei@kernel.org>
References: <cover.1737135484.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The get_abi.pl script is requiring some care, but it seems that
the number of changes on it since when I originally wrote it
was not too high. Granted, maintaining perl scripts without
classes requires a higher efforted than on python. Also, it sounds
easier to find python developer those days than perl ones.

With that in mind, rewrite the core of get_abi.pl in Python,
using classes, to help producing documentation. This will
allow a better integration in the future with the Sphinx
ABI extension.

The algorithms used there are the same as the ones in Perl,
with a couple of cleanups to remove redundant variables and
to help with cross-reference generation. I also removed
some code that were important in the past during txt to ReST
migration, but aren't needed now anymore.

The end script is a little bit faster than the original one
(tested on a machine with ssd disks). That's probably because
we're now using only pre-compiled regular expressions, and it
is using string replacement methods instead of regex where
possible.

The new version is a little bit more conservative when
creating cross-references to avoid adding them into literal
blocks. We may end making it working better once we change
Sphinx integration, in the future.

The end result was compared with the one produced by the perl
script and showed no regressions.

As a side effect, that makes integration with Sphinx easier.

This script follows flake8 style, verified with:

	$ flake8 ./scripts/get_abi.py --max-line-length 100

(most lines are below 80 columns limit, but some strings are
longer)

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.py | 583 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 583 insertions(+)
 create mode 100755 scripts/get_abi.py

diff --git a/scripts/get_abi.py b/scripts/get_abi.py
new file mode 100755
index 000000000000..64a0ec8b1d89
--- /dev/null
+++ b/scripts/get_abi.py
@@ -0,0 +1,583 @@
+#!/usr/bin/env python3
+# pylint: disable=R0902,R0903,R0911,R0912,R0914,R0915
+# Copyright(c) 2025: Mauro Carvalho Chehab <mchehab@kernel.org>.
+# SPDX-License-Identifier: GPL-2.0
+
+"""
+Parse ABI documentation and produce results from it.
+"""
+
+
+import argparse
+import os
+import re
+import sys
+
+from glob import glob
+from random import randrange
+
+if __name__ == "__main__":
+    import logging
+else:
+    from sphinx.util import logging
+
+ABI_DIR = "Documentation/ABI/"
+
+# Debug levels
+DEBUG_WHAT_PARSING = 1
+DEBUG_WHAT_OPEN = 2
+DEBUG_DUMP_ABI_STRUCTS = 4
+DEBUG_UNDEFINED = 8
+
+
+class AbiParser:
+    """Main class to parse ABI files"""
+
+    TAGS = r"(what|where|date|kernelversion|contact|description|users)"
+    XREF = r"(?:^|\s|\()(\/(?:sys|config|proc|dev|kvd)\/[^,.:;\)\s]+)(?:[,.:;\)\s]|\Z)"
+
+    def __init__(self, directory, enable_lineno=False, show_warnings=True, debug=0):
+        """Stores arguments for the class and initialize global vars"""
+
+        self.directory = directory
+        self.enable_lineno = enable_lineno
+        self.show_warnings = show_warnings
+        self.debug = debug
+
+        self.log = logging.getLogger("get_abi")
+        self.data = {}
+        self.what_symbols = {}
+        self.file_refs = {}
+        self.what_refs = {}
+
+        # Regular expressions used on parser
+        self.re_tag = re.compile(r"(\S+)(:\s*)(.*)", re.I)
+        self.re_valid = re.compile(self.TAGS)
+        self.re_start_spc = re.compile(r"(\s*)(\S.*)")
+        self.re_whitespace = re.compile(r"^\s+")
+
+        # Regular used on print
+        self.re_what = re.compile(r"(\/?(?:[\w\-]+\/?){1,2})")
+        self.re_escape = re.compile(r"([\.\x01-\x08\x0e-\x1f\x21-\x2f\x3a-\x40\x7b-\xff])")
+        self.re_unprintable = re.compile(r"([\x00-\x2f\x3a-\x40\x5b-\x60\x7b-\xff]+)")
+        self.re_title_mark = re.compile(r"\n[\-\*\=\^\~]+\n")
+        self.re_doc = re.compile(r"Documentation/(?!devicetree)(\S+)\.rst")
+        self.re_abi = re.compile(r"(Documentation/ABI/)([\w\/\-]+)")
+        self.re_xref_node = re.compile(self.XREF)
+
+    def warn(self, fdata, msg, extra=None):
+        """Displays a parse error if warning is enabled"""
+
+        if not self.show_warnings:
+            return
+
+        msg = f"{fdata.fname}:{fdata.ln}: {msg}"
+        if extra:
+            msg += "\n\t\t" + extra
+
+        self.log.warning(msg)
+
+    def add_symbol(self, what, fname, ln=None, xref=None):
+        """Create a reference table describing where each 'what' is located"""
+
+        if what not in self.what_symbols:
+            self.what_symbols[what] = {"file": {}}
+
+        if fname not in self.what_symbols[what]["file"]:
+            self.what_symbols[what]["file"][fname] = []
+
+        if ln:
+            self.what_symbols[what]["file"][fname].append(ln)
+
+        if xref:
+            self.what_symbols[what]["xref"] = xref
+
+    def _parse_line(self, fdata, line):
+        """Parse a single line of an ABI file"""
+
+        new_what = False
+        new_tag = False
+        content = None
+
+        match = self.re_tag.match(line)
+        if match:
+            new = match.group(1).lower()
+            sep = match.group(2)
+            content = match.group(3)
+
+            match = self.re_valid.search(new)
+            if match:
+                new_tag = match.group(1)
+            else:
+                if fdata.tag == "description":
+                    # New "tag" is actually part of description.
+                    # Don't consider it a tag
+                    new_tag = False
+                elif fdata.tag != "":
+                    self.warn(fdata, f"tag '{fdata.tag}' is invalid", line)
+
+        if new_tag:
+            # "where" is Invalid, but was a common mistake. Warn if found
+            if new_tag == "where":
+                self.warn(fdata,
+                          "tag 'Where' is invalid. Should be 'What:' instead")
+                new_tag = "what"
+
+            if new_tag == "what":
+                fdata.space = None
+
+                if content not in self.what_symbols:
+                    self.add_symbol(what=content,
+                                    fname=fdata.fname, ln=fdata.ln)
+
+                if fdata.tag == "what":
+                    fdata.what.append(content.strip("\n"))
+                else:
+                    if fdata.key:
+                        if "description" not in self.data.get(fdata.key, {}):
+                            self.warn(fdata,
+                                      f"{fdata.key} doesn't have a description")
+
+                        for w in fdata.what:
+                            self.add_symbol(what=w, fname=fdata.fname,
+                                            ln=fdata.what_ln, xref=fdata.key)
+
+                    fdata.label = content
+                    new_what = True
+
+                    key = "abi_" + content.lower()
+                    fdata.key = self.re_unprintable.sub("_", key).strip("_")
+
+                    # Avoid duplicated keys
+                    while fdata.key in self.data:
+                        char = randrange(0, 51) + ord("A")
+                        if char > ord("Z"):
+                            char += ord("a") - ord("Z") - 1
+
+                        fdata.key += chr(char)
+
+                    if fdata.key and fdata.key not in self.data:
+                        self.data[fdata.key] = {
+                            "what": [content],
+                            "file": [fdata.file_ref],
+                            "line_no": fdata.ln,
+                        }
+
+                    fdata.what = self.data[fdata.key]["what"]
+
+                self.what_refs[content] = fdata.key
+                fdata.tag = new_tag
+                fdata.what_ln = fdata.ln
+
+                if fdata.nametag["what"]:
+                    t = (content, fdata.key)
+                    if t not in fdata.nametag["symbols"]:
+                        fdata.nametag["symbols"].append(t)
+
+                return
+
+            if fdata.tag and new_tag:
+                fdata.tag = new_tag
+
+                if new_what:
+                    fdata.label = ""
+
+                    self.data[fdata.key]["type"] = fdata.ftype
+
+                    if "description" in self.data[fdata.key]:
+                        self.data[fdata.key]["description"] += "\n\n"
+
+                    if fdata.file_ref not in self.data[fdata.key]["file"]:
+                        self.data[fdata.key]["file"].append(fdata.file_ref)
+
+                    if self.debug == DEBUG_WHAT_PARSING:
+                        self.log.debug("what: %s", fdata.what)
+
+                if not fdata.what:
+                    self.warn(fdata, "'What:' should come first:", line)
+                    return
+
+                if new_tag == "description":
+                    fdata.space = None
+
+                    if content:
+                        sep = sep.replace(":", " ")
+
+                        c = " " * len(new_tag) + sep + content
+                        c = c.expandtabs()
+
+                        match = self.re_start_spc.match(c)
+                        if match:
+                            # Preserve initial spaces for the first line
+                            fdata.space = match.group(1)
+                            content = match.group(2) + "\n"
+
+                self.data[fdata.key][fdata.tag] = content
+
+            return
+
+        # Store any contents before tags at the database
+        if not fdata.tag and "what" in fdata.nametag:
+            fdata.nametag["description"] += line
+            return
+
+        if fdata.tag == "description":
+            content = line.expandtabs()
+
+            if self.re_whitespace.sub("", content) == "":
+                self.data[fdata.key][fdata.tag] += "\n"
+                return
+
+            if fdata.space is None:
+                match = self.re_start_spc.match(content)
+                if match:
+                    # Preserve initial spaces for the first line
+                    fdata.space = match.group(1)
+
+                    content = match.group(2) + "\n"
+            else:
+                if content.startswith(fdata.space):
+                    content = content[len(fdata.space):]
+
+                else:
+                    fdata.space = ""
+
+            if fdata.tag == "what":
+                w = content.strip("\n")
+                if w:
+                    self.data[fdata.key][fdata.tag].append(w)
+            else:
+                self.data[fdata.key][fdata.tag] += content
+            return
+
+        content = line.strip()
+        if fdata.tag:
+            if fdata.tag == "what":
+                w = content.strip("\n")
+                if w:
+                    self.data[fdata.key][fdata.tag].append(w)
+            else:
+                self.data[fdata.key][fdata.tag] += "\n" + content.rstrip("\n")
+            return
+
+        # Everything else is error
+        if content:
+            self.warn(fdata, "Unexpected content", line)
+
+    def parse_file(self, fname, path, basename):
+        """Parse a single file"""
+
+        ref = f"abi_file_{path}_{basename}"
+        ref = self.re_unprintable.sub("_", ref).strip("_")
+
+        # Store per-file state into a namespace variable. This will be used
+        # by the per-line parser state machine and by the warning function.
+        fdata = argparse.Namespace
+
+        fdata.fname = fname
+        fdata.name = basename
+        fdata.file_ref = (basename, ref)
+        fdata.ln = 0
+        fdata.what_ln = 0
+        fdata.tag = ""
+        fdata.label = ""
+        fdata.what = []
+        fdata.key = None
+        fdata.xrefs = None
+        fdata.space = None
+        fdata.ftype = path.split("/")[0]
+
+        fdata.nametag = {}
+        fdata.nametag["what"] = [f"File {path}/{basename}"]
+        fdata.nametag["type"] = "File"
+        fdata.nametag["file"] = [fdata.file_ref]
+        fdata.nametag["line_no"] = 1
+        fdata.nametag["description"] = ""
+        fdata.nametag["symbols"] = []
+
+        self.data[ref] = fdata.nametag
+        self.file_refs[fname] = ref
+
+        with open(fname, "r", encoding="utf8", errors="backslashreplace") as fp:
+            for line in fp:
+                fdata.ln += 1
+
+                self._parse_line(fdata, line)
+
+            if "description" in fdata.nametag:
+                fdata.nametag["description"] = fdata.nametag["description"].lstrip("\n")
+
+            if fdata.key:
+                if "description" not in self.data.get(fdata.key, {}):
+                    self.warn(fdata, f"{fdata.key} doesn't have a description")
+
+                for w in fdata.what:
+                    self.add_symbol(what=w, fname=fname, xref=fdata.key)
+
+    def parse_abi(self):
+        """Parse documentation ABI"""
+
+        ignore_suffixes = ("rej", "org", "orig", "bak", "~")
+        re_abi = re.compile(r".*" + ABI_DIR)
+
+        for fname in glob(os.path.join(self.directory, '**'), recursive=True):
+            if os.path.isdir(fname):
+                continue
+
+            basename = os.path.basename(fname)
+
+            if basename == "README":
+                continue
+            if basename.startswith(".") or basename.endswith(ignore_suffixes):
+                continue
+
+            path = re_abi.sub("", os.path.dirname(fname))
+
+            self.parse_file(fname, path, basename)
+
+    def print_desc_txt(self, desc):
+        """Print description as found inside ABI files"""
+
+        desc = desc.strip(" \t\n")
+
+        print(desc + "\n")
+
+    def print_desc_rst(self, desc):
+        """Enrich ReST output by creating cross-references"""
+
+        # Remove title markups from the description
+        # Having titles inside ABI files will only work if extra
+        # care would be taken in order to strictly follow the same
+        # level order for each markup.
+        desc = self.re_title_mark.sub("\n\n", "\n" + desc)
+        desc = desc.rstrip(" \t\n").lstrip("\n")
+
+        new_desc = ""
+        for d in desc.split("\n"):
+            if d == "":
+                new_desc += "\n"
+                continue
+
+            # Use cross-references for doc files where needed
+            d = self.re_doc.sub(r":doc:`/\1`", d)
+
+            # Use cross-references for ABI generated docs where needed
+            matches = self.re_abi.findall(d)
+            for m in matches:
+                abi = m[0] + m[1]
+
+                xref = self.file_refs.get(abi)
+                if not xref:
+                    self.log.warning("Didn't find ABI reference for %s", abi)
+                    continue
+
+                new = self.re_escape.sub(r"\\\1", m[1])
+
+                d = d.replace(abi, f":ref:`{new} <{xref}>`")
+
+            # Seek for cross reference symbols like /sys/...
+            # Need to be careful to avoid doing it on a code block
+            if d[0] not in [' ', '\t']:
+                matches = self.re_xref_node.findall(d)
+                for m in matches:
+
+                    # Finding ABI here is more complex due to wildcards
+                    xref = self.what_refs.get(m)
+                    if not xref:
+                        continue
+
+                    new = self.re_escape.sub(r"\\\1", m)
+
+                    d = d.replace(m, f":ref:`{new} <{xref}>`")
+
+            new_desc += d + "\n"
+
+        print(new_desc + "\n")
+
+    def print_data(self, enable_lineno, output_in_txt, show_file=False):
+        """Print ABI at stdout"""
+
+        part = None
+        for key, v in sorted(self.data.items(),
+                             key=lambda x: (x[1].get("type", ""), x[0])):
+
+            wtype = v.get("type", "Var")
+            file_ref = v.get("file")
+            names = v.get("what", [""])
+
+            if not show_file and wtype == "File":
+                continue
+
+            if enable_lineno:
+                ln = v.get("line_no", 1)
+                print(f".. LINENO {file_ref[0][0]}#{ln}\n")
+
+            if wtype != "File":
+                cur_part = names[0]
+                if cur_part.find("/") >= 0:
+                    match = self.re_what.match(cur_part)
+                    if match:
+                        symbol = match.group(1).rstrip("/")
+                        cur_part = "symbols under " + symbol
+
+                if cur_part and cur_part != part:
+                    part = cur_part
+                    print(f"{part}\n{"-" * len(part)}\n")
+
+                print(f".. _{key}:\n")
+
+                max_len = 0
+                for i in range(0, len(names)):           # pylint: disable=C0200
+                    names[i] = "**" + self.re_escape.sub(r"\\\1", names[i]) + "**"
+
+                    max_len = max(max_len, len(names[i]))
+
+                print("+-" + "-" * max_len + "-+")
+                for name in names:
+                    print(f"| {name}" + " " * (max_len - len(name)) + " |")
+                    print("+-" + "-" * max_len + "-+")
+                print()
+
+            for ref in file_ref:
+                if wtype == "File":
+                    print(f".. _{ref[1]}:\n")
+                else:
+                    print(f"Defined on file :ref:`{ref[0]} <{ref[1]}>`\n")
+
+            if wtype == "File":
+                print(f"{names[0]}\n{"-" * len(names[0])}\n")
+
+            desc = v.get("description")
+            if not desc and wtype != "File":
+                print(f"DESCRIPTION MISSING for {names[0]}\n")
+
+            if desc:
+                if output_in_txt:
+                    self.print_desc_txt(desc)
+                else:
+                    self.print_desc_rst(desc)
+
+            symbols = v.get("symbols")
+            if symbols:
+                print("Has the following ABI:\n")
+
+                for w, label in symbols:
+
+                    # Escape special chars from content
+                    content = self.re_escape.sub(r"\\\1", w)
+
+                    print(f"- :ref:`{content} <{label}>`\n")
+
+            users = v.get("users")
+            if users and users.strip(" \t\n"):
+                print(f"Users:\n\t{users.strip("\n").replace('\n', '\n\t')}\n")
+
+    def check_issues(self):
+
+        """Warn about duplicated ABI entries"""
+
+        for what, v in self.what_symbols.items():
+            files = v.get("file")
+            if not files:
+                # Should never happen if the parser works properly
+                self.log.warning("%s doesn't have a file associated", what)
+                continue
+
+            if len(files) == 1:
+                continue
+
+            f = []
+            for fname, lines in sorted(files.items()):
+                if not lines:
+                    f.append(f"{fname}")
+                elif len(lines) == 1:
+                    f.append(f"{fname}:{lines[0]}")
+                else:
+                    f.append(f"{fname} lines {", ".join(lines)}")
+
+            self.log.warning("%s is defined %d times: %s",
+                             what, len(f), "; ".join(f))
+
+
+class AbiRest:
+    """Initialize an argparse subparser for rest output"""
+
+    def __init__(self, subparsers):
+        """Initialize argparse subparsers"""
+
+        parser = subparsers.add_parser("rest",
+                                       formatter_class=argparse.ArgumentDefaultsHelpFormatter,
+                                       description="produce output in rest format")
+
+        parser.add_argument("--enable-lineno",  action="store_true",
+                            help="enable lineno")
+        parser.add_argument("--txt", action="store_true",
+                            help="output text in Text mode instead of ReST")
+        parser.add_argument("--no-file", action="store_true",
+                            help="Don't output files")
+        parser.add_argument("--show-hints", help="show-hints")
+
+        parser.set_defaults(func=self.run)
+
+    def run(self, args):
+        """Run subparser"""
+
+        args.parser.parse_abi()
+        args.parser.check_issues()
+        args.parser.print_data(args.enable_lineno, args.txt, not args.no_file)
+
+
+class AbiValidate:
+    """Initialize an argparse subparser for ABI validation"""
+
+    def __init__(self, subparsers):
+        """Initialize argparse subparsers"""
+
+        parser = subparsers.add_parser("validate",
+                                       formatter_class=argparse.ArgumentDefaultsHelpFormatter,
+                                       description="list events")
+
+        parser.set_defaults(func=self.run)
+
+    def run(self, args):
+        """Run subparser"""
+
+        args.parser.parse_abi()
+        args.parser.check_issues()
+
+
+def main():
+    """Main program"""
+
+    parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
+
+    parser.add_argument("-d", "--debug", type=int, default=0,
+                        help="debug level")
+    parser.add_argument("-D", "--dir", default=ABI_DIR,
+                        help="directory with ABIs to be parsed")
+
+    subparsers = parser.add_subparsers()
+
+    AbiRest(subparsers)
+    AbiValidate(subparsers)
+
+    args = parser.parse_args()
+
+    if args.debug:
+        level = logging.DEBUG
+    else:
+        level = logging.INFO
+
+    logging.basicConfig(level=level, format="[%(levelname)s] %(message)s")
+
+    if "func" in args:
+        args.parser = AbiParser(args.dir, debug=args.debug)
+
+        args.func(args)
+    else:
+        sys.exit(f"Please specify a valid command for {sys.argv[0]}")
+
+
+# Call main method
+if __name__ == "__main__":
+    main()
-- 
2.47.1

