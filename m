Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901EC22A7E5
	for <linux-doc@vger.kernel.org>; Fri,  2 May 2025 23:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746228667; cv=none; b=mI+xAEXMFdyBFEdPJcsFJmuEB1ZoW4B6xD9Uk5NTpUbd0WAuA336k9j1g5riG3OqaLXaRIpN/RW3RctzNn7a8TjTUAMCQ5YSuvBdWNYn1Ggqmq1wuIRaoCiE/jcHAsD9ax8Kvhk+wXHnaVvSpTnafR6OctmqiwVLpRslCUp+LgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746228667; c=relaxed/simple;
	bh=botWNQij/L5jZa9ComPdhZ+E/aGmcXy6ciNlZPypsCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K6Fw4b+n0PeDw3Dv8OZZ20UiyVj+9EaDqfjsHiMWdZ8HqoXBiwbv/4z9OF93FPdCPAQtLIyHPE/khYPC4oZBjYh0SXK7VXvwuosXi+TEhJ5kyZP8ccOnTbKLFbdngo5hnJOsojMvTIhPjp/x33jFOQlXyiE/dT+AFlDib0ibG2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=pMP6Az6/; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="pMP6Az6/"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227a8cdd241so33324645ad.3
        for <linux-doc@vger.kernel.org>; Fri, 02 May 2025 16:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746228665; x=1746833465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RIAdpVF04Dq2IgOKnxPyubvKXBbe4mWx866NZtbwafw=;
        b=pMP6Az6/4MFf2cA8Qax5dsyOf9D6zgYcZfvlzqOIv9ZCpURCDcNqssAL2SqF5eM0EE
         bZVosLpYogX1+8LqefpRbWUEbrq43FvcrT9zAkW009SXDVBbczYKTgtJJjbuCBaFVKqM
         EED2VxkCwCznJOIzKj3zfovy3n/+CF2k5GSJ7Zl/DRkqo8y7FIM4+cLVfjzven8LmivI
         Ymh+CMZAw8YYR3BAB+pqTeWQ/F/rIQ6/E0Vm9fjgMSohMWL27S4SE7BGlXTHzSOLfJQm
         RrBC3QC9Moc7mZZ+bWjOXwLz5r1zeYeL6JOsG0tBjFgtyNC0qnVsR5LyH3jSgBXqdLjU
         3bhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746228665; x=1746833465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIAdpVF04Dq2IgOKnxPyubvKXBbe4mWx866NZtbwafw=;
        b=m8Neg8cWtj/Q+V90Ud2szKaqDk7qrEoSPbS/cbFL8hNxzlhW9Py1DrSIGxswteOJ4r
         1ytxqGorMB2IUkithC+N/TLJ9wtKt6GpPZsomjKBdizAdv6mvUyK1sWBva3sGX/dRHdQ
         s+QGxerNIOTaoEu7LKv5nWLaTD7G/xpZMAJ4JC30eSh1mYmCzjH5IOMwqYyBQJ4oSnzV
         GaPNmVSuv4yJn1VtiJtRPsfbJBd3UINAy143n6nVnv10IVH2H3D8RsNWKnpHNQ4pfadS
         5PtpiznNEgp6PXuAOCeNNttlhs/scTcr61+f1lZnNVwvtjU8HprzzXv3EQ3PLq0PQtaJ
         P91w==
X-Forwarded-Encrypted: i=1; AJvYcCVqRs1VDbKPGz3JuReeAKpOH7afboj9enWH49IjYnwd79XxgmKqPF53JeyOKwl3YhEmbHFDCsmArPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhxdopDGHptKwhObHpmhfwPn36Wxa51QkKOtT31Sx0ie89Z0S5
	vZK+PWebwhuHa40IPUqksgSnQXpxuz5BJfymsn6cOS0CB+wtR40SKAMshiUhrEE=
X-Gm-Gg: ASbGncu8TWP3M3XavQhO3db6tHgmMzJzaYsN4K5jPpP0zjyKYu0Q2QWhooewzxKsqa0
	SEcc6e+uXUFJn4ADg1Q2jX/d0FMmoZ6RXQnmNslfS5JOx+5AySnGYhhPhdci7Xnsn3+XzQ/kB0k
	lzOyPLu6i0d74tUqrjs706M0/kx99iU9IUo/3Jpk1JOaGnFrVGbINuBMbM3w0lMUCF68LS5OLsY
	SUpsmqQX3KWZp75JKXZQGp5a/kT39BGp1vyO72wxNIG4rPyf9eHnFwMJdD3k3IiKtOPswn8XPGH
	BbcXpyTpKg9hXKC0JYrJ1YjliL/47FgqvU+UfIUtWBGUEq++urU=
X-Google-Smtp-Source: AGHT+IGp2tIgqPIeVL1fUnVRzrlkiAjbLccoy07WU8cAzc9KMNqyou0HJrBg+LEQJwmT2E1+TS4a5w==
X-Received: by 2002:a17:903:41cf:b0:223:501c:7581 with SMTP id d9443c01a7336-22e18b99d5fmr14703165ad.16.1746228664986;
        Fri, 02 May 2025 16:31:04 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228ff2sm13367055ad.180.2025.05.02.16.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 16:31:04 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 02 May 2025 16:30:39 -0700
Subject: [PATCH v15 08/27] riscv mmu: teach pte_mkwrite to manufacture
 shadow stack PTEs
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-v5_user_cfi_series-v15-8-914966471885@rivosinc.com>
References: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
In-Reply-To: <20250502-v5_user_cfi_series-v15-0-914966471885@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

pte_mkwrite creates PTEs with WRITE encodings for underlying arch.
Underlying arch can have two types of writeable mappings. One that can be
written using regular store instructions. Another one that can only be
written using specialized store instructions (like shadow stack stores).
pte_mkwrite can select write PTE encoding based on VMA range (i.e.
VM_SHADOW_STACK)

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h |  7 +++++++
 arch/riscv/mm/pgtable.c          | 17 +++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index f21c888f59eb..60d4821627d2 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -428,6 +428,10 @@ static inline pte_t pte_wrprotect(pte_t pte)
 
 /* static inline pte_t pte_mkread(pte_t pte) */
 
+struct vm_area_struct;
+pte_t pte_mkwrite(pte_t pte, struct vm_area_struct *vma);
+#define pte_mkwrite pte_mkwrite
+
 static inline pte_t pte_mkwrite_novma(pte_t pte)
 {
 	return __pte(pte_val(pte) | _PAGE_WRITE);
@@ -778,6 +782,9 @@ static inline pmd_t pmd_mkyoung(pmd_t pmd)
 	return pte_pmd(pte_mkyoung(pmd_pte(pmd)));
 }
 
+pmd_t pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma);
+#define pmd_mkwrite pmd_mkwrite
+
 static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 {
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 4ae67324f992..be5d38546bb3 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -155,3 +155,20 @@ pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
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
2.43.0

