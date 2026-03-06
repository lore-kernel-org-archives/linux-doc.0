Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB96392C5B;
	Fri,  6 Mar 2026 15:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772810723; cv=none; b=PZA8s5f/cd7nNql549cyGn0stDPb8yg1LNNnEfso6O4OaP7ZMXDh7bNm6pGYN+DUIxQlCDSDUOQxkwdufnOAC5hpg+RxTn8K3V+h7le1WBYBYPPSCaEL9vU1EIBDcJFGbBofCTyrv+Htu2eCDwfx0h+hU3VKTcLEV7ZZWrp/0tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772810723; c=relaxed/simple;
	bh=P6Q2PSaD8E24gYpLDm2SuaDxRi4gZVBuOO+lyWBKM/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RXcs2/xoE/yXaVKIKnGIj9uLxykHiAOuQAXPvvWM2NryC5Mx3tTIlcKYWqq6Fd1E+w+nqgo6VuLBgxXG0DaIw5ruX5vqCDmcmArsJqUvRJRRYs0m6T7Sw+WzyDSywnSDixGfr0gAuFyZQiEMGHIGNw/+UsRmoOnYcHSJ5cV6JSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZWtYO8qI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZWtYO8qI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4490C2BC9E;
	Fri,  6 Mar 2026 15:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772810722;
	bh=P6Q2PSaD8E24gYpLDm2SuaDxRi4gZVBuOO+lyWBKM/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZWtYO8qIxE+A6qY/GUFXPj/uk/l2OTZ18tkdhBD9ZlK5ajbSCo0JEU4XN4/hL5A8P
	 zjzJYzIaefaZUTvzI1/35goMaA4x6GHfiLfxPZCChuGCccZCrvFPQhFYBZHyMfdnWd
	 MHQttv+eujQvN4/HxzXFChf/NMhDFydctG1GEEUyWIHIa1w3d+Djdha4YHl2PXaSDO
	 z5zqpz3QzkGboEeG5yRRHJc5GvDMz7k00B9aBBL9hfhxts0PhB3YYJODfI5LuDGkp+
	 xUY0Up6c+VDfhFOAW1bdCRa/PrgGT/d9NZnFMzwU1ZyXFIN0Dj3E0zhPa53xzP2hp3
	 5id5FmexIK9GA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vyX3I-000000074wH-33HY;
	Fri, 06 Mar 2026 16:25:20 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v2 1/2] docs: kdoc_files: allows the caller to use a different xforms class
Date: Fri,  6 Mar 2026 16:25:14 +0100
Message-ID: <6b274ddbdcd9d438c6848e00e410a2f65ef80ec2.1772810574.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772810574.git.mchehab+huawei@kernel.org>
References: <cover.1772810574.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

While the main goal for kernel-doc is to be used inside the Linux
Kernel, other open source projects could benefit for it. That's
currently the case of QEMU, which has a fork, mainly due to two
reasons:

  - they need an extra C function transform rule;
  - they handle the html output a little bit different.

Add an extra optional argument to make easier for the code to be
shared, as, with that, QEMU can just create a new derivated class
that will contain its specific rulesets, and just copy the
remaining kernel-doc files as-is.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_files.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/tools/lib/python/kdoc/kdoc_files.py b/tools/lib/python/kdoc/kdoc_files.py
index 33618c6abec2..c35e033cf123 100644
--- a/tools/lib/python/kdoc/kdoc_files.py
+++ b/tools/lib/python/kdoc/kdoc_files.py
@@ -118,7 +118,7 @@ class KernelFiles():
         if fname in self.files:
             return
 
-        doc = KernelDoc(self.config, fname, CTransforms())
+        doc = KernelDoc(self.config, fname, self.xforms)
         export_table, entries = doc.parse_kdoc()
 
         self.export_table[fname] = export_table
@@ -154,7 +154,7 @@ class KernelFiles():
 
         self.error(f"Cannot find file {fname}")
 
-    def __init__(self, verbose=False, out_style=None,
+    def __init__(self, verbose=False, out_style=None, xforms=None,
                  werror=False, wreturn=False, wshort_desc=False,
                  wcontents_before_sections=False,
                  logger=None):
@@ -193,6 +193,11 @@ class KernelFiles():
         self.config.wshort_desc = wshort_desc
         self.config.wcontents_before_sections = wcontents_before_sections
 
+        if xforms:
+            self.xforms = xforms
+        else:
+            self.xforms = CTransforms()
+
         if not logger:
             self.config.log = logging.getLogger("kernel-doc")
         else:
-- 
2.52.0

