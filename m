Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032A520CCC3
	for <linux-doc@vger.kernel.org>; Wed,  5 Feb 2025 01:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738718519; cv=none; b=VXdpWpzQzBThwxFnXyAJ0qO7istRAbtxETFHODZ87ntve9Zvc5TNVZgNeMSc3Q5IZ0q5qG5x29i1upYHK1E3PIv0+7himxElF3N2Mwt9P7J+/mIa1wMrU08C/LRmpSfSwYhA1W3XvlFpjhN57uThjIX/NLM/QJb6UFOMUlo5fQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738718519; c=relaxed/simple;
	bh=4+rkxFDMRzeCaj67Ory62bJbPr1iEDQyQ7MtltlWZ10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ge0vZACf8NUeDRC1BX18clXd0d7KcoJsWSS+E2zyUlqFuuiL3dRwLyngl37980q7KYPIPMoyA7OuRnQm6SlSJXOHqljVvROCAOqvFOSnwRWZEuKq4M4OM+VRV5ZA27ERQUFjnJI0Si+B1HYP8HbWiDEeka8NMYhEBVbeiuIHWwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=obkXaXrL; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="obkXaXrL"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2166651f752so26833945ad.3
        for <linux-doc@vger.kernel.org>; Tue, 04 Feb 2025 17:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718515; x=1739323315; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PZsmyzkl0ZY8OELLzFzrWZpLBbmgmsnkcCCgL90vWsc=;
        b=obkXaXrL++C5CRCVKFH/z+QEE5m/c6elu2AJLYkjfyG31ufuk/40pv+W2Bpiu/IIqD
         x72oKtFNRt35wxLpU9gX2xOaBbvu4yVJBpGdDczYHXhLs8/AF7rHexxMX6mRsaXKepu/
         TpHdrL+ZxRdU8rveoaAaByFGf3t9LXS6d2U7i2XTNXJTD5sqC7QU4ocQ3uxaUYBdZ+7u
         Gd43OK0kh+1C/fBW1Ud/DrOafyYnwB3KvNQ22qNztlBF3YcVtFmjPkfzDZU3POvHtDMA
         b/iDjMGQL96sG+9ROf/N2Ax05qJLGH+ob1oDB69KrMajECf+ktZpgWeHbeUYcPTq7S72
         AzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718515; x=1739323315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PZsmyzkl0ZY8OELLzFzrWZpLBbmgmsnkcCCgL90vWsc=;
        b=TBf+idA1hm4f0MTkTgiipr/FXF2BzZciZZtJAkhdTRwupAzRiTTSkoPl6OOsKDFxYd
         4XKrn+2ZpfcK+xHbACG46Pp4F/NXpnlGpDmITSNIxEtm1oV4JZp2yj20hs20KYENWtcH
         UZOTKYhmrzqk0McXcjoKpJUt6APIdGO0Mc7wBqVA1jOhhnYVvPUWDMhwfYY2J6E+lUi3
         I0yIcmgep7EjJjPUgTsZlxUDT9lzjRkyVO8ezZGeFPjFC8u1X71v10M6c2tj2adGbuFm
         4kyaaXCMRle/ykw9ztbRUAq5fe7HlHZjy/kCtuqc7Xl3GxW6lrCpQdHxBmmtm1INBklj
         9Hgw==
X-Forwarded-Encrypted: i=1; AJvYcCVW9iyyngn9MwEodOpj493zTqN/78m99nWvYN2tnOQ0jSfmZx1d343gQDoR07oCHoJMTGmr1i+GXIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTagNnFEHedAACiEkPh6BkgUd+6xZcANXyikask/CplfUGL3k4
	mQr05RiAGgPNZaOg8+Pwsf2EfeP5iBSSRMjeAuPsiKaHVoCcPYj8ogZ0hJ0bWbc=
X-Gm-Gg: ASbGncuTzaoiCG9eoo7Hv6hXwXV5Sow0VTjwXCderunTT3gxN8JDXKsFaYoP9nxz6ey
	N9MoM2QGentJr2+X9w1tOM4qsWsiNZrrdVQIA8YJCMWqb9FMQnQxxt0rlV6Oj5/Y9tkeUy/HVX/
	cGbg/Km/O72sGuuB6RNZdOGy17pgfGDGIoehapKRASEF3k29/rvXPXd1qguS7/pvkgOcnPbFt/G
	/5ibplD38C9wK/k4eHOIDFh+1xlujrLAgHzqs0bPBxsH6MB6RTmANN6ve/23ku/in+WVN9ageas
	WZ7O2hSkjTR1Iwz0lAXzXnf7qw==
X-Google-Smtp-Source: AGHT+IEGfToRmeKwtJLwJvQfR9G8FomtSd4VlGvn3V3djANNYRSyP8PCgL91KTN4ECR+cbbbSTicog==
X-Received: by 2002:a05:6a21:9007:b0:1ed:9e58:5195 with SMTP id adf61e73a8af0-1ede8834f7cmr1948485637.13.1738718515327;
        Tue, 04 Feb 2025 17:21:55 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:21:55 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:21:48 -0800
Subject: [PATCH v9 01/26] mm: helper `is_shadow_stack_vma` to check shadow
 stack vma
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-v5_user_cfi_series-v9-1-b37a49c5205c@rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
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

VM_SHADOW_STACK (alias to VM_HIGH_ARCH_5) is used to encode shadow stack
VMA on three architectures (x86 shadow stack, arm GCS and RISC-V shadow
stack). In case architecture doesn't implement shadow stack, it's VM_NONE
Introducing a helper `is_shadow_stack_vma` to determine shadow stack vma
or not.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
---
 mm/gup.c  |  2 +-
 mm/mmap.c |  2 +-
 mm/vma.h  | 10 +++++++---
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index 3883b307780e..8c64f3ff34ab 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1291,7 +1291,7 @@ static int check_vma_flags(struct vm_area_struct *vma, unsigned long gup_flags)
 		    !writable_file_mapping_allowed(vma, gup_flags))
 			return -EFAULT;
 
-		if (!(vm_flags & VM_WRITE) || (vm_flags & VM_SHADOW_STACK)) {
+		if (!(vm_flags & VM_WRITE) || is_shadow_stack_vma(vm_flags)) {
 			if (!(gup_flags & FOLL_FORCE))
 				return -EFAULT;
 			/*
diff --git a/mm/mmap.c b/mm/mmap.c
index cda01071c7b1..7b6be4eec35d 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -648,7 +648,7 @@ SYSCALL_DEFINE1(old_mmap, struct mmap_arg_struct __user *, arg)
  */
 static inline unsigned long stack_guard_placement(vm_flags_t vm_flags)
 {
-	if (vm_flags & VM_SHADOW_STACK)
+	if (is_shadow_stack_vma(vm_flags))
 		return PAGE_SIZE;
 
 	return 0;
diff --git a/mm/vma.h b/mm/vma.h
index a2e8710b8c47..47482a25f5c3 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -278,7 +278,7 @@ static inline struct vm_area_struct *vma_prev_limit(struct vma_iterator *vmi,
 }
 
 /*
- * These three helpers classifies VMAs for virtual memory accounting.
+ * These four helpers classifies VMAs for virtual memory accounting.
  */
 
 /*
@@ -289,6 +289,11 @@ static inline bool is_exec_mapping(vm_flags_t flags)
 	return (flags & (VM_EXEC | VM_WRITE | VM_STACK)) == VM_EXEC;
 }
 
+static inline bool is_shadow_stack_vma(vm_flags_t vm_flags)
+{
+	return !!(vm_flags & VM_SHADOW_STACK);
+}
+
 /*
  * Stack area (including shadow stacks)
  *
@@ -297,7 +302,7 @@ static inline bool is_exec_mapping(vm_flags_t flags)
  */
 static inline bool is_stack_mapping(vm_flags_t flags)
 {
-	return ((flags & VM_STACK) == VM_STACK) || (flags & VM_SHADOW_STACK);
+	return ((flags & VM_STACK) == VM_STACK) || is_shadow_stack_vma(flags);
 }
 
 /*
@@ -308,7 +313,6 @@ static inline bool is_data_mapping(vm_flags_t flags)
 	return (flags & (VM_WRITE | VM_SHARED | VM_STACK)) == VM_WRITE;
 }
 
-
 static inline void vma_iter_config(struct vma_iterator *vmi,
 		unsigned long index, unsigned long last)
 {

-- 
2.34.1

