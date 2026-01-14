Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DB13019D8
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 01:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768355999; cv=none; b=jPeWFv1leK5+mfM1cVqbv/IimhEjDDzSUwq4U/tNn0HBZDW8axSTCMjHqL6GZwby+MOt9dusFOqkSn+GILvaDTy9T9RPJgRt83DKHp7pIuvFqntoRrcI9A8z0apZRQdXWMd8uBPasginEMoNfKj5phEGMTHJqU9eN+h60a9UCDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768355999; c=relaxed/simple;
	bh=Sur1FbLe/TV5gZgSr7rckEnVtPl6CsAJr9HA1IILbJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H+rcxRkvyeJe4lRQc+AnJArmNbS3gQCsqp2oH0AzEAedQtP9USAYGe5WJVd4/FdCvezHUNambGZTa373ag6PsbVH7QFhyFXgpf8NBwcG92rZFzp8u5+uhuPSAakcPpLDCyx8XPoextYx2/trLCx4jXDJPtMSVQ3F3Gx99nV+/kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YkFgzkZ6; arc=none smtp.client-ip=209.85.210.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YkFgzkZ6"
Received: by mail-ot1-f68.google.com with SMTP id 46e09a7af769-7c6e9538945so292445a34.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 17:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768355992; x=1768960792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgioQELFSWboGT8e1NJA/uyXbHTLXVSWlCnIL2Rpr+0=;
        b=YkFgzkZ6UxPId1Urcj4iDb+gwIzKx96bLN7zNyXYpFQMKJgm8/SwCp/9bmMTOmKcrt
         dfKeypXXzpPQ5dDA77rO642nY55mPydGRpI628s6I8b9L52M2SiA5fCSpXbMKaZG6pbN
         841rJ6UUSld8BF2rhIP7/j6An1i1JzrKZoL30QSSzOeJb3bdTbZJQE6aNiasmxxsinci
         777JE1Jpx3D8Nmd+8NW7tYZ3Q4QLFb45pkE6jlBo4s6wWHKbl0tvXAXUzgpSxPqYnKoQ
         UaF0+VqlhJDkGSAU4cF6eS0VenNbkQ04Zj7GMJYQvHGG/6Q/BQ9tFyiucD1n9g/7Ry71
         8bjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768355992; x=1768960792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IgioQELFSWboGT8e1NJA/uyXbHTLXVSWlCnIL2Rpr+0=;
        b=q8QGM7dDEkriBSxQIxxzWmxSNKoLUnvReHF5xPw8zFN6fc7H5pz9JBXWW00Edt1RR9
         /B27W9YCz3KwKwhgZkGt4AMxPAa0c49GxT6d0o6SdlX8wEuOsUEhDC60Z+qfj4ki/PWf
         uVvgiKc0+xqGzJXVIDzVRCwQzrmKhuxshAHJgHLybJVzQPC2N+aLPcalHSo8zvtChJbQ
         ryIbG7id0nd30LWaK8abfvK/+lD+ubNYb/F4AgxNSpG5KO409tKiQYaBwS8jXd/5Cdqq
         GR6PXmol/xHEeLNv24bKjWYl+/SMvCNhM3LPaYJ1BvbdDM96PTQ2/RizTH4ijUvJ7PDF
         s4ew==
X-Forwarded-Encrypted: i=1; AJvYcCVzFIC1muKbm/dCq9XKrLpHbYJ3L1CRSmosZdLzAch8O61Te+mgQxpMZpUv849vbbrZrmypM1Gd4BM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3mM6wpiIANQitX8FQFuGarPOryd09fsL68sHAuBnsCd0G4ccv
	JnkR9/6imNAFEXp19AGHx4IGNse//bg8JI5eXY3XNdJ8Z5ZfAt8fywRs
X-Gm-Gg: AY/fxX7nw5vpY326la+UJUbeg+O3Y363ezkljoWayoef2SQJ2T6R0cBmsIPSOJuQ457
	Lnr4vggyoAGjllUozXI1J7YTFP0Zq109b9RT8Ox1n+ev1hE9JC/t12EPTXBoTkc7BmhM+YpwDx4
	SxftP2lLatCMxK00+p2zbvWWix2iDv8ertdqfLhh+CHqkKbQcCS6edAJ7BtDL7w4tZ39cnnJChL
	PfsDXvIARKx1MLIBFCaZtEEtuHS2wRvMZrY6r4XEOABRmVZ6iOHHsYzT0bhFKvJ959D71CIryNo
	JdbYjhlGMdbrOEomSF20W6e/96tNj+SLpOCL3ctCMqsGH+Zf9lQ7c8Z/DJ6v4zuQRUM6w5E6LmN
	5QzlaWa+7bmVZCltAvPzEfOTVvZwAYStvG/Otk/cS/BUFQ/JbuQ1Vzx5QdvFdxFF8VnKIB8rmMa
	LFm4yB0K4e5kg8ajZGX0HoqZkd65ouDR1atI20/qdOa8hpnbs=
X-Received: by 2002:a05:6808:6602:b0:44f:f025:303e with SMTP id 5614622812f47-45c6210837bmr2726407b6e.6.1768355991634;
        Tue, 13 Jan 2026 17:59:51 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7ce478d9f6dsm17343223a34.24.2026.01.13.17.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 17:59:51 -0800 (PST)
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
Subject: [PATCH v8 17/31] dyndbg: move mod_name down from struct ddebug_table to _ddebug_info
Date: Tue, 13 Jan 2026 18:57:33 -0700
Message-ID: <20260114015815.1565725-18-jim.cromie@gmail.com>
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

struct _ddebug_info already has most of dyndbg's info for a module;
push debug_table.mod_name down into it, finishing the encapsulation.

This allows refactoring several callchains, passing &_ddebug_info
instead of &ddebug_table, and hoisting the "&dt->info" deref up
instead of repeating it thru the callchans

ddebug_table contains a _ddebug_info member, so its users keep access
to mod_name, just now with "->info." added in.

In static ddebug_add_module(&di), reinforce the cursor-model by
dropping the modname arg, and setting di->mod_name at each caller.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h |  1 +
 lib/dynamic_debug.c           | 50 ++++++++++++++++++-----------------
 2 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 4775f66e96dd..10f1a2a1bee4 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -107,6 +107,7 @@ struct _ddebug_class_maps {
 };
 
 struct _ddebug_info {
+	const char *mod_name;
 	struct _ddebug_descs descs;
 	struct _ddebug_class_maps maps;
 };
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index d668140794ac..77972da271ee 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -46,7 +46,6 @@ extern struct _ddebug_class_map __stop___dyndbg_class_maps[];
 
 struct ddebug_table {
 	struct list_head link;
-	const char *mod_name;
 	struct _ddebug_info info;
 };
 
@@ -253,10 +252,11 @@ static int ddebug_change(const struct ddebug_query *query,
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
 	list_for_each_entry(dt, &ddebug_tables, link) {
+		struct _ddebug_info *di = &dt->info;
 
 		/* match against the module name */
 		if (query->module &&
-		    !match_wildcard(query->module, dt->mod_name))
+		    !match_wildcard(query->module, di->mod_name))
 			continue;
 
 		if (query->class_string) {
@@ -268,8 +268,8 @@ static int ddebug_change(const struct ddebug_query *query,
 			valid_class = _DPRINTK_CLASS_DFLT;
 		}
 
-		for (i = 0; i < dt->info.descs.len; i++) {
-			struct _ddebug *dp = &dt->info.descs.start[i];
+		for (i = 0; i < di->descs.len; i++) {
+			struct _ddebug *dp = &di->descs.start[i];
 
 			if (!ddebug_match_desc(query, dp, valid_class))
 				continue;
@@ -289,7 +289,7 @@ static int ddebug_change(const struct ddebug_query *query,
 #endif
 			v4pr_info("changed %s:%d [%s]%s %s => %s\n",
 				  trim_prefix(dp->filename), dp->lineno,
-				  dt->mod_name, dp->function,
+				  di->mod_name, dp->function,
 				  ddebug_describe_flags(dp->flags, &fbuf),
 				  ddebug_describe_flags(newflags, &nbuf));
 			dp->flags = newflags;
@@ -1156,12 +1156,12 @@ static bool ddebug_class_in_range(const int class_id, const struct _ddebug_class
 		class_id < map->base + map->length);
 }
 
-static const char *ddebug_class_name(struct ddebug_table *dt, struct _ddebug *dp)
+static const char *ddebug_class_name(struct _ddebug_info *di, struct _ddebug *dp)
 {
 	struct _ddebug_class_map *map;
 	int i;
 
-	for_subvec(i, map, &dt->info, maps)
+	for_subvec(i, map, di, maps)
 		if (ddebug_class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1189,13 +1189,13 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 
 	seq_printf(m, "%s:%u [%s]%s =%s \"",
 		   trim_prefix(dp->filename), dp->lineno,
-		   iter->table->mod_name, dp->function,
+		   iter->table->info.mod_name, dp->function,
 		   ddebug_describe_flags(dp->flags, &flags));
 	seq_escape_str(m, dp->format, ESCAPE_SPACE, "\t\r\n\"");
 	seq_putc(m, '"');
 
 	if (dp->class_id != _DPRINTK_CLASS_DFLT) {
-		class = ddebug_class_name(iter->table, dp);
+		class = ddebug_class_name(&iter->table->info, dp);
 		if (class)
 			seq_printf(m, " class:%s", class);
 		else
@@ -1247,7 +1247,7 @@ static const struct proc_ops proc_fops = {
 
 static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
-	vpr_info("module:%s attached %d classes\n", dt->mod_name, dt->info.maps.len);
+	vpr_info("module:%s attached %d classes\n", dt->info.mod_name, dt->info.maps.len);
 }
 
 /*
@@ -1265,7 +1265,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	typeof(_dst) __dst = (_dst);					\
 	int __nc = 0;							\
 	for_subvec(_i, _sp, _box, _vec) {				\
-		if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {	\
+		if (!strcmp((_sp)->mod_name, (__dst)->info.mod_name)) {	\
 			if (!__nc++)					\
 				(__dst)->info._vec.start = (_sp);	\
 		} else {						\
@@ -1280,7 +1280,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
  */
-static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
+static int ddebug_add_module(struct _ddebug_info *di)
 {
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
@@ -1289,20 +1289,19 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	if (!di->descs.len)
 		return 0;
 
-	v3pr_info("add-module: %s %d sites\n", modname, di->descs.len);
+	v3pr_info("add-module: %s %d sites\n", di->mod_name, di->descs.len);
 
 	dt = kzalloc(sizeof(*dt), GFP_KERNEL);
 	if (dt == NULL) {
-		pr_err("error adding module: %s\n", modname);
+		pr_err("error adding module: %s\n", di->mod_name);
 		return -ENOMEM;
 	}
 	/*
-	 * For built-in modules, name lives in .rodata and is
-	 * immortal. For loaded modules, name points at the name[]
-	 * member of struct module, which lives at least as long as
-	 * this struct ddebug_table.
+	 * For built-in modules, name (as supplied in di by its
+	 * callers) lives in .rodata and is immortal. For loaded
+	 * modules, name points at the name[] member of struct module,
+	 * which lives at least as long as this struct ddebug_table.
 	 */
-	dt->mod_name = modname;
 	dt->info = *di;
 
 	INIT_LIST_HEAD(&dt->link);
@@ -1316,7 +1315,7 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
-	vpr_info("%3u debug prints in module %s\n", di->descs.len, modname);
+	vpr_info("%3u debug prints in module %s\n", di->descs.len, di->mod_name);
 	return 0;
 }
 
@@ -1379,7 +1378,7 @@ static int ddebug_remove_module(const char *mod_name)
 
 	mutex_lock(&ddebug_lock);
 	list_for_each_entry_safe(dt, nextdt, &ddebug_tables, link) {
-		if (dt->mod_name == mod_name) {
+		if (dt->info.mod_name == mod_name) {
 			ddebug_table_free(dt);
 			ret = 0;
 			break;
@@ -1399,7 +1398,8 @@ static int ddebug_module_notify(struct notifier_block *self, unsigned long val,
 
 	switch (val) {
 	case MODULE_STATE_COMING:
-		ret = ddebug_add_module(&mod->dyndbg_info, mod->name);
+		mod->dyndbg_info.mod_name = mod->name;
+		ret = ddebug_add_module(&mod->dyndbg_info);
 		if (ret)
 			WARN(1, "Failed to allocate memory: dyndbg may not work properly.\n");
 		break;
@@ -1497,7 +1497,8 @@ static int __init dynamic_debug_init(void)
 			mod_ct++;
 			di.descs.len = mod_sites;
 			di.descs.start = iter_mod_start;
-			ret = ddebug_add_module(&di, modname);
+			di.mod_name = modname;
+			ret = ddebug_add_module(&di);
 			if (ret)
 				goto out_err;
 
@@ -1508,7 +1509,8 @@ static int __init dynamic_debug_init(void)
 	}
 	di.descs.len = mod_sites;
 	di.descs.start = iter_mod_start;
-	ret = ddebug_add_module(&di, modname);
+	di.mod_name = modname;
+	ret = ddebug_add_module(&di);
 	if (ret)
 		goto out_err;
 
-- 
2.52.0

