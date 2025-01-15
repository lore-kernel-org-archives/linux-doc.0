Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E9822E405
	for <linux-doc@vger.kernel.org>; Wed, 15 Jan 2025 02:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736908875; cv=none; b=CMapOZeN3o+d63WJIjbUi82AqhF7HPnQ8Om80BcgvatbSA9YL1ZXV2YciVJdv/AQtjKQlfBkRZHeAYoVlIjRADyK8YMWe79IesvlzBIjqpbSoylYqVvNKi4/zPdFYlqi+i26kCZrtsLjHAAtgM56P3+ZogmLvLmJVi5zupYFV/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736908875; c=relaxed/simple;
	bh=UbnhKwBKY9x09fUUnRX3kFsgKloXYVJNYiZhUVyRZko=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iBt7Y0Hvd7ZNifKUCZ8i5KIRLz7cfGMNgVw0t3o/QXRN2ybh6nX+cbACiaICPpyunpwCkZVlu6mIARdrua1FPDijKqRvorrOCZRgQHrF8wyWnGRKcMQvSxowe5HnpsYel3dt1JkU6emc2iBbOUMJ7aPSCw2QAVYggmRKIePPLWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=VRPenhMG; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="VRPenhMG"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2156e078563so92086745ad.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 18:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736908873; x=1737513673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rT2pVksutJIId1LNuVU67y8Yu8hoO+3APrCNZYHddJA=;
        b=VRPenhMGl2VdnAoOWKNNvMXg151afzX0ScKfkXG/HXUL5EKJAD9NeosN5jagfqnd2r
         iYMQhhFKo5i9MWiO0UC2IdZvYIdLe3xEyQ7S45Lts78SoMu0kdYo0xRoYr0Or7lrHtbq
         VhGMACaZg5BeTFBxRXqIe9K+bjCzyQMHvZVaeg9nWUfD4BMqiUXPHoFNQjHQNGy/+vcd
         0G7G9O2+FyC3a8TnJIeF+usAe43LYCqABMTxHEqBOcR3jaH3t7hnRSVpjUBXuBGHEVIU
         H1g98n7oCo+GiYCA7zvTBzn6EHXZtjp9sh93RxAL6u5n+vQDo+1OcNRsYIqZQq/14ryv
         TQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736908873; x=1737513673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rT2pVksutJIId1LNuVU67y8Yu8hoO+3APrCNZYHddJA=;
        b=nB/gWqhwv4vcCjHC2+/ZO9YyWFNHlOESU1Jh0Pgpq8/944Fx/2AXf/yEnlw8lqmSE3
         Qm388KSMVVs6u3KYJzk4e/b5/48DA5H37FXK3ge2/bLegJ5+ik9sUSw67SIfG/S5Fqz0
         hSIaiLgA12kO7qMk/xiAZtpI5phOHg0Mb/9TXzof28CqWZ7vqS0CgdKNy9jJegWS+i0G
         lnLb4793W3o7MT9s/dvSC57ujySwymIH7qA+MGioYQP90p/XOCfmJ+cTbiXolRlDJVJ6
         d8rkjtOC3trH0pqwFxC4z2ju2VeZXREuR/e+/ZAkdxe5WBlMaxqoPCmjGfjRCi/aV+S5
         q2GQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg9MfPKnNiGASipJrXxGGhI1iuoJ+ZC+mXbxJge+VlFfELKvJ2+nxMgUJy8aSlLIT2yZnbdZ+4piw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsK1xdIe42UYQUBh4VpgRfDsUnrFskMoz6jEQCCyQ/nYmAjbgc
	0oYvJG0WBcATFn8iRfGahGWhq0IadK0EO/7jJn6oxf4B0EPTb+7mtkgzlFJUkyY=
X-Gm-Gg: ASbGncvNmcEI6X6jL7Di1cXmj6yMa3ybo8CeIDJuVEyIpvDtW1MkKkcoRKMr4frEaMu
	hK4CeZvsgASdWqpZTqD3sjzL+JFahzL+CJ/1ou5vBT63YYQnq+fmd0a6Sz+W4pmZfGU6xJxX39P
	3PCEXvryo4vsNq1mV8w3VIYqyK3P3y+jwnsdsmFgKO2s7TJRwzYuSen5Id73dzXUGxa2mCFmZtK
	ODCGsmCvzptEE7O91lFIsUL3DtCbJjR4B1REuablV4/y4ySjYolplUVgkk2tuF9ziqZP2Xxcg1m
	oyetgJp2zG3KkyI=
X-Google-Smtp-Source: AGHT+IFZrkOo1kKHka7uEN46rgjAYm+/LF8Olw/yHOPwTxzyq6Nj2yHjAD5mXgPxO3CwPQSd5i6+xA==
X-Received: by 2002:a05:6a21:151b:b0:1e1:ae4a:1d48 with SMTP id adf61e73a8af0-1e88d2fd01emr46853864637.40.1736908873272;
        Tue, 14 Jan 2025 18:41:13 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40680e67sm8321841b3a.139.2025.01.14.18.41.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jan 2025 18:41:12 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	andybnac@gmail.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	conor.dooley@microchip.com,
	conor@kernel.org,
	corbet@lwn.net,
	cuiyunhui@bytedance.com,
	evan@rivosinc.com,
	jesse@rivosinc.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	samuel.holland@sifive.com,
	shuah@kernel.org
Subject: [PATCH v5 2/3] RISC-V: hwprobe: Expose Zicbom extension and its block size
Date: Wed, 15 Jan 2025 10:40:23 +0800
Message-Id: <20250115024024.84365-3-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250115024024.84365-1-cuiyunhui@bytedance.com>
References: <20250115024024.84365-1-cuiyunhui@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expose Zicbom through hwprobe and also provide a key to extract its
respective block size.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 6 ++++++
 arch/riscv/include/asm/hwprobe.h      | 2 +-
 arch/riscv/include/uapi/asm/hwprobe.h | 2 ++
 arch/riscv/kernel/sys_hwprobe.c       | 6 ++++++
 4 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 955fbcd19ce9..21323811a206 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -242,6 +242,9 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_SUPM`: The Supm extension is supported as
        defined in version 1.0 of the RISC-V Pointer Masking extensions.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICBOM`: The Zicbom extension is supported, as
+       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
      :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
      mistakenly classified as a bitmask rather than a value.
@@ -293,3 +296,6 @@ The following keys are defined:
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED`: Misaligned vector accesses are
     not supported at all and will generate a misaligned address fault.
+
+* :c:macro:`RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE`: An unsigned int which
+  represents the size of the Zicbom block in bytes.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 1ce1df6d0ff3..89379f9a2e6e 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 10
+#define RISCV_HWPROBE_MAX_KEY 11
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 3af142b99f77..b15c0bd83ef2 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -73,6 +73,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZCMOP		(1ULL << 47)
 #define		RISCV_HWPROBE_EXT_ZAWRS		(1ULL << 48)
 #define		RISCV_HWPROBE_EXT_SUPM		(1ULL << 49)
+#define		RISCV_HWPROBE_EXT_ZICBOM	(1ULL << 50)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
@@ -94,6 +95,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW		2
 #define		RISCV_HWPROBE_MISALIGNED_VECTOR_FAST		3
 #define		RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED	4
+#define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE	11
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index cb93adfffc48..04150e62f998 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -106,6 +106,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCA);
 		EXT_KEY(ZCB);
 		EXT_KEY(ZCMOP);
+		EXT_KEY(ZICBOM);
 		EXT_KEY(ZICBOZ);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);
@@ -278,6 +279,11 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
 			pair->value = riscv_cboz_block_size;
 		break;
+	case RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE:
+		pair->value = 0;
+		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOM))
+			pair->value = riscv_cbom_block_size;
+		break;
 	case RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS:
 		pair->value = user_max_virt_addr();
 		break;
-- 
2.39.2

