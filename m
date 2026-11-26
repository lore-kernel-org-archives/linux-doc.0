Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795683555;
	b=QUFEVMCrBqpKlniGULrwmYvMLVAaooD4ZkynxFvpVfPyqW7PID98pLvui4WWn99QfKlJ
	 +2p4yn1JACh35UveEZPqZqabdPuvDURvZuOEeQJ01mMz/yrmOs/+uxNesMz8Gr2MgHoO+
	 dPMkdE09uy7X/51fUTkoPJ/k9drJUqzKnMqryE9ulBB6D7RPFBkhnmMEV+nEocNaFEz1F
	 kmGpdVgzwngA6pu5tkHiyakBsp3kTUVnipVZA63uHbj3N+bGid8E7W5a258kiTOJg53U/
	 JTqb1ifWIfJbhLDHRfOVpdJ5vXaKce4smDdP0jSx2rPJaB3P6GjHIdktUB+z/ZfMKfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795683555;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gzyMYEceM4UybzdO3Fm0gEDCvlgTGJLtnNanAWRt594=;
	b=Tmz2hfq5mMRQEDu4C5J0yhdXL8Oa+TIdPWj2o9cMBm94vUDftuz3CAC3o5vzyKNF61KC
	 62dYd1reFis5v305gVMscI8kgrK2Lq4QPIY/B5MK7L/WDJ8iaGzr0gHZXdvfPCOuoXg0y
	 VB5iTzRfoPffXeTjH5w84r2e1q2cweaOQfZ+nc7Doubh+rCLRqMZERXkPbFOhRSfYrAzL
	 4AD7Cc9jA8mpOtR0V4iJsauhmuBLZNnk68cGZP41wy93WR1lXfMhUdELunLqA/W5KSty+
	 XrSJDC2lcspbrGd6UxgjH2NzuWeBpO00WGHDedLlQvGKSTTg6B8DmCbvV3C95qbEuLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COw5EvXd;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0EE606A334
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 08:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE0EE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=COw5EvXd
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so62981095e9.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 00:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795683553; x=1796288353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gzyMYEceM4UybzdO3Fm0gEDCvlgTGJLtnNanAWRt594=;
        b=COw5EvXdXCGtsUqe13IFUYRsjRWKtq904i7s8JTQiJ4Hdkzr6jyWG1YkMsXCB1pwqH
         jJ77B2eERUhok4x6ck04T4D9GOXQBDRfkbZhtETAK5MPcmIoF2phcupZ7SbgzfD3YdF1
         RC8tE+Z8SVsB5/vbks2o1+Ncv8TMJxmpmPMmSj8YVZveAkpaXx+BkGel1QjrO9Qq7Z5W
         DRvDVbI5hxpK09S5c57aOkdWXekpihDvySYpz1hHVeWt893OSvk0LkLCMr1tD/G18Y0Z
         siWpYh5VM8Tnaz9xaoZIGDSVGn2FVag8R/QySxD2LPJI3Qr6xTn9Alij7nfLF1aAt7jk
         2dXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795683553; x=1796288353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gzyMYEceM4UybzdO3Fm0gEDCvlgTGJLtnNanAWRt594=;
        b=b0RlLJSR9oBvGDm9SJ8fJnla64dObIjeD960etpDw7Zll+fzIfNrTwWlwQju+h3j0p
         WAKTUZkdRVPUksxAmndvb9RbFDrScXAo0K0ewRJ5zulE9DDdnJTOWV+K5I+wcayyxPsQ
         XOi72fytHWca/nrxcsV4pjimiSG9wdSMLHHOHQIamjofQUgCLd6PH9xO7Avcie34SW3c
         DjhoarHRFPqk1Rkbzgtyh7idjUwXqEhp3Rnb9Lldtcgtl7vjMCSWNtjy86IeUPvWTlTq
         BahRz6kfJTf5/+PupL7toP4h3ZuQSX/XtxUedg+WDxNjgaNDbPfvwwiLy7LC9oLJSPzU
         hogA==
X-Forwarded-Encrypted: i=1; AL+hErHTxMUX+5LSQjiTWr8g2RpXKDx8TMkBL7ODEDhRyd5IemvPtwUy91pu///TJfmd385UU+xl4tlZVkE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/63S93kdJLy7lFL3kl3aMLQwXXSCYHR2sqL/DG7pmcaFzIhIk9
	WiuyDwYepWnTIwG5DeSMn1LfVgIWpguZ8xR6Cs4mIf/EnmE7CY21ZKnu
X-Gm-Gg: AZFdTZfgjtIhgSfO2HYsXYgtk3KdWsHByEbGL4zbtHzOm6WnMmyyUQARk8vIzSvX8yK
	OhMQUTN9U1FQQSqAgDg8WbZ1x+sxB/J6edxfKj0q1MTZKZ2B725H65Ns7SXfXq0UEnZMMMoHzkK
	F6G1diJ8aMqoaKov2d3Km5fzhdlLGu0+WpIugKdgfMMc8LNmdJLOdcK5c4ruOipftvDe4vgmh1N
	mMES63yOpiSWqFwWBo8aDG86IjWfyJbkpehUoiXOvwf3zIymUOWHIdT6d2yffdMW6c0CQ6NHTQU
	I7yKBrFfVIss+6MjZ5jw/roLRTnsy5PMP+BvsRIbtwpzEf/j5H4VFj9QeQJI3o+9/ylClpbWvjs
	HJVSF0zL3eVGxi3zCAQNycJvc23izf8wYKFUeU5c0iq869t5EYgceK9hMNGYoTBkCsYgyFI1XuA
	t3WIkb3op0+f+WCKWfWXbZTq9L39rmbF9dwUqBNGNbBTUxwDpHEvzfksTijjV9x5c0DAurrr0fx
	pa3ai0nBl+ynlBrBQGAuUHEaSDmLEnPtEz7dO1MmvWBOzDUvMPHrsA7w5vskzy46znPpBBy+stY
	e1yPNO8iZBZqakyL3bqEad7Yl4B5UgR8d2NXAPzjLAAbqxuGvnZVyhLtiw8Hbwihj2+I0N46akk
	=
X-Received: by 2002:a05:600c:4585:b0:4a1:83f0:7c91 with SMTP id 5b1f17b1804b1-4bb8882948dmr417095995e9.18.1795683553331;
        Thu, 26 Nov 2026 00:59:13 -0800 (PST)
Received: from center.. ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm40313744f8f.58.2026.11.26.00.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 00:59:12 -0800 (PST)
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
Subject: [PATCH v5 4/4] MIPS: Octeon: flash: use the simple map accessors without a shared eMMC
Date: Thu, 26 Nov 2026 08:59:06 +0000
Message-ID: <20261126085906.814373-5-orgads@gmail.com>
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

CAVIUM_OCTEON_SOC selects MTD_COMPLEX_MAPPINGS, and since
commit 8c1e6b14e27d ("MIPS: OCTEON: Protect accesses to bootbus flash
with octeon_bootbus_sem.") the flash map accessors take the semaphore
around every access; that commit gives no reason beyond "Without this,
we get bus errors." The semaphore's only other user is the eMMC host
of the older parts ("cavium,octeon-6130-mmc" in
drivers/mmc/host/cavium-octeon.c), which shares the boot bus; the CIU3
parts serialize their eMMC with a lock of their own.

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

A little-endian kernel keeps the semaphore accessors: the boot bus
there needs the address swizzle of the I/O accessors, and a pointed
address would be read with plain loads.

Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v5: keep the old accessors on little-endian kernels (sashiko);
    quote the reason 8c1e6b14e27d gives, and drop a duplicated
    bank width comment.
v4: rebased onto v7.4-rc1; the Assisted-by tag is dropped (an LLM
    helped write this series).
    On top of the new 3/4: simple_map_init() gets the per-device
    map, and the bank width check runs before the allocation.
v3: Assisted-by in the documented form.
v2: check the bank width before ioremap() and drop the added
    iounmap() calls: flash_map was one static instance, so they could
    unmap a mapping that an earlier probe registered (sashiko).


 arch/mips/cavium-octeon/flash_setup.c | 39 +++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
index d69249acf..896baf52d 100644
--- a/arch/mips/cavium-octeon/flash_setup.c
+++ b/arch/mips/cavium-octeon/flash_setup.c
@@ -61,6 +61,17 @@ static void octeon_flash_map_copy_to(struct map_info *map, unsigned long to,
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
@@ -85,6 +96,11 @@ static int octeon_flash_probe(struct platform_device *pdev)
 	 */
 	region_cfg.u64 = cvmx_read_csr(CVMX_MIO_BOOT_REG_CFGX(cs));
 	if (region_cfg.s.en) {
+		if (!map_bankwidth_supported(region_cfg.s.width + 1)) {
+			pr_err("Unsupported flash bank width %d\n",
+			       region_cfg.s.width + 1);
+			return -EINVAL;
+		}
 		map = devm_kzalloc(&pdev->dev, sizeof(*map), GFP_KERNEL);
 		if (!map)
 			return -ENOMEM;
@@ -107,11 +123,24 @@ static int octeon_flash_probe(struct platform_device *pdev)
 			return -ENOMEM;
 		pr_notice("Bootbus flash: Setting flash for %luMB flash at 0x%08llx\n",
 			  map->size >> 20, map->phys);
-		WARN_ON(!map_bankwidth_supported(map->bankwidth));
-		map->read = octeon_flash_map_read;
-		map->write = octeon_flash_map_write;
-		map->copy_from = octeon_flash_map_copy_from;
-		map->copy_to = octeon_flash_map_copy_to;
+		/*
+		 * The boot bus semaphore only serializes the flash against
+		 * an eMMC host that shares the bus (the CIU3 parts have
+		 * their own). Without one, use the simple accessors: they
+		 * let MTD point at the flash, so jffs2 scans it in place.
+		 * Not on little-endian: the boot bus needs the address
+		 * swizzle of the I/O accessors, which a plain load through
+		 * a pointed address does not get.
+		 */
+		if (octeon_flash_bus_shared() ||
+		    IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN)) {
+			map->read = octeon_flash_map_read;
+			map->write = octeon_flash_map_write;
+			map->copy_from = octeon_flash_map_copy_from;
+			map->copy_to = octeon_flash_map_copy_to;
+		} else {
+			simple_map_init(map);
+		}
 		mtd = do_map_probe("cfi_probe", map);
 		if (!mtd) {
 			pr_err("Failed to register MTD device for flash\n");
-- 
2.53.0

