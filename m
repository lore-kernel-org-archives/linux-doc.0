Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4003235F5ED
	for <linux-doc@vger.kernel.org>; Sat, 23 May 2026 07:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779520535; cv=none; b=OUpu955dLWkhL9FHDxYwQaUKeS9ZJLT7tr+XfYyYBXAdsSCW2v7fmSLx3z9jkaSNOTywJURLS/mbuCFpRJc1dIJII7IHUOCxeAWE4R/ViMiM6O7FUI14bxaUvndwXnlDY7+/jhFR1K/0CdUzEkWRCjiHsr6lJpw4Z1xyiv4fAXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779520535; c=relaxed/simple;
	bh=IcYsAkjYk+uuIclQHpJnOMdkt8o2M7E29sb0avD+z5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CzQ0cL/s5SdADhHOvqGACh4HcgF2VzwNsRigImBvG9ohzkdWj9CpDi3ZTXnX+rA7l9W0r3SZXLIkV2V2S+6/XTmWlKSJanwBd7XWfrfroMQFli4DY73ouZ49KYZ+zPFYfPOL7ogcNPYQyKKOEkXwGDt4Wv37QAIceKXdbXmTq7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8JSr5C9; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8JSr5C9"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-45d96d21e82so4540105f8f.0
        for <linux-doc@vger.kernel.org>; Sat, 23 May 2026 00:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779520530; x=1780125330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDOYX2d+BKhaTTyw2PdfR5N/FD2dwrYDYgB1Q3ey6Ms=;
        b=D8JSr5C9WoHEXJvYIjqi4bTBRBV/9xNIiIveJ1TgRSTyt/EX8N/h+XUH1KwCBTTp/E
         BzFfjNt/1GZ9Mp9yQevC39464z9K3lmW1KZxbOtgA9H0Jp76uDjXqXvTzeCdzXNTR7+V
         i/Hx4kIZy5v8h/ZoDo/5u+21xEbRkSzcxKj3wVaWhHH4taC5eDI+SHzgQA6gqJSqCwmI
         CkHtmCaS5bQaOplrrcL2xS8WJRLWBCH2GuLKeGtOjD/PB8m4pyikVHEzcx70IfT7sY2z
         8xXCgAvO4LhBg+qpnQfNBYAN2In1hYWwtoWid/MBHGqr4jLYn/YKYaZIwL+GiMuS0Shc
         J4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779520530; x=1780125330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pDOYX2d+BKhaTTyw2PdfR5N/FD2dwrYDYgB1Q3ey6Ms=;
        b=ngovd2TP/vCmLLc8FHlMLgX/XuvBF/HMKWI1J8PMzGMAay2Da8HytJ9SvGfqXQOhXj
         ECddaqcYrtTqUmot71AjFve7QC79lOhZ2QUur2DulU7F3GhG7VOZOthDA46d3VJl+/5N
         +3U8a1LzjrvX9SPS/ED1xibUaThI1oEbkypkAyMbyX8CaN6vZh7mHZepYx7rpf3A4DKo
         GvnYnTo3viHYo4S0sXax3jNSDvWbPgE9xtNKFydp2TbGNe7YeDr63BmgUWNJ1nMuULEe
         Zn9Eao28TK7YG1QQz1aOFmatYI+YsdQa+BayXbfz+0LUEBqrHWm8M35eT3K2IPCfVxy9
         Eiow==
X-Gm-Message-State: AOJu0Yy1oExHoR90yml59xp6Oll3p6PWAQJcV/OVih6OmV8qZ2GODHWC
	RKfx97psefymzOlCBDg+jVwoNiHYWtnO3lSD25FN4J3ArhrcBnM56poj
X-Gm-Gg: Acq92OHpGx4tsnyBtxFC3yrd1khos+PF0xRsYAX5aha9KkbWkP543cJ3dlkKRL6gYLl
	L5RCR57wXiHOAG0M4/xHtvNmyltFbXE+fY4FiDeSyGIqxTB2dqMhtydnyvkzOCChRPXyBaRN1qJ
	cXbLhNnX2tgsjHX959Vosc1K75T95fvVcNlVsLAgwNdecYR0qzX2FqFIa33H9X31+f2Y/cRtqQP
	P9ccaEj6dlIHBkIqtRNaMp6mZMf+fAkX6pNu+EfOFordNaDXaGbTMKsBmNAMBTX1+6rnH9HOuR/
	zECoNx75kFW0gxEuWrigcLI4p0npedceXV71tBtmGBwdJFztGCvk84VckkAkHPlTxjYE8wII/9y
	zuV2+t6TXAWZOc+8EoTEXo4Dg8nNschkr1JCGLIOwzyn2TzNsaILddJDomf8MnBYYpv2GY/PSOO
	SE9RayNI/NnxnBpXmzwQwAxxC1gFNd
X-Received: by 2002:a5d:5f8d:0:b0:43d:71f4:7ed4 with SMTP id ffacd0b85a97d-45eb368206cmr11355026f8f.15.1779520530539;
        Sat, 23 May 2026 00:15:30 -0700 (PDT)
Received: from [192.168.0.174] ([31.96.183.250])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45eb6d5cb76sm8639838f8f.25.2026.05.23.00.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 00:15:29 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 23 May 2026 01:14:50 -0600
Subject: [PATCH v2 17/24] dyndbg: macrofy a 2-index for-loop pattern
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-dd-maint-2-v2-17-b937312aa083@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779520485; l=2772;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=IcYsAkjYk+uuIclQHpJnOMdkt8o2M7E29sb0avD+z5Q=;
 b=DSaOdL6/jQ5YJqm3Wtd/v9vl7sBYDaCKynhQOcWgxX0DOYt6uiNlbXyVZEYxlh8Mx6/zJ2QHU
 3ndgCMMLJ68CdKl3OWiPBufHpGCMCOGE5M+QvMfjnN8/xUiv+axEwat
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

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

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v2: move RvB after SoB
---
 lib/dynamic_debug.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 7f03b331d185..e9481ef21825 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -130,6 +130,20 @@ do {								\
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
+#define for_subvec(_i, _sp, _box, _vec)			\
+	for ((_i) = 0, (_sp) = (_box)->_vec;		\
+	     (_i) < (_box)->num_##_vec;			\
+	     (_i)++, (_sp)++)		/* { block } */
+
 static void vpr_info_dq(const struct ddebug_query *query, const char *msg)
 {
 	/* trim any trailing newlines */
@@ -157,7 +171,7 @@ static struct ddebug_class_map *ddebug_find_valid_class(struct ddebug_table cons
 	struct ddebug_class_map *map;
 	int i, idx;
 
-	for (map = dt->classes, i = 0; i < dt->num_classes; i++, map++) {
+	for_subvec(i, map, dt, classes) {
 		idx = match_string(map->class_names, map->length, class_string);
 		if (idx >= 0) {
 			*class_id = idx + map->base;
@@ -1159,8 +1173,7 @@ static void ddebug_attach_module_classes(struct ddebug_table *dt, struct _ddebug
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
2.54.0

