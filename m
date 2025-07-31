Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873CE26A1B8
	for <linux-doc@vger.kernel.org>; Thu, 31 Jul 2025 21:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753997889; cv=none; b=CjcygtQvdUVogShtJ/yh/59hiMMkTXI62zO3MsCmC/5MiuorARMa2XZeyJwr2LdTL73DRXDLP8CAS0KNKUeuYrpcBe+K551QcHcUGNgVFfIVdAPy1Wlo0krLwwCUf4T7NDTNC6gRqqa+Zj5nwlrtRu4HW0VOszxoTZE6o1K4Ltg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753997889; c=relaxed/simple;
	bh=hfhdyPgNPmI59nT/uW5MmPjomrGBwFDKj1cx3ofW7kI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E7oE/CQafEXGqDRDTJW9pt78+Co3sjfG3n9qCb9PO/UrEnhVIFtSvaFxleiHV3hFYR3/lQUSnwOsZELUSKyNH2YLeawp7DQiCZMCUkBWnkiEy147BdE81I7oi0cW04kt8bKX5AZl2y5aD3Qimble/9j9X2is4zxEmYw0bOICcHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IqAW0GJY; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqAW0GJY"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3e40050551bso5830215ab.2
        for <linux-doc@vger.kernel.org>; Thu, 31 Jul 2025 14:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753997886; x=1754602686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HeJcBthhmF2i0ZuBLswvHjerHxMSPDvK/fXonxnOFN8=;
        b=IqAW0GJYYlFBY7np+yIMaGUX27aeZLmzLNaLcqdI6/CjQYp+Jq3OfE2uqV4b9+Q6GK
         3uqlLHzZPKHRKBoOBDiY4yT9i6CR/u9yWOQajn9j0dYb8v7izhOMgjHPXKGem4r+ZeiD
         ojBZonXGFHMJI6lGwOAk46C2en/PL2fhQatyjBzJRyWuKncmKKsmkSis/IjegYbZNkFS
         WGKzajS2R7XjQGW1FgVbPmweNP/vuAySQSxs5JE30nQlJucEpEsJSj2RWmJRXN6d1TXk
         QRviZdo73OYkYrqC5tR/pC3bW8xdP0kWA0/slq79/tZ4Df8wbzh0c/FQI+/rwOXI2IeX
         L2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753997886; x=1754602686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HeJcBthhmF2i0ZuBLswvHjerHxMSPDvK/fXonxnOFN8=;
        b=Itas7DVJzz2L7aVHxOjr8lPaxvphz29r0c/DEBOZgIWgLCvfj8UiegvFaWsFuCVZQn
         oFB7pmpRd4dL8Jjnff/PipT4slSQzjNo2XsndDSavEjBmdGO/n5mK8kYJEV2eUiDaRKB
         SYZ9nSVWNs8gfNKuAzUekJ82V4omogucst279uCOP84WZS0PmYIxQBjswH8nwN3Ljud/
         kfddPYw+kveeWhHmSW2qqWnQ1FN6sjCryXcmCzJmmDDMZyX05AccQVF8IW/E7g1UDe+S
         JPFlSJy2St13+1EIgU3GklpedxtQCGIhxwmQBEW5n6C806YVEpr8hvXbHK1hLNS9R+uR
         H5eA==
X-Forwarded-Encrypted: i=1; AJvYcCW9PrSj4j2wUzgwdOFxv84GT92re7VZwYfsofvcVPpx6ZAbdz8L0VSCGoQZY0uDoIaLHZw9qnJH+RE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyxYrzHKiP7Uv95dQO+3TfCY5WVXIdVZz5b+hgkTN0SIpwzDOg
	7T3dbIvYnjWEKJUf54CU/Q9bTi5Li3Kycb3e3MnfrvVH5NhlX9qHOFc9tvsetQ==
X-Gm-Gg: ASbGnctfhKadX+tNYb8qI1LmjbUbhvp8IKJxGaqCA9xpAyAg8zo4dq+tOP5dhAHiKF+
	sjNfnFJ2dN1f7ZhC3tsaZx0ZB6hLPSbsXLnmGrNJLnHOZBO2i9sf5HiSJQ9LepHbBsdrxro7a/p
	7uDTjiDi4E4yHSC3le5j9EMteKWLE5xejx5RW+e4f5BUDhJqypqy5gGJdQ3Yq51ZGpRMeTPNfU5
	HsMPleK1KDCenRRsmAKQSdlIE7DXAoS3lyAU8oiCFBQpMzGrqLK/xIWPhFSn+QzX5LXp0RvC7yM
	BTzI3ebrb/tlHEVTCA8RvygAGfWiStUngswFA+cwCYsEt2Qr3NU/KqwP2TRjrLqXCAjv0AWNhnY
	9sWoCKo2pzwzg2aoUUVO6Wn9P6PRAzYhoJs4RRMckG/1rzDAD3t91kmNsmJvzj1MvTI50k1Ayy4
	+CFQ==
X-Google-Smtp-Source: AGHT+IHa9nvRB22pIZfE9a1+wN+d1AtTmRGpSCI7ijMuUFAGvx2afVtCp4NDD47+wFObNJYLSZjWug==
X-Received: by 2002:a05:6e02:b2c:b0:3e4:b85:3cd4 with SMTP id e9e14a558f8ab-3e40d737027mr6383505ab.14.1753997885531;
        Thu, 31 Jul 2025 14:38:05 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3e402b148f3sm9904835ab.50.2025.07.31.14.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 14:38:05 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: 
Cc: Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH v4 29/56] docs/dyndbg: add classmap info to howto
Date: Thu, 31 Jul 2025 15:36:54 -0600
Message-ID: <20250731213721.26548-30-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250731213721.26548-1-jim.cromie@gmail.com>
References: <20250731213721.26548-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the 3 API macros providing dynamic_debug's classmaps

DYNDBG_CLASSMAP_DEFINE - create & export a classmap
DYNDBG_CLASSMAP_USE    - refer to exported map
DYNDBG_CLASSMAP_PARAM  - bind control param to the classmap
DYNDBG_CLASSMAP_PARAM_REF + use module's storage - __drm_debug

TBD: some of this might be over-specification, or just over-talked.

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
 .../admin-guide/dynamic-debug-howto.rst       | 137 ++++++++++++++++--
 1 file changed, 126 insertions(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 1ceadf4f28f9f..556e00299ed35 100644
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
+	class DRM_UT_KMS	# a DRM.debug category
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
@@ -394,3 +404,108 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
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
+changed.  This protects them from generic overwrite:
+
+  # IOW this cannot undo any DRM.debug settings
+  :#> ddcmd -p
+
+This protection is needed; /sys/module/drm/parameters/debug is ABI.
+DRM.debug is authoritative when dyndbg is not used, dyndbg's PARAM
+cannot undermine that guarantee just because its optional for DRM to
+use it.
+
+  :#> echo 0x1ff > /sys/module/drm/parameters/debug
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
+underneath and reimplement it.
+
+However, since the sysfs/kparam is the ABI, if a classmap DEFINEr
+doesn't also add a _CLASSMAP_PARAM, there is no ABI, and no protection
+is needed.  In that case, class'd prdbgs would be enabled/disabled by
+legacy (class-less) queries, as a convenience, and because there's no
+need to enforce irrelevant rules.
+
+
+Dynamic Debug Classmap API
+==========================
+
+DRM.debug is built upon:
+
+- enum drm_debug_category: DRM_UT_<*> - <T> for short
+- 23 categorized api macros: drm_dbg_<T>(), DRM_DEBUG_<T>()
+- 5000 calls to them
+- all calling to __pr_debug_cls(<T>, ...)
+
+Those compile-time const short ints are good for optimizing compilers;
+a primary classmaps design goal was to keep that property.
+So basically .class_id === category.
+
+Then we use the drm_categories DRM_UT_* enum for both the classnames
+(stringified enum symbols) and their numeric values.
+
+Its expected that future users will also use categorized macros and an
+enum-defined categorization scheme like DRM's, with dyndbg inserted in
+similarly.
+
+DYNAMIC_DEBUG_CLASSMAP_DEFINE(var,type,_base,classnames) - this maps
+classnames (a list of strings) onto class-ids consecutively, starting
+at _base, it also maps the names onto CLASSMAP_PARAM bits 0..N.
+
+DYNAMIC_DEBUG_CLASSMAP_USE(var) - modules call this to refer to the
+var _DEFINEd elsewhere (and exported).
+
+Classmaps are opt-in: modules invoke _DEFINE or _USE to authorize
+dyndbg to update those classes.  "class FOO" queries are validated
+against the classes, this finds the classid to alter; classes are not
+directly selectable by their classid.
+
+NB: It is an inherent API limitation that the following are possible:
+
+  // these would be caught in review
+  __pr_debug_cls(0, "fake DRM_UT_CORE msg");  // this works
+  __pr_debug_cls(62, "un-known classid msg"); // this compiles, does nothing
+
+There are 2 types of classmaps:
+
+ DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like DRM.debug
+ DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
+
+DYNAMIC_DEBUG_CLASSMAP_PARAM - modelled after module_param_cb, it
+refers to a DEFINEd classmap, and associates it to the param's
+data-store.  This state is then applied to DEFINEr and USEr modules
+when they're modprobed.
+
+The PARAM interface also enforces the DD_CLASS_TYPE_LEVEL_NUM relation
+amongst the contained classnames; all classes are independent in the
+control parser itself; there is no implied meaning in names like "V4".
+
+Modules or module-groups (drm & drivers) can define multiple
+classmaps, as long as they (all the classmaps) share the limited 0..62
+per-module-group _class_id range, without overlap.
+
+If a module encounters a conflict between 2 classmaps its USEing, we
+can extend the _USE macro with an offset to allow de-conflicting the
+respective ranges.  Or they use the DEFINErs macro-api, but with new
+enum symbols.
+
+``#define DEBUG`` will enable all pr_debugs in scope, including any
+class'd ones.  This won't be reflected in the PARAM readback value,
+but the class'd pr_debug callsites can be forced off by toggling the
+classmap-kparam all-on then all-off.
-- 
2.50.1

