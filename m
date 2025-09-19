Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B772DEA78
	for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 07:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758267482; cv=none; b=kQW2ERPpPZwoKmXpfFMN9T8iJ8NcXL1ykYcVoaHHPbCU0wkStQe5IsMyQCLNHl9ijQa0k1gzSfE6moqYWDbZHK5Wjjuk4Ji8bgTjYNOcfQ9VKA5WOdwAyz6qgy3hN9Mwcrz7SDBuDwm1hNhOJ1TSUQwcLKjMLk4E6PpNqNPSf0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758267482; c=relaxed/simple;
	bh=ny7Y87UCldoCAyN22m3dB64S4BMG+0HtGPlSRdbS+ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ui1PbpilRl+ng5Zl0ToAbtUjFE3H624i363fNsfRG5JrpIXuZgnHd+jzEOiXH2T1HqIRRE/baoj/d+bJmt+FvVwkxsIJ+pyFKvU5t8QVgN2riZUphQEHP2HpD3FzLoEshDfZISPzRTmDGPZ1R3rMCmTNUPqEoi6bCEooDFg+o/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=NGvft+cw; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="NGvft+cw"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7761b83fd01so1829908b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 00:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1758267480; x=1758872280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TLsLBJWdfVYa2JlLG/bj2PxPL4kYEdygRJ5GLCZsFlo=;
        b=NGvft+cwpOD6gUZN1ZSkAqe6YbS4jHbcoKFzSuVHrJzB0rJN6GUL+QIOBLUnjlQtLr
         jEH7bNBPYLhLIXag3CUNWbLGylLL+KH9nA6RZqNVAJZTTJeR+FR0S9JRCfH85leoQbq8
         6POFciiPZAwDj1XauVeYrHZRG0fq+9XQkC7BIDwrKFU57I+nNn7/9a/1264+GF9C0NyO
         K3FxX/hec6TAm0oWWXTErnHk9CmHg7y0kEWDIy66N50xUV8jfj8KYYbvuFCmiOTpb6fs
         hl22eqUBPIcRQfCo/UrxJ+fZBqhY7m0PoT5xXk6HlzR8z3IozxG+lcdmQD5dUhKwfnc9
         Az7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758267480; x=1758872280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TLsLBJWdfVYa2JlLG/bj2PxPL4kYEdygRJ5GLCZsFlo=;
        b=e6jMn5BBIyuKr0devysY8zuUNu+MmelpPtTMMshRzptj1hRJ1/1GwO9iL6ChH2URpT
         2SJwfLZyGjkHotJMVvK3S7hHJaDLo0suPurw88qjTfsA5ikUhRzeresOu4dKD3wgcZVF
         xVF6Q7n1ZkPLsMB/47jSoBOXJu72DLIaBVZYTyNnQUAc7xEjXjHuMoJFGJkeqka1ex8i
         CNqJGjljYd/FWp6wAKxzoCS34LRPI/Fsja0bjHdujgWAKzS1mXzsh2OEIZ0cI9pWafMy
         8gmb2u+OVNMxHpHwtoZ+euB1Ngwx6vnslNhJMghxQEEmNDpCYtTTKGQcLEb9pkD6PsQV
         M2Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUQUaWjKZL4CAiH4vwJ7t4VpBbh03tSZenHVR047RUpJb2Estf4YEUAl4XnPhLLzvOqgxogIOzkUMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwN0hI4sHWywtfZNFNXaEcbLdswlFr0GPTP9wz2UR4z/cFcLOIG
	y0JbZvybYVLMkkCw8ZCS8zSGNbA7D57byNSwK6hfy1z24xT83+B8APGB+M0oJW90nDc=
X-Gm-Gg: ASbGnct1KVFW3d8TcHPHf6aQqOOnQ6r+TosFh4DTM0LbVnnpipZBbH1kvh7vvM6xloO
	CF24H068vGRohHLVWnMQVYLx79Q1ghOmbmydx5klZCmZ1VSyMMn8zPpa72uXz71VqdpHRFNVn+F
	3Y7GVI/rHGh/042YsFhqd0zuhfuk0a1rrHohH03w6ByYlgUR0pIY7lPqJXYuWJLx973fnu3y4JU
	PsQ4sc6WRk2HSL/Zw8WG0WDI0SoqKzf5W53I/fH6cPPnWmF8OJ4sHT+FSe5LrTqsJCwNJgThGX/
	iu2fVRbF0aohvgOku4pOYGn03sB4JAkQ02QeKeQjuyKHoroKFynzCrRC68523XyYZS9Y58iJAMe
	PjjS7DY+NMcacFdvCSW6+y/7f+8T1qr1QpEp01G1S2OdtOwhhbfIKVjGHQqlNeSClIMSTsdTjVr
	k+w9TM6BBJLQX2L2k7aruBNalVof7QCBeE0NepVD9iRQ==
X-Google-Smtp-Source: AGHT+IEf5W21ek4SN0ll5sE3XkSqbMBzmLR+7/wUne5d4f1g+TFSnmeY9PodKHF4WkSxZeu62+QPKQ==
X-Received: by 2002:a05:6a21:3288:b0:264:94:3f5f with SMTP id adf61e73a8af0-2925c55263bmr3821388637.15.1758267480440;
        Fri, 19 Sep 2025 00:38:00 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b550fd7ebc7sm2679096a12.19.2025.09.19.00.37.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Sep 2025 00:38:00 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: corbet@lwn.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	will@kernel.org,
	peterz@infradead.org,
	boqun.feng@gmail.com,
	mark.rutland@arm.com,
	parri.andrea@gmail.com,
	ajones@ventanamicro.com,
	brs@rivosinc.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pbonzini@redhat.com,
	shuah@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	apw@canonical.com,
	joe@perches.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v3 3/8] riscv: hwprobe: Export Zalasr extension
Date: Fri, 19 Sep 2025 15:37:09 +0800
Message-ID: <20250919073714.83063-4-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250919073714.83063-1-luxu.kernel@bytedance.com>
References: <20250919073714.83063-1-luxu.kernel@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export the Zalasr extension to userspace using hwprobe.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 5 ++++-
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 2aa9be272d5de..067a3595fb9d5 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -249,6 +249,9 @@ The following keys are defined:
        defined in the in the RISC-V ISA manual starting from commit e87412e621f1
        ("integrate Zaamo and Zalrsc text (#1304)").
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZALASR`: The Zalasr extension is supported as
+       frozen at commit 194f0094 ("Version 0.9 for freeze") of riscv-zalasr.
+
   * :c:macro:`RISCV_HWPROBE_EXT_ZALRSC`: The Zalrsc extension is supported as
        defined in the in the RISC-V ISA manual starting from commit e87412e621f1
        ("integrate Zaamo and Zalrsc text (#1304)").
@@ -360,4 +363,4 @@ The following keys are defined:
 
     * :c:macro:`RISCV_HWPROBE_VENDOR_EXT_XSFVFWMACCQQQ`: The Xsfvfwmaccqqq
         vendor extension is supported in version 1.0 of Matrix Multiply Accumulate
-	Instruction Extensions Specification.
\ No newline at end of file
+	Instruction Extensions Specification.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index aaf6ad9704993..d3a65f8ff7da4 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -82,6 +82,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZAAMO		(1ULL << 56)
 #define		RISCV_HWPROBE_EXT_ZALRSC	(1ULL << 57)
 #define		RISCV_HWPROBE_EXT_ZABHA		(1ULL << 58)
+#define		RISCV_HWPROBE_EXT_ZALASR	(1ULL << 59)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 0b170e18a2beb..0529e692b1173 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -99,6 +99,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZAAMO);
 		EXT_KEY(ZABHA);
 		EXT_KEY(ZACAS);
+		EXT_KEY(ZALASR);
 		EXT_KEY(ZALRSC);
 		EXT_KEY(ZAWRS);
 		EXT_KEY(ZBA);
-- 
2.20.1

