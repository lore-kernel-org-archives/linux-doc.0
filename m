Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE8D1CB53E
	for <linux-doc@vger.kernel.org>; Thu, 12 Sep 2024 23:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726183084; cv=none; b=q7e6ChNn9QlQ7QnxzzPOhKn/dM4FbIXcaeMxJwJiZYlMomZ6QmcP5iNoNHO+NGwP+G40jAvhUsU/XX04+HA6uXkOEid+oEcJ/Ow5Oh//QrqQR5yc7C7Q3PyvzIggjrcVl4Mdr9rdFhhgPFB4cVpsA3GEFLo7PU3uO3o/hTNlDPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726183084; c=relaxed/simple;
	bh=sf3GOWD0SoQOEH7lcoO5gfpbxRzFpZAhwlGUGr+bc4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mEZP3atgabrj2AkKz/+tSzntlYqEV469JsSJebEwTNPc/+vt5/62j1HLRWRqgbVfRzWj5MVc3MRLWutvCkERnpav6AOypclocmqWeKZ4khZObYZqpw812Ek+GKL/tmftVsc7NvP3SoghUyrGD6jHMXZupMRLDJEIQmJxCvlAA5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=PA4uat28; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="PA4uat28"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2d88c5d76eeso279608a91.2
        for <linux-doc@vger.kernel.org>; Thu, 12 Sep 2024 16:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726183083; x=1726787883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2o2VksxHwPquNK6/4RcwFNcMNDB9IND71Ze1od4h7MM=;
        b=PA4uat28/dysWrRXy+NG4eLvLb0+/jHOu19rKtakV1SmPmSbu7Fp+QRvPjGyeyX8VB
         a9/IjwD6yqdejG4DaiQpomUUoSBY49w6Hz0KXHayZRk6/K/8q7IMyx7raAnL/enEqtRP
         xbcpkq4j4jzBWuCSdqxapy+nEuHqrRMc8znplrMvlowIGbegINNFvSnVeqeIchp4e4st
         aIGQHmzE/puJ0X66PEP/019mkxxnaXx8tdHTBeqpD1MgKYudHewwKj4qoP9rMVFKvxdN
         ks4FmaY5f5rVYXUVwJIlEr+5m5zP7KYvE1zPL7M4i4sO5ka+GFuT/aConhGS/VzOuFFN
         4R4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726183083; x=1726787883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2o2VksxHwPquNK6/4RcwFNcMNDB9IND71Ze1od4h7MM=;
        b=pOF4C7G5OEmSjUEXF8T4ob/tzbTv30RlDty54uR30QCmF8YTcVJvCys3TJ++Gp6oxA
         ejc1HV/TKA7rUD0sUYleUNQVLOkcp3CsTeAaUz8L76gl12T3BYu3GDpvGsbSuI/Ih5RQ
         p6pHvIq91d/585ELV2fYhEl6pBYckw2fKxDIRjDL62KSHMgedYrNeKvAIuJCFui/+opt
         cJwEd9AxGZs702t1eqns1TPZ+vViuSsvgSQfceWsTKtCT0ibXiN6ptleydsPEms8JaJs
         tnrRCX2gzlzlXDQOH2QESyDFj+94aixNgf809tsAuiPCjny41AyEwrLXYq8JU7r3KcUY
         z+Wg==
X-Forwarded-Encrypted: i=1; AJvYcCX4GKkWz8RHEoR/jl3waTcbyR633fv/TXkkgZZBQN4CRXeO/QhyTMg0pLjdysaTLImuYrYSdSu7p2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrxHp/ll3MzsGSadFi0NYNsTPg/Srs5sSwcZQ1m1LdEbO2w057
	uBlmY5SxXwCcmPW3zQLuSzyX2Jpgds2l6wUUvWzxAeC7T2ysHxMOACBU0Z59llE=
X-Google-Smtp-Source: AGHT+IFc5Xo3W7imJs6v1qZAyylQCnIMRJTm9oY3HnptRktjFuhlx1nDwXattiRmY7sUUOR5c5uRiQ==
X-Received: by 2002:a17:90b:1e45:b0:2d3:b748:96dd with SMTP id 98e67ed59e1d1-2dbb9eda70cmr1036124a91.25.1726183082840;
        Thu, 12 Sep 2024 16:18:02 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db6c1ac69asm3157591a91.0.2024.09.12.16.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:18:02 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: corbet@lwn.net,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	krzk+dt@kernel.org,
	oleg@redhat.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	peterz@infradead.org,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	kees@kernel.org,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lorenzo.stoakes@oracle.com,
	shuah@kernel.org,
	brauner@kernel.org,
	samuel.holland@sifive.com,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	greentime.hu@sifive.com,
	charlie@rivosinc.com,
	evan@rivosinc.com,
	cleger@rivosinc.com,
	xiao.w.wang@intel.com,
	ajones@ventanamicro.com,
	anup@brainfault.org,
	mchitale@ventanamicro.com,
	atishp@rivosinc.com,
	sameo@rivosinc.com,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	david@redhat.com,
	libang.li@antgroup.com,
	jszhang@kernel.org,
	leobras@redhat.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	costa.shul@redhat.com,
	bhe@redhat.com,
	zong.li@sifive.com,
	puranjay@kernel.org,
	namcaov@gmail.com,
	antonb@tenstorrent.com,
	sorear@fastmail.com,
	quic_bjorande@quicinc.com,
	ancientmodern4@gmail.com,
	ben.dooks@codethink.co.uk,
	quic_zhonhan@quicinc.com,
	cuiyunhui@bytedance.com,
	yang.lee@linux.alibaba.com,
	ke.zhao@shingroup.cn,
	sunilvl@ventanamicro.com,
	tanzhasanwork@gmail.com,
	schwab@suse.de,
	dawei.li@shingroup.cn,
	rppt@kernel.org,
	willy@infradead.org,
	usama.anjum@collabora.com,
	osalvador@suse.de,
	ryan.roberts@arm.com,
	andrii@kernel.org,
	alx@kernel.org,
	catalin.marinas@arm.com,
	broonie@kernel.org,
	revest@chromium.org,
	bgray@linux.ibm.com,
	deller@gmx.de,
	zev@bewilderbeest.net
Subject: [PATCH v4 13/30] riscv mmu: teach pte_mkwrite to manufacture shadow stack PTEs
Date: Thu, 12 Sep 2024 16:16:32 -0700
Message-ID: <20240912231650.3740732-14-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240912231650.3740732-1-debug@rivosinc.com>
References: <20240912231650.3740732-1-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pte_mkwrite creates PTEs with WRITE encodings for underlying arch.
Underlying arch can have two types of writeable mappings. One that can be
written using regular store instructions. Another one that can only be
written using specialized store instructions (like shadow stack stores).
pte_mkwrite can select write PTE encoding based on VMA range (i.e.
VM_SHADOW_STACK)

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h |  7 +++++++
 arch/riscv/mm/pgtable.c          | 17 +++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 0b6c66fb853a..30fd4874e871 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -420,6 +420,10 @@ static inline pte_t pte_wrprotect(pte_t pte)
 
 /* static inline pte_t pte_mkread(pte_t pte) */
 
+struct vm_area_struct;
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma);
+#define pte_mkwrite pte_mkwrite
+
 static inline pte_t pte_mkwrite_novma(pte_t pte)
 {
 	return __pte(pte_val(pte) | _PAGE_WRITE);
@@ -732,6 +736,9 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
 	return pte_pmd(pte_mkyoung(pmd_pte(pmd)));
 }
 
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma);
+#define pmd_mkwrite pmd_mkwrite
+
 static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 {
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 533ec9055fa0..0dd6104a35ac 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -142,3 +142,20 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 	return pmd;
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma)
+{
+	if (vma->vm_flags & VM_SHADOW_STACK)
+		return pte_mkwrite_shstk(pte);
+
+	return pte_mkwrite_novma(pte);
+}
+
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
+{
+	if (vma->vm_flags & VM_SHADOW_STACK)
+		return pmd_mkwrite_shstk(pmd);
+
+	return pmd_mkwrite_novma(pmd);
+}
+
-- 
2.45.0

