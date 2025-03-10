Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B074236A6A
	for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 14:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741618397; cv=none; b=LWRXNuIBcxcnsrjxH/2eZpiKdQ88mkVDwW/i4kndOL+NXi6+WL38uFnqaa+XWj/vo0v0LkV5qurPP3yyz78J/y7d6WD5drkJZHfvn06Vwng120d9kn9V5ZShGSP5SDiomuYGkd5JWGX/zVih+wT50Wrew+C2fPzpGdYHeb9SLZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741618397; c=relaxed/simple;
	bh=UvMauEZ7ujgiT53rhoVNtF8wKatfWBS5dd1E01vsJYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aqnWMiA8aT6J+aJPKjU2JCnQcHFz3TSBBv8cRj0z/xEgBWmHSCel/qqqDHjVuStrcCRoQSIAycOHFmHFt3LbkUTwenxeuQq2pVC45Twz6VcrkRDA03fKaKColaHhLWLWd46JhDFKnrK3HyxJO2BFVqne+Uv40nVMSgnwRTNnn4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=zPXTTQSK; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="zPXTTQSK"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22403cbb47fso81613475ad.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Mar 2025 07:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741618394; x=1742223194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hU6IAlGSwKWKw5iWDrFBqBdwaJZ69/+Cs7+/DXu3do8=;
        b=zPXTTQSKs3/W7hpXrMrHxoM7PXJu/T5lIZU0UskLLk+biL8fBDRNPITf9//V/O1GpU
         AJD3oPHH3qQlP5OL3dMoul6OWtzKNlN1m5QgSOVk3mMCpxeBh6nR68Wc6O1TMFIIVzxc
         dJDnrdwCGuChWNwT6mVSgVFssX0UtKee87VE0WtWpJeAHHCyxwhxl/FNW/Z0xEQEO9aU
         bWreBVHBCsf2t2Rk2Re/3K7fEiBJTGmlpIJt15/pfWNcu3FfL1SYxIaucRVjKfBEmnVw
         TxvnRmNJM89a6WslO5CZEDDyZ1OLtU1dlyrNR88YQpQC2HyraDmzvUKUY/WiN0tolozE
         9IPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741618394; x=1742223194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hU6IAlGSwKWKw5iWDrFBqBdwaJZ69/+Cs7+/DXu3do8=;
        b=giqXHRYpOxncYytF3x6C71IRQ4hCv7StIYRRBaybvezXDiGDXzsu2NnVVgAz6UktoO
         /67DrgGjqiG88yO3+kBtUB92jWExIMkc6eI7VMmPttEywpN5FyCrFpJBXjZSZ3EBhrce
         JYoK6kx6KpKjsFSjhPca+UBnsKXat7CRkp5znV+2fggMxKQcRwX+au0/zxbNwHMD54VQ
         /YzxXX5Q3alPKHQSK1cshUGaQJqxn63bTaP+qymmo7V0S5m3SlG6yL0fQmuwKky+9H6/
         fR6bDH5YOQxscNj9JUndG3sLfhH22OVMJD7aV3hjQtlbb5np84D2yp1+Qjvf6kytS/r5
         GUVw==
X-Forwarded-Encrypted: i=1; AJvYcCXfGJjyFiAkPK50Obz4qdlN4obN11jB7iTpwji0fI9+Mi08N/RS7K5rPisVfp084MCBxzDFGvh0wUA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmpWCD7wHzLLRVNsp0XtWS9P8cuMixw7hmuREIQo8AT3K25xnG
	1iTvtHni7+4DSG4t0pj8aAeyND9Mdt4VBG2piG12VlDSbP43sbAmWBaGJFU/kTs=
X-Gm-Gg: ASbGncvTQs08DEKH5TDeFV16BBztYvvtPkdXHoNT3Q7NNQTSXY5upcKSBUivwpAeFC5
	2P9800dr02A1PxAUumgy6kqLt66VSwnRSjuCr+znoidAEiSBd04l8ST2qHGMntlR7q1FWVnHQg/
	WfdqM6L8rf3DJCrYM42b3Lt5oFHeNXKo8xlZNdo/Y2hOgdpMSYGlZewZqm1pbeqom7yDSMSuv8O
	AYbcqplSR0O8af1re5MFYMrMRcd6tAt6HnsXyRwpQ86e7ma75RaDHSSsuTiF1lOGXNl9U+ovgGX
	Qi7ZbvJ77vnInH7vPjpSfmi4Kxr+/o9gNjg2wgYOHH+c7MHVbI8e/V8=
X-Google-Smtp-Source: AGHT+IG6aOZPbFLpYB6hUt/uNP0xUDOJ3SJhAN3Hb+FAwmeol3/+ZPXWsjDkyF4qiBV6yJ/cwzujRQ==
X-Received: by 2002:a17:902:ec89:b0:224:10a2:cad9 with SMTP id d9443c01a7336-22428bd5852mr262786715ad.41.1741618394280;
        Mon, 10 Mar 2025 07:53:14 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736d11d4600sm2890275b3a.116.2025.03.10.07.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:53:13 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 10 Mar 2025 07:52:39 -0700
Subject: [PATCH v11 17/27] riscv/kernel: update __show_regs to print shadow
 stack register
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-v5_user_cfi_series-v11-17-86b36cbfb910@rivosinc.com>
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

Updating __show_regs to print captured shadow stack pointer as well.
On tasks where shadow stack is disabled, it'll simply print 0.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 4587201dd81d..6bb53ce72ed5 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -90,8 +90,8 @@ void __show_regs(struct pt_regs *regs)
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
2.34.1

