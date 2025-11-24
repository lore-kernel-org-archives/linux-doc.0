Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C7C29B8E0
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 04:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763957416; cv=none; b=eZ4OVSgoMvDHFOCieP+RTUpNLgLFV5X+DFgha/OJ7ykl9EUWWpJxQBaYJtqHFYHStqoTmIdLV1U+rl5BqyAD1FaPzaJS9DCZH1mB4UleUI5YH8bicXBqGPqOG0VkIKFWCgUJ3zuGbL0jZyWDi8kEDDSRlHHzWjhueJuOOLft2uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763957416; c=relaxed/simple;
	bh=QNjvpiE3nF6XOBZ9LJnPQpvBYKIseqcDD9EyyZGs0Qs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sbXqUyCNnVbYDl8LH55vSP0472cV4pkrmf1N5ifhjrs0yCKUdcQiVsN3du8uKHbEWEuNoBYiIx4778rXkv86xRe+3m6Pg5oe4lKD35gtT+IgaBc5kbXXgpD4shSlWhoOjQZzZYc6n/JfBEDkBS3HLtmn427C5I7fKubgMxKEDhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=o6MjXa7s; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="o6MjXa7s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=LpCSwVo9oKNET8mexqBcD23WbwpPkcVAT2RUcVK9IMo=; b=o6MjXa7s2GM9TcX9T78VBiHNPS
	X3/Ip7pJwXfBgwIQMOAS+8h4y0MYyKnRbKemNfnhK7fIGaSwsEDadUFfzi8BAEFfzNmvfcbG9taVQ
	+5f4lQAuSAZUf3B7T+iZlb6Ln/vrmI2tKl9RJACDq98CmAMjDLMjFlHwExYO/Xmdt1k7cHiWz8CKz
	h/ePEflIoZOvdUAf561LaRNriQYMVc3EAVC1/3jE+vteyCziiZEnILnSrtsfHR7Jwu1PAsSosHkGp
	RaQMP+tiEZ5jtLSVd2A5AZRwrnZ1Bv1kxNnpX24EvVARhys6o8WRV86CZJRHzVK3pGlxvuF4zjH5l
	TSw/Z2rQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNNu1-0000000B3rS-1YyO;
	Mon, 24 Nov 2025 04:10:13 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2] docs: kdoc: various fixes for grammar, spelling, punctuation
Date: Sun, 23 Nov 2025 20:10:11 -0800
Message-ID: <20251124041011.3030571-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct grammar, spelling, and punctuation in comments, strings,
print messages, logs.

Change two instances of two spaces between words to just one space.

codespell was used to find misspelled words.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
v2: rebased/updated from 2025-07-06 to v6.18-rc7-linux-next-20251121 kernel

@Jon, when is a good time for me to resend this patch so that you can
apply it?

 tools/lib/python/kdoc/kdoc_files.py     |    4 +--
 tools/lib/python/kdoc/kdoc_output.py    |    8 +++----
 tools/lib/python/kdoc/kdoc_parser.py    |   14 ++++++------
 tools/lib/python/kdoc/kdoc_re.py        |   24 +++++++++++-----------
 tools/lib/python/kdoc/python_version.py |    2 -
 5 files changed, 26 insertions(+), 26 deletions(-)

--- linux-next-20251121.orig/tools/lib/python/kdoc/kdoc_files.py
+++ linux-next-20251121/tools/lib/python/kdoc/kdoc_files.py
@@ -64,7 +64,7 @@ class GlobSourceFiles:
 
     def parse_files(self, file_list, file_not_found_cb):
         """
-        Define an interator to parse all source files from file_list,
+        Define an iterator to parse all source files from file_list,
         handling directories if any
         """
 
@@ -229,7 +229,7 @@ class KernelFiles():
         Return output messages from a file name using the output style
         filtering.
 
-        If output type was not handled by the syler, return None.
+        If output type was not handled by the styler, return None.
         """
 
         # NOTE: we can add rules here to filter out unwanted parts,
--- linux-next-20251121.orig/tools/lib/python/kdoc/kdoc_output.py
+++ linux-next-20251121/tools/lib/python/kdoc/kdoc_output.py
@@ -8,7 +8,7 @@
 Implement output filters to print kernel-doc documentation.
 
 The implementation uses a virtual base class (OutputFormat) which
-contains a dispatches to virtual methods, and some code to filter
+contains dispatches to virtual methods, and some code to filter
 out output messages.
 
 The actual implementation is done on one separate class per each type
@@ -59,7 +59,7 @@ class OutputFormat:
     OUTPUT_EXPORTED     = 2 # output exported symbols
     OUTPUT_INTERNAL     = 3 # output non-exported symbols
 
-    # Virtual member to be overriden at the  inherited classes
+    # Virtual member to be overridden at the inherited classes
     highlights = []
 
     def __init__(self):
@@ -85,7 +85,7 @@ class OutputFormat:
     def set_filter(self, export, internal, symbol, nosymbol, function_table,
                    enable_lineno, no_doc_sections):
         """
-        Initialize filter variables according with the requested mode.
+        Initialize filter variables according to the requested mode.
 
         Only one choice is valid between export, internal and symbol.
 
@@ -212,7 +212,7 @@ class OutputFormat:
             return self.data
 
         # Warn if some type requires an output logic
-        self.config.log.warning("doesn't now how to output '%s' block",
+        self.config.log.warning("doesn't know how to output '%s' block",
                                 dtype)
 
         return None
--- linux-next-20251121.orig/tools/lib/python/kdoc/kdoc_parser.py
+++ linux-next-20251121/tools/lib/python/kdoc/kdoc_parser.py
@@ -22,8 +22,8 @@ from kdoc.kdoc_item import KdocItem
 #
 # Regular expressions used to parse kernel-doc markups at KernelDoc class.
 #
-# Let's declare them in lowercase outside any class to make easier to
-# convert from the python script.
+# Let's declare them in lowercase outside any class to make it easier to
+# convert from the Perl script.
 #
 # As those are evaluated at the beginning, no need to cache them
 #
@@ -133,7 +133,7 @@ struct_xforms = [
     # TODO: use NestedMatch for FOO($1, $2, ...) matches
     #
     # it is better to also move those to the NestedMatch logic,
-    # to ensure that parenthesis will be properly matched.
+    # to ensure that parentheses will be properly matched.
     #
     (KernRe(r'__ETHTOOL_DECLARE_LINK_MODE_MASK\s*\(([^\)]+)\)', re.S),
      r'DECLARE_BITMAP(\1, __ETHTOOL_LINK_MODE_MASK_NBITS)'),
@@ -153,7 +153,7 @@ struct_xforms = [
     (KernRe(r'DEFINE_DMA_UNMAP_LEN\s*\(' + struct_args_pattern + r'\)', re.S), r'__u32 \1'),
 ]
 #
-# Regexes here are guaranteed to have the end limiter matching
+# Regexes here are guaranteed to have the end delimiter matching
 # the start delimiter. Yet, right now, only one replace group
 # is allowed.
 #
@@ -812,7 +812,7 @@ class KernelDoc:
 
     def dump_struct(self, ln, proto):
         """
-        Store an entry for an struct or union
+        Store an entry for a struct or union
         """
         #
         # Do the basic parse to get the pieces of the declaration.
@@ -995,7 +995,7 @@ class KernelDoc:
 
     def dump_function(self, ln, prototype):
         """
-        Stores a function of function macro inside self.entries array.
+        Stores a function or function macro inside self.entries array.
         """
 
         found = func_macro = False
@@ -1230,7 +1230,7 @@ class KernelDoc:
             #
             else:
                 self.emit_msg(ln,
-                              f"This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst\n{line}")
+                              f"This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst\n{line}")
                 self.state = state.NORMAL
                 return
             #
--- linux-next-20251121.orig/tools/lib/python/kdoc/kdoc_re.py
+++ linux-next-20251121/tools/lib/python/kdoc/kdoc_re.py
@@ -16,7 +16,7 @@ re_cache = {}
 
 class KernRe:
     """
-    Helper class to simplify regex declaration and usage,
+    Helper class to simplify regex declaration and usage.
 
     It calls re.compile for a given pattern. It also allows adding
     regular expressions and define sub at class init time.
@@ -27,7 +27,7 @@ class KernRe:
 
     def _add_regex(self, string, flags):
         """
-        Adds a new regex or re-use it from the cache.
+        Adds a new regex or reuses it from the cache.
         """
         self.regex = re_cache.get(string, None)
         if not self.regex:
@@ -114,7 +114,7 @@ class NestedMatch:
 
             '\\bSTRUCT_GROUP(\\(((?:(?>[^)(]+)|(?1))*)\\))[^;]*;'
 
-    which is used to properly match open/close parenthesis of the
+    which is used to properly match open/close parentheses of the
     string search STRUCT_GROUP(),
 
     Add a class that counts pairs of delimiters, using it to match and
@@ -136,13 +136,13 @@ class NestedMatch:
     #       \bSTRUCT_GROUP\(
     #
     # is similar to: STRUCT_GROUP\((.*)\)
-    # except that the content inside the match group is delimiter's aligned.
+    # except that the content inside the match group is delimiter-aligned.
     #
-    # The content inside parenthesis are converted into a single replace
+    # The content inside parentheses is converted into a single replace
     # group (e.g. r`\1').
     #
     # It would be nice to change such definition to support multiple
-    # match groups, allowing a regex equivalent to.
+    # match groups, allowing a regex equivalent to:
     #
     #   FOO\((.*), (.*), (.*)\)
     #
@@ -168,14 +168,14 @@ class NestedMatch:
         but I ended using a different implementation to align all three types
         of delimiters and seek for an initial regular expression.
 
-        The algorithm seeks for open/close paired delimiters and place them
-        into a stack, yielding a start/stop position of each match  when the
+        The algorithm seeks for open/close paired delimiters and places them
+        into a stack, yielding a start/stop position of each match when the
         stack is zeroed.
 
-        The algorithm shoud work fine for properly paired lines, but will
-        silently ignore end delimiters that preceeds an start delimiter.
+        The algorithm should work fine for properly paired lines, but will
+        silently ignore end delimiters that precede a start delimiter.
         This should be OK for kernel-doc parser, as unaligned delimiters
-        would cause compilation errors. So, we don't need to rise exceptions
+        would cause compilation errors. So, we don't need to raise exceptions
         to cover such issues.
         """
 
@@ -203,7 +203,7 @@ class NestedMatch:
                     stack.append(end)
                     continue
 
-                # Does the end delimiter match what it is expected?
+                # Does the end delimiter match what is expected?
                 if stack and d == stack[-1]:
                     stack.pop()
 
--- linux-next-20251121.orig/tools/lib/python/kdoc/python_version.py
+++ linux-next-20251121/tools/lib/python/kdoc/python_version.py
@@ -139,7 +139,7 @@ class PythonVersion:
 
         available_versions = PythonVersion.find_python(min_version)
         if not available_versions:
-            print(f"ERROR: Python version {python_ver} is not spported anymore\n")
+            print(f"ERROR: Python version {python_ver} is not supported anymore\n")
             print("       Can't find a new version. This script may fail")
             return
 
