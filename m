Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96B937A4AA
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671853; cv=none; b=s5j0qf1I1TG08AZe/KfGG7QYwCd0dZJ5irNAsZrBzZxidfgy78JjYjuahOT4NQUxEscuiYl7v+ofToLiA/oCA/X/2JqoocFuB9rv6uSri0qR+78T42blMcdBDzQ7mQ0pe9YckpmG5P+o8/+rGgN4n4khAdxXFsZzDW3ostCr4zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671853; c=relaxed/simple;
	bh=6cVXBLbtabRZRdtTogygWmhmlBp5e86l1xrHg7t48uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sT523SgNdObDmymYbXVkHRtjcsCjbwyqDH+D5bQHAIoTS75BfLmXBmm4BYd3LYVluFjYFi0YGmsS6ueVkC3adh7Kfzn7XPMkm1Tui5ECHyvqs3NeGTNYMl+4B6b6w1fz0oL1S6AqVO2/b9Y3JoKtjuFzysPh2Ydi21tCHagu1ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F14FkdT6; arc=none smtp.client-ip=209.85.210.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F14FkdT6"
Received: by mail-ot1-f65.google.com with SMTP id 46e09a7af769-7cfd0f349c4so372772a34.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671851; x=1770276651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1MSGjLuoet6XoLWrKuKWDasPzrFnsjMOT+NIzURHtXc=;
        b=F14FkdT6McI8jF1AsxnT0vOpFzJmaFNHmvTofW/rXxEyyOMHjBQq8ISpRn6C7aWxtM
         dBofqsoqBHrR5PRu4hM/gmqGwMFrdALBZ8+mWtSQtnyYNXU4ArGMnxge6slMTYwiGEc+
         rdAkbO9WzbkcDl6Cjp0XL8rTWj5mKRMLnumGzIViE4tN9rotF7k4JYEck6ug3Xm+wAp5
         FBF7hoGND4yFeyMhU9a67ZHUrUrRxn0m8qGwdd76oDD/0HXG81AQAXbCQR4h8tOaF/8B
         sIOZvihKWFjB+pD7NEEIsH85JRnlFoXUyNhly9izlJuc/S7Yo7lS3e7yXLGE2U4bMtoB
         AMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671851; x=1770276651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1MSGjLuoet6XoLWrKuKWDasPzrFnsjMOT+NIzURHtXc=;
        b=NRLjVkW46STM8k5Sj3VTdKNg626cC5puJxncA7o+VBiwaz7t3csk5b7QQx+kD5A1a4
         pVNQ2GoCMqj3g6sKAn680c5QmWT5+sOB126zo6Iwz2ERPhMJTO+AkV6nfwLx4bjL4ISr
         /kzVwBfFj9Zn6fRBBsfQHRv6KvXkv+FVenlY5Y6Ztr0Iwq1ld4FGWxrLAns58LOLe/qU
         1LaJ37oMlXbVZBWQBGZNlKB36GD/kgYUoZtabJLCYbV0dAf4/kIiRJkV3hSPsjZZQt7h
         q8bJL6soBF+ljkPHAsyJ+vAVt0atU8jino53RojZEkugxrWcO09i+DVL04TOEbg+9vsk
         IERw==
X-Forwarded-Encrypted: i=1; AJvYcCVgcVdGaLGYggwwSacgJrkUkIekycLnL8RwKq7UovhScEEiVviadkzQYS98cOjqCPL20qSen4qBmPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMYYw5dNMIv+6lgm+p/GbmCTzzYdnBXkYP/We1sivTCMijDJLq
	LWyvu+WvX8oGgvuuzP9dqimNsxigfRkzg2ugEXY5BaeNbfjEKJzRMIX6
X-Gm-Gg: AZuq6aKthXttErI4K/f05pMDjt+QnL7vipXBuKkv0lit6G73MaF+ZZobDqRv4polgke
	7VDUsQMlo4VMIgHYGi4a7TPkcL3N5d4IPGPh8HjjPNobhJ+GOlq7zyx03O378CZSsItfth5BHlT
	lIB6vT6W3FOd+sQfUQuTEbzGeHeaCcLlzne8KmkUxcpC5jiYEBZG8YjQhVUxIdBQlEGM7aQn0Vg
	tHb7Ne7gbiCgpoO/xmvrdhTaeZNGQU+Cj1vTfIfii7lnZ05oH8FYN/jGQOetVoQZQJ/ba4Su+BN
	1gF+0yf8eLlEepuKlK97V0U64n/FMegWRbMuN7/3Gj52hhs2FD0gpO6CXbyRYQ83HZQj2kSped3
	iUoc7qy3y2PhWHTA02PCqFOFLhkq3zuVE2ksBEaF+21y5VFzLsgxy+DsxxtOmy9k9oZMd2i/dWN
	cUAtnBzoZhit2kV46Wa0LNm4bAoirH7DjO1pSP55v6
X-Received: by 2002:a05:6820:4588:b0:65f:1012:69c5 with SMTP id 006d021491bc7-662f20f917fmr3325685eaf.76.1769671850804;
        Wed, 28 Jan 2026 23:30:50 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-662f9961dffsm2869395eaf.5.2026.01.28.23.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:30:50 -0800 (PST)
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
Subject: [PATCH v9 17/32] dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
Date: Thu, 29 Jan 2026 00:29:03 -0700
Message-ID: <20260129072932.2190803-18-jim.cromie@gmail.com>
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

The body of ddebug_attach_module_classes() is dominated by a
code-block that finds the contiguous subrange of classmaps matching on
modname, and saves it into the ddebug_table's info record.

Implement this block in a macro to accommodate different component
vectors in the "box" (as named in the for_subvec macro).  We will
reuse this macro shortly.

And hoist its invocation out of ddebug_attach_module_classes() up into
ddebug_add_module().  This moves the filtering step up closer to
dynamic_debug_init(), which already segments the builtin pr_debug
descriptors on their mod_name boundaries.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
reordered params to match kdoc
---
 lib/dynamic_debug.c | 57 ++++++++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index be3a430cc332..c2c450e3daa3 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -171,8 +171,8 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 }
 
 static struct _ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
-							const char *class_string,
-							int *class_id)
+							 const char *class_string,
+							 int *class_id)
 {
 	struct _ddebug_class_map *map;
 	int i, idx;
@@ -1248,30 +1248,35 @@ static const struct proc_ops proc_fops = {
 
 static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug_info *di)
 {
-	struct _ddebug_class_map *cm;
-	int i, nc = 0;
-
-	/*
-	 * Find this module's classmaps in a subrange/wholerange of
-	 * the builtin/modular classmap vector/section.  Save the start
-	 * and length of the subrange at its edges.
-	 */
-	for_subvec(i, cm, di, maps) {
-		if (!strcmp(cm->mod_name, dt->mod_name)) {
-			if (!nc) {
-				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
-					  i, cm->mod_name, cm->base, cm->length, cm->map_type);
-				dt->info.maps.start = cm;
-			}
-			nc++;
-		}
-	}
-	if (nc) {
-		dt->info.maps.len = nc;
-		vpr_info("module:%s attached %d classes\n", dt->mod_name, nc);
-	}
+	vpr_info("module:%s attached %d classes\n", dt->mod_name, dt->info.maps.len);
 }
 
+/*
+ * Walk the @_box->@_vec member, over @_vec.start[0..len], and find
+ * the contiguous subrange of elements matching on ->mod_name.  Copy
+ * the subrange into @_dst.  This depends on vars defd by caller.
+ *
+ * @_i:   caller provided counter var, init'd by macro
+ * @_sp:  cursor into @_vec.
+ * @_box: contains member named @_vec
+ * @_vec: member-name of a type with: .start .len fields.
+ * @_dst: an array-ref: to remember the module's subrange
+ */
+#define dd_mark_vector_subrange(_i, _sp, _box, _vec, _dst) ({		\
+	typeof(_dst) __dst = (_dst);					\
+	int __nc = 0;							\
+	for_subvec(_i, _sp, _box, _vec) {				\
+		if (!strcmp((_sp)->mod_name, (_dst)->mod_name)) {	\
+			if (!__nc++)					\
+				(__dst)->info._vec.start = (_sp);	\
+		} else {						\
+			if (__nc)					\
+				break; /* end of consecutive matches */ \
+		}							\
+	}								\
+	(__dst)->info._vec.len = __nc;					\
+})
+
 /*
  * Allocate a new ddebug_table for the given module
  * and add it to the global list.
@@ -1279,6 +1284,8 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
+	struct _ddebug_class_map *cm;
+	int i;
 
 	if (!di->descs.len)
 		return 0;
@@ -1301,6 +1308,8 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 
 	INIT_LIST_HEAD(&dt->link);
 
+	dd_mark_vector_subrange(i, cm, di, maps, dt);
+
 	if (di->maps.len)
 		ddebug_attach_module_classes(dt, di);
 
-- 
2.52.0

