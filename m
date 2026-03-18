Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104983A1A55;
	Wed, 18 Mar 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825081; cv=none; b=sYQslGZuHknMh8gdNRSXtThEFsMGbcRPqMdCQkkNMGljRhnuIeLhWNCmyJ4aE+gvHi0duWoXNsMuRBcaVGCfYccfZXeHoh/8QDmWgoFC2z/j7cUO5Zjpa+ciy+sMpxn62CfD3oYJUXkXQ/D62ns8LxjuIIIfH3CSvW6ADLhwzpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825081; c=relaxed/simple;
	bh=scL+K6GSvLApr7G1/Af3VPGVcWpWnw78ruddz9ClsaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RSrsjn3Jw+d30v7fks95Ut9xgkuHNunHxkKP2c+tSlbG1xIj+mXYKiTwJIvMIrbU6n7ezziE0+5qpAxVs/CLvBn8RgwHSWJHg6ulYLp/AdrjiDH3wb+EG/GkgbzG2/jiMNZ3sU1b6Q0oUQXvp0i95JuXc+qPLNPOgv7awZ8r00c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKjY/H39; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKjY/H39"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D99C4AF0C;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773825080;
	bh=scL+K6GSvLApr7G1/Af3VPGVcWpWnw78ruddz9ClsaI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kKjY/H39l9jiKmSMDtZK788cFtVzTVP38/JwHMYZEl6FQVOLLTQs8xmX9+NXFQBSO
	 mmvdYFSF4X8XgKQbnerfrtCSt4XZUtLFl6OFsbbp2JVxJI+cR0vjoXz/mvDQoxSJzN
	 +CIClbJPwXZeRkXiT5cqBhY3E2ZGph/eE+6f02d3X+W67oJcgshilK0GeMXa52O79u
	 oXjwNh+QXfBxzUcRX5IjOnrzKWqwOes37T3iqAm6efwNWKj3yAqqGwERr8MrF7Lm22
	 xXItJRCG6rEDYUnClV6SSbEpYii8wAkxBmlwkgn4w8ia+S/CMs+pt3ku4mmWDlrsHg
	 INJva+tyh/wLA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2mvu-00000002fqA-3ScD;
	Wed, 18 Mar 2026 10:11:18 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 14/14] docs: kernel-doc: add support to store output on a YAML file
Date: Wed, 18 Mar 2026 10:11:14 +0100
Message-ID: <ba54277b3c909867153b9547dfa33c1831ca35d9.1773823995.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1773823995.git.mchehab+huawei@kernel.org>
References: <cover.1773823995.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Add a command line parameter and library support to optionally
store:
- KdocItem intermediate format after parsing;
- man pages output;
- rst output.

inside a YAML file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/kernel-doc                | 48 +++++++++++++++++++++++-----
 tools/lib/python/kdoc/kdoc_files.py  | 47 +++++++++++++++++++++++----
 tools/lib/python/kdoc/kdoc_parser.py | 27 +++++++++++++++-
 3 files changed, 107 insertions(+), 15 deletions(-)

diff --git a/tools/docs/kernel-doc b/tools/docs/kernel-doc
index 3a932f95bdf5..d9192c3f1645 100755
--- a/tools/docs/kernel-doc
+++ b/tools/docs/kernel-doc
@@ -240,11 +240,9 @@ def main():
                         help=EXPORT_FILE_DESC)
 
     #
-    # Output format mutually-exclusive group
+    # Output format
     #
-    out_group = parser.add_argument_group("Output format selection (mutually exclusive)")
-
-    out_fmt = out_group.add_mutually_exclusive_group()
+    out_fmt = parser.add_argument_group("Output format selection (mutually exclusive)")
 
     out_fmt.add_argument("-m", "-man", "--man", action="store_true",
                          help="Output troff manual page format.")
@@ -253,6 +251,12 @@ def main():
     out_fmt.add_argument("-N", "-none", "--none", action="store_true",
                          help="Do not output documentation, only warnings.")
 
+    out_fmt.add_argument("-y", "--yaml-file", "--yaml",
+                         help="Stores kernel-doc output on a yaml file.")
+    out_fmt.add_argument("-k", "--kdoc-item", "--kdoc", action="store_true",
+                         help="Store KdocItem inside yaml file. Ued together with --yaml.")
+
+
     #
     # Output selection mutually-exclusive group
     #
@@ -323,14 +327,42 @@ def main():
     from kdoc.kdoc_files import KernelFiles             # pylint: disable=C0415
     from kdoc.kdoc_output import RestFormat, ManFormat  # pylint: disable=C0415
 
-    if args.man:
-        out_style = ManFormat(modulename=args.modulename)
-    elif args.none:
+    yaml_content = set()
+    if args.yaml_file:
         out_style = None
+
+        if args.man:
+            yaml_content |= {"man"}
+
+        if args.rst:
+            yaml_content |= {"rst"}
+
+        if args.kdoc_item or not yaml_content:
+            yaml_content |= {"KdocItem"}
+
     else:
-        out_style = RestFormat()
+        n_outputs = 0
+
+        if args.man:
+            out_style = ManFormat(modulename=args.modulename)
+            n_outputs += 1
+
+        if args.none:
+            out_style = None
+            n_outputs += 1
+
+        if  args.rst or n_outputs == 0:
+            n_outputs += 1
+            out_style = RestFormat()
+
+        if n_outputs > 1:
+             parser.error("Those arguments are muttually exclusive: --man, --rst, --none, except when generating a YAML file.")
+
+        elif not n_outputs:
+            out_style = RestFormat()
 
     kfiles = KernelFiles(verbose=args.verbose,
+                         yaml_file=args.yaml_file, yaml_content=yaml_content,
                          out_style=out_style, werror=args.werror,
                          wreturn=args.wreturn, wshort_desc=args.wshort_desc,
                          wcontents_before_sections=args.wcontents_before_sections)
diff --git a/tools/lib/python/kdoc/kdoc_files.py b/tools/lib/python/kdoc/kdoc_files.py
index 58f4ee08e226..5a299ed44d62 100644
--- a/tools/lib/python/kdoc/kdoc_files.py
+++ b/tools/lib/python/kdoc/kdoc_files.py
@@ -16,6 +16,7 @@ import re
 from kdoc.kdoc_parser import KernelDoc
 from kdoc.xforms_lists import CTransforms
 from kdoc.kdoc_output import OutputFormat
+from kdoc.kdoc_yaml_file import KDocTestFile
 
 
 class GlobSourceFiles:
@@ -152,6 +153,12 @@ class KernelFiles():
 
         If not specified, defaults to use: ``logging.getLogger("kernel-doc")``
 
+    ``yaml_file``
+        If defined, stores the output inside a YAML file.
+
+    ``yaml_content``
+        Defines what will be inside the YAML file.
+
     Note:
         There are two type of parsers defined here:
 
@@ -181,7 +188,12 @@ class KernelFiles():
         if fname in self.files:
             return
 
-        doc = KernelDoc(self.config, fname, self.xforms)
+        if self.test_file:
+            store_src = True
+        else:
+            store_src = False
+
+        doc = KernelDoc(self.config, fname, self.xforms, store_src=store_src)
         export_table, entries = doc.parse_kdoc()
 
         self.export_table[fname] = export_table
@@ -191,6 +203,10 @@ class KernelFiles():
 
         self.results[fname] = entries
 
+        source = doc.get_source()
+        if source:
+            self.source[fname] = source
+
     def process_export_file(self, fname):
         """
         Parses ``EXPORT_SYMBOL*`` macros from a single Kernel source file.
@@ -220,7 +236,7 @@ class KernelFiles():
     def __init__(self, verbose=False, out_style=None, xforms=None,
                  werror=False, wreturn=False, wshort_desc=False,
                  wcontents_before_sections=False,
-                 logger=None):
+                 yaml_file=None, yaml_content=None, logger=None):
         """
         Initialize startup variables and parse all files.
         """
@@ -259,6 +275,11 @@ class KernelFiles():
         # Override log warning, as we want to count errors
         self.config.warning = self.warning
 
+        if yaml_file:
+            self.test_file = KDocTestFile(self.config, yaml_file, yaml_content)
+        else:
+            self.test_file = None
+
         if xforms:
             self.xforms = xforms
         else:
@@ -273,6 +294,7 @@ class KernelFiles():
 
         self.errors = 0
         self.results = {}
+        self.source = {}
 
         self.files = set()
         self.export_files = set()
@@ -331,16 +353,29 @@ class KernelFiles():
                 for s in symbol:
                     function_table.add(s)
 
-            self.out_style.set_filter(export, internal, symbol, nosymbol,
-                                      function_table, enable_lineno,
-                                      no_doc_sections)
-
             if fname not in self.results:
                 self.config.log.warning("No kernel-doc for file %s", fname)
                 continue
 
             symbols = self.results[fname]
 
+            if self.test_file:
+                self.test_file.set_filter(export, internal, symbol, nosymbol,
+                                          function_table, enable_lineno,
+                                          no_doc_sections)
+
+                self.test_file.output_symbols(fname, symbols,
+                                              self.source.get(fname))
+
+                continue
+
+            self.out_style.set_filter(export, internal, symbol, nosymbol,
+                                      function_table, enable_lineno,
+                                      no_doc_sections)
+
             msg = self.out_style.output_symbols(fname, symbols)
             if msg:
                 yield fname, msg
+
+        if self.test_file:
+            self.test_file.write()
diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 35658a7e72d5..a10e64589d76 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -246,12 +246,13 @@ class KernelDoc:
     #: String to write when a parameter is not described.
     undescribed = "-- undescribed --"
 
-    def __init__(self, config, fname, xforms):
+    def __init__(self, config, fname, xforms, store_src=False):
         """Initialize internal variables"""
 
         self.fname = fname
         self.config = config
         self.xforms = xforms
+        self.store_src = store_src
 
         tokenizer_set_log(self.config.log, f"{self.fname}: CMatch: ")
 
@@ -264,6 +265,9 @@ class KernelDoc:
         # Place all potential outputs into an array
         self.entries = []
 
+        # When store_src is true, the kernel-doc source content is stored here
+        self.source = None
+
         #
         # We need Python 3.7 for its "dicts remember the insertion
         # order" guarantee
@@ -1592,6 +1596,15 @@ class KernelDoc:
         state.DOCBLOCK:			process_docblock,
         }
 
+    def get_source(self):
+        """
+        Return the file content of the lines handled by kernel-doc at the
+        latest parse_kdoc() run.
+
+        Returns none if KernelDoc() was not initialized with store_src,
+        """
+        return self.source
+
     def parse_kdoc(self):
         """
         Open and process each line of a C source file.
@@ -1605,6 +1618,8 @@ class KernelDoc:
         prev = ""
         prev_ln = None
         export_table = set()
+        self.source = []
+        self.state = state.NORMAL
 
         try:
             with open(self.fname, "r", encoding="utf8",
@@ -1631,6 +1646,8 @@ class KernelDoc:
                                           ln, state.name[self.state],
                                           line)
 
+                    prev_state = self.state
+
                     # This is an optimization over the original script.
                     # There, when export_file was used for the same file,
                     # it was read twice. Here, we use the already-existing
@@ -1641,6 +1658,14 @@ class KernelDoc:
                         # Hand this line to the appropriate state handler
                         self.state_actions[self.state](self, ln, line)
 
+                    if self.store_src and prev_state != self.state or self.state != state.NORMAL:
+                        if self.state == state.NAME:
+                            # A "/**" was detected. Add a new source element
+                            self.source.append({"ln": ln, "data": line + "\n"})
+                        else:
+                            # Append to the existing one
+                            self.source[-1]["data"] += line + "\n"
+
             self.emit_unused_warnings()
 
         except OSError:
-- 
2.53.0

