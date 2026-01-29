Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com [209.85.210.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBC837BE98
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671904; cv=none; b=M3E8szDQkA7SwT9YXeVpGO/Gd8kYTmbhOQA/ZeG4QG64J83mRHB9gmTVYqcHik7riyUF9y1gpomglXcu0/0NrjXne5fesCU6CIZdfJFQIpcDrQb+Zhv0A59yTCB9/lulzzYGTxzlVo4NVgLiUpIEcSfycGnx4L+RXuySaBhUnHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671904; c=relaxed/simple;
	bh=OWEqoLlibNrHkuCPHfiwkfGn7LwUqspM1/p2YuqCFAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m22WbUdWrMOhE0DzXIyzRVJBP3CO3EMHJMcZ8HZpwCNOqXBL5TZoCXwESKaSdfbjxwoT3wMj1DH469K7gtxAW8k+e3YB0Fz6WZZvcmSD05YwJZO/soOPF+Jn5NJl3OpG91ndouD3gPES89TkFXZWxxx+hIE0USx+B5EnPwrXYrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKKdRGng; arc=none smtp.client-ip=209.85.210.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKKdRGng"
Received: by mail-ot1-f67.google.com with SMTP id 46e09a7af769-7cfd65ea639so411563a34.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671902; x=1770276702; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dze2XUwqFsh5TUCGGrCmiBjQ91yoNFKza5PMnMpYzx8=;
        b=hKKdRGngdZQ9bKoCt57mxDwubDCT86llYaQPo7iB1RfDWubip1vYKv2Nc5wpSEP8Pc
         l35ww5RiKDkkMq0HV+vfK4s5Zp9DJE9qEPQASOfjn6Cs7YKn4GrTDhpfHXQHJ0JiLPku
         74dZXm/n6InaNhKtCw4yTk5/EAygNqVfMnXJn7n+7KSdtvLCTCNeoFH1RRyCIRkVWq6+
         EjPFu3+Sfy2xZ0f3QvXvp+WtVUdL22iCblKC51AqcHJ9Pt69esrY6LepmxQH0HnZ4qnP
         D5KWruQ5j5XvLmi8ju34RGRtzpPIDUmXvb+o7wnOCCHX0KRQCmOwXWQs24Zr5cYSkaXx
         ptKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671902; x=1770276702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dze2XUwqFsh5TUCGGrCmiBjQ91yoNFKza5PMnMpYzx8=;
        b=junfjxRaOm2UGXeVBJenC/Js/4/vMhcidCndHAtd6oVsP/GrdSs/ivCKPC6aC60XNF
         iunCLzgl5+9DnHkI+9hHBI0wBNHNjR90Fh8EdUUgO0xSfZu4VIX/jKeMt8yPAjx2hFJl
         KzYC0NPL6u81wIpmM4JM1OTq2C+AnMD+l/82TEC60BRQGsUifoeWaKTd4gxT0bHXb3sb
         giJglVwutVLn59zAmQTQLAdbwfpo0w3XEFOC4ZuPSC1QyX46w5t6MV6anyduZda/KLoz
         FPTSbsY3jeQZD6v/Cs+o3DKqGZ+lkordXH0SYQgdiT4vaKq94GWbUyUC3mpHFR+78qBc
         V1hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuPYY0kJHRqdw42ljgMOCDOOkshNwEU+zd0GtvRx5YZ/ooudyBJEHViSOYfSvJqif4o2MyupK5Jv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI7AKh7evpISkphHEew/BOscYvGyfHyux2/PQTrRAE3OI9sYqn
	qxCp4maZ1icCYWzvH6TiLz412FyttxpOI1Co3OXonCiaqrrGB2H36VTr
X-Gm-Gg: AZuq6aLVPMhIhsE3TB6yJrfefrD8T7D5bSYZAhrsSZxzsYuV5dKay3R9sCI2aKd2FBx
	94pMGeAb/WboUYsB7L0Rb2xyjaWOssPq+JgX6PB4MWMRQGS/G0nbzg5aRiDBpbIhdloH8nGyb+h
	LQLCscOa47tXWYp0pEbjLGnU4jkwni3rOyK/rcZoV5FRRTOhaGWLIAWX5uaZKasBWMdPevQWLbs
	BwRN+6rkpUKEGnRj73c457kVThmWNZJ2L/dBZvN7FVzWM5NR6fTU/0NfiBFP4ewOO2Pcpf0Wf8x
	ByzUuN/okFM+T0jrmsaArTV5m5XoJeuXHtlrJ6jMgYVMgMhrq5uqul/d5un0mr/u9dspeUnnffL
	kZs5Yyx+Ar3eYSjSL60KyTCpImT+U212lDepiepOrmPvjKdNQPjH/8Dt+EE1UFId8X5D8YjgEqI
	6g/rlOJQNTwRvyPIq9ZS3oilvysoCTi5QFXjJAGCEc
X-Received: by 2002:a05:6820:f074:b0:662:f660:5a1b with SMTP id 006d021491bc7-662f6605bb6mr2793558eaf.0.1769671902149;
        Wed, 28 Jan 2026 23:31:42 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 006d021491bc7-662f9a19cb4sm2747829eaf.9.2026.01.28.23.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:31:41 -0800 (PST)
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
Subject: [PATCH v9 31/32] dyndbg: add DYNAMIC_DEBUG_CLASSMAP_USE_(dd_class_name, offset)
Date: Thu, 29 Jan 2026 00:29:17 -0700
Message-ID: <20260129072932.2190803-32-jim.cromie@gmail.com>
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

Allow a module to use 2 classmaps together that would otherwise have a
class_id range conflict.

Suppose a drm-driver does:

  DYNAMIC_DEBUG_CLASSMAP_USE(drm_debug_classes);
  DYNAMIC_DEBUG_CLASSMAP_USE(drm_accel_xfer_debug);

If (for some reason) drm-accel cannot define their constants to avoid
DRM's drm_debug_category 0..10 reservations, we would have a conflict
with reserved-ids.

In this case a driver needing to use both would _USE_ one of them with
an offset to avoid the conflict.  This will handle most forseeable
cases; perhaps a 3-X-3 of classmap-defns X classmap-users would get
too awkward and fiddly.

This is an untested interface extension, so drop this patch if it
feels too speculative, knowing theres at least a notional solution
should the situation arise.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 include/linux/dynamic_debug.h | 27 ++++++++++++++++++++++-----
 lib/dynamic_debug.c           | 19 ++++++++++++-------
 2 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index a1454db1bcb0..0d1245aefc69 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -88,7 +88,7 @@ struct _ddebug_class_map {
 struct _ddebug_class_user {
 	char *mod_name;
 	struct _ddebug_class_map *map;
-	const int offset;	/* user offset to re-number the used map */
+	const int offset;	/* offset from map->base */
 };
 
 /*
@@ -239,11 +239,28 @@ struct _ddebug_class_param {
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
index 4d42e857cc75..5568db8451af 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -199,7 +199,7 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
 		if (idx >= 0) {
 			vpr_di_info(di, "class-ref: %s -> %s.%s ",
 				    cli->mod_name, cli->map->mod_name, query_class);
-			*class_id = idx + cli->map->base;
+			*class_id = idx + cli->map->base - cli->offset;
 			return cli->map;
 		}
 	}
@@ -207,12 +207,17 @@ ddebug_find_valid_class(struct _ddebug_info const *di, const char *query_class,
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
@@ -221,11 +226,11 @@ ddebug_find_map_by_class_id(struct _ddebug_info *di, int class_id)
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
@@ -1178,12 +1183,12 @@ static const char *ddebug_class_name(struct _ddebug_info *di, struct _ddebug *dp
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

