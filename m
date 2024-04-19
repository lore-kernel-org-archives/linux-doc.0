Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4AE2E40E
	for <linux-doc@vger.kernel.org>; Fri, 19 Apr 2024 14:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713536387; cv=none; b=oO/jWOL9tcN7s/qzBchdo9V+rAW1PUvuYiwgj42N00DdTPY6VW+8qM7FkWkXscNweWZeWYyenBVegPLrx7leS5Jhka/73wnsLfKdo6PqsAg3z6O8AyLIbeO1wvEBGp50gu6kVMRApBH3u6ZJ6csE9RULEm0JXtOzfkTopz+SxAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713536387; c=relaxed/simple;
	bh=LwV6x6yvxDNibIxZyQaxuZavpGV37CTZExp4SRmte6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T0YTo8iapJuEHanHOetiMSkAf35wbQoYlL+NxfkkY8e7X5OdsAiPdbAKxu9iNQlL3WkN+QilchV6ocNFseVAHzVm+XxfBSf2ayHNqopwg14sRGIn4/YwcrjcoHB/n+AptJZWliackU0YcNqaU5jhJQIiQVl3lqMf3QcNgpjJvs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YogWolLF; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YogWolLF"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7d6bc8d4535so77800039f.2
        for <linux-doc@vger.kernel.org>; Fri, 19 Apr 2024 07:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713536385; x=1714141185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQS6duw3wlQxrA1R/aYDyfaHc6MIoZo0cTZ8VAXn39w=;
        b=YogWolLFhQ76TiRec6dkF8sOWfNKh1WonKik3jvNjV/lrUaRO8xbn7K947wCqulTwa
         Hby3Iz4Q9N40iT79p3ThkeWe2VanhOf4AbFYJsN61yS6vZEy9eULIxc61fWHOiGLtazK
         mCfQJQlmFlUPSVycf31at+qJsKbVPmNU51SOIuBSrxEYbkhKizuJ71J+9TWseLOgEOhp
         zfcjvlhTXPfF6Z/69ASY041iNkZKpzm4mz+HZNm2KPJeHauXxOS8/4S/07RvJX58sZV4
         2zrBesbfUQT7OqYeQeV/FXYuNQy9DFV/l3Qg5hfG8nhhxQKm17qFIQX1t2dAqWCSlD0I
         5XQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713536385; x=1714141185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQS6duw3wlQxrA1R/aYDyfaHc6MIoZo0cTZ8VAXn39w=;
        b=wArndwZsAIbdObKcvcCKMa9attBkfehShMfb9PjWBzEsb18Mg+9Tm17Jeqy08zQ4T+
         5kIPFuS8OJipdEV0VTmFDSznoazys3A4qBDohGZfIhIk4QLb5GN1pNwo1k0oyKQG6wyr
         f3mXfjcwYx4vHYAU1KKUr/sTmxrsCgC5fvuNWXBk0pl4SeP1wpR1GIpWeLVMlnG+KUfF
         uLRytnQ/UXacpav2tB7WORKJjTsSyQvMLrLfIPEwpYwKKD8xVGNJ5oHPPU2f70nwr4hq
         sK1iJe6LE/Q7ES2e3JmpRvhaz85WKJ05paUOiUYusldxirFNjwtfGO+2vLdP8IiFYdxF
         KrdA==
X-Forwarded-Encrypted: i=1; AJvYcCXmp99nyWsSZau4x9W8RQ7RoL0Soei5EAtSTfzf7HGYnQlequCd8eS6wQzAVghUxEDD61qL7KtDR0FXwsj/nZjSvWTh2iePMhsK
X-Gm-Message-State: AOJu0YzYK18U+FQVslkGQMXBZPju1il7el9kyBfKGlYXdSElJyqwfE8y
	Ej2G4CU4e0zBffmeD1Xr/aAzDe8Xy7QFGiY25mFuclqAVlVCOOj4OFh5ew==
X-Google-Smtp-Source: AGHT+IHiyhogsFvSvPmLS2b2xBT3Ls2nftCOxoS2drFg/S960QbAYm/+/EmNtQ4CSs0oBlzW6qTPiA==
X-Received: by 2002:a05:6602:123c:b0:7da:51c4:d610 with SMTP id z28-20020a056602123c00b007da51c4d610mr2075714iot.13.1713536385122;
        Fri, 19 Apr 2024 07:19:45 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
        by smtp.googlemail.com with ESMTPSA id x5-20020a056638248500b00482c1a0013esm1064810jat.117.2024.04.19.07.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 07:19:44 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: tobyboy0@gmail.com
Cc: Jim Cromie <jim.cromie@gmail.com>,
	linux-doc@vger.kernel.org
Subject: [PATCH 18/31] dyndbg-doc: add classmap info to howto
Date: Fri, 19 Apr 2024 08:18:57 -0600
Message-ID: <20240419141911.96079-18-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240419141911.96079-1-jim.cromie@gmail.com>
References: <20240419141911.96079-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add some basic info on classmap usage and api

cc: linux-doc@vger.kernel.org
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v5- adjustments per Randy Dunlap, me
v7b- checkpatch fixes
---
 .../admin-guide/dynamic-debug-howto.rst       | 60 ++++++++++++++++++-
 1 file changed, 59 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 6a8ce5a34382..eaad91c49eeb 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -225,7 +225,6 @@ the ``p`` flag has meaning, other flags are ignored.
 Note the regexp ``^[-+=][fslmpt_]+$`` matches a flags specification.
 To clear all flags at once, use ``=_`` or ``-fslmpt``.
 
-
 Debug messages during Boot Process
 ==================================
 
@@ -375,3 +374,62 @@ just a shortcut for ``print_hex_dump(KERN_DEBUG)``.
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
+By doing so, modules tell dyndbg that they are have prdbgs with those
+class_ids, and they authorize dyndbg to accept "class FOO" for the
+module defining that classname.
+
+There are 2 types of classmaps:
+
+ DD_CLASS_TYPE_DISJOINT_BITS: classes are independent, like DRM.debug
+ DD_CLASS_TYPE_LEVEL_NUM: classes are relative, ordered (V3 > V2)
+
+DYNDBG_CLASSMAP_PARAM - refers to a DEFINEd classmap, exposing the set
+of defined classes to manipulation as a group.  This interface
+enforces the relatedness of classes of DD_CLASS_TYPE_LEVEL_NUM typed
+classmaps; all classes are independent in the >control parser itself.
+
+DYNDBG_CLASSMAP_USE - drm drivers invoke this to ref the CLASSMAP that
+drm DEFINEs.  This shares the classmap definition, and authorizes
+dyndbg to apply changes to the user module's class'd pr_debugs.  It
+also tells dyndbg how to initialize the user's prdbgs at modprobe,
+based upon the current setting of the parent's controlling param.
+
+Modules or module-groups (drm & drivers) can define multiple
+classmaps, as long as they share the limited 0..62 per-module-group
+_class_id range, without overlap.
+
+``#define DEBUG`` will enable all pr_debugs in scope, including any
+class'd ones.  This won't be reflected in the PARAM readback value,
+but the pr_debug callsites can be toggled into agreement with the
+param.
-- 
2.44.0

