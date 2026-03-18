Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C84F3A5E99;
	Wed, 18 Mar 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773825081; cv=none; b=rRjNjqsmv9l95auVkj15HEEv68wCQi5CfGdPvYu+hVDKTAeyT82TQlzrqT/HkajrPt78hrjpBXlVKxT0CSYnMPXYc81aCVgd5hU9lr/svU0Bu6Y7hDtnLJrvdehdlH0l4mUwgB4yGZJ6891fQQJiytXywa73JwIpWUoQ5WDDjBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773825081; c=relaxed/simple;
	bh=BLxIAC+0ecDESspKr2mOmfyOm7KPoCXOrsFtpwI+cOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NPl4ehV+IHnILCTkeWRLDDXuNWqPYy7lM4O9miTTKuU22EN5YfZcN61UIk5ezJyNjMSAj4kuK6AwYc3AQKlW04m/6yD3DfMRfPXdc6q5f/dZP/Rvt88Xphp4A03YR2eo+ngxg60GCObbrWPbn3fwBRwPPnrSyKJLb2CY/bDn088=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QeOX7hT8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QeOX7hT8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A41DC2BCB2;
	Wed, 18 Mar 2026 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773825080;
	bh=BLxIAC+0ecDESspKr2mOmfyOm7KPoCXOrsFtpwI+cOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QeOX7hT8BfEHwFwAO+XNFVsZIGt+g0XWKMVx86dJQOQhIGGF3YRGOwL2rJ0Rn5xO2
	 p5JKfQlS2cPJWWxq6+rmkxLVrM52F4aRhEQX3zAAIT+yYoCYU1OHFLXqdZF5X3oSJp
	 +SahHaeCo4IJ63VqJlm/2bG7HGEc1JgtAgYXJsFcPzS4ba7iGDxCGNF2bRKb8WdJRn
	 L7Mc1y9EdqoLtBPkkGciB5J8nlEXpaHMVcZD/6MKLz9CTK/jA5enJpgUbqBub0WqXe
	 jJJfSuspFmScwk1qGaUqPb50jDnYNSSIoQxSqCgT7ySc3TI5e3NOrMENIGoSTkhKzU
	 fmh59tF7lYFhw==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1w2mvu-00000002fpW-2JDS;
	Wed, 18 Mar 2026 10:11:18 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 04/14] docs: kdoc_files: use a class to group config parameters
Date: Wed, 18 Mar 2026 10:11:04 +0100
Message-ID: <a66ec9872c72a3ba1a5ac567881d67dc8ee581c6.1773823995.git.mchehab+huawei@kernel.org>
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

Instead of abusing argparse.Namespace, define a class to store
configuration parameters and logger.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_files.py | 45 ++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_files.py b/tools/lib/python/kdoc/kdoc_files.py
index 8c2059623949..1c5cb9e5f0e8 100644
--- a/tools/lib/python/kdoc/kdoc_files.py
+++ b/tools/lib/python/kdoc/kdoc_files.py
@@ -9,7 +9,6 @@ Classes for navigating through the files that kernel-doc needs to handle
 to generate documentation.
 """
 
-import argparse
 import logging
 import os
 import re
@@ -87,6 +86,28 @@ class GlobSourceFiles:
                 file_not_found_cb(fname)
 
 
+class KdocConfig():
+    """
+    Stores all configuration attributes that kdoc_parser and kdoc_output
+    needs.
+    """
+    def __init__(self, verbose=False, werror=False, wreturn=False,
+                 wshort_desc=False, wcontents_before_sections=False,
+                 logger=None):
+
+        self.verbose = verbose
+        self.werror = werror
+        self.wreturn = wreturn
+        self.wshort_desc =  wshort_desc
+        self.wcontents_before_sections = wcontents_before_sections
+
+        if logger:
+            self.log = logger
+        else:
+            self.log = logging.getLogger(__file__)
+
+        self.warning = self.log.warning
+
 class KernelFiles():
     """
     Parse kernel-doc tags on multiple kernel source files.
@@ -224,29 +245,25 @@ class KernelFiles():
             if kdoc_werror:
                 werror = kdoc_werror
 
+        if not logger:
+           logger = logging.getLogger("kernel-doc")
+        else:
+            logger = logger
+
         # Some variables are global to the parser logic as a whole as they are
         # used to send control configuration to KernelDoc class. As such,
         # those variables are read-only inside the KernelDoc.
-        self.config = argparse.Namespace
+        self.config = KdocConfig(verbose, werror, wreturn, wshort_desc,
+                                 wcontents_before_sections, logger)
 
-        self.config.verbose = verbose
-        self.config.werror = werror
-        self.config.wreturn = wreturn
-        self.config.wshort_desc = wshort_desc
-        self.config.wcontents_before_sections = wcontents_before_sections
+        # Override log warning, as we want to count errors
+        self.config.warning = self.warning
 
         if xforms:
             self.xforms = xforms
         else:
             self.xforms = CTransforms()
 
-        if not logger:
-            self.config.log = logging.getLogger("kernel-doc")
-        else:
-            self.config.log = logger
-
-        self.config.warning = self.warning
-
         self.config.src_tree = os.environ.get("SRCTREE", None)
 
         # Initialize variables that are internal to KernelFiles
-- 
2.53.0

