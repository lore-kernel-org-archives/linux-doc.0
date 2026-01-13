Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57C91CD1E4;
	Tue, 13 Jan 2026 17:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768325594; cv=none; b=mWlfj5/gcW5u9VnqzYDCAk0vZv/sv05laeLJMYbU/txsPq3YizRFuqQoyD+NwGuC7bSCRk6JUWsbdfh9wP02Cah110H3xdeEsdmKCL+r+NiZa/TURLxUeEGYlYshGiwG6K9KSJ3dESbr0dtTJipO3BytxVZ3vn/EGGrEtrDJ1JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768325594; c=relaxed/simple;
	bh=iYepMtZarVUO4l7XZF5+lqszRG7vxO25c/y6+Jl5d14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NpANLeiE1fmKjFQCtcPJJ/SzOulP6M75oJ680ZVSH0AVSVzgJ53t/MZ0YvkvEU6d9ALxbEoUBzzLNhCo/lT0f3QdRuAuvOgbySfeRzcsIcCqsLvi7j1JnSZazfqPVFbsyI/TLudyxRsEgh/xFljbQh6rEZ8HsfYNlkOwYVnXcqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VkTAuFLZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VkTAuFLZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03383C116C6;
	Tue, 13 Jan 2026 17:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768325594;
	bh=iYepMtZarVUO4l7XZF5+lqszRG7vxO25c/y6+Jl5d14=;
	h=From:To:Cc:Subject:Date:From;
	b=VkTAuFLZP9e99txg0RHewG4TbE/QqWwX99OGspaokpcjsLazd8adpVRYUvQ0bumfF
	 S80sGlCGheCP6ta2GKbFWRGZCUmYyK6A4Wl5CIbYniP5WWgH1oq9ULpHfhGbbrLNDp
	 lxQfV8fxeJJtAxiamSeNKBWK4iSMggPLgFvE7Enj/0UPsan1W2Q80VwHq2CAD30thA
	 HbuRuhpC7R/qOLs0TlVqf71mMeYb7gjFyars91TuZhWcT72m+gKrxIphNcWLG0ekxR
	 Z40/pDZkm3CzHsKJqZ9zHrQFq33gVOfuNxN4HxXlPAhKGbY+azvIqmb6uJuQud7YLJ
	 b6Tt2dDgAGWyg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vfiGW-0000000108G-08XJ;
	Tue, 13 Jan 2026 18:33:12 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH RFC] docs: add python module documentation
Date: Tue, 13 Jan 2026 18:33:08 +0100
Message-ID: <e1c3feccfc2728e1fa0ec3230be1e3c26bb92dfd.1768324835.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

While checking/improving docstrings inside kernel-doc, I noticed
that some changes there aren't Sphinx-compatible. Also, there are
several functions and some classes that miss documentation.

Being responsible for doing some documentation work, I felt blamed
on not having a good documentation of our own dog food :-)

So, I'm adding kdoc documentation to the Kernel documentation. The basic
change is just a couple of extra lines at conf.py, plus a few *.rst files
pointing to the files we want to document:

 Documentation/conf.py                       | 10 ++-                                                                       Documentation/tools/index.rst               |  1 +                                                                         Documentation/tools/kdoc.rst                | 45 +++++++++++                                                               Documentation/tools/kdoc_ancillary.rst      | 44 +++++++++++                                                               Documentation/tools/python.rst              |  8 ++ 

Sphinx has a helper script that is meant to populate autodoc files:

    $ sphinx-apidoc -o Documentation/output/python ./tools/lib/python

Would produce them, but such files need to be modified to produce a
nice documentation. The version I added above are written by hand,
using the auto-generated sphinx-apidoc output as an example.

The remaining changes are still a WIP: they fix problems at the
documentation (the most serious one was at latex_fonts.py: the xml
code block there causes Sphinx to crash).

-

This is just a RFC to show what I'm doing: right now, it is a big patch
doing lots of changes that should be done in separate. I intend to split
it into a proper patch series. Yet, I opted to send you this prelimiary
version just as a heads up.

My plan is to first fix the documentation, and then add the final
patch adding support for sphinx.ext.autodoc (conf.py and *.rst files).

---

Subject: Place kernel-doc documentation inside the Linux Kernel docs.

This is a WIP, starting to add kernel-doc documentation to
the Kernel docs.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/conf.py                       | 10 ++-
 Documentation/tools/index.rst               |  1 +
 Documentation/tools/kdoc.rst                | 45 +++++++++++
 Documentation/tools/kdoc_ancillary.rst      | 44 +++++++++++
 Documentation/tools/python.rst              |  8 ++
 tools/lib/python/kdoc/kdoc_files.py         |  3 +-
 tools/lib/python/kdoc/kdoc_item.py          | 18 +++++
 tools/lib/python/kdoc/kdoc_output.py        | 19 +++--
 tools/lib/python/kdoc/kdoc_parser.py        | 21 +++--
 tools/lib/python/kdoc/kdoc_re.py            |  3 +
 tools/lib/python/kdoc/latex_fonts.py        | 85 ++++++++++++---------
 tools/lib/python/kdoc/parse_data_structs.py |  2 +-
 12 files changed, 200 insertions(+), 59 deletions(-)
 create mode 100644 Documentation/tools/kdoc.rst
 create mode 100644 Documentation/tools/kdoc_ancillary.rst
 create mode 100644 Documentation/tools/python.rst

diff --git a/Documentation/conf.py b/Documentation/conf.py
index 1ea2ae5c6276..5d0055d62a0e 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -13,11 +13,17 @@ from  textwrap import dedent
 
 import sphinx
 
+# Location of Documentation/ directory
+doctree = os.path.abspath(".")
+
 # If extensions (or modules to document with autodoc) are in another directory,
 # add these directories to sys.path here. If the directory is relative to the
 # documentation root, use os.path.abspath to make it absolute, like shown here.
 sys.path.insert(0, os.path.abspath("sphinx"))
 
+# Allow sphinx.ext.autodoc to document from tools/lib/python
+sys.path.insert(0, f"{doctree}/../tools/lib/python")
+
 # Minimal supported version
 needs_sphinx = "3.4.3"
 
@@ -32,9 +38,6 @@ else:
     # Include patterns that don't contain directory names, in glob format
     include_patterns = ["**.rst"]
 
-# Location of Documentation/ directory
-doctree = os.path.abspath(".")
-
 # Exclude of patterns that don't contain directory names, in glob format.
 exclude_patterns = []
 
@@ -151,6 +154,7 @@ extensions = [
     "maintainers_include",
     "parser_yaml",
     "rstFlatTable",
+    "sphinx.ext.autodoc",
     "sphinx.ext.autosectionlabel",
     "sphinx.ext.ifconfig",
     "translations",
diff --git a/Documentation/tools/index.rst b/Documentation/tools/index.rst
index 80488e290e10..89b81a13c6a1 100644
--- a/Documentation/tools/index.rst
+++ b/Documentation/tools/index.rst
@@ -12,6 +12,7 @@ more additions are needed here:
 
    rtla/index
    rv/index
+   python
 
 .. only::  subproject and html
 
diff --git a/Documentation/tools/kdoc.rst b/Documentation/tools/kdoc.rst
new file mode 100644
index 000000000000..f0874aefab63
--- /dev/null
+++ b/Documentation/tools/kdoc.rst
@@ -0,0 +1,45 @@
+==================
+Kernel-doc modules
+==================
+
+.. automodule:: kdoc
+   :members:
+   :show-inheritance:
+   :undoc-members:
+
+Source code handler for kernel-doc
+----------------------------------
+
+.. automodule:: kdoc.kdoc_files
+   :members:
+   :show-inheritance:
+   :undoc-members:
+
+Parsed item data class
+----------------------
+
+.. automodule:: kdoc.kdoc_item
+   :members:
+   :show-inheritance:
+   :undoc-members:
+
+Parser for kernel-doc metadata
+------------------------------
+
+.. automodule:: kdoc.kdoc_parser
+   :members:
+   :show-inheritance:
+   :undoc-members:
+
+Output handler for man pages and ReST
+-------------------------------------
+
+.. automodule:: kdoc.kdoc_output
+   :members:
+   :show-inheritance:
+   :undoc-members:
+
+.. toctree::
+   :maxdepth: 1
+
+   kdoc_ancillary
diff --git a/Documentation/tools/kdoc_ancillary.rst b/Documentation/tools/kdoc_ancillary.rst
new file mode 100644
index 000000000000..2df4600ecf64
--- /dev/null
+++ b/Documentation/tools/kdoc_ancillary.rst
@@ -0,0 +1,44 @@
+=================
+Ancillary classes
+=================
+
+Argparse formatter class
+========================
+
+.. automodule:: kdoc.enrich_formatter
+   :members:
+   :show-inheritance:
+   :undoc-members:
+
+Regular expression class handler
+================================
+
+.. automodule:: kdoc.kdoc_re
+   :members:
+   :show-inheritance:
+   :undoc-members:
+
+
+Chinese, Japanese and Korean variable fonts handler
+===================================================
+
+.. automodule:: kdoc.latex_fonts
+   :members:
+   :show-inheritance:
+   :undoc-members:
+
+Kernel C file include logic
+===========================
+
+.. automodule:: kdoc.parse_data_structs
+   :members:
+   :show-inheritance:
+   :undoc-members:
+
+Python version ancillary methods
+================================
+
+.. automodule:: kdoc.python_version
+   :members:
+   :show-inheritance:
+   :undoc-members:
diff --git a/Documentation/tools/python.rst b/Documentation/tools/python.rst
new file mode 100644
index 000000000000..57b2ca51a294
--- /dev/null
+++ b/Documentation/tools/python.rst
@@ -0,0 +1,8 @@
+================
+Python libraries
+================
+
+.. toctree::
+   :maxdepth: 4
+
+   kdoc
diff --git a/tools/lib/python/kdoc/kdoc_files.py b/tools/lib/python/kdoc/kdoc_files.py
index bfe02baf1606..4bfbd1c61000 100644
--- a/tools/lib/python/kdoc/kdoc_files.py
+++ b/tools/lib/python/kdoc/kdoc_files.py
@@ -5,7 +5,8 @@
 # pylint: disable=R0903,R0913,R0914,R0917
 
 """
-Parse lernel-doc tags on multiple kernel source files.
+Parse kernel-doc tags on multiple kernel source files
+=====================================================
 """
 
 import argparse
diff --git a/tools/lib/python/kdoc/kdoc_item.py b/tools/lib/python/kdoc/kdoc_item.py
index 19805301cb2c..71ecd58416ba 100644
--- a/tools/lib/python/kdoc/kdoc_item.py
+++ b/tools/lib/python/kdoc/kdoc_item.py
@@ -4,7 +4,18 @@
 # then pass into the output modules.
 #
 
+"""
+Data class to store a kernel-doc Item
+
+
+"""
+
 class KdocItem:
+    """
+    A class that will, eventually, encapsulate all of the parsed data that we
+    then pass into the output modules.
+    """
+
     def __init__(self, name, fname, type, start_line, **other_stuff):
         self.name = name
         self.fname = fname
@@ -24,6 +35,7 @@ class KdocItem:
         self.other_stuff = other_stuff
 
     def get(self, key, default = None):
+        """Get a value from optional keys"""
         return self.other_stuff.get(key, default)
 
     def __getitem__(self, key):
@@ -33,10 +45,16 @@ class KdocItem:
     # Tracking of section and parameter information.
     #
     def set_sections(self, sections, start_lines):
+        """
+        Set sections and start lines.
+        """
         self.sections = sections
         self.section_start_lines = start_lines
 
     def set_params(self, names, descs, types, starts):
+        """
+        Set parameter list: names, descriptions, types and start lines.
+        """
         self.parameterlist = names
         self.parameterdescs = descs
         self.parametertypes = types
diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index d2bf94275d65..d0cfc3f2b1f5 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -54,14 +54,17 @@ class OutputFormat:
     """
 
     # output mode.
-    OUTPUT_ALL          = 0 # output all symbols and doc sections
-    OUTPUT_INCLUDE      = 1 # output only specified symbols
-    OUTPUT_EXPORTED     = 2 # output exported symbols
-    OUTPUT_INTERNAL     = 3 # output non-exported symbols
+    OUTPUT_ALL          = 0 #: output all symbols and doc sections
+    OUTPUT_INCLUDE      = 1 #: output only specified symbols
+    OUTPUT_EXPORTED     = 2 #: output exported symbols
+    OUTPUT_INTERNAL     = 3 #: output non-exported symbols
 
-    # Virtual member to be overridden at the inherited classes
+    #: Highlights to be used in ReST format
     highlights = []
 
+    #: Blank line character
+    blankline = ""
+
     def __init__(self):
         """Declare internal vars and set mode to OUTPUT_ALL"""
 
@@ -244,6 +247,7 @@ class OutputFormat:
 class RestFormat(OutputFormat):
     """Consts and functions used by ReST output"""
 
+    #: Highlights to be used in ReST format
     highlights = [
         (type_constant, r"``\1``"),
         (type_constant2, r"``\1``"),
@@ -263,9 +267,13 @@ class RestFormat(OutputFormat):
         (type_fallback, r":c:type:`\1`"),
         (type_param_ref, r"**\1\2**")
     ]
+
     blankline = "\n"
 
+    #: Sphinx literal block regex
     sphinx_literal = KernRe(r'^[^.].*::$', cache=False)
+
+    #: Sphinx code block regex
     sphinx_cblock = KernRe(r'^\.\.\ +code-block::', cache=False)
 
     def __init__(self):
@@ -587,6 +595,7 @@ class ManFormat(OutputFormat):
     )
     blankline = ""
 
+    #: Allowed timestamp formats
     date_formats = [
         "%a %b %d %H:%M:%S %Z %Y",
         "%a %b %d %H:%M:%S %Y",
diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 4ad7ce0b243e..0540c1590c7a 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -5,9 +5,6 @@
 # pylint: disable=C0301,C0302,R0904,R0912,R0913,R0914,R0915,R0917,R1702
 
 """
-kdoc_parser
-===========
-
 Read a C language source or header FILE and extract embedded
 documentation comments
 """
@@ -230,15 +227,15 @@ class state:
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
+    NORMAL        = 0        #: normal code
+    NAME          = 1        #: looking for function name
+    DECLARATION   = 2        #: We have seen a declaration which might not be done
+    BODY          = 3        #: the body of the comment
+    SPECIAL_SECTION = 4      #: doc section ending with a blank line
+    PROTO         = 5        #: scanning prototype
+    DOCBLOCK      = 6        #: documentation block
+    INLINE_NAME   = 7        #: gathering doc outside main block
+    INLINE_TEXT   = 8	     #: reading the body of inline docs
 
     name = [
         "NORMAL",
diff --git a/tools/lib/python/kdoc/kdoc_re.py b/tools/lib/python/kdoc/kdoc_re.py
index 2dfa1bf83d64..dcdf0c59a6ee 100644
--- a/tools/lib/python/kdoc/kdoc_re.py
+++ b/tools/lib/python/kdoc/kdoc_re.py
@@ -51,6 +51,9 @@ class KernRe:
         """
         return self.regex.pattern
 
+    def __repr__(self):
+        return f're.compile("{self.regex.pattern}")'
+
     def __add__(self, other):
         """
         Allows adding two regular expressions into one.
diff --git a/tools/lib/python/kdoc/latex_fonts.py b/tools/lib/python/kdoc/latex_fonts.py
index 29317f8006ea..c3d91680e908 100755
--- a/tools/lib/python/kdoc/latex_fonts.py
+++ b/tools/lib/python/kdoc/latex_fonts.py
@@ -5,12 +5,13 @@
 # Ported to Python by (c) Mauro Carvalho Chehab, 2025
 
 """
-Detect problematic Noto CJK variable fonts.
+Detect problematic Noto CJK variable fonts
+==========================================
 
-For "make pdfdocs", reports of build errors of translations.pdf started
-arriving early 2024 [1, 2].  It turned out that Fedora and openSUSE
-tumbleweed have started deploying variable-font [3] format of "Noto CJK"
-fonts [4, 5].  For PDF, a LaTeX package named xeCJK is used for CJK
+For ``make pdfdocs``, reports of build errors of translations.pdf started
+arriving early 2024 [1]_ [2]_.  It turned out that Fedora and openSUSE
+tumbleweed have started deploying variable-font [3]_ format of "Noto CJK"
+fonts [4]_ [5]_.  For PDF, a LaTeX package named xeCJK is used for CJK
 (Chinese, Japanese, Korean) pages.  xeCJK requires XeLaTeX/XeTeX, which
 does not (and likely never will) understand variable fonts for historical
 reasons.
@@ -25,68 +26,77 @@ This script is invoked from the error path of "make pdfdocs" and emits
 suggestions if variable-font files of "Noto CJK" fonts are in the list of
 fonts accessible from XeTeX.
 
-References:
-[1]: https://lore.kernel.org/r/8734tqsrt7.fsf@meer.lwn.net/
-[2]: https://lore.kernel.org/r/1708585803.600323099@f111.i.mail.ru/
-[3]: https://en.wikipedia.org/wiki/Variable_font
-[4]: https://fedoraproject.org/wiki/Changes/Noto_CJK_Variable_Fonts
-[5]: https://build.opensuse.org/request/show/1157217
+.. [1] https://lore.kernel.org/r/8734tqsrt7.fsf@meer.lwn.net/
+.. [2] https://lore.kernel.org/r/1708585803.600323099@f111.i.mail.ru/
+.. [3] https://en.wikipedia.org/wiki/Variable_font
+.. [4] https://fedoraproject.org/wiki/Changes/Noto_CJK_Variable_Fonts
+.. [5] https://build.opensuse.org/request/show/1157217
 
-#===========================================================================
 Workarounds for building translations.pdf
-#===========================================================================
+-----------------------------------------
 
 * Denylist "variable font" Noto CJK fonts.
+
   - Create $HOME/deny-vf/fontconfig/fonts.conf from template below, with
     tweaks if necessary.  Remove leading "".
+
   - Path of fontconfig/fonts.conf can be overridden by setting an env
     variable FONTS_CONF_DENY_VF.
 
-    * Template:
------------------------------------------------------------------
-<?xml version="1.0"?>
-<!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
-<fontconfig>
-<!--
-  Ignore variable-font glob (not to break xetex)
--->
-    <selectfont>
-        <rejectfont>
-            <!--
-                for Fedora
-            -->
-            <glob>/usr/share/fonts/google-noto-*-cjk-vf-fonts</glob>
-            <!--
-                for openSUSE tumbleweed
-            -->
-            <glob>/usr/share/fonts/truetype/Noto*CJK*-VF.otf</glob>
-        </rejectfont>
-    </selectfont>
-</fontconfig>
------------------------------------------------------------------
+    * Template::
+
+        <?xml version="1.0"?>
+        <!DOCTYPE fontconfig SYSTEM "urn:fontconfig:fonts.dtd">
+        <fontconfig>
+        <!--
+        Ignore variable-font glob (not to break xetex)
+        -->
+            <selectfont>
+                <rejectfont>
+                    <!--
+                        for Fedora
+                    -->
+                    <glob>/usr/share/fonts/google-noto-*-cjk-vf-fonts</glob>
+                    <!--
+                        for openSUSE tumbleweed
+                    -->
+                    <glob>/usr/share/fonts/truetype/Noto*CJK*-VF.otf</glob>
+                </rejectfont>
+            </selectfont>
+        </fontconfig>
 
     The denylisting is activated for "make pdfdocs".
 
 * For skipping CJK pages in PDF
+
   - Uninstall texlive-xecjk.
     Denylisting is not needed in this case.
 
 * For printing CJK pages in PDF
+
   - Need non-variable "Noto CJK" fonts.
+
     * Fedora
+
       - google-noto-sans-cjk-fonts
       - google-noto-serif-cjk-fonts
+
     * openSUSE tumbleweed
+
       - Non-variable "Noto CJK" fonts are not available as distro packages
         as of April, 2024.  Fetch a set of font files from upstream Noto
         CJK Font released at:
+
           https://github.com/notofonts/noto-cjk/tree/main/Sans#super-otc
+
         and at:
+
           https://github.com/notofonts/noto-cjk/tree/main/Serif#super-otc
-        , then uncompress and deploy them.
+
+        then uncompress and deploy them.
       - Remember to update fontconfig cache by running fc-cache.
 
-!!! Caution !!!
+.. caution::
     Uninstalling "variable font" packages can be dangerous.
     They might be depended upon by other packages important for your work.
     Denylisting should be less invasive, as it is effective only while
@@ -115,6 +125,7 @@ class LatexFontChecker:
         self.re_cjk = re.compile(r"([^:]+):\s*Noto\s+(Sans|Sans Mono|Serif) CJK")
 
     def description(self):
+        """Returns module description"""
         return __doc__
 
     def get_noto_cjk_vf_fonts(self):
diff --git a/tools/lib/python/kdoc/parse_data_structs.py b/tools/lib/python/kdoc/parse_data_structs.py
index 25361996cd20..16f53b10f953 100755
--- a/tools/lib/python/kdoc/parse_data_structs.py
+++ b/tools/lib/python/kdoc/parse_data_structs.py
@@ -73,7 +73,7 @@ class ParseDataStructs:
         - enum: for the name of a non-anonymous enum;
         - struct: for structs.
 
-    Examples:
+    Examples::
 
         ignore define __LINUX_MEDIA_H
         ignore ioctl VIDIOC_ENUM_FMT
-- 
2.52.0

