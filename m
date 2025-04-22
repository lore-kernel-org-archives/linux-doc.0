Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF19827F4CC
	for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321548; cv=none; b=NrwUwGfHe/u8PB2m/2UvgB3Xx9bcHT07s69bo0OAfuLduFIPwt4urSioH3nP7GmQu2Nt/+hb1TGA4QegxF/oeZdZS6+mS13DUVnvDp45OVM0Tc2n/Okrz7pXkKJK1Ers32C0nMxctzBzVMS9VCDYTdSXkjO8+n/9SpBdxuHa8as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321548; c=relaxed/simple;
	bh=nz/fuTVSmlRp4LlYNxLUGp/0GbnwwjWJRrmA/wS6Qkw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OwqewP4VcFLSvwL62eXQ1GsmJPl87jI6AHyuavTk+LU4yczwMb6KlsM3XFV8Zk5CAiC3CW8pcljprtJg0ahEVO7irrBDC+JGun/rULNKGoInMScbltb94fRkNrPTdp9ABF6++VVTFH9t7BGz/XLEtkpmElj2tp92s7RsVgV/dCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=quvFyP4o; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="quvFyP4o"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so35034955e9.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Apr 2025 04:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321545; x=1745926345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=64ebY0cPXav0ihOCjI5v6o2sTgtjyxjpauAoewNWoww=;
        b=quvFyP4oblm1iehPppf3p12pziVnJlKC+FL6aV7tOQfvnu+iC3LG2rC8Sat51qHagp
         r3yvY1hRZm797Ccy1jHqHJiIv7CIFUCBvDRE3/J4aVoxwSPdLibDd4m/h4IZp/KHBxZL
         D/pFtkzdYtZlvtoQ7gtWN+6a8nMMmAD3LnyAfbr6uEn5bIPpRW0eV3WkvpwqCuZlq1BF
         NXhorWp+z4AyxABmWVzztaZP+zb+HHruI39hVTpTLRadeW2TQVFn9TWHBZBsoDj33xc6
         DgXyaxgArUvOc/C5BZ5ROAoGR+StTxHy8P8XXXPmWSHJUyQVedyROrdFb/tbbrceRNHY
         /3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321545; x=1745926345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64ebY0cPXav0ihOCjI5v6o2sTgtjyxjpauAoewNWoww=;
        b=S9azgcTzZXtPSfhr3+gpRknyUthgiuI/JQnYU8QMxVX6s548WtwijJBBHWQIaAAbv5
         ACmCdOmSshLdceilK6WD4QqPMSM/ZY5y5KzZ4Hh2Fl6JG2HORk5pVlJcysou766vfFOG
         j891u217dlEaj82UWFj6ffGajHCpRq9h9jiZnWKgLAo9Oaalyd1h6sq9IvCQ5fV0N0hs
         1Gyo2T6Zd+n3WTkVtZ7Z1BM60u6r1f0jz2/R61K4eMv5TYi05l0nPN8lhR7j8210OrI1
         85Zf9ma1goAq51yTx5BNPIZDhGpjrKLagkumjWHs6OMfeGQtwpVyjFawCX0oT6A7qUs6
         S4Hg==
X-Gm-Message-State: AOJu0Yw8Btms1qHt1D9+nCBLfvaP+TQeaOkRm7scG3VvA65g/LT6p6h1
	DW0ORLjT1Y9dsUpq6zhoD67MVzHZwIpqckYY6DycD3C/l/dUZSZhpSF0gHbKZkw=
X-Gm-Gg: ASbGncuAZM9Np2ik11qYjhGDjAxWyYqeSUAcijRJzJgAf6on8NnD+wwsqd3tRqWgpeM
	ivU680e8UMTz+eaeYJFvpmvoWFVgLblNKVGJDBRMf76VE8CpXUj34NBzMdprTH1XdIYSJVLGJvC
	TiDHd754qDvoG+ZXcmJRvvVThw6pi9xVsZKyVP7K+M3+kCrTRgaYuPJVwwpn4i547QIfjggBZ0n
	xI3rT/9uphzwhO0NJqHlc9tfn1/yEFGpc70L4S3f/sRDaWk9bTTO1qWkmTMBbL006lxN7hsUq1K
	rKXeAt3MqHqh6PlEH7PGcAlA7FiUb2NxYRQJcCqOwnHemdDAecp1
X-Google-Smtp-Source: AGHT+IEyDv+QP1EWTmSMHRE/uIeHGYYUBcOw1Q2Wl1sMO2LldMVdHnU9NCNTqj9cN7+ATDWFNxMd8Q==
X-Received: by 2002:a05:600c:4c96:b0:43d:fa5f:7d04 with SMTP id 5b1f17b1804b1-440697e1215mr95282895e9.16.1745321545291;
        Tue, 22 Apr 2025 04:32:25 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:24 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 10/14] kmemdump: coreimage: add irq registration
Date: Tue, 22 Apr 2025 14:31:52 +0300
Message-ID: <20250422113156.575971-11-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register irq info into kmemdump

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/debug/kmemdump_coreimage.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/debug/kmemdump_coreimage.c b/drivers/debug/kmemdump_coreimage.c
index 077b65cae4cb..2144edcc6157 100644
--- a/drivers/debug/kmemdump_coreimage.c
+++ b/drivers/debug/kmemdump_coreimage.c
@@ -2,6 +2,7 @@
 
 #include <linux/init.h>
 #include <linux/elfcore.h>
+#include <linux/irqnr.h>
 #include <linux/kmemdump.h>
 #include <linux/kmsg_dump.h>
 #include <linux/utsname.h>
@@ -74,6 +75,7 @@ void register_coreinfo(void)
 			  sizeof(jiffies_64));
 
 	kmsg_kmemdump_register();
+	irq_kmemdump_register();
 }
 
 static struct elf_phdr *elf_phdr_entry_addr(struct elfhdr *ehdr, int idx)
-- 
2.43.0

