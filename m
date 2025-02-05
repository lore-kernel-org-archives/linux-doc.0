Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1761522A4E5
	for <linux-doc@vger.kernel.org>; Wed,  5 Feb 2025 01:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738718529; cv=none; b=CMM1c+sVUuOqmotfoEVN52IREJqVMr/MnxpE+t6KEqixkjTRom/90+0LASanXJWxbljZFKo3J1c4iY6PUrabeLu8Vrx/TJb2zd6XOnn2xnUIkjGA2EZKh0NlNLRojxlJ+SGIQROnKATda4UgXyO7Zf6v/PbDEfsy1JI1kXgypPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738718529; c=relaxed/simple;
	bh=VGYxjWQw4QYGSfT3AnAkedt5HRuw2tlx5dJCnKUawWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jU18CKZod/jQUMOzoLxC3ML+WoG9Q5PrACpCkbzqlsI5JZK4Ga8gCRdtZCEKLSAd6tlncUfvtlsszuYHa38aqsAqXZY0sW4PN8wqDyAv6D0RHkCSwlZamEZMiIl4TWvGwBlsFXJJNzJu/zIv3ihSGytqGLwJPzG3rJDNJoQHEr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=j1rs/SHg; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="j1rs/SHg"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f9bac7699aso2312288a91.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Feb 2025 17:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718527; x=1739323327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bi056oDr44X6mEA5ptOBWamFE29btTVHHp5F60vYQ4s=;
        b=j1rs/SHg28XiLfRMfuRru09SdeL6lTzWOIGLPwJy4RmpTQ8id/T0uwXZlfEAJXZlC5
         RTFQf7ZqPPq8QDR00+rjd6Tk6IgLg3sEmV9xjbVdjH6jzbyPDMdvSqfOkDF+M36egZxm
         wh8xp+h2TwRM8zV8UN4yMU/iD8QqJPMcj67+YQvHQUh7I1b3BUHZv1H3buBnU3sm5CUy
         8Xh+aX3bSolOQNuCWenMsCqMdGjwf5MYf9zhnnN1N/ZfKDSZ0TZPSU0VVOrEQVh9udRi
         YWT/X12LwaNNmU4/RMxCmelO9keEqqvMbsKI+AxFx5ilEiq2s+ODoCcjojxXZqIUi+LZ
         /scw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718527; x=1739323327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bi056oDr44X6mEA5ptOBWamFE29btTVHHp5F60vYQ4s=;
        b=c9oh0uQXDbA+5VSynlTsbxh22rtwjnQFi2Xcg4XL5Ik7PXtb44zyoQE538pzEF2YNE
         QE2EWRYxECscyiA7dnt+SMYyffrq9TzjgVieCC6wG3DWZD7ECYG+woyG/ZE8q5yx/qXm
         Izz97125ZV3DSMrfggr8NFjRb3XeivGryp3pcdl5hWwrbcZhfgkP8wUYeSjCCPFcegIE
         9p2/fI2/LeQB6XNSSI9veFNlI/3sdVWJcbZK14W1p77+Px2rwzalCJu8EmsqEK8BFtZY
         4bi6AvBRGk28kcSwUxnSJ+pdCSBTtgVBqHuxCzRUaZ01xJP8ahTEttOkRhqEMwup6S6M
         l8JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNEkhXCoUisux3aGleuaLk1z5ZJtaVsPg921msj+kOalvQqxdcd4pnPgXwUMZuxlneOwEeR4AWk1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBn6Qc8l3LG61l7o7JlQ4PYAQRlH+QbM0mEc7EnBvFgswcJYrh
	FJg1DVchVrYM8eKiR2xmFeD2MSbEgtaJFPpN2XyPPF2q1WzQg37XOpxqUabReOs=
X-Gm-Gg: ASbGncuztWQSR6cO8lb4S1I7ItYBBxeQj31Tl2opKM4R6C7tUiu6ME4b3dpOylJk8nu
	JRvGaCobL9/pxrU2gNx04/7ciaQMXR305sfMOjFpO+GHJMxQorHyl8kkzJs8oWJqyRksw+sVNBv
	ANRy2NBZ7N2nOEFGHiM1cu703C5kENpcy80WPohrObItszbuDgJE76PhXY74a0MZSLoLmFTeKMI
	prhyoAzz4lLEfB4R0NMsJhoU64qCJIRd4WvJoxGIBnY+UlE2Wg+Sop36FyMAnHCWpmwFfQ6v004
	hAroTfPZjgfF0H9lih3MpCQaHA==
X-Google-Smtp-Source: AGHT+IGqNdkqdj5d5A5aA6gKpwq89EtcxR1nZ3Ul1+SB6k4syDnXtWKiLDwMtPZuQ0/gHb49XAPbWg==
X-Received: by 2002:a05:6a00:1d88:b0:72f:d7ce:4ff8 with SMTP id d2e1a72fcca58-7303520d315mr1572110b3a.22.1738718527421;
        Tue, 04 Feb 2025 17:22:07 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:22:07 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:21:54 -0800
Subject: [PATCH v9 07/26] riscv mm: manufacture shadow stack pte
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-v5_user_cfi_series-v9-7-b37a49c5205c@rivosinc.com>
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

This patch implements creating shadow stack pte (on riscv). Creating
shadow stack PTE on riscv means that clearing RWX and then setting W=1.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 8c528cd7347a..ede43185ffdf 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -421,6 +421,11 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -749,6 +754,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
 }
 
+static inline pmd_t pmd_mkwrite_shstk(pmd_t pte)
+{
+	return __pmd((pmd_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 static inline pmd_t pmd_wrprotect(pmd_t pmd)
 {
 	return pte_pmd(pte_wrprotect(pmd_pte(pmd)));

-- 
2.34.1

