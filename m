Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601423EDE42
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 21:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786743872; cv=none; b=DLKUw/xxHzmeZ0PpuJLly4ZhLPL33S3VOscIdWQvX8tGMau8c9IULYjTYw4IADFdFq8V1VLLZxAfbuZaB5zenl7Jkn9Ua4SzzVOdxQzGPrRDxERwGvVnrCg7I8FW2FYczpLbR+B/lHSSitjxpnFTnsvQKvf5f0OUrvLvMdlDO4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786743872; c=relaxed/simple;
	bh=N/WYdi0aZIV7rxmg17mdmDrh2LsBZrC3Wc9QskuYJDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nm+x44eqvnFXhsC31IYFeF1xA2AFUw7IgEnSLXno95FJbfarx4qqbNcKHL3dJlxUQpEbSxAQphGCui4uR6OADn5XG2XPZ//xxZFzij4TzNWZDIizRIrimDRcPh3E/IMEMSurFzxE1Wl4ccT80ZS85Jy1ZHb4/3gja7mTzQEkxlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JeHtSUCb; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JeHtSUCb"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cab973140bso24543835ad.3
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 14:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786743871; x=1787348671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/8cDZDrtlvjE2bITeYhmpWwajBeWOw7XQjPzAjg/838=;
        b=JeHtSUCb9HEL3nxRfJ86gXFmTUyjoxSSAgywNlUpaid56XcTyZNoCzk4mWUdM/8H0A
         Iq/MqrDZ0A0g+U9+pGPA/aWKsXazhwf5xsPqjmDP0mv31mCjBSOWqtKt/QQiIX8n573C
         chAVsQgMV+m+utcE8l3wmsI8seFAqvpQalJOH+uT2fKbPtXtAMt4+EbQ765vyAXfajUE
         5CxEDgq5NAPsJhm8qsUxqzVFd+iRhWzY3CkjVvwqPy4JYa74M6QK1SHzUDNmv804+V3S
         UaRaXUdHrLULQxJeT6b9i5UH4g8uW5HOLlCDdwpXc1K03Ew90e9Qrf0SM0oTKZNrPfva
         oHQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786743871; x=1787348671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/8cDZDrtlvjE2bITeYhmpWwajBeWOw7XQjPzAjg/838=;
        b=B5lmxJDKSpVxBGAk43mG5Mb8jMZJgY9andnn09ON7iNWpnvnaiLo6SpH0MzgzQPDYt
         JrmEV5ug9q0tDQVh4DDUtZYKdBDuyZ5eL98ldaoqCRbOzSgreieoHaY1C9CFVlyiwnID
         1vRc2kGWftJmUuyIZgKP2hM0iG/oTncIVMg4/hJXnozSl6vuirHiCpACEUrzf7dBaT6D
         BYztEnvUavS9BjsPbIzxmM7Qyw9bNgA3FTQ53CarYTa7ok/0OHxYM8Lhf9I3yyhZm0gS
         YJNCf04Jyv5gBUYjoW93HONM0ARHCKa2O2Dumq9r3H0xJlRjwIH6iwWUYEAaV1YXJCXq
         6LAA==
X-Gm-Message-State: AOJu0Yzy51+LwOAXgUFGh85FJTtsURkf4KPyrtTPkGdvSyHh+xAkPkZ/
	+433L22Mv55uorE84RBfaqoPRpjmfN3c/kPzLR35ojbPmYFpauWi2IVI
X-Gm-Gg: AR+sD10u63XGpPCtCABBXBJgNB4ndIG/okP7PS4QddOlpHYJ4K1ixRSxEuzno48p4x0
	+yQxu74yiBGZtHwlxHst/8j1JP/W98IYIPptJWhMIFeGBtH2FWKZaPM9dIQLfb1rr1xsNk9oBzB
	L00xLW32pE6Z6bMlo1abv9ASWyFmg3JDu/U0htRXSditzkKI9nFPp5NBQLqgikS4XTK3Bg2emBb
	mMKIH21cVpEa/PWig0bQZtFR5u0IPwYN2L8KPwaDpK72ldDKgGb6NnBoadZ1ehlwmSmyFBMzrNL
	hVxWo8swIhBn2izZsNySf+ydkK+9SOjGfUSDwkASsbIBKr0aZ+Sp2CkAFEqTDR8zNu63xmlWfsO
	yU/g961PxcaEj32KlzQ2SHSGe4dzip4/udAhh3FpqOXbji7seYjumNOiLItxh0wani0VhAeivZP
	Uqobmc+dJi8tFMYhbnwViSTILWUuVlKEtV5lZCnR/IHOBMRjnAD6T+FQjOhN7gL4hKDdVnEUbK1
	Tw=
X-Received: by 2002:a05:6a21:7004:b0:3c3:875d:c538 with SMTP id adf61e73a8af0-3cc71af16fbmr11589781637.8.1786743870615;
        Fri, 14 Aug 2026 14:44:30 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320d5bd918fsm8083617eec.2.2026.08.14.14.44.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Aug 2026 14:44:30 -0700 (PDT)
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
Subject: [PATCH v4 1/6] docs: kdoc: add GNU Make detection
Date: Sat, 15 Aug 2026 05:44:13 +0800
Message-ID: <20260814214419.49925-2-chenmiao.ku@gmail.com>
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

The Sphinx dependency checker and build wrapper need to select a GNU
Make executable that meets the minimum supported version. Keep the version
parsing and command selection in a common module so both tools use
identical behavior.

Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
---
 tools/lib/python/kdoc/gmake_detect.py | 62 +++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 tools/lib/python/kdoc/gmake_detect.py

diff --git a/tools/lib/python/kdoc/gmake_detect.py b/tools/lib/python/kdoc/gmake_detect.py
new file mode 100644
index 000000000..5c0a28bc7
--- /dev/null
+++ b/tools/lib/python/kdoc/gmake_detect.py
@@ -0,0 +1,62 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0-or-later
+# Copyright (c) 2026 Chen Miao <chenmiao.ku@gmail.com>
+
+"""Detect a supported GNU Make executable."""
+
+import re
+import shutil
+import subprocess
+import sys
+
+from kdoc.python_version import PythonVersion
+
+
+MIN_GMAKE_VERSION = PythonVersion("4.0").version
+
+
+def get_gmake_version(cmd):
+    """Return the GNU Make version for *cmd*, or ``None`` otherwise."""
+    if not cmd:
+        return None
+
+    kwargs = {}
+    if sys.version_info < (3, 7):
+        kwargs["universal_newlines"] = True
+    else:
+        kwargs["text"] = True
+
+    try:
+        result = subprocess.run(
+            [cmd, "--version"],
+            stdout=subprocess.PIPE,
+            stderr=subprocess.PIPE,
+            check=True,
+            **kwargs,
+        )
+    except (OSError, subprocess.CalledProcessError):
+        return None
+
+    match = re.search(
+        r"^GNU Make\s+([0-9]+(?:\.[0-9]+)*)", result.stdout, re.MULTILINE
+    )
+    if not match:
+        return None
+
+    return PythonVersion.parse_version(match.group(1))
+
+
+def find_gmake(make=None):
+    """Return the first GNU Make 4.0+ from MAKE, gmake, or make."""
+    candidates = (
+        make,
+        shutil.which("gmake"),
+        shutil.which("make"),
+    )
+
+    for cmd in candidates:
+        version = get_gmake_version(cmd)
+        if version and version >= MIN_GMAKE_VERSION:
+            return cmd
+
+    return None
-- 
2.50.1 (Apple Git-155)

