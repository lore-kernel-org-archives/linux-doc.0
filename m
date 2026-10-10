Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0CD370AD4
	for <linux-doc@vger.kernel.org>; Sat, 10 Oct 2026 18:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791655734; cv=none; b=CbKVtC81uwlxnaNGGQDNLUxOYMEIpYHmId7el2Cz0hDzAToN4etLCX5bdALaQL6jV1DhVEnVuIpSKiDCkatcog/4G0TxVD6ghxrylv2d2vaPJDavxJ236EwwZtrvO0HY9LOJccl2LHQGvHwaalGr+/YhlYMG79DeX6re2uDxAcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791655734; c=relaxed/simple;
	bh=efG0LPwWpnCuyTOzbhovMwCos3QoQ+/RLRNQqktiG64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pQTrZi9HSs7Zd/iA9+aZ+ZjKo6fIfjK5xzMGsNTrHV4cXKUcIMxA7vxeYlghtsFNQwc7UiZHO3AJHqoyuEX1TdXUhCLBC6Ieo0LhI7dySowg72emDVYIH5whr1WGI7F6R7ydyqw91udNPDP2xvLA89wE++FhP6qBt+nh0zTr9Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VzS0wAgc; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzS0wAgc"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so6478675e9.1
        for <linux-doc@vger.kernel.org>; Sat, 10 Oct 2026 11:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791655731; x=1792260531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwjLjIdBjLhSbHy5MbJpSboN8vZWvV8OrJbj2jSTRdo=;
        b=VzS0wAgcU4tultWaoc6xAwtqnxJLL9VAqDwwRohVaC2oUTaqY/nGjUKfC3g4TEyThz
         haJxQRS5rtBWJM166HSGy6Zt2cZgINowUnOhUxJusbQAtIqRGQRM/Qk456usLIeYFtLd
         9RBXtRldl2t8FzcWhdUzU7oAAepcGsXhseHZRtHdSKR2SaSeeJxmBIJtb//69F5DROqp
         YOzjZhAsX7HOZBX7dr+B37Zk8Nx6l6DRWTCunq1m1Nz8L7Qdklg4C+ZioKtMLRPaQflK
         7aJuS0ithiInGxFKXnYv5AsXUZvE3PWLJRlyKTHD1U8kbJSRxBMSPHdLSFXOgeJ8Z4BX
         aQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791655731; x=1792260531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hwjLjIdBjLhSbHy5MbJpSboN8vZWvV8OrJbj2jSTRdo=;
        b=bAPTMJIlCr4PMEe4mTX5qd6ENAnfnAdwD0hxK2snN2DxuYPnwwiv2D2CKRyQiGb/0B
         uYB/HVfjVlSQhMYc9gWEwrJLxB7Pu44xDPJfajwnAXkB6hwLXu8swmLVBxCvABr/dgzy
         Hbg3jnM/uNJTDBc7eQegC39gfDbX3TkeSstIVMFxY30HZGXBxxatzTQy5+FXdNsLoEaR
         w7obOq9yX2EUtIBzKWWMLF/oEPsePx2HENOUqtFmDsx4G5c/NmDegFLYPJMDKc+5q85C
         JEr7qc2xTroTEQR7cRnVuznbJmGWEbAJi5wHtk8jmR0qN10eCCm8t9kgtDEa6btdlzv8
         4JyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOoPgPjEEqVlEQPJvoD3fuc/QPws6ZrNZx+ASFb+0Y33Hl8SmCnXitOThfoYcPS1mBh9gsE9yQusg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxGsT4/LXGuLdl+t6X3CXIA1ssRe4XdOKwh1NT0HhlRhIukah5
	0vyG3Kr8HyAE4DAVGrbm8aAcFbO/pG9NbuxYKtZ13YlG/EFz7EVQsAbE
X-Gm-Gg: AYBFou2jkVoJqnJr1J2zh90V4mtWqQ3WpNPlPRbajqDXBNelqKB5SzruqgO52SMZWEv
	bSm3+clcFHICgmuVG/HpbM+8VZ2aCzwKbqwKFpdPmYQhmEm9kBxzmyvJzYAk8L5FSkREsnRGwSl
	1zCOJU/gelaTXgQkb1DivyGJjcElvs7OF+mX6AuYF8G5GNhsUtC2Tfs7acqSQ/tYAiugVQmHMgm
	GDfbrmUm6GAZwezlgeCeNig4PTEwdG+IaRA5icfmCOP17YgkmXfa+9gAttRMjuMh1frAALaqS2R
	q/cOGOY/dNpZgmWs/4+CFcqWI8NsI5Okh5tBAJqmgktEcB2uavPLAlMXh0kJ7g7Z3yZLTq2xoyv
	W5wUPPko4TqK5uKcOMWAmuPn8IAsko3DrmWsrKHpOtNGp4XZVulJDy5ZeL1MmTEo5ASF+FUiCeE
	Tw0+kWiyg3fwIGEgyWMStZxBN31s786t/XuIr5vG8xBWBwNmz3Yl+djXua3tjVBycYDUvtZkIYL
	OW2ipLNhcvyh7cEIRAGcKY8iImpvU0nKHT0/IO/romaGn1bFuhNt6oMNa8nWi1Is9NmCXmTjFQy
	7qNOxTxTLPZoL0dMkGvSD2aUgGU=
X-Received: by 2002:a05:600c:674a:b0:4a1:7cf8:5433 with SMTP id 5b1f17b1804b1-4a18e443ee9mr99738155e9.3.1791655731151;
        Sat, 10 Oct 2026 11:08:51 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db97ce3aasm10187163f8f.21.2026.10.10.11.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 11:08:49 -0700 (PDT)
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
Subject: [PATCH v2 3/3] MIPS: Octeon: flash: use the simple map accessors without a shared eMMC
Date: Sat, 10 Oct 2026 18:08:40 +0000
Message-ID: <20261010180840.2152492-4-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261010180840.2152492-1-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261010180840.2152492-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CAVIUM_OCTEON_SOC selects MTD_COMPLEX_MAPPINGS, and since
commit 8c1e6b14e27d ("MIPS: OCTEON: Protect accesses to bootbus flash
with octeon_bootbus_sem.") the flash map accessors take the semaphore
around every access. Its only other user is the eMMC host of the older
parts ("cavium,octeon-6130-mmc" in drivers/mmc/host/cavium-octeon.c),
which shares the boot bus; the CIU3 parts serialize their eMMC with a
lock of their own.

On boards without that host the semaphore guards nothing, but the
custom accessors make the map non-simple, so MTD will not let jffs2
point at it and its mount copies every used eraseblock. Use
simple_map_init() there. The test is for the node, not the driver, so
a disabled mmc node keeps the semaphore.

simple_map_init() BUG()s on an unsupported bank width; the old code
warned and then hit the BUG() in the inline map accessors on the first
probe command. Check the width before mapping anything and fail the
probe instead.

On an Octeon CN6635 board (no eMMC) with a 100 MB jffs2 partition on
an 8-bit NOR the mount drops from 15-30 s to under 1 s together with
point() support in cfi_cmdset_0002.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v2: check the bank width before ioremap() and drop the added
    iounmap() calls: flash_map is one static instance, so they could
    unmap a mapping that an earlier probe registered (sashiko).

 arch/mips/cavium-octeon/flash_setup.c | 36 +++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 5 deletions(-)

diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
index 9242521..1c0b7d7 100644
--- a/arch/mips/cavium-octeon/flash_setup.c
+++ b/arch/mips/cavium-octeon/flash_setup.c
@@ -63,6 +63,17 @@ static void octeon_flash_map_copy_to(struct map_info *map, unsigned long to,
 	up(&octeon_bootbus_sem);
 }
 
+static bool octeon_flash_bus_shared(void)
+{
+	struct device_node *np;
+	bool shared;
+
+	np = of_find_compatible_node(NULL, NULL, "cavium,octeon-6130-mmc");
+	shared = !!np;
+	of_node_put(np);
+	return shared;
+}
+
 /*
  * Module/ driver initialization.
  *
@@ -85,6 +96,12 @@ static int octeon_flash_probe(struct platform_device *pdev)
 	 */
 	region_cfg.u64 = cvmx_read_csr(CVMX_MIO_BOOT_REG_CFGX(cs));
 	if (region_cfg.s.en) {
+		/* 8-bit bus (0 + 1) or 16-bit bus (1 + 1) */
+		if (!map_bankwidth_supported(region_cfg.s.width + 1)) {
+			pr_err("Unsupported flash bank width %d\n",
+			       region_cfg.s.width + 1);
+			return -EINVAL;
+		}
 		/*
 		 * The bootloader always takes the flash and sets its
 		 * address so the entire flash fits below
@@ -102,11 +119,20 @@ static int octeon_flash_probe(struct platform_device *pdev)
 		flash_map.virt = ioremap(flash_map.phys, flash_map.size);
 		pr_notice("Bootbus flash: Setting flash for %luMB flash at "
 			  "0x%08llx\n", flash_map.size >> 20, flash_map.phys);
-		WARN_ON(!map_bankwidth_supported(flash_map.bankwidth));
-		flash_map.read = octeon_flash_map_read;
-		flash_map.write = octeon_flash_map_write;
-		flash_map.copy_from = octeon_flash_map_copy_from;
-		flash_map.copy_to = octeon_flash_map_copy_to;
+		/*
+		 * The boot bus semaphore only serializes the flash against
+		 * an eMMC host that shares the bus (the CIU3 parts have
+		 * their own). Without one, use the simple accessors: they
+		 * let MTD point at the flash, so jffs2 scans it in place.
+		 */
+		if (octeon_flash_bus_shared()) {
+			flash_map.read = octeon_flash_map_read;
+			flash_map.write = octeon_flash_map_write;
+			flash_map.copy_from = octeon_flash_map_copy_from;
+			flash_map.copy_to = octeon_flash_map_copy_to;
+		} else {
+			simple_map_init(&flash_map);
+		}
 		mymtd = do_map_probe("cfi_probe", &flash_map);
 		if (mymtd) {
 			mymtd->owner = THIS_MODULE;
-- 
2.53.0

