Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A108F3B52FC;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768491642; cv=none; b=MvxbT3PHvPD4lrSc6pX2FNCfO9WzW5rv0JpS03UI4p9m0EQySOJa/HdJ/kHWr6Ml6Rr95n1+kdtXbS4093KRO62vLbWHn654hq9jkN3YeeONIwDl0e0CaHliIeNvCAzph3WiT02THhYhS/tgURPEplCVANGDCPe/XNEOOauuY3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768491642; c=relaxed/simple;
	bh=xzN+qnwUzc8uS+xH26py+FM48k+pV86aU/2bH+RENHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TM+vvAVJt/lmk59Rkg+hD+0OOLS81/YbSlkJh7B11WtArJkLsX46OsSszCKR/zV8uMRF5sCOd+HuI1XLQATwlXzUJNDjeXumMjCwGR+qKfm70/WcVB2iPgrJad4UshwUApy0oG0JLBbbftOV3mpz9uJg5QCyQD9+B0fLY5+vOoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a2ZqJKlj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a2ZqJKlj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD8CC2BCB0;
	Thu, 15 Jan 2026 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768491642;
	bh=xzN+qnwUzc8uS+xH26py+FM48k+pV86aU/2bH+RENHY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a2ZqJKljQvQPtAjFXbbjB1XjOH7tc5AJsrAg9wC/KZCm3Oli5AaTxjZrAqrNI6lXx
	 t9c888bdiGhFvaGiIH3FuLwp5Fm7ATaXjYQuZZZ+3XWdynReSIwr0Qfe6XWAEXXbYV
	 +2v5uHY/zsfXcjGAgZB3EULSOFPJOQecuJA4NF3wlF4Q3NKWMVA5CUEBdBYferrzXx
	 jAKWUsCoTNhAjs68oT5weDRFKvTiZ6vP74i+Y/4owegor3cgH4Bc62x/bgrdxygO/J
	 2QaI76RPZUy+QJH0uN2Ur4+iEnqS3UBh41N0lFhR+2Q2do7r2mVMek68gFSL3U2SbE
	 +TGa+0ND031BA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vgPSi-000000043Ih-1OhS;
	Thu, 15 Jan 2026 16:40:40 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 09/15] docs: kdoc_parser: Improve docstrings and comments
Date: Thu, 15 Jan 2026 16:40:30 +0100
Message-ID: <fcbd11d519277ae319bc9eee46b42da2576604b9.1768488832.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768488832.git.mchehab+huawei@kernel.org>
References: <cover.1768488832.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

In preparation to document kernel-doc module, improve its
documentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 169 +++++++++++++++------------
 1 file changed, 92 insertions(+), 77 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index a9a37519145d..bd88a2cd60c3 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -5,11 +5,8 @@
 # pylint: disable=C0301,C0302,R0904,R0912,R0913,R0914,R0915,R0917,R1702
 
 """
-kdoc_parser
-===========
-
-Read a C language source or header FILE and extract embedded
-documentation comments
+Classes and functions related to reading a C language source or header FILE
+and extract embedded documentation comments from it.
 """
 
 import sys
@@ -195,25 +192,28 @@ function_xforms  = [
 ]
 
 #
-# Apply a set of transforms to a block of text.
+# Ancillary functions
 #
+
 def apply_transforms(xforms, text):
+    """
+    Apply a set of transforms to a block of text.
+    """
     for search, subst in xforms:
         text = search.sub(subst, text)
     return text
 
-#
-# A little helper to get rid of excess white space
-#
 multi_space = KernRe(r'\s\s+')
 def trim_whitespace(s):
+    """
+    A little helper to get rid of excess white space.
+    """
     return multi_space.sub(' ', s.strip())
 
-#
-# Remove struct/enum members that have been marked "private".
-#
 def trim_private_members(text):
-    #
+    """
+    Remove ``struct``/``enum`` members that have been marked "private".
+    """
     # First look for a "public:" block that ends a private region, then
     # handle the "private until the end" case.
     #
@@ -226,20 +226,21 @@ def trim_private_members(text):
 
 class state:
     """
-    State machine enums
+    States used by the parser's state machine.
     """
 
     # Parser states
-    NORMAL        = 0        # normal code
-    NAME          = 1        # looking for function name
-    DECLARATION   = 2        # We have seen a declaration which might not be done
-    BODY          = 3        # the body of the comment
-    SPECIAL_SECTION = 4      # doc section ending with a blank line
-    PROTO         = 5        # scanning prototype
-    DOCBLOCK      = 6        # documentation block
-    INLINE_NAME   = 7        # gathering doc outside main block
-    INLINE_TEXT   = 8	     # reading the body of inline docs
+    NORMAL        = 0        #: Normal code.
+    NAME          = 1        #: Looking for function name.
+    DECLARATION   = 2        #: We have seen a declaration which might not be done.
+    BODY          = 3        #: The body of the comment.
+    SPECIAL_SECTION = 4      #: Doc section ending with a blank line.
+    PROTO         = 5        #: Scanning prototype.
+    DOCBLOCK      = 6        #: Documentation block.
+    INLINE_NAME   = 7        #: Gathering doc outside main block.
+    INLINE_TEXT   = 8	     #: Reading the body of inline docs.
 
+    #: Names for each parser state.
     name = [
         "NORMAL",
         "NAME",
@@ -253,9 +254,12 @@ class state:
     ]
 
 
-SECTION_DEFAULT = "Description"  # default section
+SECTION_DEFAULT = "Description"  #: Default section.
 
 class KernelEntry:
+    """
+    Encapsulates a Kernel documentation entry.
+    """
 
     def __init__(self, config, fname, ln):
         self.config = config
@@ -288,9 +292,11 @@ class KernelEntry:
     # Management of section contents
     #
     def add_text(self, text):
+        """Add a new text to the entry contents list."""
         self._contents.append(text)
 
     def contents(self):
+        """Returns a string with all content texts that were added."""
         return '\n'.join(self._contents) + '\n'
 
     # TODO: rename to emit_message after removal of kernel-doc.pl
@@ -309,10 +315,10 @@ class KernelEntry:
         self.warnings.append(log_msg)
         return
 
-    #
-    # Begin a new section.
-    #
     def begin_section(self, line_no, title = SECTION_DEFAULT, dump = False):
+        """
+        Begin a new section.
+        """
         if dump:
             self.dump_section(start_new = True)
         self.section = title
@@ -366,11 +372,13 @@ class KernelDoc:
     documentation comments.
     """
 
-    # Section names
-
+    #: Name of context section.
     section_context = "Context"
+
+    #: Name of return section.
     section_return = "Return"
 
+    #: String to write when a parameter is not described.
     undescribed = "-- undescribed --"
 
     def __init__(self, config, fname):
@@ -416,7 +424,7 @@ class KernelDoc:
 
     def dump_section(self, start_new=True):
         """
-        Dumps section contents to arrays/hashes intended for that purpose.
+        Dump section contents to arrays/hashes intended for that purpose.
         """
 
         if self.entry:
@@ -425,9 +433,9 @@ class KernelDoc:
     # TODO: rename it to store_declaration after removal of kernel-doc.pl
     def output_declaration(self, dtype, name, **args):
         """
-        Stores the entry into an entry array.
+        Store the entry into an entry array.
 
-        The actual output and output filters will be handled elsewhere
+        The actual output and output filters will be handled elsewhere.
         """
 
         item = KdocItem(name, self.fname, dtype,
@@ -663,10 +671,12 @@ class KernelDoc:
             self.emit_msg(ln,
                           f"No description found for return value of '{declaration_name}'")
 
-    #
-    # Split apart a structure prototype; returns (struct|union, name, members) or None
-    #
     def split_struct_proto(self, proto):
+        """
+        Split apart a structure prototype; returns (struct|union, name,
+        members) or ``None``.
+        """
+
         type_pattern = r'(struct|union)'
         qualifiers = [
             "__attribute__",
@@ -685,21 +695,26 @@ class KernelDoc:
             if r.search(proto):
                 return (r.group(1), r.group(3), r.group(2))
         return None
-    #
-    # Rewrite the members of a structure or union for easier formatting later on.
-    # Among other things, this function will turn a member like:
-    #
-    #  struct { inner_members; } foo;
-    #
-    # into:
-    #
-    #  struct foo; inner_members;
-    #
+
     def rewrite_struct_members(self, members):
+        """
+        Process ``struct``/``union`` members from the most deeply nested
+        outward.
+
+        Rewrite the members of a ``struct`` or ``union`` for easier formatting
+        later on. Among other things, this function will turn a member like::
+
+          struct { inner_members; } foo;
+
+        into::
+
+          struct foo; inner_members;
+        """
+
         #
-        # Process struct/union members from the most deeply nested outward.  The
-        # trick is in the ^{ below - it prevents a match of an outer struct/union
-        # until the inner one has been munged (removing the "{" in the process).
+        # The trick is in the ``^{`` below - it prevents a match of an outer
+        # ``struct``/``union`` until the inner one has been munged
+        # (removing the ``{`` in the process).
         #
         struct_members = KernRe(r'(struct|union)'   # 0: declaration type
                                 r'([^\{\};]+)' 	    # 1: possible name
@@ -777,11 +792,12 @@ class KernelDoc:
             tuples = struct_members.findall(members)
         return members
 
-    #
-    # Format the struct declaration into a standard form for inclusion in the
-    # resulting docs.
-    #
     def format_struct_decl(self, declaration):
+        """
+        Format the ``struct`` declaration into a standard form for inclusion
+        in the resulting docs.
+        """
+
         #
         # Insert newlines, get rid of extra spaces.
         #
@@ -815,7 +831,7 @@ class KernelDoc:
 
     def dump_struct(self, ln, proto):
         """
-        Store an entry for a struct or union
+        Store an entry for a ``struct`` or ``union``
         """
         #
         # Do the basic parse to get the pieces of the declaration.
@@ -857,7 +873,7 @@ class KernelDoc:
 
     def dump_enum(self, ln, proto):
         """
-        Stores an enum inside self.entries array.
+        Store an ``enum`` inside self.entries array.
         """
         #
         # Strip preprocessor directives.  Note that this depends on the
@@ -1004,7 +1020,7 @@ class KernelDoc:
 
     def dump_declaration(self, ln, prototype):
         """
-        Stores a data declaration inside self.entries array.
+        Store a data declaration inside self.entries array.
         """
 
         if self.entry.decl_type == "enum":
@@ -1021,7 +1037,7 @@ class KernelDoc:
 
     def dump_function(self, ln, prototype):
         """
-        Stores a function or function macro inside self.entries array.
+        Store a function or function macro inside self.entries array.
         """
 
         found = func_macro = False
@@ -1122,7 +1138,7 @@ class KernelDoc:
 
     def dump_typedef(self, ln, proto):
         """
-        Stores a typedef inside self.entries array.
+        Store a ``typedef`` inside self.entries array.
         """
         #
         # We start by looking for function typedefs.
@@ -1176,7 +1192,7 @@ class KernelDoc:
     @staticmethod
     def process_export(function_set, line):
         """
-        process EXPORT_SYMBOL* tags
+        process ``EXPORT_SYMBOL*`` tags
 
         This method doesn't use any variable from the class, so declare it
         with a staticmethod decorator.
@@ -1207,7 +1223,7 @@ class KernelDoc:
 
     def process_normal(self, ln, line):
         """
-        STATE_NORMAL: looking for the /** to begin everything.
+        STATE_NORMAL: looking for the ``/**`` to begin everything.
         """
 
         if not doc_start.match(line):
@@ -1297,10 +1313,10 @@ class KernelDoc:
         else:
             self.emit_msg(ln, f"Cannot find identifier on line:\n{line}")
 
-    #
-    # Helper function to determine if a new section is being started.
-    #
     def is_new_section(self, ln, line):
+        """
+        Helper function to determine if a new section is being started.
+        """
         if doc_sect.search(line):
             self.state = state.BODY
             #
@@ -1332,10 +1348,10 @@ class KernelDoc:
             return True
         return False
 
-    #
-    # Helper function to detect (and effect) the end of a kerneldoc comment.
-    #
     def is_comment_end(self, ln, line):
+        """
+        Helper function to detect (and effect) the end of a kerneldoc comment.
+        """
         if doc_end.search(line):
             self.dump_section()
 
@@ -1354,7 +1370,7 @@ class KernelDoc:
 
     def process_decl(self, ln, line):
         """
-        STATE_DECLARATION: We've seen the beginning of a declaration
+        STATE_DECLARATION: We've seen the beginning of a declaration.
         """
         if self.is_new_section(ln, line) or self.is_comment_end(ln, line):
             return
@@ -1383,7 +1399,7 @@ class KernelDoc:
 
     def process_special(self, ln, line):
         """
-        STATE_SPECIAL_SECTION: a section ending with a blank line
+        STATE_SPECIAL_SECTION: a section ending with a blank line.
         """
         #
         # If we have hit a blank line (only the " * " marker), then this
@@ -1473,7 +1489,7 @@ class KernelDoc:
 
     def syscall_munge(self, ln, proto):         # pylint: disable=W0613
         """
-        Handle syscall definitions
+        Handle syscall definitions.
         """
 
         is_void = False
@@ -1512,7 +1528,7 @@ class KernelDoc:
 
     def tracepoint_munge(self, ln, proto):
         """
-        Handle tracepoint definitions
+        Handle tracepoint definitions.
         """
 
         tracepointname = None
@@ -1548,7 +1564,7 @@ class KernelDoc:
         return proto
 
     def process_proto_function(self, ln, line):
-        """Ancillary routine to process a function prototype"""
+        """Ancillary routine to process a function prototype."""
 
         # strip C99-style comments to end of line
         line = KernRe(r"//.*$", re.S).sub('', line)
@@ -1593,7 +1609,9 @@ class KernelDoc:
             self.reset_state(ln)
 
     def process_proto_type(self, ln, line):
-        """Ancillary routine to process a type"""
+        """
+        Ancillary routine to process a type.
+        """
 
         # Strip C99-style comments and surrounding whitespace
         line = KernRe(r"//.*$", re.S).sub('', line).strip()
@@ -1647,7 +1665,7 @@ class KernelDoc:
             self.process_proto_type(ln, line)
 
     def process_docblock(self, ln, line):
-        """STATE_DOCBLOCK: within a DOC: block."""
+        """STATE_DOCBLOCK: within a ``DOC:`` block."""
 
         if doc_end.search(line):
             self.dump_section()
@@ -1659,7 +1677,7 @@ class KernelDoc:
 
     def parse_export(self):
         """
-        Parses EXPORT_SYMBOL* macros from a single Kernel source file.
+        Parses ``EXPORT_SYMBOL*`` macros from a single Kernel source file.
         """
 
         export_table = set()
@@ -1676,10 +1694,7 @@ class KernelDoc:
 
         return export_table
 
-    #
-    # The state/action table telling us which function to invoke in
-    # each state.
-    #
+    #: The state/action table telling us which function to invoke in each state.
     state_actions = {
         state.NORMAL:			process_normal,
         state.NAME:			process_name,
-- 
2.52.0

