Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9934435E923
	for <linux-doc@vger.kernel.org>; Sat, 23 May 2026 07:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779520533; cv=none; b=nBBSzySqKKPRBQNg+Jj0FLNtli1/3hcp6F2SVpZCYxFtf6uliMocZZksRHOaVF3fdmTDtEZX0Xe8Un2nKFMevpOIKuMTglAIPBCSNfBVaMwyDdnAlvjo8vYl+FSDcHCWuwuaHymOtIiNLjxp77BTPaWohECi1vZtrrZoLnU09/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779520533; c=relaxed/simple;
	bh=acmpE5f+cy4H0euAd/sWLVbXBhuyRVdVfvkTY1QfTl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lkvlw0TwbMIvZScm++DZrsoKVl6Cq9G2PYWsf4+VGHMm2vcAHOr/2xAi+6eCHqfP7vFHFbp7PGt8FiNPfowdEnqaaGcfpIDAuNVkJgRhozv6AgGifP4mCA3gGUKzc7pKPaA7tq4LtKUuQpLfHeydahKxbUlLK1eJ0eTobDlWxUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxxfzpKF; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxxfzpKF"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-452169ae568so5245029f8f.3
        for <linux-doc@vger.kernel.org>; Sat, 23 May 2026 00:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779520529; x=1780125329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Inkv515K3CDOqGmxKUbJA66Ndin1wkzy98GUXdhIoyc=;
        b=mxxfzpKFQLv/7ag+vvXGxDsuILctm7/pEpYZRMdTe5mKxLbRf0qYZ/gSm6r+PxjJy5
         a+z2C0MXJcysZu3SMpV8t4X7A3zhccRscwiVXl4Fih2A7VuqVw5lFSmpJOMHxqhpLgPe
         PV9G4lECnPeeUX7LGSHPwcOX395GARUl1qibhbgmu+agawoQ+yObUByTs7URUSkd8uXB
         H5p0EqYIYa8A+YV9Y9YxjfPGNyzDdGTAZAzH8qLq5bE6qaow/aP0fC4pIU9lZa8bV3WZ
         Id68iJQAlgkbBcOvDqM2C2RUvMK+aXaIRpG7GY+lsRAQ3pWtFSsdgN53wTSn36UVJT5y
         yemg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779520529; x=1780125329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Inkv515K3CDOqGmxKUbJA66Ndin1wkzy98GUXdhIoyc=;
        b=A2/tQ8XSQqN0w2CYSsQn3zH387cuvazYW8Tgl7181vmn8a2zG3IbJ9Ys4dFTbNgSE1
         pVXK1172FssfV6YGL2mAiA7D9e8mppTWAPIA1Toqim9Q784t7dALSU+zpF8IhV3K/HB+
         RmyKAxhsn1vXhHkioq5ZQUNrX+mFJ3Gf5d7ufEfHkVaXCk3EBZw1cifEdx9N7ipP2UaE
         mSUThHyrwsHei+AmAgnF3ME3Q3wxox6BRCyZV6QCoPjOfr1JDJG8o3dHbD+6Y9WIVydE
         YFmqnO7bSow7idAz7j0DH9k4niTzw3mf1vYogVG7TyDTJPMNojFZ9qZ9tmXc/ZW/POUX
         EJwA==
X-Gm-Message-State: AOJu0Yzmorf1TOgMY3I4AXGzb/+bmr0Y+Dr1M/ORWcPEta4Q1g5vk5rf
	ByDjC2SQyrmzUi5TCS4jSHRGMX/st10Nd4rnpJElPXFvU24yLsbxA4aT
X-Gm-Gg: Acq92OEFLJcpz5rNM2QoUvPs/RqaEhuiiw2kTGbSPgi9rx2DkENuEbSSi0PleFjiD0k
	mFSFoJREtFTbbCvS8tML1ixUE+2G65Q+viRZ7HO3ZP7u9kYcYr20i+KqGqmFUl0DiT6DnoVh5ED
	tP1VNQnhib4kGFTLMhFnaEZOHActqUg1D8+Ta35OcJBCaxnjIn6h+RyUYtUCER4LxDLS1hzKpD6
	YpMnRhx+47l4yY7wjDSucrHo0IgJz3R6UxNkVViaGru09cMVjdvh2KZlKlluOVdQZfbYg0oLUGm
	lNaI7iswUxLZFgIMkdri5yrLIbwHnru5cVx3FFWZO2RkALa9VN9Ny2PLg2kIdPcykXjv1yN5r+S
	QkxphU1SvJ7c9I5NsOI96huC65z4csbE7eAiEogyfKPITVYldsYdJbo3KoElfllczxzP1DqF6mp
	zJS5rDK9FIAwQM/Ie4zg3+xYp50MiLwPJ+fhvZ3XM=
X-Received: by 2002:a05:6000:610:b0:45e:742c:f195 with SMTP id ffacd0b85a97d-45eb3690ba8mr10344352f8f.12.1779520526578;
        Sat, 23 May 2026 00:15:26 -0700 (PDT)
Received: from [192.168.0.174] ([31.96.183.250])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb76sm8639838f8f.25.2026.05.23.00.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 00:15:26 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 23 May 2026 01:14:49 -0600
Subject: [PATCH v2 16/24] dyndbg: replace classmap list with an array-slice
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-dd-maint-2-v2-16-b937312aa083@gmail.com>
References: <20260523-dd-maint-2-v2-0-b937312aa083@gmail.com>
In-Reply-To: <20260523-dd-maint-2-v2-0-b937312aa083@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Jason Baron <jbaron@akamai.com>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779520485; l=6627;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=acmpE5f+cy4H0euAd/sWLVbXBhuyRVdVfvkTY1QfTl8=;
 b=+LlT89h5Zas1rnf6o1vCdzF04GdcJrVVBC0DVNyp/lojUnxHBDsi3KbK2sf4iEP6Z6JU0GAQD
 gRp8te91A/gDPQKNAolv23w1WGUsRCb95To3FYv6z7PAbLpnCZHB4aQ
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

Classmaps are stored in an elf section/array, but currently are
individually list-linked onto dyndbg's per-module ddebug_table for
operation. This is unnecessary.

Just like dyndbg's descriptors, classes are packed in compile order;
so even with many builtin modules employing multiple classmaps, each
modules' maps are packed contiguously, and can be treated as a
array-start-address & array-length.

So this drops the whole list building operation done in
ddebug_attach_module_classes(), and removes the list-head members of
the classmap structs.  The "select-by-modname" condition is reused to
find the start,end of the subrange of classmaps belonging to the module.

NOTES:

There are multiple modules named "main" but thats an artifact of how
KBUILD_MODNAME gets its value, and none of those repeats are
contiguous.  The legacy code segmenting the builtin descriptors
depends upon this, we are "reusing" that dependency.

The "filter-by-modname" on classmaps should really be done in
ddebug_add_module(1); ie closer to dynamic_debug_init(2), which
already splits up pr-debug descriptors into subranges by modname, then
calls (1) on each.  (2) knows nothing of classmaps currently, and
doesn't need to.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v2: RvB after SoB
---
 include/linux/dynamic_debug.h |  1 -
 lib/dynamic_debug.c           | 65 +++++++++++++++++++++++--------------------
 2 files changed, 35 insertions(+), 31 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index e724f6b93663..0a137a586510 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -73,7 +73,6 @@ enum ddebug_class_map_type {
 };
 
 struct ddebug_class_map {
-	struct list_head link;
 	struct module *mod;
 	const char *mod_name;	/* needed for builtins */
 	const char **class_names;
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index d4cce0f4f197..7f03b331d185 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -46,10 +46,11 @@ extern struct ddebug_class_map __start___dyndbg_classes[];
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
@@ -150,12 +151,13 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
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
@@ -166,7 +168,6 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	return NULL;
 }
 
-#define __outvar /* filled by callee */
 /*
  * Search the tables for _ddebug's which match the given `query' and
  * apply the `flags' and `mask' to them.  Returns number of matching
@@ -228,7 +229,7 @@ static int ddebug_change(const struct ddebug_query *query,
 	unsigned int nfound = 0;
 	struct flagsbuf fbuf, nbuf;
 	struct ddebug_class_map *map = NULL;
-	int __outvar valid_class;
+	int valid_class;
 
 	/* search for matching ddebugs */
 	mutex_lock(&ddebug_lock);
@@ -1061,9 +1062,10 @@ static void *ddebug_proc_next(struct seq_file *m, void *p, loff_t *pos)
 
 static const char *ddebug_class_name(struct ddebug_iter *iter, struct _ddebug *dp)
 {
-	struct ddebug_class_map *map;
+	struct ddebug_class_map *map = iter->table->classes;
+	int i, nc = iter->table->num_classes;
 
-	list_for_each_entry(map, &iter->table->maps, link)
+	for (i = 0; i < nc; i++, map++)
 		if (class_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
@@ -1147,30 +1149,34 @@ static const struct proc_ops proc_fops = {
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
+		} else if (nc) {
+			/* end of matching classmaps */
+			break;
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
@@ -1202,10 +1208,9 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 	dt->num_ddebugs = di->num_descs;
 
 	INIT_LIST_HEAD(&dt->link);
-	INIT_LIST_HEAD(&dt->maps);
 
 	if (di->classes && di->num_classes)
-		ddebug_attach_module_classes(dt, di->classes, di->num_classes);
+		ddebug_attach_module_classes(dt, di);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);
@@ -1318,8 +1323,8 @@ static void ddebug_remove_all_tables(void)
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
2.54.0

