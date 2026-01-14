Received: from mail-oo1-f68.google.com (mail-oo1-f68.google.com [209.85.161.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382722F99A8
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 02:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768356049; cv=none; b=FbeZ5UJjiapPBe/R1SXUIMCcw8pAs6cJGwoTqWe5cEejBrje9lFNjuqUAiq0L1wro5yVmDBBB5ZfyGSCepExYSq/50qffaGE/BggAerGjYOeBpzQBBGI5KtOAvDvcHT0GtPP2Ty5jflzbb5TBzfyoWacG5GPSp3Q1EX3F4oKXB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768356049; c=relaxed/simple;
	bh=nceTOBGC2okYO9sP3q2miltoB/YTSAMOyq1icNZq98U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LeK19M92r5QCEYZsMEYxHKZpyrjLH0wzOcmwER6/L7tNKsfqMv5WUUULlNuHP8gLeMfil770I+Yd3SHVHlEjugW5YWqOZxzaEnmke2UHyIipLeu134QNrJJlvznOtONu5IG+tKOauqsZOOVlX+aYvYpRMci9/ILwBUHz69/jTtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9bd4w7H; arc=none smtp.client-ip=209.85.161.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9bd4w7H"
Received: by mail-oo1-f68.google.com with SMTP id 006d021491bc7-6575e760f06so2551045eaf.0
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 18:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768356046; x=1768960846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtGFYvkXzuLDBdoPBBG7Nml2rAKHXpifaucUiL+T8bk=;
        b=V9bd4w7H5CbuZpzq9oiJVB4G7IUQfpB4d3ZaBrO1YjPO8JT5xOuqDXC7F6RtGp8/ld
         XO1ErYypQn2IIJkrpHJtiaBRHlBfC9LaUrPNVfVg/lS9Y2s4jpL8rYpIbNi+Hs8vFKBy
         aC7RKvh8hMgeNObFz+s6fylBi6ZHxyWAcDDrr+OQ+2jXCv9/hUkdfaUZe1xDsvckZxqW
         2R8Ix8qMwNcszF+n/1jC3jkF54H2WfTe7xA7QIIzBqQ9mZeIZCPsjqkP1yMF3ByEBLx4
         Ms+0M1FU9Ww3S/n1mOLT13X/BNU7lZdw9MBf97IfvkyBbMvElEmeuFePlB2cIvk7IVQO
         ZS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768356047; x=1768960847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EtGFYvkXzuLDBdoPBBG7Nml2rAKHXpifaucUiL+T8bk=;
        b=U8rs/YfqMLJznvxDFZUNwPmBYz3yP1qxHG9+RKauawI3Z32117PH6WiR25Ws9yWY+P
         XkYy1trc8D4FHuoIYsTXngbhwK6y2rp3eE6X8CjY8etWBzhiwCve7Dehp2Qc84FUvXAr
         jbvRtC8vVA/O3dXoKJd2ai/3DqP/ZJJZmq0K/raZ05l6uObtq1aZov//0NhlJUBY2AdW
         dt07GVdalCyE1P1FzwWfGImHMdnMb4HYgffVejNlHfbeHoxzcOcZn9hBD+Vua9ii8+BX
         jR0qy+/aGyUrAMIliIqtIEk1Hi3n/ndWzOqUPO19D1xasjuibowHmYZg4TJDS4T8YupC
         imVg==
X-Forwarded-Encrypted: i=1; AJvYcCV9jdM04DTdSNIjkzFMgM0QJ2t6s+MIME8j6vcmyzkA6dDz5KsOnJBZETLHvHWapmOMJr/kjJ2MJ0w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztgf2dClcF+txo3ieH4A4qbWNXHmUUR7XUZKlDIXb5B6P5IhDu
	EotMhD2+3U+3mq9ySPdgmaaMHEQz71M2mzFHgqDxR+Cus1n18AoD1vdc
X-Gm-Gg: AY/fxX44kYxkWEEb854ju1aomRf87jIMbUdR6syo3lVnFOl+/KTDgoJZ/0rj2gpjrZf
	1F0aODXuGlJF16P7xK6ZmB15QevlD8s3FyroQWCKr3WciZXY36oZt10AzUNXgbY6eiOLmT1ra4O
	YRlXCXTbIY5NzdapqhSPsnWkuhA7F5zNYd5XUNwYGdvh2p5R1Vu4erykhnhp/nu+0XQlp7uH7rX
	L/DzJfMRRotr3H3I5Cm+0Ga1V80XuQCqHjOpmESOGHTu2dic6vLHVMUaQkww5UjbHjOjCTDtsk9
	wo1ZQxS0yU+t6ZtpOW2EkzrpeUIAhJcpH2v3jv3NJxqv/FI77vL/+scuFIfVFiqNBl3Gf90x61g
	1sIsfCB+QHTCQE1BGeM7iM+z0V7ZdoPqixlV9lYpW1lrMilxHqTYO0pS8fiC6eJDgvIsNoKEqyo
	RjbhSAKskLLvuKJYO8YRkFMMTlH1Uq7u7q5crc
X-Received: by 2002:a05:6820:229b:b0:65f:5c73:e350 with SMTP id 006d021491bc7-6610064699amr803336eaf.30.1768356046602;
        Tue, 13 Jan 2026 18:00:46 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-65f48ced969sm8999238eaf.17.2026.01.13.18.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 18:00:46 -0800 (PST)
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
Subject: [PATCH v8 30/31] dyndbg: add DYNAMIC_DEBUG_CLASSMAP_USE_(dd_class_name, offset)
Date: Tue, 13 Jan 2026 18:57:46 -0700
Message-ID: <20260114015815.1565725-31-jim.cromie@gmail.com>
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

Allow a module to use 2 classmaps together that would otherwise have a
class_id range conflict.

Suppose a drm-driver does:

  DYNAMIC_DEBUG_CLASSMAP_USE(drm_debug_classes);
  DYNAMIC_DEBUG_CLASSMAP_USE(drm_accel_xfer_debug);

If (for some reason) drm-accel will not define their constants to
avoid DRM's 0..10 reservations, we have a reserved-ids conflict.  This
seems unlikely.

I don't think this potential conflict would become an issue until we
have at least a 3-X-3 of classmap-defns X classmap-users.

This is an untested interface extension, so drop this patch if it
feels too speculative, knowing theres at least a notional solution
should the situation arise.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 27 ++++++++++++++++++++++-----
 lib/dynamic_debug.c           | 19 ++++++++++++-------
 2 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 315050507fd3..1ec5d8a44deb 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -87,7 +87,7 @@ struct _ddebug_class_map {
 struct _ddebug_class_user {
 	char *mod_name;
 	struct _ddebug_class_map *map;
-	const int offset;	/* user offset to re-number the used map */
+	const int offset;	/* offset from map->base */
 };
 
 /*
@@ -238,11 +238,28 @@ struct _ddebug_class_param {
  *
  * This tells dyndbg that the module has prdbgs with classids defined
  * in the named classmap.  This qualifies "class NAME" >controls on
- * the user module, and ignores unknown names.
+ * the user module, and ignores unknown names. This is a wrapper for
+ * DYNAMIC_DEBUG_CLASSMAP_USE_() with a base offset of 0.
  */
-#define DYNAMIC_DEBUG_CLASSMAP_USE(_var)				\
-	DYNAMIC_DEBUG_CLASSMAP_USE_(_var, 0, __UNIQUE_ID(_ddebug_class_user))
-#define DYNAMIC_DEBUG_CLASSMAP_USE_(_var, _offset, _uname)		\
+#define DYNAMIC_DEBUG_CLASSMAP_USE(_var) \
+	DYNAMIC_DEBUG_CLASSMAP_USE_(_var, 0)
+
+/**
+ * DYNAMIC_DEBUG_CLASSMAP_USE_ - refer to a classmap with a manual offset.
+ * @_var:   name of the exported classmap var to use.
+ * @_offset:  an integer offset to add to the class IDs of the used map.
+ *
+ * This is an extended version of DYNAMIC_DEBUG_CLASSMAP_USE(). It should
+ * only be used to resolve class ID conflicts when a module uses multiple
+ * classmaps that have overlapping ID ranges.
+ *
+ * The final class IDs for the used map will be calculated as:
+ * original_map_base + class_index + @_offset.
+ */
+#define DYNAMIC_DEBUG_CLASSMAP_USE_(_var, _offset)			\
+	__DYNAMIC_DEBUG_CLASSMAP_USE(_var, _offset, __UNIQUE_ID(_ddebug_class_user))
+
+#define __DYNAMIC_DEBUG_CLASSMAP_USE(_var, _offset, _uname)		\
 	extern struct _ddebug_class_map _var;				\
 	static struct _ddebug_class_user __aligned(8) __used		\
 	__section("__dyndbg_class_users") _uname = {			\
diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index f60a723a441b..b0da3dd4ac44 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -198,7 +198,7 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
 		if (idx >= 0) {
 			vpr_di_info(di, "class-ref: %s -> %s.%s ",
 				    cli->mod_name, cli->map->mod_name, query_class);
-			*class_id = idx + cli->map->base;
+			*class_id = idx + cli->map->base - cli->offset;
 			return cli->map;
 		}
 	}
@@ -206,12 +206,17 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
 	return NULL;
 }
 
-static bool ddebug_class_in_range(const int class_id, const struct _ddebug_class_map *map)
+static bool ddebug_class_map_in_range(const int class_id, const struct _ddebug_class_map *map)
 {
 	return (class_id >= map->base &&
 		class_id < map->base + map->length);
 }
 
+static bool ddebug_class_user_in_range(const int class_id, const struct _ddebug_class_user *user)
+{
+	return ddebug_class_map_in_range(class_id - user->offset, user->map);
+}
+
 static struct _ddebug_class_map *
 ddebug_find_map_by_class_id(struct _ddebug_info *di, int class_id)
 {
@@ -220,11 +225,11 @@ ddebug_find_map_by_class_id(struct _ddebug_info *di, int class_id)
 	int i;
 
 	for_subvec(i, map, di, maps)
-		if (ddebug_class_in_range(class_id, map))
+		if (ddebug_class_map_in_range(class_id, map))
 			return map;
 
 	for_subvec(i, cli, di, users)
-		if (ddebug_class_in_range(class_id, cli->map))
+		if (ddebug_class_user_in_range(class_id, cli))
 			return cli->map;
 
 	return NULL;
@@ -1177,12 +1182,12 @@ static const char *ddebug_class_name(struct _ddebug_info *di, struct _ddebug *dp
 	int i;
 
 	for_subvec(i, map, di, maps)
-		if (ddebug_class_in_range(dp->class_id, map))
+		if (ddebug_class_map_in_range(dp->class_id, map))
 			return map->class_names[dp->class_id - map->base];
 
 	for_subvec(i, cli, di, users)
-		if (ddebug_class_in_range(dp->class_id, cli->map))
-			return cli->map->class_names[dp->class_id - cli->map->base];
+		if (ddebug_class_user_in_range(dp->class_id, cli))
+			return cli->map->class_names[dp->class_id - cli->map->base - cli->offset];
 
 	return NULL;
 }
-- 
2.52.0

