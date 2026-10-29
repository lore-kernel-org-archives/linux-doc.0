Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793274612;
	b=wjS/hL2R0C96xuAfkNQ/jeDBnQkUzSl8GgNcfUGQURxBLbSwbAzxFQpqKzGeHYZRQRPD
	 Nj8a7Vl7dVrhk8RPtIniSOJgnoADAK8nUPhrodOtD+98C2No4jnVNvP45ElT68kIozWO2
	 imJYXXULDzFrdas5cpVjjbeJW1wDir9QfoGyPL7+P6g/sPcA8umOwVVVHdAlyCiX/B6cc
	 MynZYdkjfD6OinVn6KvpQxgtL5Bh6rjpn/Sv0gKHTUMxwmDrXQJwyJ8ctSLFI6U8qbrAP
	 e1/LfMYFmwjWA+V2ZImYVY7VFJ1FsCQssdwMQDGzoPbsDeflKbUTZ1khMVeJz629HTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793274612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8rCHi1GBk0hKG09zgHxal2DvzYlGptJwEeRT1dMlA18=;
	b=jiuM/0sHDdlcv96TocE51zdBb33sBl4B9u5Vq6uCV0lXXJlwYdz6VqVZP/HNItqDNEzD
	 Zl3T130U7WVMNWd5ELGzvQtSrgPIfN2QpMOe0Urd2a+7PLAE1djzBfk8qldyjjz0dNRzV
	 GCP1wy3b1TWZO9p49zEN42Z6jz6j5HhUAFvNPHn1rsydbzDaFNJE1IMuMiPfxVxUFIZ6t
	 zGREfPDuZV9TKA/zXe5HMJR2wVw1KfidbXmClHuobxASy790pBvirMmuY5jqNyCWhZ0BJ
	 2lkpd7QE2fxsiNAHTc5cbYFETlor1PwNsW1MBuh8HYnWtBP/TrZ1YeBA/uvwYZTvsrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=H0kAUE0F;
	arc=none smtp.remote-ip=74.125.227.139
Received: from mail-pj2-f11.google.com (mail-pj2-f11.google.com [74.125.227.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E40606A31D
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 11:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09E40606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=H0kAUE0F
Received: by mail-pj2-f11.google.com with SMTP id 98e67ed59e1d1-3ae08d3dd4fso1091163a91.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 04:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793274610; x=1793879410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8rCHi1GBk0hKG09zgHxal2DvzYlGptJwEeRT1dMlA18=;
        b=H0kAUE0FzOIbxr+gO4Sqo6zQU7YgLDHirZqAhcfE9R0a8Y4ZOYve843gw846IzYRq7
         Ckjw04hWuuOrlodR4UHxRvpNbStj/d6pexnqn586VfV9Ur+luwZqrRT5gxlfyZQFU2/z
         I7iyaoA1xNjEfprUiPB0JLor/ZjPLZmxb4m2L0FRMmAx6yxES1MqJXGo+zJMuI7y78xb
         tl35TVaC7nqG1RtdWuL/bncgW9qBPNLTlbUJC/1nUjEFZEWuidqcxTBnvPM6veBpQHvn
         4ATQHh0QURaaQK4760fjEYa//6p0itOGPV4EapK1k+Jwa06BtdiCyki4FNMQF7JNXoYg
         tNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793274610; x=1793879410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8rCHi1GBk0hKG09zgHxal2DvzYlGptJwEeRT1dMlA18=;
        b=zZaLrSF+dULIP8gLNnSoTHIVEMaSTZbRw4H5i3LF5IngFl7UsdG4O8XqcvbJDikt0R
         65O1fXGJWncPXT3eCGRHp4Noz6EeSmEfrePu9rQ4fe7VFyXTIUejtnKxUCKAzZSmDQ2f
         7PzF0LELe1znE1ORbauie3dLYufojbLTpFHpj1ITEXF7xSD7gunIWHGH3V+miKIDfXAm
         5vf8jHiqE6Z7stoChKInBOAaZpb1qdL2fbHupW8HfibXtRSApspkv/1ihfyJS2oshnmq
         VcfMKfrbktsmflLv1bTDIXnBXlcyaJ+i7FXaNdkDKoTDcNCU5nesMv9Ex2t6kcLr2CVM
         UPjg==
X-Forwarded-Encrypted: i=1; AKwUvBzozLNaRk9Cr+ZdtqTH67X7q1ml47op0fYWpHcfJhAofwZWBAUIfnifg+j349mrFG7G9ws6ohL0vn8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKW3VgxqJOCsPtPZLiEY/MeTwn2XwbK9gRgpoeI1bSX23wG9UjQ
	RDm5jPly+oWjeHKkUy7JX5Q6x+3u2YmhcD1e0EXOSoZbl6uABFx7wUXnlIxXIyrLK9Y=
X-Gm-Gg: AYBFou0pQQRGf8G+M8M4b9o9zPbpKV85MxhjQRMeixsC8w50487oVYFd4BNtgCaJ+Q+
	RvtmEze4ynji1pormbpTHQ4c4Qkdw+MwWoqHfG9rXZJiJcYDP16K+KOGC57+cs5+aylLzrjgFBw
	AS+3X2+j37Bsj/UYgaYhAd8VzjO0TgD7swXRas5NeU1pPEi7yyw/ojsgbSWv3DsTGP5xGjnzQen
	U2hWpU5+18AI6r7aPRVQm4wrFR3r3TU0ziPtEPbPUzPFvb1teirv5fyyd5JmqymAzb5+p6vCCs3
	35Hbo+Ta9a2dpik2qZXSthvaLCHW9ah78+xvSj5ErWH33bRu4wruBZTw9IjJ46A0r+58YLoyIyh
	OR9By8Sg5JQ4JW1dpu6htDqv3lFg+3vl5R5ta76Qb5x+4+gAeOicEfhtDsbf703OHkwfTlzUDDu
	zrclJ4tHy4MtXDZIlUrS1vaSV/h9C54k7dfuT+lOpKBUzfqfXb6U8JiOCgVV+KqNM2JMFmgy39F
	qLiwU3C5+P4rd/uOjprKzCab2oYIztv+eLeGxY4cLkkAmYJn7bWvrEtwK8QRDdpqC+Z9m9hBzvD
	4jih/Ze1Nv+v1Hl5VQluY57V/R2locBfT7tUSwUv1XtuMtjGIktVnN0H7SnwlV10agdGaGK48Az
	zU/ajkFI=
X-Received: by 2002:a17:90b:3f8c:b0:3a8:9b79:e6ea with SMTP id 98e67ed59e1d1-3ae5835d8a6mr4169699a91.59.1793274610195;
        Thu, 29 Oct 2026 04:50:10 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55d64c0bsm4151053a91.1.2026.10.29.04.49.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 04:50:09 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup.patel@oss.qualcomm.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	yuanzhu@bytedance.com,
	yang.yicong@picoheart.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v12 09/11] MAINTAINERS: add RISC-V SSE maintainers and file coverage
Date: Thu, 29 Oct 2026 19:49:51 +0800
Message-ID: <20261029114953.27453-1-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
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

Add the RISC-V SSE maintainers and cover the architecture entry,
firmware driver, PMU documentation and selftests in a separate patch,
as requested by Himanshu Chauhan. Also add coverage for RISC-V firmware
drivers and the architecture selftests.

Link: https://lore.kernel.org/r/as79MHtNYd-VbUug@hu-himchau-blr.qualcomm.com/

Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 MAINTAINERS | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 65e8a4b5c90..f275e9d4847 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23506,6 +23506,7 @@ C:	irc://irc.libera.chat/riscv
 P:	Documentation/arch/riscv/patch-acceptance.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 F:	arch/riscv/
+F:	tools/testing/selftests/riscv/
 N:	riscv
 K:	riscv
 
@@ -23518,6 +23519,13 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
 F:	Documentation/devicetree/bindings/iommu/riscv,iommu.yaml
 F:	drivers/iommu/riscv/
 
+RISC-V FIRMWARE DRIVERS
+M:	Conor Dooley <conor@kernel.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
+F:	drivers/firmware/riscv/
+
 RISC-V MICROCHIP SUPPORT
 M:	Conor Dooley <conor.dooley@microchip.com>
 M:	Daire McNamara <daire.mcnamara@microchip.com>
@@ -23573,6 +23581,7 @@ M:	Atish Patra <atish.patra@linux.dev>
 R:	Anup Patel <anup@brainfault.org>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+F:	Documentation/arch/riscv/pmu-sse.rst
 F:	drivers/perf/riscv_pmu.c
 F:	drivers/perf/riscv_pmu_legacy.c
 F:	drivers/perf/riscv_pmu_sbi.c
@@ -23612,6 +23621,19 @@ F:	arch/riscv/boot/dts/spacemit/
 N:	spacemit
 K:	spacemit
 
+RISC-V SUPERVISOR SOFTWARE EVENTS
+M:	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
+M:	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
+R:	Yunhui Cui <cuiyunhui@bytedance.com>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	arch/riscv/include/asm/sse.h
+F:	arch/riscv/kernel/sbi_sse.c
+F:	arch/riscv/kernel/sbi_sse_entry.S
+F:	drivers/firmware/riscv/riscv_sbi_sse.c
+F:	include/linux/riscv_sbi_sse.h
+F:	tools/testing/selftests/riscv/sse/
+
 RISC-V TENSTORRENT SoC SUPPORT
 M:	Drew Fustini <dfustini@oss.tenstorrent.com>
 M:	Joel Stanley <jms@oss.tenstorrent.com>
-- 
2.50.1 (Apple Git-155)

