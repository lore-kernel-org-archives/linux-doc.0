Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6F315ADA2
	for <linux-doc@vger.kernel.org>; Wed, 10 Apr 2024 09:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712740277; cv=none; b=gG5ev9GJjNVc9YL1arm79DLs9lqBs8mz4QbeKc2f/1nhNXqSbf9I2Sz/Z7xPnN4G0Plvlvi4GJoiSUyCNGsGsi7sGonNQbeeDpqTm5FKB1+QocFyV2vPLhs0KDO9GacaADJtvZTRc8acqGBbKmR9vHa/EVHhYWn/jlRXgR7WTIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712740277; c=relaxed/simple;
	bh=SrpAxjIaY3RV8BXenxbFlBJKJmsCS8qPO2iasFfYMfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i7/71HXTqD1kq3gP6Mn06+6B1ttauyiHEbQ1eXw1UIsiDKnKGmCx/u2WtLI59xFOIfa6yAuB12wJPU+S7Atl/zLYBBXPU756LDu12RSitU5/GLWCc7q7tXYHTHgKIblA6l3pyGEyMysM6YZetp/hGdFle27Q9cQiOUmr56nsw1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=1ddCqqqs; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="1ddCqqqs"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-346407b8c9aso516545f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Apr 2024 02:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712740273; x=1713345073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAM+PbC/Wqgx6Q9RB0x39wuP2KdW0QgVrrLDnXaQ5i0=;
        b=1ddCqqqsqcyQBdirnIFdkGzDqgMdLMpzK9qORXE5ZHQxUi72RPw5KWci5jx/Afd0sD
         8FxEMw4UE7rQiSzfGyf4QIc0rCCCpkA/UwvFIdbc8oU4Bur1ntn5EBpFyQHeFdkX+SIX
         anHvRPlvpoouubtRlRhOqrvHfXjWnhcnnh3zW2sgm3mM+Erm4erjdXkNut/8heN7S6wv
         afSFbpXt5owL4qLNE/cWu/r74yAv57hzntRGE+iiUcC4oBBzWg3r+Qg0KiWgcbkSwIzz
         WRwqIxAyc9XJ2EjAJ/CKwI1ksPK7eo2JoEiDfYLNavKDYxeugC7+pGTrISxt31GdsPbs
         L5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712740273; x=1713345073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hAM+PbC/Wqgx6Q9RB0x39wuP2KdW0QgVrrLDnXaQ5i0=;
        b=Kc76msRQqvrWKUEKpGelbcPson3rXALaEvbprXOjkxF8GFHJSRyGX9kYkb+Q2LOVy/
         voOXzlLi1DaYxCPRFrcyb5FOjq8AeieTIwQpuqh6FUhJMKVXtERkCbyT4hdEwropc8GM
         Z8H9E86cxbGSRPL7VfYzqxQ7kS3CZzgQRMH9aUnTLwVdAYEqz+o5fxTP0UMpE/kbUw7z
         JU9345zUbOUGiKSIcS8kxRu0wmJx9Zg8U2PWLd3infu5IbPjlvfD0hZFRPjcWRDzXns6
         NtYnUoG/wHDi4J0xqh7uHbi+yyxlWJAli8MlbhuHlHBYLYX6nyLdWwFd93KDZn3sM57I
         oPgg==
X-Forwarded-Encrypted: i=1; AJvYcCUT6Ak1XF6mfBMUJFjcrmcbiBQA5bCvTi8SCC6v3z2EYmaVPiooAqgYo9MAi4ClttnbWKFV1jI4NhmnZQ1a/GE5wM30q7A2X3Qc
X-Gm-Message-State: AOJu0YwQ93cph0U4wZYNdkFS2S3vw1ytEG7skvv/Y+r6V5VBdysuYcP9
	ws3J0NkoVziFroh1Mfz5t4d+LDm6/VmdsYgtrHV4hkzBr341yz9MmptXRijnL2E=
X-Google-Smtp-Source: AGHT+IE31xyXAQiWXlldG2UNnWUTBPkwaZr0QcS45UwtURwADr+zzFGrAFhVxk0eW5d0FTe+jo+2rQ==
X-Received: by 2002:a5d:4a4e:0:b0:343:c3b0:ee39 with SMTP id v14-20020a5d4a4e000000b00343c3b0ee39mr1259281wrs.5.1712740273042;
        Wed, 10 Apr 2024 02:11:13 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:d4a6:5856:3e6c:3dff])
        by smtp.gmail.com with ESMTPSA id d6-20020a056000114600b003456c693fa4sm9079086wrx.93.2024.04.10.02.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 02:11:12 -0700 (PDT)
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
Subject: [PATCH 02/10] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
Date: Wed, 10 Apr 2024 11:10:55 +0200
Message-ID: <20240410091106.749233-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240410091106.749233-1-cleger@rivosinc.com>
References: <20240410091106.749233-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Zc* standard extension for code reduction introduces new extensions.
This patch adds support for Zca, Zcf, Zcd and Zcb. Zce, Zcmt and Zcmp
are left out of this patch since they are targeting microcontrollers/
embedded CPUs instead of application processors.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 4 ++++
 arch/riscv/kernel/cpufeature.c | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 543e3ea2da0e..b7551bad341b 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -82,6 +82,10 @@
 #define RISCV_ISA_EXT_ZACAS		73
 #define RISCV_ISA_EXT_XANDESPMU		74
 #define RISCV_ISA_EXT_ZIMOP		75
+#define RISCV_ISA_EXT_ZCA		76
+#define RISCV_ISA_EXT_ZCB		77
+#define RISCV_ISA_EXT_ZCD		78
+#define RISCV_ISA_EXT_ZCF		79
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 115ba001f1bc..09dee071274d 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -261,6 +261,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
 	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
 	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
+	__RISCV_ISA_EXT_DATA(zca, RISCV_ISA_EXT_ZCA),
+	__RISCV_ISA_EXT_DATA(zcb, RISCV_ISA_EXT_ZCB),
+	__RISCV_ISA_EXT_DATA(zcd, RISCV_ISA_EXT_ZCD),
+	__RISCV_ISA_EXT_DATA(zcf, RISCV_ISA_EXT_ZCF),
 	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
-- 
2.43.0

