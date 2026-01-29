Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A002937B41D
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671876; cv=none; b=NiSKQCZ2lPkFVk2nZeSL7FcaSOJrAZj5wPIvw8Dd5Aj4kwbUXGv7Qyy+enV35Ej5oJ8xjjvTWihgOvtEi1SlfjGMkQI4xaU+nPiosbB6Bm1DLVssHPvPXzVodZ3Prk9x0zmG4CFTXp/lZtLI3brmuUIKKOZpGzDexlOXzaQ+hEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671876; c=relaxed/simple;
	bh=BMniTA78p3XqXbrdM4ipw6DKYKze1hk3TwGX6aHCQZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AqHqoJAVe9tNx7TBzh0Gr03n8rGWphsENbwQ9kEFzkfm3ACOz3iXZVEDWPj/cvCGuheE4ifjsCh33NgJZTPDyDbDE/1CVp2fSklmD+1WUJLnJUYwaV2GFZR4I+6sfcqHVcoeCKtETBQYntcbqk7+jKcDcDeLI13DKjnqptHP8WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JSjbkcr6; arc=none smtp.client-ip=209.85.210.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JSjbkcr6"
Received: by mail-ot1-f66.google.com with SMTP id 46e09a7af769-7d18cf89e72so408912a34.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:31:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671873; x=1770276673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6f2xrkUcfpS9lLYn4Acu489J/FLCiIom2Y0PyUhcDE=;
        b=JSjbkcr6HIBStElKYV/dTGoZcv8r5foUKQuLBiMNeqodAV8/MyDaUUscnzYfF5V0MA
         AS1sTf2zgZzEiY2TWJp/vcBPMhKmJxAYS+ON52/YgjEtJjqH641TTaEj546M0EAN5NaW
         edMlnZ0IztR1cE3z24JZ/jXhmTEGWo8ujMWJKWfWl/2//e0CNld4hkY8ST/R8E6L/ZmU
         CIrfV+XvAz5uoOXPnjkMmMUgHvDzJwGFaqNkwf/HkhIc6CeRxVaa6a4u+FQFgnuLOzg+
         4xh7rt2yh/YoXwRWOz0w5pObXPV0ZlcelrKjp3sSIzyJkccqbAQ/Fx1eSAdxB/qp72XA
         soMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671873; x=1770276673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h6f2xrkUcfpS9lLYn4Acu489J/FLCiIom2Y0PyUhcDE=;
        b=GbX0yo1AG9qlP+7LpY7ahRkhnF1gke3RPYEQ/3TJZqIjBumCv5Sx42pIAABysfjG8m
         fsS2wkn9pzgpqQf/h10bibQxC7kibsmvvHRp9TuuLT/+MopUgj8tITwzDFOXM99+l8H5
         2QNcAjIqfcxpwsJWmle++/JfDGaK3vNZq2hHxgBWw3nNoDsoj5qGHB4rRc7aROc3Qxhz
         5mGMOmsKuC4243A5pkwpdueWOjDEkoZhmxkvL/4aFiriS1zmCsgLJK15kXop+fV/I94J
         PWz2JbVM9NQRGE/BLdj8RBH+zc5NC60Rc3DUuShw9OD/mX3TWPyJnjtIzRFSkckcWed5
         5JrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHXLxOwLYMrxwq2asPA7c1C+rR0DXqiueVCs3jwS3PkhCuYcDxKxFPzWfa7V7X869q4Bvt0OEaPFI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4D0a5QdcQyo4jfj2Zn0Rs1nKY1kPUv9mXPyQm6kjaPhGH8FRU
	5ddbvt9IFl9X0+tV8uNE2nf5iPihdpqa4qE8lmADQsx3Jrihhn+tpUyu
X-Gm-Gg: AZuq6aKudqKsNadT2lee2efURnh9gXxQuCoXLuQCci5F/BDf9Itj+XrMFGv3oGjXIwF
	cOxVRW1OUR89avhUjn91ebg2pxVQIPyBGEKICxo1aiHCnlpwPkFpQA53DS2w/7D02LwjD+09k2U
	nIu/XA7DOZf84qLwRoumdkTAGbNVAmu0Dtmji1p9XpiYHy3JYj7TEBnwEPppq84oGxgm1wZdrK1
	VlPMYnAIZejoKIlstd6U650kIaxhWvTmD7I0j402JUYABB5GZKCVnV3oblq9dI4zrl4m+LcdMS0
	krJrB+rUhiH/tRHIEc4qZWuVJt6i1QzFrPFydzCSgEY06ZIWDKf1angGJFEvdtJUF7D0iZ4Pzyh
	dohTs0sOHCtYcd9hwa5ADAjssD0xUQ84vRmmf4wxfUidtE+3j491L3hymxf3R1tJDd69P7DhOYN
	xxAlUNLT7xYL2PBY1rOHGGrIENB3blzcASDE+g2KSY
X-Received: by 2002:a05:6830:63cc:b0:7cf:ccf2:ebb with SMTP id 46e09a7af769-7d184ffd449mr5101962a34.10.1769671873527;
        Wed, 28 Jan 2026 23:31:13 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7d18c831394sm3276327a34.31.2026.01.28.23.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:31:12 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Jason Baron <jbaron@akamai.com>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Dave Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	Petr Mladek <pmladek@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 23/32] dyndbg: detect class_id reservation conflicts
Date: Thu, 29 Jan 2026 00:29:09 -0700
Message-ID: <20260129072932.2190803-24-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129072932.2190803-1-jim.cromie@gmail.com>
References: <20260129072932.2190803-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If a module _DEFINEs 2 or more classmaps, it must devise them to share
the per-module 0..62 class-id space; ie their respective base,+length
reservations cannot overlap.

To detect conflicts at modprobe, add ddebug_class_range_overlap(),
call it from ddebug_add_module(), and WARN and return -EINVAL when
they're detected.

This insures that class_id -> classname lookup has just 1 answer, so
the 1st-found search in find-class-name works properly.

test_dynamic_debug.c:

If built with -DFORCE_CLASSID_CONFLICT, the test-modules invoke 2
conflicting DYNAMIC_DEBUG_CLASSMAP_DEFINE() declarations, into parent
and the _submod.  These conflict with one of the good ones in the
parent (D2_CORE..etc), causing the modprobe(s) to warn

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
v9 - fix WARN() by adding new 1st arg 1.
---
 lib/dynamic_debug.c      | 10 ++++++++++
 lib/test_dynamic_debug.c |  8 ++++++++
 2 files changed, 18 insertions(+)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 5565ffa18c11..b59252e0665a 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1318,6 +1318,7 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
 	struct _ddebug_class_user *cli;
+	u64 reserved_ids = 0;
 	int i;
 
 	if (!di->descs.len)
@@ -1342,6 +1343,11 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	dd_mark_vector_subrange(i, cli, &dt->info, users, dt);
 	/* now di is stale */
 
+	/* insure 2+ classmaps share the per-module 0..62 class_id space */
+	for_subvec(i, cm, &dt->info, maps)
+		if (ddebug_class_range_overlap(cm, &reserved_ids))
+			goto cleanup;
+
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
@@ -1354,6 +1360,10 @@ static int ddebug_add_module(struct _ddebug_info *di)
 	vpr_info("%3u debug prints in module %s\n",
 		 dt->info.descs.len, dt->info.mod_name);
 	return 0;
+cleanup:
+	WARN_ONCE(1, "dyndbg multi-classmap conflict in %s\n", di->mod_name);
+	kfree(dt);
+	return -EINVAL;
 }
 
 /* helper for ddebug_dyndbg_(boot|module)_param_cb */
diff --git a/lib/test_dynamic_debug.c b/lib/test_dynamic_debug.c
index 6c4548f63512..1ba4be9a403a 100644
--- a/lib/test_dynamic_debug.c
+++ b/lib/test_dynamic_debug.c
@@ -128,6 +128,14 @@ DYNAMIC_DEBUG_CLASSMAP_DEFINE(map_level_num, DD_CLASS_TYPE_LEVEL_NUM,
 DYNAMIC_DEBUG_CLASSMAP_PARAM(disjoint_bits, p);
 DYNAMIC_DEBUG_CLASSMAP_PARAM(level_num, p);
 
+#ifdef FORCE_CLASSID_CONFLICT
+/*
+ * Enable with -Dflag on compile to test overlapping class-id range
+ * detection.  This should warn on modprobes.
+ */
+DYNDBG_CLASSMAP_DEFINE(classid_range_conflict, 0, D2_CORE + 1, "D3_CORE");
+#endif
+
 #else /* TEST_DYNAMIC_DEBUG_SUBMOD */
 
 /*
-- 
2.52.0

