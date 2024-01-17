Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C411EB24
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 08:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481776; cv=none; b=jDUXAHq5b37n/qHT3VFE/U2uG3SXYJP6ih43rQE27lTPFIc3US+3mNWQYhLzgI0ozF+Oh91stz4+RUiwDRXIZNFY4jYsHAw1/y1PRE0Bc11hOcyM3KPyA9HAH6BthfMW1FeYdWBbStY/xbb1lBkkNFz0srq+9DAE5uYa66aTbW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481776; c=relaxed/simple;
	bh=+sU2L91PzORZqj3b9pD85TN1AcK0aSoOmDSILqOINFs=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=aPcCov+Mb56g2NU4rwNFzHmol3zS3JsDztBNuIN9yLikiMNsk2qTBoCQPyhO70kMrdWXDMWq+940hK9U9lcOxgngIaUljdpc2ctZGLQ0FlfibtR6Q4X7eiWeqg0frGzsflu+xN5tPP8uv9njmyUKFDmmiO1HO73KgFoeir37wdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=bzmrEdcM; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="bzmrEdcM"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-20400d5b54eso7617023fac.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 00:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705481774; x=1706086574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0mxo/wJwfQ8In7qlAEKBYxIAqeDEb1P+gse306v00r4=;
        b=bzmrEdcMKKi7bSY8lomk7GibC8Q5NqYLu1d2fAbDj/fTGlHAIIeH5xZw0/npQPtunG
         heqX1hDkPT+kI0V9KF5Au2Z8Se7Sywgg97Ww5Cz0uFjqcgOznVbjTc62rR63yfzVU85N
         aujRLPc+avzxSNDfIIZadsrV+M/iev7KDk2XpGuvmnKHMnQgXsezA6KW2Qyvdh41FJxn
         rPSvyQ1xg5dBuXs+OYql/3ORINoVsb7XYgWLVdiEBejYbw0ysvRoWoW4gJvdlSmTc/0J
         LAqNoI2YGXoj+KLIMdWe/qtj17Sr7mZN3LDt414gDT0S8/8rL4grR2sT2+QHrE5pOSsQ
         sm4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481774; x=1706086574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mxo/wJwfQ8In7qlAEKBYxIAqeDEb1P+gse306v00r4=;
        b=QI1gWIfZlLRJ5Oog4uilQ4iAArD0+smhzzCI455tK2hx2pFn3Dhw2wW+HkvPEN/+wE
         7IPw0BAx6RkNWVdkrobO/LVoC7JpxHQWIeu3sXaye0zky12+0FDLZNMzVblIJKCR5TT0
         unOgM1CaqGx7IQ8t2lthFi7MHqjJQ/yEdaG275dzfhMot7jztUFCAtg3b6+wqwoAxjaL
         VwnqzM/+W1DA6CbGWbLZYdt4PfHlW6Cy2l8vT00McIvYmFTrdDX/n9qG40scd4afyh3C
         W+CGMK1DTnCLlJ7Sphk2E8h0aDzudBQwte/7DAqOo4IX2vLsLBcpJcfaWM9aITFdXdhO
         +ddQ==
X-Gm-Message-State: AOJu0YyUNI/3QlkgrBdBhvOVLccyOZxwCH645SkAYQqEmQCePh8GdKdz
	C1ry2ywUTEOlGPnHKN7n55WnksvJAz+0hQ==
X-Google-Smtp-Source: AGHT+IGKYXIXFlEpLpscwt2FQUgZRmkjQR1P66N6uPow96k+b3Jz6xJec6kFpgVqy3ujNkpyvYImJg==
X-Received: by 2002:a05:6870:11d6:b0:203:c5ca:5333 with SMTP id 22-20020a05687011d600b00203c5ca5333mr9204314oav.41.1705481774401;
        Wed, 17 Jan 2024 00:56:14 -0800 (PST)
Received: from C02G87K0MD6R.bytedance.net ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id cb19-20020a056a02071300b005cdbebd61d8sm10006224pgb.9.2024.01.17.00.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 00:56:14 -0800 (PST)
From: Hao Jia <jiahao.os@bytedance.com>
To: mark.rutland@arm.com,
	rmk+kernel@armlinux.org.uk,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	will@kernel.org,
	willy@infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 14/19] arm64: text replication: include most of read-only data as well
Date: Wed, 17 Jan 2024 16:53:52 +0800
Message-Id: <20240117085357.31693-15-jiahao.os@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20240117085357.31693-1-jiahao.os@bytedance.com>
References: <20240117085357.31693-1-jiahao.os@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

Include as much of the read-only data in the replication as we can
without needing to move away from the generic RO_DATA() macro in
the linker script.

Unfortunately, the read-only data section is immedaitely followed
by the read-only after init data with no page alignment, which
means we can't have separate mappings for the read-only data
section and everything else. Changing that would mean replacing
the generic RO_DATA() macro which increases the maintenance burden.

however, this is likely not worth the effort as the majority of
read-only data will be covered.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/mm/ktext.c |  2 +-
 arch/arm64/mm/mmu.c   | 21 ++++++++++++++++++---
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
index 6692759e78a8..6265a2db449b 100644
--- a/arch/arm64/mm/ktext.c
+++ b/arch/arm64/mm/ktext.c
@@ -101,7 +101,7 @@ void ktext_replication_patch_alternative(__le32 *src, int nr_inst)
 /* Allocate page tables and memory for the replicated kernel texts. */
 void __init ktext_replication_init(void)
 {
-	size_t size = _etext - _stext;
+	size_t size = __end_rodata - _stext;
 	int kidx = pgd_index((phys_addr_t)KERNEL_START);
 	int nid;
 
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 181d5339dd05..a4efc5015bee 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -753,11 +753,26 @@ static pgprot_t __init kernel_text_pgprot(void)
 #ifdef CONFIG_REPLICATE_KTEXT
 void __init create_kernel_nid_map(pgd_t *pgdp, void *ktext)
 {
+	phys_addr_t pa_ktext;
+	size_t ro_offset;
+	void *ro_end;
 	pgprot_t text_prot = kernel_text_pgprot();
 
-	create_kernel_mapping(pgdp, __pa(ktext), _stext, _etext, text_prot, 0);
-	create_kernel_mapping(pgdp, __pa_symbol(__start_rodata),
-			      __start_rodata, __inittext_begin,
+	pa_ktext = __pa(ktext);
+	ro_offset = __pa_symbol(__start_rodata) - __pa_symbol(_stext);
+	/*
+	 * We must not cover the read-only data after init, since this
+	 * is written to during boot, and thus must be shared between
+	 * the NUMA nodes.
+	 */
+	ro_end = PTR_ALIGN_DOWN((void *)__start_ro_after_init, PAGE_SIZE);
+
+	create_kernel_mapping(pgdp, pa_ktext, _stext, _etext, text_prot, 0);
+	create_kernel_mapping(pgdp, pa_ktext + ro_offset,
+			      __start_rodata, ro_end,
+			      PAGE_KERNEL, NO_CONT_MAPPINGS);
+	create_kernel_mapping(pgdp, __pa_symbol(ro_end),
+			      ro_end, __inittext_begin,
 			      PAGE_KERNEL, NO_CONT_MAPPINGS);
 	create_kernel_mapping(pgdp, __pa_symbol(__inittext_begin),
 			      __inittext_begin, __inittext_end,
-- 
2.20.1

