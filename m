Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6439DB647
	for <linux-doc@vger.kernel.org>; Sat, 22 Jun 2024 02:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719024938; cv=none; b=k+obk5O2/Bg02T55DVxWBwi4G0vOYdc0yOJveC0Sx9rcC4cHCQVZwru9VkBBDQ7owylUEY3+kCzq0D3yWS1PaBS7yTMTd2N0SrQmQYxRVh/YmFUBH4iUMRIlVu4u4v1EY9051M08zSLUQo9ERl6LxVUa1l3XZB+PiKTxsuU1oSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719024938; c=relaxed/simple;
	bh=ZOWtweHS7udvJH6Mn7C/9cPFELBUkzp7ZxNE1v9xUiQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=T/OEOO5dzNcPYNUsh8k5aXAFPC1dhHVRm5QxY4U77SE0laVv4pJ0kp/NmDgmO+DbON6w9Ho4t5O+H7ukxGImCADkm4vX6YIKGPLjzxzyIpJxFkr9u7BPcK4uyc2pCvkA/3jmgT7q/iIG7K6th3Xci7Cm6AOlOQeq6ZWmZGjwWOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=WkNKcA8Y; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="WkNKcA8Y"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-376012bcc33so9761315ab.2
        for <linux-doc@vger.kernel.org>; Fri, 21 Jun 2024 19:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1719024935; x=1719629735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5if2KmJRWjBL76ROZgI/17GyYKcY5wCvGdrrlEk4u0Q=;
        b=WkNKcA8Yd8T5SnOwVE0P8moQY95xxnxAL6stF+Hii1BF7qX2zka30u+6K5D6S+fJ4U
         ULJokvgayforpdT6Z5o1HZNZcTsvXU2zSTRTeGC6ZmMQ+gLx2J2WIbasGHsC47RXNfx3
         ZSLxMwDB3ReE70Qrwi9IVAL9Kh5qD3I0QIxPjfVlIGYeD5RJeT35CrayOkd8jV23YBbH
         WmWa21cR6KvSuIrcej75EyvDjPTeZvCA9j5gbGQWjmGIIYPJMVfsOeDcQL2RhvqjONWQ
         dCwPl2nz6EaS1SY1vbJwd9pIio4FibmK2zMQeYPsgpoeoVNtzgxxJTykBFccuZUd/po0
         m54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719024935; x=1719629735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5if2KmJRWjBL76ROZgI/17GyYKcY5wCvGdrrlEk4u0Q=;
        b=MQi2wNBqcZdVbt06+y9khgwBy1pY7WPzcyZx1zkzr8t/ub6PfsRUpIV3V3E0QN1TUP
         1p2TtPJeK79LlRm6iOS1uN0E4EQlwdAMrL1IfMrEYRls7f897jTVaXVagYCz2HKcDn1y
         kzf0TCk/ti50mQPoF5GPkzEoxiuDV0Cm7LeO3HZigBh2s9YrNx7HBiGI5YICcAy1b5jy
         jO1bQd6/iwwQNPMWd2Aw3sYGHbScEC6i7i+kCCpwr8NzVqd1hAhn6LbvEltt9g6aaSZJ
         2M/RrM2xgdvkJWb2NWV6Xco0gzs/qaVn+ymk5QrUrY6UVOOAQI9vEqGzRcG97aNdc1UV
         ww/g==
X-Forwarded-Encrypted: i=1; AJvYcCV3VG8LJN6mRRiawAXmHi3hnpRbXlOFdsJlAfIKTlbCdRL6sdA5S8lIp5q7gIR/y7elXGtx0xUNSLvfXmKuTI1cXn4FOpQiyAOR
X-Gm-Message-State: AOJu0YwJnULTzxRakj1/gtlalCzFonbUG5nb4Ut89BDiC2/MLmtKMHGE
	JEvjjOOk7u8CbPaPWq3QtKhF5httrZ22iA37fHGQBkbkO3oqPT4qZmqRZWRB2YM=
X-Google-Smtp-Source: AGHT+IEDqRRjk5TKBUDCMz6j3upGcBor/M5o4HP05d0yYUEeFU9td2Hhs5KyDe0neUdvKGxG88q+Sg==
X-Received: by 2002:a05:6e02:1808:b0:375:8a71:4cbf with SMTP id e9e14a558f8ab-3761d708893mr106035865ab.23.1719024935423;
        Fri, 21 Jun 2024 19:55:35 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.253])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-716ba7a0699sm1776286a12.67.2024.06.21.19.55.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 21 Jun 2024 19:55:35 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: jesse@rivosinc.com,
	jrtc27@jrtc27.com,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cleger@rivosinc.com,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	cuiyunhui@bytedance.com,
	costa.shul@redhat.com,
	andy.chiu@sifive.com,
	samitolvanen@google.com,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Palmer Dabbelt <palmer@rivosinc.com>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v3] RISC-V: Provide the frequency of time CSR via hwprobe
Date: Sat, 22 Jun 2024 10:55:14 +0800
Message-Id: <20240622025514.66537-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Palmer Dabbelt <palmer@rivosinc.com>

A handful of user-visible behavior is based on the frequency of the
time CSR.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 Documentation/arch/riscv/hwprobe.rst  | 2 ++
 arch/riscv/include/asm/hwprobe.h      | 2 +-
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 5 +++++
 4 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index df5045103e73..ec3c99474ed7 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -233,3 +233,5 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_TIME_CSR_FREQ`: Frequency (in Hz) of `time CSR`.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 150a9877b0af..ef01c182af2b 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 7
+#define RISCV_HWPROBE_MAX_KEY 8
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 2fb8a8185e7a..5053a9b18710 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -74,6 +74,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
 #define RISCV_HWPROBE_KEY_MISALIGNED_PERF	7
+#define RISCV_HWPROBE_KEY_TIME_CSR_FREQ	8
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index e4ec9166339f..3d47edc04a3f 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -8,6 +8,7 @@
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/hwprobe.h>
+#include <asm/delay.h>
 #include <asm/sbi.h>
 #include <asm/switch_to.h>
 #include <asm/uaccess.h>
@@ -227,6 +228,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 			pair->value = riscv_cboz_block_size;
 		break;
 
+	case RISCV_HWPROBE_KEY_TIME_CSR_FREQ:
+		pair->value = riscv_timebase;
+		break;
+
 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
 	 * call, but get their element key set to -1 and value set to 0
-- 
2.20.1

