Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985C02EA743;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=UH9pvtcHKCrUUWL4lM8baeE/vZI45ps/nSo0T0nOzu71dBpVPN6QvNL7Iv/5JKno2RxJL8MAjGTSRx7CBEocb1942GL80twrsN8q1zO/TctVqn89/KoOlAAYVHybVfwr0d632NJTHgJ7CLFnCtOw9R6hniSxr7FEGOJ2OSMGpGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=FI+Dh9Iu2wtKz8NU+WdlvdtlEUg2nNsIV9O2y+kNbi8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sLmbxONt8VjBq2EJJHLiVQ/7abkbvLIwG1Y4FQJuTsFHQS4/ON8XJ+8RTPILhZ16SkPIW1wbUXAWjzRUYIcRSAnnhXoiHNxtkYUz9/NU/uqxwC10UpMt6xZUtyaWY7yOZTn3TTidsnKXV3VdSzZzutpiSoXM3Nu23UTP+Inl/RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gd43tT/V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gd43tT/V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 265EFC2BCAF;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=FI+Dh9Iu2wtKz8NU+WdlvdtlEUg2nNsIV9O2y+kNbi8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gd43tT/VzX+e0vhUUwiPFrf8umj+f8cr2Qt+AeCjbBnOWMe4e9vhyaABJDRaVtVfs
	 iOe0xG4nSMd3VLempSi+HI1E7/4fDLZAULQtgeRBdRSCRx/mbf/3E8MDIUigSijJwz
	 qoszrhzOH93MsuAHYjzvfcaD6pAaERwMKcGuxg3MloxmExOXpjsyfMnMEBIPYcbnrK
	 ZAG4qYiwdBz46lIdkn1lBKdw/dOXydomOodp9OxwjxTfWm3GSG6ItPGrOmS7eARJhm
	 lOLa7ZfECQTVgW7KbRf4r9Rth/GV8foo/n2rqbNzczo6mdaAb1UhZTuFxctN3cPcuk
	 bwf6tJenqWl1g==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j20-1T4E;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 10/25] docs: kdoc_output: Improve docstrings and comments
Date: Mon, 19 Jan 2026 17:23:13 +0100
Message-ID: <ac03bf776f0929bbe822cd8269f2a31e275b8d6b.1768838938.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1768838938.git.mchehab+huawei@kernel.org>
References: <cover.1768838938.git.mchehab+huawei@kernel.org>
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
 tools/lib/python/kdoc/kdoc_output.py | 60 ++++++++++++++++------------
 1 file changed, 35 insertions(+), 25 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index d2bf94275d65..4210b91dde5f 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -5,14 +5,16 @@
 # pylint: disable=C0301,R0902,R0911,R0912,R0913,R0914,R0915,R0917
 
 """
-Implement output filters to print kernel-doc documentation.
+Classes to implement output filters to print kernel-doc documentation.
 
-The implementation uses a virtual base class (OutputFormat) which
+The implementation uses a virtual base class ``OutputFormat``. It
 contains dispatches to virtual methods, and some code to filter
 out output messages.
 
 The actual implementation is done on one separate class per each type
-of output. Currently, there are output classes for ReST and man/troff.
+of output, e.g. ``RestFormat`` and ``ManFormat`` classes.
+
+Currently, there are output classes for ReST and man/troff.
 """
 
 import os
@@ -54,16 +56,19 @@ class OutputFormat:
     """
 
     # output mode.
-    OUTPUT_ALL          = 0 # output all symbols and doc sections
-    OUTPUT_INCLUDE      = 1 # output only specified symbols
-    OUTPUT_EXPORTED     = 2 # output exported symbols
-    OUTPUT_INTERNAL     = 3 # output non-exported symbols
+    OUTPUT_ALL          = 0 #: Output all symbols and doc sections.
+    OUTPUT_INCLUDE      = 1 #: Output only specified symbols.
+    OUTPUT_EXPORTED     = 2 #: Output exported symbols.
+    OUTPUT_INTERNAL     = 3 #: Output non-exported symbols.
 
-    # Virtual member to be overridden at the inherited classes
+    #: Highlights to be used in ReST format.
     highlights = []
 
+    #: Blank line character.
+    blankline = ""
+
     def __init__(self):
-        """Declare internal vars and set mode to OUTPUT_ALL"""
+        """Declare internal vars and set mode to ``OUTPUT_ALL``."""
 
         self.out_mode = self.OUTPUT_ALL
         self.enable_lineno = None
@@ -128,7 +133,7 @@ class OutputFormat:
             self.config.warning(log_msg)
 
     def check_doc(self, name, args):
-        """Check if DOC should be output"""
+        """Check if DOC should be output."""
 
         if self.no_doc_sections:
             return False
@@ -177,7 +182,7 @@ class OutputFormat:
 
     def msg(self, fname, name, args):
         """
-        Handles a single entry from kernel-doc parser
+        Handles a single entry from kernel-doc parser.
         """
 
         self.data = ""
@@ -220,30 +225,31 @@ class OutputFormat:
     # Virtual methods to be overridden by inherited classes
     # At the base class, those do nothing.
     def set_symbols(self, symbols):
-        """Get a list of all symbols from kernel_doc"""
+        """Get a list of all symbols from kernel_doc."""
 
     def out_doc(self, fname, name, args):
-        """Outputs a DOC block"""
+        """Outputs a DOC block."""
 
     def out_function(self, fname, name, args):
-        """Outputs a function"""
+        """Outputs a function."""
 
     def out_enum(self, fname, name, args):
-        """Outputs an enum"""
+        """Outputs an enum."""
 
     def out_var(self, fname, name, args):
-        """Outputs a variable"""
+        """Outputs a variable."""
 
     def out_typedef(self, fname, name, args):
-        """Outputs a typedef"""
+        """Outputs a typedef."""
 
     def out_struct(self, fname, name, args):
-        """Outputs a struct"""
+        """Outputs a struct."""
 
 
 class RestFormat(OutputFormat):
-    """Consts and functions used by ReST output"""
+    """Consts and functions used by ReST output."""
 
+    #: Highlights to be used in ReST format
     highlights = [
         (type_constant, r"``\1``"),
         (type_constant2, r"``\1``"),
@@ -263,9 +269,13 @@ class RestFormat(OutputFormat):
         (type_fallback, r":c:type:`\1`"),
         (type_param_ref, r"**\1\2**")
     ]
+
     blankline = "\n"
 
+    #: Sphinx literal block regex.
     sphinx_literal = KernRe(r'^[^.].*::$', cache=False)
+
+    #: Sphinx code block regex.
     sphinx_cblock = KernRe(r'^\.\.\ +code-block::', cache=False)
 
     def __init__(self):
@@ -280,7 +290,7 @@ class RestFormat(OutputFormat):
         self.lineprefix = ""
 
     def print_lineno(self, ln):
-        """Outputs a line number"""
+        """Outputs a line number."""
 
         if self.enable_lineno and ln is not None:
             ln += 1
@@ -289,7 +299,7 @@ class RestFormat(OutputFormat):
     def output_highlight(self, args):
         """
         Outputs a C symbol that may require being converted to ReST using
-        the self.highlights variable
+        the self.highlights variable.
         """
 
         input_text = args
@@ -570,7 +580,7 @@ class RestFormat(OutputFormat):
 
 
 class ManFormat(OutputFormat):
-    """Consts and functions used by man pages output"""
+    """Consts and functions used by man pages output."""
 
     highlights = (
         (type_constant, r"\1"),
@@ -587,6 +597,7 @@ class ManFormat(OutputFormat):
     )
     blankline = ""
 
+    #: Allowed timestamp formats.
     date_formats = [
         "%a %b %d %H:%M:%S %Z %Y",
         "%a %b %d %H:%M:%S %Y",
@@ -653,7 +664,7 @@ class ManFormat(OutputFormat):
         self.symbols = symbols
 
     def out_tail(self, fname, name, args):
-        """Adds a tail for all man pages"""
+        """Adds a tail for all man pages."""
 
         # SEE ALSO section
         self.data += f'.SH "SEE ALSO"' + "\n.PP\n"
@@ -689,7 +700,7 @@ class ManFormat(OutputFormat):
     def output_highlight(self, block):
         """
         Outputs a C symbol that may require being highlighted with
-        self.highlights variable using troff syntax
+        self.highlights variable using troff syntax.
         """
 
         contents = self.highlight_block(block)
@@ -720,7 +731,6 @@ class ManFormat(OutputFormat):
             self.output_highlight(text)
 
     def out_function(self, fname, name, args):
-        """output function in man"""
 
         out_name = self.arg_name(args, name)
 
-- 
2.52.0

