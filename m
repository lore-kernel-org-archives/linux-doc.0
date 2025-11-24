Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523DC274FEB
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 22:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764024852; cv=none; b=hi2o7zXpTmqMKUk0ZicTK72NxMxaZ3cNFB2zvAS7y1BtWuLh9E6Su2sPyPKuJBmibgBwUTnxrmFacm4blUtpPuMor49CtqKJ/0gexTmFejkr2Fbk2Xd+RbQHWQo05a7YEBCJ/QvBbhpJxAxVXzJH+7hV9qoyVIMT53cC75OWnhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764024852; c=relaxed/simple;
	bh=edKq4gtkzxoLJDHJUV/qXOeR42ANjUErbCsec00PxsU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cXPikltfgkqsTVOYfYPrvsnDoBYN/yrBH1ZlhExhQCl6d0vEAPuTicP59fXmVAnuz7+poMyfq4FoAQq8ijwe0b3v1XvYxb0vjEa5BJ2v916emgnARdQC85rbnILxQaHAz5+GHOaXxs6gdSB5DEFbRcnljy9XHRwTDlvO8tP96Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSqaSfzM; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSqaSfzM"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-787da30c53dso47154637b3.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 14:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764024849; x=1764629649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YWuMPsKKgatyo18s+vz5tnI0IJ4a05j03miER+N0IUE=;
        b=nSqaSfzMWCA/MKQVhAL2rHeZ+7F6Bg34N15fhC0UJt+c69mhUmbd9ZVhTkVRWm7xGK
         DqhXgKNnBy77BTXYz3DeGqEGXAhHfqPera0BbXOoHDGJ3GdIUN0ZltPOcslFn1epHfSU
         E+jb/OAKGmaJ1v+3KihyrceQXeHUG0WHzefsfrpsY6oaGwzrUmr/N6H2zpnqAzh4RGvg
         KswMV05Kvm8cLmEwagK1TPGFZVoDe13BtOUIA/T6T1LAq357GX/NucpMNdyNGNCBlnop
         4DnRymuS/GovbMIFAjXCWKskPx6rStjeRA80Ix7m6PbD6Wnez1q/ovsrYQjXONZ6r5tY
         Cx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764024849; x=1764629649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YWuMPsKKgatyo18s+vz5tnI0IJ4a05j03miER+N0IUE=;
        b=JOZ0mbe9MnFa1rpW9WumHUaSm7tB0C5IztVQAAYd+V4DujG2BjFENfCGTcmj2D4DPX
         wZ79q2mZNQyc9dGukdMhY7F1Oh2SMLBIcK6bQGA3x2VPytAa99CJTqTzDN85+LafVX92
         iQaGgSwepGbmhMlsV0QIvK0UG12AaF2LdpDLywCoYdoAJ/ZTXvhBsKJxV9ZBCb/jrDnd
         04/LxsYqKTXbnbZo0PmgwQkiM7UMCZQU+NaflnwE07r6/AHi3dg8IORGVgEQ+TuUipmt
         OjyXhtv3naOuqFPf1tqG5Pc5uiZcK6Q7QQ014gM74DlCAy9+INPkqWB+G6LIF7g5Xg+a
         8DjA==
X-Forwarded-Encrypted: i=1; AJvYcCVF3aOXInwdKBtw3Vf+hdqiS3A7yyCpAqcsFxYDF+HoxPe8IkFpbLoP3h/nRxS9X3kV5sAcc/iiVvI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCJ2rbAMkFYWYnSDx/02lkStcHUkKzhZ2j91gE78zxQ/BkRufk
	wmJhyu+mud6+1sHrqtAl8Vw5MDwjbcKd5R+bcMwgDTCL4Rt7Gr/rrzFa
X-Gm-Gg: ASbGncsaztkhWadUP9g6qtPRT93pygdLQAU0dx2G5HH7U4Yvz6CPFo48yGZqQOit41M
	PxH+eaDndlNekFOotFhUwmxXh1JF7CSBvMXIfPd8Fpw6X8rfzcivLC0uBONCYHVNRaJbB+XMag9
	Yx5Q7Bjwrtgr/PAZHBOdTSCxUugMh421UQeaeLJGpB2lIlxA2X6S7quXJciX3ilQ9c4YX5seNuE
	U7bM9Lsc76tG2eRabBmgeKp2L+27WP/c7ttEaJuxV+eHJlRjLhbdI4yHB98RvmHD1YGZ9i9gWSg
	gr36MtcUEg4tLHtR9+6ds1i7DnIRVqWEc64mJGOYf9jOh6OJeHoBK1OUh4QYqcwxpfx0cW+SCbY
	J6w4L4hU8CXgZ3ciSjNxG14Mk//9KgA9ep/HCM7Xo+0HaRJWVcpJgAahCArbzjXf29L052VV2in
	if1aAVLjSo0zAWhvpJA6VzNA==
X-Google-Smtp-Source: AGHT+IHWNL6nbfpxwuN4vaoDOcaitVPmqOrTZpRhfU4dCtIL5A3x3tBs6D5XV9tHVYVPQP1fZTsyiw==
X-Received: by 2002:a53:c043:0:20b0:641:f5bc:6962 with SMTP id 956f58d0204a3-64302b3f5afmr8307288d50.78.1764024849231;
        Mon, 24 Nov 2025 14:54:09 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:4f::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a79925c85sm49604297b3.37.2025.11.24.14.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 14:54:08 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	Mike Rapoport <rppt@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kernel-team@meta.com
Subject: [PATCH v2 1/2] mm/mm_init: Introduce a boot parameter for check_pages
Date: Mon, 24 Nov 2025 14:54:06 -0800
Message-ID: <20251124225408.2243564-1-joshua.hahnjy@gmail.com>
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

Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
---
v1 --> v2:
- Changed check_pages from a build config into a boot config, as suggested
  by Vlastimil.
- Introduced the second patch, which decouples page checking from 
  init_on_page_alloc and init_on_page_free.
---

 Documentation/admin-guide/kernel-parameters.txt |  8 ++++++++
 mm/mm_init.c                                    | 11 ++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6c42061ca20e..0ba9561440a7 100644
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
index c6812b4dbb2e..01d46efc42b4 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2525,6 +2525,14 @@ early_param("init_on_free", early_init_on_free);
 
 DEFINE_STATIC_KEY_MAYBE(CONFIG_DEBUG_VM, check_pages_enabled);
 
+static bool _check_pages_enabled_early __initdata;
+
+static int __init early_check_pages(char *buf)
+{
+	return kstrtobool(buf, &_check_pages_enabled_early);
+}
+early_param("check_pages", early_check_pages);
+
 /*
  * Enable static keys related to various memory debugging and hardening options.
  * Some override others, and depend on early params that are evaluated in the
@@ -2591,7 +2599,8 @@ static void __init mem_debugging_and_hardening_init(void)
 	 * of struct pages being allocated or freed. With CONFIG_DEBUG_VM it's
 	 * enabled already.
 	 */
-	if (!IS_ENABLED(CONFIG_DEBUG_VM) && want_check_pages)
+	if (!IS_ENABLED(CONFIG_DEBUG_VM) && (_check_pages_enabled_early ||
+					     want_check_pages))
 		static_branch_enable(&check_pages_enabled);
 }
 
-- 
2.47.3
