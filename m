Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABC42DCF61
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 21:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770153721; cv=none; b=bGPRPVzTFRZJouilhD+WwGWbGTmJPbDE2uplIQ6VQQn7CLjxSE3Dp3QhwaEKsZUnjS2S95QIjQLQcz8iDeBFQZojVBdQEmeATAx70vd70hmpBg6ORn7CE/3+zpGBkwZ1/OySl++kdP5Dspb3rqlCSpJw7Jva1yPSrbpMCxuZNzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770153721; c=relaxed/simple;
	bh=oPoNMSRIYjoVgxOqsTJZZH37SevBPXkc7c0ZXJJFMTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dkvbf3YUtsjLQcBNTByMEAh3KgZC42TfVyEm+AbyzcbRSPVbteI9cV+Dkpj5w4ayhcdfGe6aULHsF2pOIB38H5oIrfs/7wlwOXqfZI0YUeaS8maCxzc7qLBRhXVjpdvSB06eaw4cVsS8mK1qaP5pH5IcdffYrAZdVi1hxP1ZF68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bRuco/Lm; arc=none smtp.client-ip=209.85.210.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRuco/Lm"
Received: by mail-ot1-f66.google.com with SMTP id 46e09a7af769-7d15b8feca3so5721411a34.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Feb 2026 13:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770153719; x=1770758519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3xsJvAGVi9OUktE+8fXjWdBdWnD5PdumECdhR7oEDHI=;
        b=bRuco/LmDNMGGUED/iCozA/u2twcl/Zr5WoYuZUkHp9Mhg5Lz2Q+9uV6ZDdWxkc06X
         caf0Wjspj3ICtrl7aPxPNY4gT9/n43MHv5RUrpI56oO5uL/GUSwud2Rz8WNif15o6fmQ
         xnW2k+R+m1YrsMaDnWyX/9diCTfIeSJJ5TM+FnDX8zL8OmMuqiu4aoTPD0WWpwg5/8iD
         MVqrbBO9q64vjWqzncIWjuJe8r2KWtqZaMhNC00kSflhFkBzg5BX/1QFs5qRMTEKZTEp
         Jtsz91mdYmtn/dFtyrBaL+N869aPn6F4wTWspWjaG79mjF1wTXBjygY7DGm4l20oQhlL
         7oDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770153719; x=1770758519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3xsJvAGVi9OUktE+8fXjWdBdWnD5PdumECdhR7oEDHI=;
        b=C+oD4zHM7+zRoy6/JvhVCIMiftPl6JH79ivKd7BrYpM0q1fMJiJepQMqjvcFVDyDm6
         4SZN13NyDRC+qXwPavZvK4ux/OuX+jzlfrX0a1e6AiNcKdA18Dm377zRCa1pMa0H2ptl
         A204V0JOcieZ6zFlxJjn27grs5XOx7TgWbszEhPDrnA64qhzmzyTG61Ed7GHjChZdQoI
         dDHSoNzeiO/gjwMtJKGDLc1Mk163T6cCMDWXnWO18VoeOS3s71DaFRlf7io3fy8k7qTM
         JJ6CzJHqkaJ/OYcdCCSUJOJfkFYkkMuu8htMt7Q/jp9ueyXpz6pvcos/ycIvrPVdYLlI
         bbvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNkhrwr2M+nFnN9tJmSIt3855iLABHnGTihwJGhof7Uc/aIPlHvKSvBZ2jKw7w8Hvk7oPKJyjCpv8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd2hWjUS9WaRppoad5wYY6XCahrokClS19lBmlFpgbaYr9eSW7
	148kkKQqsf49fhilR8n0FYEkTVkI5+kFexanoMKJMUbg2qYq8Up72H/fiXdEBQVq
X-Gm-Gg: AZuq6aKRtCbBHLhMG9NdqXwbBxx0WH/4LIebxIGvfM8I4Gz7pwO7gGTQrhMQMlm58tN
	DfA3XeYQ1XK2V0yE20jgwZG9CwH/jMbvTYlfAgZ44RemiC5GBRQUPGw1CJLyd6k23uE68eMw3fQ
	Iai99BvNn9QEBYcCgbkrYAUP7EFlUenuo/mMZQbO7nKrrockFXUVrs1v5NZTe8G0L/akALKTrie
	ZJONaPsSbwpb7QFKqOO31YBAkLwJ1/mhWgDkwHlszv0Q104tCFkapgVG6C++GZ1+w4Vdqc2TQC5
	b1BV5PZKzcvn8B8F9Pf8gQ8y2fkzbtIZ3IuJKLS0CykYD07ddyAG5dxw5iPviUsyhpvJ1XVlLll
	+oHH13izf8GG/1ZMRdJDTRxaBogZvY0mta8UVbPUcntkRYNQd7Oi1qWFQniXV3BMAJDk/B86DI/
	pMSM/xSgFJYwxe35trSb5xfKdi/i0Bp2rIufMbSROtW5LVaI8=
X-Received: by 2002:a05:6830:6012:b0:7cf:e4e6:2d42 with SMTP id 46e09a7af769-7d44899f658mr716178a34.8.1770153718724;
        Tue, 03 Feb 2026 13:21:58 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7d4490f35b7sm454939a34.1.2026.02.03.13.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 13:21:57 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH 32/60] docs/dyndbg: add classmap info to howto
Date: Tue,  3 Feb 2026 14:19:59 -0700
Message-ID: <20260203212027.1130311-43-jim.cromie@gmail.com>
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

