Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE8630275F
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 01:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768355980; cv=none; b=hb8p7jHa9Z3GjRm+1mLP+NOx6b0EQLn0w7o+dnl9lNOZIv7ZONTnF+zRk7NGJdq+i5YQ7x/QBPqVn0uKfjHg3dGH1HUq/T0PXkhWaLo39YQP9xShxVqqwaGWVGVxbw07VZ/O0z5xpiN8vx+g8HZJvJ9YhX0p11BAzFjfJFc37NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768355980; c=relaxed/simple;
	bh=MVevVZ31CxJkfQFZ+3wAubfOLMLENMAt3zvnrw7vgvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hw/3IEqcycBqvAR8uLAT6CRUR1mXUlnfc5RWFJ5LEsrO1L8URCVyCZj6hDw4PrjpIIdzXmc9gL09CsJ5PCPoWjdbSOc9DPWQz/IlOl843Ka4Nba2W8hm0Hp98+30Rc7FAjxb2wcMH07Duf/3bO0gti+1BzVHauJOuVwmoPyYl64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=doE1jtmg; arc=none smtp.client-ip=209.85.210.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="doE1jtmg"
Received: by mail-ot1-f68.google.com with SMTP id 46e09a7af769-7cdd651c884so329082a34.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 17:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768355976; x=1768960776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivVObFpEMeRPBcsYoBwesJyCBQlJUgWhfwCq+iuBLo8=;
        b=doE1jtmg2ac41dcUEbPuiLzgu5rkU7qmMKcqtk8DIHlDuW/NQjDHaU8huDgqyvXanv
         7PbJs3vbOQ1Y2Fun32jU2B/r1gA34Bh1OHSRpFsOaKNKpsvoXA+qMX7VOCKEonIVr/qG
         T+nVYehpV/NEcXFSVXqNa6XpIb5/RB4hfPllto7WJahGjAj2souVBqNiTBfWmhq8gLSj
         Ih2caU1crk390yvjW9p/oPMCyrSLqYrEF34aUbdvGrjxV2w/GWoZjyfsRyG2kCqMvpBA
         8QISGSKR3YXYe2c0HAndGLoetQcf5W1+DoPUSCBoLUSjm7ZcvkThiSrDf3Z1i1PHVItU
         gnfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768355976; x=1768960776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ivVObFpEMeRPBcsYoBwesJyCBQlJUgWhfwCq+iuBLo8=;
        b=jiClOOmDQ02TpEZKFIGuA67s1s4W/4bB5n2FDAyH4PqstX0byNtRc94Aic/FRgWXJr
         ftlDj8zxyjFIIOXJAnGkOfHUSP+Uh4uQxCcNuRtuVBIW+ckmbvcWVjhVRzZLA4ttanXx
         v6HPh9fuaF5RHGuiBP1hHi+UJwqRCQgJPEVN+5EjgD+/Df94uMtXSDWtr3M2e0HlmQ6L
         QQzUkmKYu6hsFsqnW3rcdr1sJJSkLOPKVugQYJLqf53KIvLRW/KLLTlHLpSUJ0XXyBKf
         pMN/LBUCwZsTmMTqDF+1/Fc9OuKjnPYaIdY1M5bPVKvjyXayeFESZtGtfPHv6KGNHJ3F
         MRaw==
X-Forwarded-Encrypted: i=1; AJvYcCXPWO7ianDIu5OKYWBRRSeY1T6N0mGu8eIvvn021sLOMlDugbzuxlFJt9vz6oZV7yDvRkLoF/2OZLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHXV1xN1afZn9sVJfHAh5849si0TqRT+f94V0TlOwPnREodMgK
	urKIariOvZ3VrBEh2H3hLh8qaBQmNlRZ7yRxAexv+u77rOJqC+mrmSae
X-Gm-Gg: AY/fxX4nT+ha02gsqnQ8C7l10AcvO6YfvDm3Yq4Bxc7AeRXml+8d4Yx1zL3h0S+dISf
	rTSx8ItS+Kk9e5OL+OCH60tBZLm90gQVo18jSWRR8yMKWmUSPXlHXF9B8bmTQOn/leKKcWS/xh9
	jgNl1wjpm/Kuh5qdXx4Zflkit9spllF39OH9IZ3zTJ8zheUk06D2rHZzAxXsB9KvtRC0SZ8y44X
	+b1D+QUSMN2G6Lz0BEFbpydNjsZr/1GWnOnessklRP+pDY9lp7WRW/Vixoe5ktnIDLAK6iG/hP5
	fArSM/C1E/kCWJNI/h/1qRM+duBN1OQK7O5aJHLu2fhI0UdxAgIB93iXTaE1EurrpdTWlsIkTk4
	15kvOtCEGfFDign4T4Dt13qUtygH/iU+/vyZddJjIsbAxHXA1FK0YyqfgtaKRwo3/dC1RWRtKGi
	tUZUX31x6YSmzvTH0/3KmfcXvsNUOg0ijZL9az
X-Received: by 2002:a9d:6417:0:b0:7c7:6b2e:2c4c with SMTP id 46e09a7af769-7cfbe3db134mr2224026a34.2.1768355975902;
        Tue, 13 Jan 2026 17:59:35 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7ce478af63bsm16441331a34.16.2026.01.13.17.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 17:59:35 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
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
	Steven Rostedt <rostedt@goodmis.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 13/31] dyndbg: replace classmap list with a vector
Date: Tue, 13 Jan 2026 18:57:29 -0700
Message-ID: <20260114015815.1565725-14-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Classmaps are stored in an elf section/array, but currently are
individually list-linked onto dyndbg's per-module ddebug_table for
operation. This is unnecessary.

Just like dyndbg's descriptors, classes are packed in compile order;
so even with many builtin modules employing multiple classmaps, each
modules' maps are packed contiguously, and can be treated as a
array-start-address & array-length.

So this drops the whole list building operation done in
ddebug_attach_module_classes(), and removes the list-head members.
The "select-by-modname" condition is reused to find the start,end of
the subrange.

NOTE: This "filter-by-modname" on classmaps should really be done in
ddebug_add_module(1); ie at least one step closer to ddebug_init(2),
which already splits up pr-debug descriptors into subranges by
modname, then calls (1) on each.  (2) knows nothing of classmaps
currently, and doesn't need to.  For now, just add comment.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h |  1 -
 lib/dynamic_debug.c           | 62 ++++++++++++++++++-----------------
 2 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index c4ae79f934d9..51ed26e42032 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -83,7 +83,6 @@ enum class_map_type {
 };
 
 struct ddebug_class_map {
-	struct list_head link;
 	struct module *mod;
 	const char *mod_name;	/* needed for builtins */
 	const char **class_names;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index db0559763e60..e882e951d585 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -45,10 +45,11 @@ extern struct ddebug_class_map __start___dyndbg_classes[];
 extern struct ddebug_class_map __stop___dyndbg_classes[];
 
 struct ddebug_table {
-	struct list_head link, maps;
+	struct list_head link;
 	const char *mod_name;
-	unsigned int num_ddebugs;
 	struct _ddebug *ddebugs;
+	struct ddebug_class_map *classes;
+	unsigned int num_ddebugs, num_classes;
 };
 
 struct ddebug_query {
@@ -148,12 +149,13 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 }
 
 static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
-							  const char *class_string, int *class_id)
+							const char *class_string,
+							int *class_id)
 {
 	struct ddebug_class_map *map;
-	int idx;
+	int i, idx;
 
-	list_for_each_entry(map, &dt->maps, link) {
+	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -164,7 +166,6 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	return NULL;
 }
 
-#define __outvar /* filled by callee */
 /*
  * Search the tables for _ddebug's which match the given `query' and
  * apply the `flags' and `mask' to them.  Returns number of matching
@@ -226,7 +227,7 @@ static int ddebug_change(const struct ddebug_query *query,
 	unsigned int nfound = 0;
 	struct flagsbuf fbuf, nbuf;
 	struct ddebug_class_map *map = NULL;
-	int __outvar valid_class;
+	int valid_class;
 
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
@@ -1133,9 +1134,10 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 
 static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
 {
-	struct ddebug_class_map *map;
+	struct ddebug_class_map *map = iter->table->classes;
+	int i, nc = iter->table->num_classes;
 
-	list_for_each_entry(map, &iter->table->maps, link)
+	for (i = 0; i < nc; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1219,30 +1221,31 @@ static const struct proc_ops proc_fops = {
 	.proc_write = ddebug_proc_write
 };
 
-static void ddebug_attach_module_classes(struct ddebug_table *dt,
-					 struct ddebug_class_map *classes,
-					 int num_classes)
+static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
 	struct ddebug_class_map *cm;
-	int i, j, ct = 0;
+	int i, nc = 0;
 
-	for (cm = classes, i = 0; i < num_classes; i++, cm++) {
+	/*
+	 * Find this module's classmaps in a subrange/wholerange of
+	 * the builtin/modular classmap vector/section.  Save the start
+	 * and length of the subrange at its edges.
+	 */
+	for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
 
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
-
-			v2pr_info("class[%d]: module:%s base:%d len:%d ty:%d\n", i,
-				  cm->mod_name, cm->base, cm->length, cm->map_type);
-
-			for (j = 0; j < cm->length; j++)
-				v3pr_info(" %d: %d %s\n", j + cm->base, j,
-					  cm->class_names[j]);
-
-			list_add(&cm->link, &dt->maps);
-			ct++;
+			if (!nc) {
+				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
+					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
+				dt->classes = cm;
+			}
+			nc++;
 		}
 	}
-	if (ct)
-		vpr_info("module:%s attached %d classes\n", dt->mod_name, ct);
+	if (nc) {
+		dt->num_classes = nc;
+		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
+	}
 }
 
 /*
@@ -1274,10 +1277,9 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	dt->num_ddebugs = di->num_descs;
 
 	INIT_LIST_HEAD(&dt->link);
-	INIT_LIST_HEAD(&dt->maps);
 
 	if (di->classes && di->num_classes)
-		ddebug_attach_module_classes(dt, di->classes, di->num_classes);
+		ddebug_attach_module_classes(dt, di);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
@@ -1390,8 +1392,8 @@ static void ddebug_remove_all_tables(void)
 	mutex_lock(&ddebug_lock);
 	while (!list_empty(&ddebug_tables)) {
 		struct ddebug_table *dt = list_entry(ddebug_tables.next,
-						      struct ddebug_table,
-						      link);
+						     struct ddebug_table,
+						     link);
 		ddebug_table_free(dt);
 	}
 	mutex_unlock(&ddebug_lock);
-- 
2.52.0

