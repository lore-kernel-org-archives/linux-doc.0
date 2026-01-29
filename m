Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A5937AA8A
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671842; cv=none; b=QT+f4SprttK0bsdJ7Cy2s2MTqD/hSm+G69bYxl3621VJWXkknez4MhCqfsOhN5gfOOK+qA/cPqEWccLtwmb8zs1VUA6jxgVqBwePu/ZZICPWOpU4cMMlwSPKNZpNDu69RaKcYoD97nQf8GTNoWCDzqzUuGKWjcG4KzRfVRmKMYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671842; c=relaxed/simple;
	bh=yf+hWhCPGtHhaCCfxlqg39TFAaE2a5iud0MQPJ3rjfQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=utR3WUuBLxhx/NwoX3HxrNkG0BT1raVEF6+Racfa401g+JAKJyw8EtRFaXFD7DO6ZtQQRpMFtWNbq/WRvpnIyAnAMtb/uifHbMUDmW71500XOg9KrzNsCcPbx+qkbjjaTFQ7aM7HrAEbNeKlhc6xL5+ilE75dgKfrBFSYZYqkpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+OZSHqq; arc=none smtp.client-ip=209.85.210.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+OZSHqq"
Received: by mail-ot1-f67.google.com with SMTP id 46e09a7af769-7cfccba483eso241624a34.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:30:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671840; x=1770276640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6IUE+H0zCaZQp3fjiKV6AFLoMrjK4DOG9dupNImfI0=;
        b=F+OZSHqqOVJT3tEeep1me+T+FoelK2jiTL6hxYnLhC4r+TXAP7nI32pXfDqrFljX09
         8h/Zcuw7yuHuG3USPuBwtHLGh2RW4JTl2Jb3NRaTaUz1uRI3xjwjcObx7mfXUFpi/rBF
         1DRz6yS5jfMJFWWDk/v3PbJC87P69sjSDxlh5MPw2xde5+Or+em6n7ZgA23PyNAhWgnL
         eCuwuDTK/zLKkL+Z0k36BfryFU7AfyZgZSNrmzjM6zwR/EJV7JAgY2U6AlTxj08WLUPG
         CEs1jeP1AeGbXKmV2l9xJBc+I0zDzKeUl+ZQllDAKYCNCOShgIYEsjMAWP5zGsHQyds2
         Dsew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671840; x=1770276640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g6IUE+H0zCaZQp3fjiKV6AFLoMrjK4DOG9dupNImfI0=;
        b=QIgGd24SivyoD/3oYLcdDbLqtw9ilj16lSKvULVqworgxbMQNVN4A6XVJOVhy+lt86
         E9ZFbTMrmk4ISFpHfhexbEm5cjDcps/wyW34UuyaWP+03HJAETuFsA+0GCQewQWfwjPV
         6ceBhnAGvCPw+UHwR7ek0Tj7Lx/RjPSigjisU9lPR8Tsu4a1Y1zKKKnLMgc752FrjcK+
         ILaM6dZVaasd9kHBEnl87VazKTjF5eL1K859TcOpxBZypef3tbbxLX+2fD7OXMrPeqkc
         hP5C6ECi3ldRv7ozlvAbsHwNWkxGnMnGC2+9XWGx4TYuasrVxFJPhZ2QZ2mNBy7EwiSN
         Cl8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWUJn5vgIaf9qIZEot1pVYqgDpa15HGq50LWr5vTzZLl27hUJHVguXv2VWRbA26GJGUMb4BLD2MPFo=@vger.kernel.org
X-Gm-Message-State: AOJu0YznIZYOgwEt/JNHB/ZAqUTrWoF4Lc9lGoaAxC4Kc6e0fAbbOJDi
	doYtXjesxni0MG5/Jx+K5YhogiByXN7TBi6oO02rtWKebsPQ93HCsST2
X-Gm-Gg: AZuq6aLWtnrJgRGbdGDbNRw7Rpk2FUO3/6Zji3KL2ZTBhzDdmUXoYm70VHvdElBV9kc
	mduaMemGohWNmxon+n9RjXfkUyUvzndUM/rbG2WHcxZxcQILIVh0EeoFVD5oKeUaFjCSOBYzu2c
	RivQfaqSTkRmdYfC9/ZI2k0VVdbg04OSdrqCdFSbtog/PiaCFu7G1smNyVairRGObl3Vr6bXZup
	AnVKSGlke15m4Psa64bGQT4UdeTtld+rV7ZwfJSXq0Fb4AXTtqVIEEKXSQA6aCZHyJdwallMpgL
	bbKjTO3BPh0L48tSossbcKxKtLwn3bPqu86ZaiPTuiiX0QXH9hbAiBbI1/XX1z3w0eFlCmuWHBe
	8EDyzK9VA21sPtR6BP2sIq5lpoqQsVKfjqI8jdUeY+IueV9mGME30QkFbngUnmFYkj0ZZnwoPkn
	+HvHCPQXrC24/aTVi3OUR09dYYN1dxgkPnbbVtTZ8J
X-Received: by 2002:a05:6830:4425:b0:7b0:826e:4002 with SMTP id 46e09a7af769-7d1850e65b8mr5011116a34.20.1769671839819;
        Wed, 28 Jan 2026 23:30:39 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7d18c7cf619sm3250070a34.16.2026.01.28.23.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:30:39 -0800 (PST)
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
Subject: [PATCH v9 14/32] dyndbg: replace classmap list with a vector
Date: Thu, 29 Jan 2026 00:29:00 -0700
Message-ID: <20260129072932.2190803-15-jim.cromie@gmail.com>
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
index 92627a03b4d1..9fd36339db52 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -84,7 +84,6 @@ enum class_map_type {
 };
 
 struct ddebug_class_map {
-	struct list_head link;
 	struct module *mod;
 	const char *mod_name;	/* needed for builtins */
 	const char **class_names;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index c116a3d5e6b5..7029c9c4bfbf 100644
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
@@ -149,12 +150,13 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
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
@@ -165,7 +167,6 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	return NULL;
 }
 
-#define __outvar /* filled by callee */
 /*
  * Search the tables for _ddebug's which match the given `query' and
  * apply the `flags' and `mask' to them.  Returns number of matching
@@ -227,7 +228,7 @@ static int ddebug_change(const struct ddebug_query *query,
 	unsigned int nfound = 0;
 	struct flagsbuf fbuf, nbuf;
 	struct ddebug_class_map *map = NULL;
-	int __outvar valid_class;
+	int valid_class;
 
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
@@ -1134,9 +1135,10 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 
 static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
 {
-	struct ddebug_class_map *map;
+	struct ddebug_class_map *map = iter->table->classes;
+	int i, nc = iter->table->num_classes;
 
-	list_for_each_entry(map, &iter->table->maps, link)
+	for (i = 0; i < nc; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1220,30 +1222,31 @@ static const struct proc_ops proc_fops = {
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
@@ -1275,10 +1278,9 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	dt->num_ddebugs = di->num_descs;
 
 	INIT_LIST_HEAD(&dt->link);
-	INIT_LIST_HEAD(&dt->maps);
 
 	if (di->classes && di->num_classes)
-		ddebug_attach_module_classes(dt, di->classes, di->num_classes);
+		ddebug_attach_module_classes(dt, di);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
@@ -1391,8 +1393,8 @@ static void ddebug_remove_all_tables(void)
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

