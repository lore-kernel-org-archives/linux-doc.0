Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B958539DBD1
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 06:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445985; cv=none; b=aYDU9fHj6D11z4dJWciAlVenQrpaIjhECFLcQHxHmHNvohiZh3zwZyX0h9IBH61UiPrOCEEIVc5YJCrALxuRBAhFwvbP1MtPdXYlIHOpptdAngL5mdAPAgkXqlTY5tXYinLeCgS5SM0URviY3H/iqQqkU4kN2Ong64sQ975KfUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445985; c=relaxed/simple;
	bh=qpJTPexygSurz5Uyf2L27E21lAO5pvcSgLBshfv01g4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G/xD5LSgVP1+UiFKJqeiERKiWy146wHfHRTtuPmEMooJ/8o0BKQURlgeCcrU8DFk0Rj+XzzPDH02phMs+OOYRsgwRnJcV6OinPaFy/EmnLPx3CDxbdLkdC2OUNjRyWDIp8fZBZfACal1pHvk7B26s+q1Du4uyFXPjzg4f7a1K/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r1xbHHCI; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r1xbHHCI"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-82f351ca23cso6291633b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 23:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445983; x=1778050783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2q9dPj7TNisCrTMpZ3igJmznQK/scPvx1hraOs9ZEkA=;
        b=r1xbHHCIRVod2QEz3dDsT/QVb9bBgSVc+kk8m1OOyKJ3xI1QOdSy9TLjj15mc0kvUh
         4vPuHmxgYfFY0PhNQYnC7b/eaBA5Z/imnXM+G5LF8Jb0uSSswUorB/K60p3+aziE6a+w
         ae14gXJgphdmNWUwpEjYGeE0rjo8hpIB4rli7+iLOiFNPSxTGYRlw1bNX2kOL3gum3zE
         w8AV8Ng+M8GvrQwNEhyzV3uGZCHmVEM8zBKzvU7zCIvXuvOwxKh+sELh4wZJYVM0Hpj4
         +acRWGBhcRLCo1baJnvwqUZZdgPXHwVkxGkYlN7RANgLVdG/VitiF9JIc9lsY0ripr1A
         +dww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445983; x=1778050783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2q9dPj7TNisCrTMpZ3igJmznQK/scPvx1hraOs9ZEkA=;
        b=lWoXbdrQpwUpU6JrUZKKhFJ9bYFjMaEfkNUKH0Suv01JKpLCu6s/IvwAhApphb50SS
         vDKBKAUU9kg7v3+w6Sre5PGpLSI/dMzJyzwJ0YuSMGS7bgi2AwEKGWzwmd4SMS2CDLu2
         rTA2znSdPBLnhuMW8JdU6r3FRoVKH4jpJjxfHyujSI4VCSFasdLxfczIkPgiaqVgOJy2
         d6OnyvujaU1tpaukcp7Fqvozr0hGS3n1uTSy5MXKJA38W01qAA0TO/g0J6+mH2etMbyG
         LLXsLOO8W+ATEQ7evfCa2XJqzjlgl2z01X4/rha+9Ef8SH8eTRpj4dDcXvg82c4dr8hI
         7QNw==
X-Forwarded-Encrypted: i=1; AFNElJ/2zhNtno4lbwy5s6ikfhEGb0NskReJ1qGmTiUnq3/OpdyRUT8LtQbPCyprEHjXHB4DGda8ZNB5j00=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzk7Je8NwUi8EYrRuMKNN44D2S8y/PLQKemnsU+ZyMvMquItnc
	NRd1ES98oHWW9COiFR9mB7X39N69mYKQE4zJw3p8rn6Un6zflWJHEmml
X-Gm-Gg: AeBDieuu87clcjzpj8H6pDQ8awWdOHi0Ty3WidxZiWWvdyjKLD9uHReMBfhgl/JV1DA
	/vKRA1wtJ/JHctePSitWzKzRj95UpsZM7F0XHrgHo2oY+tIBWzIdzbrYNUywPKQJ2OrsDsXfLif
	6L/pEqq0+G9lgQn29MLOy5JGKN+w2MBPYB24HsDUZadZl+MxFjHgfUhLRnhTwwrVbBo2Z9Yx9h4
	0uaapwyESDL5SVQCa7fLCyvas4d5FGP3/rCDZStgu+UciDFuCPEBmnKSXPpx1eTth4y/O1VCs/H
	vsG3W0uZ0hsyuRQn6G9zTMZMAqYekHoKr1AyFbDf0JX9tfqZgY61MgDGBFoPLL0ZeYZYb/weqy9
	nljW7N/vc4qWUMQphORm8TXT7EtVMXUVMGuFltAKwe37fnFyH1n+Q4TjaBwFL3vAb4jQ2i83VB4
	90cdYwqERjXeYMpzP31yFUaJgWvqASfsTVzfhdQ4ASkbjVkDNs
X-Received: by 2002:a05:6a00:1802:b0:82f:bd8:70eb with SMTP id d2e1a72fcca58-834ddb5b988mr6406851b3a.21.1777445983273;
        Tue, 28 Apr 2026 23:59:43 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:59:42 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 06/11] of: reserved_mem: save /memreserve/ entries into reserved_mem array
Date: Wed, 29 Apr 2026 14:58:26 +0800
Message-ID: <20260429065831.1510858-7-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429065831.1510858-1-chenwandun@lixiang.com>
References: <20260429065831.1510858-1-chenwandun@lixiang.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Save /memreserve/ entries from the FDT header into the reserved_mem
array so they can be consumed as vmcore filtering metadata by kdump.

/memreserve/ regions hold firmware or bootloader state that is not
useful for kernel crash analysis, so saved /memreserve/ entries
default to no_dump=true and are tagged with name="memreserve" so
consumers can distinguish them from /reserved-memory/ child nodes.

Some DTBs declare the same or overlapping range in both
/memreserve/ and a /reserved-memory/ child. Commit b41328187629
("of: fdt: Scan /memreserve/ last") describes one such case on
Khadas Vim3 where the range is in /memreserve/ and also in a
/reserved-memory/ child carrying no-map. The /reserved-memory/
node's attributes (no-map, reusable, linux,no-dump) are the
explicit declaration and must win over the firmware default,
fdt_reserved_mem_save_memreserve() therefore inherits no_dump from
the overlapping /reserved-memory/ entry rather than silently
applying no_dump=true.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 107 +++++++++++++++++++++++++++++------
 1 file changed, 91 insertions(+), 16 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index ac3d8b837d61..4b80420da2d2 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -252,6 +252,49 @@ static void __init __rmem_check_for_overlap(void)
 	}
 }
 
+/**
+ * fdt_reserved_mem_save_memreserve() - save a /memreserve/ entry
+ * @base: base address
+ * @size: size
+ *
+ * Save a /memreserve/ range into reserved_mem[] with no_dump=true
+ * as the firmware default. If the range overlaps a /reserved-memory/
+ * child already saved in this pass, inherit that entry's no_dump so
+ * node-level attributes (no-map, reusable, linux,no-dump) win over
+ * the firmware default.
+ */
+static void __init fdt_reserved_mem_save_memreserve(phys_addr_t base,
+						    phys_addr_t size)
+{
+	struct reserved_mem *rmem;
+	phys_addr_t end = base + size;
+	bool no_dump = true;
+	int i;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		phys_addr_t r_base = reserved_mem[i].base;
+		phys_addr_t r_end = r_base + reserved_mem[i].size;
+
+		if (base < r_end && end > r_base) {
+			no_dump = reserved_mem[i].no_dump;
+			break;
+		}
+	}
+
+	if (reserved_mem_count == total_reserved_mem_cnt) {
+		pr_err("not enough space for all defined regions.\n");
+		return;
+	}
+
+	rmem = &reserved_mem[reserved_mem_count];
+	rmem->name = "memreserve";
+	rmem->base = base;
+	rmem->size = size;
+	rmem->no_dump = no_dump;
+
+	reserved_mem_count++;
+}
+
 /**
  * fdt_scan_reserved_mem_late() - Scan FDT and initialize remaining reserved
  * memory regions.
@@ -260,6 +303,9 @@ static void __init __rmem_check_for_overlap(void)
  * "static" reserved memory regions, that are defined using the "reg"
  * property. Each such region is then initialized with its specific init
  * function and stored in the global reserved_mem array.
+ *
+ * In addition, /memreserve/ entries from the FDT header are saved into
+ * the reserved_mem array so they can be consumed as vmcore metadata.
  */
 void __init fdt_scan_reserved_mem_late(void)
 {
@@ -270,28 +316,32 @@ void __init fdt_scan_reserved_mem_late(void)
 	if (!fdt)
 		return;
 
+	/*
+	 * fdt_scan_reserved_mem() has set total_reserved_mem_cnt to the
+	 * total number of entries to be saved (reg-based + /memreserve/).
+	 * If it is zero there is nothing to allocate, save or check.
+	 */
+	if (!total_reserved_mem_cnt)
+		return;
+
+	/*
+	 * Allocate up front: /memreserve/ saves below may run on any
+	 * path and must write into a memblock-backed array, not the
+	 * __initdata reserved_mem_array which is freed at free_initmem().
+	 */
+	alloc_reserved_mem_array();
+
 	node = fdt_path_offset(fdt, "/reserved-memory");
 	if (node < 0) {
 		pr_info("Reserved memory: No reserved-memory node in the DT\n");
-		return;
+		goto memreserve;
 	}
 
 	if (__reserved_mem_check_root(node)) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
-		return;
+		goto memreserve;
 	}
 
-	/*
-	 * fdt_scan_reserved_mem() sets total_reserved_mem_cnt to the
-	 * number of entries that need a slot in reserved_mem[]. If it is
-	 * zero there is nothing to allocate or save.
-	 */
-	if (!total_reserved_mem_cnt)
-		return;
-
-	/* Attempt dynamic allocation of a new reserved_mem array */
-	alloc_reserved_mem_array();
-
 	fdt_for_each_subnode(child, fdt, node) {
 		const char *uname;
 		int i, len;
@@ -342,6 +392,18 @@ void __init fdt_scan_reserved_mem_late(void)
 
 	/* check for overlapping reserved regions */
 	__rmem_check_for_overlap();
+
+memreserve:
+	/* Save /memreserve/ entries (independent of /reserved-memory) */
+	for (int i = 0; ; i++) {
+		u64 mbase, msize;
+
+		if (fdt_get_mem_rsv(fdt, i, &mbase, &msize))
+			break;
+		if (!msize)
+			break;
+		fdt_reserved_mem_save_memreserve(mbase, msize);
+	}
 }
 
 static int __init __reserved_mem_alloc_size(unsigned long node, const char *uname);
@@ -365,11 +427,11 @@ int __init fdt_scan_reserved_mem(void)
 
 	node = fdt_path_offset(fdt, "/reserved-memory");
 	if (node < 0)
-		return -ENODEV;
+		goto memreserve;
 
 	if (__reserved_mem_check_root(node) != 0) {
 		pr_err("Reserved memory: unsupported node format, ignoring\n");
-		return -EINVAL;
+		goto memreserve;
 	}
 
 	fdt_for_each_subnode(child, fdt, node) {
@@ -406,8 +468,21 @@ int __init fdt_scan_reserved_mem(void)
 		if (!err)
 			count++;
 	}
+
+memreserve:
+	/* Count /memreserve/ entries (independent of /reserved-memory) */
+	for (int i = 0; ; i++) {
+		u64 base, size;
+
+		if (fdt_get_mem_rsv(fdt, i, &base, &size))
+			break;
+		if (!size)
+			break;
+		count++;
+	}
+
 	total_reserved_mem_cnt = count;
-	return 0;
+	return count ? 0 : -ENODEV;
 }
 
 /*
-- 
2.43.0

