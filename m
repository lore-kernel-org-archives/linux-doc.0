Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067A012B98
	for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 08:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481698; cv=none; b=tTfZ9soRdYM/wYJpHS9Bmc1M5sLscjTrk3RFvKQr2HmQvSe0CzOf24eEDv4izO0PCnXUsjvsNbB/RGik4EBcRs08gJ5B6V5TIiRXx8hjsyDf20FZFKOiirDaLuJKovsl0Xj+XJ2CEIZkldF93PqJGWnD7/3c0/AbP0Dns2nUfeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481698; c=relaxed/simple;
	bh=mnfgREsVwr1go6r7hwxzFMbQSv7AIS5GqJffah50uhQ=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding; b=MXWHbtBw0lw6lqsoSY2OYGob9EQpo7sNHTUAOHpbfxLvtQ/rBPnouTpdQSPFaGNhuF1VDyEnzdmkMxDoZon7SY7BTFr8xbgFw6xOMmIqHlC3M0D8N1VHqJctNvhTZKhoot1NmOoIL3zf09SG6T/LW3+nJqmlw38kRq6Dj0zmyFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=lUDKCTNC; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="lUDKCTNC"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6dad22e13dcso6784337b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 17 Jan 2024 00:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1705481696; x=1706086496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0YnrwPSql1GKAZEKcOXCTYFdFroQe84JOBLT0y5oKY=;
        b=lUDKCTNCsff+PDq8y0kDF1b85bmKwfeOTaon0Px6MbipbzUtFy4FGPaurZcW/L0Pv0
         q2pTqvSF+zyARnIsKZNL8Y9B5H8yxQUSfi6qKrP30Js785Siji9oyl1JKCPzzEsAM8Zo
         2AMyWW21Oflz1K1w1RcecsdcsZViGkUhYIAeb1tJr+lRJTSyajW8p8wifJ1ros07cg4Q
         HwWTvPuj8AEVJiyQ3x4jMOO0m/rbOLoEkvhl3twk/MB8oqn7eleLV4gz1vB3vJi323OE
         ev2XsUQFwAzKYyb/3OsG58ypfGTbDyI8UcrTNeYuf8cJjTTJvbTtD241FtxxRHUNKQLf
         G5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481696; x=1706086496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0YnrwPSql1GKAZEKcOXCTYFdFroQe84JOBLT0y5oKY=;
        b=Zzk4q0ssUsTYvkon2yy8+Uq6/dkjV3VvaLmC5C++Jh1e5t0uKtIHODOdwssN4V/FmI
         SM6s3SsMoC/2KrdkLzkC/8dbzIJLVNhbdtjbZXfWubA8rArbbPOyE+wre7fu2RG2I2g7
         ub8KoeUb2Z4GEukicCgm+k8kGBurF7kN9jAJbzx8s9W0857rBBew6BXQyxiqxOODpB41
         vxFG5eOOaYgEhIkf1HJ18yU2awreyMCHcpb693akprBo5Yd3/Otz/sP/zw5s2xU5J2Xb
         czs8y9L6YmpWhwlap+IvIUr/55ttoTUfK/x85DPyu2f1SEHzqNgL0E0I+Cj5Ggp/dv3Z
         G/Qw==
X-Gm-Message-State: AOJu0YxnwvoHrobjvrc5plWiHQUcginHGCd/i8Es/p/no0LIqq9Fr9Sk
	XaX3mFfmox1EPE2hlHmL/8ruDPmciRVAzA==
X-Google-Smtp-Source: AGHT+IHmwRHuXI6O8J3adudCI7NFjlL6JoU2MdHCSfsQaz+G5M+OeCSK/lNDZKGMnOd+N31liyzFRg==
X-Received: by 2002:a05:6a00:170a:b0:6d9:d3a7:be4c with SMTP id h10-20020a056a00170a00b006d9d3a7be4cmr5709736pfc.52.1705481696271;
        Wed, 17 Jan 2024 00:54:56 -0800 (PST)
Received: from C02G87K0MD6R.bytedance.net ([203.208.167.154])
        by smtp.gmail.com with ESMTPSA id cb19-20020a056a02071300b005cdbebd61d8sm10006224pgb.9.2024.01.17.00.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 00:54:55 -0800 (PST)
From: Hao Jia <jiahao.os@bytedance.com>
To: mark.rutland@arm.com,
	rmk+kernel@armlinux.org.uk,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	will@kernel.org,
	willy@infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 01/19] arm64: provide cpu_replace_ttbr1_phys()
Date: Wed, 17 Jan 2024 16:53:39 +0800
Message-Id: <20240117085357.31693-2-jiahao.os@bytedance.com>
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

Provide a version of cpu_replace_ttbr1_phys() which operates using a
physical address rather than the virtual address of the page tables.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/arm64/include/asm/mmu_context.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
index 9ce4200508b1..466797dcb5fc 100644
--- a/arch/arm64/include/asm/mmu_context.h
+++ b/arch/arm64/include/asm/mmu_context.h
@@ -152,7 +152,7 @@ static inline void cpu_install_ttbr0(phys_addr_t ttbr0, unsigned long t0sz)
  * Atomically replaces the active TTBR1_EL1 PGD with a new VA-compatible PGD,
  * avoiding the possibility of conflicting TLB entries being allocated.
  */
-static inline void __cpu_replace_ttbr1(pgd_t *pgdp, pgd_t *idmap, bool cnp)
+static inline void __cpu_replace_ttbr1_phys(phys_addr_t pgd_phys, pgd_t *idmap, bool cnp)
 {
 	typedef void (ttbr_replace_func)(phys_addr_t);
 	extern ttbr_replace_func idmap_cpu_replace_ttbr1;
@@ -160,7 +160,7 @@ static inline void __cpu_replace_ttbr1(pgd_t *pgdp, pgd_t *idmap, bool cnp)
 	unsigned long daif;
 
 	/* phys_to_ttbr() zeros lower 2 bits of ttbr with 52-bit PA */
-	phys_addr_t ttbr1 = phys_to_ttbr(virt_to_phys(pgdp));
+	phys_addr_t ttbr1 = phys_to_ttbr(pgd_phys);
 
 	if (cnp)
 		ttbr1 |= TTBR_CNP_BIT;
@@ -180,6 +180,11 @@ static inline void __cpu_replace_ttbr1(pgd_t *pgdp, pgd_t *idmap, bool cnp)
 	cpu_uninstall_idmap();
 }
 
+static inline void __nocfi __cpu_replace_ttbr1(pgd_t *pgdp, pgd_t *idmap, bool cnp)
+{
+	__cpu_replace_ttbr1_phys(virt_to_phys(pgdp), idmap, cnp);
+}
+
 static inline void cpu_enable_swapper_cnp(void)
 {
 	__cpu_replace_ttbr1(lm_alias(swapper_pg_dir), idmap_pg_dir, true);
-- 
2.20.1

