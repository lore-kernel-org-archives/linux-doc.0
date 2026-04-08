Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5194E3A8744
	for <linux-doc@vger.kernel.org>; Wed,  8 Apr 2026 20:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775678573; cv=none; b=BU0g7gYnIDJRtFYwR86d1FvOCTg3hSiw9fERWy41XTz6xjHNFDz/er+l6fP6TZKOfAvt9lHac08hYR0cpGkQSVOXducBpaGRisuKdcGrbVRVZajbcJncfIgqZKK5eD11a0lOcbqqROKNmzBiAstHls9n+SgKm11w4A3nEB2CUOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775678573; c=relaxed/simple;
	bh=ftTpVckDB1Ntqu89+1elJ8nn6xn5PfMnDJrkqsIjPtg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hjMpKTgcG472TBGVfX51c/48p3+Pef3Tk9LA7ZHEDWtYOSmTlGMGAjqzyb8yGnFuMt8C1ocbyVRYNxU86c1jPcMfCz1vc7wmzH/8ws5YTLAlocJ7hpi7YWZVV+dVR3IFKLmqeIGXXmuDClClo2fUGTcDkB399WsksFcEiiBbDW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RY/J5xAZ; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RY/J5xAZ"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7dbd08144deso120368a34.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Apr 2026 13:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775678570; x=1776283370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Fn+1VGRF0lzR7vhJfSVcQCaTLdIbHbYdKyEKI0VCCs=;
        b=RY/J5xAZotuQwD25pFXBuzmUdc6aGA3qkVT9z+E3ke+xhkSUBPcQFgw8mfIAwrjyDv
         W7zSYAcq5JDkJ0omlWqcKLiOg8kJq9n+ga/xVuXAsSSpuOi42BF7OYXWMtFtBtRI/O9P
         LxScPIxCT/Nh+eAqTZGU+r+afABAVAZ6BZH0mx2o1MbaVqvpINEMg9L9gOrGAY6q7qj9
         PADYGejSvikD24PICU61Cr1ewpK8LVFY0goOSk/l82czxIBmT7x0d9IzsIdHPjTHW/t4
         70bOTVG7MShyBKBnRMMC3BwxHUCmjljNL+J59/D7AQMvS8BUuLhnCGoIAi6M/rlccf/w
         Wlvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775678570; x=1776283370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Fn+1VGRF0lzR7vhJfSVcQCaTLdIbHbYdKyEKI0VCCs=;
        b=BC3zDh2CIUvdg40iWQXoBLDgs4BLOSTyhmvo03KXvF9XMH5Rzo/xhu27nkJSimNjmD
         6XgJqUvSMx8iLFoqMHDKnx5qozV07bT3QAhkF911xkIXI2O6MsLl2n3YuF27GXV+u9W9
         5W1MQO8UgsX2BRW9WzV9679zv7rvxt6Q6eU8YiVK9Cz0Zhrqm0aRetApN3ItyosB/61B
         jzx9H+RYDCP7ooLvBB7EEgqGpcCLk9uX6TYummDmesC1TjWcDUbJpfxb8fRmEAdMbJli
         Lvfch4p9DxOHSlYyN8z3o0TnicCAz/GlQapfMcbmMoAqxWc26VYvAnXFkM2fMfDFUiK6
         +qtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM8QlH1akHnx4RMF/8jMhscRiWMBgRceX2HlNHJHC2qAjFDj911eDSKLVS2Z+yR516/YpdC67MmmE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1dV74epAlUUdtMTPl+2nUTTdgCyfr9+s9RhNTmrFcu5XG5nNG
	4Xeb1zTzABzKFEf3ASE/t3vEnH9MkapFpUkXcIajEXQXK+RANoP25sz0
X-Gm-Gg: AeBDiesFZhsioJkf4sC/p9zHrurt+JuhZg3VpgAv/GNKqo9ydKiaoy1QXCf2s8ohKZE
	TZBYrkGBX/f0yk8XzGjnWBZZe7HWR7CcQsQ8mwXj1gfYfbvvtblJk7BpcvdESellMwxIDqthWd2
	uiDkILS8FpmXoi5AwqvVn8Bw9NeuKLBgeoFBeCo2/zsN0PzF5UXgxuOE+2pZvbdULimskKzNpMm
	l/c3vZfZ7C1Xm9tFXXiukemafDBuzUvK/4uWgJlD9F6ZM3DsGbHnS9kOcSqB972NP4xbOHDduMI
	pW/M/p/ada/B1unq992atrDM2gcMhyzYI14MLxLiUkKtpHbuF1wSAeRKzXxi+rLE7RBe72wGKTh
	PlEe8NilZQ1csC0EnaBBJXQef2VazYm79HhgpDs5LkA0DUErZT1T/2NGNjdVvUWlMsUOepUzmbX
	x7DrUjoMQWSK6RlJlrzaq7aQMcAZVYgUIn7DG2t9d1VVHml98DZ6CWhcE3qriddw1MOB3GmgTWx
	rM=
X-Received: by 2002:a05:6820:604:b0:68a:1ed1:206d with SMTP id 006d021491bc7-68a1ee07119mr945464eaf.6.1775678570033;
        Wed, 08 Apr 2026 13:02:50 -0700 (PDT)
Received: from frodo.raven-morpho.ts.net (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-680a63c7fd1sm12254208eaf.8.2026.04.08.13.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 13:02:49 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jbaron@akamai.com,
	louis.chauvet@bootlin.com,
	Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH v13 35/36] docs/dyndbg: add classmap info to howto
Date: Wed,  8 Apr 2026 14:02:10 -0600
Message-ID: <20260408200211.43821-36-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260408200211.43821-1-jim.cromie@gmail.com>
References: <20260408200211.43821-1-jim.cromie@gmail.com>
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

