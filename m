Received: from mail-oa1-f65.google.com (mail-oa1-f65.google.com [209.85.160.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473E32EC086
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 01:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768355974; cv=none; b=Y7mOGSd8fHAGyc8MGa0cM3dB7GsS+/l+tFa7zifwT254oRqp1N7f5exkmRqWu1uZLJwKIlD1IhAxdXNNmYKNcjDjVZvncEWsNimq3y3yzEHvSyC6Bp4CKoMmJqnaFR5QDuz/t/ATfIDhTzqwmq0SexwT5UF7ghCV2nJrXuAwvco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768355974; c=relaxed/simple;
	bh=KZmY7t1nCms4fl3dBwXkSTLPAQxgaCZAAwmDCUvbFS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sxOgSeH09KiHr6JiITkHIwokVfb2PIkD1/857guqUhAHA/+im4s7HxTTrB64PggsUOtSs/tZikM/Hllgv8JoqpPj7bsbCKat+1y4XNaFkeaG0KbxzWEj3y8Tb7GvrwJN+i4ITW41FRFVl8essORtA0k2GG8FI6tpudHjG4f+mmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OICpYnHX; arc=none smtp.client-ip=209.85.160.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OICpYnHX"
Received: by mail-oa1-f65.google.com with SMTP id 586e51a60fabf-3e7f68df436so352951fac.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 17:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768355972; x=1768960772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OmSrywNj94qh5LuqDwB/XOVQgrfMaP0ThWQZPNx1I5w=;
        b=OICpYnHXVN3S6pro8unnb4NdqN87mprfPDO6A3tChIi5uBWOtghlkHpWYGqKb9/VQH
         JwWh22chh0StkkKIBBsr20sZXydI0ouAYcQ1vq2fWmF7Er6jfhGOVjN0isoWBanpmwHg
         LF/cM51guBSC/CfVmOEeOW0RX5wWYBJjGItt24XVQgK+8WapOi2gOzf+RXb5LnrZ0ZFR
         ReSooi4TCjb+CDKgPP8Mo05E+I2ZVFDLQ6wr7IsS/LJcLqwu18/HDbyqtPcXHwji4ekn
         B6RzK4oBU6NqehrI2PiEDSbfZna300MUrJ41VAQyL2h+LTstAMkW6S9mWcGXsgQZ4ZC+
         AAug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768355972; x=1768960772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OmSrywNj94qh5LuqDwB/XOVQgrfMaP0ThWQZPNx1I5w=;
        b=cOmWCEo2zn5NEfkKhZAH6FIE9ag132I3gctuDBrdLrg9TdwR/gBgOFoc0+VcdNal2o
         m5YMGCwKIwmybUx71w34azdmgEqoTJSsy9b76u0eEKJf0hNuJJcJO5wXtjmz0KSBkM/8
         +YWKJUGCfC5EVsFUy6udndV1z01l+C51c40bUBUsFdFUq9QnL5ens0obJn5hPHS5E2OV
         SkfZJuugVV/5JYdBE3Qtm4Xdv/h3nq2w4XnpqqKDZ5yNdMo5dZBXpYdCBPaXRCruXhsP
         jAQQh3HZdw5y+5opd+j6pVfhmGuSLKtiUxpxmBxm2LrTRIV201xHt4ousUnWIFDMJwWg
         znQw==
X-Forwarded-Encrypted: i=1; AJvYcCUa0lCP4T8OXM9v4D+5jYr75mhbrwQq39vFwmSaClpo1MtCrY4GpBNYc/Xjlbzsdf85xtRHKez7Ir0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0iozQ4LF4AgSa0qcmW9LXXvrS+65LhdEhJVrqL8yvU9IHbgh4
	KtdSItiFJaXJsOl2Eo+WGSZYZdSQf+BampSfDm+I+fvECTn5VbanLYBf
X-Gm-Gg: AY/fxX5uaPj1Km9gP+GSAaHCDbvR/XtbniWPdTEMVYopoIaQq+Z0w0WqfKxQUM8hyfr
	aaR0SZyPemqMGss0YONL1ka52iZpT3VXD/ocJIFccE9wEe3sI8xSZOqaMsKn6jGKXliOWpQx6HX
	24X//qMa9ynmUtK7fm0s/r/C9NmscdHsGZEeRnFxVeiCDCRnQb5K0b9s8SMqs9F9/w2Jut7Won3
	75E9DtvkWoolcZzPOzi7B71BqAkuU7uZoojEze6wB3cqsccOQVl5XPrbDQ1/47knlHJXOWorm2J
	1Fs4QzQjMUlwMeZ8vRGFTHnFNAim7+je+3+3UwWjLjt6cgI37qEc903S/bT+rkF/pSqiR3OJIYR
	BJyDAO4xxi0JbDUT3mvCbQjBN5frJ3gSfQ79Bb844+UIgRhuaIYIOCh4i7Fu33eIm0o5UFO2zL6
	0lXN05cFIuWXwCPnkD8NEsbuA2y08C5fLSCIeZSJnFlKmW4eT+IkXAEhz6Xg==
X-Received: by 2002:a05:6871:2013:b0:3e8:9b72:5cda with SMTP id 586e51a60fabf-4006e417334mr2886940fac.11.1768355971874;
        Tue, 13 Jan 2026 17:59:31 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-4040cba2d2asm342105fac.5.2026.01.13.17.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 17:59:31 -0800 (PST)
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
Subject: [PATCH v8 12/31] dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
Date: Tue, 13 Jan 2026 18:57:28 -0700
Message-ID: <20260114015815.1565725-13-jim.cromie@gmail.com>
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

old_bits arg is currently a pointer to the input bits, but this could
allow inadvertent changes to the input by the fn.  Disallow this.
And constify new_bits while here.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 64d69f5cba1b..db0559763e60 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -606,7 +606,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 
 /* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits,
+				     const unsigned long *new_bits,
+				     const unsigned long old_bits,
 				     const char *query_modname)
 {
 #define QUERY_SIZE 128
@@ -615,12 +616,12 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 	int matches = 0;
 	int bi, ct;
 
-	if (*new_bits != *old_bits)
+	if (*new_bits != old_bits)
 		v2pr_info("apply bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
-			  *old_bits, query_modname ?: "'*'");
+			  old_bits, query_modname ?: "'*'");
 
 	for (bi = 0; bi < map->length; bi++) {
-		if (test_bit(bi, new_bits) == test_bit(bi, old_bits))
+		if (test_bit(bi, new_bits) == test_bit(bi, &old_bits))
 			continue;
 
 		snprintf(query, QUERY_SIZE, "class %s %c%s", map->class_names[bi],
@@ -632,9 +633,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
 		v2pr_info("bit_%d: %d matches on class: %s -> 0x%lx\n", bi,
 			  ct, map->class_names[bi], *new_bits);
 	}
-	if (*new_bits != *old_bits)
+	if (*new_bits != old_bits)
 		v2pr_info("applied bitmap: 0x%lx to: 0x%lx for %s\n", *new_bits,
-			  *old_bits, query_modname ?: "'*'");
+			  old_bits, query_modname ?: "'*'");
 
 	return matches;
 }
@@ -690,7 +691,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 				continue;
 			}
 			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, *dcp->bits, NULL);
 			*dcp->bits = curr_bits;
 			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id]);
@@ -700,7 +701,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
 
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, old_bits, NULL);
 			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
 			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id], old_bits, curr_bits);
@@ -754,7 +755,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -767,7 +768,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, old_bits, mod_name);
 		*dcp->lvl = inrep;
 		break;
 	default:
-- 
2.52.0

