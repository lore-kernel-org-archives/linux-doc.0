Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1D02F260E
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 01:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768355982; cv=none; b=NKmULOZcZYpKTRPK59ZaoWBQcXYObmZJavBi+e5+2fWX5KTDairbbJ25XvuNFccVXJRvope2EB1x35IoMsKpBUHH8G88pBrnyU7GE8+Qba90Zh7Z6exVZxnViyNAj4gCDH5zw9kAGicW9lv9k1ic6/QXwk0edm/8z1zVLyGPN5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768355982; c=relaxed/simple;
	bh=TSXDdRzLQdSbpJpDeZuG1st+znW3KridOVeec5hbkSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rsWFcbZdYw6PW6l4OEYuSscqeGtH/iNkHM2BYIg7fP236kiZjKWW2/55yUX81xbWBNbv/RGNZ4zA5YLW7Jmkj07kbtLVLqBz6j05kUkDuatkHyYcUrF/bfJY3LGLVDepJos20roGgqGpg6OXA8Iu7/bhJ/KDyKsbWOyswdKdptg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ienRRb1q; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ienRRb1q"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7c76d855ddbso2719758a34.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 17:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768355980; x=1768960780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxdE6+GTYqwM0IzjlMegZ9h6k5RpMRRS5FRcIzbLHHk=;
        b=ienRRb1qcTbqN1VJvJZ3i1fYzXnpNLPDkdQE/zIIJ/rhMfSCCLW+5bMQI1VjXt4f85
         2vyxJJSCjUoimVZwO26AUpIe/8wfpiQmGI4la8H1MFTFm07opL9fEUewOrSUYV4G3zmi
         23A9ZOBNURrLPOdMG2gZF/21Vj0pnO3gKzT0w3aQFVJ5Ov4jT14oKL8cLtXjCjZ+MuKj
         O6G6JWXp+CNWl9WlMS5QU26/qtPUTyNoAJ386hP3LsRrVNliiHBtTBZpBGCFardm5aKC
         UwJ3WGiQlfjRh3POdmPfBYs8IumfTsxskJv351o2hdjtnxbmmxfc2Rb/n+iAV+tKgWyJ
         hgxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768355980; x=1768960780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BxdE6+GTYqwM0IzjlMegZ9h6k5RpMRRS5FRcIzbLHHk=;
        b=mNia1ms3GA2MXfyBJ0nuFpHheEKTjQ8yPSt/EqYBToUVdvXWYJnOfSF8MBFLz4Yzww
         gT5piv8v8OFtxvEYhzPosA/IioLmJFKxyOO6GKrOFKuHsbtZJVnwJy3pIXH4LMrN2wL7
         TyM/rr3YMAdrSz+vSEQrM318x6TST/hlFhgOpDPiUdbrqWubEgKNtbJdDJ0wIV9nHWCc
         YL/Pk8Ja4kZPUxF/g3n9qw9OyElQoNDXhcgRqImKjftaAUmDFq0kC413B5sGbtG/InzQ
         L0vjTydGyDAzJumMG9HPIVPKZvvGFIqUMIu1nLlBKgT0hSayhKFpWcrZ/5YTlMkuUvV5
         pgxA==
X-Forwarded-Encrypted: i=1; AJvYcCWS6E6YCz+HL597UBpyo8qW8+AB5+wdWq+shO0p7QNOcs+du8aU9qcLV1BoHSA4nvO35IcQnFMtdbc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyAunyv0qpPIAxjV9zR/uS0eNRN7Zzz8CiU1/V90v2xin1Zzox
	t52MO7fvMhmiAD4Rz1yFPqA/3TXno5zBHxwzO64DmlhXb1r/BNTgcEF5
X-Gm-Gg: AY/fxX4ILZY/pP6Ud+l34Rq0ebIzCtJ5/V1JWvqTjIJWtjnitGC/hIqUWcEr009nseU
	IIuq4DR9rZXjEsmGi2lS4mt+nt9+PvzSub8+mzDeY/6rLLgX09Rh5fbHCZg4cOydHBNFFcU2/CP
	k9aw0AEz3VIi5qRJOlKxGFbYqBNMIDE+SnxNWP+aeWD3bJpCrlqlK8hVecUngFR4SNailZcpoBo
	sXXyGVX9d+kT78dmViECH+jH3o9KUfvX4xPmgoM3dia/1EyxwY9D8DbiVtmCE7rATCmt9Fz/ZJo
	UpKmdG8/6TidJKZhEvy8FMC9/fmi8b7Py7CV7QhgAVjGsqYOTT320gODkE6jQ3sOSkP8a5++h4o
	J3y/+qPQKCRulQFttmmW+QYZkmhyu3MsFSIhNh04EWZTvqv9FNavJNLr9HYM5gtJC030m7SdDSW
	zuDdINi58pHq6MAUrR66tQQmVG1M1lCvKmhk/l
X-Received: by 2002:a05:6830:6a14:b0:7bc:626c:3b30 with SMTP id 46e09a7af769-7cfc8b69bdcmr827161a34.26.1768355979852;
        Tue, 13 Jan 2026 17:59:39 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7ce47802966sm16830435a34.4.2026.01.13.17.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 17:59:39 -0800 (PST)
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
Subject: [PATCH v8 14/31] dyndbg: macrofy a 2-index for-loop pattern
Date: Tue, 13 Jan 2026 18:57:30 -0700
Message-ID: <20260114015815.1565725-15-jim.cromie@gmail.com>
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
index e882e951d585..94d05d09a128 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -128,6 +128,28 @@ do {								\
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
@@ -155,7 +177,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_map *map;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for_subvec(i, map, dt, classes) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -1231,8 +1253,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
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

