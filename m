Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA00833AD90;
	Tue, 27 Jan 2026 10:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508821; cv=none; b=lDYXwzejRDfcT0ACzNCqDrn0k8C+ofFjJB74ynuZUlh9piwBY1jk7zSVWLz5EKQH5qhrY/vBRi16hPElhoWwts14pQ4FUaSCwhQQJNEma+4r131LAOvbYI3vgZlMmidr0wY4+Q1W/fzvC359MZWl7JGwRKzcTJg+DooTb0QUwQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508821; c=relaxed/simple;
	bh=tG5aGGSXPFMShMecDATAc+9bVZNzWuT+AaBVlR45Rk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l/E+QNJnJKx9DudBAeJUn1C1jGFeIueAcvzII7lJiY7jW5CU36DC/cdgTcBGScYAmz0zCtSOjbeg4JSScpyvNxqaOtKFLiGMk4NHoxwbjHsKzIXq5tjxW2+sW1n4WL4CgtFo7HmvV3P0vLYq1HQEPi1WnmxJl/stcDodIS3VfwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bkLSFp8w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bkLSFp8w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 934A6C19425;
	Tue, 27 Jan 2026 10:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508821;
	bh=tG5aGGSXPFMShMecDATAc+9bVZNzWuT+AaBVlR45Rk4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bkLSFp8wGKPaxWg5wD9dgl9JVGg/nlPRKQ9GPi3S837OgDT1JFlg5XvjdPIfRcaLo
	 KZSjpHRN/XA9sBwcXnFDWb640NSe/7n3exfyRmq7FiuP7B1rirZyIaxHApkCM0r1kQ
	 6qjcD97kPjOGKfZ+2CHUMikEgpGTp4/6AS2xZf4bGUeQrxWFEPTfPVKWt/wYkE3uRP
	 Tb1EXqrguqNpglQO4DnTel/JQPwFhQUfPjIma4OIFJCQRiMf7UwSn7YFOoPTk9ilkW
	 DpvqD2uUIFk0O00VNEow3jMBRvzxyZmY4XdpzayJlLNDbt7mhllWtGUA19vHfg7fWh
	 5CavfS1CiraYA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vkg4p-0000000BVM8-3SFI;
	Tue, 27 Jan 2026 11:13:39 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 05/14] docs: kdoc_parser: add functions support for NestedMatch
Date: Tue, 27 Jan 2026 11:13:24 +0100
Message-ID: <a3d0852552b91c4d41df49da8ac5801ed7b4146f.1769508371.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769508371.git.mchehab+huawei@kernel.org>
References: <cover.1769508371.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Some annotations macros may have nested parenthesis, causing normal
regex parsing to fail.

Extend apply_transforms to also use NestedMatch and add support
for nested functions.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 39 ++++++++++++++++++----------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 834a527542b3..4b2b0a0d25f8 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -155,7 +155,7 @@ struct_xforms = [
     (KernRe(r'DEFINE_DMA_UNMAP_LEN\s*\(' + struct_args_pattern + r'\)', re.S), r'__u32 \1'),
 ]
 #
-# Regexes here are guaranteed to have the end delimiter matching
+# Struct regexes here are guaranteed to have the end delimiter matching
 # the start delimiter. Yet, right now, only one replace group
 # is allowed.
 #
@@ -163,6 +163,13 @@ struct_nested_prefixes = [
     (re.compile(r'\bSTRUCT_GROUP\('), r'\1'),
 ]
 
+#
+# Function Regexes here are guaranteed to have the end delimiter matching
+# the start delimiter.
+#
+function_nested_prefixes = [
+]
+
 #
 # Transforms for function prototypes
 #
@@ -206,14 +213,6 @@ var_xforms = [
     (KernRe(r"=.*"), ""),
 ]
 
-#
-# Apply a set of transforms to a block of text.
-#
-def apply_transforms(xforms, text):
-    for search, subst in xforms:
-        text = search.sub(subst, text)
-    return text
-
 #
 # A little helper to get rid of excess white space
 #
@@ -400,6 +399,8 @@ class KernelDoc:
         # Place all potential outputs into an array
         self.entries = []
 
+        self.nested = NestedMatch()
+
         #
         # We need Python 3.7 for its "dicts remember the insertion
         # order" guarantee
@@ -497,6 +498,16 @@ class KernelDoc:
         # State flags
         self.state = state.NORMAL
 
+    def apply_transforms(self, regex_xforms, nested_xforms, text):
+        """Apply a set of transforms to a block of text."""
+        for search, subst in regex_xforms:
+            text = search.sub(subst, text)
+
+        for search, sub in nested_xforms:
+            text = self.nested.sub(search, sub, text)
+
+        return text.strip()
+
     def push_parameter(self, ln, decl_type, param, dtype,
                        org_arg, declaration_name):
         """
@@ -865,11 +876,9 @@ class KernelDoc:
         # Go through the list of members applying all of our transformations.
         #
         members = trim_private_members(members)
-        members = apply_transforms(struct_xforms, members)
+        members = self.apply_transforms(struct_xforms, struct_nested_prefixes,
+                                        members)
 
-        nested = NestedMatch()
-        for search, sub in struct_nested_prefixes:
-            members = nested.sub(search, sub, members)
         #
         # Deal with embedded struct and union members, and drop enums entirely.
         #
@@ -1072,7 +1081,9 @@ class KernelDoc:
             #
             # Apply the initial transformations.
             #
-            prototype = apply_transforms(function_xforms, prototype)
+            prototype = self.apply_transforms(function_xforms,
+                                              function_nested_prefixes,
+                                              prototype)
 
         # Yes, this truly is vile.  We are looking for:
         # 1. Return type (may be nothing if we're looking at a macro)
-- 
2.52.0

