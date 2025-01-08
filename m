Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D7CA1DFE0F
	for <linux-doc@vger.kernel.org>; Wed,  8 Jan 2025 09:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736328321; cv=none; b=cHHqA5zUxajwXVTqFuvXbzq2+mgUFOzP2iNQY1RrJ7nivmQgk72/s8E5Gd88sWzVeL5qaFF09uiFIaEcq0OHoFoVwLgrzJmZKhtXK3x9GjePjZVTVeZOSJtCZj3wQMygMiYYHQGfkpgdkPdD6GO0acGmPZtpUS3PdD2H20Sij48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736328321; c=relaxed/simple;
	bh=llSUHhm+A4seQ8lYjr3yHckKqVuVY1Iy+BT6PVaPVvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tCbuj/7Q2Q3nPH+RCxQj5Ov/Be6Za5s1Mvgvz2fYw0sxhsudpebbCMJdtuSG5DK1uhhD1koVPI3xJ3OVaD4SzwgseY1B2T6nechX536q/rl6qZxRvzmZiA0DHo9kHlYe+tjEU6uJsKjyVivakp+Gu0r3Rl6fui/YyWb8ZaKfXDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLJe8i6O; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLJe8i6O"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3ad272538e8so2367225ab.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jan 2025 01:25:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736328318; x=1736933118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/IZMjNQwKB6FETXGuNa3E3RIabV5i0AOKe6BBsCH6Q=;
        b=DLJe8i6Ofjo6Cei0lOaANuBuBOmsYv49I1Ywfn/jKBGQ04ON/RP9c+PUfHPV9uXre1
         ZwKI4sZ/UwGxgPfTwa2w1WxGAjahNe7w5n0oQbIIuxcDGdZxAAbt/sgtRddvd3T48gg1
         k6Vp72FutiRCuOHaAeL14qDBHGhSTn2RIrM6wa0BCIqekBcOOOj2y8kp3Az7e3wp2wDj
         vxdf9Kxt3zA5CkjG4ISKsAGlezM/g9/LH9qduSu/GYH3OBU66/poS+25V0mgv7J+RIpr
         GJ7uVSlJx5OUQ40CFlFZ6mHkBALRm1HV6iInxj+e0K72DvUQfCbDgN7KtiHEK+ctxXld
         0JQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736328318; x=1736933118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i/IZMjNQwKB6FETXGuNa3E3RIabV5i0AOKe6BBsCH6Q=;
        b=J1xDy2Zor8J9s3bxv+o7LtjuQXkMO+XE9b8ggpRibwMlX1TcNsP4Pxv5qgOaSjMw5A
         U5dUsHu7SEY384fD+FfRmzo5QgyjXYSVpUWYgfwOvADmDZR8iWdWEfbrUG54LsUwG2EF
         hgJY2FMwiWpm5RuP6Z+/lTjt/xXShDomTJgBKR38EGVyvupt/CXXCYGrwvm3PiTH353r
         UnAxbPA9zCqNp4YiOFh/TFQALIMAdjiLRjn3pVIMvYCFl7PgxW9z9YcgPfBn9EqhesFX
         g/r30S9gT9eXfPU/nUdCC63giscxPiJwCG5yA52ect21YHjuCDBnuBHJiPDZyjt5ERf1
         lDzA==
X-Forwarded-Encrypted: i=1; AJvYcCUR5uu3pzkrihx4rcms1zSdpEgz26rO1nFNw6zJRm9zqlQL44lYR74IgQey3DiiOWKoFRk5+/SpLJY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKswJG6UJYFZPU4mV4IsqZZ5/xeIZ8L/lFUTJjog3OVqV8HyDj
	5lPSppiDCw1dr991PBelP2AtkR2IFOmU4fJ5tT5v4cTqE4Le8pZm
X-Gm-Gg: ASbGncsDYz49Uz3nclkct/bFyKYIKXCG39kATFCkQqzLNhfIWCCDxVndp4eCqSX0LO+
	J8iLg9hx+3EFK/uuSnfy0JQ1QEjP/a/lGqxDl94Al46oCPOcb6k0XJOh/JvV4NZrmnKdapkDLVo
	QcS4hWxT3eMpXFFXYSaElBo8KNvcwqClQHCOwZOZf/yAJp84+KSEwl5W55jodsYSkQjvpgjOQ39
	40cM0SYXPz78an/zfnzcR+03THXwzfmNgnyJSczoxf9BWkeMZhqP3fCqH6fL72n/FWp3fwgYK8Y
	nEibOC4RNT7GSw==
X-Google-Smtp-Source: AGHT+IGwXbm2+BylmJpaNwGvoeLAodU8G25O4pGDnvLlDBYwCxldGVVijTyD7wkdZO2wD2LcjnF2Gw==
X-Received: by 2002:a05:6e02:198b:b0:3ce:38f4:1cc4 with SMTP id e9e14a558f8ab-3ce3aa8de46mr15764715ab.12.1736328318546;
        Wed, 08 Jan 2025 01:25:18 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3c0e3f36305sm106917265ab.62.2025.01.08.01.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 01:25:17 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: intel-gfx-trybot@lists.freedesktop.org,
	ukaszb@chromium.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH 29/64] dyndbg-doc: add classmap info to howto
Date: Wed,  8 Jan 2025 02:24:08 -0700
Message-ID: <20250108092443.8036-30-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108092443.8036-1-jim.cromie@gmail.com>
References: <20250108092443.8036-1-jim.cromie@gmail.com>
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
2.47.1

