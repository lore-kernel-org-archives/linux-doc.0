Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791C039EF22
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 07:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446012; cv=none; b=fhLIVJ5zoqUL6yS6WKTZraJXi1MBrENdxnVFSm0umhWtiox8JmTJgMkktADPLlMIf8fUltLMX0dIV+zj+5TTbhHJgu+KO8yvebNqurvgx4swnykxN+HW6ho2C7lnZNsBqjGHzM/O1FvyFo39zf7/8Q2ZnTqxkcHEusiwHUNiG6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446012; c=relaxed/simple;
	bh=19ChOYuQhKdK9qw9JWxQ3u37AolQaWA1Yu0JwsfzieU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OosOhxFb7kXGGvPWKuXoYlW9WlBRthrpJikG3QzVXhVBIOWOsr6JHQqjjFXlKbXANtFx5rp+nLjPTqhuq+f1afGDP8EEIC5KSyy8J9aipc9ZtDYV79U/XTcgkZ8VSpxyroV7g0W+V2/gvL56YjQGm64g/tiF4s+Rb+pp+QbqOfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxezeEF2; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxezeEF2"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-82f6b592fc7so5492283b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 00:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777446003; x=1778050803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngtzchp/6x72pHggoOfcu8l1aVao/9O/WyChqA+UT9g=;
        b=kxezeEF2Wcb16iDVIeF7jvx9Z0fFU+MgS5t34N+hQoDuE2Y1WQNVTXlR4u8ni7ndmn
         OfeF63M3uxLF3GvtdCBMNrEcfUQO5IB5jD53CeTC0GZANOUJ5MhWUwnXi0wErfWQT8CW
         95/hbQWB6hwk4z6NrK7Bt6NmqipK0p6L22UIqiu57KMOftWY8uhGcdUyAPHyaORoSn1U
         0CNWLV20BczBRSA8kLGzdN31dDH7FZmAE5qZfoBmxOTYipsFe/d431rHseYv47gKuev7
         gLbz8TQvVp5Gdwdq5bR1B5AjcZA7L2h6pKgReAVP7n/WeKefTcEwmTnmtv8CeobAvps8
         7lfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446003; x=1778050803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ngtzchp/6x72pHggoOfcu8l1aVao/9O/WyChqA+UT9g=;
        b=tEEgHZFiHp0LyLQO+G0YVvnJ2amuP/TLw1rjOHjn5RWKBaR2sY0yorrwCnOlzFqeKd
         M9K5VHskBcKQdLUoFlhQTCUyT2Op32sWVbLhKJeAcFZ56zU6xM08TTxGp94Xe+RIE8Pp
         z65upz2Jzhky6BGynvmsQN5b+MtRtJRjomVphLMAgFjKngncHu2HppsRRPLjsMnfM67s
         QUDDgY+amMnde5tBuYFkjh7E1OLSLaaD1+bJWLhhR4yjmnq6bxd8dqydW4Rpm3vvRFIV
         kMkd9bQoUpJXgRWXwm1lz6ZXXGhJH5waO4GP4cLaR8heFilOzE7brwUlVIT7CeU4Ccdd
         YbmA==
X-Forwarded-Encrypted: i=1; AFNElJ/EzJwtnnaXxK4eNK8u1RhfeNkuOAsaxdW73uEUiFHrFTgvg5QsE+BXU2bHYuos7aSAcjodpTyAr/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgwwiqOpHN5XXESGFC67IMdoC6PudJJywh++N6mfJLsD0CZQea
	aTKgth5JQfm2EHt07W9zkaPZUd+xfsBUrAUmD5ECOIIO2HAptyC2SyY8
X-Gm-Gg: AeBDiesoiVDyKg93JDBX0rtW4PEJmMDm25XcSrEzuDjJnVlTAE0yRvUhxwScfY7DJ1t
	Zt5fY9i51sTWrb5WzHgmp24xlKT0PF4IGZ+x1YpIKr1Qas2J3zNR0nmSvqKBw67aLWZVrwTdv6I
	CFaZjNTLB2rSVQDgXQJ3mDtp6uPLL1GajIY2Y0IqgsjMmLh5PR+NTdQ5UQA6QfyeEdeO3llrPvO
	MYWzqE20svnDszLgL0r7voA2tIpIXj+7Pqg4GUdg+DpdlljAwBcXU9Y0MuwGx6Axp+0WB8tKIzc
	um7QFY9kZZtV04PjCszDiAOU+BdaiRpaowU7GEcTs5X+pYHSbJ53wggNnFfwWtoGAJZw2DkZ3UJ
	34WacQL7U3V6oktELdepLs+96V3BXk2orKDAJthuORK5ljmoizsID6sDwRD77d1jDvns9aOKsUP
	cP/dpn4S5j5Ar1Ye3X8suF6Te9CHg5baXr5w7ryy1pL905BElwhk0BYTqrqSk=
X-Received: by 2002:a05:6a00:338e:b0:82f:6e7:152d with SMTP id d2e1a72fcca58-834ea569f84mr2491372b3a.21.1777446002842;
        Wed, 29 Apr 2026 00:00:02 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:00:02 -0700 (PDT)
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
Subject: [PATCH 08/11] arm64: kdump: exclude no-dump reserved memory regions from vmcore
Date: Wed, 29 Apr 2026 14:58:28 +0800
Message-ID: <20260429065831.1510858-9-chenwandun@lixiang.com>
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

Exclude reserved memory regions marked with the linux,no-dump property
from the elfcorehdr PT_LOAD segments when preparing kdump vmcore.

Device firmware memory regions (e.g., GPU, DSP, modem) reserved via
the device tree typically contain data that is not useful for kernel
crash analysis and can significantly increase vmcore size. By honoring
the no_dump flag in the reserved_mem array, these regions are filtered
out from the crash dump, resulting in smaller and more focused vmcore
files.

Use the common of_reserved_mem_exclude_no_dump() helper to perform the
exclusion, and pre-size the crash_mem array via
of_reserved_mem_no_dump_nr_ranges().

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
Tested-by: Zhao Meijing <zhaomeijing@lixiang.com>
---
 arch/arm64/kernel/machine_kexec_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index e31fabed378a..7c9c38096c60 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -17,6 +17,7 @@
 #include <linux/memblock.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -51,6 +52,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	nr_ranges = 2; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
+	nr_ranges += of_reserved_mem_no_dump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -75,6 +77,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 			goto out;
 	}
 
+	ret = of_reserved_mem_exclude_no_dump(cmem);
+	if (ret)
+		goto out;
+
 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 out:
-- 
2.43.0

