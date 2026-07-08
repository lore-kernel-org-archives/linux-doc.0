Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE653B9616
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 02:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783477140; cv=none; b=N/PenFAuLldz0BFPgoXIXHQffQoS0vCcbRse65F2TdK7sILj4xWr1vA6Yt9FaQmdn6RH5xf+rRlektgfvMLFevxm3MiV89AsV32AUQTeRLlsST7V21ALzU9GMWDFV2DaR/BKBN2k7ruBD5wyM9EnLj/s4r1M1xYgqvoMXDe6gmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783477140; c=relaxed/simple;
	bh=PPomXDqOPZZDfNdm43tbxaOgsUnHx8T5uRdXvuxBFp4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qd2OEYurOVs4BBlfRaou2WXx3kwKnrQVVSIWY9vWhOWDY0PLQ6J7+OzjsXquw4R7onz35o1VZCZ3tZXQfPxq3Hnd5vmSv2Q896OK8R7Tb0vC4e7n+H9ZXLVPKN1p5p3e/FyfWFTK9M/fIaxG+CvHDaOxh8JYCLzYH5gEz6z+SAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVcQCqHk; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVcQCqHk"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-495ee8e807aso84106b6e.2
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 19:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783477135; x=1784081935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pHdFR6BhJ4eiUKTqpuGaMPESoaVdVadkoTnW9J/lC14=;
        b=hVcQCqHkjg+ylXYNXQXcdtjptzUxayS2bzUkyOKEquojydE3GpCLn+rfSzO0mvMmCR
         b47oY9N8lbKLptPrUreD3HFmw4vCMia6CfD3R8oodx7NpSaJX5ol1p4d2E8RTTH/LCGA
         zzgJZ+jXNAu1TwJRwHVdzV0/p1X3KeIikkIr3+xeMc0tMfjCXjydKqIkc/w9mFsu9Sqb
         ywgiOwKp3O/ODV17B9Au3lBQEKiDyXWcbmE64ddC/X25EhuEbqTCd4M3h72yizPOXIpr
         cTSuw+TEl7HvrHPnxKHZVVH3DKaRzSgHtvTdV5VO3qb2k2xK/Tdt5AoKdIlFHtn2Q/MI
         X6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783477135; x=1784081935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pHdFR6BhJ4eiUKTqpuGaMPESoaVdVadkoTnW9J/lC14=;
        b=pBM+Yg98T6EGWUZiDRPh4DCAUGU2oal0itqzqDkkIyhGNf/SzuhUC+AVSURPI18M8Y
         9KxDSe935lA8AOp1WEq8GHjoZiYcp6jqVonBiDnbVIl2qPch4fKf3pM3JdZ1XZAPybPK
         3d4Jhnm5xe6vjs1nzIrkBghuJD2orrKkpHMLOJV1VcOOGI/Ga7kiPTVSZcIKJ0E5MJC5
         m1qeYJa8KF4v1i4/Z3UVlkdtft/hfnU35SePjj/hAFUMFPTyUlU8QkacbKTUbvrPpfSJ
         dxeG6GZHI714Uo6SBz8LRDKsRTL15tNghSirIjUcDSiOfbxBTWZHn3oQAsGzZpX35wVw
         BHAQ==
X-Forwarded-Encrypted: i=1; AFNElJ8v6Sl+El9AjBjHMbpNUNICbG0disc/s+ihrgLANhzkk6MzGNlYGsbj5ajbwiLMnY2CBk23fOqtPpE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoV76ZncCoHnlYgwOnyhuUKYjjCI0XngdJ8bLakzDaOVtUrtzE
	IYvRrB9w6G7UWyb3QPQanDY8lI9rUn9ULQ785cSZ32SYshAYlbI/gRiL
X-Gm-Gg: AfdE7cng9AUf9R9IPO4HP9ngMCxZb8zo+rLeY4rrc1LFYccj8rwzcCVVEGHaFP5E2XX
	YPTgCQ7JuwJoBjVjmP4jCGF4Grq+4oxbPI44m15QC2cz4T/THlzEfAnrQonlQ6NS3v32ev3OiEU
	WrVJhHoVWl3/trpsPPOaVBGW88EX1g7GpsKrU0evSfG2272z+N4c79xXXN18yqWghsYdMxTUsRp
	kLI8sVu6hsqc4qmxLaXzFAiyeCRyS1r55CqtpT9+5HrG4oeiJT1896HS4uXf5cdNinho6BIsL4Z
	gDcQhvTz3F5IvBWgQBV0E+g5wis9p/C9HhMMFsT4YXad/+r04stAgmRpv9cREmvXLMhpntj0/zg
	kbvo6PYyvjgeA8GUVoJ05s8ypDDfpRT5RxwFcqBR+2pPT+BDAQzLRDyT6pxAfaGASoa4dzjRS1T
	NWYfkJaY4tvdcoahVZMTW8KWXUXgigDrWmq5Na33zvyDGC74KdQ7hOypD9qttFvg==
X-Received: by 2002:a05:6808:320e:b0:495:eb9f:53c4 with SMTP id 5614622812f47-4a2023143a5mr371501b6e.9.1783477135614;
        Tue, 07 Jul 2026 19:18:55 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 5614622812f47-4a1aa006f74sm799975b6e.0.2026.07.07.19.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 19:18:54 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 07 Jul 2026 20:18:16 -0600
Subject: [PATCH v6 16/24] dyndbg: tighten fn-sig of
 ddebug_apply_class_bitmap
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-dd-maint-2-v6-16-381f3edb0045@gmail.com>
References: <20260707-dd-maint-2-v6-0-381f3edb0045@gmail.com>
In-Reply-To: <20260707-dd-maint-2-v6-0-381f3edb0045@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jason Baron <jbaron@akamai.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Arnd Bergmann <arnd@arndb.de>, Luis Chamberlain <mcgrof@kernel.org>, 
 Petr Pavlu <petr.pavlu@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arch@vger.kernel.org, 
 linux-modules@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783477102; l=2913;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=PPomXDqOPZZDfNdm43tbxaOgsUnHx8T5uRdXvuxBFp4=;
 b=CIr8KuxqpMOHsAfVjd2PFFNWeCo8/hjQ5nOwJ+0lMU9uKP5hmdjYMw/MtKkedGI69KPkPmNQK
 JOhoXQzKoBnDMud5UhPktl0b/rz+onEomJ7YEpnrospkJKIN+8/VBcL
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

old_bits arg is currently a pointer to the input bits, but this could
allow inadvertent changes to the input by the fn.  Disallow this.
And constify new_bits while here.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
v2: move RvB after SoB
---
 lib/dynamic_debug.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index 0fc9cd14e2d2..8c3b29904346 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -617,7 +617,8 @@ static int ddebug_exec_queries(char *query, const char *modname)
 
 /* apply a new class-param setting */
 static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
-				     unsigned long *new_bits, unsigned long *old_bits,
+				     const unsigned long *new_bits,
+				     const unsigned long old_bits,
 				     const char *query_modname)
 {
 #define QUERY_SIZE 128
@@ -626,12 +627,12 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
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
@@ -643,9 +644,9 @@ static int ddebug_apply_class_bitmap(const struct ddebug_class_param *dcp,
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
@@ -693,7 +694,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 			inrep &= CLASSMAP_BITMASK(map->length);
 		}
 		v2pr_info("bits:0x%lx > %s.%s\n", inrep, mod_name ?: "*", KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &inrep, dcp->bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &inrep, *dcp->bits, mod_name);
 		*dcp->bits = inrep;
 		break;
 	case DD_CLASS_TYPE_LEVEL_NUM:
@@ -706,7 +707,7 @@ static int param_set_dyndbg_module_classes(const char *instr,
 		old_bits = CLASSMAP_BITMASK(*dcp->lvl);
 		new_bits = CLASSMAP_BITMASK(inrep);
 		v2pr_info("lvl:%ld bits:0x%lx > %s\n", inrep, new_bits, KP_NAME(kp));
-		totct += ddebug_apply_class_bitmap(dcp, &new_bits, &old_bits, mod_name);
+		totct += ddebug_apply_class_bitmap(dcp, &new_bits, old_bits, mod_name);
 		*dcp->lvl = inrep;
 		break;
 	default:

-- 
2.55.0

