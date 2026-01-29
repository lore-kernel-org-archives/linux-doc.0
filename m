Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com [209.85.161.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897F337E304
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671909; cv=none; b=rmEqjjYdLd2LHOJyBduyoO7Y2i2uNtXWkLwxkYZxkRbgd1/OEu7Hdw6l76qKf1wOSdgffNlPJQ/GO+YkTs6jY6snkFSf31cdkPpj5bIet1bSVt7JYNpuw28PVslgKTCa0gRhL1EIO7LSPbkHMMkicWJ33aZbB3CGm6tO29bAsG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671909; c=relaxed/simple;
	bh=oPoNMSRIYjoVgxOqsTJZZH37SevBPXkc7c0ZXJJFMTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D+M5ij3IRLysZuzXkmHSKXnNFX2IayzBtYfq04m+mKnSw8TOosYIR7evxpmmF1FqOKm/x+gk7/Owkf82zlIohcx1f7k7lAwe1PrKX3hIwKkhwDTyZpkTBnydJcjuacwNAW19IKciJ+PaWaU4GzF2gLetXZZLwUEgDoy2r8GfCEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTox9qvL; arc=none smtp.client-ip=209.85.161.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTox9qvL"
Received: by mail-oo1-f66.google.com with SMTP id 006d021491bc7-66307e10d1dso260428eaf.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671906; x=1770276706; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xsJvAGVi9OUktE+8fXjWdBdWnD5PdumECdhR7oEDHI=;
        b=VTox9qvLvadJjLobuQbx4VbYxm742NT+f6mQhEjWdVS11/ai/HSaT5k91utkGPZlmD
         Nbk71CtYVR+Z2FIsCWYgIPHpEkx42AXrjarKOqwT+4KYKTAjs8n/5eAd0PplA33LzHnF
         wzDmrZT/3M/93fG3UyS3kKdDitPIhQJzUnJaTtcgvheverwRqRDu55rZLJIAgQwmv7FE
         x675QTazncJrliL0Kbt5gv12MoAArAW1ztcve56zlyeL+g75dXLGiG0+tAS1cO/O4G5N
         t42rTWjE+SWegjtJ08NUBmWu4z9wMuLFfN+AgLraD1rJVXjXJpNuTlC8PmhGLTCBAdLr
         9HXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671906; x=1770276706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3xsJvAGVi9OUktE+8fXjWdBdWnD5PdumECdhR7oEDHI=;
        b=wadJlcW8hb9W1Lrc8ClhD8nBSv1zINhFXoHq3d7eRosqUJdENpEkwG5tJzvW0C3AHz
         U5kZg9jzDQNPAGhIS2OxAPGJN4l7SOM+jTTLEqtHBtrs/rVXL771w9sydskbrfwOwyyh
         3M5TrsM8RmexKEFReNKuaeb1HTqu7AdYHdGhyrgoK8NWvRYzHWSCFK0YDU98CdktRVXZ
         Zj8Oy8hhiFzjIv6GcSFe6xlZNt/gh1bMJBR2fvu5+bYQcX+T6hC4WfWn2nqkGHmoZAvx
         In9pW0/JP7xqS6N9KzaR4H3aroKBJWyKdq4GfPsup+TBHDYHYoaX+znXjVJahTpbfHLx
         kHwg==
X-Forwarded-Encrypted: i=1; AJvYcCVF1vzx6mo6GOwWs4+I32rVOS25bo2IGm3Aheg6e6Lo3b8CkyXLj4SrlBGLU9cGpsvZyIfu0kaMjKI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5wmHjJd/WrKZHA/c2VlwFyavYMK+LKRNPADuaGCU+0Lq64dAc
	DbR3Yp6Ys8tHAREFTnLA+RPW9Drsv/3hje4/LJh7meTAZsetJLsO+d0o
X-Gm-Gg: AZuq6aKRks7ZU/dQlS6bb99s148Mwsja0/7R2OjwYyH8/rcF5iKL6/p0QPmnztlqsR1
	Om7N/4f5zmYF3fzPeDARCcum15RzLra9l/T8lVuvxmOc5Bk5xb16HMq2mDxNUioKVTHOTo235kf
	5kOUMHMV/JHT84Op5iz/6Pp6NZZFKuk72foVNtgGh6NZjalT1nPgtmmPwMr2Bk8NMDQKss/i02j
	RJ9896CVlstcR4BhpjdBqym1jwNee2HE5WBUbie4a67mijy5s0Y0oEo8Y5NDEUIOlOBqSanZYEz
	qE5GA1BDc0BPg5VbX0CQWRH31IDjQIxB4UTw6SsYNImpY48Hy+fsG9hHBQVKxU7lULJ2vfRGP30
	8sAwoxX2pAwKIL1sbC1Fvk0o+nYzRCCwfV3EvtH9onj6u4XYDujjpG+gCTyoKe/f1aIZlYFouYl
	LJCK9Y5bV0VhgA24gxlypb+HO9idkffwfORB2BEazDL6kRK2wp0VY=
X-Received: by 2002:a05:6820:1f07:b0:659:9a49:8f6b with SMTP id 006d021491bc7-662f20b02camr4543783eaf.48.1769671906381;
        Wed, 28 Jan 2026 23:31:46 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-662f982703fsm2843961eaf.0.2026.01.28.23.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:31:45 -0800 (PST)
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
	Jonathan Corbet <corbet@lwn.net>,
	Ye Bin <yebin10@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 32/32] docs/dyndbg: add classmap info to howto
Date: Thu, 29 Jan 2026 00:29:18 -0700
Message-ID: <20260129072932.2190803-33-jim.cromie@gmail.com>
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

Describe the 3 API macros providing dynamic_debug's classmaps

DYNAMIC_DEBUG_CLASSMAP_DEFINE - create & export a classmap
DYNAMIC_DEBUG_CLASSMAP_USE    - refer to exported map
DYNAMIC_DEBUG_CLASSMAP_PARAM  - bind control param to the classmap
DYNAMIC_DEBUG_CLASSMAP_PARAM_REF + use module's storage - __drm_debug

NB: The _DEFINE & _USE model makes the user dependent on the definer,
just like EXPORT_SYMBOL(__drm_debug) already does.

cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst       | 132 ++++++++++++++++--
 1 file changed, 122 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 0a42b9de55ac..734be0b5fe9a 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -146,6 +146,9 @@ keywords are::
   "1-30" is valid range but "1 - 30" is not.
 
 
+Keywords
+--------
+
 The meanings of each keyword are:
 
 func
@@ -194,16 +197,6 @@ format
 	format "nfsd: SETATTR"  // a neater way to match a format with whitespace
 	format 'nfsd: SETATTR'  // yet another way to match a format with whitespace
 
-class
-    The given class_name is validated against each module, which may
-    have declared a list of known class_names.  If the class_name is
-    found for a module, callsite & class matching and adjustment
-    proceeds.  Examples::
-
-	class DRM_UT_KMS	# a DRM.debug category
-	class JUNK		# silent non-match
-	// class TLD_*		# NOTICE: no wildcard in class names
-
 line
     The given line number or range of line numbers is compared
     against the line number of each ``pr_debug()`` callsite.  A single
@@ -218,6 +211,25 @@ line
 	line -1605          // the 1605 lines from line 1 to line 1605
 	line 1600-          // all lines from line 1600 to the end of the file
 
+class
+
+    The given class_name is validated against each module, which may
+    have declared a list of class_names it accepts.  If the class_name
+    accepted by a module, callsite & class matching and adjustment
+    proceeds.  Examples::
+
+	class DRM_UT_KMS	# a drm.debug category
+	class JUNK		# silent non-match
+	// class TLD_*		# NOTICE: no wildcard in class names
+
+.. note::
+
+    Unlike other keywords, classes are "name-to-change", not
+    "omitting-constraint-allows-change".  See Dynamic Debug Classmaps
+
+Flags
+-----
+
 The flags specification comprises a change operation followed
 by one or more flag characters.  The change operation is one
 of the characters::
@@ -239,6 +251,11 @@ The flags are::
   l    Include line number
   d    Include call trace
 
+.. note::
+
+   * To query without changing	``+_`` or ``-_``.
+   * To clear all flags		``=_`` or ``-fslmpt``.
+
 For ``print_hex_dump_debug()`` and ``print_hex_dump_bytes()``, only
 the ``p`` flag has meaning, other flags are ignored.
 
@@ -395,3 +412,98 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
 For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string is
 its ``prefix_str`` argument, if it is constant string; or ``hexdump``
 in case ``prefix_str`` is built dynamically.
+
+.. _dyndbg-classmaps:
+
+Dynamic Debug Classmaps
+=======================
+
+The "class" keyword selects prdbgs based on author supplied,
+domain-oriented names.  This complements the nested-scope keywords:
+module, file, function, line.
+
+The main difference from the others: classes must be named to be
+changed.  This protects them from unintended overwrite::
+
+  # IOW this cannot undo any drm.debug settings
+  :#> ddcmd -p
+
+This protection is needed; /sys/module/drm/parameters/debug is ABI.
+drm.debug is authoritative when dyndbg is not used, dyndbg-under-DRM
+is an implementation detail, and must not behave erratically, just
+because another admin fed >control something unrelated.
+
+So each class must be enabled individually (no wildcards)::
+
+  :#> ddcmd class DRM_UT_CORE +p
+  :#> ddcmd class DRM_UT_KMS +p
+  # or more selectively
+  :#> ddcmd class DRM_UT_CORE module drm +p
+
+That makes direct >control wordy and annoying, but it is a secondary
+interface; it is not intended to replace the ABI, just slide in
+underneath and reimplement the guaranteed behavior.  So DRM would keep
+using the convenient way, and be able to trust it::
+
+  :#> echo 0x1ff > /sys/module/drm/parameters/debug
+
+That said, since the sysfs/kparam is the ABI, if the author omits the
+CLASSMAP_PARAM, theres no ABI to guard, and he probably wants a less
+pedantic >control interface.  In this case, protection is dropped.
+
+Dynamic Debug Classmap API
+==========================
+
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(clname,type,_base,classnames) - this maps
+classnames (a list of strings) onto class-ids consecutively, starting
+at _base.
+
+DYNAMIC_DEBUG_CLASSMAP_USE(clname) & _USE_(clname,_base) - modules
+call this to refer to the var _DEFINEd elsewhere (and exported).
+
+DYNAMIC_DEBUG_CLASSMAP_PARAM(clname) - creates the sysfs/kparam,
+maps/exposes bits 0..N as class-names.
+
+Classmaps are opt-in: modules invoke _DEFINE or _USE to authorize
+dyndbg to update those named classes.  "class FOO" queries are
+validated against the classes defined or used by the module, this
+finds the classid to alter; classes are not directly selectable by
+their classid.
+
+Classnames are global in scope, so subsystems (module-groups) should
+prepend a subsystem name; unqualified names like "CORE" are discouraged.
+
+NB: It is an inherent API limitation (due to class_id's int type) that
+the following are possible:
+
+  // these errors should be caught in review
+  __pr_debug_cls(0, "fake DRM_UT_CORE msg");  // this works
+  __pr_debug_cls(62, "un-known classid msg"); // this compiles, does nothing
+
+There are 2 types of classmaps:
+
+* DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like drm.debug
+* DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
+
+DYNAMIC_DEBUG_CLASSMAP_PARAM - modelled after module_param_cb, it
+refers to a DEFINEd classmap, and associates it to the param's
+data-store.  This state is then applied to DEFINEr and USEr modules
+when they're modprobed.
+
+The PARAM interface also enforces the DD_CLASS_TYPE_LEVEL_NUM relation
+amongst the contained classnames; all classes are independent in the
+control parser itself.  There is no implied meaning in names like "V4"
+or "PL_ERROR" vs "PL_WARNING".
+
+Modules or subsystems (drm & drivers) can define multiple classmaps,
+as long as they (all the classmaps) share the limited 0..62
+per-module-group _class_id range, without overlap.
+
+If a module encounters a conflict between 2 classmaps it is _USEing or
+_DEFINEing, it can invoke the extended _USE_(name,_base) macro to
+de-conflict the respective ranges.
+
+``#define DEBUG`` will enable all pr_debugs in scope, including any
+class'd ones.  This won't be reflected in the PARAM readback value,
+but the class'd pr_debug callsites can be forced off by toggling the
+classmap-kparam all-on then all-off.
-- 
2.52.0

