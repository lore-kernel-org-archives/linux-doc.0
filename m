Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECBD483803
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 18:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786559021; cv=none; b=fYf1ekkf9oSFwfe5Bh3RWLPFQtQjg7Hv8/I0uSeeyGlWkQOMSRTq+fieIllaw28L8ZBGVsz2GYgcM6xtyFFXSHsNLWy7z+LtoXt22S7wpZdrKuXEEraqdJSgg7iQYyyz/OXnEjUCdydDoimtO8ixlbya/1Uvqdq06LO3OOklfCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786559021; c=relaxed/simple;
	bh=N/WYdi0aZIV7rxmg17mdmDrh2LsBZrC3Wc9QskuYJDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=INaWQbDLVcq+PmgtIT9pKic+2EPAPHWOcTlcO6eh4ziSPNt75UHQBQh7FkTpwwRg3nHzMCYUMP5rEVMPkwRvXrvaa6C1VItjyS8i8RlzQuQUfzJWR5VbvP5AxcghbM6q1G/0haZdfkJs46hvbFnCHLZwrP8uf2XQ8iY2PQHVlTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qBz/fE8M; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBz/fE8M"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so1314548a91.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 11:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786559019; x=1787163819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/8cDZDrtlvjE2bITeYhmpWwajBeWOw7XQjPzAjg/838=;
        b=qBz/fE8MBIYif+F6+OwcWWMiqevC7ZCGQKOwngeOVBNEYTHlZfIhTej/j4oQSBZgrT
         b+lEvb4XOtgSpqoF4SFMbeggL5lOkk5og6Ez9njq7QVKx1xQ7jwIpGEhRl/q6m/me3Ut
         uuqCi4nk1czJ58Np067hhQAiE3I7g8qDViADMqm9OLZdxK7N8kOadm8bSCnbkRGVENRH
         p35nZNLGe9BGwSADT8Tajt6tKEZcTC14lTVep19HLx6PD8U16CC9eh8kXc6utV+xw2I9
         ywts/EpKHNj2YHssM7gymTYmsFaAhAyAt5+kklM7ZcZAapW3J/TRrg5+HBFbQ2eM9kg5
         zfsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786559019; x=1787163819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/8cDZDrtlvjE2bITeYhmpWwajBeWOw7XQjPzAjg/838=;
        b=JuN+5vPEWT9QUx+9xdBTvunfCxkNeDnEnxMWlijuC73S62RIcMcpdKRhjFF/YoX1A8
         KaDoDYRv9Oboq9SXohB/I7qdYMBOW9/x3PkkJ7KbAP8Cd4MnEFYh3UhvGH6A+0acNoxG
         +/Kl/p8W9q/NQI82vrUoJoVQF6h5yOU0WfW2dn/T0n4Sit3lc8DrOOU01PCR4PGer/bT
         ww6uYK5As4HoBb9gug7k5HigoYNIBNvb0Vm4NZUt6bmpWQVZmyzCf6Jyg+k+Nis4mX1k
         tzNMHtJ7/k7ond3HdUk/uxmlgb4BVaJ5sNi9AvCPtwWzRJjmyd9aHH366T4Y+P2nEQZu
         cNLA==
X-Gm-Message-State: AOJu0YxaIN9EvUATDOYoEiG6OjUSUao2FciExdJ24Q/h4xdtqOTCLryN
	hhe0Y++Cyk8kKvz1OqlmWQAU0j85x6TT7JktzXGKib2i+belTEfjkmVpI4fXLQ==
X-Gm-Gg: AR+sD13LBdZMo7vjcRTfCsfHA2w6G9qEWvTNFx9cJBXwVpX10khc8e6LrtksU6uNC2y
	NHDfIJykoBYBcmmzQz154iuLphuVnGwz9m45bVhWh2OnM4ZEUd2lhN+Jnlj/TwYFzttwCZvC6wt
	Ku9vXBuDQl8vFncAdQBqbEx0XntBmuez0RCUI4D5SczWtw953lY5zrKcOP8TK+kG60poL4pWEvL
	H3YrGzC4v1fEv3rccgSHI8ToJjuCVNvBecjhSE1z3QzxtrzCMc71E6J5Tt5OkvXkzVAU+a6f+zJ
	q6dbX5tZHcfN/LEhIIVHs9w8o0eCK+8qYoyqDwSn9hm5GwGcDI/uPLYPijDPYJNOz4BGcmYqaja
	hOGDiaKfTCiBTin77R5J3fD8Sh3zYcYswE3bKrriJxdEEMAc/dCBj8WOCtJojco8VqfW/+5zth2
	OKs4LN4chsWSRhpfkHa+SCTAmZPukq5wzyKPiaFeFQ1BAItPhU3uDNbISefI0aJZA0rwv0eepd/
	Qs=
X-Received: by 2002:a17:90b:5288:b0:38e:ad9d:1151 with SMTP id 98e67ed59e1d1-3931dfd01b0mr227959a91.4.1786559019537;
        Wed, 12 Aug 2026 11:23:39 -0700 (PDT)
Received: from localhost.localdomain ([64.186.250.142])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3c08163sm12127695eec.7.2026.08.12.11.23.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 12 Aug 2026 11:23:39 -0700 (PDT)
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
Subject: [PATCH v3 1/6] docs: kdoc: add GNU Make detection
Date: Thu, 13 Aug 2026 02:23:18 +0800
Message-ID: <20260812182327.53694-2-chenmiao.ku@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260812182327.53694-1-chenmiao.ku@gmail.com>
References: <20260812182327.53694-1-chenmiao.ku@gmail.com>
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

