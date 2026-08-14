Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C8C3EC6B2
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 21:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786743881; cv=none; b=McbH2DrZstV5SYfhiNd2HkAeor7LJehHWmTMFbPYrXrM42gEjLjt/xlDODyRTkLtF8BhHUUskdmHJkFN4fJjh3tlULSWoB75pthnGsyNZk2CR5kog6ZcySs2CRag2kg6MaJcq24G+/XRwsu9bb+HS1Z8Ns7vToRbdrMUCoP51kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786743881; c=relaxed/simple;
	bh=fAZZJUGfOXQNREoNQcCQIt84VLl0GenjAyfp+zuvKYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m/9AuZdXF17+X6rnHdtCvuTwZx2B2+HIYZQI6cDKSdcYhUwqjdldGcpt09rk7zOcV994qJtfITe4C95txWCgnfIZwG/jg5YOLAL/PF+lH8j22t/Gc7vxuYtjb5Kg/Y5lRiPftTBiz86EKCLDwJxZ4DV27U1Gj0cOcyJ8zaewmP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzHt3yUZ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzHt3yUZ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so1334234a91.0
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 14:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786743879; x=1787348679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5vjL0bcfCflpI7YejqKq7wVBmJ4etwCcXdP9FLIbDHQ=;
        b=CzHt3yUZkR0WUE4UgydEcn1OlSEtMjDJfU5FiOVfXcICu+zvpOAUzHte6bJTmz3RTo
         DKdLX3lyj0TKwPRcn/5XkKoxEMJSdCF6Eg7ZL3ei3BaVxIo37GE4HhFTjc/FcVz6IpSC
         t2kD0Hh7CwpQql3zf9gPn5P+GG/k5ZxsQkwzdWDjcKogFw8DEqsa+TAEcOSXSl2fhp0A
         2rOgJTD64DpFPNAdBS7TpgLZVLeJ7vlUykXZB2Yb47SJV+RO0SvEj3d6JCy6eCAMgOEO
         0XoMYs2mN/Q/zSRev7+n+aEuV1OpBIqYjvQOCr8eK2pA0BYvtJ3VqvXVvq8S9XoOkryn
         xCQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786743879; x=1787348679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5vjL0bcfCflpI7YejqKq7wVBmJ4etwCcXdP9FLIbDHQ=;
        b=qp7jJQDlVozaQZPqhL969NcRKtFuLwRWHT/jKO8EH2hyAanp/9yNJjTaOihkYzukq9
         orvjC1niLNTk7kpVccdntN0f7ff5Wf50TPDIyxuZeudBFIdeHi9LhaVW9n9WlubrQskQ
         C9HxFwYL5Hc2LtZVm6Dqex44uS7e16bNa83DXQv0X6i7+WsXiPzfIfdDkhO2NyvMtpPx
         HPr7voLs1NZTirR/Q2HKeABx/9wRAkdYhXx1JYBf2kfOC3ELcKLkDaf3ySUUUvisi1Dz
         OOBftsKDc/7PldIttvmrNsKnMQDvzpebvaSou5aqsf6bqtuE6pHi+u43UQ1RGNr6340u
         bAyw==
X-Gm-Message-State: AOJu0YwX08S/RVcZfBhpGh+JQTNCNiUI+FKSLVVNhKUGnpmOvL5NCvZ6
	nCZyxKvD7rM5PsSmfIYPo9V5KTqC60SNxrhQwbpTYxV+XxtBPOmhV7zB
X-Gm-Gg: AR+sD112cjIUqJTn/wh6afoGX48xDxVtfQF3idtyzK9vtxGeh/77ZNhiLlclNvSiQpn
	0+Xfm6UKqVDs00V1VsxOslianTeReyczhnsOz7U3onRwfwildYT+oHXSMphCddEIMEStJ8wQfHq
	5pD0Z8TJ5drTsvDDthu1ZsGlfwl5MAUdGRCrN+hBAql3rB5SYz2pD9LDmzgME8nZZZcVpurw530
	tDOibGubv1h+G5NQK9d+gBdadtQfT7Hf221hYxj3ddyxZGAKwSS+ANmWqCurLONJgPG9Dex4DlL
	WS/oab4BZb79meiNO0/0kY2pK7m+tdps82DvYRJuUYkkV5RenSNR9y8HCqcOBc9RFESVreRKXtD
	OInV8opdSfmypbChUr0KJryTTHE8i+hyf3IXaOxTiT/Wpj1bJWBWzAU3WNlvo7BfzNaDkMrrR4o
	5XdO6tCS8i7IE12MzlBoB6j/EJOCfFhHJfPVBgwnnyt/aeQg5tPcyn9JMkXnZdFOXQ0kYjlfYTU
	dIXr9VCeNF3FA==
X-Received: by 2002:a17:90a:ec87:b0:38e:485c:ebd3 with SMTP id 98e67ed59e1d1-3933ba79ea4mr10017141a91.15.1786743879368;
        Fri, 14 Aug 2026 14:44:39 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd918fsm8083617eec.2.2026.08.14.14.44.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 14:44:38 -0700 (PDT)
From: Chen Miao <chenmiao.ku@gmail.com>
To: corbet@lwn.net,
	alexs@kernel.org,
	si.yanteng@linux.dev,
	skhan@linuxfoundation.org,
	dzm91@hust.edu.cn,
	mchehab@kernel.org,
	wy@wyuan.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Miao <chenmiao.ku@gmail.com>
Subject: [PATCH v4 4/6] docs: sphinx-build-wrapper: prefer gmake
Date: Sat, 15 Aug 2026 05:44:16 +0800
Message-ID: <20260814214419.49925-5-chenmiao.ku@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814214419.49925-1-chenmiao.ku@gmail.com>
References: <20260814214419.49925-1-chenmiao.ku@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Homebrew installs GNU Make as gmake on macOS, but the Sphinx build
wrapper invokes make directly when generating Info and Rust
documentation. This can make the dependency check succeed while those
documentation targets still use an incompatible make implementation.

Honor MAKE when it names a compatible GNU Make. Otherwise check gmake and
then make, selecting the first GNU Make 4.0 or newer. Use the common kdoc
detector to keep this selection consistent with sphinx-pre-install.

Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
---
 tools/docs/sphinx-build-wrapper | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
index 1bb962202..994e5f7da 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -63,6 +63,7 @@ SRC_DIR = os.path.dirname(os.path.realpath(__file__))
 sys.path.insert(0, os.path.join(SRC_DIR, LIB_DIR))
 
 from kdoc.python_version import PythonVersion
+from kdoc.gmake_detect import find_gmake
 from kdoc.latex_fonts import LatexFontChecker
 from jobserver import JobserverExec         # pylint: disable=C0413,C0411,E0401
 
@@ -97,6 +98,14 @@ class SphinxBuilder:
     with the Kernel.
     """
 
+    def get_make(self):
+        """Select the first GNU Make 4.0 or newer in preference order."""
+        make = find_gmake(self.env.get("MAKE"))
+        if make:
+            return make
+
+        sys.exit("GNU Make 4.0 or newer is required")
+
     def get_path(self, path, use_cwd=False, abs_path=False):
         """
         Ancillary routine to handle patches the right way, as shell does.
@@ -569,9 +578,10 @@ class SphinxBuilder:
         texinfo directory.
         """
 
+        make = self.get_make()
         for output_dir in output_dirs:
             try:
-                subprocess.run(["make", "info"], cwd=output_dir, check=True)
+                subprocess.run([make, "info"], cwd=output_dir, check=True)
             except subprocess.CalledProcessError as e:
                 sys.exit(f"Error generating info docs: {e}")
 
@@ -787,12 +797,8 @@ class SphinxBuilder:
 
         if rustdoc and target in ["htmldocs", "epubdocs"]:
             print("Building rust docs")
-            if "MAKE" in self.env:
-                cmd = [self.env["MAKE"]]
-            else:
-                cmd = ["make", "LLVM=1"]
-
-            cmd += [ "rustdoc"]
+            make = self.get_make()
+            cmd = [make, "LLVM=1", "rustdoc"]
             if self.verbose:
                 print(" ".join(cmd))
 
-- 
2.50.1 (Apple Git-155)

