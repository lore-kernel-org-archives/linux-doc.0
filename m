Received: from mail-oa1-f68.google.com (mail-oa1-f68.google.com [209.85.160.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72E737B3EF
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671879; cv=none; b=JiHC9G/CSiFlcHKg4C1tc3jN9HhfKIYlgNzmyL5abnUzuIk4df0359Q3/UyzAdmUEarGvp+UF+OWyhblcmJCeoo0T1y6ZynWb1KoFN6SGj0+u02tA63mKwyF5Dpu3pMXv7+IvZPs01nt5VnVK+svsnBZ8s5yDic34LcTbISzHS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671879; c=relaxed/simple;
	bh=73iRlVLRzzGjqbT5VuffFgel1TTC+Z0ezZbUSxUcOBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qzWuWl8Gf70DE5aIb0EaOF9FHiyLjVE87d2u9b4rQXbdgAi7pmS4h6+TOrpjXIVdipiVRVcMxUz91dQdL3NYlQbMplKHUJYpUGS9nXtKTK31FFpqlvfxKsM2hURiK6XaC5/wHmK3JC1PjwTVNaXZRZ3wBSs0byDnwTQBJY3Imc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UzQTZC6A; arc=none smtp.client-ip=209.85.160.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzQTZC6A"
Received: by mail-oa1-f68.google.com with SMTP id 586e51a60fabf-404254ffe8aso493972fac.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671877; x=1770276677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUEXWJbKdfBOOjNDzZI76IbqyhwnjuCteZGExOHlFQk=;
        b=UzQTZC6AOnqJVGDO7ugkac6pNBTKoxYIyIHdVgi8nU3E8Eo8Sh18xme3WFaB8O0Qa9
         U5PcOa1Dmc82xWBPLLEK6S+Mb8+Flxw6vITvl69sIPRwRKUWTBEVQ8Pnzc70G4QuvCRv
         ATw2OJbzmoF0MLAtbD35wkwNkJjI5I2+9cInf9W9Nfni1D3ZFaIjtXY/NRKWfL1hL9nQ
         17/HqmSd5SuJZvVc3vOSG5ZJo6nsva0rlPL+ICQL8P2cETSBqsuo6o2psB5Tn+OYgYZw
         AZOqUJxCijffd0p1QQnZ5IC48dZQOMQfjmOWBgsZSJJu0he9mkaFnf414o3RabSUYBG2
         zrtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671877; x=1770276677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LUEXWJbKdfBOOjNDzZI76IbqyhwnjuCteZGExOHlFQk=;
        b=fn6meTPhFnv9ApL9s8e8BQoIjwtxNtjXl1EyeRWIjJ+8vFuxutgX3aVGfwtFFNn6Vm
         NzEdwNYUKxuRLaI1z3hlaYPhFeFtWhklH+FxxbviB17T6lDwU5D0yo1MWzkRRN/4jlqO
         mRerLiwMR8egfoZxw5haR2xvD2UdHzF8LfThpdIk25sw8RVgxRCmRsz3wddYTwP+Q8cc
         Y6pCKlkY2HtcaHSg28yUEe09A/lAlh0LvM1luXFQ3fUjXdsNkmSLNFyazvFbBskrpkdg
         78R1nzeCbwawHLD93YS/sgnafQRXf1wX1hDru9isilsG2BuffbZ3atJQmY0sLu9L5vGP
         d+PA==
X-Forwarded-Encrypted: i=1; AJvYcCUU0fHKhGDqNaECoPUzKHvmpvo77BaZJMR0OD/UnjhZL8AW+A49Syp9LlJIvpBiza8j0RNmuxuRNks=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMcWkKEyhG8MX98Tn1zBGeZBu6wHl6QJVhJ8Is5/Zja6EyUXQ0
	BdWw3aH5S/VzRcPu3od9I8QLxFoKwmPwWZEJCold3w0T0qQRUZ6AuzVW
X-Gm-Gg: AZuq6aJd8mILFDwFUcB2eaEGgr0g5yX36mT241hKt58HXky0C0qWpZk61heDeOmKswK
	7v00sUGMqaCY9LzZ/5nV4wvUpEHOV8busC2wJ3uUcHL4SOWZkA5fk6Vr9RXFf3Zvvjecyv4d1qh
	ZaqqWIpYiBscQn1BB3rSa8EbTT4Sp5Z+Wsd6coMkNyYIbXsMK5O5B4dLICNN17/kj5iGouyZdOm
	bZlhUSqo5xO3AtJaKl8+NoEOGKr38GJ8Ev0BsA8En9E/rPCPTYpK/C4wFlGOnhTSXa16SLvZgJt
	mYlTJImJFbxH9lw9bR4/Ito/S3rLgVy1V4PmU7wInsPvFhjMJfMxR6Ycj7tCJZEbcYTSMXwArBc
	3gv1tFtHBOTiGAPsGksyF/X6tbgRHlVw1/MH3yZhzLC2pk6gYovjkHzSpjRwjhcBdx8WwFoH7ef
	lMSVRiRhSw/qFh7sJxfez4OzO7hL5vX/tCpXCgSXZK
X-Received: by 2002:a05:6871:b21:b0:3d2:e6a7:e938 with SMTP id 586e51a60fabf-4097fd66c5fmr1255560fac.15.1769671876766;
        Wed, 28 Jan 2026 23:31:16 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-409570f2fbdsm3496854fac.4.2026.01.28.23.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:31:16 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Jason Baron <jbaron@akamai.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Petr Mladek <pmladek@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 24/32] dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at compile-time
Date: Thu, 29 Jan 2026 00:29:10 -0700
Message-ID: <20260129072932.2190803-25-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129072932.2190803-1-jim.cromie@gmail.com>
References: <20260129072932.2190803-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add __DYNAMIC_DEBUG_CLASSMAP_CHECK to implement the following
arg-checks at compile-time:

	0 <= _base < 63
	class_names is not empty
	class_names[0] is a string
	(class_names.length + _base) < 63

These compile-time checks will prevent several simple misuses, and
will issue obvious errors if violated.

4 such examples are added to test_dynamic_debug_submod.ko, and will
fail compilation if -DDD_MACRO_ARGCHECK is added to cflags.  This
wouldn't be a useful CONFIG_ item, since it breaks the build.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h |  9 +++++++++
 lib/test_dynamic_debug.c      | 13 ++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 74ed18a038bd..d3889173abf3 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -181,6 +181,14 @@ struct _ddebug_class_param {
  * __pr_debug_cls(22, "no such class"); compiles but is not reachable
  */
 
+#define __DYNAMIC_DEBUG_CLASSMAP_CHECK(_clnames, _base)			\
+	static_assert(((_base) >= 0 && (_base) < _DPRINTK_CLASS_DFLT),	\
+		      "_base must be in 0..62");			\
+	static_assert(ARRAY_SIZE(_clnames) > 0,				\
+		      "classnames array size must be > 0");		\
+	static_assert((ARRAY_SIZE(_clnames) + (_base)) < _DPRINTK_CLASS_DFLT, \
+		      "_base + classnames.length exceeds range")
+
 /**
  * DYNAMIC_DEBUG_CLASSMAP_DEFINE - define debug classes used by a module.
  * @_var:   name of the classmap, exported for other modules coordinated use.
@@ -194,6 +202,7 @@ struct _ddebug_class_param {
  */
 #define DYNAMIC_DEBUG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)		\
 	static const char *_var##_classnames[] = { __VA_ARGS__ };	\
+	__DYNAMIC_DEBUG_CLASSMAP_CHECK(_var##_classnames, (_base));	\
 	extern struct _ddebug_class_map _var;				\
 	struct _ddebug_class_map __aligned(8) __used			\
 		__section("__dyndbg_class_maps") _var = {		\
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 1ba4be9a403a..b2bdfdfb6ba1 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -133,7 +133,7 @@ DYNAMIC_DEBUG_CLASSMAP_PARAM(level_num, p);
  * Enable with -Dflag on compile to test overlapping class-id range
  * detection.  This should warn on modprobes.
  */
-DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
 #endif
 
 #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
@@ -146,8 +146,19 @@ DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
 DYNAMIC_DEBUG_CLASSMAP_USE(map_disjoint_bits);
 DYNAMIC_DEBUG_CLASSMAP_USE(map_level_num);
 
+#if defined(DD_MACRO_ARGCHECK)
+/*
+ * Exersize compile-time arg-checks in DYNAMIC_DEBUG_CLASSMAP_DEFINE.
+ * These will break compilation.
+ */
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_neg, 0, -1, "NEGATIVE_BASE_ARG");
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_base_big, 0, 100, "TOOBIG_BASE_ARG");
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_str_type, 0, 0, 1 /* not a string */);
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(fail_emptyclass, 0, 0 /* ,empty */);
 #endif
 
+#endif /* TEST_DYNAMIC_DEBUG_SUBMOD */
+
 /* stand-in for all pr_debug etc */
 #define prdbg(SYM) __pr_debug_cls(SYM, #SYM " msg\n")
 
-- 
2.52.0

