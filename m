Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E9A348889
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 18:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764959836; cv=none; b=rfG9wdcasbgAG6ZuqG5h84ZqPUVrRAQmve9wlOyPb4otx7e5HrOUqZ0fBLx0/yYcaYhcGHhOXuGjim+XYN46pra8qniEU6Q3DneXmhykktplahjNYb7dQqZY4MT9cyrSlCz7i/t0OmNpGdCDFQL1l6WvS5MnQEBH0FnHXwJYHFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764959836; c=relaxed/simple;
	bh=RGAXmJC+2fh8R4zAuN/S3Zb/P8BdVNqgePwfv4Dyl+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G0zsB6adYTJ4Nqmb7rPlXLijMtbo8nfVTvMg1Aj/i5DBaX9eQnSIwiJ6V/hNIzbBXf45gQfPXujHIh6ZTSnTldX5eiWHV/iaIfjYobUtoxgTmpnyANfEk7W+Veknq6Mv0aWQnMG1tzpRM/EC24HF4JtlGbps5gH9zTcYEfIBPXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=T1yLTcmb; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="T1yLTcmb"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-bc1f6dfeb3dso1414778a12.1
        for <linux-doc@vger.kernel.org>; Fri, 05 Dec 2025 10:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764959830; x=1765564630; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6P3tr09CNDNlcbFQiO50QN3vMyxHMFQbRxl9JwF/4jk=;
        b=T1yLTcmbFsFQxOAmfcdeGUkWB9ETEXJ0g3djVN1rWT6eTSZCzzYbRT7d+0KbVLe1dE
         mwTiujHlwZfLwJPzdF+wEOh2ue8u97pbS2Q9Hm38I158I1oG3eUkCH1+B+7B5Kdea4fY
         ZAc8gu4BcDnj61we4tG1Hgoq8xEQI07YIc+lcINWsGgZShXtJOx/7Sv5zqdYxwv1GbL6
         QJ0cJ5avoqlzUt1yIQCXsedMWH6HIXGGLJIuFpKvpUiajG5Kn8jss2beJdZ3I/CWUFLM
         xRnJZ3WVRS490Rtdl6XrjDV//B0oArAYxLBsiXciSTeYPKG8nZiM+ITl9P9yI4Me5FfS
         qUyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764959830; x=1765564630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6P3tr09CNDNlcbFQiO50QN3vMyxHMFQbRxl9JwF/4jk=;
        b=ejgPnJ9sQHH1W2qXzzxhozpkHKIM7Cf9/o2LA/ts8iwdnX+P6EutGKOjaBZWDGo+ZJ
         PxY7nLJ8bg2tUwuaJdZRKRfP8lWp4Nb4T3qP3ujysw1cDFd45fGg7NBeZxhSDuUXDvgP
         VtQDNLrSVBdkSLrB9eXAXHb8WNSMu5tD3/UsLG6fj344iUNrfnkBkzkzkI7e6Xnnu/r2
         sXHd+QVkpM6GoTil2LsoZkBSDiwm2hQYmJjGWHzq7F5zNTPUqBRqmxtalHf1Bu3J7o7V
         uznvJB2o0bsoJ9l+JAVs1LRrZrt96j85bOt889rMJPqJnXfDSEdq4SehYMIzM2e3bCNF
         cq1g==
X-Forwarded-Encrypted: i=1; AJvYcCVhOPJn3E50bP+f9XOHPZ49hWya7F2eF+ZGVgVCJ8oU3fG1ypbnu2kBj43wGmPQknT+d7FpbFvCL88=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJaHhEb9liB5aN+wxP17uJQCqWY4iGOVzd7j5l0efyBJleCMC7
	mjK1mADYnOEukSy3nPkpl9OpXJBq2IFEHZal+6kUf6kPg4z82yENMkISUr/hbwTEmGM=
X-Gm-Gg: ASbGncu92s2ij/NWRXskqoN7JAlkdLd2k/wBsyZVgDdICZLHtNwkK1IurpEs42SrCrJ
	/RZUA0m/5dJGbQmaITD30ohBXBlCshp9d0qfO4RdwvL/JvopfraxrKHCIBxl3oIC6sQD1t1ugAI
	upRRqQzZAt/bmXlMnJ5z6vJrlFpFvTp5ljPWrMjcZlNehWCc6PqOoZJ81PnpoJ6j3B9UqTJitx1
	6Q3iZrx4wg4KvB7M7px5u0xJchapFqyn2Rhl4EOK89jGZWf0tyxJsMOLVEmW4O0YF6FREKMFFDJ
	FJgzd/BRvKWjDGjIF5EV3cx7EBGyrwqved2xXHtMGOFZJ4qQi+gITjA3fu8jjspvpB/BiNE8wxk
	ockyDZ2dEBV6f31d3korNsIh5K6LBZ0fmQCzKOBVVo84TjRoks6Cu9EcIKbBdNXhBR6cupm7pNk
	RkZLe6jVJo/EPdikDVuiuL
X-Google-Smtp-Source: AGHT+IGDq7mddOOrT5fT0Dw4BzEYkKvr1uNa0kRbW9ertdtHHkwnSfKDy52Tr0rg2A05y/e3YvLdfg==
X-Received: by 2002:a05:7301:1c0b:b0:2ab:c284:4ae with SMTP id 5a478bee46e88-2abc720156emr81281eec.18.1764959830279;
        Fri, 05 Dec 2025 10:37:10 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba8395d99sm23933342eec.1.2025.12.05.10.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:37:09 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 05 Dec 2025 10:36:56 -0800
Subject: [PATCH v25 10/28] riscv/mm: Implement map_shadow_stack() syscall
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-v5_user_cfi_series-v25-10-8a3570c3e145@rivosinc.com>
References: <20251205-v5_user_cfi_series-v25-0-8a3570c3e145@rivosinc.com>
In-Reply-To: <20251205-v5_user_cfi_series-v25-0-8a3570c3e145@rivosinc.com>
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
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, 
 Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764959808; l=5985;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=RGAXmJC+2fh8R4zAuN/S3Zb/P8BdVNqgePwfv4Dyl+U=;
 b=wzOeyy9ub7akChDr247/bvDfsiJXNhWs7TK8AtgdVcYtCGYg512MiwqxGKRQa5o9K56e3HUaH
 GXiFbxYAwoDD7LsNoCi5swhK9l/rWl+vo6bRTfrxuC/n0A07XZVyOHg
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=

As discussed extensively in the changelog for the addition of this
syscall on x86 ("x86/shstk: Introduce map_shadow_stack syscall") the
existing mmap() and madvise() syscalls do not map entirely well onto the
security requirements for shadow stack memory since they lead to windows
where memory is allocated but not yet protected or stacks which are not
properly and safely initialised. Instead a new syscall map_shadow_stack()
has been defined which allocates and initialises a shadow stack page.

This patch implements this syscall for riscv. riscv doesn't require token
to be setup by kernel because user mode can do that by itself. However to
provide compatibility and portability with other architectues, user mode
can specify token set flag.

Reviewed-by: Zong Li <zong.li@sifive.com>
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/Makefile  |   1 +
 arch/riscv/kernel/usercfi.c | 142 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 143 insertions(+)

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index f60fce69b725..2d0e0dcedbd3 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -125,3 +125,4 @@ obj-$(CONFIG_ACPI)		+= acpi.o
 obj-$(CONFIG_ACPI_NUMA)	+= acpi_numa.o
 
 obj-$(CONFIG_GENERIC_CPU_VULNERABILITIES) += bugs.o
+obj-$(CONFIG_RISCV_USER_CFI) += usercfi.o
diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
new file mode 100644
index 000000000000..251c3faccbf8
--- /dev/null
+++ b/arch/riscv/kernel/usercfi.c
@@ -0,0 +1,142 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2024 Rivos, Inc.
+ * Deepak Gupta <debug@rivosinc.com>
+ */
+
+#include <linux/sched.h>
+#include <linux/bitops.h>
+#include <linux/types.h>
+#include <linux/mm.h>
+#include <linux/mman.h>
+#include <linux/uaccess.h>
+#include <linux/sizes.h>
+#include <linux/user.h>
+#include <linux/syscalls.h>
+#include <linux/prctl.h>
+#include <asm/csr.h>
+#include <asm/usercfi.h>
+
+#define SHSTK_ENTRY_SIZE sizeof(void *)
+
+/*
+ * Writes on shadow stack can either be `sspush` or `ssamoswap`. `sspush` can happen
+ * implicitly on current shadow stack pointed to by CSR_SSP. `ssamoswap` takes pointer to
+ * shadow stack. To keep it simple, we plan to use `ssamoswap` to perform writes on shadow
+ * stack.
+ */
+static noinline unsigned long amo_user_shstk(unsigned long *addr, unsigned long val)
+{
+	/*
+	 * Never expect -1 on shadow stack. Expect return addresses and zero
+	 */
+	unsigned long swap = -1;
+
+	__enable_user_access();
+	asm goto(".option push\n"
+		".option arch, +zicfiss\n"
+		"1: ssamoswap.d %[swap], %[val], %[addr]\n"
+		_ASM_EXTABLE(1b, %l[fault])
+		".option pop\n"
+		: [swap] "=r" (swap), [addr] "+A" (*addr)
+		: [val] "r" (val)
+		: "memory"
+		: fault
+		);
+	__disable_user_access();
+	return swap;
+fault:
+	__disable_user_access();
+	return -1;
+}
+
+/*
+ * Create a restore token on the shadow stack.  A token is always XLEN wide
+ * and aligned to XLEN.
+ */
+static int create_rstor_token(unsigned long ssp, unsigned long *token_addr)
+{
+	unsigned long addr;
+
+	/* Token must be aligned */
+	if (!IS_ALIGNED(ssp, SHSTK_ENTRY_SIZE))
+		return -EINVAL;
+
+	/* On RISC-V we're constructing token to be function of address itself */
+	addr = ssp - SHSTK_ENTRY_SIZE;
+
+	if (amo_user_shstk((unsigned long __user *)addr, (unsigned long)ssp) == -1)
+		return -EFAULT;
+
+	if (token_addr)
+		*token_addr = addr;
+
+	return 0;
+}
+
+static unsigned long allocate_shadow_stack(unsigned long addr, unsigned long size,
+					   unsigned long token_offset, bool set_tok)
+{
+	int flags = MAP_ANONYMOUS | MAP_PRIVATE;
+	struct mm_struct *mm = current->mm;
+	unsigned long populate, tok_loc = 0;
+
+	if (addr)
+		flags |= MAP_FIXED_NOREPLACE;
+
+	mmap_write_lock(mm);
+	addr = do_mmap(NULL, addr, size, PROT_READ, flags,
+		       VM_SHADOW_STACK | VM_WRITE, 0, &populate, NULL);
+	mmap_write_unlock(mm);
+
+	if (!set_tok || IS_ERR_VALUE(addr))
+		goto out;
+
+	if (create_rstor_token(addr + token_offset, &tok_loc)) {
+		vm_munmap(addr, size);
+		return -EINVAL;
+	}
+
+	addr = tok_loc;
+
+out:
+	return addr;
+}
+
+SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, size, unsigned int, flags)
+{
+	bool set_tok = flags & SHADOW_STACK_SET_TOKEN;
+	unsigned long aligned_size = 0;
+
+	if (!cpu_supports_shadow_stack())
+		return -EOPNOTSUPP;
+
+	/* Anything other than set token should result in invalid param */
+	if (flags & ~SHADOW_STACK_SET_TOKEN)
+		return -EINVAL;
+
+	/*
+	 * Unlike other architectures, on RISC-V, SSP pointer is held in CSR_SSP and is available
+	 * CSR in all modes. CSR accesses are performed using 12bit index programmed in instruction
+	 * itself. This provides static property on register programming and writes to CSR can't
+	 * be unintentional from programmer's perspective. As long as programmer has guarded areas
+	 * which perform writes to CSR_SSP properly, shadow stack pivoting is not possible. Since
+	 * CSR_SSP is writeable by user mode, it itself can setup a shadow stack token subsequent
+	 * to allocation. Although in order to provide portablity with other architecture (because
+	 * `map_shadow_stack` is arch agnostic syscall), RISC-V will follow expectation of a token
+	 * flag in flags and if provided in flags, setup a token at the base.
+	 */
+
+	/* If there isn't space for a token */
+	if (set_tok && size < SHSTK_ENTRY_SIZE)
+		return -ENOSPC;
+
+	if (addr && (addr & (PAGE_SIZE - 1)))
+		return -EINVAL;
+
+	aligned_size = PAGE_ALIGN(size);
+	if (aligned_size < size)
+		return -EOVERFLOW;
+
+	return allocate_shadow_stack(addr, aligned_size, size, set_tok);
+}

-- 
2.45.0

