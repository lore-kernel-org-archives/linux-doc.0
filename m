Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3E5DDA8;
	Tue, 28 Jan 2025 00:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022797; cv=none; b=hFWmzNeqEOzsiYurI6TqmqAwGV3DseUlzJc4bQq/y+0HhV8ii+NpIZOUWeLVtefbtevZuM8IA6FxDRiFnKEQ/41ugNYoBwACz6BBBqG9Saiv3Bk1gg2q0zVM20InW4pP46gFei5k9jejwBuToiE41K0hctn8lRVMPhk1ZJTFLzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022797; c=relaxed/simple;
	bh=c1DRAW1eND16SBK5p186Mw0Kk3C4nvJXQzIl/jp91wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QNqJxd7mXnRTI7yutWIRA841G182lkNbE+MeMMsR5EU97k9oEp8hfOr6uC3jliSGuMLLN1XNrS1lJ2I0ZWY3R4jNitWO4I+8/9XVcxiPNYTbi8hPhgb1ir55zLNKuwShDxQo7x+S43W5/sw/dpDZbxpTlBzJunvQBWxedhekxE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWvyw1QE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWvyw1QE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14E2C4AF0C;
	Tue, 28 Jan 2025 00:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022795;
	bh=c1DRAW1eND16SBK5p186Mw0Kk3C4nvJXQzIl/jp91wc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FWvyw1QEUjJvKR133VqP9QTbXl08KOZbqSnoPyuoLkb4F5NBcf6uQBtgjHqr4bPK6
	 ap7zyqUTMbSrykdP9d8evu34MVMiQAcsg6xuS/FWffOpZ1NKr3mbS/bp7/Qx4yzYvT
	 BwuxcTXqlUQUd69rOsEVy03eZSuD/Eo7+8+SztD8l6fYtwTlyTE8p2mvTbaS+btgTA
	 Qhfz7u210Jv3L00g7Hg5po6aoWGQVGqf+AMa+82K922VaWa1xShj5B1s6OtQZUrvvo
	 SqsZJkdkPpA0fGeZohDWQMUmRd4pMFFvY9A9DBORz2NxGtzDgev7xlq75SsLPRrdS6
	 M8OKds+XeFAxg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7i-0000000DRLP-00cQ;
	Tue, 28 Jan 2025 01:06:34 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 16/38] scripts/get_abi.py: optimize parse_abi() function
Date: Tue, 28 Jan 2025 01:06:05 +0100
Message-ID: <238cbe14607880e99d7e6cbaa3f046dfaf96dcd2.1738020236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738020236.git.mchehab+huawei@kernel.org>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Instead of using glob, use a recursive function to parse all files.

Such change reduces the total excecution time by 15% with my SSD disks.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.py | 57 ++++++++++++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 19 deletions(-)

diff --git a/scripts/get_abi.py b/scripts/get_abi.py
index 93a23cf30ea1..73613fb29c1c 100755
--- a/scripts/get_abi.py
+++ b/scripts/get_abi.py
@@ -13,7 +13,6 @@ import os
 import re
 import sys
 
-from glob import glob
 from pprint import pformat
 from random import randrange, seed
 
@@ -59,7 +58,11 @@ class AbiParser:
         self.file_refs = {}
         self.what_refs = {}
 
+        # Ignore files that contain such suffixes
+        self.ignore_suffixes = (".rej", ".org", ".orig", ".bak", "~")
+
         # Regular expressions used on parser
+        self.re_abi_dir = re.compile(r"(.*)" + ABI_DIR)
         self.re_tag = re.compile(r"(\S+)(:\s*)(.*)", re.I)
         self.re_valid = re.compile(self.TAGS)
         self.re_start_spc = re.compile(r"(\s*)(\S.*)")
@@ -335,26 +338,42 @@ class AbiParser:
                 for w in fdata.what:
                     self.add_symbol(what=w, fname=fname, xref=fdata.key)
 
-    def parse_abi(self):
+    def _parse_abi(self, root=None):
+        """Internal function to parse documentation ABI recursively"""
+
+        if not root:
+            root = self.directory
+
+        with os.scandir(root) as obj:
+            for entry in obj:
+                name = os.path.join(root, entry.name)
+
+                if entry.is_dir():
+                    self.parse_abi(name)
+                    continue
+
+                if not entry.is_file():
+                    continue
+
+                basename = os.path.basename(name)
+
+                if basename == "README":
+                    continue
+
+                if basename.startswith("."):
+                    continue
+
+                if basename.endswith(self.ignore_suffixes):
+                    continue
+
+                path = self.re_abi_dir.sub("", os.path.dirname(name))
+
+                self.parse_file(name, path, basename)
+
+    def parse_abi(self, root=None):
         """Parse documentation ABI"""
 
-        ignore_suffixes = ("rej", "org", "orig", "bak", "~")
-        re_abi = re.compile(r".*" + ABI_DIR)
-
-        for fname in glob(os.path.join(self.directory, "**"), recursive=True):
-            if os.path.isdir(fname):
-                continue
-
-            basename = os.path.basename(fname)
-
-            if basename == "README":
-                continue
-            if basename.startswith(".") or basename.endswith(ignore_suffixes):
-                continue
-
-            path = re_abi.sub("", os.path.dirname(fname))
-
-            self.parse_file(fname, path, basename)
+        self._parse_abi(root)
 
         if self.debug & DEBUG_DUMP_ABI_STRUCTS:
             self.log.debug(pformat(self.data))
-- 
2.48.1

