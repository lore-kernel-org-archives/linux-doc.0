Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ECE1A71FB
	for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 07:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722411325; cv=none; b=uKdIHHYCqjuYhx+9Mzq0NajTDk2LZaZSqwLwQrq+GQpfub5byL4AkpgGE2z2uS7Df2b1/AExo7CzBTPgKtupFIYYnIIRxAFlRwZtFErjUVVxK9UUkl6sBbKYPSECa8yCEbNqV/nFjB3aY5zrXBQDKvwvdf2T4v/iA8aC2ZJHGxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722411325; c=relaxed/simple;
	bh=+9/y9wvtaqMsdeXKfExQM5dsUcThBpV6bsD9FDAfAQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=luJsPDcrkKeOcIjQm44UPxgP2BlLDmaIEqtRC2BdJs/DgOjv0hrIXu0ljuMJzV9ov5YFWD1WVMrAFi5k8kLnsa4mruNRXuQ2AKatd5nTyGTQWqHmFrp4YlarEPKSSUMXZJO8anecJF8esY3M+gLSWlwgfHJeDNm/avuPe2a1cRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=e1rqvkV+; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="e1rqvkV+"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-367963ea053so3318695f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2024 00:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722411322; x=1723016122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z44ALrb7LNXYv1B0ZHkbMo5mYcvmK7MIKHKlm+pxL7E=;
        b=e1rqvkV+tHP6kZSLCllIO64WzIc0/UdYhnbG6DhpoEjTSrPE87RcjuLBo1P/taJA7q
         RDjlvYNE6m2tTeNNHtJosZjmwep5akV0lPeuxHSSoBKP7Lcjc/j/lmrmi+N3IaQO7lP4
         rn0GmOq9goq4w1XSPAxuAM8FtdJEvNRMT1PWKPEKDoUB2oy3aRj7H4t1y4fGUBfKl2UX
         3MI9FfOd9YZ3viJYyHhfIrtMMsdTWvSE35oCh8IfCRRZMjrawG1lqI433/GtDlXXfO1Z
         Q0d/5Hu6UMI0cKxWDKrzx5b32YYIB4mqChalEIBINSuc5be4EcXVlJkjoAIHtOheG0VE
         sRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722411322; x=1723016122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z44ALrb7LNXYv1B0ZHkbMo5mYcvmK7MIKHKlm+pxL7E=;
        b=A7nsxJH6eeHPkwbCTKjNts98USZ2ph3Ym+RXH8qsyS33lhK6p9KsNRWJKtD69aLNLp
         lyoiSU8iZ+iECJCMWd7XJ+dP0BbX+o2jzWgukCLfl+hT7QWiUqBAT9eCHkXhar64nTm2
         U6EI3ZqERcPlKrf/kftn6PmRi4x2LUsce6GSP4SIZHcDTlYXo3Ci3uapGDVwhQ547z5d
         A06Y3u5PI0thmUlLloRguAoWfZcuDFu8qcUqbF63lf/HMCGAjVujLVf6vEvMctSyKigU
         C4eJ1LBzk9W283sXi/GmvcBnJKBY6LDrG/MAFT4YEg+2xrwYjkwPMyzTQidwRuyw6iLO
         tl8g==
X-Forwarded-Encrypted: i=1; AJvYcCUKqfjIyOJZ2u8n1yVN+5HZkt0dEc2TiKPEQDPTv+xLdkVX1uJJoJYQB00n4diHU5s7oO/+nfl327q4FItx3rAGkaVXfwdY52RR
X-Gm-Message-State: AOJu0YzZySFMGcJf5cPHqW97RRwGBXJtEMTukpRzI1DfEfYMymMLqV+Q
	aocPii/blmQEIAhGoT/v05clIbUaniyHB6iro7nVkiI79CUTt/4eoQJ0d6tbPxw=
X-Google-Smtp-Source: AGHT+IG6U6uPzWRr6gyEB9gsCw8ZKy/LcXxiWXsEaCB8YLZ20e09CxhjZV72Tw4GvYFGKWtqsWRHog==
X-Received: by 2002:a5d:6d87:0:b0:368:31c7:19da with SMTP id ffacd0b85a97d-36b5cf2520fmr13078467f8f.13.1722411321847;
        Wed, 31 Jul 2024 00:35:21 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36862271sm16333146f8f.98.2024.07.31.00.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:35:21 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andrea Parri <parri.andrea@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v4 11/13] riscv: Add ISA extension parsing for Ziccrse
Date: Wed, 31 Jul 2024 09:24:03 +0200
Message-Id: <20240731072405.197046-12-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731072405.197046-1-alexghiti@rivosinc.com>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support to parse the Ziccrse string in the riscv,isa string.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f5d53251c947..9e228b079a6d 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -93,6 +93,7 @@
 #define RISCV_ISA_EXT_ZCMOP		84
 #define RISCV_ISA_EXT_ZAWRS		85
 #define RISCV_ISA_EXT_ZABHA		86
+#define RISCV_ISA_EXT_ZICCRSE		87
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 2a608056c89c..097821df8642 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -314,6 +314,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 					  riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts,
 					  riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
 	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
 	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
-- 
2.39.2

