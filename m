Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com [209.85.210.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1657F2FD7B1
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 01:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768355991; cv=none; b=O0GvHmgZ5ouzz1NYBv8BMDTv7lwo5NmMDKAouV/dFZnV+8OfZmXphW27QdIFnwxJAuzP+SwVo8eDF6m2Dnnke9KzFpuM/ACwlXTQrL7OkvynCCxQB+KTshzHnK4WnNI9pi/4O4JirSfYJeGlSvAA5c3ilZb3ADPFHSEcrJx/8DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768355991; c=relaxed/simple;
	bh=lMCW/HO3dpm3FiqsuiIdY8qF5JU5ohZP1EB8BC3NbAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SyccUBgegBtP/b11emfngrkKfjr6Vq2VqkG1VO52laeB+KVEUzuMcRwtCdedEYM5pef4XSCZcp9Pt1TWAnrio2iuxJiWqiXQChHlQWL9qS5wqlMXEloO1w2Q4LkXep6Sq76nipE2U63kkh+vq2zvtFxY4gxUEdsu9fweBjAdAu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VptANuIs; arc=none smtp.client-ip=209.85.210.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VptANuIs"
Received: by mail-ot1-f68.google.com with SMTP id 46e09a7af769-7ce229972f1so7237816a34.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 17:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768355988; x=1768960788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=saj8Myj0AXkSu5hKZJBWN47Kb5BefKCe0HbhKcuaxLQ=;
        b=VptANuIsH8IZTKy0lN9A/LpjBIPkQRvpyFkJUgGPlQH11J/WdXwtalxz0Bt8A3O8rc
         cMwIyIXWqN0+fKoaH/H2okVmzZX1nB8eGBgspwB7YPBM8VoSB/mSDGTjSqX5Rs9LYJFN
         +d1AAJxM+qv+8DmYU8R+eUIc4kxyYW1BGaVtL3xrLiTBEadwagd6GjS+5XyeSh97oqQe
         G3eqDf1gIukBxVQz9lk1ubBIeNpjdnZoFFtVX2dFDtd4QuIt6jbXEaLYgrAkvFixsRF9
         bz/dQtpMgSMDGsZk8+0QDX0WlgyhORzWYQhopH2d9Kz9tuCZ6iRLTmkbSTuUAi1GnVoO
         UATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768355988; x=1768960788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=saj8Myj0AXkSu5hKZJBWN47Kb5BefKCe0HbhKcuaxLQ=;
        b=sGwsVHNrsqTB7sU33UUgrBd4I/C4k95QgTXpp5oWBSeIZFIef/HjWLlqLJYfvd5i/X
         evoPHmAu/wTw7MDK+YjoJNsGq0sn8G4EnU/qqaBG69b1degxURylMoPokDkyijjh8cCo
         62sRl8cpzic7aOFjBBHigM9ckiaD7KzGCnx3ZcGJut8E+jIY5f7w7zNtb6KZcp/EOFz6
         nGLTmTwuKk8eLe/nbeGHC324KWwk0mC2PpRp5qyI0eLR0BZ4rkAGWf0KFNrSjLPuLXET
         uifizT9RNqsbBizONrtOmRBgvxNViZB658GGTfjHcyi+g5p/yCc9+kcqXG2awUopeGcY
         kRXw==
X-Forwarded-Encrypted: i=1; AJvYcCX9G0yvufOG36bdS19a6ME8EJ6XbT33AImbDLcc56CW1CikCD0yvzIIy0m93Rca1/J93Tffh1/SJxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHXc3tveWucj9nl4R0gYHPtg0Dv5O6JBfvfZ0gCp29IMeh4qXj
	8z9/jMRX9x7gk6tCLSiWawQeUuhCoOzarHlGmugrkDmH10X25xY+p8Zq
X-Gm-Gg: AY/fxX4/G1svd4AAvfOxKh1ZKXD2HlAyQwkIiq8dVzZoUu0jKIdyPgoAsGfFUqg9n7k
	5/BT4Q692TAEWwNYGzSSXTA0mcUq2bOnxKURjrLUS+R/3xD1edYISaPuTs3OfUlzbsUDyjHkCxu
	OhM8s66HeEXJMr7CCWUl4VYcm/6JM3oMsRT/CWArtMCk+apvTJY5k8D4+h9GhfoDOeb4UZto34D
	VQgUugZTAooy/V/LTDakUWnaeiZJxZr1q8rXZ7X06L5L+De7BWIZNKW10Tpg1BZtR1j2Y1dYU6V
	mopxoh7mUqyqBxUQ/pYXwlJoR05sU9bdrJ5lVJ59cVlSYjHpIsSZ0n252jn+OlGGWOIvc0r8Wqf
	p3gB+YcUcgsq8aGR3D4hwceBvvcmMNpBMu4uCrMnULrU9TcFy6YCaKjLvo3AvYrJqzzFyIpWNVB
	/ODHya5QQ4gJ7VsnhztoiMdBwU4nKaaqjt8vP5
X-Received: by 2002:a05:6830:90f:b0:7ca:c7b0:17eb with SMTP id 46e09a7af769-7cfcb5d58f9mr497841a34.10.1768355987913;
        Tue, 13 Jan 2026 17:59:47 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7ce47820f06sm16693548a34.11.2026.01.13.17.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 17:59:47 -0800 (PST)
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
Subject: [PATCH v8 16/31] dyndbg: hoist classmap-filter-by-modname up to ddebug_add_module
Date: Tue, 13 Jan 2026 18:57:32 -0700
Message-ID: <20260114015815.1565725-17-jim.cromie@gmail.com>
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
index c9377a444fc8..d668140794ac 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -170,8 +170,8 @@ static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 }
 
 static struct _ddebug_class_map *ddebug_find_valid_class(struct ddebug_table const *dt,
-							const char *class_string,
-							int *class_id)
+							 const char *class_string,
+							 int *class_id)
 {
 	struct _ddebug_class_map *map;
 	int i, idx;
@@ -1247,30 +1247,35 @@ static const struct proc_ops proc_fops = {
 
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
@@ -1278,6 +1283,8 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 {
 	struct ddebug_table *dt;
+	struct _ddebug_class_map *cm;
+	int i;
 
 	if (!di->descs.len)
 		return 0;
@@ -1300,6 +1307,8 @@ static int ddebug_add_module(struct _ddebug_info *di, const char *modname)
 
 	INIT_LIST_HEAD(&dt->link);
 
+	dd_mark_vector_subrange(i, cm, di, maps, dt);
+
 	if (di->maps.len)
 		ddebug_attach_module_classes(dt, di);
 
-- 
2.52.0

