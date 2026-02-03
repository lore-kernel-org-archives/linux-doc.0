Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6AE3ACF0A;
	Tue,  3 Feb 2026 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130556; cv=none; b=p4c8m3t9818O+V4XNg0Yy8zip6WZmRmDcrcC4QG/SuL8ZhN5aHA3OfcKRPFEUKHgMIvzKk33Ra7Iy6MXvbbB54tK90AVWy62Ql8hr/gcdrN4hpEEUnckzNHbqB6uSzFfeJIDUEx4y3wCaxLJAA+8HZWkxOdOdi26Z6w2jPbCKqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130556; c=relaxed/simple;
	bh=oYC2GDc/Bqbgq6yNVkLkZHK+JYaKpKvhsSMfDzpAVDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L9dFvz8T0b9feSY7Err3Ll4teDs1vDsCsE5o7Kh31Shl1Pd2GK70fOhOUrJ5nipLM7PuaVrqMCgXMKrb9WrOEiBij1vjdu7BCl2R98l1SpKlkjqvuAydkS33sipg7CjaxEXMQmYz3sufxcbJMYHIIXUoZsRRMX8gR6ZJHvCIZuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=luSuWlcx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="luSuWlcx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2638C2BCB1;
	Tue,  3 Feb 2026 14:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770130555;
	bh=oYC2GDc/Bqbgq6yNVkLkZHK+JYaKpKvhsSMfDzpAVDw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=luSuWlcxOOfFHZykyos6xDVZrUMWIAd/9CNjdv+ApDoY/8jWuN0PEAt+hghKg1aD1
	 H7svdm2dcDuz+hMF83ewGK7UNEwW+taoNlquclkdZtZLgC8XFvQXeNRaD6fwzvwTXm
	 j65wJdgdV2mRwsAVnRIlmFRG6RgqR4u0O+L7eU8TcjqySrAt9CjaZ+ktfhzAIGBaai
	 rYsrG9oY6SjUivUFw11JYv+BJi8d9WiAT4q5Hn7JYh0vfgVoFqxrHp+KlQh627DCdS
	 v4UD1gmCt1eQkrX1QNPPCp6k0h+oex9AmfwDZc+3wngh1OE6lMb2y3ITXoqwRgtUh2
	 qcqJqCMC4zp+g==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vnHom-000000027UK-3jsn;
	Tue, 03 Feb 2026 15:55:52 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 04/15] docs: kdoc_files: use a class to group config parameters
Date: Tue,  3 Feb 2026 15:55:32 +0100
Message-ID: <c71213ef14ddc7f79581a874cf8a222ffe4f2d1a.1770128540.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770128540.git.mchehab+huawei@kernel.org>
References: <cover.1770128540.git.mchehab+huawei@kernel.org>
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
2.52.0

