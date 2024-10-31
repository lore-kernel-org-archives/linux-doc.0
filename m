Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A4A14F90
	for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2024 08:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730364319; cv=none; b=nsysgu+s1886QSF6HtzTwQUSGShPilpoXzLOsV6EqfC7dpc1g1SSMMuCcaINoYu8XmCPbM/i15YGWmnlVjHtG9OeRxPQWJtRFn8OqNc66fUbMpQh0AjDMHXtnbxijt31Nxbx+fukGwxEw1IyGCVq0ToHhEhmSoqTkfDCUhZn6w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730364319; c=relaxed/simple;
	bh=TYAlJTztRqhYn8SXuLaO7NDHyXzC17QYoE7epJOD+Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gbJLCk/0FHvoK6Msac2t+i08VewcSh48IvH2BpsuKcYOUS9YPTlXWH2lDu0Omz9gq/qC7EjpmJ3nC3yInE2XGkSmEIDafIb2UiH1SG8+pLgzhKCCp254zQpmW7QT8YKjJJhEv+GXkgBJDDHe5hGuTRGtZVIGqaQzMxLrK5YqM8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbFom/U1; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbFom/U1"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-83abcfb9f37so26984639f.1
        for <linux-doc@vger.kernel.org>; Thu, 31 Oct 2024 01:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730364317; x=1730969117; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaoCa2kajayKeqDx0XObIYIV3AvCdrG6QdriEJc3qXg=;
        b=SbFom/U1J8pWSGXZ5MBmVxHmsBS18ax4VdSC9p5z+clbdttTw/VA0ux3cV5B4i4Fcs
         SxKBwyk+tb8YbE1gEeJuXMRG95vl35ZOxLR+q0kD7bfAr2c4ThfuFOP0ZLeskuPLFzQN
         o3qHh3OXo/eKjfeFshEaAy7+2dfSmMJUHHpP6pj5paLgobR3z6Utdur++i0f0V0m+r23
         YAdPU5WPGY3jkhgs4aMSdSim75ewObZAvY1ZUQsoI95Sc/zHWRkomFROtZ6SlcWwtDWY
         fWe7MrGXHBB7tQntDBs4RAFTjIgnNlltaY1KT0oOpz8QYoB1H+sYG+5O1xGcx8U+FFw1
         P8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730364317; x=1730969117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uaoCa2kajayKeqDx0XObIYIV3AvCdrG6QdriEJc3qXg=;
        b=lZXY3TG4+KopLND1hIVlNEZHekHFVVOH76GyNX0Q5/hRevqOw6KjmShA0Ix2vZshUv
         lc/vshHO8npCRxYaxHPbnS5u8qikEBCW5+DARXXmvwWtifhC9aBRZ5wACul2/YYivSP1
         n19QkmT1QRUPNbLUAA5AeHVKlioDB0wkeb/FyZGR6pSsyGIXMB+D0dUCucluEJzk+zN/
         P82pbjGDYCNp+92/cCsc0i27bBtf1D9PsuuuuALZ8zmuqh2k0TBzIbFF0dfSuvLb10Mc
         DP0fSgR/VQB+l1JuvsQp7iVpUW24DLqIkpVZWRlDcVFZ+qE18Xu3kFDB98OGlh5x/Q8Y
         P2Zg==
X-Forwarded-Encrypted: i=1; AJvYcCXiP/o6zwIdXG5aLIALoVaJhskeJUagRKMMmzmNH9ZbRGlQB9Yo2X+rDZuRkBHkmaEcM9fk7hmB7Yk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaTO22ncBm21DvhUtibzsz2Cc17NhU/FQLOFEju33FMbI2U9bL
	rYkXBAD+NobAAB1lSmji1maT8W50hWNqC6ZaXxOCKT8SYej5OIV6
X-Google-Smtp-Source: AGHT+IFkQCNInJ6MUx021G092tQpPmukD/6yqXp96EXsOHEzdJM3uhMUgazXD0Wi/rSZOlrTrtn3Iw==
X-Received: by 2002:a05:6602:2dce:b0:835:4278:f130 with SMTP id ca18e2360f4ac-83b1c5d43acmr1500232839f.13.1730364316704;
        Thu, 31 Oct 2024 01:45:16 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id ca18e2360f4ac-83b67b29ad5sm19914239f.15.2024.10.31.01.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 01:45:15 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: intel-gfx-trybot@lists.freedesktop.org
Cc: ukaszb@chromium.org,
	Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH 29/63] dyndbg-doc: add classmap info to howto
Date: Thu, 31 Oct 2024 02:44:03 -0600
Message-ID: <20241031084437.4010913-30-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241031084437.4010913-1-jim.cromie@gmail.com>
References: <20241031084437.4010913-1-jim.cromie@gmail.com>
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
v9 rewords
---
 .../admin-guide/dynamic-debug-howto.rst       | 79 ++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 691e0f7d4de1..391e40a510c9 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -230,7 +230,6 @@ the ``p`` flag has meaning, other flags are ignored.
 Note the regexp ``^[-+=][fslmpt_]+$`` matches a flags specification.
 To clear all flags at once, use ``=_`` or ``-fslmpt``.
 
-
 Debug messages during Boot Process
 ==================================
 
@@ -380,3 +379,81 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
 For ``print_hex_dump_debug()``/``print_hex_dump_bytes()``, format string is
 its ``prefix_str`` argument, if it is constant string; or ``hexdump``
 in case ``prefix_str`` is built dynamically.
+
+Dynamic Debug classmaps
+=======================
+
+The "class" keyword selects prdbgs based on author supplied,
+domain-oriented names.  This complements the nested-scope keywords:
+module, file, function, line.
+
+The main difference from the others: class'd prdbgs must be named to
+be changed.  This protects them from generic overwrite:
+
+  # IOW this cannot undo any DRM.debug settings
+  :#> ddcmd -p
+
+So each class must be enabled individually (no wildcards):
+
+  :#> ddcmd class DRM_UT_CORE +p
+  :#> ddcmd class DRM_UT_KMS +p
+  # or more selectively
+  :#> ddcmd class DRM_UT_CORE module drm +p
+
+Or the legacy/normal (more convenient) way:
+
+  :#> echo 0x1ff > /sys/module/drm/parameters/debug
+
+Dynamic Debug Classmap API
+==========================
+
+DRM.debug is built upon:
+  ~23 macros, all passing a DRM_UT_* constant as arg-1.
+  ~5000 calls to them, across drivers/gpu/drm/*
+  bits in /sys/module/drm/parameters/debug control all DRM_UT_* together
+
+The const short ints are good for optimizing compilers; a classmaps
+design goal was to keep that.  So basically .classid === category.
+
+And since prdbgs are cataloged with just a DRM_UT_* to identify them,
+the "class" keyword maps known classnames to those reserved IDs, and
+by explicitly requiring "class FOO" in queries, we protect FOO class'd
+debugs from overwrite by generic queries.
+
+Its expected that other classmap users will also provide debug-macros
+using an enum-defined categorization scheme like DRM's, and dyndbg can
+be adapted under them similarly.
+
+DYNDBG_CLASSMAP_DEFINE(var,type,_base,classnames) - this maps
+classnames onto class-ids starting at _base, it also maps the
+names onto CLASSMAP_PARAM bits 0..N.
+
+DYNDBG_CLASSMAP_USE(var) - modules call this to refer to the var
+_DEFINEd elsewhere (and exported).
+
+Classmaps are opt-in: modules invoke _DEFINE or _USE to authorize
+dyndbg to update those classes.  "class FOO" queries are validated
+against the classes, this finds the classid to alter; classes are not
+directly selectable by their classid.
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
+The PARAM interface also enforces the DD_CLASS_TYPE_LEVEL_NUM relation
+amongst the contained classnames; all classes are independent in the
+control parser itself; there is no implied meaning in names like "V4".
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

