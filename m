Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5004D279DB1
	for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 06:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791700153; cv=none; b=CI96L6GLUbBCrloW8Kah9uF42gg5NdEYoK1lQYhC4E9UxjTZIY575cnxqYLhDeHbhH7b3rU0XTpCKudS1Qrlb6iFY3JQnRfTakq7bGdJpjXKY9hKi1ZMmi6z/go+LpyfYV78HYk0KeNefbSYh+LQvHCwPRHL6+wPYDeDBsvZ610=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791700153; c=relaxed/simple;
	bh=UYl7GG29pVoxbjANdthqYJc7xSCew3lqNnW++pmlefw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uh598z6EaJCGVYk+B6JsQugE4oQoJBiAK1aafPMcWT2XdnXiG9H6F4r4+pfLWyGQlJxbd7c98HHD7d350p37oPV5SnxenPCJ/LVRDoWl3Yr+KhRoHIALy4/fmFCtzmokTTDIyvSRSs9QpxI+01jJEilVBdoSanthkP76M3355S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pwvqkccl; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pwvqkccl"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so8329885e9.1
        for <linux-doc@vger.kernel.org>; Sat, 10 Oct 2026 23:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791700150; x=1792304950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/5wr4Yem6D2zrv5o4x8ilebf1uR28mL2hG9tF4MSATs=;
        b=pwvqkcclTAzCPwiuXeW6VBwKbpT4EcCjWX/dOt+BBUXUO91LXtC3aeGQnaMRo8wFod
         i41WaC6ikbkSQ210zOAn5dlVSeXTv2HRLbHauvohl8matEEXLlCzVeSSmvMX684nNZjl
         CxiaVfKeJ2Z8g/LNKnWZ9TQYA1PLDYuu+x3fh6FJAz8RIakTQN5NYXyCaGUazX8VCUjr
         MzMym/1/AkMh/cp1cbDg0CtYTSmd7Pbi377SSHOmj2S8D8kPpwmRscUz0l7T8fiCaUuZ
         Cd4GA6tiYzBXBKrtpmDrtiaUtTYCOmO9a+GlSE+tKRwIyVHqG6Y5ANh1DI8hspkDyFLB
         jhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791700150; x=1792304950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/5wr4Yem6D2zrv5o4x8ilebf1uR28mL2hG9tF4MSATs=;
        b=aTSM8T6j/J2Vhzu6tCU2+ASwcQTrewHsUF0xJ0EtS95ZDjGEV7bmwFz8PJA/37opaC
         yODeo3FE/dMv1APxVX/u/m7RPVGkRKRagksp2el5/zw17Y5aK5utPgWjD+ad6nw/jYPQ
         jhf4MHvqryNMfSRWyQzaOpjPdRJ5yg8qaauJbA7hUgXI2kCiH690TVhHMYxw2ItSbRSF
         YCCsQbVNrwAr7R7OI4sdE9sRdEhM01HEtmI4BW50qvalbfSO7xmIVtAVu2xPyyVdtMKl
         zhi6N766zPEayOxfB/xSEKVSeNo4kpv0rZlbwgb7YoPlM6p1is6QVBGRhtwPVf6NdaZg
         KmSw==
X-Forwarded-Encrypted: i=1; AKwUvBwAWoifo02z4xFOXcvN50mKPwIQq6hIlsf3OqlysxP5HywMYX8FIkUXG71i1hZ9K+/DuWanTVan8SU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7H6wcLEEqtH21HfTo8u6gxHigsiITX4iNIU+Hq8kYTNdp32GW
	34TZyAez+VSpCEuv0xGigZ80928fngbbSR/zel92ePEQqkDt2VJvPZAk
X-Gm-Gg: AYBFou3qqtUgZu1R9ics1VJsrRDFMzfHHKTctPYCcsiI8+1cqo2nvDzBxntUOW4atMz
	PbfrlcXgzmpMU/3fc5URjySPgztPEfSmdJQx3pOPwdOmso/Mw4mSl730Cr+2kMQR365oa+nyZgh
	qaPG36oc/1pIaoM3y9MAuMIKUmT/JdL1RSwlbA44ZONimLxOuH8027qH2CM84QB/cRF9cABl6k6
	N4EQu+ckMQcqSmgQYJ+tZN4JMWeepYeWGS0brDLje4mGmm/XxNTXpaFBs1m9D+5xDrpIS0uzf4K
	Nj8oZ/GGmu2KKOF3JMaBpYMD/hDUFnvx/b08g6qLK9ozpGpBXsNq/gEjapAL3E5TGCxA8wJCQEK
	ylCaJan6b86/Gcg627lGFb6f0q6Ha2fkTBaHUDAdtNoqbxiSIZ2MIeN6rk+qR1dFIOv26MPWi1f
	7llayfxA3qKUH+BH4kiX6q9Y6gj7r4lwbehoe3E5PTuVsJTpa/yrrFKgbBilSnqOZH+0Max6sPP
	oLo8uYg47nHAXjB/KeLwRmQ/Ywo20uxhHnUG+uG7PIn+Q3Yr33t55O1fkDSljUZBV1qjE2Us5yU
	LcwTBS+aX19tSHm8
X-Received: by 2002:a05:600c:34d0:b0:4a0:35c:8953 with SMTP id 5b1f17b1804b1-4a18e47aceamr119132065e9.7.1791700150312;
        Sat, 10 Oct 2026 23:29:10 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18f3b43efsm222579135e9.1.2026.10.10.23.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 23:29:10 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@openwrt.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 1/3] mtd: maps: only point() maps read through the simple accessors
Date: Sun, 11 Oct 2026 06:29:06 +0000
Message-ID: <20261011062908.2365879-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011062908.2365879-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261011062908.2365879-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

map_is_linear() only checks that a map has a physical address. Map
drivers that install their own accessors keep one, and a pointer
bypasses whatever those accessors do:

- physmap's IXP4xx support: the expansion bus only takes 16-bit
  accesses (the reason it cannot use memcpy_fromio()), and on
  little-endian kernels every access also flips address bit 1 and
  swaps bytes;
- physmap's Gemini support enables the flash pins only inside its
  accessors;
- lantiq-flash serializes the external bus against PCI and copies byte
  by byte because the EBU cannot take a prefetching memcpy;
- cobalt-flash reads at an offset inside a PCI BAR while leaving phys 0.

cfi_cmdset_0001 hands such pointers to jffs2 today, and the IXP4xx
boards carry Intel StrataFlash. Add map_is_simple(), true when the map
reads through the simple accessors (always true without
CONFIG_MTD_COMPLEX_MAPPINGS, where the accessors are inline), and
require it before enabling point(). Maps with custom accessors fall
back to copying through them; on big-endian IXP4xx, where pointed reads
happened to work, jffs2 mounts get slower.

Fixes: 9d3b5086f6d4 ("mtd: physmap_of_gemini: Handle pin control")
Fixes: 2aba2f2a704d ("mtd: physmap_of: add a hook for Intel IXP4xx flash probing")
Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Imre Kaloz <kaloz@openwrt.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: John Crispin <john@phrozen.org>
---
v3: Assisted-by in the documented form.
v2: no change.

 drivers/mtd/chips/cfi_cmdset_0001.c |  2 +-
 drivers/mtd/maps/map_funcs.c        | 12 ++++++++++++
 include/linux/mtd/map.h             |  2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index b73596a..3f3364c 100644
--- a/drivers/mtd/chips/cfi_cmdset_0001.c
+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
@@ -299,7 +299,7 @@ static void fixup_LH28F640BF(struct mtd_info *mtd)
 static void fixup_use_point(struct mtd_info *mtd)
 {
 	struct map_info *map = mtd->priv;
-	if (!mtd->_point && map_is_linear(map)) {
+	if (!mtd->_point && map_is_linear(map) && map_is_simple(map)) {
 		mtd->_point   = cfi_intelext_point;
 		mtd->_unpoint = cfi_intelext_unpoint;
 	}
diff --git a/drivers/mtd/maps/map_funcs.c b/drivers/mtd/maps/map_funcs.c
index 1a4add9..ccf1dbf 100644
--- a/drivers/mtd/maps/map_funcs.c
+++ b/drivers/mtd/maps/map_funcs.c
@@ -41,5 +41,17 @@ void simple_map_init(struct map_info *map)
 }
 
 EXPORT_SYMBOL(simple_map_init);
+
+/*
+ * True when every access goes through the simple accessors, so a reader
+ * may use map->virt directly; a map with its own accessors (byte swaps,
+ * bus locking, address fixups) must not be pointed at.
+ */
+bool map_is_simple(struct map_info *map)
+{
+	return map->read == simple_map_read &&
+	       map->copy_from == simple_map_copy_from;
+}
+EXPORT_SYMBOL(map_is_simple);
 MODULE_DESCRIPTION("Out-of-line map I/O");
 MODULE_LICENSE("GPL");
diff --git a/include/linux/mtd/map.h b/include/linux/mtd/map.h
index 75b0b2a..ebee3fe 100644
--- a/include/linux/mtd/map.h
+++ b/include/linux/mtd/map.h
@@ -449,6 +449,7 @@ static inline void inline_map_copy_to(struct map_info *map, unsigned long to, co
 #define map_copy_to(map, to, from, len) (map)->copy_to(map, to, from, len)
 
 extern void simple_map_init(struct map_info *);
+bool map_is_simple(struct map_info *map);
 #define map_is_linear(map) (map->phys != NO_XIP)
 
 #else
@@ -460,6 +461,7 @@ extern void simple_map_init(struct map_info *);
 
 #define simple_map_init(map) BUG_ON(!map_bankwidth_supported((map)->bankwidth))
 #define map_is_linear(map) ({ (void)(map); 1; })
+#define map_is_simple(map) ({ (void)(map); 1; })
 
 #endif /* !CONFIG_MTD_COMPLEX_MAPPINGS */
 
-- 
2.53.0

