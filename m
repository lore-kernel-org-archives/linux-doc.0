Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8606D39DBEE
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 06:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777445955; cv=none; b=pFdhV4sJ8ui2PV8piwMpmIN+MpuUCQIwExzlhr3irbl0mMcCCveb9Jguh9UYMpW+pdsiW9BO8u434f4ngitMxyXrOpES6fop2gaT0wPjmcbdUgEn3zXYGjBJ0XY7mfSOU8Ya4M15ZwyhXf3wEoM4CRwJ7j7Egz+RKUGioOjOyCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777445955; c=relaxed/simple;
	bh=cIkj0kxww8gxsjUOlEDL+11Vay4FMTzDgmzX/FxgbuI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xufc+qLC+1ZsStvarh+L3yLOB2DG/uH+qwO7PhzvmxIVWFGAUd4b0bCJmTwDSWLViJ8Uv9lBfgy9+GrMCULeIIuwCzNbSpjDW8mDF7jwxy3p5IVDaDPxM8w8mVAes0gCRx+XTmGJVlaxh9DUWowcSeg1riNOm9MdL5/sTCpgJZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKZLuyw3; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKZLuyw3"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-82cebbdbdccso388900b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 28 Apr 2026 23:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445954; x=1778050754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p829QSKrb4/ZZPtJ47R2GmLE7Z7L3DGhl/Bc8vHjFYM=;
        b=NKZLuyw3YsXf/fwlXWzFiVmvonCJZf4r1bidu/xD/dnNdlHrerbXcxYoGYJXHlOzjd
         fYaeLTgU+M99MA0wOZWyvd7zPi0IDNjCwCeYlT8eivm8vAH5xT8q8U/O1v10Xlxkj1/r
         7tsDgtbC+XqVS4BA0ME3JMNl5x9zgoeG1sv33+CLjJfkf2k0Z68G5ziDBjP7hWRpZeha
         ftIixrVaevFslXk8Vxk9mVEKFE+it41DONwcdZakaBU1DdOzrFzlc1xm/OdYwFOBrCJe
         5UIlRu8dab9xD4dYu6mU63L3kvqXeabZ5GLu85eSZdGFZU/1xk00x2jYm2vD5mMQjGHr
         Nh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445954; x=1778050754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p829QSKrb4/ZZPtJ47R2GmLE7Z7L3DGhl/Bc8vHjFYM=;
        b=ZN5vsbxGS5CiiqysUECcsJnQMbhi1eHTWSdbh2CyRTOga9oUu5iw0mOkSm4sNQUacj
         VVwRexChMU0nNahtrD8qMXYWV+X+LLtHFkzNR5IEHj0I3IBnhtwLfXcaKqjISXBtvt9h
         pEvkCsGfcnnQdyWrKeNCy4U64uQ/1gjDlZxDxp8HdDiYCuDO23TKQzugrSIyimKGKmfQ
         WrcKQdTIO4pbL6/V4pw1CadMFPvmua3eIugfwmlNJyXteiYencpk0dL8T2Pd0NmRy0jQ
         GWV9FjeF2IbJqqBigCDjQcxLdjmgEJ2XnyP1sMz8QQhNFvPpc1OyVkZtVFdNENcv5cJJ
         B3sw==
X-Forwarded-Encrypted: i=1; AFNElJ8tJ3nWsYsKhVQI6Zn+B7ph89kVH1pmP/YQoFKoj6Yml3KsV5ew+D8rTK3scGmQeS/DrE5/vu871Ow=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfMjmALc/ImI8pZ3Y0N3h+t4JriDP3IVCGNGXoZ0zB7x4ECyWe
	1YCr8lCaiJxTcOcnSo02pFtVCeGK0SQcIVJLK/nHTgHHZiRqnwniNw4u
X-Gm-Gg: AeBDiesq3zHc8y2x6VGMQ/FJyI5z5ihvL3A/yQYlXXtluJ7+2aRSvBhv5raqrc4gBEc
	qXSn9+DZXjS+9TOCQS/+wNFEhnAfOakOo7EKswRNm8WMsuxOGDDgFdCmAvfYoOZM0jQymx7PwPF
	ovH6EG8a/KdakLnWnCWBadqGUoTMaDCkAefhaYNHfi8eqpTrlJBDTv57yRNNGhW4LvydaRZ70P4
	X9aHlvVCdP4XmpmbRARiTVYsVbJoTUJbCn3wg0GfhENQnQC4B3P/DRNorBfj+MFseaNzZfMsNym
	wnY+Q+6Y9dbIuSwOq3nZRszPhOw/Uo/Nayj5tMWORCARMCjjecgu9cCdWDAxyQ4WBV6AeWMwVMa
	H+KIVxIEa8YaXjPWOpSeMsS+iWjCJ/HeWukIbOT5uUKgU6m0Qlhiqd7Z72tScf4cXxgMUdfcJW6
	8+5/ruLxckkT0xuYI49V8KeAlwG/Csy5gNsp8jvIBSgM2e1IlRg/uLSbdbJ9I=
X-Received: by 2002:a05:6a00:94e8:b0:82f:65d:33ad with SMTP id d2e1a72fcca58-834ebb751bdmr1807155b3a.15.1777445953880;
        Tue, 28 Apr 2026 23:59:13 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:59:13 -0700 (PDT)
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
Subject: [PATCH 03/11] of: reserved_mem: avoid unconditional save of reg entries in fdt_scan_reserved_mem_late()
Date: Wed, 29 Apr 2026 14:58:23 +0800
Message-ID: <20260429065831.1510858-4-chenwandun@lixiang.com>
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

fdt_scan_reserved_mem_late() iterates all reg entries of every
/reserved-memory child and unconditionally initialises each via
fdt_init_reserved_mem_node(), while fdt_scan_reserved_mem() in the
first pass may have rejected individual entries in
early_init_dt_reserve_memory() (e.g. outside physical memory or, on
the no-map path, overlapping an existing reservation).

When a single node mixes failing and succeeding reg entries, the
first-pass counter only accounts for the successful ones, and the
second-pass save then overflows into the wrong slots: the failing
entry may be written to reserved_mem[] while the succeeding one is
dropped by the "not enough space" guard in fdt_init_reserved_mem_node().
The stored entry does not correspond to any real memblock reservation
and misleads consumers such as of_reserved_mem_lookup().

Mirror early_init_dt_reserve_memory()'s preconditions in the
per-reg-entry save loop:

 - skip the entry if it does not overlap memblock.memory;
 - for nomap entries, skip if the region is already reserved.

This keeps reserved_mem[] strictly consistent with the regions that
were actually reserved.

Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory regions are processed")
Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 03c676052dab..807b222fce5f 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -288,6 +288,7 @@ void __init fdt_scan_reserved_mem_late(void)
 		const char *uname;
 		int i, len;
 		const __be32 *prop;
+		bool nomap;
 		int ret;
 
 		if (!of_fdt_device_is_available(fdt, child))
@@ -301,6 +302,7 @@ void __init fdt_scan_reserved_mem_late(void)
 		if (ret && ret != -ENODEV)
 			continue;
 
+		nomap = of_get_flat_dt_prop(child, "no-map", NULL) != NULL;
 		uname = fdt_get_name(fdt, child, NULL);
 		for (i = 0; i < len; i++) {
 			u64 b, s;
@@ -310,8 +312,23 @@ void __init fdt_scan_reserved_mem_late(void)
 			base = b;
 			size = s;
 
-			if (size)
-				fdt_init_reserved_mem_node(child, uname, base, size);
+			if (!size)
+				continue;
+
+			/*
+			 * Save only entries that were successfully reserved
+			 * in the first pass. Mirrors the preconditions in
+			 * early_init_dt_reserve_memory() so that a per-reg
+			 * entry failure (outside RAM, or nomap rejected due
+			 * to an existing reservation) does not leave a
+			 * ghost slot in reserved_mem[].
+			 */
+			if (!memblock_overlaps_region(&memblock.memory, base, size))
+				continue;
+			if (nomap && memblock_is_region_reserved(base, size))
+				continue;
+
+			fdt_init_reserved_mem_node(child, uname, base, size);
 		}
 	}
 
-- 
2.43.0

