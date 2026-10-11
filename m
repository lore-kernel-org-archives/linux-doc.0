Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924A23E450D
	for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 06:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791700155; cv=none; b=W0HP87VTeTUnt6WBtusY6r9TL9l9fgaaGTfVEOqNVg9wNzHq5LfG1MY3zH+u0i+1OMYyEsQJeHK/qAygjiW++k37gaPVFCsfkm/QQFbdImPwHMQtr+d6SWN995Ebi8gXSbqAs+sA8LMV1Q1EGf22LkbT/RSoBHbteH1tRFrUOVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791700155; c=relaxed/simple;
	bh=YJNMvslRmkn09SPy7BJ4jSRFdTRxBo4XKPoVkcqETJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dB4c3N3kASar7JGB+hG7Np6RAF1c4V71liwn05Lwidqo6bkMYsfXXTjNmW8bUXzXyQ8ylUh/ScRisYuXnORxbqU32nwGnNcDoUStXfGCyKoiWqndK0mWchJE3eNn4JoFWLp/hzJjC56Dt5SeSVa4QYI2girHRrFFyD2IeKgjsUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkALZgqo; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkALZgqo"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a02753c04fso4501285e9.3
        for <linux-doc@vger.kernel.org>; Sat, 10 Oct 2026 23:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791700152; x=1792304952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JuzYqr333bVnyPHn9BORMpm/ycVJyKnySjL8xjIdXeU=;
        b=fkALZgqoKtaxPlBei/RvufR/H32tbRKCi2MVY8i/ghob+a8oWo4b79/fJ4q6lg17vZ
         sAjsMEHiWYJEWYs2krRSr9H6/jEsc2dd46+5GIDA+hzDdpQpYqCkWV5SzcjG+ZTuO6Rn
         VLALl7w78YrDq/uKWYrHqPulNVXfh96zDE7knXID+yG6RLIYHd9HbcVxBlQJH+0F4uvX
         PO6iEMqw2nUbCg10G3lSbjHxXQdVqn/aeABClEbqSuacJZEpazPxJp3ZJSul3pykRU8q
         QE+LvPXcj1z5jx4d3kQWA3K5x7YQKRbMZpdbPrYOn0b9lxEKORhZG+cqPOy0CmV8tEWS
         Efjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791700152; x=1792304952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JuzYqr333bVnyPHn9BORMpm/ycVJyKnySjL8xjIdXeU=;
        b=gdcTWE0JXCPk27A3qtdHjJU76iFdFh3Bk8bXPmK3OKTKUTLRuIKYaCqHJOlpQfBapB
         i9CA4IGFbIjGavM3fdZ9DCsPjuHBMiMDGZJ7AqFEDqkyDUnEtW7gNFJMpaZbxgGwDBid
         mraQGI5LvlsYxRKm5ieJbjVeV7XvI/OxH3mgR3AVf/o+Zn5fzsSWahhg/WYcsrtjOlnI
         pbhER5euPv6SFbE2wX3oqKLT5epvyrjLj4ACXTDioqjEotRXub0vPYwCNyav4mN3vbmM
         Q66m7/srnSGpSoa0yeuu2/8h1tFq4lp6CNs/6I8df4qP71v0BB3eTOvte+YyWBTnAZiz
         Z41g==
X-Forwarded-Encrypted: i=1; AKwUvBwS1GLNxhIDvjd5YQUYlBXw9x5iCQF7irf34XixSwOHoO+//rVRPU7cMoY9xBiq0XAJrBvsg3wYvq0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJQDp+CWtVHdh8kaO7Hb899DzvOM8SUR8XBmhulPAVpHPy/fcS
	jMY3ry/5cUNQNc5M/pfE3iU9OT3eVtsjzg+X5YiqoskBRU0vIDiphBxu
X-Gm-Gg: AYBFou2yuPVWGLWiL8tJSOdpAFE3gQ+NnVWqzWoCYx41E3ZAJfRPGgHRr35DWTH3EKd
	+Rw1rS56sKEWVcawy41aFUutAo2CkpNzs/YEP7QfThWE4aBEUnJSLdLwW7gGcWbtkHPr82KIlo0
	uXTWbSMmZ8KffxaD9m2bSiwoNmQ+sSHt8fU4NCeD1qbscagBUXtoxpDmuTWMh4th9ssOYv3EhLl
	XTjHuGpf5MeXDS5ua4q/KDSpSyKwCAU23bJpXlXD3xuM3zXRh0Dmer/BLQApeQYpCQvnnzTvY/U
	mqMnRnONN5xBBVpJ6fOUBljB0Ocy45Wo2a6Dit0K3hve1y2dEg7kA/SArPIPq4uHilXDdDZuVMB
	N60uq/iwX15NYFEa+b4xpeTRTZ02blsRrcjxMVVICB1UFQkGnXBe2ZjZ69GdeYgOtHC8Z+3PJln
	GNzveF2aYrghm5Lh8HKU6KEbyQT1+5tJaG9Umua8Spr34RLAWMJic024IFbfGiV/6ePhz+UV9z3
	9TKdXevZ7R+gmIfmKqINkJQ25UNnpCpTMIXkqw1EXfdLDJ23p+cnOxXf8uXc4O61s8EfbmCX0FI
	RG1CRCWJeWvZq5wG
X-Received: by 2002:a05:600c:e548:10b0:49f:e427:e88f with SMTP id 5b1f17b1804b1-4a18e4b584amr69996185e9.21.1791700151689;
        Sat, 10 Oct 2026 23:29:11 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18f3b43efsm222579135e9.1.2026.10.10.23.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 23:29:11 -0700 (PDT)
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
Subject: [PATCH v3 3/3] MIPS: Octeon: flash: use the simple map accessors without a shared eMMC
Date: Sun, 11 Oct 2026 06:29:08 +0000
Message-ID: <20261011062908.2365879-4-orgads@gmail.com>
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

Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v3: Assisted-by in the documented form.
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

