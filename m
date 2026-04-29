Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFE639EF35
	for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 07:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777446025; cv=none; b=FGYJRpci1kA9n2n1c9g/1/XQ9HXE4iwTjS44EmqQwdlperOVnQ2pmXyOUm/ZhV5atOb2lx8CGrAtTlRBHYel48V80Yhc9hEQlbaW4UxCQkuylKLD5iKnJZvEZ2W/lvXiPlutBwVqGcBIxK9dGLuqx508/fRre9gr20iiNhMePsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777446025; c=relaxed/simple;
	bh=t/lgmsImXNg9vJwTMjsNuwxZoj6hoQlo/Fb9w/nVF60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WtKBQfJoazEPV/pPu8sqAepsqLWRwLzSLjxbB+7OALt3waigV+efZdj6KPqqg49icMOsvlomGrJP6CjwLR5GifhVzd/Fcy3OYXaT0gm35OL6C89YA+Cs/nFN9muSHkg+hv53TERGtupwt+OtVcZxRXhcRBpR9gOvmDbftkL8sVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gG1T0NpL; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gG1T0NpL"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-82f33d28c1dso6760064b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 29 Apr 2026 00:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777446023; x=1778050823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4Zhc8gGgRynhB3pjFfj0bHF1QgAjZt+4XAvOQyKioc=;
        b=gG1T0NpLo+2VjRA41OTFcRWlSDtBOXdxKrw6R1vd78sXDkBvh4Bzi+tXYQPpwBO4+a
         x9+LMi1DemL9t9dOzoXyrSe8RUom4rL1kKlGEFRrsiBFtJPXYgVLqiFaroflwNcb8zKL
         C5X2WX1LElTfwPUrQ9ehb9cdlIV2h/oDn/9kwkn4kggaW7AirQAoWTlcL1YgjmrEYidz
         IHvRzBUKHH/c2M0RwnYqpz+wWXEH8+OZb/az1BOVO3ok4kSBkeJ2TlaYAoZWX16grR4l
         JteRpOZNuYYhTQn6CYLmfQGB4spbMFsaDihguBdk75xgIzdj7+v0xU8ZhCQ4U+g6DBOC
         zOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777446023; x=1778050823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4Zhc8gGgRynhB3pjFfj0bHF1QgAjZt+4XAvOQyKioc=;
        b=B6BoGn71c/1gFoesbQWykCwXAkYIltc8xQj0rgAs6DpEp1tkgfE0xsQwBbxYUiWN70
         WClJ+Kzitzj+Hh0LfWt4PHMSsFTkvy50cLbCJp4dygXRiJNRLh/WwJqAbXQfACNJO8fo
         PlMK1eG50HUXW063xzk3MOhZaDVREFNo2I+A2plr9Uor97cTKtaHUPMCR+7e0WRz1YL5
         94BR38+ag3FUjv0cFKsgXandOZojC55FMIE0UIsuUbmsdJLgZ5tlJiaWbEqFNEVz1ueK
         HMCBHevwmz87+dtr+t5CSkOnXPY2IVyS3LBCVxTsS294pJU/IlJnWaTTwt2bVMgZmhSe
         YZ4g==
X-Forwarded-Encrypted: i=1; AFNElJ+MQ69hKRnUeBSuqeKMrTdxo/NSYMnPKXjKG1AKujtGt9sID87qsN0/+/M0+2n0ohHVr/DJE6iHkto=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4AZySlLlJXcQ8S3wGfracu+tTJ+3WCAg/7RYTZ/VQfvhqD0ym
	g9+6BR854Ii0OLiKfwmmunhXrF1QW4QhRjcVMcTv+2PtKfOt2TJahF/F
X-Gm-Gg: AeBDievYcV8OeTsnVhq5w5jipxw0lrOK5xqhA4EgF/ONoK1Etas5h4N2D01agGWD3Nc
	WIGDvcoGqRWFBTgmmJAyfvBkXqfi6jIsydiWVwzctTYoKLfA89yoE7N9cuNJALsBiKQk/VY7T/R
	XxhKvYkA3aAHO2MCtHIIDjEJoaddeYPohEd+hqQn9eBc5TQQXPHcNcxB+7MPMzCQY6kUyreKhFX
	8cMDzdfJ9SQTHCQvpI7ochL3Cug4q+z82Bqx1jGsC8B0f3ifsrf3ymtQbeQuyr1OUqNtQHZZO8B
	kxhYfYMjprb0sr9f6+qrxvbvd/2bwAfhRqhWChZiH6vywjthKrIPUU5N57mmAH2hXWAJzZUpYtO
	Fl96KP/WjZQBC1iSumFr3pJuRpuK9SSUH6ZT8nRABb2SQlgr38PjTb5vLrWNwtFORsvR7nfq/Fm
	a6nlj1Uj+YdylConPrC101phh3bM6EeSlhE5rkHseNbnFH7kJm
X-Received: by 2002:aa7:88c9:0:b0:82f:b519:a5cb with SMTP id d2e1a72fcca58-834ddc50c40mr6750211b3a.37.1777446022861;
        Wed, 29 Apr 2026 00:00:22 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.29.00.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:00:22 -0700 (PDT)
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
Subject: [PATCH 10/11] loongarch: kdump: exclude no-dump reserved memory regions from vmcore
Date: Wed, 29 Apr 2026 14:58:30 +0800
Message-ID: <20260429065831.1510858-11-chenwandun@lixiang.com>
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

Apply the same no-dump reserved memory filtering to LoongArch kdump as
was done for arm64. Use of_reserved_mem_exclude_no_dump() to drop
flagged regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_no_dump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Chen Wandun <chenwandun@lixiang.com>
---
 arch/loongarch/kernel/machine_kexec_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5584b798ba46..742fb9affcb9 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/kexec.h>
 #include <linux/memblock.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -67,6 +68,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	nr_ranges = 2; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
+	nr_ranges += of_reserved_mem_no_dump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -91,6 +93,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 			goto out;
 	}
 
+	ret = of_reserved_mem_exclude_no_dump(cmem);
+	if (ret < 0)
+		goto out;
+
 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 out:
-- 
2.43.0

