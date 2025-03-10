Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A50D22FDEE
	for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741618372; cv=none; b=YwWZg6KhdKAYJ5CZWYgpA+CcRdYB80WvUBYajTEE0G8ztO9Pj2V85l7ExvwxGqAId4WI48HVqnd2mCWEwm2gFJl8TpPBOxmZk3T2I9DzZzxXIAb2dWjBrOenbMl/oVHfjeTlF9SmrxbB+A4jF3124VfpOhmJjIJp4mMx+q9dxK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741618372; c=relaxed/simple;
	bh=VGYxjWQw4QYGSfT3AnAkedt5HRuw2tlx5dJCnKUawWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pv6xj1MnMSwvnaKArntS2dBkcO7mx2O4Bd3EnGODN9tVSquwaVz3rDelfwU0ZDFSPA0ZVzE9+K/86SQBHF23HymNkhJvIpVzsPcHb73bgxQi/OKudGJngAVoAT+WFwVyUwCVv/WpFYme6F2b/yGJvitA54JvUFJklUTxw6p8QR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=oc1s/WCY; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="oc1s/WCY"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2254e0b4b79so11033825ad.2
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 07:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741618370; x=1742223170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bi056oDr44X6mEA5ptOBWamFE29btTVHHp5F60vYQ4s=;
        b=oc1s/WCYZRpnVyFozEO8JkLT7a/d9l53T015BjY4bGVFrZrfX7l0wLxzZeeBFrmEaN
         qLm2gSBxCbttdRqkiIg32bsbrOfwXAdXPhDKlTshunkV2KtrufBxbKTyWdPryJNUwHsU
         MFPhz4EZVX0KJfZ1ycLZ/SxkIEr7i9u6zrtd1c/V6a74x9lararexA/WTlNp7QZLTX9a
         c6ciXdtgNvSbH0v9PqKBaMy0KAEUkJXLK+nGpbQBIHtc+/qVZ6pHXlR4elVQArkSngp3
         ODr8KoS0BzLiGxIroIlf5qDx9Bdzi8vZiUEbE8FQZf8GRqNMc3iE6iN9dSr+vzCf4tb1
         nRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741618370; x=1742223170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bi056oDr44X6mEA5ptOBWamFE29btTVHHp5F60vYQ4s=;
        b=hqhcWBzgMkoK9H241NFanIWUFDgoC8EA+CGPTGuDx3PRq9LrlUJ4Orscwuqd4Hi81F
         ZcGQpZxgBnuMOtYsg3z3vu9bqr2X3Q7d9hwIXgD1UF+5YdCDkrficeyEp3QgG9yCeY+R
         GmUsuwfcSpYlMqmPLOKjJySnk6BM+31Ba08VsQzhcXLTk3e5/TrxGHB9usUBlfQQH+VL
         W1bme7s4JpEef8KP3QZSxy/JlJtEQHOYmWtG1x0tEyrky5moaTLdXLXPLQTNNMrrhTwd
         zxN0zaHTi+2w7depRLKZF1vuFdyH8t64mMoHzvqbEW2O0wpwZSqP3mdS7Kw7SDd9BXXJ
         1PcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWltWbbDNbDMXPBEtIccSFpaXPRWtcmw62ql6amIPI/Pt+6oTy9I9z2yFOwkYIPkyPtMAsCdyikm+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXLMYdg7foWRoyLT4MJyT4GIqUUZC38frbP04uECBL4dqTCtsO
	Oz++MYxfpqZ3VIi6/cL6cOCQRtC9qThFLiCrIAYvNgegl3No5CCUK+gQaJDMEQc=
X-Gm-Gg: ASbGncsibW+Br+fbZk0OPbg4Ko1z3FIs42tlkI+YX6E6bbBn8piyv6EHRIMIjTUKPLc
	fw0dpQaeOM1+ZB3FuoxkNrZJJKtSj1itJqkDfPaZCDzKtcm/joqW2HDAMUw1MBOZ4p1+e8mlopo
	m4aKK23QYReWmOoeWbRMP5yhJfUM1OQPVV/6tsnOWjOCBOSFlHbokejJfHu39VGv1RUyDQ8oM+n
	4Ae3D5pehcvH4IUjNTmh0BXUnxTTKXRUoH7kzNWMYV//ooMzwd24LACm32JlyQGnvT3ST4DtQ6x
	4257xt7JuAmBSXBAbX0ZTlwT4rU76cjbBqLhQrFsVb3uUASB9gM6RoE=
X-Google-Smtp-Source: AGHT+IHIjPCK5/0EhbZcTRnURyZw0NTj2K+W71g/3+djiMGOR5iYaRFLtirQywnmf6SGr6Tob6ydqg==
X-Received: by 2002:a05:6a00:218c:b0:736:562b:9a9c with SMTP id d2e1a72fcca58-736aaadf10emr17282132b3a.18.1741618369717;
        Mon, 10 Mar 2025 07:52:49 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736d11d4600sm2890275b3a.116.2025.03.10.07.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:52:49 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Mar 2025 07:52:29 -0700
Subject: [PATCH v11 07/27] riscv mm: manufacture shadow stack pte
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-v5_user_cfi_series-v11-7-86b36cbfb910@rivosinc.com>
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

