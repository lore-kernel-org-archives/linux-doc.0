Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C0D20E6F0;
	Sat, 25 Jan 2025 06:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737787631; cv=none; b=iXn9RzgEbE6GoMWqCpCRiAIasAIJUghTmTNb4jDHKKyczR5YzFHNk9l75Iijt50atUcdBOVQ+KrxqgxXjIVDpRYedvkhdsILy0OdkHMDapIKO84QQ8X/A1RdHAGjdcPQ/uNj+m/IjT9yBDuOh17rJtFCS2xCdfNj9IZpPADn81U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737787631; c=relaxed/simple;
	bh=JTONJC2USTo5f58QWgkJFuOhxcuaEB+Ho70IChpgJLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AxlmNS+w04cBNIbb1VN+0Xi+Pkszfum5k1XdOh3qeNzUvac2TtKUkSjs2hYLTYTph+N2xbKlKHExZTNp5DR7PvaW+J9AEWrB0lwyV1QEcriB0uLJqkZ2biw/6I1+K10pDZTNrRayksx10N6COGLZSL76IqwKd1xQUU6G5scpl8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EO96HUGk; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EO96HUGk"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-84cdacbc373so84590839f.1;
        Fri, 24 Jan 2025 22:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737787629; x=1738392429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CxerCwCa32SuNvijTSel2H05zJGPetjkTO/3X/VldcE=;
        b=EO96HUGk718rt0OUt8wbXix7hdhNqtmPrrB0h3bJCrA0qm9rWpKbdtR3ZWGs5hM1PN
         yqp5UwMoCsqQI8uGUHh7J2UCXHGGpBprDHc1E0FTdMXqCjym7m000jeaUVewP/AH9+Y4
         KPXcCiHhO4z7d+VQDKnkbb1iHNeSsgagbC624uK8K5aLeo/EPXGoGsXyVTgnC6kK6p1g
         NP+FV4x7gPtwJSHXG6JjivBqeBhrYqyAG7uJbfYsviFUjYR/VYwXQWL7GBl3/HH+pRps
         S9DMhDzaknZkVKA4VY63sGQhU6Cb2w0F8Q2DX/2mhJtTAkPzEHrpaDKLp2F8Sd00qTeR
         3Zow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737787629; x=1738392429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CxerCwCa32SuNvijTSel2H05zJGPetjkTO/3X/VldcE=;
        b=n0+wNaK8SLxFdW2irBcolCfaIQqO5pMkeWzjXF7KBCpuTWoxMa8Tu/26tcp0G+L66G
         MamRiNUktI4dwuHBMjM+WdTEjObAWtdNgzak/T0gaB9p988iVb/KtPLrCMbvamQVvL9c
         7hWvEzWqB5dr6zMk9WRoHYzWxSOuhbq33p1gkrpSi4z4/wOwgkPLb6VOBTk2yesXs3uv
         dBixhorBuakyq4fOFjIfzAo1E8IaW3JOu9d16SxM+pYCxnFdj22P+FofNrD2uQEWL1Ld
         ahk4vXbc2lHThofGLJ4v8oAXSB1BDqiC+MQG23rWsA1riOjq4Wtn6y1W2AvLTGhFbmFi
         gMMA==
X-Forwarded-Encrypted: i=1; AJvYcCUzbDnatbqJRuL+HybA5kvCMeeCNvtFu0ph8s/fPyAseijtSUwoZCLFW/wV6qKwMpp8SMHEH5jGawQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb601zFh6nKQ5UqP8bK4J9clVWAytowh4o/Q/E2Juk8IH1eE+4
	UrRTZTm0lMICFSgX0i9CM7duBg4BaiJui9gZ4pweexVvdxqIA41Dz9BP7w==
X-Gm-Gg: ASbGncv9dEZfK6DHc6YemQQRSscAfiQ8qPjuj+sX+gAL66PE8ttzRBtOHw1sG2cGu3p
	oMhqPv+txICPv2grQ7sukvAlooe4zTfKPp52L8cp5vAvW4v2IT4CJ3YatJGlHiPpHBCsS3R6JDr
	pbGkMPDfKHcPhF53QKQVZYFmTY8zJ8/+WoUhJYUvtTuV/PN2y6jvu1XXHv3Gu2c1O2gh/gK1ciy
	8WYaX+YXzPBOBQFgphRw7vWlzo+TDK0LS8kdV4Yo1iIJUvECRlUCAHMgCadTVSuEtCl78NBDjig
	QtkQjPlNWas04NoLQQ7bcfwlbZ3CqZn7w6ylnA==
X-Google-Smtp-Source: AGHT+IFeP81OrrwZYyhERt8IWjWebpncl5LYjvFIJ2Zw2ef9M59/qZvRErXREgk6q+sIWkS/LYegPw==
X-Received: by 2002:a05:6e02:16ce:b0:3a7:6566:1e8f with SMTP id e9e14a558f8ab-3cf7447bb26mr253694305ab.16.1737787628880;
        Fri, 24 Jan 2025 22:47:08 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 22:47:08 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org,
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
Subject: [PATCH 29/63] dyndbg-doc: add classmap info to howto
Date: Fri, 24 Jan 2025 23:45:43 -0700
Message-ID: <20250125064619.8305-30-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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
2.48.1

