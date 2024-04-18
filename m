Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE170165FC9
	for <linux-doc@vger.kernel.org>; Thu, 18 Apr 2024 12:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713444248; cv=none; b=bR4SvZzrq6tMran7j/ABwXzzPsut3WH2aKYV+O+SymMWJL2vc5BMvmn+XQS4e/tWTeUFECOupIt/Vc67ktVGTrQBaAj0VtDbpAxb6jX1xsarUEFR4CS61fil+KV5nbX4LxbbzG/eSyLbxeR5HXXMgnWPqb4a3IH18Fi+pUon1SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713444248; c=relaxed/simple;
	bh=boke7k+fuPr/buwvZEKJqr5O7FQgiL8dA2Us1JuDFEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cuq5uBXhZRXORjOSpD0T0iSz8v05WZBz3H8etEYlN2JvMOFv5/uew09zTqfKCWfJHhbcTWyIbnipRBEPUcNnmhK05n1f45TSCvNdvVExxSjfNBEdXTWSkrcUB+TVpZpuJpFMWnPeVaBNKANA8C8WYFNlrdO8k91eXcwUdriw5Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=IzRDUPdq; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="IzRDUPdq"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2dac628f08fso2491281fa.3
        for <linux-doc@vger.kernel.org>; Thu, 18 Apr 2024 05:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713444245; x=1714049045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJJluMz+u6UTg8XM641LtNTBq3D7zPplm+46K1BBT3g=;
        b=IzRDUPdqJ4Vlg87RINfb9CIyPJREmt9Psx3Qd1IrCBHTLQjoYYN55/s9kaLgRafHp+
         mmu3lg3cXMIVebSj3S+5gydCrwz5G5cGLX+gtS+n2lIhpprJYMMGjWeTf6q9joZycq3F
         wA/ewDw30c3CFmaGgc/M6p0jcEWcmvmFKI8oIeFkC0Dqk1ttxA5EJ/ddZR3keeNHgLu0
         LmgFW8GZGMgcqfAOud+b69OSuuxSumW3/NcOJ1D5GoYCqvnWb8tb+AtP6RVybGLiK4uy
         KpKQpU+Ts8SmSOTn87kOjwUPQPw27WDoe6TXoQQGPL9CmO8Mhxv2bbmp0P1FlB6pA3jh
         /pXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713444245; x=1714049045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJJluMz+u6UTg8XM641LtNTBq3D7zPplm+46K1BBT3g=;
        b=lyl79OB0Q+DdajBz497yEeWoPDhWYx+yRy0O96MzbbfyHSxM9el1e+oYGwUGiOG8e/
         adtjqIyz42hj7SNJGCIztVIcBH5i7VGoDIA+Mc/orBlZcdzRHxGj7HjbsK7/m9eGsLfe
         W5pj5rRY8/qde3RvoKFr4Lyk21CU1VhF8ErdAlI7JGDNk5IpZJzp7JzmaNbZIouoqcRV
         oJqLfz0pBPpfK5iwMjWzE0OzQEpdUa6UzxhprZbVVEObtCcOUSHC7GknqC81x0fvFgoz
         /4O8qWdYcJnOq5wPZaNVgdyyt6C+UaMho/S3LT42/Dnf5KbIP8ZtLW1peZP71Y3GvaU2
         jJgA==
X-Forwarded-Encrypted: i=1; AJvYcCV9AyeaeILPd6CgiJLRFGUmdDqJz6MGol++hM9+G9YWHFbe/jRCw6SzFoAlIwPity+K3w45VNE/2jv4FREyNcEGaP2o8YBgb4kO
X-Gm-Message-State: AOJu0Yzd051Agq63dqO2DrpVcWJoUoUGERXUIa6P2cZkeDO/0md1qQr+
	JFpvWQ/1TMg8Rlitp4TLz+5kZqa6GwDyEqyWqN0iuBsOHGNrIOSlA+Ci/jRmXmY=
X-Google-Smtp-Source: AGHT+IEA98F7NhkSpgbqjXTJDAARemLQxPRyTCHu7WNOEPKgiNpZ7WkvoQPUAaqjKtkLyPbtJUVEhQ==
X-Received: by 2002:a2e:9ccf:0:b0:2d9:e54d:8208 with SMTP id g15-20020a2e9ccf000000b002d9e54d8208mr1639216ljj.0.1713444245128;
        Thu, 18 Apr 2024 05:44:05 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b00418d5b16fa2sm3373412wmb.30.2024.04.18.05.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 05:44:04 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 09/12] riscv: add ISA extension parsing for Zcmop
Date: Thu, 18 Apr 2024 14:42:32 +0200
Message-ID: <20240418124300.1387978-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418124300.1387978-1-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add parsing for Zcmop ISA extension which was ratified in commit
b854a709c00 ("Zcmop is ratified/1.0") of the riscv-isa-manual.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b7551bad341b..cff7660de268 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -86,6 +86,7 @@
 #define RISCV_ISA_EXT_ZCB		77
 #define RISCV_ISA_EXT_ZCD		78
 #define RISCV_ISA_EXT_ZCF		79
+#define RISCV_ISA_EXT_ZCMOP		80
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 09dee071274d..f1450cd7231e 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -265,6 +265,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zcb, RISCV_ISA_EXT_ZCB),
 	__RISCV_ISA_EXT_DATA(zcd, RISCV_ISA_EXT_ZCD),
 	__RISCV_ISA_EXT_DATA(zcf, RISCV_ISA_EXT_ZCF),
+	__RISCV_ISA_EXT_DATA(zcmop, RISCV_ISA_EXT_ZCMOP),
 	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
-- 
2.43.0

