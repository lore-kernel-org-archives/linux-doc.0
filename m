Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951711;
	b=4PdoHHhAR4fTAep9z1s+PUeVIGIL6pH5j/KyNfkes3zmSgaK6Jz1xt634e7l7Vwt+haz
	 53vXUmA+ORVsFy+SVZuhdZVDITmMu7X6smGbfrsORiP6rURwLLFyd4AxLNUV4lb0wDBA2
	 xqp0QeP6roE0qqdxmYywcrzbT6GSTQNcigWuxKIH/fuDWj2ijEio8Fm03OQTU1PAGKwXa
	 c88FAb6PBRiKHuujyv/u/gIf5XeKnJ117nE3mq/Ema+jyLu40j5Pecwyz4Le8udZ07Ka8
	 PjHFs6HRRL41crnEung7I4uKe5f8urCkWC19FXlIm2YdWeDzveVp5NRrTfD5XaXk0Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FSOzTuildzOc1Vsgs2eOA/FCbZ+NSuERw0qAipq6Ry0=;
	b=INZeDfLcx7wv+5FTiIVrrxRaKRym7lG8ib4iMvicmhNmVsV3c2y2VBRZl7DUaG23ek1G
	 vAujFhJbN+Ac1oYfuzds02SZLOL6kT6OC56xpCjjdUSyhtzZ4LcfoqNKtM8KJvh421uxu
	 kwuGiBRSJv2jiviG7aKTQ2Px8HWpSRhKSEeSy9OwvWKRFmWtChGM4EXdHbmFy26mUGXLj
	 AJokbIl1gdnTY5OVd0x4I23h4HtV5V6uHXzu66aPni1QuIUyw0o73CkXfT1L5zhkTJwn1
	 wDU+G0BEPukPMFOaVslpSaFY2pZF3xRPsQ9Le9q2Ua4NXc/M9MfNzU0+BN6uDqYGo0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ClPu4vBR;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3450606A33F
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 21:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3450606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ClPu4vBR
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490f38e9688so120090f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 13:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951709; x=1795556509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSOzTuildzOc1Vsgs2eOA/FCbZ+NSuERw0qAipq6Ry0=;
        b=ClPu4vBRUY1hKH+8netbBQN2tGVRTiQB/KriMcBkv+gYXyO2f4LvcWw5+AyiNrZXW+
         /AeXw/c/ygFQV+b3+txeb9WibsEWoAD9Dq92E57B5hY9fZQXS4tcLSJ2WvMMywxTMieo
         yLN3yT6MBo3LLR5J17mFQawN9p47rwRvz5ss/3f3mGAh1LXzpJJw7pKtNYb3zNtJ8mye
         Dm4tw3jud6tRZ7DsUMDe+vbdS70OGk3iRaEBiZfCtiyjKT3XYb8YsHAN2whrN3nJ/wqi
         BuLyznW2pp/iiih4aYC70oXurunrmBsiPyE8pu3rphBQN+m0vbyMGZ3TgWseFV75xYAv
         YKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951709; x=1795556509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FSOzTuildzOc1Vsgs2eOA/FCbZ+NSuERw0qAipq6Ry0=;
        b=DMCLkHKa+CvpTBVGMD3JyLvKqI3NIR+ctgdcmfr5/zy1OWL1QojNVXzivojyke8t2a
         slPEFSu3IwQSFuj+dgH5shtbiwOqMFUYAEJeFKwN17Y5QngAfNRVgbRkIAgNiS4WCbeD
         aiFfUi2/1s2Qajubc5CuUp6mIIRcuayT4G6KOHIO5895Us2JEbzZ0+5XdBVgugAOioU1
         qe5KjSuF/VUecseXrB8Ycm3bwc6jLjcvbSRSFAZ9sqAHsePvOdCc+NaQ+lhgRLqpW0pU
         WVUdADN6yM0wgElYOoDvDwnFw5G+yhGorDra1VTCLcOgVBr8gd/EfhNZs2Rn2sVAYwj1
         5e+Q==
X-Forwarded-Encrypted: i=1; AL+hErGTbQToWsho5EGsS1iqSc6FhDeK23TdblYWkV7ACvPXkhHk1CzBB9IQmGiyQW6w0x7L8p5afn9Mw6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wVmaAAVQulXNAGXeraHRI363Y2oxWWwL4wePewC41KVP+be+7
	lLDzMsJsIQs3Ul0WAS6iIhtA4F327FgkJ/pcyxRl2gEEZso8wv7iJNNZ
X-Gm-Gg: AZFdTZcyD7Knf8SK55Vbl+QZcys/S/yxPw+T0Nq33RpK4egh/npN+8upMiPyR5I6BJS
	emOJh74fA/CXIGJQMRrnah2/Ow7yaruxXMgtuVlPM5O7FLnmxrcvZheMUUA5eQEOgE6fvSyakoI
	29y2T3iz1JIBvj9EO1YgUsT1q8Hiv6hFDM3r6RXAqt+Qlr2fRn+qwUN07+oJGClTigtvb4a2QDl
	vKXUg+Xa4urHk4PhoPl8/tlE3xjxKC61dJxY9ijH0GC3zfpOQJMFcmAeSVNGL0hK9qI9YPKOqMW
	8Nkcoc+sAX0BATvxFDpKFsaqcnb2dUD8/WtvU/GL9H42ymEWS12NG55dMAnXh3PD1gGMGvj8and
	IGU6s8GT4+cuRZshnF7IBf9R6Im2gliEYW7rjrDt616C7+rLeIw3e+/nNnWW3uWpPsN4RfB+8If
	c3c/N4IMygmIVPIsypw5+EKro+67lGNfTXwfmtiU4WoRaN6ibExLvN4DhiGvWoggE88/EIVKH8o
	cdBCris8scfRUfhlFFzPgiLCFgkoRlRlilLDC+ixEyGZ2I4/dh05UgAXN+0p34T++GzL01dIwwV
	63XPWIltUBKxmv0Qb2KvV+D0UQI6PSJ9l3+Bxx/3LWyYp5IKWA7A5XL94azPdTrp7l7Ug2l4o12
	LtpCwfDKE+D0U7pZJOBvqKy4vqxj7oNHAHZJgH0oFV74Stpo=
X-Received: by 2002:a05:6000:4705:b0:48e:d7c:4bc3 with SMTP id ffacd0b85a97d-4a3771eeb83mr9286381f8f.21.1794951709112;
        Tue, 17 Nov 2026 13:41:49 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560b5f1sm978391f8f.21.2026.11.17.13.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:41:48 -0800 (PST)
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
	linux-doc@vger.kernel.org
Subject: [PATCH v4 3/4] MIPS: Octeon: flash: allocate the map per device
Date: Tue, 17 Nov 2026 21:41:40 +0000
Message-ID: <20261117214141.3826637-4-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117214141.3826637-1-orgads@gmail.com>
References: <20261117214141.3826637-1-orgads@gmail.com>
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

octeon_flash_probe() fills in one static map_info for every "cfi-flash"
node it binds to, so a second chip select overwrites the phys, virt,
size and bank width of the first while that MTD device still uses the
map. A probe whose do_map_probe() finds no chip also keeps its
ioremap() mapping and still returns success.

Allocate the map with devm_kzalloc(), map it with devm_ioremap() and
fail the probe when no chip is found or the partitions cannot be
registered, so the mapping goes away with the device. mymtd was never
read; drop it.

The driver has no remove(), and the mapping is now device-managed: a
sysfs unbind would unmap the flash while its MTD device stays
registered. Set suppress_bind_attrs to rule that out.

Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v4: new. sashiko flagged the shared static flash_map against v2 and
    v3 of the next patch; v3 left it as it is in mainline, this fixes
    it first.

 arch/mips/cavium-octeon/flash_setup.c | 49 ++++++++++++++++-----------
 1 file changed, 30 insertions(+), 19 deletions(-)

diff --git a/arch/mips/cavium-octeon/flash_setup.c b/arch/mips/cavium-octeon/flash_setup.c
index 66d173b..0e5652f 100644
--- a/arch/mips/cavium-octeon/flash_setup.c
+++ b/arch/mips/cavium-octeon/flash_setup.c
@@ -18,8 +18,6 @@
 
 #include <asm/octeon/octeon.h>
 
-static struct map_info flash_map;
-static struct mtd_info *mymtd;
 static const char *part_probe_types[] = {
 	"cmdlinepart",
 #if IS_ENABLED(CONFIG_MTD_REDBOOT_PARTS)
@@ -71,6 +69,8 @@ static void octeon_flash_map_copy_to(struct map_info *map, unsigned long to,
 static int octeon_flash_probe(struct platform_device *pdev)
 {
 	union cvmx_mio_boot_reg_cfgx region_cfg;
+	struct map_info *map;
+	struct mtd_info *mtd;
 	u32 cs;
 	int r;
 	struct device_node *np = pdev->dev.of_node;
@@ -85,6 +85,9 @@ static int octeon_flash_probe(struct platform_device *pdev)
 	 */
 	region_cfg.u64 = cvmx_read_csr(CVMX_MIO_BOOT_REG_CFGX(cs));
 	if (region_cfg.s.en) {
+		map = devm_kzalloc(&pdev->dev, sizeof(*map), GFP_KERNEL);
+		if (!map)
+			return -ENOMEM;
 		/*
 		 * The bootloader always takes the flash and sets its
 		 * address so the entire flash fits below
@@ -94,26 +97,32 @@ static int octeon_flash_probe(struct platform_device *pdev)
 		 * access 4MB.
 		 */
 		/* Use this name so old part lines work */
-		flash_map.name = "phys_mapped_flash";
-		flash_map.phys = region_cfg.s.base << 16;
-		flash_map.size = 0x1fc00000 - flash_map.phys;
+		map->name = "phys_mapped_flash";
+		map->phys = region_cfg.s.base << 16;
+		map->size = 0x1fc00000 - map->phys;
 		/* 8-bit bus (0 + 1) or 16-bit bus (1 + 1) */
-		flash_map.bankwidth = region_cfg.s.width + 1;
-		flash_map.virt = ioremap(flash_map.phys, flash_map.size);
+		map->bankwidth = region_cfg.s.width + 1;
+		map->virt = devm_ioremap(&pdev->dev, map->phys, map->size);
+		if (!map->virt)
+			return -ENOMEM;
 		pr_notice("Bootbus flash: Setting flash for %luMB flash at "
-			  "0x%08llx\n", flash_map.size >> 20, flash_map.phys);
-		WARN_ON(!map_bankwidth_supported(flash_map.bankwidth));
-		flash_map.read = octeon_flash_map_read;
-		flash_map.write = octeon_flash_map_write;
-		flash_map.copy_from = octeon_flash_map_copy_from;
-		flash_map.copy_to = octeon_flash_map_copy_to;
-		mymtd = do_map_probe("cfi_probe", &flash_map);
-		if (mymtd) {
-			mymtd->owner = THIS_MODULE;
-			mtd_device_parse_register(mymtd, part_probe_types,
-						  NULL, NULL, 0);
-		} else {
+			  "0x%08llx\n", map->size >> 20, map->phys);
+		WARN_ON(!map_bankwidth_supported(map->bankwidth));
+		map->read = octeon_flash_map_read;
+		map->write = octeon_flash_map_write;
+		map->copy_from = octeon_flash_map_copy_from;
+		map->copy_to = octeon_flash_map_copy_to;
+		mtd = do_map_probe("cfi_probe", map);
+		if (!mtd) {
 			pr_err("Failed to register MTD device for flash\n");
+			return -ENXIO;
+		}
+		mtd->owner = THIS_MODULE;
+		r = mtd_device_parse_register(mtd, part_probe_types,
+					      NULL, NULL, 0);
+		if (r) {
+			map_destroy(mtd);
+			return r;
 		}
 	}
 	return 0;
@@ -131,6 +140,8 @@ static struct platform_driver of_flash_driver = {
 	.driver = {
 		.name = "octeon-of-flash",
 		.of_match_table = of_flash_match,
+		/* No remove(): the map and the MTD device stay registered */
+		.suppress_bind_attrs = true,
 	},
 	.probe		= octeon_flash_probe,
 };
-- 
2.53.0

