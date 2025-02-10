Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932BC26137B
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 20:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739219259; cv=none; b=lg2b3Vu2V/mSnfJb3YlKnUrBEiehf7Zh57038NJto4jcJTsq6F7tikGyAsmoNv4Vw5/3dk0siQQyZTg+92BhGZVN0gLkiMutYJygtMuGj2Ce4tT/DnzlbC2I4JRRwB+DClonr63cABSGoJOLtHq/5tg3xcZWPJgySbBinwbt5Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739219259; c=relaxed/simple;
	bh=zWvCMjEUr0fm2YGOtkO5JQMRJ3MfHFejTQpY2YYRpeI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uRX/4ltmcj+1G4orjawe0sc9k+4nK2T2fYPhp1w+JkHyIc/CcylIHrtgNfhK+bZyLOLlJORKMgEMIbkC8ZLXa6oLtdlQ7Q3kl5kwGoGQSqsKRetu+qpqjqKBMmleH4PNHCMy6JfUeHaLIYFL7JG+OyjUJavQRQn3DhbCIvZQ4dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=k0WpeWPa; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="k0WpeWPa"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21f7f03d7c0so39216645ad.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 12:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219257; x=1739824057; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=opxHamP1ejpgUrZttGLg4zwDHWHLF3xPs1/Qb/08WRM=;
        b=k0WpeWPaq8hgRQ9Ha2rVV/0mN9SFOGihKHVgQuw5DyqHjJ/dZ6ylpIjBcQLLONeKBJ
         yh9V0PiBX5YOLho1qfXolkqnX1SG/JZLulhHuU7UDizs/hd0kJ9L/pbfBcAYYo4ohVbx
         QCuE/yKnPqu5eUFUQXVajbu+zhfqDWMsQ2vsAv05p/BsnRuVwlWKN/SunCVcVRF5Zfbl
         X1oO2F24x0ZMOFnTgP5FbskCaTsBWWEYKZtQKFCu8cRmF15g02/9JWcdTEMj7pWjQM6p
         3FzhE6p/CwqAlGxvAySnQZX8EzycDtPfGIQhwEYrMdKLcvGN1tdAT3TE7hBTusK10Vdx
         +uZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219257; x=1739824057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=opxHamP1ejpgUrZttGLg4zwDHWHLF3xPs1/Qb/08WRM=;
        b=Gt5k4D+UM+fOFu+hzLGBxThETyuZx3t08m0e2PTNA6UT9KvfXSsAH9kahsBACNHPMP
         suMnBFJj4p5MWSnl/YrgI8exZhY/1aIxlqC2aKp4ucG6hNTfI7OaLSiBPgEIfJT0PgO3
         p1sPD76o5+5WCprUl6HWcWdzNB+ayGPDfXSFbz/V2kucUt+Fhfsi/qCwQbRs0NfpwvOU
         ljGxUrHgubJ7b7+s52dYiietn5AS+NzLpJD20YdIMEGU1sEgEy6AAiuAnSgUWM6JBnHs
         rID/Eg3LGRrdyL2zuqmtWZx1h9+oQwFWH2oq9DRyIFirW8su21kPLJ/tz2YP1R7duPXk
         Cy9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1ez5JIsnR6ikexTgdS1qaRMVP4Te9oFE3YVZCQN8Eo1EuvkcxHtVmpHkV7j54r8StFESO/MEie38=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVZ3HKgaDlvNZ08cwF21jILrn/geqoFzob2iIldKtLxvWZ49R8
	cGdCP/ZonqnYFP5lZTRuBckVOI8iLHhufapDC+VKO+MsdS3RfSM5le/q0x2z6aM=
X-Gm-Gg: ASbGncsyOcZKRy2zm+hNSXIeYTo+cGQIOmthq9TZbnVxwrevpiB5YymVqo/Vpf7A1wo
	g4UI5bDLUHHjzpHuvEHNeg/zUU7QmkKlOoP8p5DXScUIrrLfc4C0krV6dqBt4lmCSSvEnig2K1j
	PQ/2fOvgAvCN6n/+mmOHRu7mb55mLwv81LCwW2a7F25wWiEqajg0nMFwEWT+q4krW2opr+ot6iw
	4LZYuBC0lOWfXlEYX76oI1msnN4iHPqo9hIP2mxnrVLXzDcm32UXoQuEu2ldwlej/qsU+f9hCuo
	un2AuS7szWVPu0UCym1FPzoqzg==
X-Google-Smtp-Source: AGHT+IF/dAuKVSsF4xfi2H6sG4wlPlN+BXXOHG9nKEFkchqxVssSaBrEBlASEgV9299c+TKy14VoKQ==
X-Received: by 2002:a17:902:c94c:b0:216:1543:195e with SMTP id d9443c01a7336-21f4e1c8978mr260581855ad.5.1739219256955;
        Mon, 10 Feb 2025 12:27:36 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:27:36 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:55 -0800
Subject: [PATCH v10 22/27] riscv: kernel command line option to opt out of
 user cfi
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-v5_user_cfi_series-v10-22-163dcfa31c60@rivosinc.com>
References: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
In-Reply-To: <20250210-v5_user_cfi_series-v10-0-163dcfa31c60@rivosinc.com>
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

This commit adds a kernel command line option using which user cfi can be
disabled.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/usercfi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/kernel/usercfi.c b/arch/riscv/kernel/usercfi.c
index 6e561256bfaf..be08e5bb6e62 100644
--- a/arch/riscv/kernel/usercfi.c
+++ b/arch/riscv/kernel/usercfi.c
@@ -17,6 +17,8 @@
 #include <asm/csr.h>
 #include <asm/usercfi.h>
 
+bool disable_riscv_usercfi;
+
 #define SHSTK_ENTRY_SIZE sizeof(void *)
 
 bool is_shstk_enabled(struct task_struct *task)
@@ -390,6 +392,9 @@ int arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
 	unsigned long size = 0, addr = 0;
 	bool enable_shstk = false;
 
+	if (disable_riscv_usercfi)
+		return 0;
+
 	if (!cpu_supports_shadow_stack())
 		return -EINVAL;
 
@@ -469,6 +474,9 @@ int arch_set_indir_br_lp_status(struct task_struct *t, unsigned long status)
 {
 	bool enable_indir_lp = false;
 
+	if (disable_riscv_usercfi)
+		return 0;
+
 	if (!cpu_supports_indirect_br_lp_instr())
 		return -EINVAL;
 
@@ -501,3 +509,16 @@ int arch_lock_indir_br_lp_status(struct task_struct *task,
 
 	return 0;
 }
+
+static int __init setup_global_riscv_enable(char *str)
+{
+	if (strcmp(str, "true") == 0)
+		disable_riscv_usercfi = true;
+
+	pr_info("Setting riscv usercfi to be %s\n",
+		(disable_riscv_usercfi ? "disabled" : "enabled"));
+
+	return 1;
+}
+
+__setup("disable_riscv_usercfi=", setup_global_riscv_enable);

-- 
2.34.1

