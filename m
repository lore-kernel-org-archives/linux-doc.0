Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74A73C0A15
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 02:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783477151; cv=none; b=BdxrZXr+gtf4F7JclbZtz8fSvhcGTQT26/bEaK7peSKuLaZ2FendbxGUd3AP4+LL5BgiDSPBPA8VdfzpNFFfN+u2CYgOFrV6MP3WMTJlxv0EciKp+oanuiqMlJjc/Iq8yWBZOhW1Fw+66wzFv9Qv/95EtyX8bcPq9baw0ef0PnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783477151; c=relaxed/simple;
	bh=y6qM/kqNwYmuj1o8I5+E9cTtId3LZfSsuD6PkviU3E8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tl/rzLB9LDysnbDGrSKQcG2wtsO1fKeUPiTWsl17lmxY5jps9Do+TfydZCKBhKHzj5mMCeyITYEO7rYoLl+al5k461+YlODCpF2s+mi6e6KpxQgdmdDvCvKEQKLvms7IPWaVjej3p8IvUrCv9fOQC41KNjen6LLDFfWScRn3f8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EL1k3mJ+; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EL1k3mJ+"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-495b98b4f6aso91899b6e.2
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 19:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783477147; x=1784081947; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TI/qT4p9NQ5m/zckRNwVJN2R51Z23VJQglm9K8Zvmjw=;
        b=EL1k3mJ+BF2vIn9fQvzJy2uFwyFn9ur5sHZU6nBd9d3INut7WN8uwNzj1xoKzYXRxL
         tk3LyuQNwQxKPc7f9U0wu6DyNdBd2XERCa9GTIkZxRljIRSKbTmrMgOqei69dBFsvdIz
         0kEhmyqn02AwAaiM2hYKGqM3RNA+1gqhg/bFhuu9+ucZJsq9O11PIxXa+vlB/j6Y1hvW
         iMkEgI6cuQ2l3d6HHWHbL2Csi73DDE8JI+cxwexJi9ZC5XrAySAw/l53WQkH3ZzFpJ0M
         BDB/vKxJfTshgieh43ivVia3DwO7yJHLj8WEJCalt28iHu5hg2VgiJlPLixI/K8LyuFv
         Ny+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783477147; x=1784081947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TI/qT4p9NQ5m/zckRNwVJN2R51Z23VJQglm9K8Zvmjw=;
        b=QYBTxZcrzSce3J9kWw/fSWkH5mBcuT73J3rt7ZmPMIeQ7WAybGCUW8H87PCwQV2+zf
         4Sm5V9kUtOz2ptNs80pJ1XOdbRY9kzZJnerXOIYKAMGTBJkeLVAkNeEO6eB8b2T00wAS
         d6DERMZcMTvkbrPDnH/S26vMdtrXv0pLUs3Fv5SdgdD1vOTM4Mlx4q7/r8awzhBDg+G+
         6N/+RjeOnZiH4hElz0S3oYPJw0AbYw3JGWnMN/DNBA0L2GNTgpMzaZNareXtzkmCoxj+
         WulkCiojdMrpNZ11zPsfJsLIn+LbGQBLPEr9dbqtojJbuonSMIR0/rmp5aaf/rGzYH1E
         Hc1g==
X-Forwarded-Encrypted: i=1; AFNElJ9SAzb3t1fMvVOLDjpEj4pVsYSr0SNtbXp13OjMdfoUiJaDNDIbOG1Kto/9V2eWOBBWGTe5xguwqoA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxH5U2JCAdLe9yxUvZWMrSz1MNipDmVzUrklq3ytIwf4FHNuJ9+
	gr7r5+u/FrDhxqx/BVyP71+pK5Mu1uUzSVu9EvHIip/S7JhMqJqLpRCW
X-Gm-Gg: AfdE7cltoFgS/lvpeG0PvwGbtcSKPmssGy0xH5BHPC6IYOVuWFofGTK2BiJ1++BFGnn
	0beul2NqjSbQRzRridXlGYn0JeyCY+wP3u+JsWJEbL3kZ87mxH3Te/mP+YtB1Oa90A8IaxdKD/w
	nTjB9J6txQ3JaXvUVR/PKQtqdln0Q8pM7QNyvlGlnXGX//Rs8NLlXeSZx2aShJtWUiCeXw1RRvI
	8LA9B1KI5uFUa7QCzh4hWWwZ/wqMq+Mo+GX6GCh5y+69GK8SSKBLjSqRyT7kBkqkgqO8DV++kdJ
	pPmwods2SUO2qTC0XFw3EaWhZ96rOQy/zykxbW4TaukAZMu4w49ftKBbcPCvAZWmvPlRTAOVCgF
	t5qaUqG/WHjNxtFwWUI+YTm80dtYalF6ASJ1/WhrWogd6wWuVyUAdRNw5hWM98Py5j1zFZtl6QC
	D0QMEHt0hmKQscrx5TPfBkH027lCagx5eiKB8QE9XYk86hAfQ0SbI=
X-Received: by 2002:a05:6808:8955:b0:487:530f:5754 with SMTP id 5614622812f47-4a2043e4bbamr405960b6e.20.1783477146722;
        Tue, 07 Jul 2026 19:19:06 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-4a1aa006f74sm799975b6e.0.2026.07.07.19.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 19:19:06 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 07 Jul 2026 20:18:22 -0600
Subject: [PATCH v6 22/24] dyndbg: hoist classmap-filter-by-modname up to
 ddebug_add_module
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dd-maint-2-v6-22-381f3edb0045@gmail.com>
References: <20260707-dd-maint-2-v6-0-381f3edb0045@gmail.com>
In-Reply-To: <20260707-dd-maint-2-v6-0-381f3edb0045@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783477102; l=5915;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=y6qM/kqNwYmuj1o8I5+E9cTtId3LZfSsuD6PkviU3E8=;
 b=C5xWlPnwit9dEjn/4haJlgEZovBoNEgQOrPx5Fh0A237vD3NHtJlfMpFEVk19VCdGtMr8C2Sh
 jy0uX9h8MyiABpBXikgA2rj6+hoaWNI5vUMPdz9FlgN1W33i9+xOFFS
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

The body of ddebug_attach_module_classes() is just a code-block that
finds the contiguous subrange of classmaps matching on modname, and
saves it into the ddebug_table's info record.

Implement this block in a macro to accommodate different component
vectors in the "box" (as named in the for_subvec macro).  We will
reuse this macro shortly.

And hoist its invocation out of ddebug_attach_module_classes() up into
ddebug_add_module().  This moves the filtering step up closer to
dynamic_debug_init(), which already segments the builtin pr_debug
descriptors on their mod_name boundaries.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v3: expand block-comment in ddebug_add_module

v2: move RvB after SoB

finish hoist - drop old fn - ddebug_attach_module_classes

the v1 rev left the old ddebug_attach_module_classes in place, but it
is completely redundant now, since it already lost the list-linking
job it was doing.

It was being cut out later in the patchset (in the unsent API
adaptation phase), but for cleaner review, lets excise it now.

OLD all-in-1-series (pre split into reviewable chunks)

v10?- reordered params to match kdoc

v12- refactor/rename: s/dd_mark_vector_subrange/dd_set_module_subrange/

1. Renamed the macro from dd_mark_vector_subrange to
   dd_set_module_subrange to better reflect its purpose of narrowing a
   vector to a module-specific subrange.

2. Simplified the arguments by removing the redundant _dst, as the _di
   pointer already provides access to the target _ddebug_info struct.

3. Refactored for Clarity: Instead of overwriting the struct's start
   pointer while the for_subvec loop is using it to iterate, I
   introduced a temporary __start variable. This avoids the "subtle"
   side effect and makes the logic easier to follow.

4. Updated Documentation: Improved the comment block to explicitly
   state that the macro scans for the first match and counts
   contiguous elements.

fiuxp
---
 lib/dynamic_debug.c | 80 ++++++++++++++++++++++++++++-------------------------
 1 file changed, 43 insertions(+), 37 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index a9965ec1807a..1d5b9f68791a 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -1175,34 +1175,34 @@ static const struct proc_ops proc_fops = {
 	.proc_write = ddebug_proc_write
 };
 
-static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
-{
-	struct ddebug_class_map *cm;
-	int i, nc = 0;
-
-	/*
-	 * Find this module's classmaps in a subrange/wholerange of
-	 * the builtin/modular classmap vector/section.  Save the start
-	 * and length of the subrange at its edges.
-	 */
-	for_subvec(i, cm, di, maps) {
-		if (!strcmp(cm->mod_name, dt->info.mod_name)) {
-			if (!nc) {
-				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
-					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
-				dt->info.maps.start = cm;
-			}
-			nc++;
-		} else if (nc) {
-			/* end of matching classmaps */
-			break;
-		}
-	}
-	if (nc) {
-		dt->info.maps.len = nc;
-		vpr_info("module:%s attached %d classes\n", dt->info.mod_name, nc);
-	}
-}
+/*
+ * dd_set_module_subrange - find matching subrange of classmaps
+ * @_i:   caller-provided index var
+ * @_sp:  cursor into @_vec
+ * @_di:  pointer to the struct _ddebug_info to be narrowed
+ * @_vec: name of the vector member (must have .start and .len)
+ *
+ * Narrow a _ddebug_info's vector (@_vec) of classmaps to the
+ * contiguous subrange of elements where ->mod_name matches
+ * @__di->mod_name.  This is primarily for builtins, loadable modules
+ * have only their classmaps, and dont need this sub-selection.
+ */
+#define dd_set_module_subrange(_i, _sp, _di, _vec) ({			\
+	struct _ddebug_info *__di = (_di);				\
+	typeof(__di->_vec.start) __start = NULL;			\
+	int __nc = 0;							\
+	for_subvec(_i, _sp, __di, _vec) {				\
+		if (!strcmp((_sp)->mod_name, __di->mod_name)) {		\
+			if (!__nc++)					\
+				__start = (_sp);			\
+		} else if (__nc) {					\
+			break; /* end of consecutive matches */		\
+		}							\
+	}								\
+	if (__nc)							\
+		__di->_vec.start = __start;				\
+	__di->_vec.len = __nc;						\
+})
 
 /*
  * Allocate a new ddebug_table for the given module
@@ -1211,6 +1211,8 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 static int ddebug_add_module(struct _ddebug_info *di)
 {
 	struct ddebug_table *dt;
+	struct ddebug_class_map *cm;
+	int i;
 
 	if (!di->descs.len)
 		return 0;
@@ -1223,17 +1225,21 @@ static int ddebug_add_module(struct _ddebug_info *di)
 		return -ENOMEM;
 	}
 	/*
-	 * For built-in modules, name (as supplied in di by its
-	 * callers) lives in .rodata and is immortal. For loaded
-	 * modules, name points at the name[] member of struct module,
-	 * which lives at least as long as this struct ddebug_table.
+	 * For built-in modules, di is a partial cursor into the
+	 * builtin dyndbg data; the descriptors are the subrange
+	 * matching the modname, but the classmaps are the full set.
+	 * We find and set the relevant subrange of classmaps here.
+	 *
+	 * The modname string is in .rodata, the descriptors and
+	 * classmaps are in writable .data. All are immortal.
+	 *
+	 * For loaded modules, mod_name points at the name[] member
+	 * of struct module, and the descriptors and classmaps point
+	 * at the module's ELF sections; all have lifetimes matching
+	 * the module's presence.
 	 */
 	dt->info = *di;
-
-	INIT_LIST_HEAD(&dt->link);
-
-	if (di->maps.len)
-		ddebug_attach_module_classes(dt, di);
+	dd_set_module_subrange(i, cm, &dt->info, maps);
 
 	mutex_lock(&ddebug_lock);
 	list_add_tail(&dt->link, &ddebug_tables);

-- 
2.55.0

