Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D796C20FA9F
	for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2024 23:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730245488; cv=none; b=iOJrZo/rmLmyE3rnFdSp0oCut0sfFr+Uap0foYOl4abJm20nFAZ5zuYSh/+XNRnM7Zz2Hho+ehD5ageGCJ3dc6XbAR2BGM5q3X9Jh9uokOyZW4rihCIW1VrRYA/gCYznUHSGY0l61zDcDYOlA2jeerZXUwv7edLuIYEy0Jz2gvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730245488; c=relaxed/simple;
	bh=Qaecc3v5yAMkUrzHhOA6HmoS3Zd6021ySDrkPX6LvF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sUg213lUAwNmqIQbZsCJ7bcb18Wqh3gqTqHbzYoPzyAfTxVToXIrhnOO03tvklUz/azZE082tIw0wHSUoX7spFXUkQAlKC+TZxrAt1N+AZJQdpkX6Zb1/T4XEJRYUgz26Kp+FD+r/kSxykXaekeZfjrQ3DEN+g9I2a5ZIYF8oug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=aZIIiiHn; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="aZIIiiHn"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7ea7e2ff5ceso4444686a12.2
        for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2024 16:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1730245484; x=1730850284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzIJ0ckbf1GHBD2tYvzNgj5PuC5n3mvmNJyw5lLXOXo=;
        b=aZIIiiHnGUVybrUYcFAlTeDa/h6ZhbWXci0fWcKDWD9y3COyoz0gQSV/VEMEgK1LP4
         ZhOzk7+cfJSQZRCdAbeYI70TsMCJtffWWIceSYVbH+ZtYgljpndtw+9jLYFWQvy5b9g1
         epC+C4vAVcRQLqkDxOdnxOuXFmDHMO+yTxBwQMXYXI7vXZ8cO2E7KPevPqmx2eVbTpoK
         /AcFTzQsMwv2xBzB8Hyx6ecOg06qHjx/nml65Hik7NO9GTFSB9fJRru6q3Au2yK6KidC
         zJbNrlMs1f4VlRiCKgkoHtH1IVD1FuqquAhuS3h36DE/BjrGgGbaZGKO48LGEH6jMnhZ
         sSxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730245484; x=1730850284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CzIJ0ckbf1GHBD2tYvzNgj5PuC5n3mvmNJyw5lLXOXo=;
        b=rF0IQAu58s6Qzh6qp1E3AoRPYIMfIugA3+C5ABncq+vhuvu/Mqu7vJHlcKdvxWalwJ
         XsscPCZv5gaDHdI6jBnAYNAxJogXVxW9RZpqKHvNPm9bI4E4531uHIwSxQOs4AE2Iozi
         nVyySRN2mjwier6/FV80R3WIaTOlF0csqK+T118fzjIYihaUSTLb3bQddeGz6N8ha+ME
         33lorCwxwntG2HJA1hIO5cXyOCXZt9w3PTiSciT4YL8bEQtqPZqpDhkPNG/Z7b/UruN0
         yv/NqIfolEiV4GrHqAmdbtc5+iDgdiPRnBHYI1JquPQf+4FrKSZMsG4iymrhe0I4k26q
         k5UA==
X-Forwarded-Encrypted: i=1; AJvYcCV8Tgr4om++EJqTAQb7DQ6MDYSeFsMx/cZy7W/r2s3uw3mr/PaNlBc0BAT/gpWxCTFZhDyySMVmRR8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6ZBE/A+7WTj+7/HgNGXXagUKQWX1rir+RGDUWnyXBWK3zuArO
	NAmNCaLYRzmsfX9TgntmbMgWxnMI+RHvbvmq7PjTrrKNuK2UWp+Mhmgv0cZKli0=
X-Google-Smtp-Source: AGHT+IHO9NpgsFfUG2/uawtteNyrFufrWe38CJ3nbx9BvyIZZlCpghacJ/qvTmf6Sjhfn55Wj0xhbA==
X-Received: by 2002:a05:6a21:920b:b0:1cf:573a:bb58 with SMTP id adf61e73a8af0-1d9eee1e178mr2067308637.40.1730245484368;
        Tue, 29 Oct 2024 16:44:44 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057921863sm8157643b3a.33.2024.10.29.16.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 16:44:43 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 29 Oct 2024 16:44:11 -0700
Subject: [PATCH v7 11/32] riscv mm: manufacture shadow stack pte
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-v5_user_cfi_series-v7-11-2727ce9936cb@rivosinc.com>
References: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
In-Reply-To: <20241029-v5_user_cfi_series-v7-0-2727ce9936cb@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
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
index 4948a1f18ae8..2c6edc8d04a3 100644
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
@@ -738,6 +743,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
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

