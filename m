Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 194FA47A4F
	for <linux-doc@vger.kernel.org>; Wed, 20 Dec 2023 15:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="NzBKYKLU"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40c32e205fcso9882045e9.1
        for <linux-doc@vger.kernel.org>; Wed, 20 Dec 2023 07:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703087866; x=1703692666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3BPMv24jdGVieLmHRP/43iA/a2qmOUrYJR1MkKgXts4=;
        b=NzBKYKLUmxix01P/sgfDv+lGEi7erCjcNxtG8VaOb3wwaYz9gHGcpvGc0elpDg1Cej
         G+lA/Xzo5MNGMS6vilbzv/5j8BgNg6dCs+ZDq+QlxHmHam+uwsvAtPvRt/38gqmh/Ede
         c+Bwmgxo+vEoHQEbC0sSeqEp8CFFFj3M6zVdc114YZoxhkcdw3yg/WTCUzXfR3uqT20e
         7JSvv9GMYskaL1Q55bmcnh12izXxsS3L6YY1XBS4dyfa5Eda0kXRi+/Tksjee9g0Jwrs
         qvF/1oQxrfUyZ2K1Gr/mjMyNTfU1PkeiWf0logVke+NawHkUuc2LC83iyCLd8Lel0Sfy
         038g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703087866; x=1703692666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3BPMv24jdGVieLmHRP/43iA/a2qmOUrYJR1MkKgXts4=;
        b=WHQNWxTXj0jkKzZb/Jj2xnDJPH7GKVp645ir+mverCTA+DAhy+Cwas9KdRVxAtvpFO
         n8IV3vabX/752E2LEzArMmmmbjewVqNGBzorxEK1sqZybH8uz4CYC5r1yuKxqvtVpKNy
         UZunzndhWo2eO3yrq7lpVtBK4kQHjQ6uG5NCHJ4WihgvSlRkXAtZf64Nu01KuL4OevT3
         LwlNRnHJErm8wZJl2mcbwZe+nTMyMc+LhuQefydReTs9/AFKLuG8GWVG/othc0d7QWeN
         TPjlqclh0VyKfqiWYBJ3x17CjfT0qlZpVNiVkzqxGor8PB/IdcbTj7pvRjh3yceZUq+e
         qe0g==
X-Gm-Message-State: AOJu0YyMFWRhy7Tn6YjbQ7AUUyoZDixcUpvr29Jj+GpBNzWJk4xixUhH
	QNDzpCkwBrvm89NWsKtUnhv8KLdY3yVKZ1YYEX50GA==
X-Google-Smtp-Source: AGHT+IHhRAXXz42/u2vdF2rRn+pcNPzJD+CGhaPX7dsedwK3pxf8bg5I86xeWYEngCYQhOlYz8+CIQ==
X-Received: by 2002:a05:600c:3b98:b0:40d:3880:b046 with SMTP id n24-20020a05600c3b9800b0040d3880b046mr1065572wms.4.1703087865822;
        Wed, 20 Dec 2023 07:57:45 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:3eae:b70:f27f:7aa1])
        by smtp.gmail.com with ESMTPSA id h18-20020adffd52000000b003366af9d611sm7279693wrs.22.2023.12.20.07.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 07:57:45 -0800 (PST)
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
Subject: [PATCH v2 5/6] riscv: hwprobe: export Zacas ISA extension
Date: Wed, 20 Dec 2023 16:57:21 +0100
Message-ID: <20231220155723.684081-6-cleger@rivosinc.com>
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

Export Zacas ISA extension through hwprobe.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_riscv.c         | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 10bd7b170118..bff68004ad43 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -165,6 +165,10 @@ The following keys are defined:
        defined in the RISC-V ISA manual starting from commit 5618fb5a216b
        ("Ztso is now ratified.")
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZACAS`: The Zacas extension is supported as
+       defined in the Atomic Compare-and-Swap (CAS) instructions manual starting
+       from commit 5059e0ca641c ("update to ratified").
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 01ac3dc196e5..ac65bb43c8e7 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -57,6 +57,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZVFHMIN	(1 << 31)
 #define		RISCV_HWPROBE_EXT_ZFA		(1ULL << 32)
 #define		RISCV_HWPROBE_EXT_ZTSO		(1ULL << 33)
+#define		RISCV_HWPROBE_EXT_ZACAS		(1ULL << 34)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 6564fa9e7a7f..6c680c75ac0d 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -175,6 +175,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZKT);
 		EXT_KEY(ZIHINTNTL);
 		EXT_KEY(ZTSO);
+		EXT_KEY(ZACAS);
 
 		if (has_vector()) {
 			EXT_KEY(ZVBB);
-- 
2.43.0

