Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3DD31077A
	for <linux-doc@vger.kernel.org>; Sat,  7 Feb 2026 10:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770460107; cv=none; b=o609deZRhFlDiBp+zO+RBMct4wWiOQ3bjWd2E8lo/pAaUNEyGHSuAvZ166mkRXi2WlmdIkqCZBsLThUrq8vhzAsI6H0zb251MYTJF751vqw8l+HxKEH+u2geKpU5GCp/owhK+iCzZEISVHehiKjOHTcTQaq+kVdmUGj13UQ5p7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770460107; c=relaxed/simple;
	bh=X9ORpOySiXCnLy6KrNLXLU/EUPdpwPjHWkU3DkcPMaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rCwounk/lmPLo8X31v0mAix7+OcovKARjC/HMg/xa8N/jg9scMjljT/3lCPf2EDB1BfUpL4NZmejlz08o6WHw+emnf+m/RuqQzcpH8m7bINdKrfLWHCeN6bNc7Ycz41whgeSMqsE2VmRyq5/HrYBl4aAF4xO7k9KNsO+dQeIqBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=BpmKIch4; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="BpmKIch4"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a9004e4239so14604475ad.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Feb 2026 02:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770460107; x=1771064907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8+8e2Muqu/Yew07HhgrpNy1KIqgEE5XsSJFOA8tRxU=;
        b=BpmKIch4Lf8yx7GMfhoQRDNzFQLLsnty/ZVWbQteOECmuvQdH1VTvx79qh0Dl6RFLx
         zGgHL3eJTWoVJItySvn6G+KueERhSgml7FUbN+N0nCMGyd3QQxP22s+csfYhVVUW5JIZ
         D29TTTbv6ylUm5QIO3zac5pwixr63DsKSHVq8umspDbRP/RC/7gOFxrR/imCLRU2Nb8y
         Q1rNGTtq8Z6B3x50QVqTK0u6k9XHZzvkKuSm+pMLBWR7eDYUBfloNaqWeitabKcBQs8H
         Jpdl1u+dsLJDDdDTOvHJcNnjVIyplTQCIuOHPAGsqudgLGc0u8M/pcDwzYVBM7zgPnWB
         vlpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460107; x=1771064907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+8+8e2Muqu/Yew07HhgrpNy1KIqgEE5XsSJFOA8tRxU=;
        b=My9WIYqCjIfOxUdqLqFt1ThhYJWBSqBN11OtN306zy9XUwSSP20NkpWljOLcbtGIry
         TXPTU7FNJusvO23MM/acm0MKO7IOz4ZGVvuJ0ed48FsJRlvBbcanjqd7SVwQc2YtcD41
         bi91kyIIXYhwpQ9WiXrAWjffCTJa77eV3EWyyEh5a9fc4lSAZbLnyLpb9yx37tSYsSp6
         0WUprtkC38zxq0GHMvh6C6ZwP3mvBrhUjH8T3R2aJViRkjNzGT+FETM7w9NDOs1mOtg8
         nx804wmcI5qVijo1w5LcZGd+r8DRemvu0f96PlXfcfgVd2b/UlDewcFgnipPDuNX0GcH
         icdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtiAffcux3oZdlUHfOFH3FaO7YEzFD0ya0rmf3RzQ6GFbDi0aMhFY9LEMDQAAayNkrx05cG4i3Ew0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJrm3XnAIwQgzWOLHqEn5U/NzOO2juum1IUA3cT+mbRFZEhliL
	ZsuvtwMleWE+ajcraCJtB0xxl78D5S31E3htzmDLO2uQ/d1r6xeC+khTM6WhxrW8EY0=
X-Gm-Gg: AZuq6aIDTbw4dN/4YNQcaaeA6iSEMg4JnN2GzZWVymiaBQxt9apoDEH/5qIX4MFQgTT
	2+Ko+lxtzyKc1MZL26YBswSuoK3uIo7jcF/zLj9Rud+o+A0yTXTfm8VfVU8Nuhj4Ov3GPumK6J/
	xYft9aYwNo2z/8X4EFeqZFalCL2ChPd/qebb7DmcHWt9QzPJtYX391vkz5ZwXWXRLW7JBgYlGts
	HdQDwErYaWLH7hz1Txlb/IRtTEUPpqDisA4xzgKhteD8WFD6fRPJTEnqONZ+0TLnnUNlPzg8lSY
	2BSR6qXx+OfrWP+W1LVen2GLWXC986qEk/aM9T2003b7M42DwslOs6qfQidP3d7e34JJuSamrTy
	X2m2a0mOuqPnzKUH821q8RoM7SCotOW400g1vZ+F9j461kDOI8wS/CvV0COYp+d1bs8LvZYUBHf
	G6zSf2N6LfQKRNEvPk+BNL5fKNtcFy9tTTN5GuQRMHTDCMsMCucSU97A==
X-Received: by 2002:a17:902:ce09:b0:2a9:30d4:2b0c with SMTP id d9443c01a7336-2a951826630mr55155985ad.46.1770460107028;
        Sat, 07 Feb 2026 02:28:27 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a638a1sm46516555ad.17.2026.02.07.02.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:28:26 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 07 Feb 2026 18:27:58 +0800
Subject: [PATCH 4/8] riscv: cpufeature: Add parsing for Za64rs, Ziccamoa,
 Ziccif, and Zicclsm
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-isa-ext-parse-export-v1-4-a64d3a8bc20a@riscstar.com>
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
In-Reply-To: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Add ISA extension parsing for four memory system related extensions:

 - Za64rs: reservation set size of at most 64 bytes
 - Ziccamoa: main memory must support all atomics in A
 - Ziccif: main memory instruction fetch atomicity
 - Zicclsm: main memory must support misaligned loads and stores

Za64rs depends on Zalrsc (or the A extension, which implies Zalrsc).
Ziccamoa depends on Zaamo (or the A extension, which implies Zaamo).
Both use dependency callbacks to enforce these requirements.

All of them are labeled as mandatory in RVA23 Profile 1.0.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/include/asm/hwcap.h |  4 ++++
 arch/riscv/kernel/cpufeature.c | 13 +++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 35e87e4a8475a9201e84e7f9f8a4d10dfd9e4759..5a050fae5302c7717596799967d8d514e7dfc536 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -114,6 +114,10 @@
 #define RISCV_ISA_EXT_ZICFILP		104
 #define RISCV_ISA_EXT_ZICFISS		105
 #define RISCV_ISA_EXT_SUPM		106
+#define RISCV_ISA_EXT_ZA64RS		107
+#define RISCV_ISA_EXT_ZICCAMOA		108
+#define RISCV_ISA_EXT_ZICCIF		109
+#define RISCV_ISA_EXT_ZICCLSM		110
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 68c94fe29cd1b26925fa38a5c877d699bbc88e25..fee5b20bb171334e8ca60af25485f43a9acef619 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -347,6 +347,15 @@ static int riscv_ext_zalrsc_depends(const struct riscv_isa_ext_data *data,
 	return -EPROBE_DEFER;
 }
 
+static int riscv_ext_zaamo_depends(const struct riscv_isa_ext_data *data,
+				   const unsigned long *isa_bitmap)
+{
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZAAMO))
+		return 0;
+
+	return -EPROBE_DEFER;
+}
+
 static const unsigned int riscv_a_exts[] = {
 	RISCV_ISA_EXT_ZAAMO,
 	RISCV_ISA_EXT_ZALRSC,
@@ -552,6 +561,9 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(ziccamoa, RISCV_ISA_EXT_ZICCAMOA, riscv_ext_zaamo_depends),
+	__RISCV_ISA_EXT_DATA(ziccif, RISCV_ISA_EXT_ZICCIF),
+	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
 	__RISCV_ISA_EXT_DATA_VALIDATE(ziccrse, RISCV_ISA_EXT_ZICCRSE, riscv_ext_zalrsc_depends),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
 					  riscv_cfilp_validate),
@@ -565,6 +577,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zimop, RISCV_ISA_EXT_ZIMOP),
+	__RISCV_ISA_EXT_DATA_VALIDATE(za64rs, RISCV_ISA_EXT_ZA64RS, riscv_ext_zalrsc_depends),
 	__RISCV_ISA_EXT_DATA(zaamo, RISCV_ISA_EXT_ZAAMO),
 	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),

-- 
2.43.0

