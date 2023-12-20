Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC26F47A61
	for <linux-doc@vger.kernel.org>; Wed, 20 Dec 2023 15:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="fDYzBUSL"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c317ba572so13868665e9.0
        for <linux-doc@vger.kernel.org>; Wed, 20 Dec 2023 07:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703087867; x=1703692667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TXiIygoI2xfoAtWyxNJaEZbhAX2C42esk/G1o5mFVH8=;
        b=fDYzBUSLvR2PzV2deSxttD8JpjEI3lHd1RYNM1OAnvZjSDm9fzRHOdb2RE3BnzbbVE
         nFmjtTmnynnCMZ0jGtXncqEff5/6dGf/CJLED1klg4ukqF5dLN7XfDZVG5CM+js2CwKY
         LmraTAcKYf2xmG0BN6OFgBi3l4Jaj5hRFF19Tr6SzplWuLJ2YJ+OY2xSjglqKOXud8Rz
         d5QURqcciZ34J8XoTfmMph6eiQTyOpag8YOLULbUGcWocG2edn15xvuzWYwHSWwS0CVh
         uSDnztPFX+UWcy+5k7cr3OjZgUHZAF3huqGAj4zFpKQVdPFHV8wojykglUyRNfkkxd4W
         1DKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703087867; x=1703692667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXiIygoI2xfoAtWyxNJaEZbhAX2C42esk/G1o5mFVH8=;
        b=vx5CidjCfRsIUHNRNrS7BraQbUmvrzbGGM+5hksn+hV4hHZ8gXWk9/P8WT9HwAQNrq
         YJ2AbbQ02SCLNHjTFpCjGRBUT4TOD/1/3RQ/cp44yhGW3Y3BzzsWbwmOURWyp9wwqdTC
         WdEmrxWABcEXyXgGmVYIjWsXGxvfnF/kb6Rpb0YwSdFOr8qysTiqpeIyDmui5CHbbal3
         imvmDuNjbTRmPGwwck2SUoKshWsG4aqeNDDbvAEAZLBh3am6DrAu8DnbsdU2rpCRxtrZ
         uWPYAHBgEjDT560tcxoVeCLnhKXQYMAvQJX0rNRNWyfz8C1rXG+MAFn5vCHmaZoyOyEc
         PjYw==
X-Gm-Message-State: AOJu0YzhUyR3Fx5kem5PA9QNAwJh0ul9PfRW883dGDiLDmaWX7AAtzJ2
	q7b2cUJDBcmpMwRsScGuXw33z5ERftiKamoHer3IMg==
X-Google-Smtp-Source: AGHT+IEpr+96oxZFiK4cxomHHqE/jg1PvdGozQiMvvlQ4NTHaFlfmPa9ipv0kbSLSizkLF3AkktCuw==
X-Received: by 2002:adf:e2c4:0:b0:336:4a0e:4284 with SMTP id d4-20020adfe2c4000000b003364a0e4284mr12246378wrj.6.1703087867017;
        Wed, 20 Dec 2023 07:57:47 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:3eae:b70:f27f:7aa1])
        by smtp.gmail.com with ESMTPSA id h18-20020adffd52000000b003366af9d611sm7279693wrs.22.2023.12.20.07.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 07:57:46 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robbin Ehn <rehn@rivosinc.com>,
	Gianluca Guida <gianluca@rivosinc.com>
Subject: [PATCH v2 6/6] riscv: hwprobe: export Zicond extension
Date: Wed, 20 Dec 2023 16:57:22 +0100
Message-ID: <20231220155723.684081-7-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220155723.684081-1-cleger@rivosinc.com>
References: <20231220155723.684081-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Export the zicond extension to userspace using hwprobe.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 5 +++++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_riscv.c         | 1 +
 3 files changed, 7 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index bff68004ad43..ee320fe7581b 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -169,6 +169,11 @@ The following keys are defined:
        defined in the Atomic Compare-and-Swap (CAS) instructions manual starting
        from commit 5059e0ca641c ("update to ratified").
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICOND`: The Zicond extension is supported as
+       defined in the RISC-V Integer Conditional (Zicond) operations extension
+       manual starting from commit 95cf1f9 ("Add changes requested by Ved
+       during signoff")
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index ac65bb43c8e7..fd7af0dddb12 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -58,6 +58,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZFA		(1ULL << 32)
 #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
 #define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
+#define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 6c680c75ac0d..cca9b1e35647 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -176,6 +176,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZIHINTNTL);
 		EXT_KEY(ZTSO);
 		EXT_KEY(ZACAS);
+		EXT_KEY(ZICOND);
 
 		if (has_vector()) {
 			EXT_KEY(ZVBB);
-- 
2.43.0

