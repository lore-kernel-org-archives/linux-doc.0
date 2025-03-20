Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A209D1EBA03
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 02:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742438422; cv=none; b=gH2jgJII9HDsJUP9bdr3D4wpx8onJfAMJaFRjAVq2eRIBQ+vD8UZgZovERMVNGuKobnf4Z1UEHjFQ5oP7hxWrww9SQOt//mM+sxuH+ZOFDeFKl0PUYB5LevK8hgWB8fTtKOR7OHGbcdmt68KWO7A0ZZk8n2w8U5RQ9bAG1SGFz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742438422; c=relaxed/simple;
	bh=ZFllnhcMh+RIDEs+ibMCOUU4FmP4DOjH+ijouJA0sXY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ccUOQlv4KZqaH/SlLLfrlfwOt6gG5Ml7iqlT2zSbe8KpTFfh8yGj4yPSWVaFcoZpGDJ8HEKQMelDr3fLdFgCAbxIFHGOyRqnLwe0nq4AqJpJym9WcpkjQFYsdXL6AXP7SdiDxnuHspHrMLJEu4Vy/AGaY4+hPvfQznbhxJULYYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=mQBy1bZ9; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="mQBy1bZ9"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7c547932d2eso20529385a.0
        for <linux-doc@vger.kernel.org>; Wed, 19 Mar 2025 19:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1742438419; x=1743043219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u+DVvQh5m1bMCi1clyLtB7PLWg78oPXTQmpuP7ESTF8=;
        b=mQBy1bZ91YnByaXI5OE4/64FCPYgjkCulZlq4z1up4bFAj4EBpfZ+UNWWeAj4OeSyi
         cKoCMezG7vrumWZUMHL0wMIczWya+dsEEIyAgOQJmDZIUSDAwlh3rBq2zXQqMz8Rgr0o
         ebGpPZss9c0CCZQm3MIVQoB9WU32bMvZs5LE7OFXKOdaacQTRB96imy0gtRlOLhZLu29
         Jltagc0aP8beuCKvt/ylQJurr/FVc91t80fPbEuyF1i0mYduFpldYudDfubhvSduH5GO
         i6ecaM7DgGyKn3nlhII1jaLDiuOX3QeDF5YrPMQEqRv6sNFzuWZ3zRvO+LTHbiGWOP/i
         NlEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742438419; x=1743043219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+DVvQh5m1bMCi1clyLtB7PLWg78oPXTQmpuP7ESTF8=;
        b=jAglt92gyDZGnw5iKOinKmECfpHBr/XvCulyflqmXKMldURLBqDKCt0o7ABAbymFmX
         ZQ7VvoVQElYrFJ65ThZFaYVLZJx3pJM1YAIWFB/RWIIOVdc5oasSaNKZGg8PfyCx3kpK
         Qx+bd8vMQpRq0zx1D5h9jWluIT6obBQHtJepAkrEnb/UFzCVSdwAbFFQf4luPzCWQZU4
         7UPZ5q6Wn/zsCRgWrTIrfmZB4uQMQgY0cgOJsbqBNZzOj9RbTb4GVkia6gvd2o2G7qbH
         P/Kfc8sQYmMUXEii8RjP1VdMTL775+lP8cSvmmK5S1ETwJam/WCryFz7Mi6A9AHKu/Fv
         jcDA==
X-Forwarded-Encrypted: i=1; AJvYcCU/+vPrpexLGqSyH1HcfIo2gkfkii7BuNLhFlUgxIQXNeCcIXjbBKFV6kGgJx5HoB2J1bNFZB8Xkqw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1pxYU3bKzuhb0BOH51bGhuce6fCdBp3ZRqEQ2txGL3Q8nEr5i
	LIBbXl5T8TsAycAx3Z6qUq8bQpunVDTXUQxWCUHKYn+ppZCqWxchlhl4C2NbF/A=
X-Gm-Gg: ASbGnctD3n9RtusomOdd6lTalvDGeeDN49JwF69Oux5pDu/cE0++Abt43tIoruKaCq8
	Za5q9u6f3v3EsSSmuxzc78Dm4IV+LcVvTHo/VV9WhLhJZ+BbHdjo2QHpjv8g3RAf6Ili8Xp3H8L
	kPxelQBIH3Cx8GV1Q44JtlkNBeILJKD/os3W9BkTZ4lmcZQcihS2B71+rsRPg4pVRu0uc65AM/2
	ci3fgZJWFV7K/x+YMhi7CAzhhaEsS+Cuuo+gXy+N7eka27Z2y68Tf6IrbzOrLgVPJpGfIqgV6DX
	gQGK6j/Stm7thxzFb7qiir0zcAE/bwUJMUeXBABUjzuLfslSJj89VtcMT7lluFXPqjUUEr68EMN
	UudHmcwTDKs0zMaXmnfngpz+sHe5uSnGU
X-Google-Smtp-Source: AGHT+IHDuFkRUrzcuGCjVMEyO6PXLoUcE3ozt83EY0+kL0J1Oz/yABIc+QBPR+ZBZ9rhjUrcpOOeuw==
X-Received: by 2002:a05:620a:2592:b0:7c5:55f9:4bcb with SMTP id af79cd13be357-7c5b0c94080mr226145985a.31.1742438419303;
        Wed, 19 Mar 2025 19:40:19 -0700 (PDT)
Received: from soleen.c.googlers.com.com (249.60.48.34.bc.googleusercontent.com. [34.48.60.249])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573c4dd9fsm947815985a.4.2025.03.19.19.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 19:40:18 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: changyuanl@google.com,
	graf@amazon.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	jgowans@amazon.com,
	jgg@nvidia.com
Subject: [RFC v1 3/3] luo: x86: Enable live update support
Date: Thu, 20 Mar 2025 02:40:11 +0000
Message-ID: <20250320024011.2995837-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
In-Reply-To: <20250320024011.2995837-1-pasha.tatashin@soleen.com>
References: <20250320024011.2995837-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the Live Update Orchestrator for the x86 architecture.

It does so by selecting ARCH_SUPPORTS_LIVEUPDATE when KEXEC_HANDOVER is
available, signaling to the LUO core that the architecture provides the
necessary Kexec Handover functionality required for live updates.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 arch/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index acd180e3002f..a7497cc84fbb 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -29,6 +29,7 @@ config X86_64
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select ARCH_SUPPORTS_PER_VMA_LOCK
 	select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
+	select ARCH_SUPPORTS_LIVEUPDATE if KEXEC_HANDOVER
 	select HAVE_ARCH_SOFT_DIRTY
 	select MODULES_USE_ELF_RELA
 	select NEED_DMA_MAP_STATE
-- 
2.49.0.395.g12beb8f557-goog

