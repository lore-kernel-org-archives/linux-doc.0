Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA2737AA6D
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671846; cv=none; b=K791QYiJBnQx0iQJ4CXYGo1YN1I6LbQ8DZw7v5tmIIjzXsHiQmNAa2l68nnUmCX/8DzXrgDlGypgA3zt6326mWDY7pArOB2Ed4nXrQVcCwfRj1sS+/6zwIPZCqKV1fy4dU+3aMlhN2rWPC3avd2aGphEA5dqp+Xrt1vudckOPsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671846; c=relaxed/simple;
	bh=TCt+Umc3rgtbCHO4TqAemWGpLw8mf/UI5O0cMTVIzpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCUdKq0LHNMlKs8Qhb50KwsljJGHHgZe/4nKTTMYwkfNpao1UUJvRsb3Ismj7OVCvNBKs/17cZwH6sjpIMf4TIMPA6fCaWl99u2KwfDY/rGVk5/xlE793EhJOYij/TGdHhKGwQpogMcjdfYurH647aTuEwT5hRneACQf65pwJvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gw5DNc6M; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gw5DNc6M"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7d18d02af68so392522a34.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671843; x=1770276643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wXC72JsrD+8jUo7wjAzTiXKH+pyOvTSNfiyGZVqgoE=;
        b=Gw5DNc6MN1kukDas0oNWrGxrEZzcK5I6RNjqo3LkaPvezjUrUodP6N5TiTK/UYIDd4
         Kb8v83G1OCk4/Hcdw5GJubltcgxARl+zDjum1fNu54lu18OzUSpayV4cFoZV8172Mjz/
         6k3201o027D9Wy8DNw19NEXRtvleWB+SgC1Hc3RioHuMVUKO3wMC5PLNVHevZVsWFrpV
         /9oUi77bBjB0BqhXKd/W0WXMvhIEEhB5QxC8VpBN4iA7hHSHm1qmK6mopBQtlXJbdtUJ
         NPbkobPtepycfQQk6P2fxcX/seMuLAgv6z/xbuSrQmwmT2cCL5SSQbrejkfOrmiH8EwG
         Lo2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671843; x=1770276643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7wXC72JsrD+8jUo7wjAzTiXKH+pyOvTSNfiyGZVqgoE=;
        b=hH5Xkm+KPFjE9o9boZIRfT168PI9DObdW27ju8uPw5YYSx2IYxp+ctJZ5LZkKXS5zJ
         rbW5tYfGa2HvMoEDiW/yHdL79GBwmvWC7cU3xp7eKbtHWdA6SjXHsUQmeNUT8a9yreRw
         Pitpe2crfZrFiLFwztcTp5oj4kEWYqi4VRbs51rtTE+2nJPrir9kFeYprKueYjt+7+io
         d0HsIQvGA+vF6CwiJYGQ74Y2VVo6IEdHVMZGgEVkEn+opLKxFk6AzFlZ2WIY9AZhU64c
         IwjbkJA6bVVoTD0ChaaST2VunODxqgunBRVBRAzNA+QaLFg2m3YdIKignqeDvnPMC2EA
         t7tA==
X-Forwarded-Encrypted: i=1; AJvYcCXKVHkVJTVG4HSIIuqBUF49UXHwWg3DIBpXMsUsiiLmOhjxwtfLSm3uHCZ7I3A0oUm5aS/UOK5tCqU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Ae3WuJW9ieNIrZsS/+aP4qqVeR+LD195pPq+wciYahKYfuxd
	jdZvzdYLyUKapdUcj2Qhj1PLlLHSBcGfUVKCszKaTekCcKsOgMkdLLHP
X-Gm-Gg: AZuq6aIyUHsR4VLCaFnKGCc8vZoauJ3YBAbINbCL6A2A205ujQX80WdatTJpB1ARjKS
	y2/etzzmed0tz3iHlRA0g5+dFcXQ1akPxcUxBjAuu8UUyCHo70GSK8JOsW9vHA2oGiEIfubVGCc
	yHcsY5lN/6I+dlcKSfGAN4zZkgYnIHeBPqWMlbegOEJbxLbROlpN4GIiJ7mtic444RSeNORDdBJ
	EZxoo1OT2IUVICLC/IrFoPp5zlOUp02LKA7sC7pE0Qo/sqVjq50nICA4HMoYHwlx5j+WwQBa3t+
	r4Q+OWHtgjzYI1hpEx/Kdu0CLajytHbWtDikleKV49feIBgqqE3D6W1VufHwvXJheGDht6WyXuP
	ivEkKHe1NU1U8ZBtgkd5aZki4ObS3QAbsmESoRom4v+u8ckI9lMfOyfyMj11wDjk3Y/LQd1kfxq
	EC+bzDvKZqs6mSjUNV1FylbslsPxMVBEWYvF1BooP6
X-Received: by 2002:a05:6830:82d4:b0:7c6:cd24:6392 with SMTP id 46e09a7af769-7d18511dc11mr5342117a34.34.1769671843295;
        Wed, 28 Jan 2026 23:30:43 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7d18c6708e1sm3281783a34.5.2026.01.28.23.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:30:42 -0800 (PST)
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
Subject: [PATCH v9 15/32] dyndbg: macrofy a 2-index for-loop pattern
Date: Thu, 29 Jan 2026 00:29:01 -0700
Message-ID: <20260129072932.2190803-16-jim.cromie@gmail.com>
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

dynamic-debug currently has 2 __sections (__dyndbg, __dyndb_classes),
struct _ddebug_info keeps track of them both, with 2 members each:
_vec and _vec#_len.

We need to loop over these sections, with index and record pointer,
making ref to both _vec and _vec_len.  This is already fiddly and
error-prone, and will get worse as we add a 3rd section.

Lets instead embed/abstract the fiddly-ness in the `for_subvec()`
macro, and avoid repeating it going forward.

This is a for-loop macro expander, so it syntactically expects to
precede either a single statement or a { block } of them, and the
usual typeof or do-while-0 tricks are unavailable to fix the
multiple-expansion warning.

The macro needs a lot from its caller: it needs 2 local vars, 1 of
which is a ref to a contained struct with named members.  To support
these requirements, add:

1. __ASSERT_IS_LVALUE(_X):
   ie: ((void)sizeof((void)0, &(x)))

2. __ASSERT_HAS_VEC_MEMBERS(_X, _Y):
   compile-time check that the _Y "vector" exists
   ie: _X->_Y and _X->num##_Y are lvalues.

The for_subvec() macro then invokes these before the for-loop itself;
they disappear at runtime.  They do cause a "complex macro" CHECK from
checkpatch --strict.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 7029c9c4bfbf..aed197f879f5 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -129,6 +129,28 @@ do {								\
 #define v3pr_info(fmt, ...)	vnpr_info(3, fmt, ##__VA_ARGS__)
 #define v4pr_info(fmt, ...)	vnpr_info(4, fmt, ##__VA_ARGS__)
 
+/*
+ * simplify a repeated for-loop pattern walking N steps in a T _vec
+ * member inside a struct _box.  It expects int i and T *_sp to be
+ * declared in the caller.
+ * @_i:  caller provided counter.
+ * @_sp: cursor into _vec, to examine each item.
+ * @_box: ptr to a struct containing @_vec member
+ * @_vec: name of a member in @_box
+ */
+#define __ASSERT_IS_LVALUE(x) ((void)sizeof((void)0, &(x)))
+#define __ASSERT_HAS_VEC_MEMBER(_box, _vec) ({	\
+	(void)sizeof((_box)->_vec);		\
+	(void)sizeof((_box)->num_##_vec);	\
+})
+#define for_subvec(_i, _sp, _box, _vec)			\
+	__ASSERT_IS_LVALUE(_i);				\
+	__ASSERT_IS_LVALUE(_sp);			\
+	__ASSERT_HAS_VEC_MEMBER(_box, _vec);		\
+	for ((_i) = 0, (_sp) = (_box)->_vec;		\
+	     (_i) < (_box)->num_##_vec;			\
+	     (_i)++, (_sp)++)
+
 static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 {
 	/* trim any trailing newlines */
@@ -156,7 +178,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_map *map;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for_subvec(i, map, dt, classes) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -1232,8 +1254,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
 	 * the builtin/modular classmap vector/section.  Save the start
 	 * and length of the subrange at its edges.
 	 */
-	for (cm = di->classes, i = 0; i < di->num_classes; i++, cm++) {
-
+	for_subvec(i, cm, di, classes) {
 		if (!strcmp(cm->mod_name, dt->mod_name)) {
 			if (!nc) {
 				v2pr_info("start subrange, class[%d]: module:%s base:%d len:%d ty:%d\n",
-- 
2.52.0

