Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADC144368
	for <linux-doc@vger.kernel.org>; Fri, 29 Mar 2024 04:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711687587; cv=none; b=p9sul9rD8w3zQkQADKvr9j8pq4y9Xr+fETgEkyhNH+TaQPQQYxu6PoU7f+ngVvievOUD0QPX9URzVucVb0Etxem8t+pGPSI5iox2BwA0PFbFW3wv4xtDBHxwHXRApw61s1YTB9mWAzgDqe9FjyqzOer3ms5h5lTHftcxvX1cn08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711687587; c=relaxed/simple;
	bh=7I6zjgCFV6RndlqIEMECkC47T7n+mKP10TbnVazBOuA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YUM7LnHv4rkoH0XIc7taljbUCjRy3M8NSXFFQL7aQTM5z5mqwKbIn++i1gt2XIWcf/GAeTf4M/nUKzAYLNI6fjUwMVrhfQnmiidIZd58e6hmxKDu7dfNHanjpt86jeVLGzN4hFFmYiCXyF/rY3Lu1JURCSAVGAIMgy23qKgUmpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=G+da6zSF; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="G+da6zSF"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e6ee9e3cffso1196632b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2024 21:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1711687585; x=1712292385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+4XcZbT52YyPYTbBbJHKVVBDZyhFzr+R5No8SlxzOH0=;
        b=G+da6zSFsHX3UgMCnG11T5CqVbMdBqvSGEKLyoidUP58R6vsbI1gMyYb/rtXlM2x9q
         lZAKpMspurfr8lRn6e161UQqgfdMQyR74oHnYHGkIPKJ1eDg+ptyC89pvYJDif1tjY07
         zVpzy3pbA2OY8Lho+HQKIMnqlOjYIiy4yfu5KoZGlYV5rR8sKGfJO3FtZJM6oPtpgagH
         ar3Y9RSmkhZ1MDj3WQ9W5FGmjHJkExpho21JWRizYDLizvJ0kZoyN2Po8sXaIH2AyWyS
         9zMlMXDoGeQI/zr3yYai/EdmoJfrA3dghbi9TE5MkltPhYtSxbnpsmr89a+J4MS2FEqe
         hByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711687585; x=1712292385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4XcZbT52YyPYTbBbJHKVVBDZyhFzr+R5No8SlxzOH0=;
        b=trVmjDqTAEbsTAMjfFFZCC6iSYNNV2b/YRckdgJkUJHv5wI1XcmETd1vNA3IXXiDlk
         JzIlvXtUqwbp0AwJxO8MDwkB8Y6wt196LeNpYPfVgyLf4jTeuVfng+VcuZ2l7c/hwU/E
         E2bvmvrG2n3rg4O0D/HBg6PLET2d6PCauIpTjxCUr4KNhMtFka/eOxWz0jOlB3kHLyWs
         E3tCtHuYDIwR3w/Fvh/rLeWZMEPLOhIoFr/wJMaednkBCSVuMqcJjRdsVjRZQC3fj3Sz
         7ZYaTx2wxW1Zy31B/FTooDpY07utlJC2PRLiWFhKEE2e0wR18B3OHghHONvgQtPeZzhY
         EC0A==
X-Forwarded-Encrypted: i=1; AJvYcCXRlIdyjD6gboUS2rTdGM6FylBy847laU9VwSp2LPOqbaIBpdHr+Vx+IvyxvU4CC8FTZmC8uR+fHaXSr3ZD6BZrVMvopT9T5lYk
X-Gm-Message-State: AOJu0Yw+CWbRb1EsQOqE90+upUXb2pkYhB8xPs1o7AqitNtuutJ4i2qz
	FQgw4jl7RzigJqmzWWUvxW9tQKdDUeYiUE+p+dnIPudmuSIepuNAgrtN7V9UmrU=
X-Google-Smtp-Source: AGHT+IGU4KJtKBTHpZlkqt9cg1BlBHp1APuo4lcElwp7mwPxz8+nlm5g5TQdTRKqVuVUt4gfjoQ+Lw==
X-Received: by 2002:a05:6a00:a29:b0:6ea:df49:c8b1 with SMTP id p41-20020a056a000a2900b006eadf49c8b1mr2139229pfh.13.1711687585128;
        Thu, 28 Mar 2024 21:46:25 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id i18-20020aa78b52000000b006ea7e972947sm2217120pfd.130.2024.03.28.21.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 21:46:24 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	rick.p.edgecombe@intel.com,
	broonie@kernel.org,
	Szabolcs.Nagy@arm.com,
	kito.cheng@sifive.com,
	keescook@chromium.org,
	ajones@ventanamicro.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	atishp@atishpatra.org,
	alex@ghiti.fr,
	bjorn@rivosinc.com,
	alexghiti@rivosinc.com,
	samuel.holland@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: corbet@lwn.net,
	tech-j-ext@lists.risc-v.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	oleg@redhat.com,
	akpm@linux-foundation.org,
	arnd@arndb.de,
	ebiederm@xmission.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	lstoakes@gmail.com,
	shuah@kernel.org,
	brauner@kernel.org,
	debug@rivosinc.com,
	andy.chiu@sifive.com,
	jerry.shih@sifive.com,
	hankuan.chen@sifive.com,
	greentime.hu@sifive.com,
	evan@rivosinc.com,
	xiao.w.wang@intel.com,
	charlie@rivosinc.com,
	apatel@ventanamicro.com,
	mchitale@ventanamicro.com,
	dbarboza@ventanamicro.com,
	sameo@rivosinc.com,
	shikemeng@huaweicloud.com,
	willy@infradead.org,
	vincent.chen@sifive.com,
	guoren@kernel.org,
	samitolvanen@google.com,
	songshuaishuai@tinylab.org,
	gerg@kernel.org,
	heiko@sntech.de,
	bhe@redhat.com,
	jeeheng.sia@starfivetech.com,
	cyy@cyyself.name,
	maskray@google.com,
	ancientmodern4@gmail.com,
	mathis.salmen@matsal.de,
	cuiyunhui@bytedance.com,
	bgray@linux.ibm.com,
	mpe@ellerman.id.au,
	baruch@tkos.co.il,
	alx@kernel.org,
	david@redhat.com,
	catalin.marinas@arm.com,
	revest@chromium.org,
	josh@joshtriplett.org,
	shr@devkernel.io,
	deller@gmx.de,
	omosnace@redhat.com,
	ojeda@kernel.org,
	jhubbard@nvidia.com
Subject: [PATCH v2 12/27] riscv mmu: write protect and shadow stack
Date: Thu, 28 Mar 2024 21:44:44 -0700
Message-Id: <20240329044459.3990638-13-debug@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329044459.3990638-1-debug@rivosinc.com>
References: <20240329044459.3990638-1-debug@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`fork` implements copy on write (COW) by making pages readonly in child
and parent both.

ptep_set_wrprotect and pte_wrprotect clears _PAGE_WRITE in PTE.
Assumption is that page is readable and on fault copy on write happens.

To implement COW on such pages, clearing up W bit makes them XWR = 000.
This will result in wrong PTE setting which says no perms but V=1 and PFN
field pointing to final page. Instead desired behavior is to turn it into
a readable page, take an access (load/store) fault on sspush/sspop
(shadow stack) and then perform COW on such pages. This way regular reads
would still be allowed and not lead to COW maintaining current behavior
of COW on non-shadow stack but writeable memory.

On the other hand it doesn't interfere with existing COW for read-write
memory. Assumption is always that _PAGE_READ must have been set and thus
setting _PAGE_READ is harmless.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 9b837239d3e8..7a1c2a98d272 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -398,7 +398,7 @@ static inline int pte_special(pte_t pte)
 
 static inline pte_t pte_wrprotect(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
+	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
 }
 
 /* static inline pte_t pte_mkread(pte_t pte) */
@@ -581,7 +581,15 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 static inline void ptep_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pte_t *ptep)
 {
-	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
+	volatile pte_t read_pte = *ptep;
+	/*
+	 * ptep_set_wrprotect can be called for shadow stack ranges too.
+	 * shadow stack memory is XWR = 010 and thus clearing _PAGE_WRITE will lead to
+	 * encoding 000b which is wrong encoding with V = 1. This should lead to page fault
+	 * but we dont want this wrong configuration to be set in page tables.
+	 */
+	atomic_long_set((atomic_long_t *)ptep,
+			((pte_val(read_pte) & ~(unsigned long)_PAGE_WRITE) | _PAGE_READ));
 }
 
 #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
-- 
2.43.2

