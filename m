Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3E829B228;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=QkX9/LQnZosxYtCvlB6tHFCGz53tDNM12jtrrwrCm81sM1c0wfi0q0zfjHYrKniZ22+LNtIBoUak5Xt78oG9igDcQkZFd+0+WVBawjeVrecp/oe9JrDlZUnUc/nKCUL1vRPDnknx5ijbjkyVPz4u09GkaU+AqvOfdjcj6NiCb88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=i1tcZCaxJM2MU0fiO/S47vsflPzYkddGYteNjd18qHw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d4bJ3AzBXlTI6sNfLK9SMrkWHEtPUb/MY0cfGHwblS+8LBL71rLeyB2whfBKYm954zhPExg26hu88haCkz4BZd+Ah+dzmIuNcyuEaQXXse5lzO+/vIS+pUf0Yw+iz32He1gzhHsUmqIxNCM1qzrcA/0M3chxjpMUaplAKgaT96Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d69NExac; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d69NExac"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D492C19425;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=i1tcZCaxJM2MU0fiO/S47vsflPzYkddGYteNjd18qHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d69NExacPxZ0Dv/g9MXpuB8KNYqUbDaN/faj7Wuh3UBiYZkvNsq3rwp7dtMGL8zKj
	 3R5e9F5pdNcLGxxJPFW1EHdKeC+YrRgnT2YynPkBqGLZ60oQ0ovfIgDBJb8NrDMCGk
	 chmcPegiSt77KiLWRrxabNZBYpQgLDPS20oRUgW9lxgs4dR0x2qrztFUJn/eNELEb3
	 Ez1I+u2AEKONFm6NYLPPKcebHU+q2ckAuv4FGuK9FFXKnxMWgzuenX3E9mMe1y0AIp
	 eJeca9oMxCExCqN1VAPsJuO9d9RuUBlLbq2qzipQWlng4LSXaoELeUGP4o9W6G7f6x
	 1jIYmGjTD1TXA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j28-1gfC;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 12/25] docs: kdoc: parse_data_structs: Improve docstrings and comments
Date: Mon, 19 Jan 2026 17:23:15 +0100
Message-ID: <76ead85b4c13a8038180a792e270c3691d26cd25.1768838938.git.mchehab+huawei@kernel.org>
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
 tools/lib/python/kdoc/parse_data_structs.py | 62 +++++++++++++--------
 1 file changed, 39 insertions(+), 23 deletions(-)

diff --git a/tools/lib/python/kdoc/parse_data_structs.py b/tools/lib/python/kdoc/parse_data_structs.py
index 25361996cd20..9941cd19032e 100755
--- a/tools/lib/python/kdoc/parse_data_structs.py
+++ b/tools/lib/python/kdoc/parse_data_structs.py
@@ -9,12 +9,12 @@ Parse a source file or header, creating ReStructured Text cross references.
 It accepts an optional file to change the default symbol reference or to
 suppress symbols from the output.
 
-It is capable of identifying defines, functions, structs, typedefs,
-enums and enum symbols and create cross-references for all of them.
+It is capable of identifying ``define``, function, ``struct``, ``typedef``,
+``enum`` and ``enum`` symbols and create cross-references for all of them.
 It is also capable of distinguish #define used for specifying a Linux
 ioctl.
 
-The optional rules file contains a set of rules like:
+The optional rules file contains a set of rules like::
 
     ignore ioctl VIDIOC_ENUM_FMT
     replace ioctl VIDIOC_DQBUF vidioc_qbuf
@@ -34,8 +34,8 @@ class ParseDataStructs:
     It is meant to allow having a more comprehensive documentation, where
     uAPI headers will create cross-reference links to the code.
 
-    It is capable of identifying defines, functions, structs, typedefs,
-    enums and enum symbols and create cross-references for all of them.
+    It is capable of identifying ``define``, function, ``struct``, ``typedef``,
+    ``enum`` and ``enum`` symbols and create cross-references for all of them.
     It is also capable of distinguish #define used for specifying a Linux
     ioctl.
 
@@ -43,13 +43,13 @@ class ParseDataStructs:
     allows parsing an exception file. Such file contains a set of rules
     using the syntax below:
 
-    1. Ignore rules:
+    1. Ignore rules::
 
         ignore <type> <symbol>`
 
     Removes the symbol from reference generation.
 
-    2. Replace rules:
+    2. Replace rules::
 
         replace <type> <old_symbol> <new_reference>
 
@@ -58,22 +58,22 @@ class ParseDataStructs:
         - A simple symbol name;
         - A full Sphinx reference.
 
-    3. Namespace rules
+    3. Namespace rules::
 
         namespace <namespace>
 
        Sets C namespace to be used during cross-reference generation. Can
        be overridden by replace rules.
 
-    On ignore and replace rules, <type> can be:
-        - ioctl: for defines that end with _IO*, e.g. ioctl definitions
-        - define: for other defines
-        - symbol: for symbols defined within enums;
-        - typedef: for typedefs;
-        - enum: for the name of a non-anonymous enum;
-        - struct: for structs.
+    On ignore and replace rules, ``<type>`` can be:
+        - ``ioctl``: for defines that end with ``_IO*``, e.g. ioctl definitions
+        - ``define``: for other defines
+        - ``symbol``: for symbols defined within enums;
+        - ``typedef``: for typedefs;
+        - ``enum``: for the name of a non-anonymous enum;
+        - ``struct``: for structs.
 
-    Examples:
+    Examples::
 
         ignore define __LINUX_MEDIA_H
         ignore ioctl VIDIOC_ENUM_FMT
@@ -83,13 +83,15 @@ class ParseDataStructs:
         namespace MC
     """
 
-    # Parser regexes with multiple ways to capture enums and structs
+    #: Parser regex with multiple ways to capture enums.
     RE_ENUMS = [
         re.compile(r"^\s*enum\s+([\w_]+)\s*\{"),
         re.compile(r"^\s*enum\s+([\w_]+)\s*$"),
         re.compile(r"^\s*typedef\s*enum\s+([\w_]+)\s*\{"),
         re.compile(r"^\s*typedef\s*enum\s+([\w_]+)\s*$"),
     ]
+
+    #: Parser regex with multiple ways to capture structs.
     RE_STRUCTS = [
         re.compile(r"^\s*struct\s+([_\w][\w\d_]+)\s*\{"),
         re.compile(r"^\s*struct\s+([_\w][\w\d_]+)$"),
@@ -97,11 +99,13 @@ class ParseDataStructs:
         re.compile(r"^\s*typedef\s*struct\s+([_\w][\w\d_]+)$"),
     ]
 
-    # FIXME: the original code was written a long time before Sphinx C
+    # NOTE: the original code was written a long time before Sphinx C
     # domain to have multiple namespaces. To avoid to much turn at the
     # existing hyperlinks, the code kept using "c:type" instead of the
     # right types. To change that, we need to change the types not only
     # here, but also at the uAPI media documentation.
+
+    #: Dictionary containing C type identifiers to be transformed.
     DEF_SYMBOL_TYPES = {
         "ioctl": {
             "prefix": "\\ ",
@@ -158,6 +162,10 @@ class ParseDataStructs:
             self.symbols[symbol_type] = {}
 
     def read_exceptions(self, fname: str):
+        """
+        Read an optional exceptions file, used to override defaults.
+        """
+
         if not fname:
             return
 
@@ -242,9 +250,9 @@ class ParseDataStructs:
     def store_type(self, ln, symbol_type: str, symbol: str,
                    ref_name: str = None, replace_underscores: bool = True):
         """
-        Stores a new symbol at self.symbols under symbol_type.
+        Store a new symbol at self.symbols under symbol_type.
 
-        By default, underscores are replaced by "-"
+        By default, underscores are replaced by ``-``.
         """
         defs = self.DEF_SYMBOL_TYPES[symbol_type]
 
@@ -276,12 +284,16 @@ class ParseDataStructs:
         self.symbols[symbol_type][symbol] = (f"{prefix}{ref_link}{suffix}", ln)
 
     def store_line(self, line):
-        """Stores a line at self.data, properly indented"""
+        """
+        Store a line at self.data, properly indented.
+        """
         line = "    " + line.expandtabs()
         self.data += line.rstrip(" ")
 
     def parse_file(self, file_in: str, exceptions: str = None):
-        """Reads a C source file and get identifiers"""
+        """
+        Read a C source file and get identifiers.
+        """
         self.data = ""
         is_enum = False
         is_comment = False
@@ -433,7 +445,7 @@ class ParseDataStructs:
 
     def gen_toc(self):
         """
-        Create a list of symbols to be part of a TOC contents table
+        Create a list of symbols to be part of a TOC contents table.
         """
         text = []
 
@@ -464,6 +476,10 @@ class ParseDataStructs:
         return "\n".join(text)
 
     def write_output(self, file_in: str, file_out: str, toc: bool):
+        """
+        Write a ReST output file.
+        """
+
         title = os.path.basename(file_in)
 
         if toc:
-- 
2.52.0

