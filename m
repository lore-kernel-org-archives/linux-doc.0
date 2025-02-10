Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DB5254AF5
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 20:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739219222; cv=none; b=hekHGYOYCuz8TtsSu7C1iiMAhmDc2Y0cbT5S+S9WRPgi3wsWTLtD/YJnGEB12G3TBTeqHniSxKpibqXhI2UDWCSsy3FdRZa+vM/GiLNXVhCtEDyyWXMFJbahQflL/3uu9w4gZ+A4hI88kWrJUL7W2xY9r3kZYzSNWA6SpPH2E2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739219222; c=relaxed/simple;
	bh=VGYxjWQw4QYGSfT3AnAkedt5HRuw2tlx5dJCnKUawWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EVw+Hxnl26H5lPAtOlmuCqIQZkvLBVzgif9sHZDrdu5mmFUJKgN8gOxWcLsyM0EGxQql1iHsErdOnnQNvEckiAq5/kvvKSaAdbA7gEVcvHtbbybuWcJLavwUL59nzq2qGwsX4/eRkYEkhgVP1/tMjvTokkA2V9VaCRMqGPxHPZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Jjso/jkr; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Jjso/jkr"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21f7f1e1194so49343845ad.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 12:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219219; x=1739824019; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bi056oDr44X6mEA5ptOBWamFE29btTVHHp5F60vYQ4s=;
        b=Jjso/jkrqo17czBv99NVyVdLAR/jj7kRxKYwNCZYJ4riMxKQt6iRLNkZIe5CmzByln
         NLBWDAwOGpyj8HeHDcJCRSud6/ls6ohnjTdPKqWpprcp5iQO+0z8O3MppljcpnQP80hH
         +r7pX/PWhRPFTob8enkbzWtUt9G9tD9+GtDScXE8PBDDU/8Sihc8SJGcqWHcGWzGJTzG
         hOgcy2xS/OSRmpSgcp5YLE5NcMlaeSocxm/nlS8Rfcrfuc4/ghfRjZNImhTf4XJotQwX
         sUicyo3QQGFZkI8JXhTyPrqM6ajqZBc4Zq4Ysm0RLUGelscF4EbYj68AB9pQ7hgunkFm
         rm8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219219; x=1739824019;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bi056oDr44X6mEA5ptOBWamFE29btTVHHp5F60vYQ4s=;
        b=ifIBSSNK3jhsFYcOtzws0F/8C++9/dQxLnOD735uJTUVhTmfzyQRIjYNr4UYeqUfwN
         638ilThiNd0vPwk8fyYBTnW4YJjKK///JroWbVHOpMSa/Jxk7OzcZl9FijCObOlncjHf
         KYqs4ftyzLZzHqY96OnqTT+4Y55n0lSqHYhkxQ6zhZb8CVjkdIdDcyWkBMqsiHCSOAay
         MCBE0G9kG9OPmMR/Wt6/gFRtRFSEm4qM47lutpUJr/NHeKfzyso8nLXVMixfJH+Weu2C
         aRQP4HX2opKetK3qyyPKlfoWiiy0lKc6vNfG5tAwrm6dgsvjW2VMU1IucJ2tioa7cLW2
         FMGw==
X-Forwarded-Encrypted: i=1; AJvYcCW54H2P0JoE8k678FFpnNnfav8RC/+hMngs7e1pFRvV6RdgyNHSCHFBlJiTbHYUH1jnc8FEMAj8/zk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCBq5t8x6na//jlSlNHavLBNwgN+kz7HXTsXlT7XlSyryeFkfA
	3BMxpx7g8jEFfCy/5lHxSoKTJJo9HBVYdtgiD1Euj/ZaoNYhP/1uDTQmSliS0FpWJ5/4ZzBxEEc
	R
X-Gm-Gg: ASbGncvmVPVKpg7mHLNGqEBBrc6e6MwJTHlvv2CgG8B/mqJt3ARQ5k10HFOBQzG8KOD
	g+7uHDCEcOPUNOTwESCWTpvQzRbvJQK9ff3vENwGIlg4UY7TMTK8kB8yl9fxtJq2lydXi+O1EYI
	9nFQY31L5E1QZVOdDlXtb8aWZPf+7KDbHmvJHPk4bKGzMzFJsNHznFLVs1QLnNxRC3bPszpRXzL
	L2strdItyPocBPxEkQXfy5mQ3AvxjNVl7vmYynPl8FvMKQ6Mfz343yAZNe+X7QqQkOk0gXogncG
	sUd9qonVHHAo81yi61nwJduxjg==
X-Google-Smtp-Source: AGHT+IED7zcqCk6xnlgZyjRhcEK3K99n9HG3VnjktIjXL97/vl92I1hppw2VD80KTsXjIvmfBlGjpA==
X-Received: by 2002:a17:903:284:b0:216:7ee9:21ff with SMTP id d9443c01a7336-21f4e763a67mr241716765ad.49.1739219219434;
        Mon, 10 Feb 2025 12:26:59 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c187sm83711555ad.168.2025.02.10.12.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:26:59 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Feb 2025 12:26:40 -0800
Subject: [PATCH v10 07/27] riscv mm: manufacture shadow stack pte
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-v5_user_cfi_series-v10-7-163dcfa31c60@rivosinc.com>
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

