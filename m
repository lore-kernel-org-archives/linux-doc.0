Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214AB12B6C
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 08:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481803; cv=none; b=fDX3cJEwVswlvHddF8TZcPAuiq8oKA+d9lyUIFeEQrMVNd/DthcgYMq0mRfbUeiissXdZl0cfVhmqeEfBitrmFIv21gMbAlbKAjt0B53z3tyWRScpbU1qiXwtGUN3FgcGu7RjrDqAFV0AlE8gyeO4ktJEv8DBC7NV80zILu35oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481803; c=relaxed/simple;
	bh=Jii6fX0ic5w5qMoYBFxltxmF2hjifAZam+8PWSINLnA=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=ZQPywtK3p1Hy5kHf8vOH2xxCGRcOOKKrKamQ4JfHaD14faC8jcbmnl3OKTszwienfZcFCY3mV4nWe8Yo2ZGC1b4PrVOtMZs08dLZ96ZYAIEpmT5XL+PFS1MWWFOzcPTJJaH5m0kKpD5L13lhAY3YCldIGNCjOvnbmiMQPpshfio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=DSjlAS8M; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="DSjlAS8M"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-204235d0913so7012949fac.1
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 00:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705481801; x=1706086601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=go4Vs1Ubv/hS773yJGURKRCxyCNGdiSDMhcIn69n/QY=;
        b=DSjlAS8MwVWxe4T47TEAiHgSEMCa34tfyz9wZJbMK0n8CdFBudUGYv4zvarobf8Cfs
         bn5nPe/8iGB6YLnwH+RDmeHeSNGldBoBmpMVk6bdZlpbcoTfeAwJrcNTZdNAB0V8cAmm
         DeJGSVvfNI2V+cS2BBiHm9f+UPfOWhx9DFqyO23QtCseCSRSgK8Mi/QWHEvo2bRFXynV
         HWrPzJQmXajW9ZTsjzGoQ/UcRUV38CABOCZW/s+95kBUwXP5X/RwFC1o28HHPK8Ns+dO
         r4taz1J909jIpRxUqbDu2u2H31QQ+V5F1Wf/Uf23o2zRI2BNCPdYQqWh0KmUgqqexrdq
         tB5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481801; x=1706086601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=go4Vs1Ubv/hS773yJGURKRCxyCNGdiSDMhcIn69n/QY=;
        b=prDDsjf+zexQN9r43AcrGp30itDwHE4P4BOdHx41Z7DutZYDqS6bZzHp0FtohwC0ik
         PNSpsJ0Fs2x1ioYZrab/rXHdHZv5NXTq0lxm2Bo7BnIOMX7+HO1G+XxSj1Dv9yw/aMmz
         IRFX10VgdNUaorK0Uab+5fHXN7YyxKyy41wcsOcYNDqNqaNaawdfoCHRkKBj1jvJd5F8
         NjH0hdmNkjhgjmNXDMfDBRXOp0UcSRSwzfVoclDqkOo8wJtoUPapLutOrfDEtvOwSzBp
         4Zz5SlbbZLH5FCg8wnTL9Y25OljaODcMOjQJv7Q5sqT5tD1AtVdHlT6UKqd9RJxLBM3b
         bR/w==
X-Gm-Message-State: AOJu0YzqJ3v3juUcnB+aM5WClrVtwyEAdPq/DsuPdwLTLCHMRya03Rsf
	ZfFjBIzcZ76JVngL2ze+7m+YNyuAda/BeA==
X-Google-Smtp-Source: AGHT+IHzXZQ651QR48qYQK3goo/FqUmsGCcl/Y8eJIkwGTQHzdjd21HNfMjv4K6S2Qd3nE7F4eJFOQ==
X-Received: by 2002:a05:6870:e0cb:b0:206:878:61d8 with SMTP id a11-20020a056870e0cb00b00206087861d8mr11503527oab.19.1705481800126;
        Wed, 17 Jan 2024 00:56:40 -0800 (PST)
Received: from C02G87K0MD6R.bytedance.net ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id cb19-20020a056a02071300b005cdbebd61d8sm10006224pgb.9.2024.01.17.00.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 00:56:39 -0800 (PST)
From: Hao Jia <jiahao.os@bytedance.com>
To: mark.rutland@arm.com,
	rmk+kernel@armlinux.org.uk,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	will@kernel.org,
	willy@infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Hao Jia <jiahao.os@bytedance.com>
Subject: [PATCH v3 19/19] arm64: text replication: keep modules inside module region when REPLICATE_KTEXT is enabled
Date: Wed, 17 Jan 2024 16:53:57 +0800
Message-Id: <20240117085357.31693-20-jiahao.os@bytedance.com>
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

Kernel text replication requires maintaining a separate per-node page table
for kernel text. To accomplish this without affecting other kernel memory maps,
it is best to place the kernel in a location that does not share L0 page
table entries with any other mappings.

So, limit the module_alloc() address range so that they do not overlap.

Signed-off-by: Hao Jia <jiahao.os@bytedance.com>
---
 arch/arm64/kernel/module.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index dd851297596e..53e1c5e50907 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -112,6 +112,7 @@ subsys_initcall(module_init_limits);
 
 void *module_alloc(unsigned long size)
 {
+	u64 module_direct_end, module_plt_end;
 	void *p = NULL;
 
 	/*
@@ -119,18 +120,33 @@ void *module_alloc(unsigned long size)
 	 * kernel such that no PLTs are necessary.
 	 */
 	if (module_direct_base) {
+#ifdef CONFIG_REPLICATE_KTEXT
+		/*
+		 * Kernel text replication requires an L0 page table entry to
+		 * be exclusive to kernel text, so no other mappings should be
+		 * shared with it.
+		 */
+		module_direct_end = MODULES_END;
+#else
+		module_direct_end = module_direct_base + SZ_128M;
+#endif
 		p = __vmalloc_node_range(size, MODULE_ALIGN,
 					 module_direct_base,
-					 module_direct_base + SZ_128M,
+					 module_direct_end,
 					 GFP_KERNEL | __GFP_NOWARN,
 					 PAGE_KERNEL, 0, NUMA_NO_NODE,
 					 __builtin_return_address(0));
 	}
 
 	if (!p && module_plt_base) {
+#ifdef CONFIG_REPLICATE_KTEXT
+		module_plt_end = MODULES_END;
+#else
+		module_plt_end = module_plt_base + SZ_2G;
+#endif
 		p = __vmalloc_node_range(size, MODULE_ALIGN,
 					 module_plt_base,
-					 module_plt_base + SZ_2G,
+					 module_plt_end,
 					 GFP_KERNEL | __GFP_NOWARN,
 					 PAGE_KERNEL, 0, NUMA_NO_NODE,
 					 __builtin_return_address(0));
-- 
2.20.1

