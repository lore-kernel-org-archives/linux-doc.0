Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBA823315B
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 08:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736757466; cv=none; b=BcTcG9B1lBYbYcUXf3E4GUQnV8flhpFQTrdxDectm2T5YZIcvYuE2d8eYAjb7xqU9liloPAcsZXQB4hKPNpsdOz0qoE4S8oLf38jR3d69J0MlUWeF+5GJ3cD6LKBHOBHOG4puQTXaKZOdnGjwTPnjsmv+PyB6pwS/xrM8cwJNPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736757466; c=relaxed/simple;
	bh=kN2FNI5tjS/SkVUOSzbQxNdDXKPB0v0FXY6myAvsiS8=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YwYr1repiNWQwcKSE9NM3uA7YMfIAapL6Dzns9bb/WlSEeNHdQPb1p4eV7IdWf0hMXlQtGyxaT7KN2jBbSv5lGpU+n2n35MPqK14ANQO3dO4R1gm4LyRnVty7JiBYA60+B419iXXRD4OcPpNzodKCO7r3WLrMBaxHqEAHiWAWbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=B4DrA2Mp; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="B4DrA2Mp"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-218c8aca5f1so85155545ad.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 00:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736757463; x=1737362263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SJXI8b6ff8wiNA8cdLu9hBvsj5PggOwQ7lAxRYtj+CM=;
        b=B4DrA2MpqSxzPFtER4lXArFAC+THT3LdKOFp8a980KfDnwmZsP0i22WDe000CilKRG
         CFyqEKgBX26Kx97fBhAjG0EtvVYZ30UsDRxFf+pPN37mipG0TnPy1i0952JtcXYIhZQQ
         BR+l4LRIdE2RmfYJWsr+eeIxKQQHHHp43fi1unAfmQqXBe3X9nD6yakBHb2Oa9eWU3wH
         nA9hVjsb1D0iiIHHr4/EOBkEJkzyrENcW3NJ0ivNMRW+yRUwWpCJqfWFt/pmhtKnYj18
         z2NXv/FRxmLsJKnVplS398i00hH08pPEt3SomqbfIsP3LVIHF7e7my+ni9VBdd0yaUEs
         28QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736757463; x=1737362263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJXI8b6ff8wiNA8cdLu9hBvsj5PggOwQ7lAxRYtj+CM=;
        b=ZQ37EHsAowKKnvmT7lC2oeAdOqcqL1VHQUoYnHhAMJrVGy0Wakz+SXZjB5yzZu1t4s
         kRQE/e+zl7IcP7VWh7+F/FyoshpERyUs1ey4N6F11ubmjO+VTV28ZRrKxRiuXctLHSrY
         KBh3HtcLGNI+qdbwDrPJQdbUOzIdfAWvMQ0duDUnJgGokR1rJtLfG+wnbYNqXsgRhKLn
         q2JPMi75AWsLQ7ZvUBKWRsiz2M9iw77/90N/oq4jqGyKdy8y1YcPKy4gLBym2YQIMwAw
         XKRjXDpd9/hYQAk5RdYBXoQCY02YAi7N6T8ieWnYravvLnO96LmId9A62ZXwVy5OYKlo
         j1RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCqCVQ9nL2bqfBNL2n4m294IHYoExJ6G1SSsvfC4VZiskUEMBGMLt2jSB1ccWfeyf+01xdKg92fUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlUqjHC0dX69jInvTLAzFzepG+IV6dIlKHZyL0PDsc1PHmZoQW
	5A8N72QtDDJytfi20jYWGwW1OehJdbN9hAo4KH/GOAp0tR6bm9YUH7y4E+DZPn0=
X-Gm-Gg: ASbGncvlbxM9cOfPwRAfSlhnwScrseDzu8BCFVLoKGxUYtxc6KO4CttCndSHV2ux5mr
	ymf8X1EVxWn793lUhqZM6wbwpuX0YjOAPqUOhJk/NctLff4iz+HZ+VDNJC4qynw206qQikKvm9O
	39oLgJvR/2nD3dOYCTglUKMiRCM65MQt2VKsHXGgMB6B46C3gPuTU3VDDuO2V20ukKmfM0al5cC
	o7F9hRC4K7y5gfSKJozsPj44hcfuWb+5aMkpQweRQ1cLzTx8MU0tkec1vRbttJoepNko9i90E93
	ZK/x//e0O+3+GOY=
X-Google-Smtp-Source: AGHT+IFtz8wCzJ8bWXX/3s5qBZWyQyvLgQzl4lgPk6ejyOwy8z7pnyLJogLi0etOSTCHQkUeGmH/OA==
X-Received: by 2002:a05:6a00:2e97:b0:729:49a:2da6 with SMTP id d2e1a72fcca58-72d21f1ac4emr31951733b3a.3.1736757463405;
        Mon, 13 Jan 2025 00:37:43 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a317a07ceedsm6427433a12.6.2025.01.13.00.37.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jan 2025 00:37:43 -0800 (PST)
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
Subject: [PATCH v3 2/3] RISC-V: hwprobe: Expose Zicbom extension and its block size
Date: Mon, 13 Jan 2025 16:36:34 +0800
Message-Id: <20250113083635.73826-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20250113083635.73826-1-cuiyunhui@bytedance.com>
References: <20250113083635.73826-1-cuiyunhui@bytedance.com>
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
index 955fbcd19ce9..7a47cbdbcf8e 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -94,6 +94,9 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZICBOZ`: The Zicboz extension is supported, as
        ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICBOM`: The Zicbom extension is supported, as
+       ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
+
   * :c:macro:`RISCV_HWPROBE_EXT_ZBC` The Zbc extension is supported, as defined
        in version 1.0 of the Bit-Manipulation ISA extensions.
 
@@ -273,6 +276,9 @@ The following keys are defined:
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
 
+* :c:macro:`RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE`: An unsigned int which
+  represents the size of the Zicbom block in bytes.
+
 * :c:macro:`RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS`: An unsigned long which
   represent the highest userspace virtual address usable.
 
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
index 3af142b99f77..892dd71a3793 100644
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
@@ -90,6 +91,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_SCALAR_FAST		3
 #define		RISCV_HWPROBE_MISALIGNED_SCALAR_UNSUPPORTED	4
 #define RISCV_HWPROBE_KEY_MISALIGNED_VECTOR_PERF	10
+#define RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE	11
 #define		RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN		0
 #define		RISCV_HWPROBE_MISALIGNED_VECTOR_SLOW		2
 #define		RISCV_HWPROBE_MISALIGNED_VECTOR_FAST		3
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index cb93adfffc48..affcc3e58df9 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -107,6 +107,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		EXT_KEY(ZCB);
 		EXT_KEY(ZCMOP);
 		EXT_KEY(ZICBOZ);
+		EXT_KEY(ZICBOM);
 		EXT_KEY(ZICOND);
 		EXT_KEY(ZIHINTNTL);
 		EXT_KEY(ZIHINTPAUSE);
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

