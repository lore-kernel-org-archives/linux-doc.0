Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8372FD7D5;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768839814; cv=none; b=FzLet2oon4YZGMioZPiy2fKItDFOQaUdJ7fBlsqshlDQcjNvtdSGl1wx4lTwNtMzfYHEXIUzPELrPsPCGVSxjbRRgCyfjJwPp6owKEeBtAXTMb7gQRGgiWU0fwIKMfE51gbkGjKVA3TdXl3ckCa07Ki3/jfTo51sOE0OrMXqss0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768839814; c=relaxed/simple;
	bh=tfVDmQ1gX9VG9PNgXAXt4hYgxcfeRlZft7aVQXVoK88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=utUPy3G+YVmzGNmv5bzJHp/u36w+tjWGT2fZ47rkfDokVT0lWLCLNJNP+Lvs+sYtQSgzGzG886zf/3coEuUbPf7lvN7rH5laL3q4ZlSHZyvaz/ngdTOpiknLzWx4/+VIyDv703SlBS5gQVPSg1ILPY6MDXQxbNpnTYijXl8Ry9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ROCZdxLq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROCZdxLq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8DEC2BCC9;
	Mon, 19 Jan 2026 16:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768839814;
	bh=tfVDmQ1gX9VG9PNgXAXt4hYgxcfeRlZft7aVQXVoK88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ROCZdxLqd7TRMtN7NYdj0WL6tefWkBjzaduO1JD5v+6xy09BEGq+2erKGUgkWf+6G
	 GUWPMTZ084Ng5YNv/wczwYTIFI3PHnyrBLX13lkKa0oB6Kvgxiv+nVNigBTrqEZnr5
	 u1WSFfu4pjPlch76mtdNIHMRcU7XmnGkjbFaz1cu/X76iJUfKLyXCeCquU4wyRMzJj
	 0p4k953VSA3dn5CH9qen/paM306PQf0Xw+KBoFqzQybrk4ZpaVHkmGwy1KQ2W0DKOZ
	 nBb4VPttT0KvswKlGOPzwHyLm0S9XVC9B8yQ32Cm+SfFVW5d9WZxTxxPt6qWf4TPrV
	 1UgTG2pGyN7Xw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vhs2O-00000001j2S-2ErO;
	Mon, 19 Jan 2026 17:23:32 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH 17/25] docs: python: abi_parser: do some improvements at documentation
Date: Mon, 19 Jan 2026 17:23:20 +0100
Message-ID: <c5756d7fd70697890130b41b2856c59144d01844.1768838938.git.mchehab+huawei@kernel.org>
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

Add documentation for two consts and ensure that all sentenses
will end with a dot.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/abi/abi_parser.py | 33 ++++++++++++++++--------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/tools/lib/python/abi/abi_parser.py b/tools/lib/python/abi/abi_parser.py
index 9b8db70067ef..d7bb20ef3acc 100644
--- a/tools/lib/python/abi/abi_parser.py
+++ b/tools/lib/python/abi/abi_parser.py
@@ -21,14 +21,17 @@ from abi.helpers import AbiDebug, ABI_DIR
 
 
 class AbiParser:
-    """Main class to parse ABI files"""
+    """Main class to parse ABI files."""
 
+    #: Valid tags at Documentation/ABI.
     TAGS = r"(what|where|date|kernelversion|contact|description|users)"
+
+    #: ABI elements that will auto-generate cross-references.
     XREF = r"(?:^|\s|\()(\/(?:sys|config|proc|dev|kvd)\/[^,.:;\)\s]+)(?:[,.:;\)\s]|\Z)"
 
     def __init__(self, directory, logger=None,
                  enable_lineno=False, show_warnings=True, debug=0):
-        """Stores arguments for the class and initialize class vars"""
+        """Stores arguments for the class and initialize class vars."""
 
         self.directory = directory
         self.enable_lineno = enable_lineno
@@ -65,7 +68,7 @@ class AbiParser:
         self.re_xref_node = re.compile(self.XREF)
 
     def warn(self, fdata, msg, extra=None):
-        """Displays a parse error if warning is enabled"""
+        """Displays a parse error if warning is enabled."""
 
         if not self.show_warnings:
             return
@@ -77,7 +80,7 @@ class AbiParser:
         self.log.warning(msg)
 
     def add_symbol(self, what, fname, ln=None, xref=None):
-        """Create a reference table describing where each 'what' is located"""
+        """Create a reference table describing where each 'what' is located."""
 
         if what not in self.what_symbols:
             self.what_symbols[what] = {"file": {}}
@@ -92,7 +95,7 @@ class AbiParser:
             self.what_symbols[what]["xref"] = xref
 
     def _parse_line(self, fdata, line):
-        """Parse a single line of an ABI file"""
+        """Parse a single line of an ABI file."""
 
         new_what = False
         new_tag = False
@@ -264,7 +267,7 @@ class AbiParser:
             self.warn(fdata, "Unexpected content", line)
 
     def parse_readme(self, nametag, fname):
-        """Parse ABI README file"""
+        """Parse ABI README file."""
 
         nametag["what"] = ["Introduction"]
         nametag["path"] = "README"
@@ -282,7 +285,7 @@ class AbiParser:
                 nametag["description"] += line
 
     def parse_file(self, fname, path, basename):
-        """Parse a single file"""
+        """Parse a single file."""
 
         ref = f"abi_file_{path}_{basename}"
         ref = self.re_unprintable.sub("_", ref).strip("_")
@@ -348,7 +351,7 @@ class AbiParser:
                     self.add_symbol(what=w, fname=fname, xref=fdata.key)
 
     def _parse_abi(self, root=None):
-        """Internal function to parse documentation ABI recursively"""
+        """Internal function to parse documentation ABI recursively."""
 
         if not root:
             root = self.directory
@@ -377,7 +380,7 @@ class AbiParser:
                 self.parse_file(name, path, basename)
 
     def parse_abi(self, root=None):
-        """Parse documentation ABI"""
+        """Parse documentation ABI."""
 
         self._parse_abi(root)
 
@@ -385,7 +388,7 @@ class AbiParser:
             self.log.debug(pformat(self.data))
 
     def desc_txt(self, desc):
-        """Print description as found inside ABI files"""
+        """Print description as found inside ABI files."""
 
         desc = desc.strip(" \t\n")
 
@@ -393,7 +396,7 @@ class AbiParser:
 
     def xref(self, fname):
         """
-        Converts a Documentation/ABI + basename into a ReST cross-reference
+        Converts a Documentation/ABI + basename into a ReST cross-reference.
         """
 
         xref = self.file_refs.get(fname)
@@ -403,7 +406,7 @@ class AbiParser:
             return xref
 
     def desc_rst(self, desc):
-        """Enrich ReST output by creating cross-references"""
+        """Enrich ReST output by creating cross-references."""
 
         # Remove title markups from the description
         # Having titles inside ABI files will only work if extra
@@ -459,7 +462,7 @@ class AbiParser:
 
     def doc(self, output_in_txt=False, show_symbols=True, show_file=True,
             filter_path=None):
-        """Print ABI at stdout"""
+        """Print ABI at stdout."""
 
         part = None
         for key, v in sorted(self.data.items(),
@@ -549,7 +552,7 @@ class AbiParser:
             yield (msg, file_ref[0][0], ln)
 
     def check_issues(self):
-        """Warn about duplicated ABI entries"""
+        """Warn about duplicated ABI entries."""
 
         for what, v in self.what_symbols.items():
             files = v.get("file")
@@ -575,7 +578,7 @@ class AbiParser:
             self.log.warning("%s is defined %d times: %s", what, len(f), "; ".join(f))
 
     def search_symbols(self, expr):
-        """ Searches for ABI symbols """
+        """ Searches for ABI symbols."""
 
         regex = re.compile(expr, re.I)
 
-- 
2.52.0

