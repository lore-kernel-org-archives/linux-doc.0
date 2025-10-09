Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5622472BA
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 17:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760032762; cv=none; b=VuumpRjSD05AG6/POEHi/6YWVtUnvY/vWi3hUbkp0oBOeHA4BWGT4xvoAsO/n4iC7CHdsChFrZCdouDqTqcm9eW1vRt+J81xERUWstYDdlWXTqXt/oOYISxg5LYkS83mKUA7d95mlhFlS/RPINfYlzqycnVym80x3AcURffXX2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760032762; c=relaxed/simple;
	bh=SAMH6bX/vL3va8sFv4toy+dDvica3sbvYihqhhgIHr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t2EB30y2jRj3NgZp2aog1C+9veYaQMs3vnNTnuG6K2Pn6AijVdf14cRI++lnXoh6+A2zXnjdrqpPH7d+7+vAzTtRIhk3mPZzou1Oyl8MQeA59Lp5xmtOlyKybjvJBz4dZhMTz3aaCzRnJ789ECdEJdGZe09on4xcLaTheputOeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/aecxGj; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/aecxGj"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-42e726431bdso6886855ab.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 10:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760032760; x=1760637560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3z8Tk8lrK8AXvTeNfDXtN9XLGvTU1P/hpcdsNXRN/Q=;
        b=D/aecxGje3VE6vLulOW8FRoB61YSczaqiMpCQI8RiIe0h1bcAHAnFyCeO958rJt1bu
         lJ5FrlTNaT8HAYNXWf5QF2oUPMRJl+NdQ6anuq1nu+QgCkvGARGZd1ifAQu/SCzjOZ30
         mMeADlpfFxXrAy2fi6i0rFcvjKsFHOv+ftVex8yPrzJ5USrE7s9OLyvQn9Nh1MAXo033
         mwoNupIWnsFft7R/tL76iuQZLuEiTOX5mz6B1y3kR2+wJTHI8C1e9cqHGvaGMx+fSfZb
         XX4w2hkRTDJqcGPXFtv9K3blX0xUHmR+A42TpCGQ+6Sm6wD/g3rf1L8y+6wrR9pmfaGn
         hoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760032760; x=1760637560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3z8Tk8lrK8AXvTeNfDXtN9XLGvTU1P/hpcdsNXRN/Q=;
        b=vO8hOZe3YEPQICuN7YmwRFbjqAHAmO4xAibkNa1WXDohqJApYsQvNEeucZQemZ9Eu/
         NGiqfwaCpJ28vOzWQaUnr2Xh0QeHO8D3SkPUKYskwe4/aGnVv127Gft8Y766ENUHmlQN
         lJPCKDbCsLP0/xqc6yETs07LhfgpXr6fHal+/+/YImL0jI5j77trznbPDdZtlOUrZLCt
         KL7kqZv0xk5zCY6EARghaSNFsmqvybxKwCF+B/rEw8TWpKxZLdHzeKdQj7zN5hv/WmOU
         UTmMaXMsi/j8T2sZZ5Nr2dJY1SbIy6Df3NNfJQYFgseoDYuDSu7+ngWzNrnnXWzsLjNt
         jzKw==
X-Forwarded-Encrypted: i=1; AJvYcCWrN/JhUs2dMP4sRghSeFZC4+BWM/cSOTFDWBKioHTR4HZLy+R65b+mk/WlWu7ojbOkMRyjyTPi2Eo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWYPoH1baxJ9xnTenyaWGtRE84xmTZjotPp9WBFquec9BIpEcj
	E6CkblCZ7sN6VmT3RHaLIpkMCPkGk9GGA1BzMSJCUMo9FD7zru2lyVR0
X-Gm-Gg: ASbGncujo2ys5VY/qrS6S+fdToM7oeNaTpJwKMayF25E0g/CW0IYYtOUCuKItSVsadp
	S7ymbEB0FRzIOzl5WrELI2oPWCSfmugox2UygpNGx4VpHpTXDHu0iAoVabvLtBFGEidNJc5KUAy
	VDz0aIEA83+47NA4JvKPY8/VHzW3U58TW4LqXCxTl+ndF4IJCh5Mfg6DJc/hdlKLAZIc8iNWQLl
	8Y/LXcmAVq3V0I4M8ZQVKB9FST7Ocr26yiDJ6XJ3Er/p8VqbbcI/BySHBy/WebCBXA7/rT6/o9H
	saFIOdiFQHXXughYOOVf35ZZ0M5zEnqkqZkYzqzGIXE/nS04DdRs+GFpm+AVf0weFR/ptifIyB3
	Ww2lD5yL5/nvddQ7OiF3LzywcCZ2N5/g9V0XKquZjIs1TyMbNP6P1ggI6c9Eo/QZpyq6lvpfqwV
	47g7RedYA3WCmYYuNMkvAaqAQGj8M=
X-Google-Smtp-Source: AGHT+IFR+shW7+C0q+f1Fmrt23B3YTQHyjOfr3zpgzC23vGg6C8CMdPg7iTrZ94nDfkkiwmOyi5W4Q==
X-Received: by 2002:a05:6e02:4405:20b0:42f:9888:48f1 with SMTP id e9e14a558f8ab-42f98884980mr10397445ab.1.1760032759717;
        Thu, 09 Oct 2025 10:59:19 -0700 (PDT)
Received: from godzilla.raven-morpho.ts.net (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-58f7200c4afsm30256173.35.2025.10.09.10.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 10:59:19 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com
Cc: gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH v5 30/30] docs/dyndbg: add classmap info to howto
Date: Thu,  9 Oct 2025 11:58:34 -0600
Message-ID: <20251009175834.1024308-31-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009175834.1024308-1-jim.cromie@gmail.com>
References: <20251009175834.1024308-1-jim.cromie@gmail.com>
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

