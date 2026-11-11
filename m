Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794433730;
	b=bMWliaztKrM3HtMzMbt2RdwVmfHI2Cj0i3ZXcG9iCcPYF07+BHe6iGqp4XcYrjhIpZcq
	 6Xz5YttGUrm4Z2+VftK2hj3PsCCL58SvZ7VhGcnelTECu4yShdhXihXpe/lD/t7odgjPV
	 Mpc4Eg7WwtyxGOHZeuYto6XBPRkQN1r+kiCALdkEltLrMBxOAe+0Zk+ADdhLtW5f7wrwA
	 3KmHAHrpgk8zWdp5m2pK3bByFRciCKCjosWtDGmonbWD5HFtXpHihjMj7AstdD3oCR8KK
	 a819eH9QCUvEVPa57TNnmnrhBU0byv4eMAgT/seV7iv4bSHntYwAZPZrhxHUE22eW8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=in2H/EiTzu7oKMx0oXEGmqlnXShESJ9rcbe+oDUN+Fs=;
	b=xyQLoD+dH1Vlf9urSXACvCwTIZMtR65DDM3KkMwha9PGzV8LodnG8V7dZJtm+P9dcd1i
	 zjPaffZhF3gu82VyvQTLGkl2RsT/fcs9xLCxhvp4+791dqC66O6xXymxJpsUbOZ9Bv6bT
	 hC6D7G0lJk9gXpC/fCSPwEW+FHGWCe7S/WpP1D9Q3O2Jkxd5WBTW+2N1wMVe8Z7KoPN6c
	 E+3QGu9IB1+skoApB3Z1ro8zh97dj1i7SEOfNCND++l421bxeZrE8CEAZOdJPZOTBBfNU
	 CwlmBtw9HWnRRMYbPn5aOwZ103zhOYuWFiKngT4ns+37+yuoS0m4iwWz6jTre35qzqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MF0INbu5;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4057606A884
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 21:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4057606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MF0INbu5
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd69954c755so2539570a12.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 13:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794433729; x=1795038529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=in2H/EiTzu7oKMx0oXEGmqlnXShESJ9rcbe+oDUN+Fs=;
        b=MF0INbu5MaaNPwlPqfOGFWmfOBBlMsgwfTX9yqoOQukKszhiLhWsvensSmgg5EwMX0
         6xHhym5nnd39YYfADosiSRok6GnimKHgUbRgwEvwTzSdhR9TwY1aFdZy3PAvbHfDkxf4
         fwIbFP0hBOGfh5wEfRpIlV6YGjnwXsaDvaK34MsthoCLKaD9NkCqZlwMQdJ+xA8tT0qv
         l7Jmm2K6lqcavReO4u+S/hvMvGBUxKnCOEBaAmFlifxfixKEhojKyoJmNVskhij0z665
         iWs560WG4BQFURNTTvXOqXp0L9jbbhNh/EWEizzJs9SE4kU1tr5CPbxOfcCqT+FEy8i5
         vkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794433729; x=1795038529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=in2H/EiTzu7oKMx0oXEGmqlnXShESJ9rcbe+oDUN+Fs=;
        b=onH39F1S1RKvpqFayHv9i5Kl6+mknqikvAHLX4F51zL3ZEB35hQR5JpcuCv1Sy6BpV
         3thqZXC1Q9h6TmH4Ok292vZPUKTiY7CINbyMHN8IBfEIOltyEvivUFyDpXewrHgxA0sx
         nXzirXcO1eZlycoodYgbX853aYH2WzGH2UAJNHK+s7rOEEtuve+x+RULt9t2Pqrlabr/
         55Jw7SPw7ysk7+RjAr7GYxl4Kk4A3bOEluN5quBdKejD3BhBSDwsqKRudOimHZWUM3ir
         5PnC0x/IlTbJZ6YGYubTEUOv3ig08kMGMnoZPt1n55ykLGMaWf7seBmUCSUKL0hxBvM0
         iSNg==
X-Forwarded-Encrypted: i=1; AL+hErFDdYCGhRf/is8lQG5Er17O89IODzx+4D7gAo+tnNgY4ZtNFiUW30+uU0RYYMuZ2R4F6OCtfxSJG6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Pl6sZVb5uLZRr19sRA0lyIZMdPel9+ChA/byvDSQ3fideg/nu
	SERaLYr2DaiRyaHJDDy9D9Kq8Uwy8nIEtS6LFO9+FUOilCo+S8lZcOVG
X-Gm-Gg: AYBFou2yCILuQv4tABoAOC2vKgA1LVSAlpNFZe3f6zd3BM+FvMSvwMEt2h4QcyXJl6+
	Q+HGoMPlpLYRqzz/s/cBo03017GoUn5buroZIzaO0N1lhGUcyLH0xb2EQhJuxUzmTGJjZG2NRH1
	Czx2Yu6Wp0zymKECi5I2D/YiJsz6ntFGI2fBhKcjRuwggAVo2dydPuNPqgVDYUb9zDZoe2gkQ0G
	8JSS61ccra/jjhz/hs4+Ayxk5pOirc1zC/mEIgxHFwrK1hcjKHGUkfc9YLBKeKIbtdRfYnwFPoc
	q/KPZcKY2p4JI59tGHNAPsb23QAq5/eULeWI2Tyvdy4+Fz1X7LFL8LFN5WyjaRFt1DBjVvBjZLw
	WmHDFNY5AcH/QI9QyES/3Pb+6vUiCdsSNwPsuTIqwcBWsOY+vVYQshlOeX1AcSK240KI0NukTD/
	7T0YYxt/Krx6ZGZa/28p0cLAWw541K1Eba39gdODP5kWRtf3kIyv1yBhZZVm+FS0znchR5EazBy
	h8UnguXTp1Y9A+NS/pxpPcVnBDeCs/tmgvgqa2pxCSuomKZ3OSpWJmNm9D56G0MZpw53WnwvE3w
	dDA64nUF8Cd+JrDhaBA22jFtItoAk694ZdEHUrygTcv+sNMhZivLkKBP0vjBqcrrnhc52Lws7z0
	HIAmEsEEz3+1E47GulH9YCG/IPS3qeqWpU+HbCd94WUSVWNreqddsdW82o7e8GXYDK2i4WWBese
	ICwg==
X-Received: by 2002:a17:90b:4ad0:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b182f1adcdmr3660412a91.60.1794433729109;
        Wed, 11 Nov 2026 13:48:49 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182de1dafsm2754761a91.3.2026.11.11.13.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:48:47 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: dell_rbu: Allocate large monolithic images contiguously
Date: Wed, 11 Nov 2026 13:48:26 -0800
Message-ID: <20261111214826.6577-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111214826.6577-1-rosenp@gmail.com>
References: <20261111214826.6577-1-rosenp@gmail.com>
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

Monolithic RBU images must live in a single physically contiguous block
below 4GB. img_update_realloc() gets that block from __get_free_pages(),
which cannot return more than MAX_PAGE_ORDER (4MB on x86). Current Dell
BIOS packages are larger than that: the Precision M4800 A26 image
(the PFS container extracted from the update executable) is about 16MB,
and SMBIOS structure 0xDE on that system reports no packet-mode support,
so the image cannot be loaded at all.

When the required order exceeds MAX_PAGE_ORDER, fall back to
alloc_contig_pages() with __GFP_DMA32 so the range is still below 4GB,
and free it with free_contig_range(). Smaller images keep using the
buddy allocator as before.

Tested on a Precision M4800 by uploading the 16MB A26 image through
/sys/class/firmware/dell_rbu and reading it back byte-for-byte from
/sys/devices/platform/dell_rbu/data; a 300KB image still uses the
buddy allocator path.

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell_rbu.c | 54 +++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
index a121f59a215d..d71fa9584831 100644
--- a/drivers/platform/x86/dell/dell_rbu.c
+++ b/drivers/platform/x86/dell/dell_rbu.c
@@ -41,6 +41,8 @@
 #include <linux/moduleparam.h>
 #include <linux/firmware.h>
 #include <linux/dma-mapping.h>
+#include <linux/gfp.h>
+#include <linux/mm.h>
 #include <asm/set_memory.h>
 
 MODULE_AUTHOR("Abhay Salunke <abhay_salunke@dell.com>");
@@ -55,6 +57,7 @@ static struct _rbu_data {
 	unsigned long image_update_buffer_size;
 	unsigned long bios_image_size;
 	int image_update_ordernum;
+	unsigned long image_update_contig_pages;
 	spinlock_t lock;
 	unsigned long packet_read_count;
 	unsigned long num_packets;
@@ -335,6 +338,37 @@ static void packet_empty_list(void)
 	rbu_data.imagesize = 0;
 }
 
+/*
+ * Monolithic images must sit in one physically contiguous block below 4GB.
+ * Current BIOS images (16MB on some systems) exceed what the buddy allocator
+ * can hand out (MAX_PAGE_ORDER), so fall back to the contiguous range
+ * allocator for those when it is available.
+ */
+#ifdef CONFIG_CONTIG_ALLOC
+static void *img_alloc_contig(unsigned long nr_pages)
+{
+	struct page *page;
+
+	page = alloc_contig_pages(nr_pages, GFP_KERNEL | __GFP_DMA32 | __GFP_NOWARN,
+				  first_online_node, NULL);
+	return page ? page_address(page) : NULL;
+}
+
+static void img_free_contig(void *buf, unsigned long nr_pages)
+{
+	free_contig_range(PHYS_PFN(virt_to_phys(buf)), nr_pages);
+}
+#else
+static void *img_alloc_contig(unsigned long nr_pages)
+{
+	return NULL;
+}
+
+static void img_free_contig(void *buf, unsigned long nr_pages)
+{
+}
+#endif
+
 /*
  * img_update_free: Frees the buffer allocated for storing BIOS image
  * Always called with lock held and returned with lock held
@@ -349,13 +383,18 @@ static void img_update_free(void)
 	 */
 	memset(rbu_data.image_update_buffer, 0,
 		rbu_data.image_update_buffer_size);
-	free_pages((unsigned long) rbu_data.image_update_buffer,
-		rbu_data.image_update_ordernum);
+	if (rbu_data.image_update_contig_pages)
+		img_free_contig(rbu_data.image_update_buffer,
+				rbu_data.image_update_contig_pages);
+	else
+		free_pages((unsigned long) rbu_data.image_update_buffer,
+			rbu_data.image_update_ordernum);
 
 	/*
 	 * Re-initialize the rbu_data variables after a free
 	 */
 	rbu_data.image_update_ordernum = -1;
+	rbu_data.image_update_contig_pages = 0;
 	rbu_data.image_update_buffer = NULL;
 	rbu_data.image_update_buffer_size = 0;
 	rbu_data.bios_image_size = 0;
@@ -375,6 +414,7 @@ static int img_update_realloc(unsigned long size)
 {
 	unsigned char *image_update_buffer = NULL;
 	unsigned long img_buf_phys_addr;
+	unsigned long contig_pages = 0;
 	int ordernum;
 
 	/*
@@ -404,8 +444,13 @@ static int img_update_realloc(unsigned long size)
 	spin_unlock(&rbu_data.lock);
 
 	ordernum = get_order(size);
-	image_update_buffer =
-		(unsigned char *)__get_free_pages(GFP_DMA32, ordernum);
+	if (ordernum <= MAX_PAGE_ORDER) {
+		image_update_buffer =
+			(unsigned char *)__get_free_pages(GFP_DMA32, ordernum);
+	} else {
+		contig_pages = PAGE_ALIGN(size) >> PAGE_SHIFT;
+		image_update_buffer = img_alloc_contig(contig_pages);
+	}
 	spin_lock(&rbu_data.lock);
 	if (!image_update_buffer) {
 		pr_debug("Not enough memory for image update: size = %ld\n", size);
@@ -420,6 +465,7 @@ static int img_update_realloc(unsigned long size)
 	rbu_data.image_update_buffer_size = size;
 	rbu_data.bios_image_size = rbu_data.image_update_buffer_size;
 	rbu_data.image_update_ordernum = ordernum;
+	rbu_data.image_update_contig_pages = contig_pages;
 	return 0;
 }
 
-- 
2.56.1

