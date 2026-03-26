Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2E042668D
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 18:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774551325; cv=none; b=VVMsn2Xj7pxqXP44z1JpSdr0Efw6DMuQzl9IwoZ182QVMSqkkdBmMakSePkWFl6LunBF1pG7AGqVX/A5H6k1tNaVInPfa8XmMW8WSDoz2nR2FaDMozKDUb6EeuhQI3k2XEPiBXjtY1Fv1OYVFD5ak1+pRpOYkLYtJDOr5+FPnWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774551325; c=relaxed/simple;
	bh=ftTpVckDB1Ntqu89+1elJ8nn6xn5PfMnDJrkqsIjPtg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M9/oWSCq+QoS0Siou6H74oIPXIWOOA/N2MGKGD+g87x5Oqcm/E19ViQKAaStz3pNsrbtdFyiXSBysBIH/8O/YaE2Ova1CRWSRJvH39GddvfkJG6TLWToNRX4QOeYBOb3tMOWeaeUyJd7Espkska7xQlIuuV8Q0XvZrKnjkH7Y2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tNrrickZ; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tNrrickZ"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4042fe53946so520318fac.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 11:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774551322; x=1775156122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Fn+1VGRF0lzR7vhJfSVcQCaTLdIbHbYdKyEKI0VCCs=;
        b=tNrrickZnDQHlB+6XBWrAuuHxEVlUasxGPz03ryAjzpJd7N8YhClVp2RhO//YDpKPH
         JHW2ykcfUVhaY8zA8uS0xU5QPe2SoPHtHa0Uc/GVq72dNnDH17WI5ofbPV/uKp0e7s5P
         5UcWBUfy4MFd0fWy25sMA2wX966ne7TXGJf5aBEBStr5sAJxK6PCl14uNd4FATLNRfHH
         M/KJ8RqsVhCRIYxwkyDJiE6873RrdVEablBrmhjpFI/XcdsHCfRP0InAldY77DEE7hut
         ViRP7n1kjBN/n1s6jtEJ/oUXy72hjhP1JSyrC/Rn5gVcHlsrJqRlMSfy1Tl3ruK7RmNo
         Y/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774551322; x=1775156122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Fn+1VGRF0lzR7vhJfSVcQCaTLdIbHbYdKyEKI0VCCs=;
        b=ZWOwbHhU4u9cH3tb24lABBpQTt7VFQ/IS1PquqSkfoekYu6uxW8EKkftnfacbXPP1E
         Wvo9z6IuHyjZVJf27pvspfNVKW93nFMlQ6V/So2O9vMEuzvhHVBf4viZ2EQ1Jr4A+cUe
         r+CLd4MjHmmzrMbn7BzPZRv62QZRI/v2NPcquejoDgIKHEygsmobews7Y9qHK+oYzkOR
         uKG7cU+gsu/0Nmao0XpodxWpyTq8hgqQGjYrYEceluNzkJVlFzMMWBCB/S/nkt6TIHVy
         GT75b/5USVRHs+QMw5XKSNi3D7ZWWqd8/hYbn4SXhldJBl1FPuOM6WYDJnvVMRSbv7t/
         e6zg==
X-Forwarded-Encrypted: i=1; AJvYcCV0Du7CtKKdidubRDP0w2Zpa9tii9gDmFBMYymVWoZI8hLh6z27xKuQmVWbJt2HDrC0x2KqatyORxU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl1Ln6YF6U4ZbL63jVOaCMLXasj9PP9cAeLNs7nidrI+02V9Og
	PA2Ed5D0a399C/jHGi3jTY9BzbUYcjj9veXBKAYh04902B073Aut+uCN
X-Gm-Gg: ATEYQzyuvvDQhH03ZX/STxazBhkYtt1kG7502I7ZAXZ95fyHPioglEdqlM7/WTLSLdd
	fDkNV3Hvz8tgoMJCsLK0Bx8wbICt3bBptrYdC7OYKvg0dSkbAT5vm6D5dJyeNRDLbtAcFDIurD7
	8FofbMzWMuAlCkRJcLk4NPVl6S75/ZaskaqdE9TdE08RtTqdlNYJnLbPz+gqeJErtGkXLTDxKzx
	A0iRdIFE//sMbEbTlONFio5tm25lGP6VwVgDqb6OJYqwRkA9g+1XvB3tGXuRmP5Vure6VKUSlcP
	GRaXlBLPc3zGSm+uyJdS03ZskphI8dokmOP3OZH9SgsBMijtKpUeleFNxLSQFMYjCA1jj1JWNvh
	9ZidQqGxdwuezK/EuTDxDZuttmrh7mo3qRwVXGMyo0A/eKFo1U+2WyqALKT5wKdwY/kgBI0bXpZ
	p4tShJgteRjnVv+Cl+MhOpvny5IPtOMhDlRTSfuibu+9qzMRT4hrDDnDomVdA=
X-Received: by 2002:a05:6870:26c:b0:404:1c81:596e with SMTP id 586e51a60fabf-41ca6dc8e73mr4730077fac.12.1774551322184;
        Thu, 26 Mar 2026 11:55:22 -0700 (PDT)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-41cc7760c08sm3075171fac.4.2026.03.26.11.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:55:21 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org
Cc: jim.cromie@gmail.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	christian.koenig@amd.com,
	matthew.auld@intel.com,
	arunpravin.paneerselvam@amd.com,
	louis.chauvet@bootlin.com,
	skhan@linuxfoundation.org,
	pmladek@suse.com,
	ukaszb@chromium.org,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v12 35/69] docs/dyndbg: add classmap info to howto
Date: Thu, 26 Mar 2026 12:53:39 -0600
Message-ID: <20260326185413.1205870-36-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326185413.1205870-1-jim.cromie@gmail.com>
References: <20260326185413.1205870-1-jim.cromie@gmail.com>
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
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
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

