Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683552;
	b=QlZajtHFaFvwFVUjpMhMEX2KgD2Q1/HY6IaG0l4LnCE2kaDxhSKgbwlQu60Jd2MdHMuX
	 RUPYRCcbK8g2x0xX7Hl9QU0E4Pr5+iYplV/KN8W2vD3a3FpAak8Ts3+Lxlh6gMsOvY8oc
	 oV/WGWJu6cIfAXXPGJ7NbW9EjaImINZ+w1HEDSFUVagRYcDT3YHm/cZTJtXYvfsWQ8cEA
	 UqOEz70QPrctKd1axexuhujSRyIVNqORHkEnPFxQuvtR/HJIDb/DmkgvLK6vcqv/+PwFi
	 iywogfK9p0Pfgvj4WH290b0mYpVLZuytQ8TbLrpSPaMEzF4eLOCMfIZ/EthherohPFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zk1U6OrL5ve/ZLld4Y9bZjNucrlJcjMr3XUErdzixqc=;
	b=CMJnksxQe8DQbshO2/Q+8ZtEo7a8DdwtJzsRggzBPvklYaxb9IMIXh8MlHcWcm/LNRWZ
	 Mf/YACWNWn44OVe+i5EQ60gXRlZpEa+DhSUTf5TjqZhbi9/ue+DYM+141uvcl+3RsN94+
	 BKLtOvBxedg7p1ylsNtq+ZwWDKanIRxa9yAHTkJ8LA08ByIb+w0G7jVta2YOg5u2nPYdh
	 5i4KKuXgE0P3FfRHLP8qEonSK9iDLelIiSwfmpGvLKco7PU+7cjADrkYQoAhBQ+YqCkim
	 CkKbkENnd5xpZXcjtJc0J/uXHuto1QUdoMOLqgEyuZ8jMT2Q7Gx0AUCuuIbPgAt4KOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KELR6A1E;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B594606A327
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 08:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B594606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KELR6A1E
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49465892f7bso4886735f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 00:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683550; x=1796288350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zk1U6OrL5ve/ZLld4Y9bZjNucrlJcjMr3XUErdzixqc=;
        b=KELR6A1ERHJ5dyS1Xl9ZW83pgdM9j8mqX0ssemh3XbXSN9ByW7uitgvbd6tEf79eTA
         2spdOQ79mT3ctHZNxMwLuNrIetDY6LgtDoc5voCo5YyA99GLKCVdcnuHZl0+fQUJaboo
         r4XHFv/oea2MX2dfQsnF51sLQdVfmNUdnxY39fSYuQLUbNulECNc5M3aerMBPzmdBWWq
         tSaiih3HaM3HP2EK3E5N6KlQ5Chd1gm9bH8s4ob+9eR7YDTTOBmafJfsUebN7NLdZCCK
         B+4cI2v/1+CfidfP52ihW6tEppDa8OSexe3y/T2Jn6tveWlmlf53yFndakJ7xHwUT6zJ
         tFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683550; x=1796288350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zk1U6OrL5ve/ZLld4Y9bZjNucrlJcjMr3XUErdzixqc=;
        b=HJFl1yAIYqMZvWsVq7JKuisBNxYcTl7xs5/D+kuu+APlPXmGXYjOD22PDgwIQR6F7o
         950Rw+9R5W+2N5ap3kRzDGypEihXuMlEYrmMJDH9aJ4YEZLamPUaQQXQYCeygZ7Zba+z
         RzYJCHEnqOnnd2BTfqkwmdblGEHy54nPyKHR0rTD9IjW7M1H6tgxOlBlimWubN2sd4Zw
         6nNTR7zic0dWNXXdTLnd97K2oVCCUW/mJSEfyy8sGCcuGRwZpkzTIjG9CtVNV4F69wTj
         7Lhgsb1zW5R/s9nDnK2B3LAANgFZSBcBnBUzxxFFrwPzyDu9nosrp7TcLeo6kRqIDLv+
         Ioug==
X-Forwarded-Encrypted: i=1; AL+hErHw/7QYkTu8tqg4WP/LAOc3pOlUTR1pCxU/CSCbEcV98c9jR31FRJPjgzLLpQCzWUfvRuypTnJIhMU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fXSFW2t69xI2l5LxigWYOihdw00YQgdXXCs1SwQWnmyxCeOSl
	YEVNAruE/y6hMZbinYHMDQjNlP5bBg5BlnWYowg2A7MR6zLX51LvNnOl
X-Gm-Gg: AZFdTZeMaf7U1ihs2Lj+48Gf6bHFK9uWBWT5NLKejoY6DLR6O7/FurxX7xxNQqSDyv4
	f187qaox49OcDBLBQMoQ09Da6Ebc/qapEylOfMiUY/cllRLD45K1KNLk4CcLLX3M78UPbYz5Ome
	aR+G6vv3fPBZNoXC54qvCnf3gONj4afhRR4nD+8vBRES9JKhbsuwBAf28meRjQ6O7NQWmfRIMcJ
	GddkSK5TOfyj+Ke7miZkeXNDBX6htTw0HKceFp5fAXQTKgRg4oOOlZcAPGuptwrYv1bOA+arFg0
	KC5w6yGjwd8ypFRISow53ldiy7mCGA/vIEEwPkJJpzUfo6oQd986h4zOnMTHZxnxdWgloqGvff8
	slErghcAP0yAi0anCOOOKfxj4G9++WE7bsYooGf+sWPfmaOf1K2sa1faBvpioivnshoinTC//sZ
	mhKTkvtORlLyyBrLgjagt95RYZvY1Hxba/BNYj9OnQtJcVHhIKC9v5BSlwyvSu1OzbG4aLo3MBX
	d70R8huDyoHV8dTciiF7fAkqZYvVIyvogoIhnpPO8k0yREwypgQmzCTX1o1hE6oFQMNfIahHg1K
	0rhOFLKjLlfWl36hkKqh538bTn8p4iD6DGd4Jx5GhIKF8LsEhsK0nA==
X-Received: by 2002:a05:6000:4812:b0:4a9:1b17:4f34 with SMTP id ffacd0b85a97d-4abb57f7036mr36892313f8f.50.1795683549791;
        Thu, 26 Nov 2026 00:59:09 -0800 (PST)
Received: from center.. ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm40313744f8f.58.2026.11.26.00.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:59:09 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de
Cc: linux-mtd@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linusw@kernel.org,
	kaloz@kernel.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	Orgad Shaneh <orgads@gmail.com>
Subject: [PATCH v5 1/4] mtd: maps: only point() maps read through the simple accessors
Date: Thu, 26 Nov 2026 08:59:03 +0000
Message-ID: <20261126085906.814373-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126085906.814373-1-orgads@gmail.com>
References: <20261126085906.814373-1-orgads@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
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
- the cobalt PCI driver's flash map (drivers/media/pci/cobalt/
  cobalt-flash.c) reads at an offset inside a PCI BAR while leaving
  phys 0;
- the Octeon bootbus flash map takes octeon_bootbus_sem in its
  accessors, which a pointed read on an Intel NOR skips.

cfi_cmdset_0001 hands such pointers to jffs2 today, and the IXP4xx
boards carry Intel StrataFlash. lpddr, map_ram and map_rom enable
point() on the same terms (map_rom unconditionally). Add
map_is_simple(), true when the map reads through the simple accessors
(always true without CONFIG_MTD_COMPLEX_MAPPINGS, where the accessors
are inline), and require it in all four before enabling point(). Maps
with custom accessors fall back to copying through them; on big-endian
IXP4xx, where pointed reads happened to work, jffs2 mounts get slower.

Fixes: 9d3b5086f6d4 ("mtd: physmap_of_gemini: Handle pin control")
Fixes: 2aba2f2a704d ("mtd: physmap_of: add a hook for Intel IXP4xx flash probing")
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Imre Kaloz <kaloz@kernel.org>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Cc: John Crispin <john@phrozen.org>
---
v5: no change.
v4: also gate lpddr, map_ram and map_rom, which point() on the same
    terms; those three are compile-tested only. Rebased onto
    v7.4-rc1; the Assisted-by tag is dropped (an LLM helped write
    this series).
v3: Assisted-by in the documented form.
v2: no change.


 drivers/mtd/chips/cfi_cmdset_0001.c |  2 +-
 drivers/mtd/chips/map_ram.c         |  4 ++--
 drivers/mtd/chips/map_rom.c         |  6 ++++--
 drivers/mtd/lpddr/lpddr_cmds.c      |  2 +-
 drivers/mtd/maps/map_funcs.c        | 12 ++++++++++++
 include/linux/mtd/map.h             |  2 ++
 6 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
index e5805eebe..42fb0427a 100644
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
diff --git a/drivers/mtd/chips/map_ram.c b/drivers/mtd/chips/map_ram.c
index 2dde70e74..77c912f1c 100644
--- a/drivers/mtd/chips/map_ram.c
+++ b/drivers/mtd/chips/map_ram.c
@@ -74,8 +74,8 @@ static struct mtd_info *map_ram_probe(struct map_info *map)
 	mtd->flags = MTD_CAP_RAM;
 	mtd->writesize = 1;
 
-	/* Disable direct access when NO_XIP is set */
-	if (map->phys != NO_XIP) {
+	/* Disable direct access when NO_XIP is set or the map has its own accessors */
+	if (map->phys != NO_XIP && map_is_simple(map)) {
 		mtd->_point = mapram_point;
 		mtd->_unpoint = mapram_unpoint;
 	}
diff --git a/drivers/mtd/chips/map_rom.c b/drivers/mtd/chips/map_rom.c
index dbc34e886..65daa1454 100644
--- a/drivers/mtd/chips/map_rom.c
+++ b/drivers/mtd/chips/map_rom.c
@@ -54,8 +54,10 @@ static struct mtd_info *map_rom_probe(struct map_info *map)
 	mtd->name = map->name;
 	mtd->type = MTD_ROM;
 	mtd->size = map->size;
-	mtd->_point = maprom_point;
-	mtd->_unpoint = maprom_unpoint;
+	if (map_is_simple(map)) {
+		mtd->_point = maprom_point;
+		mtd->_unpoint = maprom_unpoint;
+	}
 	mtd->_read = maprom_read;
 	mtd->_write = maprom_write;
 	mtd->_sync = maprom_nop;
diff --git a/drivers/mtd/lpddr/lpddr_cmds.c b/drivers/mtd/lpddr/lpddr_cmds.c
index a4167ee5e..23f05500e 100644
--- a/drivers/mtd/lpddr/lpddr_cmds.c
+++ b/drivers/mtd/lpddr/lpddr_cmds.c
@@ -57,7 +57,7 @@ struct mtd_info *lpddr_cmdset(struct map_info *map)
 	mtd->_writev = lpddr_writev;
 	mtd->_lock = lpddr_lock;
 	mtd->_unlock = lpddr_unlock;
-	if (map_is_linear(map)) {
+	if (map_is_linear(map) && map_is_simple(map)) {
 		mtd->_point = lpddr_point;
 		mtd->_unpoint = lpddr_unpoint;
 	}
diff --git a/drivers/mtd/maps/map_funcs.c b/drivers/mtd/maps/map_funcs.c
index b0054933c..59917949b 100644
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
index 75b0b2abc..ebee3fe1d 100644
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

