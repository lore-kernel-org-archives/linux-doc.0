Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9574424168C
	for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 12:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744892712; cv=none; b=Wi9xlENLQrA9stvwDacgyaBU3uRt8AvKXrJjVZBEMYqUsbjRIJZB944gIcmGqci4o9PmThzSP2J3P+lpPkMH4w09maE6e3RtHXFI8hEuFHKaBoXlHoDhL3yjONJ9+4875ovdaHKqxhWOQ4WtJuE6q0sQUar4R30GC/XAAZtZ/RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744892712; c=relaxed/simple;
	bh=Y2lqZNq6iLqWqOnSydPOH5JyZ2wkgBYP5IWsduUOFdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KH+qmkztNFXYccHERaGXd4hEvO/A1NUy2lk3jbHa6i7iu/g6QfXR1iM1r0jXlMyChp4Udu4tPmFUoL9hUMPRpyyOK9DR9A8ewAqaX+T4w/HZWS8EeM2ILtwpMGNSBg9pCZjp0WDRt78WpLTwT9nFPtgh7ExEFkYKf90VaEK1gY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ki1fBIHL; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ki1fBIHL"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2295d78b45cso10722225ad.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 05:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892710; x=1745497510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPTklWUDdxW6D5Ost9jmiUOVbTQmyFTBQdSARUhAxLU=;
        b=ki1fBIHL49ytpWv4z9SYrRoy95lBCJ0DSli9Jrt4gG3l5hVK5uTiAkQFL4ZG48ByAp
         9+zreDoPqeBo2LtHMz/gYzfcOMDcyDiSoXoq0NjM1acWkLmAhz2t604Xv3t1ru8wLpy0
         /2WTeZlYL+j/ZHKVu7iri2IDJOBRrs0e9opbK5XTkOO1kKnGKWn4XS0YixGIT5fawPMp
         fNRkn18JJ4UffAdcyFZEKFCATVNVbdXlV8Cp4Behmx7Yb/G4dJ5GJFHzCWS6XZffUgl6
         7dQaGXcUsfgG2+sC0iTNazdcTnYU4lIaXuQ9ufuOSll/1mWEF8LIWdG/zVekZxubpNYE
         5iqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892710; x=1745497510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QPTklWUDdxW6D5Ost9jmiUOVbTQmyFTBQdSARUhAxLU=;
        b=AgFt0SAgKNbCO4G/88QiM1T8+DC+/SrdDfszZCQtL+eS8xmVtp0r7T9pBn6+RHW3eH
         gzZulgIE+NkCshXToA9g1d4Ynh66XkCG7hiDurmbfmKoOtNDiVHUtAnc7n1O3bzgiU7B
         uzrb/h4j25zHwWJz+jgmkqmDNokQneiNgg6+tNNgYdBrVqJU5MHNbBvA/2Wd9sByW2Ix
         n4wJ+KdPuCP9UaXhzjfF7BAvdr2Xiccn3zeH1DP/9+dpBWUoTy94HaHlvwGdgmfae7Cs
         x5acaiUl/OaBtddajLnzUAM1bqWGk/s94IFFns6SS1T57gabiXovKUHCMg1/is5CcUYP
         uQqg==
X-Forwarded-Encrypted: i=1; AJvYcCXlisKzQEvV4Ec4wZumPGdOOzdpIdiqnInop2DgdDjDHvApw2wkRjeiRYVRgSHN/Fk5ao6Pl4P/7Pw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMR32x67aK/bLVzKId4uGJ+6BB0su3ZY4tiyMWHQ5EVmYNdwQW
	Nbag1BEdKd2Vfr9z4aHRFj6sXF6mo9r3GYLWSe91rQ/FWNSMc16F1LNHqZITnc2yKIsjtPROw5o
	9
X-Gm-Gg: ASbGncsNngQEX1Grqzdey6N0nns/KCbJGsm28Ny8M+X7imUuwOpEMB71xJRSFEm7LQN
	DtdnUIdiAA8qlQ2UbnMri8Y3hTBzcOSvjU8Zgx6RTFZ2L3gtCNwR+XEt7OtroOCTtnRAdmdFSe5
	mOZy2e14hGkt1gnugzUjGwOzHvIeqyrDvpu+CS/sAvbCEXlGDVKCQbHGXinLT1BEEy7DvLkKn6e
	3QVshhjqSLFDwyF9B5NlCQGdIeQNQOgggNJ7UavsYWg+XiW5y2CK8B+XSj6+whKQ5nEqn/0L5LK
	gQUkPKBiMdgM3NGj4zDe5megtVR+YH5ab7CHdpseQA==
X-Google-Smtp-Source: AGHT+IFHVZ6ZCfLmCo/4Wa4FBs9EaC8NbnVck/zV+hCmYDXn9aie+ex4Lrhj5kJpm3i3DZVuvfUSqQ==
X-Received: by 2002:a17:903:2a85:b0:229:1717:8812 with SMTP id d9443c01a7336-22c357b1125mr88299155ad.0.1744892709956;
        Thu, 17 Apr 2025 05:25:09 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:25:09 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 08/13] riscv: misaligned: move emulated access uniformity check in a function
Date: Thu, 17 Apr 2025 14:19:55 +0200
Message-ID: <20250417122337.547969-9-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Split the code that check for the uniformity of misaligned accesses
performance on all cpus from check_unaligned_access_emulated_all_cpus()
to its own function which will be used for delegation check. No
functional changes intended.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/traps_misaligned.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index c99d3c05f356..a0007552e7a5 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -666,10 +666,20 @@ static int cpu_online_check_unaligned_access_emulated(unsigned int cpu)
 	return 0;
 }
 
-bool __init check_unaligned_access_emulated_all_cpus(void)
+static bool all_cpus_unaligned_scalar_access_emulated(void)
 {
 	int cpu;
 
+	for_each_online_cpu(cpu)
+		if (per_cpu(misaligned_access_speed, cpu) !=
+		    RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
+			return false;
+
+	return true;
+}
+
+bool __init check_unaligned_access_emulated_all_cpus(void)
+{
 	/*
 	 * We can only support PR_UNALIGN controls if all CPUs have misaligned
 	 * accesses emulated since tasks requesting such control can run on any
@@ -677,10 +687,8 @@ bool __init check_unaligned_access_emulated_all_cpus(void)
 	 */
 	on_each_cpu(check_unaligned_access_emulated, NULL, 1);
 
-	for_each_online_cpu(cpu)
-		if (per_cpu(misaligned_access_speed, cpu)
-		    != RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED)
-			return false;
+	if (!all_cpus_unaligned_scalar_access_emulated())
+		return false;
 
 	unaligned_ctl = true;
 	return true;
-- 
2.49.0

