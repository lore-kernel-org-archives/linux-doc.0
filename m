Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06992D29C6
	for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 07:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758267462; cv=none; b=PVwPwS/nbcHXvylbNpKVClEFLzTJ87HnWbNwzPOZAsGDQOlIwBOh04SwBXc5PKiyRx/F/NEmeuojojMIttnOIIFmKJKztDuRigTQDNgUBcFhDKsndUYCnHdsNkIbTDnY7TB2fJ9G6hyQVvsB8hizALlhsEvLx0EyP5dA70DLB28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758267462; c=relaxed/simple;
	bh=AHBUSWC6NQwt5gipootBG6lu9YU2EyCEcBy5+RZx010=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nq1UQZZE+ywi/w2V/9/+7e3Gj7Aw8oz5mw9yia98PT85TfmTohDNtlj9Oeys8B+Gc76sattHecKyuXLow6qAZwMzh/YHRY+Pn/fpG82P+AjT2ccutrmjeHPZ2NKXNE3o4KElctGurIQ/yJS5BiRrXRlXMtUXdtS7R6NGIFPXEzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=gllcGJn0; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="gllcGJn0"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b4c1fc383eeso1267027a12.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 00:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758267460; x=1758872260; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L4l4TBk/LGXRpjovIOSrhrLfanQNTxjIirl6+Uo+sE8=;
        b=gllcGJn09UVCHw6TO3crg5th31HrYA6XFrKKbFQJnThh1EcSieCckcpfi+kDmYEgdI
         l4fdMRU8Sm0yU7bJB5zd3GWz14lg9sVydri94GTknI6lzxwKXkRjZCnGvFmFXsVU03Gc
         Ok1nisTt4VKl5x/Pg6Ga1tK1vLtaKfaPh/5CFSkFd7xyVdpKcJZSJIxlsEtikQP6UOYX
         qm6UQ04BfM8LZoZ2WN1HSOGRnizzrwqMGR1PYCVvPLJbiFelsXCoPT5Yq7ODr3TWBj5x
         WNXEuCYNbOAbykwmaNnH3qhHm+FQsFzQDW6j29/KM4d1w7A77dt/JF7PVGHpjnukelyq
         OAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267460; x=1758872260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4l4TBk/LGXRpjovIOSrhrLfanQNTxjIirl6+Uo+sE8=;
        b=s8IUOb93ZFEWhHNrUZDdyGXuL3u5OMnMUTfq2kbr2yTCOkNS4xk9M1IO6VaiAAcugM
         1SCwOARNzMp899Z3TMbz0hky365iG6weA86h3QCyaBTii1eT7eaw9GGMUdlA/Hu5ix0t
         3vRF2YhyAZSvla3lpq0xoJE2KAFsV+4bBMn5wsUOKmoOxqabOFqW/Cfe+27q7wNWlnI/
         +VZal4pvw+poS5eS9aJ0YQXhQ1lwWMBctxbQKhivrtQGdXX+UibZrwKr7plaL2sCOEE8
         EOknpOw+6DFzSOADohqYNK2c4fOcodRBZoGYa59LVvZlLk75l/FpdvJWak7OR98Qcfw3
         LJ4g==
X-Forwarded-Encrypted: i=1; AJvYcCW9k65Tew9kceOjoqZ5yHFZUDMusvyGC+rMPsPCHqoBijJH1POWHdBAsT7Zo/smlFHVprLWIyvwZyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx6OodlXJ8yY/WSck1ghu21fE/Rh1pkcY1cwwERZxHpXby3z0w
	5Op5comfV/7d+wuZZMl/tFWErrLGwzq2/SQvwr5q3tHCavtp5KjZg6PQHcWr7qHoLTQ=
X-Gm-Gg: ASbGncuaclUOSTdf6fcvg18fEbSpCTQ/juFshsNvLw2gFLeu8k+DZUDI5gtZ6o/FZXN
	hTj634EBviQChvHWRkTkIEoFw9nY5b3ux0f/qjpPAeqvtzWOmB+zmcUKpOdMhB1cWkdgj3IsL4V
	IfLOh2nI4owxw/rNOpN/52+FWRwomQoKIJ+LFnvOA4BiHQtYB2WRtS5UOCqv79GCHaTyCqRaoYw
	LPkQz790A76qvjlhZmwV4jXS4P/mG8Eiu99+2NAZHwjbm4lOphoCSshFHkKyb98D6dh5YOL63Ys
	xScUDALCrLebn5SPJR6rUeamWitZwBuWZrevsFPr/0sOeHWtrgd4UIw+euemMxFk141ygIoS00B
	RYKKVqm9yRvrsfvWdvxmcKsUfUqk0R2ddhAsTYwir43ALS3yFclMV0zXhm7Ds2WM4V5KJOx9Wj9
	wX+mKREE7X82K6jPUhrc4GxxvAtBs1eJp0WC1OJHxZUQ==
X-Google-Smtp-Source: AGHT+IGqA40UuZYCJLJHFfbOR75YQDLCIeiJK76C6SxyMFnU0ZZChhSlvmZdfbgczrzCrLP8RN4dig==
X-Received: by 2002:a17:90a:dfcf:b0:32e:9a0b:1d1 with SMTP id 98e67ed59e1d1-33097fed9a6mr2718272a91.9.1758267459588;
        Fri, 19 Sep 2025 00:37:39 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b550fd7ebc7sm2679096a12.19.2025.09.19.00.37.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 00:37:39 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3 1/8] riscv: add ISA extension parsing for Zalasr
Date: Fri, 19 Sep 2025 15:37:07 +0800
Message-ID: <20250919073714.83063-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250919073714.83063-1-luxu.kernel@bytedance.com>
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add parsing for Zalasr ISA extension.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index affd63e11b0a3..ae3852c4f2ca2 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -106,6 +106,7 @@
 #define RISCV_ISA_EXT_ZAAMO		97
 #define RISCV_ISA_EXT_ZALRSC		98
 #define RISCV_ISA_EXT_ZICBOP		99
+#define RISCV_ISA_EXT_ZALASR		100
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 743d53415572e..bf9d3d92bf372 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -472,6 +472,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zaamo, RISCV_ISA_EXT_ZAAMO),
 	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
+	__RISCV_ISA_EXT_DATA(zalasr, RISCV_ISA_EXT_ZALASR),
 	__RISCV_ISA_EXT_DATA(zalrsc, RISCV_ISA_EXT_ZALRSC),
 	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
 	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
-- 
2.20.1

