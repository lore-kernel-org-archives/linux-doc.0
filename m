Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CE818A933
	for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 18:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729102461; cv=none; b=KSaaM3ueW5WGvbLZwrdJ/mWup7juS1D/LN4vUoh5HkstOuHu1Qtizp73JXpaBlG0KU35JYQwJcmH5b51eIjKIwyjZjOTSALWjqyiMbP5xnRkstifZQZT7khtrsN6mKoAAz82t0avKv3yy6hPYjxoRNoX6X+QdfnzNkmsjPmw95Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729102461; c=relaxed/simple;
	bh=YW99deD7/ol5oA2gYrqQtiLzp64B/5mbGCe6uO7Xvzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s2Ay/U4L7JBtZv6Hwq6mqhtZHv30P5kTj8W65IZIueZvvMyV/+GoC7r1j+fjaQ4J80WibH2jKU24A8Xh3BBoyFcddKItMiQtBtrHguK2AiOl1iSYqN/dmt7wEKNmP6Uvc/+Gn9ERi+JKqKyfMLOIuRQ57yigLTbalJzHl03CFLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BY5jb1SC; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BY5jb1SC"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-83aa3ced341so3506139f.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Oct 2024 11:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729102456; x=1729707256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMtDXM0LnjWug7j6LFf30Od5kznDt+8+RffK5lVMMlA=;
        b=BY5jb1SCHGOefW6JcXRyVtGvZ0zHoNXCka6+wtnINRY9vqcr/awiR20WMzLPutJaqZ
         WTaPrV/AAywFrvXFRWgME21TN6hnx6p9JZpmw7GLjJ1AgTRO2YBxoesiV3J8pW9QH/lL
         Afjx4pjcHZw7q6XRvFlY60wHyseIwEaVcHDuc3pwYnSzI5B3dhgnm8oH3HgT4736fD8f
         E0FmDVbFZcrPWBi4+JSvsPd7t+g+VAiv7sNsY1K3YWQ4RuQR1ok2rvaG29rSZ7x0gPmi
         WbRSkIG9dA2ZXXwpdiZKY2SfWJRwQociMEZOjK4QkqnYtTCLDdxSukxj10MSGfQ2FwOm
         RHwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729102456; x=1729707256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMtDXM0LnjWug7j6LFf30Od5kznDt+8+RffK5lVMMlA=;
        b=V1+nXUPxFRGTsqqCtOp52bo7n25Kbpb01f/l2HBmhhkseEUrB8uVYSk7T54dkXW/EI
         jm//A83UDDd0XLgZPVwmHM18TljELgGgFGrnT/fGwxbu0Ax0dpbW4UjNW4wpgjhMhqsA
         bqulHvGTxHT/RNjozsFIHzrKcPKODvYbQq1BjtM9k+XRVviOUsKeBTvfl3qe1rURR7lI
         gV4MI3zpAfTioCFrTRvxLPYBRwy8XUxL3nki+0VmJy51tAIOL6ulSmW9oFNLqTbcaE8o
         lo1aG/n95wrLZPlLowYYPEDDbsbSowDwDz3GeTXWy67uBySNzr0qeQ7UhXJCtpUVrNXb
         OaHw==
X-Forwarded-Encrypted: i=1; AJvYcCXp/MURH2LVsMXuXQlf6DY3NlNzoXAafVggiRHvZRKim9X6vamKVPbtfKJjHe2JgJjHEBWem8D7xsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZFKzDfqzwYalvlchsVH4XGJJh1ubl4L8tt2Nv2xaBawv0XBBS
	4GAP/3MYp3Q8FeRcBk7FucLnv2zGFoAiZGa4ZNIR23Gp6KtoiieJ
X-Google-Smtp-Source: AGHT+IG28iU/BsejFQHaHkinxQMC1KxrCnCnltoNG7uXrPkeKUKUvMPNWKE+K5sCuzboeLulVdSZFQ==
X-Received: by 2002:a05:6e02:3b0a:b0:3a1:a57a:40a1 with SMTP id e9e14a558f8ab-3a3b5f233a9mr174859475ab.5.1729102456508;
        Wed, 16 Oct 2024 11:14:16 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3a3d70cd21bsm9433695ab.45.2024.10.16.11.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 11:14:15 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: intel-gfx-trybot@lists.freedesktop.org
Cc: ukaszb@chromium.org,
	Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH 21/61] dyndbg-doc: add classmap info to howto
Date: Wed, 16 Oct 2024 12:13:04 -0600
Message-ID: <20241016181344.1161237-22-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241016181344.1161237-1-jim.cromie@gmail.com>
References: <20241016181344.1161237-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the 3 API macros providing dynamic_debug's classmaps

DYNDBG_CLASSMAP_DEFINE - create, exports a module's classmap
DYNDBG_CLASSMAP_USE    - refer to exported map
DYNDBG_CLASSMAP_PARAM  - bind control param to the classmap
DYNDBG_CLASSMAP_PARAM_REF + use module's storage - __drm_debug

cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v5 adjustments per Randy Dunlap
v7 checkpatch fixes
v8 more
---
 .../admin-guide/dynamic-debug-howto.rst       | 63 ++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 691e0f7d4de1..89d94aab41ec 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -230,7 +230,6 @@ the ``p`` flag has meaning, other flags are ignored.
 Note the regexp ``^[-+=][fslmpt_]+$`` matches a flags specification.
 To clear all flags at once, use ``=_`` or ``-fslmpt``.
 
-
 Debug messages during Boot Process
 ==================================
 
@@ -380,3 +379,65 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
 For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string is
 its ``prefix_str`` argument, if it is constant string; or ``hexdump``
 in case ``prefix_str`` is built dynamically.
+
+Dynamic Debug classmaps
+=======================
+
+Dyndbg allows selection/grouping of *prdbg* callsites using structural
+info: module, file, function, line.  Classmaps allow authors to add
+their own domain-oriented groupings using class-names.  Classmaps are
+exported, so they referencable from other modules.
+
+  # enable classes individually
+  :#> ddcmd class DRM_UT_CORE +p
+  :#> ddcmd class DRM_UT_KMS +p
+  # or more selectively
+  :#> ddcmd class DRM_UT_CORE module drm +p
+
+The "class FOO" syntax protects class'd prdbgs from generic overwrite::
+
+  # IOW this doesn't wipe any DRM.debug settings
+  :#> ddcmd -p
+
+To support the DRM.debug parameter, DYNDBG_CLASSMAP_PARAM* updates all
+classes in a classmap, mapping param-bits 0..N onto the classes:
+DRM_UT_<*> for the DRM use-case.
+
+Dynamic Debug Classmap API
+==========================
+
+DYNDBG_CLASSMAP_DEFINE - modules use this to create classmaps, naming
+each of the classes (stringified enum-symbols: "DRM_UT_<*>"), and
+type, and mapping the class-names to consecutive _class_ids.
+
+By doing so, modules tell dyndbg that they have prdbgs with those
+class_ids, and they authorize dyndbg to accept "class FOO" for the
+module defining the classmap, and its contained classnames.
+
+DYNDBG_CLASSMAP_USE - drm drivers invoke this to ref the CLASSMAP that
+drm DEFINEs.  This shares the classmap definition, and authorizes
+dyndbg to apply changes to the user module's class'd pr_debugs.  It
+also tells dyndbg how to initialize the user's prdbgs at modprobe,
+based upon the current setting of the parent's controlling param.
+
+There are 2 types of classmaps:
+
+ DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like DRM.debug
+ DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
+
+DYNDBG_CLASSMAP_PARAM - modelled after module_param_cb, it refers to a
+DEFINEd classmap, and associates it to the param's data-store.  This
+state is then applied to DEFINEr and USEr modules when they're modprobed.
+
+This interface also enforces the DD_CLASS_TYPE_LEVEL_NUM relation
+amongst the contained classnames; all classes are independent in the
+control parser itself.
+
+Modules or module-groups (drm & drivers) can define multiple
+classmaps, as long as they share the limited 0..62 per-module-group
+_class_id range, without overlap.
+
+``#define DEBUG`` will enable all pr_debugs in scope, including any
+class'd ones.  This won't be reflected in the PARAM readback value,
+but the class'd pr_debug callsites can be forced off by toggling the
+classmap-kparam all-on then all-off.
-- 
2.47.0

