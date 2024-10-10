Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCC63A1BF
	for <linux-doc@vger.kernel.org>; Thu, 10 Oct 2024 16:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728576931; cv=none; b=OGBX/VJdKezmru0ybldIWZ8Es4TNZFohNMi8ztpnjfKQfqi6KmVyIJZnKGMxnoJ2Wic7/5MumiUt4KNEwblZifXZalvyab3hKwbPkncfcAGJrymNAqfGU3vH5xYwN5CcmQODuRYHHki6VL1BAbjdemGpQrWZLV4VtL2923cilWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728576931; c=relaxed/simple;
	bh=Adk8M+H9AJEX8xAfFZdCw12+Qz/aalXWNoigR+EVa/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=esjtyzJ/NZ+H3h96gQ2JaYRHbx7hJfRqPKjL3Yf3FZErLzLAvYPUl/NIVVJDgJ0ZNNtpjDKuT1N1jGSxmV94wfzncjVAyQGplppS/zz1qtUDL//AxIRYUfisdxOy9qxnZttqc6mctgCHFhisYnFMdvtV7fjT6+A4G27Q7F5pJqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcTOSEsR; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcTOSEsR"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-835393376e1so60923939f.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Oct 2024 09:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728576929; x=1729181729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1yWDiVoLZbp10tEWDIrcXna+8SOkHiu54LGaS0lPr4=;
        b=QcTOSEsR26avyNONAf9r6xq96e10lRPbQz6y33oqt2EYD+zqCw4II7bJJluPqFH36C
         5gaAZlAkc6BGbUr9s+TaZLl1CnzOicC+8cwTzP6rReeIkc92PxHuMyiU6b7AzBLTHo/2
         x0PL622HQsDjkfSEhEhEgkq3YDav5bUjl3varFDO4xhVaMZcZFb2ZNYsWvqY1ui5Vz8+
         6BWgZQyClRCwsqbykTTICVUuvPdW2wqGbx2IbNQMTQOdz/bJo93Evdv2BLORxkQ0cvSH
         C4fFJsapArnRXIhjMxfORkjeqANSo+RuIar4K4Rv3bzAuCC5VQCefCxWeLUU430UG8oK
         Mhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728576929; x=1729181729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1yWDiVoLZbp10tEWDIrcXna+8SOkHiu54LGaS0lPr4=;
        b=hRbm+tkVPWPQ0cyv3DsbapFMX8gKN7Dk1BYQhq/3qAoxik/OvCDqFRS57vA3Lu6S+0
         2/LPxMZLie/3dIf8SpfgXSb1wqGCbIRFKFD2gWklNySDdzzfSorrDYEBG6O/eN3U3dwO
         6rU3qvsR+LDmum04/H11zZVXvbAacI1UPj+fVKcTzCHu0reK/rikvd39ndwg/YzjBBPH
         NUNzBaRAY8zhUJWTbNJJk2jm+/zfYDYP7Li6X8CuGrbjQWMz2MyYGnLIYqGLFsw3tyy7
         /QUyJpc1KpHFE2EDX2sbTEyqsISezlJfWV3ufgD+d/sWJNmfsB63jbsRPymJINAc0/Da
         wmaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlaEsyCmElbh0jXp8bS3c4xVzSnXsWgUIM5IYW+/pcHxeEVBGaq86Sv650Kd4WkdLVmhV4GjSw1bU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNMbeRlb6fz7tOXWyZh4rDxdZ9M05ZLcF4/z3iHoPpOpzMCUyW
	bL29tku3hqMBm27Dq8sF2f0xPoeEnPIuetQmaGn9Y805HIlVPiydKr163g==
X-Google-Smtp-Source: AGHT+IFE75cJBkX7+Ub9DKLNxQuqs9nmXHCBC56JKEAnZp6Nt950nWT6Q/O7rjT6RfLRKrlh0wyfqw==
X-Received: by 2002:a05:6602:14d1:b0:82c:e233:15bf with SMTP id ca18e2360f4ac-8353d4919b9mr697833539f.6.1728576929167;
        Thu, 10 Oct 2024 09:15:29 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4dbad9b10c3sm292460173.22.2024.10.10.09.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 09:15:28 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: intel-gfx-trybot@lists.freedesktop.org
Cc: ukaszb@chromium.org,
	Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH 21/61] dyndbg-doc: add classmap info to howto
Date: Thu, 10 Oct 2024 10:14:21 -0600
Message-ID: <20241010161501.109271-22-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241010161501.109271-1-jim.cromie@gmail.com>
References: <20241010161501.109271-1-jim.cromie@gmail.com>
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
2.46.2

