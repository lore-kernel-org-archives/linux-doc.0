Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2849B1991CA
	for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 14:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741618377; cv=none; b=qu8AQFUFxJWFIIS6763dd78roiWcp6YwXElx2Hr3A1qvfRBoxv9nnYa/hxGMsC+1XrfKHGWhlOVo/n+aV9QHpXxmlsZMNFtde8NZnmFo+OihGFivvd8OPW7MgoNH/Mln6MPJT9sONZzVhHdHwGXiqxiXfjpNCPh0QfAgKBFtYXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741618377; c=relaxed/simple;
	bh=e2JFB4Jy2B8PEfrSQ43O9FncAUYVFHD+Rwfp/3fLFok=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vpht/AOfRhLXKuOD06rm9LnZF4AKI+GwjZ0D2Rb2O1iGurcGD/F1XjILSBEbdG0YtJgp8T/O9ZkFRnuQTkmhM+gIr0K/YYy9qrvKkohasaIDfcI1QI3ffxxIFv03Fd9MTwVv/062sabX1sfmizfYWPCHZMKXu/rm3l6Leuz1dUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=LuFdM79y; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="LuFdM79y"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-223378e2b0dso62374085ad.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 07:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741618374; x=1742223174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kL+yIoSlkTX0SokBaTv1DsPGjl4jKUPC0i4GBiCWGFY=;
        b=LuFdM79yGrhEpDO04BXfvUzHEh4vd1FandU8wTPhue8Tj2YvZ+fA0BgWi3fsUHBdLT
         pde4Yi4mV2AqE4ybFzZ5hxBkTRi9F4Z++sm32zMfh0PT+XpX/hBQnjjBeHlufV761eUZ
         CzLA9vXAQnDIOknNMjHlLeVVMC5iznFYqqfFrxCcaN5aoBuScOAFNr0UQxOt3XYXSO/0
         Re+bNbOaohstxNUYVvBZQmTphYgt1W1DqKKY9NwKELxIMI1IC5FlJ5vloTpeOpcLyWv+
         d6/D5Vy30OuIix+io7FnNjA3k+70DH4V97wsUJ1NpgkAN5619qLCDM4meygsOLm8kPiW
         VMbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741618374; x=1742223174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kL+yIoSlkTX0SokBaTv1DsPGjl4jKUPC0i4GBiCWGFY=;
        b=ucTao+Sh+4aHb331OQEVGE8k7nckDVJIM0uO+JLbknauIVcdiDFhPqfweXnbTyPhrL
         GTH1117JCnmaToZpiioBD4SJuJPzWNyeuyYwagqaCEpKiBvI1qoUTyeDgkTz/fNUHXEA
         PjpMk71ajlJK3/GiFF0IHnL4Ope0k5y3PfgxrqapA41OeRjI/dfwGhICg2sxCx3fUuT4
         CBnDWK6Okbdgm18xtU+ioM85iBIB3ejSK4/3BwY1uhZL5Tk51OU4EVyp1C3z4sm4utu7
         lSC/0DVq5hPlBFx9YArk/JmkIcSG4cG4n8q5EcMPFVe/TlwK/ZPIh7pFCP7ocvorBzMy
         ryZg==
X-Forwarded-Encrypted: i=1; AJvYcCV0QaCFZgZm6GtxmypYpzlIYQrQMAIhdwJMTLpUpeg/ojdg8yGxK5jRZNNgwtIj0KjfzwNqlw+phH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrPvfYz5y1iVeks/qBGOINYr0ty/grIc9zPAosRCAN/qgTFHpH
	gXeZ9ydWiGHWa6oBVxwFCQ5Vjz37Sor8t9X+KfI8BIae/12a2T3T4aw08XQMIBI=
X-Gm-Gg: ASbGncs1CLjVxgb/TMWVFcnmqCCWY9wI3SLoeHXPt622L2hLodEYGhGtpZgo09FfGTr
	2PYt+ya/kItTaFuZeHsVuGY+YDJgn7SQXr0JE5SMqMuuIZ3YxAKu9HZDKF4q1TkL+iWSedAvFFn
	I/tW+AZn6Hn3kBeHfFvPQBm95ZszUpI+BcQ4zeUTAU1RYjMvjLsDMdxmHCXoF7bzAHO4YboJDkK
	PwJJU5rzPTCWVKzXmIVWyZnHNHinxM3iiAYrqxSi5LlQ5EhLdWEwN5AD9MRPEKEVdnpydoc0Ki+
	2IWAn288kliguDk5V/6Kmo2ugDIpQ6f+RXA3WDxGd1nFFMRQKyTpVSg=
X-Google-Smtp-Source: AGHT+IFKPuh8cOHYjBgEoM7t8cHgv4gW4YpL9WqheJYopfOZX5sbWBiog25DM4bQ+IO4xPTW/pcKfQ==
X-Received: by 2002:a05:6a00:14d1:b0:736:755b:8311 with SMTP id d2e1a72fcca58-736aaad1daamr15723454b3a.16.1741618374533;
        Mon, 10 Mar 2025 07:52:54 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736d11d4600sm2890275b3a.116.2025.03.10.07.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:52:54 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Mar 2025 07:52:31 -0700
Subject: [PATCH v11 09/27] riscv mmu: write protect and shadow stack
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-v5_user_cfi_series-v11-9-86b36cbfb910@rivosinc.com>
References: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
In-Reply-To: <20250310-v5_user_cfi_series-v11-0-86b36cbfb910@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0

`fork` implements copy on write (COW) by making pages readonly in child
and parent both.

ptep_set_wrprotect and pte_wrprotect clears _PAGE_WRITE in PTE.
Assumption is that page is readable and on fault copy on write happens.

To implement COW on shadow stack pages, clearing up W bit makes them XWR =
000. This will result in wrong PTE setting which says no perms but V=1 and
PFN field pointing to final page. Instead desired behavior is to turn it
into a readable page, take an access (load/store) fault on sspush/sspop
(shadow stack) and then perform COW on such pages. This way regular reads
would still be allowed and not lead to COW maintaining current behavior
of COW on non-shadow stack but writeable memory.

On the other hand it doesn't interfere with existing COW for read-write
memory. Assumption is always that _PAGE_READ must have been set and thus
setting _PAGE_READ is harmless.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index ccd2fa34afb8..54707686f042 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -411,7 +411,7 @@ static inline int pte_devmap(pte_t pte)
 
 static inline pte_t pte_wrprotect(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
+	return __pte((pte_val(pte) & ~(_PAGE_WRITE)) | (_PAGE_READ));
 }
 
 /* static inline pte_t pte_mkread(pte_t pte) */
@@ -612,7 +612,15 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 static inline void ptep_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pte_t *ptep)
 {
-	atomic_long_and(~(unsigned long)_PAGE_WRITE, (atomic_long_t *)ptep);
+	pte_t read_pte = READ_ONCE(*ptep);
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
2.34.1

