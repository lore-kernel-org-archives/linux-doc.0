Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D319310651
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 02:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768356054; cv=none; b=r4XIUC7smTbvJs99R+EaQuAPK74hZvVr5GDNGoIH+AM2l78KUZCMi4tOtv1qPrvsEaeKmu/4DYequQprnwctEs+mgvW/khenXpJRa2FH5tGZoMQMmkauaRUUf2hyDi9aL1ope5O+yNCmiNOEbiMiSEdEF6vsOtoEUR6eUkzv8vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768356054; c=relaxed/simple;
	bh=AK/bnfFexI75Q/0N26IRCouQSTxRNRsO2xPVvCV9E/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S6JtJi8dPv7bfxJdq9Ou6GKaqN+RYLM4fa/043/XNuHJUsAxo2U/s3a/a65SOOVqoY5/lyLoReIFMsGDjdSnskx51qaqWIca7Abp1kk3BKANygPh1SOhxWsryqAWc8y7hnT3DfDoqx4udJvdm/2ladHgxdRNGJe2gQrKbDS10QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hldCFLT8; arc=none smtp.client-ip=209.85.167.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hldCFLT8"
Received: by mail-oi1-f194.google.com with SMTP id 5614622812f47-45a85a05a70so1872810b6e.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 18:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768356050; x=1768960850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ABMBtHazCQPbXZPvqunvxRiAtO4J7KVdTol8wYfw0Q=;
        b=hldCFLT8KzxtynNWBK/wQ+/YnhPqHjO8UK/oC1gQT4Bsm3OOI2QSKiHP/SvMWreZAl
         lflyNM1yquI7Nznkv49GoXPfZzMFmelN+ei1dUqzam8Kl57yoJZH+x/MECbFBeAv7zwu
         3mob23YaLWjHVIEBObe+dtuweg12d55OlRYUzPufbkTVN1c92TImyF1S+Eb9Mjnl2wQ4
         izQP2ovGGrsKrws5w/GlqUf1a2ldJXpTc75l7yUGrhd08UTFI7mw7EY4h/7Aj0XG2EHk
         c6d7ZYcNfo6PtfQVZLrFzdc6v+i85w606EjZkffvTaToo+FSChd9Rnwr4KdeAzzCtfgt
         4Ltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768356050; x=1768960850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/ABMBtHazCQPbXZPvqunvxRiAtO4J7KVdTol8wYfw0Q=;
        b=pRlqOXPhWyaZWFvwSv476nzSclaWMJf74HdLVJzS/n4gNseZ5L3SXrOtVC1jhGvRE2
         6UnQHHEaV06GUkNfQw+1t6zEZThqkGGGnj+5h2ftdLF9sptZoEZA9HdqM8SZX0GqqJwB
         E7kLOGLTCnN6CArFh194ooykQqkHWpQT8pbe0kKvmRBPMyI9m4ULI73SlMSV86XqCFbr
         uGciOvOf1jel+3NOrtFdeZ7GJhtE9FrT1VqDFRyCPRnQFoX1pmIpfFHKfwJSCu+c+XLU
         4Zd6oyJmQBoWsSYye1bglZVtY/jMQzjsg9MqNPHM9lefgV/nTRPasEcMgn6+ahTzOEyW
         2UiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9Zv0EO4ysGHi2dinB7Lky0X3vAj0oXZvtFiFhDur9z8GEd775DtUsKEzXQ2rG7B/ID/L+P+nq4SU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy5DcymgkRcHx2CdURILh34N5tl6tvCt9g/JrwLcftAnP5MhsG
	g5moVX7SxuI4A+2aij3PJ9XpWPNeT4SpMBRHnD2Rb9Jxt0jWiz0SdaPw
X-Gm-Gg: AY/fxX4BgI/z0T5S6Al1WoxYvOO4yJqiiVdvqA5hyo6KPhA+op2pEDgvFhuOEaqPiKW
	nCQ470E/liPhLkWezTbmFKvB//APrVLb/W2Q/TxtGYi8YY5c6C/ysnisLf0OxK4Dcuh7Uztm0Xx
	xgZ5w2SilkZZAD6+JXwyd3cHTG79yGCWSbQq83JfU3QrFKct0fWSLi78zWA11d/Z4I5ih2lb5Un
	buuZLYIX7mgevxlW7RULU0DaYfn7LLjaAr0/11HMR4SrsC15sAL1cFc5XDtsv+GfnY/fpeuUSkK
	yV6v3vdyhoTFUk3wSzMJ3fmK5j+uFqit3PhXm+kovuvxe71sRdlA8vK6iEjFN6xw/seRDP1c4Rx
	M04OZ09+pdIfbxf3giXgfOYwDRWhkBEbpXSV4Sag/IgRwBwsT3EuLYtnwSQ7PrTi0/bSSTkDe2F
	IJ0+Gr4zqCob5mCIoP5N/VPO9jyhldH8izElNy
X-Received: by 2002:a05:6808:c16c:b0:44f:6e2a:ace with SMTP id 5614622812f47-45c73e33e0amr394064b6e.52.1768356050518;
        Tue, 13 Jan 2026 18:00:50 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-45a5e183ac3sm10223525b6e.4.2026.01.13.18.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 18:00:50 -0800 (PST)
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
Subject: [PATCH v8 31/31] docs/dyndbg: add classmap info to howto
Date: Tue, 13 Jan 2026 18:57:47 -0700
Message-ID: <20260114015815.1565725-32-jim.cromie@gmail.com>
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
 .../admin-guide/dynamic-debug-howto.rst       | 135 ++++++++++++++++--
 1 file changed, 123 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 89ee15d7ae58..c85266ee8eed 100644
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
@@ -238,11 +250,15 @@ The flags are::
   s    Include the source file name
   l    Include line number
 
+.. note::
+
+   * To query without changing	``+_`` or ``-_``.
+   * To clear all flags		``=_`` or ``-fslmpt``.
+
 For ``print_hex_dump_debug()`` and ``print_hex_dump_bytes()``, only
 the ``p`` flag has meaning, other flags are ignored.
 
-Note the regexp ``^[-+=][fslmpt_]+$`` matches a flags specification.
-To clear all flags at once, use ``=_`` or ``-fslmpt``.
+The regexp ``^[-+=][fslmpt_]+$`` matches a flags specification.
 
 
 Debug messages during Boot Process
@@ -394,3 +410,98 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
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

