Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74DC37AA72
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 07:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671839; cv=none; b=fcR6ypu+rewOgY88Thbf9Z7M00L6NHQZCHUDdExUPHyrh3aGE2iEglZzftDkhPP2MSWfOZLOpeHHFnDFlw+tPveWL7BT0+z9po0U+yJml5SwDGvoDBrrNU8aqBGMUMKcieuNSdgUtdQjHAmd9WUHJsVVDqMpUugDS0e1l7oUXWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671839; c=relaxed/simple;
	bh=lwdeS2qPcG0MkqhMHDxupUdKU9aIgQLAjRNA/CEXY74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mJJchX25D6lAXkpcwfie9ucdut5Iz+3+rKaSO+V2aGLGrryjK2go2C1q3T/D/Cs8Ie00HnSuoVyJhJSA8+M8+iiEKbNPeD3x5ILvxRQMvBuL6pStr1yR+iAptf+vKp4LEB8XNQHN3GSSnomuoBJquYffD428tpYjyvyLLrN/wV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ajj7DvVz; arc=none smtp.client-ip=209.85.210.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ajj7DvVz"
Received: by mail-ot1-f66.google.com with SMTP id 46e09a7af769-7d18c654458so234816a34.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Jan 2026 23:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769671836; x=1770276636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/udUbeocJdFSjzXOEHqCUH0xWUa8G7j5lTm1RAc80Lw=;
        b=Ajj7DvVzWzOvLjOjP6ev0VCviG8hLebrrLjIl3ODI7Ln34fwUbij3BcYRkFOfB1Hfs
         ZNmS5d5G8Cuq1NnCFNmByKosnZBngDzdV4yBzUvtrlo4lAHqzQWMtMNPpFthgWf9kZTp
         T8S9fiwUpU1BFGHIXbbOBVAOlRMLPNiVdDVURVoND2z6mHWGxIxAIiGKnL7ULQQm0HUw
         e/jQEArvWVJQZBmXtZpEYJbGxaCidmc9oDGQbt+/VUJgbfqFSzk6qcR4o9WGSUUpi5V1
         VOXzutOq1co5jdSTyw9wCRGd7EArdNuKt8tUpzZoKoCCL+lAzMrUQ13E960vPagoUJPL
         uRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671836; x=1770276636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/udUbeocJdFSjzXOEHqCUH0xWUa8G7j5lTm1RAc80Lw=;
        b=Mxt++BB2yJVcs3/Hthan7CFVCIzbVDUElq7wG5kKGSS3E9kCDHxiiVyr3sCBeK4ql7
         9mXyCB9vZuM0rpgq3ue2AOvElBHrQ/9hN5HlxVkkvJWec9HRFvnzHoInnCZqbMPoBuhG
         806gcieneQTTPd0thO6Ih7EiunGTJv8kOdxw8Fh54WoPOAwkQEALBgsHkPE2NsEUSbAU
         FbPJwTHHc5X6fdm55TPj/bg+Kvqz8D1CrUqK7R4Kmo9YjablCBppFCrVQrOcFMaAxe4y
         a7XdGgCIjudVZcUyKIjMvcRCAe0cYndvgm5+/hIkcai4M4bogdj9At1A9a/fzTznCU3d
         tJGA==
X-Forwarded-Encrypted: i=1; AJvYcCVb+HSmToMhWSZwXsW7bOFM9J3p+9n0y/C/IeMcLgvRbl34HVXXdWyVs+W3Hv4otHykcEMtKAmiWMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfDooZTYeGLabfMZZFX3LxYdJ/bQYwRrxPPzhpVG+//OEYYL9S
	9jZoXio6XAx58TlUi1+Zr2c5voblzFN3mnIfpyqIkZ9akiCmKgQ1j1oK
X-Gm-Gg: AZuq6aIQUcvwwQ3bSjvmOhTwihaaiG7/Z4JyZG4DYrWq/rMJUreIeBI74cgUryol/cU
	Ey/AjttOSnI1eC7ogillZjNxqWaQkoWTxj4juNc8+PFoxyVASVayXD4w/S3r2A9wcm2APSrDvMI
	kqxiWb1z7ICcEoj3hW2LA5QL9bYUUl4mD+7RKF6/5ejwDz0Xtv1jXsRIaInVmRWbNr6AatQZyK/
	NFRqeXD3ki6b+76rlID11Cp6Z5KMCZ23Q1TCMIvKSr7iZpAUYyjdsWVFGM0n/hvEhZicCPKdV+o
	D1R8UybM0M9FrLkfueereD68B7YjkS1gLjEWfMhzuw62F7F2+ZNHIv6XZkMPqQyZpaDcL6s2+ew
	bxqOYePqhgG7lG4CZzDuq+CLXvYpX01t/NAnktZMTX3NIQK/nhr0jfYmRHEX3u2krakPqKNlSKP
	fYuYCT5kvDro0pSAkikMfRrnE0YrKLc3wJperL9uWx
X-Received: by 2002:a05:6830:6117:b0:7cf:c482:4982 with SMTP id 46e09a7af769-7d1851042b9mr4042983a34.25.1769671836585;
        Wed, 28 Jan 2026 23:30:36 -0800 (PST)
Received: from godzilla (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-7d18c7ffcbcsm3192489a34.24.2026.01.28.23.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:30:36 -0800 (PST)
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
Subject: [PATCH v9 13/32] dyndbg: tighten fn-sig of ddebug_apply_class_bitmap
Date: Thu, 29 Jan 2026 00:28:59 -0700
Message-ID: <20260129072932.2190803-14-jim.cromie@gmail.com>
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

old_bits arg is currently a pointer to the input bits, but this could
allow inadvertent changes to the input by the fn.  Disallow this.
And constify new_bits while here.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index b6ee4d9cad86..c116a3d5e6b5 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -607,7 +607,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 
 /* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits,
+				     const unsigned long *new_bits,
+				     const unsigned long old_bits,
 				     const char *query_modname)
 {
 #define QUERY_SIZE 128
@@ -616,12 +617,12 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
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
@@ -633,9 +634,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
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
@@ -691,7 +692,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 				continue;
 			}
 			curr_bits ^= BIT(cls_id);
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, dcp->bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, *dcp->bits, NULL);
 			*dcp->bits = curr_bits;
 			v2pr_info("%s: changed bit %d:%s\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id]);
@@ -701,7 +702,7 @@ static int param_set_dyndbg_classnames(const char *instr, const struct kernel_pa
 			old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 			curr_bits = CLASSMAP_BITMASK(cls_id + (wanted ? 1 : 0 ));
 
-			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, &old_bits, NULL);
+			totct += ddebug_apply_class_bitmap(dcp, &curr_bits, old_bits, NULL);
 			*dcp->lvl = (cls_id + (wanted ? 1 : 0));
 			v2pr_info("%s: changed bit-%d: \"%s\" %lx->%lx\n", KP_NAME(kp), cls_id,
 				  map->class_names[cls_id], old_bits, curr_bits);
@@ -755,7 +756,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -768,7 +769,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
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

