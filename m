Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA341FCC72
	for <linux-doc@vger.kernel.org>; Mon,  4 Nov 2024 21:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730756345; cv=none; b=Mp1gDhBSZ1Rm9/Yy7Hv2cIBEeeLlOnhpkErUlfwZIhbuDc464URKmB9n40vlKU84T+sJ87dUVA3ibjoaCJys4P9yhhbHrPjtH1J5LE5rZULdrRtJxEuvn4a/MB8oFzYE4wjdgseEJb4TGSLWNEzbtslGyYjqiZ3FKqaNqVLtkX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730756345; c=relaxed/simple;
	bh=TYAlJTztRqhYn8SXuLaO7NDHyXzC17QYoE7epJOD+Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P/bDNOnlKN+HrsGllo0aLBYB0Gy1UltMoWc53USjSfV67R7nR93wLgJdizelpqTaGH3hiCygHYPsmlA0AzwvgNdqeixLKa3N5CH+VdIyj50CEqVCTtpLKv3ouS4gDG4SqGgX9CblFM65G2npVmz9e32xuA9+zYAEjNefOGY6tvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZK2EfTYT; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZK2EfTYT"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-71809fe188cso2379287a34.0
        for <linux-doc@vger.kernel.org>; Mon, 04 Nov 2024 13:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730756343; x=1731361143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaoCa2kajayKeqDx0XObIYIV3AvCdrG6QdriEJc3qXg=;
        b=ZK2EfTYTj7R8o57WpmnujdiGTaPE8K1WmcBtT4QM2ail3Bc7mvmBCcwyqin730l0n0
         X55WS6Ddn3zHFWCCZf6IjSFq14sp1vUKRpx4O+fTy53LqQUMvZ1AkYUq7NR0unY7mUMi
         Ic+jxqRXKQYCKH/QVz5975XyKpXXrAHKZ+mzett5CCtnGe4V/NIrXLWVEyw3C70TKJxF
         GFw56w3y2OdV7Th3zeiKTK+eJNV4ro44b1fzvpE8NlFW6y8nqoiSEhY43SpAfM7M1PVw
         y7To/3WjvbyDaCNof8IRK7O0HYJDoPr2/cP9DblvBiehNN+lC8fbUxxIK6LOxJJVxQVM
         UfQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730756343; x=1731361143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uaoCa2kajayKeqDx0XObIYIV3AvCdrG6QdriEJc3qXg=;
        b=Yq5iFqanD1onJy2BtSZFRDBuPE85eqWRq7oVKRBd8U/puRcqfSKWjZpAXJuy3v11Sr
         cYeEEpfdOi3gJiXc0SeaHKCtd91Kl7B948fmS2pi8kaIlKZgA10XrSWWjI42tAiU2POe
         OBwcK96uN4lWz06l2UyvFdsoL2eABL/c9KkNZDzXnLJOOZJNm4p+vnhvo5GXhKTb7aDo
         CVfj7vusEcpJkNkBpElSNHS+pDXHJVUiyJfY89MWS/RXpk6o2u30hDN3n9TC1CkGqEIK
         eDHr7CKwEkj6x03jjleRlQlrDyS0ie7OSEgIzf23fse21M70RqWZcCxS9q3DzZefJdED
         eAAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAadrohhhVREe5YARLiPfm7xJuBsvMPFT1RfH3GiWhMHuWajBEyiF2sXj0wn89MINgiex5Yuwn64g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD1ZE4NUpUtX/vxoKYCoPTILQnk4QDxpPafqbPgss2m/kfVYz4
	Wc9h8R0NXT8ra1GtfH+xXEjQLy47qi+hOOnkUkGDELL2zd//rtTZ
X-Google-Smtp-Source: AGHT+IHoLHhXhWiVvk0KzBvVOK954MbIqH+c23PBo22oXqaXaUuCWfBwMOGC0mKfDjYJ4d//P8XM/g==
X-Received: by 2002:a05:6830:919:b0:718:1163:ef8f with SMTP id 46e09a7af769-7189b4cb757mr14436863a34.2.1730756342649;
        Mon, 04 Nov 2024 13:39:02 -0800 (PST)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id ca18e2360f4ac-83b67aea85esm234921039f.2.2024.11.04.13.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 13:39:02 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: intel-gfx-trybot@lists.freedesktop.org
Cc: ukaszb@chromium.org,
	Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH 29/63] dyndbg-doc: add classmap info to howto
Date: Mon,  4 Nov 2024 14:37:50 -0700
Message-ID: <20241104213825.2501625-30-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241104213825.2501625-1-jim.cromie@gmail.com>
References: <20241104213825.2501625-1-jim.cromie@gmail.com>
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

