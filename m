Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081D025A2CF
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 23:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759879704; cv=none; b=h9ZpIfKDLlEA1OcCMMcKcrt7gMfim/L5eI4Y/a7OCplQa3tG6gpLZh41TK0DcPCEd5li31itOC29YNxVgvKSsQ+av8IW2cJQkTQ5bdPdCwWQGID60Y8cgwClE4E+hqGX6RycN1ltWkaBpGfofPhC6+D2p9GLTsYHvMuNGAcSyYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759879704; c=relaxed/simple;
	bh=SAMH6bX/vL3va8sFv4toy+dDvica3sbvYihqhhgIHr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mpIkJ7OdWbDj53IXm05ceBBsPBIaSjCZXXFcR82NzWavQQJB0kLG/Jc2HT7y8NS9rwRQmW+JW8dsqvSPJRwIsZ12l2ZaiBl3Ra9PUOmCZXAlEEK7Jds5lNtjtWGld08Q2epuX6RBz8IfWjT5swhat7qeQwxXwWu2j0kWvzZhE0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9rPqNWj; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9rPqNWj"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-42f7b17f9f7so19168475ab.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 16:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759879701; x=1760484501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3z8Tk8lrK8AXvTeNfDXtN9XLGvTU1P/hpcdsNXRN/Q=;
        b=k9rPqNWj+uTJOFgPrPQVEGA1no1mSu4MpQgz9bUUbiGfKdJLJcbDRr/OkgwcPpLiIf
         9b2xrFTMzYGC4gdU0fYCqaVnzA1VTN4RUUIisY5WmXN32Edf+S9dRHXsD0EgSyMYF3Jy
         OHlThCSlGFwwjr5B3o85Lm4/gM7dw1nc+10XYoMBMx5O3B0R5XbBEc1wHgFaz/JYNmn0
         FAVIYbHVDrRfRXWfvoZY0EidP8BTv7htUR+O/FqHegPVJE5QkuU5IZoLiB7FSIPFbySd
         SxqUemYv3O3o4bymhx7ak38cWVOb9CMKY1CjDbxfIg2FIT/8PczXA3co+HhVsv158TSS
         JBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759879701; x=1760484501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3z8Tk8lrK8AXvTeNfDXtN9XLGvTU1P/hpcdsNXRN/Q=;
        b=hITCyw9FIVRTidRouleaq0DiMzlNB4IuoLWaLLOPxUNhFy8y0UBygG9aP/i4X3enfR
         NSfZo/Hw6zkCG3jIfC2q1wcMN9fxjFuSSzqocHrnD8LKrRN9geRTXce+bEyElGoHf+EN
         0M9G9HApjuZDlP3AK3Qu2yU1g6DoLPI/i0Tpk+HGkQK52FAoOaoVyY8ChKV2QWkSRGaE
         rSR8rolHZ+ExSpLRJr2nT87aGkiwLAlPUrEhyJAx+ks0+kzbyBjQCA0qwnHhIuWCY6Yu
         WUgwiR/PeZeLP0YE6WfT6XLnWoKZwATk+4dRmhZyDO+Pz3C0vn72gEQ9Zq+QsbSbBfrX
         Cpkw==
X-Forwarded-Encrypted: i=1; AJvYcCUrJS1Z9wEJJLpZFYdawF96DnafkyM//jnXaVmj4V0IfPr9qqVRn7dR0xTftUUMcyQDqY9f5EOtVN0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw387JpMAr3Fx4ixEdO0GQ2nSAqWiCNOl3JUFzSexdhMxVQk0DS
	xpHIykjBA5yXqaskXGEUh6YPeqLnhJRJDBsi4tGVSbpxbVY9Zd16dwIp
X-Gm-Gg: ASbGncufESUApAdOboaXwYYbRultbQDFCYvtg3RmJ0OaoTyHA3mT/+1f2s6WbdF6QTU
	axM14agtPfW0dUePKB4Q+U8CeMkPdxeFWNROh1+JGa7NBwyaMoqAjgvMQQO/vI66TF7DxMGsxSr
	bMtJ9kEwS5svgJpMvumsJV19h7QkWtSibqthXXf4GVePojqi5O3huOpnZ7N6whfX4rkx4ME46Zf
	Bzp9uBc4k23oVF31DCCpBBiBVi0QwVjhfDiSvubFpgTvCGcRlU9dpty+POtrB+N3dhkHJTlMYwk
	hKiSnOwFwbHIIAdHsBMkZgXs21VWNwTQTnTucAbJwGTXn7ZNQiTQt0VVUecY8WMCis8JcJ6QJ/4
	yiIT7J6ROZE9eV6UizJkXI2qwHBvOo6wMTNKWJf35YjgNQhhSxn7/EU2u6jDxQmH3L/DswzBmrd
	FNJWrG8sXWBXxkIEm9Uy57QHZtBmg=
X-Google-Smtp-Source: AGHT+IHXsS0cvQB5HqTtJUSKlO9FLvcsbRbym/bCKqCmxf+g1vprjD++L1T0E9eWi75YQl/b26JQpw==
X-Received: by 2002:a05:6e02:214a:b0:418:3b13:d810 with SMTP id e9e14a558f8ab-42f87369997mr12348665ab.9.1759879700851;
        Tue, 07 Oct 2025 16:28:20 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net (c-73-14-87-86.hsd1.co.comcast.net. [73.14.87.86])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-57b5ea31448sm6582069173.29.2025.10.07.16.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 16:28:20 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH 30/57] docs/dyndbg: add classmap info to howto
Date: Tue,  7 Oct 2025 17:27:15 -0600
Message-ID: <20251007232742.886062-30-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251007232742.886062-1-jim.cromie@gmail.com>
References: <20251007232742.886062-1-jim.cromie@gmail.com>
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
v3- rework protection around PARAM

v0.5 adjustments per Randy Dunlap
v0.7 checkpatch fixes
v0.8 more
v0.9 rewords

fixup-howto
---
 .../admin-guide/dynamic-debug-howto.rst       | 129 ++++++++++++++++--
 1 file changed, 116 insertions(+), 13 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 1ceadf4f28f9..adac32a5cd23 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -146,7 +146,9 @@ keywords are:::
   "1-30" is valid range but "1 - 30" is not.
 
 
-The meanings of each keyword are:
+Keywords:::
+
+The meanings of each keyword are::
 
 func
     The given string is compared against the function name
@@ -194,16 +196,6 @@ format
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
@@ -218,6 +210,24 @@ line
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
+.. note ::
+
+    Unlike other keywords, classes are "name-to-change", not
+    "omitting-constraint-allows-change".  See Dynamic Debug Classmaps
+
+Flags:::
+
 The flags specification comprises a change operation followed
 by one or more flag characters.  The change operation is one
 of the characters::
@@ -238,11 +248,15 @@ The flags are::
   s    Include the source file name
   l    Include line number
 
+Notes:
+
+To query without changing	``+_`` or ``-_``.
+To clear all flags		``=_`` or ``-fslmpt``.
+
 For ``print_hex_dump_debug()`` and ``print_hex_dump_bytes()``, only
 the ``p`` flag has meaning, other flags are ignored.
 
-Note the regexp ``^[-+=][fslmpt_]+$`` matches a flags specification.
-To clear all flags at once, use ``=_`` or ``-fslmpt``.
+The regexp ``^[-+=][fslmpt_]+$`` matches a flags specification.
 
 
 Debug messages during Boot Process
@@ -394,3 +408,92 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
 For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string is
 its ``prefix_str`` argument, if it is constant string; or ``hexdump``
 in case ``prefix_str`` is built dynamically.
+
+Dynamic Debug Classmaps
+=======================
+
+The "class" keyword selects prdbgs based on author supplied,
+domain-oriented names.  This complements the nested-scope keywords:
+module, file, function, line.
+
+The main difference from the others: classes must be named to be
+changed.  This protects them from unintended overwrite:
+
+  # IOW this cannot undo any drm.debug settings
+  :#> ddcmd -p
+
+This protection is needed; /sys/module/drm/parameters/debug is ABI.
+drm.debug is authoritative when dyndbg is not used, dyndbg-under-DRM
+is an implementation detail, and must not behave erratically, just
+because another admin fed >control something unrelated.
+
+So each class must be enabled individually (no wildcards):
+
+  :#> ddcmd class DRM_UT_CORE +p
+  :#> ddcmd class DRM_UT_KMS +p
+  # or more selectively
+  :#> ddcmd class DRM_UT_CORE module drm +p
+
+That makes direct >control wordy and annoying, but it is a secondary
+interface; it is not intended to replace the ABI, just slide in
+underneath and reimplement the guaranteed behavior.  So DRM would keep
+using the convenient way, and be able to trust it.
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
+dyndbg to update those classes.  "class FOO" queries are validated
+against the classes, this finds the classid to alter; classes are not
+directly selectable by their classid.
+
+NB: It is an inherent API limitation (due to int class_id defn) that
+the following are possible:
+
+  // these errors should be caught in review
+  __pr_debug_cls(0, "fake DRM_UT_CORE msg");  // this works
+  __pr_debug_cls(62, "un-known classid msg"); // this compiles, does nothing
+
+There are 2 types of classmaps:
+
+ DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like drm.debug
+ DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
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
+Modules or module-groups (drm & drivers) can define multiple
+classmaps, as long as they (all the classmaps) share the limited 0..62
+per-module-group _class_id range, without overlap.
+
+If a module encounters a conflict between 2 classmaps its _USEing or
+_DEFINEing, it can invoke the extended _USE_(name,_base) macro to
+de-conflict the respective ranges.
+
+``#define DEBUG`` will enable all pr_debugs in scope, including any
+class'd ones.  This won't be reflected in the PARAM readback value,
+but the class'd pr_debug callsites can be forced off by toggling the
+classmap-kparam all-on then all-off.
-- 
2.51.0

