Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CBE34F476
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 18:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764959854; cv=none; b=QklGisClkQ0wTpokz7LriCli8Xsn9+0FhbEV0+O5+LFDCaBBwITde9Ebhay5dpu82nY6KZgWrJIVGFcFHXDzirKtV/6fI57MDt6kWA0R9TzasqXLO1p/0/3Gh6DywINXiUWUU1zDIbmhx7xqBd8McOwIq5qEntSIaiGhL7XN6ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764959854; c=relaxed/simple;
	bh=5pCsCIMJf4iBOvf300q6+KPihTaIQ8ZBfY4WmoGUnLE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G7nS+rUpV64SJx48YrUtuBQcLodQyIq0ImjqXyEec8jHjWTBMOgllNCOHa2X2JFqgYA3v2OUdVDza7Xri2PisSnBy0T1qAFDhyh0fGHDINTPRhsFtImRK2KhDwAhB5/kqwPfEmiCOZD+6qQ+85NBgFvFQjRpzjIFy0DNhNRi1wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=Hg1w6IbF; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="Hg1w6IbF"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2a484a0b7cfso4133975eec.1
        for <linux-doc@vger.kernel.org>; Fri, 05 Dec 2025 10:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764959845; x=1765564645; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7cVA4V+tsTGYh8faQvOG85ZxC8pPRVoW62aZwUk0L0=;
        b=Hg1w6IbFq7J3oJTjZQMV2a3n1TVZ5ezwfniSFN8ubnhi6A7ZVt/IB0dnZcHekEqntY
         CcmCDuWuAwUOM/ehPvqvfAEqGj/UXsNDLwj7evTRL/v0vVaTe4l7QbdCs7By2HIGRj/e
         XAd6H8dbPS89TkTUPh9QZuSf7dvtBjFvpQ5XTzCIulapezJ/aDEcbA+UAzomUslmcQbx
         CTNE2PYDuGBDc+AFVZUoxNvB5/5GPwhNsvrbZDRqvPG5ESUpKU2LZCAe+FnCvptMQUjx
         4hNe5rhc1lK5JNyO4OcO7qEIv46GF/6UhIFSw2lj1Enhdc/WOtwJ5GVs0HtNm5EjQYmg
         C1Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764959845; x=1765564645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y7cVA4V+tsTGYh8faQvOG85ZxC8pPRVoW62aZwUk0L0=;
        b=XNZ8IttPvGzNAmPFKzp3ozEkB+l1DUnvJ14ofJLUPsC5Fry43hJCTvoFeEKCAa23VL
         8p9QIZgpd2MJZG9lJ6pcoSZ1c6sVB6sI79RHqjJ6I6qYHzmD4HhMJi6005fvZpeWY9Wz
         bJ+OL65MRrM0q7Ma7gn5ihsj7YihMI+e/PxcnAHz0gpoqDyx9j439yN3IN0BMdm2HtM8
         8k60k39vSQPJoLlc2tslGD6Y7KzuYRNvMqFEg4qRKowLbpANvTzfPxEwJqy5AtqBF49R
         uuZ5fb382Z1paoPiA52C7jGlREDkdbOuOYAjJf48QmJ+zAEsZbtylbie6pN0sZh2Kehd
         AcFg==
X-Forwarded-Encrypted: i=1; AJvYcCUYFkas1zJjL1JzjzRPAsPdhe/BRsXofEcwHwCjDSh2orD6rkgc+RK5d8dS07EbxCgWkZ/x68YSa1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuidZv1p+gZauEJBCQdJ6Fa01GYU1SAMtG+LVKO5S3LQiuDfYG
	3voeQkAM/3SO9feJoSmlWoru0tr7XnspAk2PGH7WEBzYVSEzW4w3/gS9Gk6ovQKC9og=
X-Gm-Gg: ASbGncsVXbDcAzko2olxqNn4lF9NRygI8wiHhOFAJXsdl/TLCdFFHe7l8YuzNA5n/yP
	iNnSoniy1fcPsqZqlgHr6+f/V1H40hr/Kl8QkFz7Vo2XOBN1I5O9s0qOmCsOZMPuTpuBX3qswxx
	rph1UfqmYTS6DRL87LApn4MDtOtOWKzn8ou0LVFmQARORdXe4WXAIB0EBXXbX/0hxQI1ozqgTef
	ku+qMIiPaKnYibkHmkthHPsnOmQg7dsaMv7itUo7BEV/yjxZPwIe1VNMvi7PAFFB1UrerzT8GRC
	Bc2ZWSpddIDSAJihr/UR70drbFnIrp42pndmu8YzU8tbk6IismxisQzyeTS57LLAJFv846igxtC
	I6CwnefRCnc0U/TnLgWf/DKmIy3KadzzUOoJz4SrshOXV3BkxAcJKEnOv/ECS4O+jfwcQlBQHwa
	cRIftd4NCSmg5NlVCoihHm
X-Google-Smtp-Source: AGHT+IHpgKa7H8AahzL7MXJDXATVAt8op9HJLZz6q1O1yZv7iAcmKoVC4X9a7AcjVimql64o0x0uoQ==
X-Received: by 2002:a05:7301:1e82:b0:2a4:5c33:ff7e with SMTP id 5a478bee46e88-2aba34e598cmr5659789eec.19.1764959844877;
        Fri, 05 Dec 2025 10:37:24 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba8395d99sm23933342eec.1.2025.12.05.10.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 10:37:24 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Fri, 05 Dec 2025 10:37:04 -0800
Subject: [PATCH v25 18/28] riscv/kernel: update __show_regs to print shadow
 stack register
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-v5_user_cfi_series-v25-18-8a3570c3e145@rivosinc.com>
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
 Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764959808; l=1182;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=5pCsCIMJf4iBOvf300q6+KPihTaIQ8ZBfY4WmoGUnLE=;
 b=YUOAVPCuxUM5Gbaa6opv1masEPHIuQa83DUGc+CGXyeJ5A4kfQSjMwPJRS+2ZDYG/CTYlt+hh
 XoV55OqqjBBArKRtE/ICcgJfxzIDFQra1KnJGP2v9aOA7JvRD/LcfRN
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=

Updating __show_regs to print captured shadow stack pointer as well.
On tasks where shadow stack is disabled, it'll simply print 0.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 49f527e3acfd..aacb23978f93 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -93,8 +93,8 @@ void __show_regs(struct pt_regs *regs)
 		regs->s8, regs->s9, regs->s10);
 	pr_cont(" s11: " REG_FMT " t3 : " REG_FMT " t4 : " REG_FMT "\n",
 		regs->s11, regs->t3, regs->t4);
-	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT "\n",
-		regs->t5, regs->t6);
+	pr_cont(" t5 : " REG_FMT " t6 : " REG_FMT " ssp : " REG_FMT "\n",
+		regs->t5, regs->t6, get_active_shstk(current));
 
 	pr_cont("status: " REG_FMT " badaddr: " REG_FMT " cause: " REG_FMT "\n",
 		regs->status, regs->badaddr, regs->cause);

-- 
2.45.0

