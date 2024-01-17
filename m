Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FE71DA36
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 08:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481754; cv=none; b=nPVzTBhf6x4OQ+6/CqQpouJPtwuRCWplsO1uxqSS/kfYErWpdmwN1GuadAv/Wa0JWmD1htg0r+m+by3nidIrRl77u/HPPjDaNi9IWnQKTPLRyj0NhRYDZZtDJdDa6PRg7si3BULoTCVed6tkKNGoYKabHaeYpX2rLMVlrqf1syg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481754; c=relaxed/simple;
	bh=WmFfg0rqlWoIwxwI25OM5xWy9KNF4hlSl/TNUahFdmI=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=Zrh83n301H3gG/rug7bQmF82cFa23AGK6qF9N+F4od4SWeLrmsDBH7DnQwDvcUTKJxn/YSd2DtboN+lE8OgXaFJjrGx6zxexD9LAqFPsc+dh+leqKirKKrvg/H1QfJCmBt1dSWrCbd1cxkM57+RMHZYbKRJMJF3IfSl4UndP8cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=BeYHzf5n; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="BeYHzf5n"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3bd884146e9so1187210b6e.0
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 00:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705481752; x=1706086552; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kz7yIkYYQs/zTY+Bmu5VAP4xx8AUiX/+3TTh8aD6Sqk=;
        b=BeYHzf5nfeBLazC4infwqp9oCFK2cgYSCaPPQScy98rFiBi4jDrJETXtOlbBWeCGae
         UvxpsULiwaKKAR20VI4FiLbzk39BBxk04pvF7bmK5JBLkSpQbPEgJIYKqbJbik4RdNlz
         8OZHP+dWaHNcV4SDmGLo0N+MSLpgo9ujwp7Q4unz7OsrRE3AkaTVuKbOnSQOhk1HA/Vk
         I2wHuswPysZCCxJKw3ejODuSatI2xzSGnQjOI9EcQAty+dBbinl3QBJlm3ZXavjQuufs
         oNAwminlL/W76BZWFfg6bzXOywX72VwXYRSSd/MCZaXwF+MdVkFEJbyYXD2Jy8J1uYZb
         cdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481752; x=1706086552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kz7yIkYYQs/zTY+Bmu5VAP4xx8AUiX/+3TTh8aD6Sqk=;
        b=ghIbnnre9Rec5CPVLccbvk9igELKaK7oTp8+ea8jf7willuNvaVnXBUVBHHeY4/1ps
         slMxA6j4bqt/ZNrG1Ty9zRbmHlTr5elY3QxQQIbBDNwUz7Udidf7ogp9PXSZGwNlIlA/
         cOO+aDnA3ZkSNBRMxokH47TWsQ8MV/TdR7TAU88I9nwnTwH2u9K74aqxpvfCNnY6EQiG
         mDLQtrKKletMBtV7FK0akj+8gOoQMsSkbs4mfjT/a9Yxir4Vw1EErfmyO3VgmL2PyzxD
         LU7zCf/c+JrhCc7BdRzy8WVJazlGeP1Z0CXVkhgVm/I4QZa0HSobb8Obh3iW6x0egqMZ
         As8Q==
X-Gm-Message-State: AOJu0YxGB9UpnQsj1Uv5YdKOI8ONTTEENgBw0LBQ8Zs+xMgUYOUBAPLH
	o2r4Z/PFAbW7fb55eu/sYyUiekfBwxRiHw==
X-Google-Smtp-Source: AGHT+IGXg9o1WdPryTMMD1XElL46glw3Rnpg9Li4DqEK7L7DDZuPP8jH36Eex6il99MUvKRpFSA4nw==
X-Received: by 2002:a05:6808:138c:b0:3bd:917f:6bec with SMTP id c12-20020a056808138c00b003bd917f6becmr1518013oiw.75.1705481751811;
        Wed, 17 Jan 2024 00:55:51 -0800 (PST)
Received: from C02G87K0MD6R.bytedance.net ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id cb19-20020a056a02071300b005cdbebd61d8sm10006224pgb.9.2024.01.17.00.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 00:55:51 -0800 (PST)
From: Hao Jia <jiahao.os@bytedance.com>
To: mark.rutland@arm.com,
	rmk+kernel@armlinux.org.uk,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	will@kernel.org,
	willy@infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 09/19] arm64: text replication: add swapper page directory helpers
Date: Wed, 17 Jan 2024 16:53:47 +0800
Message-Id: <20240117085357.31693-10-jiahao.os@bytedance.com>
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

Add a series of helpers for the swapper page directories - a set which
return those for the calling CPU, and those which take the NUMA node
number.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/pgtable.h | 19 +++++++++++++++++++
 arch/arm64/kernel/hibernate.c    |  2 +-
 arch/arm64/mm/ktext.c            | 20 ++++++++++++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 0eb71b2b1bd2..62a9d3e11fe1 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -635,6 +635,25 @@ extern struct pgtables pgtable_node0;
 
 #ifdef CONFIG_REPLICATE_KTEXT
 extern struct pgtables *pgtables[MAX_NUMNODES];
+
+pgd_t *swapper_pg_dir_node(void);
+phys_addr_t __swapper_pg_dir_node_phys(int nid);
+phys_addr_t swapper_pg_dir_node_phys(void);
+#else
+static inline pgd_t *swapper_pg_dir_node(void)
+{
+	return swapper_pg_dir;
+}
+
+static inline phys_addr_t __swapper_pg_dir_node_phys(int nid)
+{
+	return __pa_symbol(swapper_pg_dir);
+}
+
+static inline phys_addr_t swapper_pg_dir_node_phys(void)
+{
+	return __pa_symbol(swapper_pg_dir);
+}
 #endif
 
 extern void set_swapper_pgd(pgd_t *pgdp, pgd_t pgd);
diff --git a/arch/arm64/kernel/hibernate.c b/arch/arm64/kernel/hibernate.c
index 02870beb271e..be69515da802 100644
--- a/arch/arm64/kernel/hibernate.c
+++ b/arch/arm64/kernel/hibernate.c
@@ -113,7 +113,7 @@ int arch_hibernation_header_save(void *addr, unsigned int max_size)
 		return -EOVERFLOW;
 
 	arch_hdr_invariants(&hdr->invariants);
-	hdr->ttbr1_el1		= __pa_symbol(swapper_pg_dir);
+	hdr->ttbr1_el1		= swapper_pg_dir_node_phys();
 	hdr->reenter_kernel	= _cpu_resume;
 
 	/* We can't use __hyp_get_vectors() because kvm may still be loaded */
diff --git a/arch/arm64/mm/ktext.c b/arch/arm64/mm/ktext.c
index 48d7943d6907..7b9a1f1b12a1 100644
--- a/arch/arm64/mm/ktext.c
+++ b/arch/arm64/mm/ktext.c
@@ -21,6 +21,26 @@ struct pgtables *pgtables[MAX_NUMNODES] = {
 
 static void *kernel_texts[MAX_NUMNODES];
 
+static pgd_t *__swapper_pg_dir_node(int nid)
+{
+	return pgtables[nid]->swapper_pg_dir;
+}
+
+pgd_t *swapper_pg_dir_node(void)
+{
+	return __swapper_pg_dir_node(numa_node_id());
+}
+
+phys_addr_t __swapper_pg_dir_node_phys(int nid)
+{
+	return __pa(__swapper_pg_dir_node(nid));
+}
+
+phys_addr_t swapper_pg_dir_node_phys(void)
+{
+	return __swapper_pg_dir_node_phys(numa_node_id());
+}
+
 void __kprobes ktext_replication_patch(u32 *tp, __le32 insn)
 {
 	unsigned long offset;
-- 
2.20.1

