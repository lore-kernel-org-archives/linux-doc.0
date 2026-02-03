Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D7D3043BD
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 21:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770153712; cv=none; b=UZbsbvC2zqsjlvsD/cl6P2Y9tP8csPg5NIrPwNB69CHcsii3ss2C5gF/vbtak2NAvmBoX01JMAV/ffRMVyPuXODTaLYsNBRknhgRzLkaLzoZ8QXpS7CYQTR7RxgFkw7plCZmwvzKOaFEjcjIyowHeHuGNIj/jL5BTUKylkEv8xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770153712; c=relaxed/simple;
	bh=Yi/oWZYyOFBr7d0AynDLdriSbbFz6Sf3CBhZQVgZ0Xg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IBGqxMsYBQHWadHPPOio9BD1zN+3LwPqQXqGYDXtnvZHwX0ACtlqVw5IvDPduj8q2wtsQHpXJ74Fa+NJrV9WsKFNZnh6RYoSB4vgz3hx685AMcq0Gx0ch00c8/XaLmiiuqsECwJTUbQxC/MyaTsoquAMr1M51clLLSJeid95hps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHi2nYDc; arc=none smtp.client-ip=209.85.210.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHi2nYDc"
Received: by mail-ot1-f66.google.com with SMTP id 46e09a7af769-7cfdf7e7d19so5489573a34.2
        for <linux-doc@vger.kernel.org>; Tue, 03 Feb 2026 13:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770153710; x=1770758510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tnx8rcvEvdkYGEIn2XQxOtCyxNvcOHGRSe6Kvp60kmU=;
        b=SHi2nYDc01MyF8L+F3a91mkbywAHua1tLp8m2ZXigawJBtYohfs/iolOxd5Zcnbur9
         9IKlv5R4H7dxwQwFVHS6gOXBc1MnUdBI7ZmVJjIuKuPBpscGHl0Pexi+XIhoU/uODXAv
         gd+kNf0tZsDxGzwJHipW3LjgDBU0G8HMiwFRJ4HG7xdBTEZXJUp/C3Rkb09UuIyNWMBp
         7yYdJDmPSmKO2oxgPhp3dFE5fySGAbr76ULeVwRhYR1nZj+Dt+7yMRqvyCy/awJlTCkG
         cM3at+AcGZOa5bk/dGCtZ7kySJVKl+8MlTVj2QRl/Dw/TEerUeIFb+Kb+Tg1XpiQiwIB
         tCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770153710; x=1770758510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tnx8rcvEvdkYGEIn2XQxOtCyxNvcOHGRSe6Kvp60kmU=;
        b=LwrmbJmf50/hBQLV/hV222yqu9xQ8yJNwkqkRr5J3k6LW5hv8f7J7AFcOPdUCFKSe4
         O0cIdNAw96lYfxfgcEPYuRcITvNgxCq/Z/4Gi+CEfme3IxekhFEN5GvAHW5ikAWv2I4P
         k0xpNXEWKeRT7oxyFqOcPwsgr90FCwIDkiElBdL8dRSZ79DX4iqT70HDLZ2FrtFakcXG
         J549Eq4PhAv2Fo/wxtjwmXQ0iaXV9NoAfVJrMqM3eR946uvQdjgjc9+AB/jaVAHcKmCM
         27bm+OhotrBxx8TcFbAx5Twwt62wZ6lSP9ozq2rcBt2Rtzvr4B+JMwLpVxKC9YpUlyQx
         NJyg==
X-Forwarded-Encrypted: i=1; AJvYcCUREXYWDV7YeMDLEE3zbROcLCNZZkbKPFDAi8uoNSaqhozc+EjDJAOx2apIe9NragM51U2Ho/AbQuA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpqCJ/GafdVJ0KbgTFf8Oa9+rNR3O/wMvKfpyLxVukiz5c7Bjr
	B7Ags4SgaWDEVN7YIXWYlZlsYrhopRfMTRciL/EK7TvEWUQ2EknLDy3l
X-Gm-Gg: AZuq6aIR3VeozcPvzq11TIsRroKlgdj9Ym/0hteSqcyWZNS3R31sfHymN6q1PPrahHo
	UMkioA48JJO3MKlYOCAgnBhFU13kZLHYrUD6ZVV6do7VPH2qADkpjWMcL6YlY0/Na+UwaRwirSs
	YeEJXon1iOXZPq7ANJMFeK6s9ReP3Bi6TK6xIRrWkXZiElb0FSS8TdmOA38iuRzshjsEwK1sWVV
	bK8I96dQmEuXK0160gNxxMtuZFgpNCruqt0K64hMl7H5T9sKhYxgwcjhWYOfPSjZf+ifrO2Gy+s
	D0X7OTTxFEFnXVVQx1HNbXKp63bp93Bb8Mk2BXPSio67X9U+wd2YzK5mgKmtnQPNLfKUyNQi5Ok
	m/FnXPh5dISj9uqWOcmqGkxR7tVaFcFyruH/8AitTQHx7gvwZ16RwrdG7izNtWMQt2YESUHwZpx
	F29J+tdvVL532WwwTQa8TVtv0YmU6QrEPjudPb
X-Received: by 2002:a05:6830:81e7:b0:7cf:d0f4:125c with SMTP id 46e09a7af769-7d448973feamr655978a34.8.1770153709895;
        Tue, 03 Feb 2026 13:21:49 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7d4490f35b7sm454939a34.1.2026.02.03.13.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 13:21:49 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH 26/60] dyndbg-API: promote DYNAMIC_DEBUG_CLASSMAP_PARAM to API
Date: Tue,  3 Feb 2026 14:19:53 -0700
Message-ID: <20260203212027.1130311-37-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260203212027.1130311-1-jim.cromie@gmail.com>
References: <20260203212027.1130311-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

move the DYNAMIC_DEBUG_CLASSMAP_PARAM macro from test-dynamic-debug.c into
the header, and refine it, by distinguishing the 2 use cases:

1.DYNAMIC_DEBUG_CLASSMAP_PARAM_REF
    for DRM, to pass in extern __drm_debug by name.
    dyndbg keeps bits in it, so drm can still use it as before

2.DYNAMIC_DEBUG_CLASSMAP_PARAM
    new user (test_dynamic_debug) doesn't need to share state,
    decls a static long unsigned int to store the bitvec.

__DYNAMIC_DEBUG_CLASSMAP_PARAM
   bottom layer - allocate,init a ddebug-class-param, module-param-cb.

Modify ddebug_sync_classbits() argtype deref inside the fn, to give
access to all kp members.

Also add stub macros, clean up and improve comments in test-code, and
add MODULE_DESCRIPTIONs.

cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h   | 40 ++++++++++++++++++++++
 lib/dynamic_debug.c             | 60 ++++++++++++++++++++++-----------
 lib/test_dynamic_debug.c        | 47 ++++++++++----------------
 lib/test_dynamic_debug_submod.c |  9 ++++-
 4 files changed, 106 insertions(+), 50 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index d3889173abf3..4c36c2a4801a 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -251,6 +251,44 @@ struct _ddebug_class_param {
 		.offset = _offset					\
 	}
 
+/**
+ * DYNAMIC_DEBUG_CLASSMAP_PARAM - control a ddebug-classmap from a sys-param
+ * @_name:  sysfs node name
+ * @_var:   name of the classmap var defining the controlled classes/bits
+ * @_flags: flags to be toggled, typically just 'p'
+ *
+ * Creates a sysfs-param to control the classes defined by the
+ * exported classmap, with bits 0..N-1 mapped to the classes named.
+ * This version keeps class-state in a private long int.
+ */
+#define DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _var, _flags)		\
+	static unsigned long _name##_bvec;				\
+	__DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _name##_bvec, _var, _flags)
+
+/**
+ * DYNAMIC_DEBUG_CLASSMAP_PARAM_REF - wrap a classmap with a controlling sys-param
+ * @_name:  sysfs node name
+ * @_bits:  name of the module's unsigned long bit-vector, ex: __drm_debug
+ * @_var:   name of the (exported) classmap var defining the classes/bits
+ * @_flags: flags to be toggled, typically just 'p'
+ *
+ * Creates a sysfs-param to control the classes defined by the
+ * exported clasmap, with bits 0..N-1 mapped to the classes named.
+ * This version keeps class-state in user @_bits.  This lets drm check
+ * __drm_debug elsewhere too.
+ */
+#define DYNAMIC_DEBUG_CLASSMAP_PARAM_REF(_name, _bits, _var, _flags)	\
+	__DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _bits, _var, _flags)
+
+#define __DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _bits, _var, _flags)	\
+	static struct _ddebug_class_param _name##_##_flags = {		\
+		.bits = &(_bits),					\
+		.flags = #_flags,					\
+		.map = &(_var),						\
+	};								\
+	module_param_cb(_name, &param_ops_dyndbg_classes,		\
+			&_name##_##_flags, 0600)
+
 extern __printf(2, 3)
 void __dynamic_pr_debug(struct _ddebug *descriptor, const char *fmt, ...);
 
@@ -433,6 +471,8 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 
 #define DYNAMIC_DEBUG_CLASSMAP_DEFINE(_var, _mapty, _base, ...)
 #define DYNAMIC_DEBUG_CLASSMAP_USE(_var)
+#define DYNAMIC_DEBUG_CLASSMAP_PARAM(_name, _var, _flags)
+#define DYNAMIC_DEBUG_CLASSMAP_PARAM_REF(_name, _var, _flags)
 #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)
 #define DYNAMIC_DEBUG_BRANCH(descriptor) false
 #define DECLARE_DYNDBG_CLASSMAP(...)
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index b59252e0665a..85fa031d8696 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -688,6 +688,30 @@ static int ddebug_apply_class_bitmap(const struct _ddebug_class_param *dcp,
 
 #define CLASSMAP_BITMASK(width) ((1UL << (width)) - 1)
 
+static void ddebug_class_param_clamp_input(unsigned long *inrep, const struct kernel_param *kp)
+{
+	const struct _ddebug_class_param *dcp = kp->arg;
+	const struct _ddebug_class_map *map = dcp->map;
+
+	switch (map->map_type) {
+	case DD_CLASS_TYPE_DISJOINT_BITS:
+		/* expect bits. mask and warn if too many */
+		if (*inrep & ~CLASSMAP_BITMASK(map->length)) {
+			pr_warn("%s: input: 0x%lx exceeds mask: 0x%lx, masking\n",
+				KP_NAME(kp), *inrep, CLASSMAP_BITMASK(map->length));
+			*inrep &= CLASSMAP_BITMASK(map->length);
+		}
+		break;
+	case DD_CLASS_TYPE_LEVEL_NUM:
+		/* input is bitpos, of highest verbosity to be enabled */
+		if (*inrep > map->length) {
+			pr_warn("%s: level:%ld exceeds max:%d, clamping\n",
+				KP_NAME(kp), *inrep, map->length);
+			*inrep = map->length;
+		}
+		break;
+	}
+}
 static int param_set_dyndbg_module_classes(const char *instr,
 					   const struct kernel_param *kp,
 					   const char *mod_name)
@@ -706,26 +730,15 @@ static int param_set_dyndbg_module_classes(const char *instr,
 		pr_err("expecting numeric input, not: %s > %s\n", instr, KP_NAME(kp));
 		return -EINVAL;
 	}
+	ddebug_class_param_clamp_input(&inrep, kp);
 
 	switch (map->map_type) {
 	case DD_CLASS_TYPE_DISJOINT_BITS:
-		/* expect bits. mask and warn if too many */
-		if (inrep & ~CLASSMAP_BITMASK(map->length)) {
-			pr_warn("%s: input: 0x%lx exceeds mask: 0x%lx, masking\n",
-				KP_NAME(kp), inrep, CLASSMAP_BITMASK(map->length));
-			inrep &= CLASSMAP_BITMASK(map->length);
-		}
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
 		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
-		/* input is bitpos, of highest verbosity to be enabled */
-		if (inrep > map->length) {
-			pr_warn("%s: level:%ld exceeds max:%d, clamping\n",
-				KP_NAME(kp), inrep, map->length);
-			inrep = map->length;
-		}
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
@@ -1196,15 +1209,24 @@ static const struct proc_ops proc_fops = {
 static void ddebug_sync_classbits(const struct kernel_param *kp, const char *modname)
 {
 	const struct _ddebug_class_param *dcp = kp->arg;
+	unsigned long new_bits;
 
-	/* clamp initial bitvec, mask off hi-bits */
-	if (*dcp->bits & ~CLASSMAP_BITMASK(dcp->map->length)) {
-		*dcp->bits &= CLASSMAP_BITMASK(dcp->map->length);
-		v2pr_info("preset classbits: %lx\n", *dcp->bits);
+	ddebug_class_param_clamp_input(dcp->bits, kp);
+
+	switch (dcp->map->map_type) {
+	case DD_CLASS_TYPE_DISJOINT_BITS:
+		v2pr_info("  %s: classbits: 0x%lx\n", KP_NAME(kp), *dcp->bits);
+		ddebug_apply_class_bitmap(dcp, dcp->bits, 0UL, modname);
+		break;
+	case DD_CLASS_TYPE_LEVEL_NUM:
+		new_bits = CLASSMAP_BITMASK(*dcp->lvl);
+		v2pr_info("  %s: lvl:%ld bits:0x%lx\n", KP_NAME(kp), *dcp->lvl, new_bits);
+		ddebug_apply_class_bitmap(dcp, &new_bits, 0UL, modname);
+		break;
+	default:
+		pr_err("bad map type %d\n", dcp->map->map_type);
+		return;
 	}
-	/* force class'd prdbgs (in USEr module) to match (DEFINEr module) class-param */
-	ddebug_apply_class_bitmap(dcp, dcp->bits, ~0, modname);
-	ddebug_apply_class_bitmap(dcp, dcp->bits, 0, modname);
 }
 
 static void ddebug_match_apply_kparam(const struct kernel_param *kp,
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index fa81177e8089..83c4d571a8c9 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Kernel module for testing dynamic_debug
+ * Kernel module to test/demonstrate dynamic_debug features,
+ * particularly classmaps and their support for subsystems like DRM.
  *
  * Authors:
  *      Jim Cromie	<jim.cromie@gmail.com>
@@ -57,24 +58,6 @@ module_param_cb(do_prints, &param_ops_do_prints, NULL, 0600);
 
 #define CLASSMAP_BITMASK(width, base) (((1UL << (width)) - 1) << (base))
 
-/* sysfs param wrapper, proto-API */
-#define DYNAMIC_DEBUG_CLASSMAP_PARAM_(_model, _flags, _init)		\
-	static unsigned long bits_##_model = _init;			\
-	static struct _ddebug_class_param _flags##_##_model = {		\
-		.bits = &bits_##_model,					\
-		.flags = #_flags,					\
-		.map = &map_##_model,					\
-	};								\
-	module_param_cb(_flags##_##_model, &param_ops_dyndbg_classes,	\
-			&_flags##_##_model, 0600)
-#ifdef DEBUG
-#define DYNAMIC_DEBUG_CLASSMAP_PARAM(_model, _flags)		\
-	DYNAMIC_DEBUG_CLASSMAP_PARAM_(_model, _flags, ~0)
-#else
-#define DYNAMIC_DEBUG_CLASSMAP_PARAM(_model, _flags)		\
-	DYNAMIC_DEBUG_CLASSMAP_PARAM_(_model, _flags, 0)
-#endif
-
 /*
  * Demonstrate/test DISJOINT & LEVEL typed classmaps with a sys-param.
  *
@@ -105,12 +88,15 @@ enum cat_disjoint_bits {
 /* numeric verbosity, V2 > V1 related.  V0 is > D2_DRMRES */
 enum cat_level_num { V0 = 16, V1, V2, V3, V4, V5, V6, V7 };
 
-/* recapitulate DRM's multi-classmap setup */
+/*
+ * use/demonstrate multi-module-group classmaps, as for DRM
+ */
 #if !defined(TEST_DYNAMIC_DEBUG_SUBMOD)
 /*
- * In single user, or parent / coordinator (drm.ko) modules, define
- * classmaps on the client enums above, and then declares the PARAMS
- * ref'g the classmaps.  Each is exported.
+ * For module-groups of 1+, define classmaps with names (stringified
+ * enum-symbols) copied from above. 1-to-1 mapping is recommended.
+ * The classmap is exported, so that other modules in the group can
+ * link to it and control their prdbgs.
  */
 DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_disjoint_bits, DD_CLASS_TYPE_DISJOINT_BITS,
 			      D2_CORE,
@@ -129,11 +115,13 @@ DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
 			      V0, "V0", "V1", "V2", "V3", "V4", "V5", "V6", "V7");
 
 /*
- * now add the sysfs-params
+ * for use-cases that want it, provide a sysfs-param to set the
+ * classes in the classmap.  It is at this interface where the
+ * "v3>v2" property is applied to DD_CLASS_TYPE_LEVEL_NUM inputs.
  */
 
-DYNAMIC_DEBUG_CLASSMAP_PARAM(disjoint_bits, p);
-DYNAMIC_DEBUG_CLASSMAP_PARAM(level_num, p);
+DYNAMIC_DEBUG_CLASSMAP_PARAM(p_disjoint_bits,	map_disjoint_bits, p);
+DYNAMIC_DEBUG_CLASSMAP_PARAM(p_level_num,	map_level_num, p);
 
 #ifdef FORCE_CLASSID_CONFLICT
 /*
@@ -144,12 +132,10 @@ DYNAMIC_DEBUG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE")
 #endif
 
 #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
-
 /*
- * in submod/drm-drivers, use the classmaps defined in top/parent
- * module above.
+ * the +1 members of a multi-module group refer to the classmap
+ * DEFINEd (and exported) above.
  */
-
 DYNAMIC_DEBUG_CLASSMAP_USE(map_disjoint_bits);
 DYNAMIC_DEBUG_CLASSMAP_USE(map_level_num);
 
@@ -224,6 +210,7 @@ static void __exit test_dynamic_debug_exit(void)
 module_init(test_dynamic_debug_init);
 module_exit(test_dynamic_debug_exit);
 
+MODULE_DESCRIPTION("test/demonstrate dynamic-debug features");
 MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
 MODULE_DESCRIPTION("Kernel module for testing dynamic_debug");
 MODULE_LICENSE("GPL");
diff --git a/lib/test_dynamic_debug_submod.c b/lib/test_dynamic_debug_submod.c
index 672aabf40160..3adf3925fb86 100644
--- a/lib/test_dynamic_debug_submod.c
+++ b/lib/test_dynamic_debug_submod.c
@@ -1,6 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Kernel module for testing dynamic_debug
+ * Kernel module to test/demonstrate dynamic_debug features,
+ * particularly classmaps and their support for subsystems, like DRM,
+ * which defines its drm_debug classmap in drm module, and uses it in
+ * helpers & drivers.
  *
  * Authors:
  *      Jim Cromie	<jim.cromie@gmail.com>
@@ -12,3 +15,7 @@
  */
 #define TEST_DYNAMIC_DEBUG_SUBMOD
 #include "test_dynamic_debug.c"
+
+MODULE_DESCRIPTION("test/demonstrate dynamic-debug subsystem support");
+MODULE_AUTHOR("Jim Cromie <jim.cromie@gmail.com>");
+MODULE_LICENSE("GPL");
-- 
2.52.0

