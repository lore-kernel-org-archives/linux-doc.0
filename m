Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1E238655B;
	Mon, 23 Mar 2026 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257059; cv=none; b=BJ74oC9kXXM3HeZJfpy+6avQKXOFJ7jMMVbdAZxJ0SF2CqaZrLmOUXT0HSuDB6/nrYnipYVI3devJx33TvUF+pYC4GJvn5UvU7TwOjX/q1EqsfafAz3F31Geuo0tTHTL8j5otTeojmdHr9jQMm0yNVKObvpFzqhzLHRLmUbQjyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257059; c=relaxed/simple;
	bh=I+Z90ZgRcAKwP9M+teTDbwHynmYojrMLzCXd+nUPEDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k6yCIh7Zy/TrJc3JLA6Rjc3VWx1nbeF4o4bZrDFV1/m78YJrF02Gtcy5YSegtaj+UgyVkR+KBpyOkKdkRvTCAwVcKjREMMaSwYMUI6OB6tWsTOpjT7jq+xUkk0OuoxcuZFFEHQmIPiACH9W6UT2FQJSaCK6Wglc2J5PaysE1rZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQwOqVfJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQwOqVfJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0289C2BCB6;
	Mon, 23 Mar 2026 09:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774257059;
	bh=I+Z90ZgRcAKwP9M+teTDbwHynmYojrMLzCXd+nUPEDY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NQwOqVfJ7c8LIdpQ33R80m2rSH5vlLo5zbcwpKf51Ww6zmrcwhVaV/NC8S3BUCwR4
	 xPPTRz4DILklEvqhPOkEIQGdHSJiwHax7lrKFhs4WLovnGpt8i3LdKUorzeN3x3hSL
	 0QLQj9k6A9GTxLPOvbcyPOCwRfDbG1pEmea0FvHG+XNXdYyFeHff8UU4jVKG76HIdk
	 /GQxskLVmNbP/0/knM6UiRSTxjOgxAnt+5zCVyPw9/d0iU22Hx3eRb8/bYHdSv4vJB
	 xqek3BADD/kqSRLQ905ksBAtfh03kC9dPFjEIDUi8HS8IU0Te4yK/MaaTUkQ95rA1/
	 N+HBaCkAfQNlg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w4bJI-00000002yWg-2IMT;
	Mon, 23 Mar 2026 10:10:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 07/10] docs: kdoc: better handle source when producing YAML output
Date: Mon, 23 Mar 2026 10:10:50 +0100
Message-ID: <77902dafabb5c3250486aa2dc1568d5fafa95c5b.1774256269.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1774256269.git.mchehab+huawei@kernel.org>
References: <cover.1774256269.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The current logic was storing symbols source code on a list,
not linked to the actual KdocItem. While this works fine when
kernel-doc markups are OK, on places where there is a "/**"
without a valid kernel-doc markup, it ends that the 1:1 match
between source code and KdocItem doesn't happen, causing
problems to generate the YAML output.

Fix it by storing the source code directly into the KdocItem
structure.

This shouldn't affect performance or memory footprint, except
when --yaml option is used.

While here, add a __repr__() function for KdocItem, as it
helps debugging it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_files.py     |   8 +-
 tools/lib/python/kdoc/kdoc_item.py      |   6 +-
 tools/lib/python/kdoc/kdoc_parser.py    | 100 ++++++++++++------------
 tools/lib/python/kdoc/kdoc_yaml_file.py |  28 +++----
 tools/unittests/test_kdoc_parser.py     |   9 +++
 5 files changed, 79 insertions(+), 72 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_files.py b/tools/lib/python/kdoc/kdoc_files.py
index 5a299ed44d62..2428cfc4e843 100644
--- a/tools/lib/python/kdoc/kdoc_files.py
+++ b/tools/lib/python/kdoc/kdoc_files.py
@@ -203,10 +203,6 @@ class KernelFiles():
 
         self.results[fname] = entries
 
-        source = doc.get_source()
-        if source:
-            self.source[fname] = source
-
     def process_export_file(self, fname):
         """
         Parses ``EXPORT_SYMBOL*`` macros from a single Kernel source file.
@@ -294,7 +290,6 @@ class KernelFiles():
 
         self.errors = 0
         self.results = {}
-        self.source = {}
 
         self.files = set()
         self.export_files = set()
@@ -364,8 +359,7 @@ class KernelFiles():
                                           function_table, enable_lineno,
                                           no_doc_sections)
 
-                self.test_file.output_symbols(fname, symbols,
-                                              self.source.get(fname))
+                self.test_file.output_symbols(fname, symbols)
 
                 continue
 
diff --git a/tools/lib/python/kdoc/kdoc_item.py b/tools/lib/python/kdoc/kdoc_item.py
index fe08cac861c2..a7aa6e1e4c1c 100644
--- a/tools/lib/python/kdoc/kdoc_item.py
+++ b/tools/lib/python/kdoc/kdoc_item.py
@@ -14,7 +14,8 @@ class KdocItem:
     then pass into the output modules.
     """
 
-    def __init__(self, name, fname, type, start_line, **other_stuff):
+    def __init__(self, name, fname, type, start_line,
+                 **other_stuff):
         self.name = name
         self.fname = fname
         self.type = type
@@ -60,6 +61,9 @@ class KdocItem:
     def __getitem__(self, key):
         return self.get(key)
 
+    def __repr__(self):
+        return f"KdocItem({self.name}, {self.fname}, {self.type}, {self.declaration_start_line})"
+
     @classmethod
     def from_dict(cls, d):
         """Create a KdocItem from a plain dict."""
diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index a10e64589d76..74af7ae47aa4 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -265,9 +265,6 @@ class KernelDoc:
         # Place all potential outputs into an array
         self.entries = []
 
-        # When store_src is true, the kernel-doc source content is stored here
-        self.source = None
-
         #
         # We need Python 3.7 for its "dicts remember the insertion
         # order" guarantee
@@ -720,13 +717,14 @@ class KernelDoc:
         return declaration
 
 
-    def dump_struct(self, ln, proto):
+    def dump_struct(self, ln, proto, source):
         """
         Store an entry for a ``struct`` or ``union``
         """
         #
         # Do the basic parse to get the pieces of the declaration.
         #
+        source = source
         proto = trim_private_members(proto)
         struct_parts = self.split_struct_proto(proto)
         if not struct_parts:
@@ -756,10 +754,11 @@ class KernelDoc:
                                    declaration_name)
         self.check_sections(ln, declaration_name, decl_type)
         self.output_declaration(decl_type, declaration_name,
+                                source=source,
                                 definition=self.format_struct_decl(declaration),
                                 purpose=self.entry.declaration_purpose)
 
-    def dump_enum(self, ln, proto):
+    def dump_enum(self, ln, proto, source):
         """
         Store an ``enum`` inside self.entries array.
         """
@@ -767,6 +766,7 @@ class KernelDoc:
         # Strip preprocessor directives.  Note that this depends on the
         # trailing semicolon we added in process_proto_type().
         #
+        source = source
         proto = trim_private_members(proto)
         proto = KernRe(r'#\s*((define|ifdef|if)\s+|endif)[^;]*;', flags=re.S).sub('', proto)
         #
@@ -831,9 +831,10 @@ class KernelDoc:
                               f"Excess enum value '@{k}' description in '{declaration_name}'")
 
         self.output_declaration('enum', declaration_name,
+                                source=source,
                                 purpose=self.entry.declaration_purpose)
 
-    def dump_var(self, ln, proto):
+    def dump_var(self, ln, proto, source):
         """
         Store variables that are part of kAPI.
         """
@@ -846,6 +847,7 @@ class KernelDoc:
         #
         # Store the full prototype before modifying it
         #
+        source = source
         full_proto = proto
         declaration_name = None
 
@@ -895,32 +897,34 @@ class KernelDoc:
             default_val = default_val.lstrip("=").strip()
 
         self.output_declaration("var", declaration_name,
+                                source=source,
                                 full_proto=full_proto,
                                 default_val=default_val,
                                 purpose=self.entry.declaration_purpose)
 
-    def dump_declaration(self, ln, prototype):
+    def dump_declaration(self, ln, prototype, source):
         """
         Store a data declaration inside self.entries array.
         """
 
         if self.entry.decl_type == "enum":
-            self.dump_enum(ln, prototype)
+            self.dump_enum(ln, prototype, source)
         elif self.entry.decl_type == "typedef":
-            self.dump_typedef(ln, prototype)
+            self.dump_typedef(ln, prototype, source)
         elif self.entry.decl_type in ["union", "struct"]:
-            self.dump_struct(ln, prototype)
+            self.dump_struct(ln, prototype, source)
         elif self.entry.decl_type == "var":
-            self.dump_var(ln, prototype)
+            self.dump_var(ln, prototype, source)
         else:
             # This would be a bug
             self.emit_message(ln, f'Unknown declaration type: {self.entry.decl_type}')
 
-    def dump_function(self, ln, prototype):
+    def dump_function(self, ln, prototype, source):
         """
         Store a function or function macro inside self.entries array.
         """
 
+        source = source
         found = func_macro = False
         return_type = ''
         decl_type = 'function'
@@ -1013,13 +1017,14 @@ class KernelDoc:
         # Store the result.
         #
         self.output_declaration(decl_type, declaration_name,
+                                source=source,
                                 typedef=('typedef' in return_type),
                                 functiontype=return_type,
                                 purpose=self.entry.declaration_purpose,
                                 func_macro=func_macro)
 
 
-    def dump_typedef(self, ln, proto):
+    def dump_typedef(self, ln, proto, source):
         """
         Store a ``typedef`` inside self.entries array.
         """
@@ -1030,6 +1035,8 @@ class KernelDoc:
         typedef_ident = r'\*?\s*(\w\S+)\s*'
         typedef_args = r'\s*\((.*)\);'
 
+        source = source
+
         typedef1 = KernRe(typedef_type + r'\(' + typedef_ident + r'\)' + typedef_args)
         typedef2 = KernRe(typedef_type + typedef_ident + typedef_args)
 
@@ -1050,6 +1057,7 @@ class KernelDoc:
             self.create_parameter_list(ln, 'function', args, ',', declaration_name)
 
             self.output_declaration('function', declaration_name,
+                                    source=source,
                                     typedef=True,
                                     functiontype=return_type,
                                     purpose=self.entry.declaration_purpose)
@@ -1067,6 +1075,7 @@ class KernelDoc:
                 return
 
             self.output_declaration('typedef', declaration_name,
+                                    source=source,
                                     purpose=self.entry.declaration_purpose)
             return
 
@@ -1104,7 +1113,7 @@ class KernelDoc:
         function_set.add(symbol)
         return True
 
-    def process_normal(self, ln, line):
+    def process_normal(self, ln, line, source):
         """
         STATE_NORMAL: looking for the ``/**`` to begin everything.
         """
@@ -1118,7 +1127,7 @@ class KernelDoc:
         # next line is always the function name
         self.state = state.NAME
 
-    def process_name(self, ln, line):
+    def process_name(self, ln, line, source):
         """
         STATE_NAME: Looking for the "name - description" line
         """
@@ -1251,7 +1260,7 @@ class KernelDoc:
         return False
 
 
-    def process_decl(self, ln, line):
+    def process_decl(self, ln, line, source):
         """
         STATE_DECLARATION: We've seen the beginning of a declaration.
         """
@@ -1280,7 +1289,7 @@ class KernelDoc:
             self.emit_msg(ln, f"bad line: {line}")
 
 
-    def process_special(self, ln, line):
+    def process_special(self, ln, line, source):
         """
         STATE_SPECIAL_SECTION: a section ending with a blank line.
         """
@@ -1331,7 +1340,7 @@ class KernelDoc:
             # Unknown line, ignore
             self.emit_msg(ln, f"bad line: {line}")
 
-    def process_body(self, ln, line):
+    def process_body(self, ln, line, source):
         """
         STATE_BODY: the bulk of a kerneldoc comment.
         """
@@ -1345,7 +1354,7 @@ class KernelDoc:
             # Unknown line, ignore
             self.emit_msg(ln, f"bad line: {line}")
 
-    def process_inline_name(self, ln, line):
+    def process_inline_name(self, ln, line, source):
         """STATE_INLINE_NAME: beginning of docbook comments within a prototype."""
 
         if doc_inline_sect.search(line):
@@ -1363,10 +1372,10 @@ class KernelDoc:
             # Don't let it add partial comments at the code, as breaks the
             # logic meant to remove comments from prototypes.
             #
-            self.process_proto_type(ln, "/**\n" + line)
+            self.process_proto_type(ln, "/**\n" + line, source)
         # else ... ??
 
-    def process_inline_text(self, ln, line):
+    def process_inline_text(self, ln, line, source):
         """STATE_INLINE_TEXT: docbook comments within a prototype."""
 
         if doc_inline_end.search(line):
@@ -1452,7 +1461,7 @@ class KernelDoc:
 
         return proto
 
-    def process_proto_function(self, ln, line):
+    def process_proto_function(self, ln, line, source):
         """Ancillary routine to process a function prototype."""
 
         # strip C99-style comments to end of line
@@ -1494,10 +1503,10 @@ class KernelDoc:
             #
             # ... and we're done
             #
-            self.dump_function(ln, self.entry.prototype)
+            self.dump_function(ln, self.entry.prototype, source)
             self.reset_state(ln)
 
-    def process_proto_type(self, ln, line):
+    def process_proto_type(self, ln, line, source):
         """
         Ancillary routine to process a type.
         """
@@ -1527,7 +1536,7 @@ class KernelDoc:
                 elif chunk == '}':
                     self.entry.brcount -= 1
                 elif chunk == ';' and self.entry.brcount <= 0:
-                    self.dump_declaration(ln, self.entry.prototype)
+                    self.dump_declaration(ln, self.entry.prototype, source)
                     self.reset_state(ln)
                     return
         #
@@ -1536,7 +1545,7 @@ class KernelDoc:
         #
         self.entry.prototype += ' '
 
-    def process_proto(self, ln, line):
+    def process_proto(self, ln, line, source):
         """STATE_PROTO: reading a function/whatever prototype."""
 
         if doc_inline_oneline.search(line):
@@ -1548,17 +1557,18 @@ class KernelDoc:
             self.state = state.INLINE_NAME
 
         elif self.entry.decl_type == 'function':
-            self.process_proto_function(ln, line)
+            self.process_proto_function(ln, line, source)
 
         else:
-            self.process_proto_type(ln, line)
+            self.process_proto_type(ln, line, source)
 
-    def process_docblock(self, ln, line):
+    def process_docblock(self, ln, line, source):
         """STATE_DOCBLOCK: within a ``DOC:`` block."""
 
         if doc_end.search(line):
             self.dump_section()
-            self.output_declaration("doc", self.entry.identifier)
+            self.output_declaration("doc", self.entry.identifier,
+                                    source=source)
             self.reset_state(ln)
 
         elif doc_content.search(line):
@@ -1596,15 +1606,6 @@ class KernelDoc:
         state.DOCBLOCK:			process_docblock,
         }
 
-    def get_source(self):
-        """
-        Return the file content of the lines handled by kernel-doc at the
-        latest parse_kdoc() run.
-
-        Returns none if KernelDoc() was not initialized with store_src,
-        """
-        return self.source
-
     def parse_kdoc(self):
         """
         Open and process each line of a C source file.
@@ -1618,8 +1619,8 @@ class KernelDoc:
         prev = ""
         prev_ln = None
         export_table = set()
-        self.source = []
         self.state = state.NORMAL
+        source = ""
 
         try:
             with open(self.fname, "r", encoding="utf8",
@@ -1646,7 +1647,11 @@ class KernelDoc:
                                           ln, state.name[self.state],
                                           line)
 
-                    prev_state = self.state
+                    if self.store_src:
+                        if source and self.state == state.NORMAL:
+                            source = ""
+                        elif self.state != state.NORMAL:
+                            source += line + "\n"
 
                     # This is an optimization over the original script.
                     # There, when export_file was used for the same file,
@@ -1655,16 +1660,11 @@ class KernelDoc:
                     #
                     if (self.state != state.NORMAL) or \
                        not self.process_export(export_table, line):
+                        prev_state = self.state
                         # Hand this line to the appropriate state handler
-                        self.state_actions[self.state](self, ln, line)
-
-                    if self.store_src and prev_state != self.state or self.state != state.NORMAL:
-                        if self.state == state.NAME:
-                            # A "/**" was detected. Add a new source element
-                            self.source.append({"ln": ln, "data": line + "\n"})
-                        else:
-                            # Append to the existing one
-                            self.source[-1]["data"] += line + "\n"
+                        self.state_actions[self.state](self, ln, line, source)
+                        if prev_state == state.NORMAL and self.state != state.NORMAL:
+                            source += line + "\n"
 
             self.emit_unused_warnings()
 
diff --git a/tools/lib/python/kdoc/kdoc_yaml_file.py b/tools/lib/python/kdoc/kdoc_yaml_file.py
index 18737abb1176..1e2ae7c59d70 100644
--- a/tools/lib/python/kdoc/kdoc_yaml_file.py
+++ b/tools/lib/python/kdoc/kdoc_yaml_file.py
@@ -85,7 +85,7 @@ class KDocTestFile():
 
         return d
 
-    def output_symbols(self, fname, symbols, source):
+    def output_symbols(self, fname, symbols):
         """
         Store source, symbols and output strings at self.tests.
         """
@@ -96,16 +96,10 @@ class KDocTestFile():
         kdoc_item = []
         expected = []
 
-        if not symbols and not source:
-            return
-
-        if not source or len(symbols) != len(source):
-            print(f"Warning: lengths are different. Ignoring {fname}")
-
-            # Folding without line numbers is too hard.
-            # The right thing to do here to proceed would be to delete
-            # not-handled source blocks, as len(source) should be bigger
-            # than len(symbols)
+        #
+        # Source code didn't produce any symbol
+        #
+        if not symbols:
             return
 
         base_name = "test_" + fname.replace(".", "_").replace("/", "_")
@@ -115,9 +109,15 @@ class KDocTestFile():
         for i in range(0, len(symbols)):
             arg = symbols[i]
 
-            if "KdocItem" in self.yaml_content:
+            source = arg.get("source", "")
+
+            if arg and "KdocItem" in self.yaml_content:
                 msg = self.get_kdoc_item(arg)
 
+                other_stuff = msg.get("other_stuff", {})
+                if "source" in other_stuff:
+                    del other_stuff["source"]
+
                 expected_dict["kdoc_item"] = msg
 
             for out_style in self.out_style:
@@ -132,9 +132,9 @@ class KDocTestFile():
 
             test = {
                 "name": name,
-                "description": f"{fname} line {source[i]["ln"]}",
+                "description": f"{fname} line {arg.declaration_start_line}",
                 "fname": fname,
-                "source": source[i]["data"],
+                "source": source,
                 "expected": [expected_dict]
             }
 
diff --git a/tools/unittests/test_kdoc_parser.py b/tools/unittests/test_kdoc_parser.py
index f2250ef192ce..c4a76ed13dbc 100755
--- a/tools/unittests/test_kdoc_parser.py
+++ b/tools/unittests/test_kdoc_parser.py
@@ -167,7 +167,16 @@ class GenerateKdocItem(unittest.TestCase):
                 self.assertIsInstance(entry, KdocItem)
 
                 d = vars(entry)
+
+                other_stuff = d.get("other_stuff", {})
+                if "source" in other_stuff:
+                    del other_stuff["source"]
+
                 for key, value in expected.items():
+                    if key == "other_stuff":
+                        if "source" in value:
+                            del value["source"]
+
                     result = clean_whitespc(d[key], relax_whitespace)
                     value = clean_whitespc(value, relax_whitespace)
 
-- 
2.53.0

