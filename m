Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2474D520
	for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 18:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727287904; cv=none; b=Flf1bJ1Hwdj3tQqiHuL3UvfvHCbC9jJT1g9xldh5/fTUA3MqTKcX+pgYoDlyl3dKpEDuqI71R7yjNzSaBkwAVwyJCsLcUY47mwBmumgUonaroDNqiqGELwwiZrZI6HY7sIE9G3ut6glgR0ApNHZNl5uU2jbLk/a9Bhx/MeR16i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727287904; c=relaxed/simple;
	bh=o/BqsOUbRW2PLEH5UW7R+v2uvcqPG2KMiapyfSTvB6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jrG3ttQKEXk3gGyphL4qkB040wkNPcTSwYe50EgtdhvDhCYss4dpxySK1FWqAxdqViYRuouxsycGASZlf7azHkHNn59LoS8lCMA7NbP89xlx03NaZ7cBoIQHcdmkjh+gSBCHPdBQISX/tnYtbHG2LvIjIS43WRuq5tQcttcsd30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVgOh0cM; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVgOh0cM"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3a274ef3bdeso449775ab.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Sep 2024 11:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727287902; x=1727892702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l18dqr7r9F9txo16NZNMw1wW/6ItJHDNgA0JuyNX2ag=;
        b=YVgOh0cMUB4YAvnrvN7vEiYYxOAbyfIkEE7jqezO1cWayDQtoxNPuaudyoTIWWpGYT
         +lDWOCth3yD68qkpMzco7HaBRVHfa5dNkoTgVi5lnw6D8diQDCPtsOyLQutTfhwKyyVl
         GLimqX1c1Y9/6tsXaj6EyjEoOJCinCFOOOYRLjTgrPX1Yz1f9pe4ilMJsr7sUQKWT0zV
         ppWAO8+fsJAkKl6DOPJoaE1g8hRcnWNqZ9jb7LQOevbN5YSFmVwnTMkY1iixDhEZWqRS
         U5w3V1dNN9y3bmSLUl5q9cna8KNjZ3NpGv7f9GIRIttF1GLNbv11xVEtTyhwRrBUDkwU
         7XcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727287902; x=1727892702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l18dqr7r9F9txo16NZNMw1wW/6ItJHDNgA0JuyNX2ag=;
        b=f0i6DUr+h6q8OTCoQ5Jn9GYVglJCtg0dEfHJrkKPakZIX8Pyt6nGC//Y943vVTCw8B
         ukAxFuvyC8d0Ri5y0HpcrkHov+xonVBVRf57vlVjI0uvc3DtKj0dsTA0I8ZqnnlmBpgo
         byINwFb/lOX1jF4FPIQM88UYzg6NNERLdbxTxVx352xv44PcmDmhKkPT3naA0cZgIA9J
         pv/kHlPt/Oa9BRclP/gI8dhP/hk0C51KirFk5CzonkV8MUL7xHu7ztxeaDTVdpRMKzJ2
         N4S0mKVV9dfG7ZUhzhbGIRgPsCq1GWLZbUgSo6RvHBDWyzhrNrMMszBZBk423M0zg/ri
         oY2w==
X-Forwarded-Encrypted: i=1; AJvYcCVr5wmOOTE+fzVA+BoTasVrbGa5AjIacdDUlvNH1ah3MkeiNbPKmnPughcGggdJuoaXzzAU1kkeTIY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlCsfWtNLM4y3L9XTawsXSA7QsVM6uJlN52pXFCqoit7s/2cmk
	AceFd+iHN+qQCAXNji9vwUnkrh0+kk8VIVzrnvo6/MicoJ+RIHYG
X-Google-Smtp-Source: AGHT+IHiOM+N4TCOGfcMNjCy+UWwmmGSKa53HMArrxMUFz/ke4n7IB1EDpxyxm906Ysx8FEW8zjp7w==
X-Received: by 2002:a05:6e02:20e8:b0:3a1:a3bd:adcc with SMTP id e9e14a558f8ab-3a26d7492ebmr38605645ab.6.1727287901821;
        Wed, 25 Sep 2024 11:11:41 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3a1a56c3389sm12470605ab.10.2024.09.25.11.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 11:11:41 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com,
	Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH 20/61] dyndbg-doc: add classmap info to howto
Date: Wed, 25 Sep 2024 12:10:12 -0600
Message-ID: <20240925181053.94319-21-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240925181053.94319-1-jim.cromie@gmail.com>
References: <20240925181053.94319-1-jim.cromie@gmail.com>
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
2.46.1

