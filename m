Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDE234CDE
	for <linux-doc@vger.kernel.org>; Sat,  9 Nov 2024 05:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731129564; cv=none; b=mfbyHBpbuzRcdtnh58b7JOJneAB3n/X7dB2e+uHkjPJ1BDjDZhHIiV3K7mOBBcYGUDj+BZFnXIeCU+pSjFVnD+1EdJZJdI+5I/+l0enaffmYh3VuR8VLnqlANLCwSZpK2ZCNpLvrmCh92d/a+yvxmEcHrtuoEmEhrX8w3OYZ+CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731129564; c=relaxed/simple;
	bh=TYAlJTztRqhYn8SXuLaO7NDHyXzC17QYoE7epJOD+Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QPPVLS4+evIOPhSjW83nKsffWx53zr+4N8cwYAz1l3ehVAHDpVoH6l19Sx6sSKrCY2sytnYkP2b17N+PpC+0yoceCf1rvRuhEjVK/Km2KfRtozcvGL5DcqECP2ye3RJb4VncTIQDR9lR4lP3ve9MjzzrsRAvwV4fdYDMVgb76Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2wFcTVl; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2wFcTVl"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-83aba237c03so117801139f.3
        for <linux-doc@vger.kernel.org>; Fri, 08 Nov 2024 21:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731129562; x=1731734362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaoCa2kajayKeqDx0XObIYIV3AvCdrG6QdriEJc3qXg=;
        b=E2wFcTVlunDzVh/A+o67VbeCkBnlZ31gJ+huZT6YIYvI0MHVPb8S6OpcnFP7ng0kq+
         9ig+EIf4HVyRlDc1xwbXQHYvNfXHir8YH9sUh7fGu2GG8MWMyNhg1M0pbWUoF53oo5vV
         AUcQr4ywXO+CNcFydZHRXZITAaCVL3KJfJ2SjamOZJDDXkQAE5+iiAfFNlE1i6tgXe6l
         vxa9LUzwDbbOCo2OKhjJy/h/oHjtFLcNhcQMKUazY1k5++p/jh3RA6VqcdZAK8o3gBoX
         uwk6Nix24fhjlL83b3plBXFyi7ufTk1LSAlioHp2riq/rZyaUUXjJsHJJldstFOpKlsh
         FOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731129562; x=1731734362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uaoCa2kajayKeqDx0XObIYIV3AvCdrG6QdriEJc3qXg=;
        b=oBDRdj2qM/qjRPjdkzr9aU99jiAbVLHTse90JU3q36ZNJfxh9HkjCudFC80Rbq1VIP
         qjfvuRqEU9glt8an7lCKTjkswnu6Kv0fE29K6huDhFfmG7bR7KgRzAshXbqOr1Or7bXV
         5jsieo/33RWtMgnsonVYADd6jjIftBQQAC1bRiBIFbs1HMDx8s3wjoKi+2OxrMkTSuzV
         V0Fzo50rq3BIbPOdqyUMtTYmGg2wo5AAAGR4D4Q001A/ydqaTC1M5BNgAJPcDdkD0RvI
         4l/qZv+MADNtDeZvzGW8CupzDsb/YlQn5axY4VtjgTaJ5vmIqX/L1nZg1JHoObgI4G0B
         I1Xw==
X-Forwarded-Encrypted: i=1; AJvYcCWkbvVpdk1ga+4dr6NuKvqB+xOLcDwvvEmC6jgnupEUMaBeoHd+6Zs45q1ZlpoRdgxIVZ3+qAhR/ts=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEBZod1VBOXRAeQ71ELrWvoX4vCvAAJaH+o8WWVnhH6aZNcq/u
	1nIgjrtyMPmcx6OnTyFKosd36579GTTQ1VNCDp1SVz8nbZRa4AGWQu8H3A==
X-Google-Smtp-Source: AGHT+IHwhowoDnTPR3uXcOuIvardXdE53MLC6Yb7MGW2HIUxMmRnEzwXdRsvJTosc4vqqf4v5qmCRQ==
X-Received: by 2002:a05:6602:29c7:b0:803:5e55:ecb2 with SMTP id ca18e2360f4ac-83e03068fe6mr746040239f.0.1731129562243;
        Fri, 08 Nov 2024 21:19:22 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id ca18e2360f4ac-83e13558b00sm15607439f.42.2024.11.08.21.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 21:19:21 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: intel-gfx-trybot@lists.freedesktop.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH 29/63] dyndbg-doc: add classmap info to howto
Date: Fri,  8 Nov 2024 22:18:07 -0700
Message-ID: <20241109051841.468715-30-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241109051841.468715-1-jim.cromie@gmail.com>
References: <20241109051841.468715-1-jim.cromie@gmail.com>
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

