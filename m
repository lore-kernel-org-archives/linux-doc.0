Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E0C2F6179
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 01:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768355972; cv=none; b=obSfXxYhezOKtWxtLJBAeuc7ZUWlJyKK+DGQ9tSTbrkbHnq8DHWk71rUC8eXVRmbp/cu3DX1+TzYkOr/sLYiAIb4kYkj2/ts6wsbBFPrRtiFbaI2E5ogrv14QQSnLoInQ4GVdw5+owkuCCuQVt4szZ1EtvXmsx76U4SyuuEZYrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768355972; c=relaxed/simple;
	bh=vg63sy7QbWL0kibdt/FXOXuPKUSSpfXUoQuv+kiBi1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vlrf6kiLXu66vO+hZp21OH3lT7JanaP5hk4pJtemcJDRfx/5KeN5qLmyPfzALU85ZN3BcDu4NhMXMNsbRt5jwkLC1VG0NEUxDPum9hGFqOdJRsPLcFD5uH+KHcyeSpXsxJiCjf6doFR159erKjzsGodivBW0BWEJACTc5k3M21M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nV8P/HuE; arc=none smtp.client-ip=209.85.167.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nV8P/HuE"
Received: by mail-oi1-f195.google.com with SMTP id 5614622812f47-45c719bb855so184362b6e.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 17:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768355968; x=1768960768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=esuoUN/X0OUOWwx+QdeV/Q9GgUdfEO6lTOhgSGNn33g=;
        b=nV8P/HuEzqcknIiO04Fujy7Q72VeDGf4pTNBZewXSMlLb+bn0eRzCPbQgpLv+PnwhA
         cmN5FzimgYsKh/I2zzHzLhvibhz5wFJYRIzHBOCQ2+7aJ3WZMbEab7pzZ8vZhHDLqIkb
         mZIhyXiQpv7RFtf9VlhmbYuDXZnUhONhtvgpr4FzELqd0A18HcP/U9iEF3j96w6emytf
         nXYPE4nTDrcy0TFDNRHOZaf+I0mGxIxmLMr2WpjF4o8L/+SyDDoC4dYd2FR5xS0kXkdw
         9dn/D3IRj5+yUgYrFkLwaUWXb63ST2D0N2QXDpb6ePaQ53G7fdys3DUKLZQXEGjrgRtw
         Vz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768355968; x=1768960768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=esuoUN/X0OUOWwx+QdeV/Q9GgUdfEO6lTOhgSGNn33g=;
        b=E1R3Y8L44mmITXkh/lwwuUORd3raGpSIBlpJ0R4slLWFed8ijdkUu4wK4nljxz525m
         D9jfMoki5JuiaVnIz0Wzd5YCSyJ9ipF3lcnK0uMuBwnTmjxWo8akMA7R7MPdofFFNBgT
         qorwfakhsmVXVWkrF456bMDbXIuwakJzVPKcEbYwG6v24kEtELRNzc0foMZVUZawzpIv
         QxQcl8opLeP6bj+pgzePgqSwXmelEg+JL0v/1+yw1jJiQdtc6JukdH3gfjkO3xLhPzVu
         q8ehzNVV99EPXitZskC3dsjpmreMkjwwz5MVtL4as75Bob606qyWD1zzjsTKD6zh9YkA
         /t3w==
X-Forwarded-Encrypted: i=1; AJvYcCV5izjZ90ktRuW9jNZ6ZRCSyNTolNCooZE8EY4SW6ubdlksbYbCEB+dYEi0ALnrWjusQEAndngUMrI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk96moRUY12V26e1jj5Nw9emcUlKIfSCGM5+j95xSN6BxkrKDg
	tL81NzY7Zk0YY1DxjR8AsWH1DSFjkdBVUFvIo63mTlDANgv98atC3DXa
X-Gm-Gg: AY/fxX5HaooSyr9/OlZYNeYK0qkbxKGAkjq/jc80isBc3syBRg58XQSic2qALQm6z2F
	5YabiuiT4vjjEMoUoeeQKB0LKSQrqSu3Bi5XIkJ3Hd5z+PbNXn/Dk+bxN5xcTrC7dz+BXzKner3
	+2WWxaza1YOovfuaJsSQYJ0r2+GL9lLjjlEKzBF1jRZx5fHUI6wBXPoWlkdRp26jtKZAo7mVoA4
	Ak/4KQi5rDfutvZ5UQRE8IzIDfPx+Jg/Ha0E8VXqwDwNlJ4wusOJJ2kj/Y2g9rWlTFFO3VIajoY
	yeIIlPrw7ZPbSm64eHOhvdnGlKhLiFnXevikXuwPcYx5pPq29IsZFzNIwxsO98ApcObb1/08PZd
	EMPdECdU+PJdYin0j75od/3hVLoKbbQ5YKRk5Vxl5Z7hXPIYQScPppJ4cGAxMV5gZf8NQaTh1Rs
	0iU4kymIt9TRC01yT/REaBXA8RVRenKFnXmfw2
X-Received: by 2002:a05:6808:d52:b0:459:9358:ab70 with SMTP id 5614622812f47-45c714f27d6mr642429b6e.31.1768355967898;
        Tue, 13 Jan 2026 17:59:27 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-3ffa4de539bsm14995190fac.4.2026.01.13.17.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 17:59:27 -0800 (PST)
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
Subject: [PATCH v8 11/31] dyndbg: refactor param_set_dyndbg_classes and below
Date: Tue, 13 Jan 2026 18:57:27 -0700
Message-ID: <20260114015815.1565725-12-jim.cromie@gmail.com>
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

Refactor callchain below param_set_dyndbg_classes(1) to allow mod-name
specific settings.  Split (1) into upper/lower fns, adding modname
param to lower, and passing NULL in from upper.  Below that, add the
same param to ddebug_apply_class_bitmap(), and pass it thru to
_ddebug_queries(), replacing NULL with the param.

This allows the callchain to update the classmap in just one module,
vs just all as currently done.  While the sysfs param is unlikely to
ever update just one module, the callchain will be used for modprobe
handling, which should update only that just-probed module.

In ddebug_apply_class_bitmap(), also check for actual changes to the
bits before announcing them, to declutter logs.

No functional change.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 65 ++++++++++++++++++++++++++++-----------------
 1 file changed, 40 insertions(+), 25 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 1db2f627237a..64d69f5cba1b 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -604,9 +604,10 @@ static int ddebug_exec_queries(char *query, const char *modname)
 	return nfound;
 }
 
-/* apply a new bitmap to the sys-knob's current bit-state */
+/* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits)
+				     unsigned long *new_bits, unsigned long *old_bits,
+				     const char *query_modname)
 {
 #define QUERY_SIZE 128
 	char query[QUERY_SIZE];
@@ -614,7 +615,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	v2pr_info("apply: 0x%lx to: 0x%lx\n", *new_bits, *old_bits);
+	if (*new_bits != *old_bits)
+		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
 		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
@@ -623,12 +626,16 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		snprintf(query, QUERY_SIZE, "class %s %c%s", map->class_names[bi],
 			 test_bit(bi, new_bits) ? '+' : '-', dcp->flags);
 
-		ct = ddebug_exec_queries(query, NULL);
+		ct = ddebug_exec_queries(query, query_modname);
 		matches += ct;
 
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
+	if (*new_bits != *old_bits)
+		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
+			  *old_bits, query_modname ?: "'*'");
+
 	return matches;
 }
 
@@ -683,7 +690,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 				continue;
 			}
 			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits, NULL);
 			*dcp->bits = curr_bits;
 			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id]);
@@ -693,7 +700,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
 
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits, NULL);
 			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
 			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id], old_bits, curr_bits);
@@ -707,18 +714,9 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 	return 0;
 }
 
-/**
- * param_set_dyndbg_classes - class FOO >control
- * @instr: string echo>d to sysfs, input depends on map_type
- * @kp:    kp->arg has state: bits/lvl, map, map_type
- *
- * Enable/disable prdbgs by their class, as given in the arguments to
- * DECLARE_DYNDBG_CLASSMAP.  For LEVEL map-types, enforce relative
- * levels by bitpos.
- *
- * Returns: 0 or <0 if error.
- */
-int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+static int param_set_dyndbg_module_classes(const char *instr,
+					   const struct kernel_param *kp,
+					   const char *mod_name)
 {
 	const struct ddebug_class_param *dcp = kp->arg;
 	const struct ddebug_class_map *map = dcp->map;
@@ -755,8 +753,8 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 				KP_NAME(kp), inrep, CLASSMAP_BITMASK(map->length));
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
-		v2pr_info("bits:%lx > %s\n", inrep, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits);
+		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -769,7 +767,7 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, mod_name);
 		*dcp->lvl = inrep;
 		break;
 	default:
@@ -778,16 +776,33 @@ int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
 	vpr_info("%s: total matches: %d\n", KP_NAME(kp), totct);
 	return 0;
 }
+
+/**
+ * param_set_dyndbg_classes - classmap kparam setter
+ * @instr: string echo>d to sysfs, input depends on map_type
+ * @kp:    kp->arg has state: bits/lvl, map, map_type
+ *
+ * enable/disable all class'd pr_debugs in the classmap. For LEVEL
+ * map-types, enforce * relative levels by bitpos.
+ *
+ * Returns: 0 or <0 if error.
+ */
+int param_set_dyndbg_classes(const char *instr, const struct kernel_param *kp)
+{
+	return param_set_dyndbg_module_classes(instr, kp, NULL);
+}
 EXPORT_SYMBOL(param_set_dyndbg_classes);
 
 /**
- * param_get_dyndbg_classes - classes reader
+ * param_get_dyndbg_classes - classmap kparam getter
  * @buffer: string description of controlled bits -> classes
  * @kp:     kp->arg has state: bits, map
  *
- * Reads last written state, underlying prdbg state may have been
- * altered by direct >control.  Displays 0x for DISJOINT, 0-N for
- * LEVEL Returns: #chars written or <0 on error
+ * Reads last written state, underlying pr_debug states may have been
+ * altered by direct >control.  Displays 0x for DISJOINT classmap
+ * types, 0-N for LEVEL types.
+ *
+ * Returns: ct of chars written or <0 on error
  */
 int param_get_dyndbg_classes(char *buffer, const struct kernel_param *kp)
 {
-- 
2.52.0

