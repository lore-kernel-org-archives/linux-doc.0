Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="RfzSBK9S"
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15868136
	for <linux-doc@vger.kernel.org>; Wed, 13 Dec 2023 03:33:24 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40c495ab68cso5702115e9.0
        for <linux-doc@vger.kernel.org>; Wed, 13 Dec 2023 03:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702467202; x=1703072002; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKPObWVuIFXSRwOfIm7U25jwf++f1sQGlTYA9JTEt2I=;
        b=RfzSBK9SpNVuBJ654n3yp6K89HTEUNgLDz1Sbt6qD1ReJvEFqKJNWWjquoQuURed/7
         44oanJh4FfD1MTUJeQPIDNmOGHYMOfr3rZwDb1EWck4Hm/TM/6DOXF9J7bxb1uwvOJI7
         hmR0sqBCxhqSin/1N2o7WE9V7Qkjz5HsR2IKc+wPDvElfWdR4qHrySS82awQH0gPWgzG
         SjQhYrmxuYmJiZ7KEkg2tS0x08mZ7qU2Xo5JiXjzO7qAJwe99Mp5MUfRxG3CXhwEHqEl
         9KF8k0oRR+ccrWlyyOk++AVWrFr0TEGOuoocx30+8XMa/RDMy2RBfelCU9UmAW0IU0Es
         tfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702467202; x=1703072002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKPObWVuIFXSRwOfIm7U25jwf++f1sQGlTYA9JTEt2I=;
        b=XbdTWU3O8Ndnak70pj/FO1CNGqTu2sBhXUismCchrWQSp5YpS8/HcyPMfAEcT60/14
         EdvzeR8eEy8GbRg6RSvLhIAkaDSbCWIGkj7q++Ea6aA6OsLDuU2FdT6s7fSooR6Iy3El
         VQVN63VAtuFD+V3fp+J2cJwfJq+Re7xpTuiqDGw8nZehAuPWFqhRBZ5L232LzEMOdKX1
         9ow86i20EEwvvlmSGFQPh2eUvXN1kgSymM7y6m8ip3WXkvge26SdrXhm/WrEyyeilKSZ
         tMe//FsAwZfTDSn2lQ3/xVJuuIXyos76uSxbTWzLOaJ8qFBk4CRie5+0bp/aGbWuKpdd
         DsHg==
X-Gm-Message-State: AOJu0YxR2Y6gkIFxOrXJPM6di4l5LfVolPdGtyaPjT1h/dCDIB3k/KGn
	SJ+YQt1ypax8RZDOzdQdlxWPQKp6+lePG1+bzyk=
X-Google-Smtp-Source: AGHT+IFOAi6+jGGEZI3vEUxmpFwncaq2mLgc0WthEtql1NhoQKa77IbEBEbBVUbFXF2l0uTI44prGg==
X-Received: by 2002:a05:600c:3b23:b0:40c:2631:7c3d with SMTP id m35-20020a05600c3b2300b0040c26317c3dmr9593791wms.2.1702467201829;
        Wed, 13 Dec 2023 03:33:21 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:c564:f167:d072:5672])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm22433137wms.30.2023.12.13.03.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 03:33:21 -0800 (PST)
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
	Robbin Ehn <rehn@rivosinc.com>
Subject: [PATCH 9/9] riscv: hwprobe: export Zicond extension
Date: Wed, 13 Dec 2023 12:33:05 +0100
Message-ID: <20231213113308.133176-10-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231213113308.133176-1-cleger@rivosinc.com>
References: <20231213113308.133176-1-cleger@rivosinc.com>
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
index 510e49878834..a42c3b5d6bc3 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -172,6 +172,11 @@ The following keys are defined:
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
index 7ec4331122e7..4287aa391cf5 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -59,6 +59,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
 #define		RISCV_HWPROBE_EXT_ZAM		(1ULL << 34)
 #define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 35)
+#define		RISCV_HWPROBE_EXT_ZICOND	(1ULL << 36)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index abb0eea3ee08..d94f11534efa 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -177,6 +177,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZTSO);
 		EXT_KEY(ZAM);
 		EXT_KEY(ZACAS);
+		EXT_KEY(ZICOND);
 
 		if (has_vector()) {
 			EXT_KEY(ZVBB);
-- 
2.43.0

