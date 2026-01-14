Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3891630BF69
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 02:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768356017; cv=none; b=BJ1tiTztPqwJZmmREJs0c/wgzyB3+hpwjS9ww0Wdiu95pGbWdw46Lx0OfqaRQEx9T1K+e06Uo71HI+wWMeZ512aYqDtJhrIqmHUEvbQQdf4Mx0B68+VqKGQmEmrBDgXhjZHfHGKEaKE6dfOylxIeexbAwbbr/RdeYAQqS1Pzxko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768356017; c=relaxed/simple;
	bh=Odcd6YwIhhQurU/smbiY8MbtQ0MmiwPiMOaa2h2/m5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OgtWvTmA5RCm9TJ8axnrZSdJVrRHgULswFErn5qQ5U3k9lGrYJlkiQNdIY0HiBx3tDQ0eG0V6qzK0+BjM4OeeEB6tqCJQr+guyn2wzFuGj2xuFaLMupEo35VKCbtIh3ET7qiEGeirzvuKUjqs7FqDOe9fOTGDMD7PBQVfeco7Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k/IKgAfg; arc=none smtp.client-ip=209.85.210.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k/IKgAfg"
Received: by mail-ot1-f65.google.com with SMTP id 46e09a7af769-7ce2b14202fso3530239a34.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 18:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768356015; x=1768960815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekbNT1OfK8aGhMhy2w3gZ5CU/UUE92pgkgzIatZ/Ils=;
        b=k/IKgAfgIhbh26gP8KBdnhuqdkAjwlY/VdMEv/VeqQA9zBJTreXdzrW5PMlmq7gvRR
         aAzpWJsjZR4LAVxw4QqpjYKzNusZDMhwUN/tQI9nrZXsqAcPIq/GxQ+jdXVbP4o8us8k
         TNIS93ITUhPMr7Wqai+y+7QXXs4SVhsIUaTK+wotWGmCavjUVFIBaH3CLOaGdO/kt91h
         Q4NRcdPiIUIambyZ6E4vxgen0SkJyJ2P697l3sx2rSDTh2egKmd71qvV3igz0qZzTeoX
         CrfzYKmtYN0IgsgANLU/Gy1ahIm7JuGZHXhYlpXHSuU1VR2VfOaHJ29GPdyRhITPzQ0B
         PwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768356015; x=1768960815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ekbNT1OfK8aGhMhy2w3gZ5CU/UUE92pgkgzIatZ/Ils=;
        b=Ixx+FbdarwMKebts+D7k2UZAb+aJCOazk1Tl41xzZlmZtpEIXg/uXC8ChQKeHTQIRd
         KYUxypN2fQwcc4Yske8WrIwhhhW0Zi5IvkWRb/bOsWgH76M03Ywjy8ARWSyt1/iafTrm
         fFA6O2RHWk2b2ebG1BvwFmozIW4Jb6m5ANxI8QUG3pExY8JxU1FG9/gqrlWYDMT9FjK7
         pYkS05a0+pa3S8hjtimMZUpQT0hEVWeGJETcBDZWvJm1WEcURaB2mp/JE++sXAd/cLfa
         ozz86a8s0zb85Y4o9+p0LsNhENgmv4ggVjEQrT2nP9q44+RpyiT+2WCMbOGLjBkVjnKO
         OB0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVnrfFC88O7iJpeXb8axwkaIr0tHLIWNv8Mr+Jbi0YWKK0ShBt4CuWWcMge/kte0+r2lRiWELoCGn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ1xij01UWEEVoqlpg8kJxl91HmikjwX3HAfgB9HnWCFNE6Oyh
	kcZryKYFB4zMvum8oRXDMMV+muw8w5PgmBdXF3QluQTO9zsJVhscOk4G
X-Gm-Gg: AY/fxX4l35/iqzgLSnUi1mlDqDH7cKygApDjp++pxSWFmH3PY5/vpp/Ij6me2nteCOl
	y60+cMmBGduENzq4zpNObi/B4FAxgb4NLjpJ6RfbPStKynmxXlyZ/n5+8agBbh7R3jDAlkzJ0Vr
	Een6TRbyKzaHymJzS+slCu4YBjosSJR8SgtAoZgB/WhfHFZIY+6WkitgknIgfLlO6mzC9ceHobA
	9XX2DBoiW9vn9x4TWNosM1wLcAi8jH30mkNdHmPRfatXab1DGw1qJWA9f03+MFQSvcqQIw75ykg
	N5SGEAExUayQXQV6A/9HwvVQfWB7ZLDpyxt/cn8ZrPKc73ZM6rGWMUhimBm7Ogx/LOyzLiQf74w
	WPc/CNJDgdEitdxdt1qTtNOWsLq2Q5AbdTIrb8mUhrqpwC2ORQLvo2p50IrcwBry93TplUcYhG5
	z/jIdrElM+Gyay+1FVZc5QDDkPUMz8+IVO4G0ukL5fVRZ8b4U=
X-Received: by 2002:a05:6830:4c82:b0:7ce:2b34:deca with SMTP id 46e09a7af769-7cfcb66f5fdmr225302a34.28.1768356015134;
        Tue, 13 Jan 2026 18:00:15 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7ce478ee883sm17634530a34.28.2026.01.13.18.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 18:00:14 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
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
	Steven Rostedt <rostedt@goodmis.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 23/31] dyndbg: check DYNAMIC_DEBUG_CLASSMAP_DEFINE args at compile-time
Date: Tue, 13 Jan 2026 18:57:39 -0700
Message-ID: <20260114015815.1565725-24-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
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
index ad3dc10ff03a..d8bfd19efde6 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -180,6 +180,14 @@ struct _ddebug_class_param {
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
@@ -193,6 +201,7 @@ struct _ddebug_class_param {
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

