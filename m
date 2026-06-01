Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A83F3A63FB
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 12:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780315555; cv=none; b=MnPc4PcBwpeqkRbdaVtU/TvBwEEiAUiP7glFlJBW+tW9VHpTC5Hg43Nn/VB7vBR5sp94lCBg0tN60gFgAmgmfvJ9Rlwkk7qvWP+CbUMDIAxFiLdHjGM2GY/DwPioJv1aAHT8ey9mWXeRRs4vtKA3SBFVD7n6mTrFg9wGOjG4DI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780315555; c=relaxed/simple;
	bh=y6p3A6uJDF/yDiP/b063q30riIoq+nmeL3g433fxlDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q6+MO1/mrAWC+OcVb15t2MHJXHaDr5y7NkHQQGmFUt4eVFGhErJZ/6zS0Tzid/QBAKC9TN4T8Ml7eqn8rin9YDaUnBN8iT9L4vMYAfUMrEHgrA2IWkqCtJk7KltU9fkCS1bDaxcwU8UdaoprToe9bkCseOK0yhXmxiJGVmwJDfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qaRysFnm; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qaRysFnm"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4905e190c71so92368905e9.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 05:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780315550; x=1780920350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHXrjdw657eeJgY3cFQAuPQpAizodk0A5lck6/SEBoE=;
        b=qaRysFnmhSPtCqTjxHUjGGvL2FmZtHkFfZ74Df6M6Y+t9P9LOvpUgAWtalMxMYXE1m
         LcdYBy4K8bkvqromCMxGNFnX19NVKZZK6ip8KYAxxfLloOXsSjLJCHCs7Y/AGnmgcWPB
         t3ZkbJaxUJxzDKt+pcrQefSDxtDDRTnTjzLtBAK+tzbwHCji5S+/qEkRTDnESnecVCSa
         PQDBgys40dxBpBtKQALWcYzlisBoB6gjdf+ABRXncUDDCEFLR5GpuzBzedFIoM7xJ2Rh
         uRhkDNVNkCQevxUVuA5Whp8YaMjsHs4l8kNtKrGflhaMiUNj+jjgWI6f2HgMlhxENaX2
         HlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780315550; x=1780920350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YHXrjdw657eeJgY3cFQAuPQpAizodk0A5lck6/SEBoE=;
        b=ScC5LNHtC4zEWIu8EouyHMb6xfEiOReMSYbDOpsqjZfqHpRz9V3VHmdnEToNmeL4t+
         GC9cUTuJStafWbKsJT3RmS+cPMavUIr7MLaub6II9WUNtyG86XJnlobQjFA1khoOCf8r
         PLBKcgjMhf7Kp4jpw+35RAQwQURdeFtZ9NSDADBmonnl4yRAwoUAIvdSQf0FyPjFMmTq
         4Ra5UyE+82TI1FzEpImrbKLfhn2sVNrnkBUOaUuJ5nEaTp+hfOwWFaG5MbuEPMuAzhe1
         DJtOKwQmWyHPOUk4PVUyiarouKXcj0/cIhGl7YGn8whduxnkf0E04c5QwQn8lo0O95qF
         aClw==
X-Gm-Message-State: AOJu0YxajciYTEYtif8Ihdp08PUGWYM/cRogLydR4Ncx+7jXUsnbEYWg
	Wa2DmqAtKqGtMdBNs6bAeFumeqBcXm73Ejpf1isc/MZQnnEAE5bXs2b8
X-Gm-Gg: Acq92OFPPeDQ3z0TrPIUb7wZs0roRFrdyBbbgfItNol5ecQtfATwfFFy5nLtPedyxev
	1PAHNbTCum9WKqpYd71RqqWxI5rTG2sWDRWKh/jR/She1i/2ZR9T1NlQYrGF9XS0XLhErVCOXh0
	lnXIIhqCER1mLzzGxfDoMdD9APJGSPcyknrhNeyDCluZNy4iHjxdV4LbCPKDbwKUMay0fZdvXnw
	ZtCI3RXNDJaLJKFF7pC/wCttiPXpmm/xvFzQimypLG46pDXs/tOD9GWIWsF4coH0sIzdpcEFnLg
	DkdGWCrji5qMSvJJ5qsdUuNQy91huOgy0qfqEEk37JL6KrATgFNwYbwwJk5KXSbSoopPzWUuOky
	/vljyZTZ8CMLrq1j5vBoQyKBkYoXjSb5pjLs52FwX7eqwLU34wnsijhqI9q6G/sG6YgdL1iuQJE
	eZW8Bu/Q6YQSUx1BAv1I+76SmKdKiYO7IvAa5PUs8HDQ==
X-Received: by 2002:a05:600c:3b27:b0:490:958f:2a5c with SMTP id 5b1f17b1804b1-490a292fbb2mr193246165e9.17.1780315549539;
        Mon, 01 Jun 2026 05:05:49 -0700 (PDT)
Received: from [172.16.188.153] ([213.181.114.83])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4909c152570sm103972805e9.9.2026.06.01.05.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:05:49 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Mon, 01 Jun 2026 12:05:06 +0000
Subject: [PATCH v3 20/24] dyndbg: move mod_name down from struct
 ddebug_table to _ddebug_info
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-dd-maint-2-v3-20-4a15b241bd3c@gmail.com>
References: <20260601-dd-maint-2-v3-0-4a15b241bd3c@gmail.com>
In-Reply-To: <20260601-dd-maint-2-v3-0-4a15b241bd3c@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780315495; l=7732;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=y6p3A6uJDF/yDiP/b063q30riIoq+nmeL3g433fxlDE=;
 b=/rFIm7r3rRYlv8rITsVUoxHcg4xOqCUeGvEjMyejwKauQf4V2MBeJLztnXjbYX2wacd0pGwB4
 jkWy4QvlPjgBMfOXYkv6A4QFo0asElRQtoNnBKfjjtk8Yx7ag900EE5
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

struct _ddebug_info already has most of dyndbg's info for a module;
push debug_table.mod_name down into it, finishing the encapsulation.

This allows refactoring several callchains, passing &_ddebug_info
instead of &ddebug_table, and hoisting the "&dt->info" deref up
instead of repeating it thru the callchans

ddebug_table contains a _ddebug_info member, so its users keep access
to mod_name, just now with "->info." added in.

In static ddebug_add_module(&di), reinforce the cursor-model by
dropping the modname arg, and setting di->mod_name at each caller.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v2: move RvB after SoB

old-v12
. moved up 1 position in series, ahead of hoist...
---
 include/linux/dynamic_debug.h |  1 +
 lib/dynamic_debug.c           | 50 ++++++++++++++++++++++---------------------
 2 files changed, 27 insertions(+), 24 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 8fc315d0e5a5..e4a62cb73267 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -97,6 +97,7 @@ struct _ddebug_class_maps {
 };
 
 struct _ddebug_info {
+	const char *mod_name;
 	struct _ddebug_descs descs;
 	struct _ddebug_class_maps maps;
 };
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 0995cbef6f47..ebfff48c4a6c 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -46,7 +46,6 @@ extern struct _ddebug_class_map __stop___dyndbg_class_maps[];
 
 struct ddebug_table {
 	struct list_head link;
-	const char *mod_name;
 	struct _ddebug_info info;
 };
 
@@ -245,10 +244,11 @@ static int ddebug_change(const struct ddebug_query *query,
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
@@ -260,8 +260,8 @@ static int ddebug_change(const struct ddebug_query *query,
 			valid_class = _DPRINTK_CLASS_DFLT;
 		}
 
-		for (i = 0; i < dt->info.descs.len; i++) {
-			struct _ddebug *dp = &dt->info.descs.start[i];
+		for (i = 0; i < di->descs.len; i++) {
+			struct _ddebug *dp = &di->descs.start[i];
 
 			if (!ddebug_match_desc(query, dp, valid_class))
 				continue;
@@ -281,7 +281,7 @@ static int ddebug_change(const struct ddebug_query *query,
 #endif
 			v4pr_info("changed %s:%d [%s]%s %s => %s\n",
 				  trim_prefix(dp->filename), dp->lineno,
-				  dt->mod_name, dp->function,
+				  di->mod_name, dp->function,
 				  ddebug_describe_flags(dp->flags, &fbuf),
 				  ddebug_describe_flags(newflags, &nbuf));
 			dp->flags = newflags;
@@ -1078,12 +1078,12 @@ static bool ddebug_class_in_range(const int class_id, const struct _ddebug_class
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
 
@@ -1111,13 +1111,13 @@ static int ddebug_proc_show(struct seq_file *m, void *p)
 
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
@@ -1178,7 +1178,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	 * and length of the subrange at its edges.
 	 */
 	for_subvec(i, cm, di, maps) {
-		if (!strcmp(cm->mod_name, dt->mod_name)) {
+		if (!strcmp(cm->mod_name, dt->info.mod_name)) {
 			if (!nc) {
 				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
 					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
@@ -1192,7 +1192,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	}
 	if (nc) {
 		dt->info.maps.len = nc;
-		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
+		vpr_info("module:%s attached %d classes\n", dt->info.mod_name, nc);
 	}
 }
 
@@ -1200,27 +1200,26 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
  */
-static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
+static int ddebug_add_module(struct _ddebug_info *di)
 {
 	struct ddebug_table *dt;
 
 	if (!di->descs.len)
 		return 0;
 
-	v3pr_info("add-module: %s %d sites\n", modname, di->descs.len);
+	v3pr_info("add-module: %s %d sites\n", di->mod_name, di->descs.len);
 
 	dt = kzalloc_obj(*dt);
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
@@ -1232,7 +1231,7 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	list_add_tail(&dt->link, &ddebug_tables);
 	mutex_unlock(&ddebug_lock);
 
-	vpr_info("%3u debug prints in module %s\n", di->descs.len, modname);
+	vpr_info("%3u debug prints in module %s\n", di->descs.len, di->mod_name);
 	return 0;
 }
 
@@ -1295,7 +1294,7 @@ static int ddebug_remove_module(const char *mod_name)
 
 	mutex_lock(&ddebug_lock);
 	list_for_each_entry_safe(dt, nextdt, &ddebug_tables, link) {
-		if (dt->mod_name == mod_name) {
+		if (dt->info.mod_name == mod_name) {
 			ddebug_table_free(dt);
 			ret = 0;
 			break;
@@ -1315,7 +1314,8 @@ static int ddebug_module_notify(struct notifier_block *self, unsigned long val,
 
 	switch (val) {
 	case MODULE_STATE_COMING:
-		ret = ddebug_add_module(&mod->dyndbg_info, mod->name);
+		mod->dyndbg_info.mod_name = mod->name;
+		ret = ddebug_add_module(&mod->dyndbg_info);
 		if (ret)
 			WARN(1, "Failed to allocate memory: dyndbg may not work properly.\n");
 		break;
@@ -1413,7 +1413,8 @@ static int __init dynamic_debug_init(void)
 			mod_ct++;
 			di.descs.len = mod_sites;
 			di.descs.start = iter_mod_start;
-			ret = ddebug_add_module(&di, modname);
+			di.mod_name = modname;
+			ret = ddebug_add_module(&di);
 			if (ret)
 				goto out_err;
 
@@ -1424,7 +1425,8 @@ static int __init dynamic_debug_init(void)
 	}
 	di.descs.len = mod_sites;
 	di.descs.start = iter_mod_start;
-	ret = ddebug_add_module(&di, modname);
+	di.mod_name = modname;
+	ret = ddebug_add_module(&di);
 	if (ret)
 		goto out_err;
 

-- 
2.54.0

