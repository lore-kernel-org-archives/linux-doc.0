Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08123ACEFD;
	Tue,  3 Feb 2026 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130555; cv=none; b=IfEaCY9eI2iK1bz2PZ1NLPunCTOyZUHvb9Zuishe++BWOAR/f4nzcerSznjTAyH4hDbn1CXf46NRNjxQ8Q0TSfHtPylu276qlo/YgLwUh1fpoZPnv4b8arQ36yoOa1lt4liNUbCXZa8Wve9E1O/dzehPy72vDoa3TPDrGIWd+zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130555; c=relaxed/simple;
	bh=D+Yw/P1wo2Fe3Sse9jDq5scutU3896nHCn53LsY9Ih8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hya5Q1Bu07hPiWHQ/JbhBZwyM3PzUX1bAauqlkj0G9qhYAdxM1qgBlQEplYY3tV+pX0ASsIBACMA7e6PXDyZMj78xCflCXF7NHsU62iD8iUUq5OXwDhOqe23KHjg0M0P5vkg3NtCc5owiYuzsaChSDJsrkS64ncKHIMJEw/1eNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UtxuMrO4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UtxuMrO4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E53C4AF0B;
	Tue,  3 Feb 2026 14:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770130554;
	bh=D+Yw/P1wo2Fe3Sse9jDq5scutU3896nHCn53LsY9Ih8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UtxuMrO49Ra/ZBPDGjreRGGTyu4RY7XGuABGvJ2mTw/VIqIebsyXRJ9H7A+DJMasF
	 EVx3jT7oX53ngTFIfHLTm2MVwfluhS2e8MqpHLNvNJJ7wOCw3dCeikPCcH3J6B2E2M
	 3t7u838xJ7CLOsxYo0A9HyMKgjmBOAqdPZzK2nq51hgaWc5LAcwifmQFGuWdXHTx5i
	 DFKRuYjyg6Pkf2otPR82l3ThmSXcFcmYoL/mEdvwsIsq78er0Xuwp9SDd4umbkg/bQ
	 pOxIc5iSSyMLz9ovw1NR7vGr/vNu/On0+VpLa2EUMF2Qr30Q9ekCeklyshqZqHcb9c
	 CN/p7WneEPSuQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vnHom-000000027UO-3rI4;
	Tue, 03 Feb 2026 15:55:52 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH 05/15] docs: kdoc_files: move output symbols logic to kdoc_output
Date: Tue,  3 Feb 2026 15:55:33 +0100
Message-ID: <f31df724450b31b6aa96c19e7ccbd7a1820d3c3e.1770128540.git.mchehab+huawei@kernel.org>
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

When writing unittests for kdoc_output, it became clear that
the logic with handles a series of KdocItem symbols from
a single file belons to kdoc_output, and not to kdoc_files.

Move the code to it.

While here, also ensure that self.config will be placed
together with set.out_style.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_files.py  | 18 ++----------------
 tools/lib/python/kdoc/kdoc_output.py | 21 +++++++++++++++++++++
 2 files changed, 23 insertions(+), 16 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_files.py b/tools/lib/python/kdoc/kdoc_files.py
index 1c5cb9e5f0e8..58f4ee08e226 100644
--- a/tools/lib/python/kdoc/kdoc_files.py
+++ b/tools/lib/python/kdoc/kdoc_files.py
@@ -269,6 +269,7 @@ class KernelFiles():
         # Initialize variables that are internal to KernelFiles
 
         self.out_style = out_style
+        self.out_style.set_config(self.config)
 
         self.errors = 0
         self.results = {}
@@ -311,8 +312,6 @@ class KernelFiles():
         returning kernel-doc markups on each interaction.
         """
 
-        self.out_style.set_config(self.config)
-
         if not filenames:
             filenames = sorted(self.results.keys())
 
@@ -336,25 +335,12 @@ class KernelFiles():
                                       function_table, enable_lineno,
                                       no_doc_sections)
 
-            msg = ""
             if fname not in self.results:
                 self.config.log.warning("No kernel-doc for file %s", fname)
                 continue
 
             symbols = self.results[fname]
-            self.out_style.set_symbols(symbols)
-
-            for arg in symbols:
-                m = self.out_msg(fname, arg.name, arg)
-
-                if m is None:
-                    ln = arg.get("ln", 0)
-                    dtype = arg.get('type', "")
-
-                    self.config.log.warning("%s:%d Can't handle %s",
-                                            fname, ln, dtype)
-                else:
-                    msg += m
 
+            msg = self.out_style.output_symbols(fname, symbols)
             if msg:
                 yield fname, msg
diff --git a/tools/lib/python/kdoc/kdoc_output.py b/tools/lib/python/kdoc/kdoc_output.py
index 44e40a6e8ca6..ece03cd9d321 100644
--- a/tools/lib/python/kdoc/kdoc_output.py
+++ b/tools/lib/python/kdoc/kdoc_output.py
@@ -222,6 +222,27 @@ class OutputFormat:
 
         return None
 
+    def output_symbols(self, fname, symbols):
+        """
+        Handles a set of KdocItem symbols.
+        """
+        self.set_symbols(symbols)
+
+        msg = ""
+        for arg in symbols:
+            m = self.msg(fname, arg.name, arg)
+
+            if m is None:
+                ln = arg.get("ln", 0)
+                dtype = arg.get('type', "")
+
+                self.config.log.warning("%s:%d Can't handle %s",
+                                        fname, ln, dtype)
+            else:
+                msg += m
+
+        return msg
+
     # Virtual methods to be overridden by inherited classes
     # At the base class, those do nothing.
     def set_symbols(self, symbols):
-- 
2.52.0

