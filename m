Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E25433B6C5
	for <linux-doc@vger.kernel.org>; Sat,  7 Feb 2026 10:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770460119; cv=none; b=Vw8BlwvD9lyvkPon+nByKoXzhX25Rgmc4qupP74AstneifS0ZH5X6rP+UOCCxEl1hKdgBaiaYCJ8f5S4KEMZoX2ehFuIaEiI4uDC6tAPPJNQznobQKQxQR31z2KMtONYqzKLOkZjcGiqrFmiZn/Umv49T0HJddQyPpFz4M05NUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770460119; c=relaxed/simple;
	bh=54dIq6MiMqlGNMO5UEHpOfyeI5V96fYgxN7YvFsoeOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P3qFCfwwEizEb9gtC5Rr6peZj+ZcR8Uzi5cGjK7xDWT7yz3+R7WbIkL7YXc4xJpFihnf6W3ECGvNIZnCpslYp+DufRpE9UcBuqvjLaVGkbq1XSUsxE9V2ft3A0aqzAv2tA0bh9b7J09PYhiUw1xkwCuV1XOo6niw5v8NdugQUtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ez2BeEIr; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ez2BeEIr"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so29911715ad.2
        for <linux-doc@vger.kernel.org>; Sat, 07 Feb 2026 02:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770460119; x=1771064919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CU5Aha03/+6mFH7XzcL+dyKhPjDRJyW+j5FgiEHyxWA=;
        b=ez2BeEIrifBh0NDTDhi/Q47PSyo2vIp+ZJ0vAujz2fL7Iv+2mfsqQLQ26HVrjAqkdQ
         WzHeN1cYtymDFM1Lk9ErKsmtQmi6ZbFQJ1wFbEZic0GFtyP8OlnW5OoTZ5ocyNw8BXP4
         TYeyfaBJIV//VoMsjbjGYjcuO25jfuK+HOA85yEU/kWcCHAezKcMOTjoRxH6BIAWRwKC
         ns3Bjgp88e2pWTCsA4GOjDdsl7eJYVq4STPlts+GTKyIAHvuHiwz6kkII7dGEixE+x1y
         HhioYGVeR7RuOxmIi6vZqdKOErv8mKVxORrkRABwpzMb7Dxn2wsdU6gRanyYGpDKV+FV
         5tPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460119; x=1771064919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CU5Aha03/+6mFH7XzcL+dyKhPjDRJyW+j5FgiEHyxWA=;
        b=Y2zUyGlasMeZmKMsBJBkSikPIe8iRr9hEz9rUy/qsCzaUuzWe5f1EcTonOYTXDvipH
         ntpvEcI7Mht3oZ4id05oBtRMK3wD0SW2iVtwqtLrTSksW1ESLt87r2EN/DRS/nyEtBoi
         e3tnGUR+lJBozVAX4NAJdVF+t7U3k0MIU51M7b2G4gHCwIOMiC6VmC/M1yCZIa4PUyA/
         62CYqrq++Tx37pp/+z3rDDEl5iq55YyMzHKPnZiSmoE+H5mzYupvhUMgg07HdWhTzjG/
         MCb5DctuAikz1RBHKErgYVbGmLrD1IJkLfk7u+oBTvrsKSNwRGqxVTK1Y3yDN3+/660Y
         jB8g==
X-Forwarded-Encrypted: i=1; AJvYcCXjIsQvUgBUmyU8DJq+Xls+0EjN8RJzDE/O2XwX116j9lXR2aEPcNCAct7ESvvQ3rB1HXtJIxl+Vls=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRC7WwqfLb1tORpVMRsIJuZHl1q9Je96vtkWhZ9XVJN9O5hRTY
	yxTH/YjFHMtD0Q9stDjCZbNdcgsZIVWt8lTpJU5tS/gA6Gu6hyzlgWCL63Vje1AAVpA=
X-Gm-Gg: AZuq6aKksXi02A7xOp8mwNbSix7mIOuEI6EhlWgbITeUr0fqVZedA550UOFr7YsZBH1
	SL4FycLeSHly9/49hfKRsjxYk+/kssh97CusdIgLEZlBoxnXwaJW63tv5s0LAZFGOMpvCsqHrb1
	NRmR+YMDuTH/TuXAvnYfiu6ct1t38DBUPfHi8f2ry+INYoR2OhW07visITZ//wZWeenlb/RlXvR
	DkNCsLO6B+atFvqK+LmbTO2pf13IM7RA4a6Cdo99XOA4HVkwx1r4NC7F2pKgnljvZyMk6VaE75U
	3GXWux3gHUGAEauNboRlobbDPdbch37Seked1cD20JGYSRb8hH9nhwNU6qJVkrx87tJNNGMELca
	bEdMNSnvItG92gUOHAXvamPEMWJlkJx44uVdP+7IJLTu5fIW3FSV+wExNeDiF7e9gSYpJknJ2P5
	Q8so9nmDFlVxD3UmQ1HdV1H8WtGVkDFn7MlShlpNsCqemk9W/Fi28sk/DZgcGcSN4q
X-Received: by 2002:a17:902:da91:b0:2a0:c5a6:c8df with SMTP id d9443c01a7336-2a9516cd2fbmr58164775ad.21.1770460119068;
        Sat, 07 Feb 2026 02:28:39 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a638a1sm46516555ad.17.2026.02.07.02.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:28:38 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 07 Feb 2026 18:28:01 +0800
Subject: [PATCH 7/8] riscv: cpufeature: Add parsing for Ssccptr,
 Sscounterenw, Sstvala, Sstvecd, and Ssu64xl
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-isa-ext-parse-export-v1-7-a64d3a8bc20a@riscstar.com>
References: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
In-Reply-To: <20260207-isa-ext-parse-export-v1-0-a64d3a8bc20a@riscstar.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2

Add ISA extension parsing for five supervisor-level extensions ratified
in RISC-V Profiles Version 1.0:

 - Ssccptr: main memory hardware page-table reads
 - Sscounterenw: writable enables in scounteren for any supported counter
 - Sstvala: stval provides all needed values
 - Sstvecd: stvec supports Direct mode
 - Ssu64xl: UXLEN=64 must be supported

These are simple extensions with no dependencies.

All of them are labeled as mandatory in RVA23 Profile 1.0.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
 arch/riscv/include/asm/hwcap.h | 5 +++++
 arch/riscv/kernel/cpufeature.c | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 5a050fae5302c7717596799967d8d514e7dfc536..75f64f5b7355db6ea5218f544ceda3be9619a58a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -118,6 +118,11 @@
 #define RISCV_ISA_EXT_ZICCAMOA		108
 #define RISCV_ISA_EXT_ZICCIF		109
 #define RISCV_ISA_EXT_ZICCLSM		110
+#define RISCV_ISA_EXT_SSCCPTR		111
+#define RISCV_ISA_EXT_SSCOUNTERENW	112
+#define RISCV_ISA_EXT_SSTVALA		113
+#define RISCV_ISA_EXT_SSTVECD		114
+#define RISCV_ISA_EXT_SSU64XL		115
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index fee5b20bb171334e8ca60af25485f43a9acef619..fff35a3e85db70f5610df2667f2b4f45f091cb2b 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -643,9 +643,14 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_supm_exts),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
+	__RISCV_ISA_EXT_DATA(ssccptr, RISCV_ISA_EXT_SSCCPTR),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
+	__RISCV_ISA_EXT_DATA(sscounterenw, RISCV_ISA_EXT_SSCOUNTERENW),
 	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_supm_exts),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
+	__RISCV_ISA_EXT_DATA(sstvala, RISCV_ISA_EXT_SSTVALA),
+	__RISCV_ISA_EXT_DATA(sstvecd, RISCV_ISA_EXT_SSTVECD),
+	__RISCV_ISA_EXT_DATA(ssu64xl, RISCV_ISA_EXT_SSU64XL),
 	__RISCV_ISA_EXT_DATA_VALIDATE(supm, RISCV_ISA_EXT_SUPM, riscv_ext_supm_validate),
 	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
 	__RISCV_ISA_EXT_DATA_VALIDATE(svadu, RISCV_ISA_EXT_SVADU, riscv_ext_svadu_validate),

-- 
2.43.0

