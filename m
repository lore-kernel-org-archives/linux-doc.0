Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93B41474CC
	for <linux-doc@vger.kernel.org>; Tue,  4 Jun 2024 12:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717505276; cv=none; b=rI+nxgH/xMzwJxynLdsk8t3I3fXhO+ykCbuBVxuwVn6Z1E16MwF640g/Lhw58ydVOK2/o6ugEOTXlQsMTrudd1XoFTwIF/foZoyjL5IuY2IffivvmNlWZbEIMCMBKKVx4DC09x3Y54zQpMvHohEZTLuyQ3dtGKq8m5zZ+zF7zf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717505276; c=relaxed/simple;
	bh=3aU9whTA+Gu+pme3mlSjWHKlwBVj96/7tq5nouoIeBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kL+luXLpuSrSAuEaZeWeRcyv3prEBry5t1zHSVgxw3YAxsDQQWMfL5xuyIfCqjJvoInAyPS9qhDemwTmqAM8qddyv1w6cCtpCvFkMbH2F9ySFgeBYxfvh3R2Arsil54X+rnyyb43lnuXtcTr5ACB3R2Gsf0wMfCGcJUkapT7wsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=k7DKfveU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="k7DKfveU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f4c043d2f6so1771505ad.2
        for <linux-doc@vger.kernel.org>; Tue, 04 Jun 2024 05:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717505273; x=1718110073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/zDxQ1wNU0fShOzqJmwZ3vgRBHHUpydDqOkR2GCFDo=;
        b=k7DKfveUgRxM6k0i+AkRsV/OiwpRdMl/T1FTRMZQmsMW9l+x8CBZJrqvCLPC9lp0HP
         KhavaPSYEk0OFjJVLlGac0X53ypLzLLUmukVQO15hpSkzUYRS09M6RWdDMrWD67+XV2A
         gC1ChAoyyGYZntkP0QkWxKE+KVLa2EAFGQtm/88PLmUYZKCbMpfx9kJgFbAmCSnHt6pk
         ywh3+85Q2X/dsTNj6Dm9OBzB1qDEoYQH5o//ntttbFIzyoYHv9xcw260qnpqDAzYjcgB
         dxxWP6MHQpe/o4wNPlmt+TDW54Lq4QM6fYfCoDSL9U6TwAJ+EaNfj4+HBxS84D0FTcvu
         3gIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717505273; x=1718110073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/zDxQ1wNU0fShOzqJmwZ3vgRBHHUpydDqOkR2GCFDo=;
        b=m+P5iiun2GHjDMiCgKAJMJeGPsDSHbt1EaYvgnOP3aHFe87HMP9RLKy4itRIkHr+ZJ
         3Y5Pm3+57Olnk6Pnt5Kk1YnJEhRwM7CrCNiChSLZAJHAYsl+PelOWNHqaYgNCzZAj06E
         kTV4JOs25m2nlG3OzxTbZGShciwUD1DT9FH4j+3HlhXPWnclTVAxZEJwm8oH5Y0s+nYh
         9J/Api/BekLM9O507DsbCxcq2yzq50doh/V98C4+UP6fWBJa5THoRzkRKto8qzjYZsJ2
         WdzEmv6VJlEy0O+4O4uK3zwRA44GlIQw4d2Ac5xRnMzAS6uS0ERuHYsGrOR19K1AyQWv
         7rlQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9+3xjF5Cn04SKJ+/3iZb1AKPBNYzb/QsXTM4Mtu5vZ1iZJGIvJPZy0i98/Y7EcbMYbS5pcYQpY5njjpplnQNh3cBwHK2rec8e
X-Gm-Message-State: AOJu0Yw9Ce4KWVxy7f8CrnD0gh5VCyMnIrki1+jzO1lMIWF35Myxo/+0
	1sfnzUT9ikRUyfVd9fGaelRU0bQCETecZ+k8GNAf5Z1nbODprEBpuJtJYhXemvo=
X-Google-Smtp-Source: AGHT+IHL5IgKhDmX6Kc3c3T4qmZjDYR+RyEsuG7i3u6/l8X2M2rVeZab4G99cMOKYRyDxecIvsMepQ==
X-Received: by 2002:a17:902:f68b:b0:1f6:39cc:46cb with SMTP id d9443c01a7336-1f639cc52ccmr132738995ad.5.1717505273278;
        Tue, 04 Jun 2024 05:47:53 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:327b:5ba3:8154:37ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6323ebc69sm83042885ad.211.2024.06.04.05.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 05:47:52 -0700 (PDT)
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
	linux-kselftest@vger.kernel.org,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v6 09/16] riscv: hwprobe: export Zca, Zcf, Zcd and Zcb ISA extensions
Date: Tue,  4 Jun 2024 14:45:41 +0200
Message-ID: <20240604124550.3214710-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240604124550.3214710-1-cleger@rivosinc.com>
References: <20240604124550.3214710-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Export Zca, Zcf, Zcd and Zcb ISA extension through hwprobe.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 20 ++++++++++++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h |  4 ++++
 arch/riscv/kernel/sys_hwprobe.c       |  4 ++++
 3 files changed, 28 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 48be38e0b788..cad84f51412d 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -196,6 +196,26 @@ The following keys are defined:
        supported as defined in the RISC-V ISA manual starting from commit
        58220614a5f ("Zimop is ratified/1.0").
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZCA`: The Zca extension part of Zc* standard
+       extensions for code size reduction, as ratified in commit 8be3419c1c0
+       ("Zcf doesn't exist on RV64 as it contains no instructions") of
+       riscv-code-size-reduction.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZCB`: The Zcb extension part of Zc* standard
+       extensions for code size reduction, as ratified in commit 8be3419c1c0
+       ("Zcf doesn't exist on RV64 as it contains no instructions") of
+       riscv-code-size-reduction.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZCD`: The Zcd extension part of Zc* standard
+       extensions for code size reduction, as ratified in commit 8be3419c1c0
+       ("Zcf doesn't exist on RV64 as it contains no instructions") of
+       riscv-code-size-reduction.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZCF`: The Zcf extension part of Zc* standard
+       extensions for code size reduction, as ratified in commit 8be3419c1c0
+       ("Zcf doesn't exist on RV64 as it contains no instructions") of
+       riscv-code-size-reduction.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 575b95744843..fba3d74154b1 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -61,6 +61,10 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 35)
 #define		RISCV_HWPROBE_EXT_ZIHINTPAUSE	(1ULL << 36)
 #define		RISCV_HWPROBE_EXT_ZIMOP		(1ULL << 37)
+#define		RISCV_HWPROBE_EXT_ZCA		(1ULL << 38)
+#define		RISCV_HWPROBE_EXT_ZCB		(1ULL << 39)
+#define		RISCV_HWPROBE_EXT_ZCD		(1ULL << 40)
+#define		RISCV_HWPROBE_EXT_ZCF		(1ULL << 41)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index fc6f4238f0b3..11def345a42d 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -113,6 +113,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTPAUSE);
 		EXT_KEY(ZIMOP);
+		EXT_KEY(ZCA);
+		EXT_KEY(ZCB);
 
 		if (has_vector()) {
 			EXT_KEY(ZVBB);
@@ -133,6 +135,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 			EXT_KEY(ZFH);
 			EXT_KEY(ZFHMIN);
 			EXT_KEY(ZFA);
+			EXT_KEY(ZCD);
+			EXT_KEY(ZCF);
 		}
 #undef EXT_KEY
 	}
-- 
2.45.1

