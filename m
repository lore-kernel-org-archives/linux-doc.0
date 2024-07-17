Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C30182DF
	for <linux-doc@vger.kernel.org>; Wed, 17 Jul 2024 06:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721197754; cv=none; b=WeyDC+Rwi71+etYAh/qlnn64o6QE/UXVyfxsBNpOMPmLt+wABVagA40r75M+LsQpUsEsRPReffOJVwS9/M1FWXQATMbk/vVpiPzljlJs3qmGgbeVCUYa+5qBlJQ9zkQ5SdDIjf6MVT/cXE2qAu7M8/EO3QAQBusQs8+tTBdRg4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721197754; c=relaxed/simple;
	bh=piibWXQoIdT9iDF1Ucz8hY3qyEnh4/nv/5EUjy5T18E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RTldHQIhLUpremATuehUOV2lPvSNShm41IpcuvtlirOL2QjQdoM7V4spJMkvtm0UKDQKlrcqnTqR0S/U5SCHfrgSMwZednN9KJmHIc67KRAjNBGn6WILhAdbXTPSSDQe1SA5uIGGkKUnSuAUq0t8F23NGsDgY42199r3sMmVdC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=cFo/1ZBX; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="cFo/1ZBX"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-367ab50a07aso4012217f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 16 Jul 2024 23:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721197751; x=1721802551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qV10XIriQxrkSLT6hfJ9bzuJQGW5jGWUcHq8Bf3DvNw=;
        b=cFo/1ZBXvHn/hpmxtuTuvd40MaVXd2ic+M8iCgODTXyAbHYx3UBS3adMgozTX13xU9
         icO4TXiea9Ox/i/dSj9GpHP/KmiRygne4Nf9cjw2yqOoyijDLEFT/Wx9WTUVjKn7uRdo
         MArV0oD7iufkh+YiR7p7FogMtsi68d/FiLce3aGS3KdVQH+ng5wf4yfrOL/DlFvJZ0Mh
         vNXzOlkk5sHbX4Mli6Y29oaBMoNfHcJaDoa0zTsa00VCysbAJkpBrJF2azpTzyTLbduW
         aq8z6jjFK2Cb250gntgt/22ApB7soebI4C8jyVAsR88pJUFCGZ/RRUbqqUsra3WRxlcJ
         m+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721197751; x=1721802551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qV10XIriQxrkSLT6hfJ9bzuJQGW5jGWUcHq8Bf3DvNw=;
        b=uHDEG9cI438aSdMPp79EvyK/RSccu9ImnPGUYPy/UQzP2kVNqY5cxF39Ftq39g1i33
         S/epF/6UjGJKK5/IFPW8LSpygLpu6cExEZNPr7JM1aq6yYIWfDFY68OFsO8r/WQK/59v
         rN8jV82Hy0nyAAaMqcKBg1aqBdJH1hdjteXrAstpfAkR96mqK83d6Tz4BH4I/TErFnV4
         qPWmkZIfXHLSJsOSSKkrQuEVnaAdYs+JgJ64FjY3i/NYM5L/nFx6weamRsbz0OtwADnP
         CuXBq4VfSVSlYjvuFUXI/D2KIpoe+xFpk8tskSSBNMuXFtbq4zo29tsyq4zd4Hekwc/9
         TijQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcCadPmQIHmFae7i2rBUW4vvqNWWcXdNqlb4xJzCWZJo8nDu95YFGwO9eg51CziLz0DvEAdluEogm4KJH6Ut36wJakEUNvfKyq
X-Gm-Message-State: AOJu0YyUL83pti2rnK/m+5St3HWL0ZT/wLFM/ryQ8zFUvf5ouOT7WcgL
	UWlx+LIe14XqBJHZ7MOneCJ166ncKM8GI2EwlckWkvtwdXysPSrfTzxez9u3Wv4=
X-Google-Smtp-Source: AGHT+IGP/cuCt+F0ta7uxUlFKhwXsnKpljMYZclyaPYQLOpIG5TT5vjECTCQ1Rcr5BTRTziHhuytmQ==
X-Received: by 2002:adf:fa03:0:b0:368:303b:8fe7 with SMTP id ffacd0b85a97d-36831600243mr520432f8f.7.1721197751437;
        Tue, 16 Jul 2024 23:29:11 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680daccad8sm10840137f8f.60.2024.07.16.23.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 23:29:11 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 09/11] riscv: Add ISA extension parsing for Ziccrse
Date: Wed, 17 Jul 2024 08:19:55 +0200
Message-Id: <20240717061957.140712-10-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240717061957.140712-1-alexghiti@rivosinc.com>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
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
index f71ddd2ca163..863b9b7d4a4f 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -82,6 +82,7 @@
 #define RISCV_ISA_EXT_ZACAS		73
 #define RISCV_ISA_EXT_XANDESPMU		74
 #define RISCV_ISA_EXT_ZABHA		75
+#define RISCV_ISA_EXT_ZICCRSE		76
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c125d82c894b..93d8cc7e232c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -306,6 +306,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
 	__RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_EXT_XANDESPMU),
+	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 };
 
 const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
-- 
2.39.2

