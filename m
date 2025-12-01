Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F256D1F30BB
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 18:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764612463; cv=none; b=WszegXQ78rMExg2EOxNU53EIJG6QEcwr+Rjpn0sofxnIxseQF+sK6TOS9940ie1gcy0X14BDWAg5qlDk00y9C954t77YwRagGidTsqFxpSy5Qpn8nurX2Qm6xIT33XUzrESSHCpYN54hNFl18lTQVXtcfaD+7PcTtWeBXVtEC4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764612463; c=relaxed/simple;
	bh=yM6aPJxvxblAnvdThGStpTfIcE630fVs9OU3ye4pspM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=noYGBhqkg8DcFUc2fflN2OdUFd8wBLHV95ybh/AypI8kTPIfKd91D5AZohdkKa7l55zXNakvHizCTqUZ7lhxy2Z3Pc/oUNsJLtxBOITevV/kdLzDZIolg8+lx32HeaatUFP+B7p1I2Bjcmz9oFculaoPOV0zheOhU6vOPvrYVl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cEMTX71O; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cEMTX71O"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-78aa49cde3dso44692627b3.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Dec 2025 10:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764612461; x=1765217261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0QyuTy6ek64uIdo9s8SZmB6RliPCLO8eDRQ9s+Wqlok=;
        b=cEMTX71OzhkRsoHVBjeOlMGoNlt6L3SXvO4yGZQBvr/W618hptEhfK69ZcnmlGDaJ2
         GosCXu1exnh9rMMsISJKqNvO6VyjaPdqSu4K3lVb/aNwfZUxL509x/aiIbwYT2gzHNts
         7Ic7vhY/uL6ammeGscxtO/dJ7nWKaJVLrUWExfUl94Gbkmfvos21HSbm1VKkCqkKnGrM
         QGJBe8c8isfgRN46G7vQqAeDGLK/RF0iUSH7LtfHZKv3FsdVO5Sn77u2+gYySQLL/Clw
         mLm/SCe47GgMJMLnYjerhFDqG+3Z8cl1OiuAcTfmXUKgyU8yGhIlOMACiJ8B9sysrOgh
         iMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764612461; x=1765217261;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QyuTy6ek64uIdo9s8SZmB6RliPCLO8eDRQ9s+Wqlok=;
        b=VmUJy+d6xVdQL6XdGdPbhtia4t5I7w0mU3N1JTuVpw8eH7rF6qnbyJVuFsp8YifHVn
         VcLfifjmwUZr4b94UN5U+NZWTkEXNL/zw9vavZfW4BFORwmWZ/TeGx6zNhA1pZNevo+q
         RG3oljQUzz6/6OoTN8/OvvCTaB2tPBu+RgFNi5NrDQRzJCuNhHH0k8WHKwB8BFggEBNN
         CPNWl1RltjY/DUBbpald06DL5g5GuB0qmj5rF8yG90ZbFXZvemoPqBC0FIyi60Xotf6Y
         EuunlpAdLz40b/swlDg26OBCoaH3Gt3x2yuK8I0YrpJsjroPxR2swCgUr9mRWjFyfiFb
         aHcg==
X-Forwarded-Encrypted: i=1; AJvYcCUgFdKo9w8GR+KHMbfqLfIAKbVFKDzSA+eGduDQkHDL0TJG62sYwzOitgQ6XRc2CCC93x5lttigEsY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Ft2ClqF5vP8VBrwjQaP2yZcibCwClw4wOuqypW/VbybSDvCY
	H0JYZajCEGpsLzS19gmD/6i82zyIESCuq2mIzfhOpV2V8niGgcZxD7CO
X-Gm-Gg: ASbGncuMoOuo6Ro4wIaG4YNxpf6x+vJFpjZNlnkdmc3TXPBwawyR5RJQoU+iyzuVBE+
	slYjQIdCk3iSS2tPf+cHC8/kqFQ1LQksGkI0s7A9kIBO/KXfNL3V+x3s3mrK3K8mIrXDF67W6zk
	98rxCA1vobszYl+BALFniC0eqdUjYmXxeslnz6CojepaMWuRy3hp8ellTl4J/kfZUl7DxyBo5k2
	P3mTaDtxkyqvLxpu+vZ3/gzyAG82k+wIjeRnCRWJi+UBhx47foOunRy28dHts1lDl/0G1Og63wn
	+V6O4fPMUQKu5Eaads5vWkbzL87iD67hsxxbqxLyqbs4VYvvpmaQjl6DdD0dnFewB9SoPCXpv7W
	QkmtmTZyzkkrfoIXI5U9pRlh+FVAn90Z6vx7CVsucBSf1KqkpbzhxLbEMr4W/iANIO9fbNQ0o0n
	BfmkXw21shGcba6HiSY1yVhg==
X-Google-Smtp-Source: AGHT+IGebBLF0eFSQu1V6/IZFq1lSrNOt+fw835UDZgXCTtz/zrjUyYDOacz1JvbW8Om1eqnkY9hqg==
X-Received: by 2002:a05:690c:6087:b0:786:5926:edab with SMTP id 00721157ae682-78a8b491ceamr335684337b3.17.1764612460818;
        Mon, 01 Dec 2025 10:07:40 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:5b::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78ad0d5fe7fsm52262427b3.17.2025.12.01.10.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 10:07:40 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	SeongJae Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mike Rapoport <rppt@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com
Subject: [PATCH v3] mm/mm_init: Introduce a boot parameter for check_pages
Date: Mon,  1 Dec 2025 10:07:38 -0800
Message-ID: <20251201180739.2330474-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use-after-free and double-free bugs can be very difficult to track down.
The kernel is good at tracking these and preventing bad pages from being
used/created through simple checks gated behind "check_pages_enabled".

Currently, the only ways to enable this flag is by building with
CONFIG_DEBUG_VM, or as a side effect of other checks such as
init_on_{alloc, free}, page_poisoning, or debug_pagealloc among others.
These solutions are powerful, but may often be too coarse in balancing
the performance vs. safety that a user may want, particularly in
latency-sensitive production environments.

Introduce a new boot parameter "check_pages", which enables page checking
with no other side effects. It takes kstrbool-able inputs as an argument
(i.e. 0/1, true/false, on/off, ...). This patch is backwards-compatible;
setting CONFIG_DEBUG_VM still enables page checking.

Acked-by: SeongJae Park <sj@kernel.org>
Acked-by: Michal Hocko <mhocko@suse.com>
Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
v2 --> v3:
- Dropped the second patch. I may pursue it at another time : -)
- Variable renaming (dropping leading _) and cleaner check in
  mem_debugging_and_hardening_init, as suggested by Mike Rapoport
v1 --> v2:
- Changed check_pages from a build config into a boot config, as suggested
  by Vlastimil.
- Introduced the second patch, which decouples page checking from 
  init_on_page_alloc and init_on_page_free.
---
 Documentation/admin-guide/kernel-parameters.txt |  8 ++++++++
 mm/mm_init.c                                    | 10 +++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6c42061ca20e..acdc7fbdecac 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -669,6 +669,14 @@
 			nokmem -- Disable kernel memory accounting.
 			nobpf -- Disable BPF memory accounting.
 
+	check_pages=	[MM,EARLY] Enable sanity checking of pages after
+			allocations / before freeing. This adds checks to catch
+			double-frees, use-after-frees, and other sources of
+			page corruption by inspecting page internals (flags,
+			mapcount/refcount, memcg_data, etc.).
+			Format: { "0" | "1" }
+			Default: 0 (1 if CONFIG_DEBUG_VM is set)
+
 	checkreqprot=	[SELINUX] Set initial checkreqprot flag value.
 			Format: { "0" | "1" }
 			See security/selinux/Kconfig help text.
diff --git a/mm/mm_init.c b/mm/mm_init.c
index c6812b4dbb2e..fc2a6f1e518f 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2525,6 +2525,14 @@ early_param("init_on_free", early_init_on_free);
 
 DEFINE_STATIC_KEY_MAYBE(CONFIG_DEBUG_VM, check_pages_enabled);
 
+static bool check_pages_enabled_early __initdata;
+
+static int __init early_check_pages(char *buf)
+{
+	return kstrtobool(buf, &check_pages_enabled_early);
+}
+early_param("check_pages", early_check_pages);
+
 /*
  * Enable static keys related to various memory debugging and hardening options.
  * Some override others, and depend on early params that are evaluated in the
@@ -2534,7 +2542,7 @@ DEFINE_STATIC_KEY_MAYBE(CONFIG_DEBUG_VM, check_pages_enabled);
 static void __init mem_debugging_and_hardening_init(void)
 {
 	bool page_poisoning_requested = false;
-	bool want_check_pages = false;
+	bool want_check_pages = check_pages_enabled_early;
 
 #ifdef CONFIG_PAGE_POISONING
 	/*
-- 
2.47.3
