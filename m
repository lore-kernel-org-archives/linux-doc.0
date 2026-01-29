Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F16537B417
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671856; cv=none; b=Mpuf21yBbvp5sC92cqKbpuMgQlxlq8WQ9disOt/1TCVO05DoJagyh6n30Slpj7JqIWaV86bYR02N9RlbPn3sB18LA75AL2Hih+rYh2KsO/bZavwKTeZm1UsanXtbsuaKXBX6FJ46NDVsxb04J6VwUSkPsOpFcWUKm1WU9XLc83Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671856; c=relaxed/simple;
	bh=Kzo7ou+IBrKlTJ/60MPn9UdhdpF5/xnJtQPjm+rNaog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d5FT6zVG3IrpEd0C6xIXt0osvWl0e1yny44azIvAQ9+VOxG+is2AjcsSOtrzhTBSx3hho8MpUxW6hRYNQepPIPf7HJ/XYvZoR2hOqx1s00iFMjRV8sINZumFV4fw8NT1MfKWaJYzxSvBf8tDrn0c0psjhEateatzXWrUkeUdzeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hlWHMXQN; arc=none smtp.client-ip=209.85.210.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hlWHMXQN"
Received: by mail-ot1-f68.google.com with SMTP id 46e09a7af769-7d18d0e6d71so357189a34.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671854; x=1770276654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bny+s30huE7yXnxNnb8RxyKxXZUke4dOfaAAcYamopo=;
        b=hlWHMXQN7R4Q5GEDlEZFdY5QRayEMSBwGIdjNW6hswyavVpFxqUCRs4maGgFPExerO
         4xITcw9MO8dU9CBB0MHOPjIwySunx1VndMG7EzDtiKnagLiIKWCb3H3Atoyh2RFXwjno
         CLHgX/A4YAlR3CMk8REILCY8vxZLE6de9CF1sppp85rS14C917wNGFA/mvjarJcBEPyq
         DRbB1Y6SA8nCMb+wofcipoxteuoz9U3elzi0K0YsCWvnjsVEIsxp7u3k3RV7aiAvZ2ih
         kzc50H1fjfJ5rxZA8uQKVPu3pXMwea8EEHrEj7A+YMjSfpZs7WW1uAmOOHtQWw/BGDYB
         4CrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671854; x=1770276654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bny+s30huE7yXnxNnb8RxyKxXZUke4dOfaAAcYamopo=;
        b=qQ4vR68Bp/KbcLlVc4KUKdOUq6/ay2kVyio3CWHXgQIAhSKYL3Yt2Jh7ztqxuRcVOg
         imSP7tePb06PTBNWs0WTwjncUVIkVKHqRYROlfJjAS8IVJvoc1DZBS8nSkRH9pW/ZRNg
         SL/2ibHiidVpPB2WH/JCRGV5ENH/eiPhw8eXhnyWMTfEhF4VfDj08BdNlGmgbXSsUX8C
         U/RFVFPqVTexB6Qi6d90MsJ0EEHEw3fItxQPv2HwgQmEk9Tu0XicarCXqrCizntHJHr8
         29D7vB5IkcD6eJj4rpPPbGReKrZWvUkMg4S5RFMySIyDYE1bnrow07j4zDwnabE7OPKh
         /MOw==
X-Forwarded-Encrypted: i=1; AJvYcCWJyV4NOVmkPogp1hgj+RbFgafD0lVxUU3F/itCV/sBjVYz2ZTFnUCEUZKRiYs7gNQav+rDjGvEAlI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIGru86rCGk/OrJGpHWLXhL7RmLyar/2GYVN2+BFX3FU3ZISJW
	O4CuRZCRbwCBQZQIL0x2k8nMnbSjwjZtttpPywmfiKaTulmq27ziEKAf
X-Gm-Gg: AZuq6aI5nrZnv1JmUOISbAD6NSJ0fdezhvVxceO+3KspmdfQLPdhe26C01jEqXJL85M
	mGLyTHIjJ64jYueWbTnzOlJkrtSEV0cry8sNc4GaUOFg6AjLIqso7CqtWgbYX17aVasufl/Ryw8
	VvV9758S0SQc1xOrDr2YMNha+gdBSzB3E7LdJ7Q4dbJC43TJtyOFEZGGgq+MskRv6mZ5ITorTcY
	rrV6Tbgg0m+5pCyVDqs2XHWvwSbHJLHFTi5aC24X/GPu3voiAzNrBG/uYL3/60qmBpgqeEeK0zz
	6S3koon/R7hKbdEb8RSKLx0RUSxFDuFQeBQ1hFqSSknqpe0kYJVyPhPPCQFvt2zCbntLTaXiF05
	xAf0gmR2VfErMAhPSfs+PYQx6hZUeYBp9EbHM4Bz0Ui4fwKMAoZnOsqgcsGi22TONowBahWLqJ4
	UetlAjOEv/l9F3pArP0+8IGFHz24/V6h6lDOuEoOUpHmS2jyG/RVU=
X-Received: by 2002:a05:6830:630c:b0:7c7:655c:7353 with SMTP id 46e09a7af769-7d1850b39abmr5816791a34.12.1769671853971;
        Wed, 28 Jan 2026 23:30:53 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7d18c69bf4csm3236541a34.9.2026.01.28.23.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:30:53 -0800 (PST)
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
Subject: [PATCH v9 18/32] dyndbg: move mod_name down from struct ddebug_table to _ddebug_info
Date: Thu, 29 Jan 2026 00:29:04 -0700
Message-ID: <20260129072932.2190803-19-jim.cromie@gmail.com>
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
index b84518b70a6e..34dbca0beaf8 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -108,6 +108,7 @@ struct _ddebug_class_maps {
 };
 
 struct _ddebug_info {
+	const char *mod_name;
 	struct _ddebug_descs descs;
 	struct _ddebug_class_maps maps;
 };
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index c2c450e3daa3..eb33b6c8d765 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -46,7 +46,6 @@ extern struct _ddebug_class_map __stop___dyndbg_class_maps[];
 
 struct ddebug_table {
 	struct list_head link;
-	const char *mod_name;
 	struct _ddebug_info info;
 };
 
@@ -254,10 +253,11 @@ static int ddebug_change(const struct ddebug_query *query,
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
@@ -269,8 +269,8 @@ static int ddebug_change(const struct ddebug_query *query,
 			valid_class = _DPRINTK_CLASS_DFLT;
 		}
 
-		for (i = 0; i < dt->info.descs.len; i++) {
-			struct _ddebug *dp = &dt->info.descs.start[i];
+		for (i = 0; i < di->descs.len; i++) {
+			struct _ddebug *dp = &di->descs.start[i];
 
 			if (!ddebug_match_desc(query, dp, valid_class))
 				continue;
@@ -290,7 +290,7 @@ static int ddebug_change(const struct ddebug_query *query,
 #endif
 			v4pr_info("changed %s:%d [%s]%s %s => %s\n",
 				  trim_prefix(dp->filename), dp->lineno,
-				  dt->mod_name, dp->function,
+				  di->mod_name, dp->function,
 				  ddebug_describe_flags(dp->flags, &fbuf),
 				  ddebug_describe_flags(newflags, &nbuf));
 			dp->flags = newflags;
@@ -1157,12 +1157,12 @@ static bool ddebug_class_in_range(const int class_id, const struct _ddebug_class
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
 
@@ -1190,13 +1190,13 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 
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
@@ -1248,7 +1248,7 @@ static const struct proc_ops proc_fops = {
 
 static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
-	vpr_info("module:%s attached %d classes\n", dt->mod_name, dt->info.maps.len);
+	vpr_info("module:%s attached %d classes\n", dt->info.mod_name, dt->info.maps.len);
 }
 
 /*
@@ -1266,7 +1266,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	typeof(_dst) __dst = (_dst);					\
 	int __nc = 0;							\
 	for_subvec(_i, _sp, _box, _vec) {				\
-		if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {	\
+		if (!strcmp((_sp)->mod_name, (__dst)->info.mod_name)) {	\
 			if (!__nc++)					\
 				(__dst)->info._vec.start = (_sp);	\
 		} else {						\
@@ -1281,7 +1281,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
  */
-static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
+static int ddebug_add_module(struct _ddebug_info *di)
 {
 	struct ddebug_table *dt;
 	struct _ddebug_class_map *cm;
@@ -1290,20 +1290,19 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
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
@@ -1317,7 +1316,7 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
-	vpr_info("%3u debug prints in module %s\n", di->descs.len, modname);
+	vpr_info("%3u debug prints in module %s\n", di->descs.len, di->mod_name);
 	return 0;
 }
 
@@ -1380,7 +1379,7 @@ static int ddebug_remove_module(const char *mod_name)
 
 	mutex_lock(&ddebug_lock);
 	list_for_each_entry_safe(dt, nextdt, &ddebug_tables, link) {
-		if (dt->mod_name == mod_name) {
+		if (dt->info.mod_name == mod_name) {
 			ddebug_table_free(dt);
 			ret = 0;
 			break;
@@ -1400,7 +1399,8 @@ static int ddebug_module_notify(struct notifier_block *self, unsigned long val,
 
 	switch (val) {
 	case MODULE_STATE_COMING:
-		ret = ddebug_add_module(&mod->dyndbg_info, mod->name);
+		mod->dyndbg_info.mod_name = mod->name;
+		ret = ddebug_add_module(&mod->dyndbg_info);
 		if (ret)
 			WARN(1, "Failed to allocate memory: dyndbg may not work properly.\n");
 		break;
@@ -1498,7 +1498,8 @@ static int __init dynamic_debug_init(void)
 			mod_ct++;
 			di.descs.len = mod_sites;
 			di.descs.start = iter_mod_start;
-			ret = ddebug_add_module(&di, modname);
+			di.mod_name = modname;
+			ret = ddebug_add_module(&di);
 			if (ret)
 				goto out_err;
 
@@ -1509,7 +1510,8 @@ static int __init dynamic_debug_init(void)
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

