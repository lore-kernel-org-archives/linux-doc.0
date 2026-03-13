Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904363A6B88
	for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 13:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773408251; cv=none; b=h6d2GjcwAV1X3nBJonmmeCoJxPDO7+85kQcw76Buz5B7WcSj+qb6M+So63s6bhzq7Sjk8nAHa5xSZbjPoYG7Fect//wpVdL5fw7U0MFKg1tIsGAPiWq2MPNizDX05mcjem2poD0PKYaqs3ldYjZ6IuWxiHoj8QO4OK6T3WXYh78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773408251; c=relaxed/simple;
	bh=1+Gk1wrp2G7JsJ3mKRZOtQ8q8HMv75sNbrro9fnWjmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CK5n/ZFT06rEdbZddHm89OFqrLIi87dCDNRCJuMF9F7nEQzP776FYdnl8nIGyUXZFqdQ06bQQSjtVXdxGbA62B2WEMs2MjJfD5/qPKY1thORI9MZbciDqj4Qs5UgTxzJ0btRQkIXJYwuNdJcziBbEcMVeDjyCLb3xnH0/m6x4VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WBEeMtlW; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WBEeMtlW"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4670676ba03so829737b6e.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 06:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773408248; x=1774013048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMVfUVm5fgbPd/qSnAtgDoNjTpRp4guFY8KxOPZIX64=;
        b=WBEeMtlW6oVP7uLVtM3LYdSMwfXKvnr0Ya4E3FBVOLAZLilc34sF5XAr+TvgN2BWNX
         K7d9Amo76f8BTD7NzHFFm3yoUO3HSnnymphEHS1LFlejkhVCG4Gf0fCmmLik/qwNHtG3
         OwZ4fE1el/TDoolAWsMTYPu7Pp3KAiJRmG596K4TYPbTrb25vPAv14YsCbpYPl7m7ovD
         z0rVOTsEjtMF2D35/0xjJQJSrQD1NumxMtvkrfQHl4cMeZecv9k/2hy+7B7NXciRqR3p
         fuxhwV9E5UslXz4ZjBiRnE0YHt9XCgz5bCZ+aV4IQVnZAj/a5wQySXZSV/R48GTy25En
         cA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773408248; x=1774013048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZMVfUVm5fgbPd/qSnAtgDoNjTpRp4guFY8KxOPZIX64=;
        b=o+m3zydxMSf1lGKvfvpMLyxUk1GuNOd5Gfxw82yt13/huOYMJmr/D/J73Z0ngu9x0N
         MOVCLUfJs3ZlIitaaHrT2cTIFlzkldW6ZmhKLg7LXFnsDAI6UwowrfbC7MOW88DGCONK
         fy2jF4w7N8Mj83TCKrKs7h3FSBchFHYcQQC/cX9SGlsjYs1mN1QCDFLXSEJJXVe/i/t7
         ASK5TXyflY9o0Vmd3o80sO+2KSF+0xzRE2c+47E4SrJ8Kwxn1z+/m6/tuayEsBWfi2rD
         J4UZTsDtKNa0bh1BGnFbourUqs3gh4SqjK8rLmYzKjeJr378hVNje7VoOs5A6+8qcArv
         apxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzz4K0dsTaistUt3yGfvtZ6Pk/EBx6vxjfPjaAi3hMiUuJz/LoD7FLhOMastgO69NkqziXZY1/BVI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWSVOKH+zhcVysVcIHSMmINVuDdWourABFa5nSFirBS8EjByfh
	Z5c+RUveZHMzwmpEuuURBnhV89HWz/MBHHgp8gOzdVxZfEF42R1j5ymQ
X-Gm-Gg: ATEYQzwmnCiNm/A4jDZhtSxhckxd+sE7WG1lC98U7+uYa4FaBXMKuiDkFGS0nUl3jMg
	NqXMaFZRr1VH0jMJJzkWqX06LT08i0jrYCBZW8+CgcPdsxts8RAnT0/CH4Nq7+3WvAAzJg5RGkw
	/aWmpryOJgEQehbyit/ViO7f+bKdgiPgU+ByojdmqNnQjotVBINGt3H45eVSvyuaYLpuFUb3ELV
	BjYlwznWzjCmcoDr1sLyiAeLRVxOXNCPBAglYTYTDq9KonAPRuoYoZNkoTLozboFZ44/fE8J5b0
	x3IYFAMs9dNsePe6yBy6dasa8B95iGCtXwWfeX83+nWVLpTixIyg6BLyQC5g3zRVCAXWhgiYF4p
	PLzMgn4+rX7d2Ak2JpQwSFZxYwLWjw+Q06cgpBTXEAoacmPfJatfpx5VAvb6Y5vvqscT9gIxe/v
	kCKN5RAyE3ynap7z/WZRpVgwphklMXgq6W9qYAYBymHjNuXnbTqBHm8YWCjYA=
X-Received: by 2002:a05:6808:152b:b0:467:2926:1228 with SMTP id 5614622812f47-467575e9301mr1863785b6e.49.1773408248504;
        Fri, 13 Mar 2026 06:24:08 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-4673434a35csm4795987b6e.20.2026.03.13.06.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:24:08 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	mripard@kernel.org,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	christian.koenig@amd.com,
	matthew.auld@intel.com,
	arunpravin.paneerselvam@amd.com,
	louis.chauvet@bootlin.com,
	pmladek@suse.com,
	ukaszb@chromium.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH v11 33/65] docs/dyndbg: add classmap info to howto
Date: Fri, 13 Mar 2026 07:19:58 -0600
Message-ID: <20260313132103.2529746-34-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313132103.2529746-1-jim.cromie@gmail.com>
References: <20260313132103.2529746-1-jim.cromie@gmail.com>
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
2.53.0

