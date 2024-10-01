Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5787A199FA2
	for <linux-doc@vger.kernel.org>; Tue,  1 Oct 2024 19:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727811341; cv=none; b=CRw3ZrnW+V15KpttgHaWXLZTXvmrH0SSaFmbL9WKl8ntcKxAgbgKQGaRNib85oYrOYfEEUk7vueAMaz71Gi/4UfTwALBPCvawarkD7xMEXcfMZB4foR96ehJex44UB4btVmuafy6ZWJVexy+Xx/j8hAr1f33no6k29DGXUJ9fYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727811341; c=relaxed/simple;
	bh=Adk8M+H9AJEX8xAfFZdCw12+Qz/aalXWNoigR+EVa/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MaP7/OZIpqxN8qpJydmzrTu/dMUmD3AP1x+QEVD3YxQmDak2GoAD6YiT4KxOjRB689tr7dzj8v7dBExQ24qJaT/mCb/OUo8ssggia1FlZ0jPKwlSLLwaCbqlnn4VHKrK3pP5vzLKjucYTMhFHzsL9yi8WElKQiYnxEVXfsdJC5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnZugx2E; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnZugx2E"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3a34460a45eso29533825ab.3
        for <linux-doc@vger.kernel.org>; Tue, 01 Oct 2024 12:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727811339; x=1728416139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1yWDiVoLZbp10tEWDIrcXna+8SOkHiu54LGaS0lPr4=;
        b=UnZugx2EhNIYSErIDF4TFPv6ECaBdJQ+PxAC8GaXRy87aXKsUYmWef5FGIcM1SUx9K
         FnUBGrMUzv3kilZjZQ3OycN8MOPwMrgi4gPtkYNOhxHU1AaBSaRahT8NRXR0tZbZ6icZ
         /Zlvva8v/8AGZjEtTSkFp++Vntb2NGCQS1Gs5Qh11vfBiiXXQmHMnx1EFa171T2X4fky
         TVvRTbI8Xbvf3sdeP3+uiam7O4OP5L9AaicWtf1EryKNXBUjJDP+CzGOkMcy9AkhrO1K
         tOs8UJ3OhiYlORvgUflDGL5EW4htk4BeK1wb9IMGe7uZZ6+NcedrX20H7K2Wq+dF/KXm
         QlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727811339; x=1728416139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1yWDiVoLZbp10tEWDIrcXna+8SOkHiu54LGaS0lPr4=;
        b=Jv8X2yRw4yzyAXgiDytfFhpTOBvlJr4z2sXbeYBGlwjlEqUufKFL9VxgZiGAO5r9dc
         tWUuh8TjoIolPVpxrkCkUuhhLEM3NYtTS7q4MfYWgWpCweaKLQCwFB9ImRO71aC+q4gX
         KOklQnmM9t2JNKhsF+buxBBZpooRbjqH094t4vWFEj97gACQM4D0KVUOc432e5Ij4+3y
         Z8kCS9Wo8gbzen8BI6I9vk+PY0VVCYJ//ic7+uMzbuJZyqPy0suTuMwkjbGJEvE4U7qv
         Hbnq4u1W4nUq2tZAq6N0NiTS7VhQPDDUYRK3oSqf5MVwBNuc22DhaqSED4QY8pwKGhqA
         KmQw==
X-Forwarded-Encrypted: i=1; AJvYcCWhezUtjMFUtSbS9bmZ1PqbOdfBqitdclrm7OqED9Mp4Trkqn0sv/NKjXd1iYiAqsZ9QEOh7POgA3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEp5/0eJEFjj4PUUeI+7IwY5A9k+fA0mL8yBA+bEWcjtI9QD0N
	S+mQ5Nmmf0QKHNpnZTqmIUyzmBxnuSxIikXDLuoLpzHHdFZoEK2b
X-Google-Smtp-Source: AGHT+IHx2BkbOwJv84BdU3nFmzfUvUUVHaQl6dm15g18rf7uwHhJfi5fzan6vLH2rXblJd8PZ+ANzg==
X-Received: by 2002:a05:6e02:180c:b0:3a2:6ce9:19c6 with SMTP id e9e14a558f8ab-3a3659536a5mr7317095ab.25.1727811339092;
        Tue, 01 Oct 2024 12:35:39 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4d888835307sm2790975173.2.2024.10.01.12.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 12:35:37 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com,
	ukaszb@chromium.org,
	Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH 20/65] dyndbg-doc: add classmap info to howto
Date: Tue,  1 Oct 2024 13:34:09 -0600
Message-ID: <20241001193455.3306508-21-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241001193455.3306508-1-jim.cromie@gmail.com>
References: <20241001193455.3306508-1-jim.cromie@gmail.com>
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

