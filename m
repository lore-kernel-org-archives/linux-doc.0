Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDE13A79A2
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 20:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763497180; cv=none; b=UOawrRl1h0i/tRU7Dv9tG48tWCU1IL/wl3r2j+S5dA+wEuIp//KtTt1qwnJU7RsDuKkBrj7NE9prbOh+yuK7NS0UrHDpzq61iWPuyi31Vk1HWD7bCpC0vlFrQ6YPYA5/nfF22K4Htx7JtQLfzS/P6dlyrRahIeHjYkrnumlfBoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763497180; c=relaxed/simple;
	bh=O+tXmXknX0a9JEgbiNHhwp0EAjn+/AMT7eM05GGU3Pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OyaP5BeTlkbfoMvHcdDjXP0yBurNOelUrwMxHPvqClbhOHguB3jSanL9NXUsLtqlVFQb+O90TKYrDlaj7tbLnA4gC8ePZyyOMQamO6HaB6ONoKiKSRNXRPAs3J/duMd0OdyFTk9MgsVZ9DhDudsW90kqXi8xVUgh+qzj06fa6u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MI0dwqYM; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MI0dwqYM"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-433692bbe4fso26137545ab.0
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 12:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763497175; x=1764101975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6vnJl9LV7HlaaUH7ZnHOrsbcFGdoDkm0Y0taUKZPwI=;
        b=MI0dwqYMaPQR6sSosMKAqw7EIzS1/DMybrjq+IFvYnFr+jxBm8GdxSHZpcD8VmFnuY
         w0LjGPtQ62ut0gJdBakhk0feKBbtjeD+drnfGQEzTxb5yGL6rZ4b2EnNuUbi6VpZUMfZ
         RHLRlRnPsHBy5ObAZHrjmlHpjoI8UW/BGLiKLHKqGYdmVGnyiYQMbAXywOZ+VlhwqWdY
         Ip9VgHCZvd6XMZ1JOhRktpwyYUharbv/7BhJ90BW3ZeaVL2GEtDiEk3bovkTlITstH9y
         DxjQTDpC1ISPZFoBC26Zt2XKLWN+UqbVV0aZYqY9b2HyBLZ1wLgrGEehpLN2UkpkkQ6o
         V6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763497175; x=1764101975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f6vnJl9LV7HlaaUH7ZnHOrsbcFGdoDkm0Y0taUKZPwI=;
        b=o5br/EseJ5DBvieeqrYP197iuXIFZekEYldhe3xXdhslpidFaMkyiUrmH9n8Hl5ZFv
         7McQN4AYPEuNO65zoeOrjbONoH/X79HNA5bKOn1D4reHLgIkzLZ1dX+K6Dk1blA3mySQ
         sOKSzIyFZYSiw/v9wcAWIvBJl+rF3RjrOEJVd1paoaMDvHbRerq7rysIysQluYIpyVcP
         krrnfZsKVkMobZTwiScQYWcGW2uVCVB5TZoWbUvqO6TychkcKcMbWVcTklxpA6kQs8Ja
         aJM3k0o/WZ6tv0IghB32b3jFvRD4fmQq3ArRv68F/9RIuFy4127jWQRzVwXbOUP3o+H2
         ILeA==
X-Forwarded-Encrypted: i=1; AJvYcCUNC+eAJpS4yElKR10py8dU7XaNQgYmWv3Hs0WuZ21TSXvlvMcQYKkyIBoyqLgi12ReOldr9OHpDWk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKONtZJv4tRL0NhsJfIocW63FV3WE1UvQGcsHC0dw8rsVBCPYq
	lKgWQBFNJZ2B/UGTwbxGlZ68snZshpDSI4jXlpTZWg+kRp2a/0sehsNq
X-Gm-Gg: ASbGncsgbG/ya8K/TDm7i+2L7l/WSNw9zR9d+dUrdAq8/OVwWiiYPmoqNURN+iwlcUM
	lg7kdJLheQGkLtTzQbE3olepI+Ye2kLSjY/swV0ybfajwVgtg1kbox9VnK1OZo/1R/SY8Spp30D
	xiv+Zfvk9dY6rrviSEvAAOdJXzdxPvuUTawdRmSN9h2gwJPETDGrAeBCp7ZjL0nEGho0xYz3Svk
	+i6V86bDCp4NPphEG+8m1aZZbPrDlI3jgPT23BsUFoVFaPCMcTm53QglDWXLXVNAZj53PKFj2eY
	XIWH6BN9TUzQANIy1GimAn8jE6w8B0OuSKCyotmfZpKTN+rz7xtU5ex66NbUgE/RHohVnkpjM7J
	fFIPxEMqljCq2N3waFkMDcsJ8Btuyuwmg8E+MPra0HEDK0dGyPazHHRBh2YfsKfyWvFD01glUP/
	/eNQP3oavaUxLGAJUje8X0FRSULQBRrZlVoJe/Ofsa0ddbpItf2aeiZP0Sco/ZgSPDRSsMqTDIW
	mN7Jg==
X-Google-Smtp-Source: AGHT+IFhMgxL8xO7QXjyxKhciV5i56lPkCw/9yrS08t5Daw42RmTXFSJThazbTqGeULpmbYf4wiCjA==
X-Received: by 2002:a05:6e02:96f:b0:434:a7ce:da4a with SMTP id e9e14a558f8ab-434a7de20damr88076485ab.30.1763497175351;
        Tue, 18 Nov 2025 12:19:35 -0800 (PST)
Received: from godzilla.raven-morpho.ts.net (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id ca18e2360f4ac-948fd4c273bsm419823939f.18.2025.11.18.12.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 12:19:34 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	gregkh@linuxfoundation.org,
	jbaron@akamai.com
Cc: ukaszb@chromium.org,
	louis.chauvet@bootlin.com,
	Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH v6 31/31] docs/dyndbg: add classmap info to howto
Date: Tue, 18 Nov 2025 13:18:41 -0700
Message-ID: <20251118201842.1447666-32-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251118201842.1447666-1-jim.cromie@gmail.com>
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
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
2.51.1

