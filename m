Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D54B387
	for <linux-doc@vger.kernel.org>; Wed, 13 Mar 2024 08:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710319571; cv=none; b=rh5FACP15b7rVO+yFhJKZbYUW1iqP9Kt2/FTspW8NFXjkn45UBpS0jb2/xUlCM1/ZvtVzY+/RAWQ0DsafiZj/GK7LXBxSQqsdvHaiLKiullUmnZJpTR3vgudBmn+ajBQ92BHt91FsfYZrfu561712eoYFC/TUvSSEudX+gqbbiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710319571; c=relaxed/simple;
	bh=s4ggDJ32IPV9w0ooiGFbvbPijBhiI1+2/3F1cv/jT2E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QWZKCH/w0cd+oTJ10H38PRxVONUMe+GiCH9gYo2FUAKGsOi3wvjm6hAxjv5f5H5ALM0wNAnH27Rr2zD0JExzIVzVwe4XrHHX2lIN7Rgc3xDxv8gJaUklQMrmL6FlOzeTixLdtb1/9N2KMNCzZWk5JiSclQs/nkD8ZcaTc2+Nc98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=W8/ALJ1g; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="W8/ALJ1g"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33e12bcf6adso1972076f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 13 Mar 2024 01:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1710319567; x=1710924367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xl9/EZGLKxGGHgqxXQrNVV9/fXW9fCPtZn84F/TZCWo=;
        b=W8/ALJ1g66CtGj/wWBHMKx1Jyl10qHMjkI+dYDdCSBoWhiFg+BReIGM9/NLCEsBV7x
         rlLswpw9hM9BOh+XtCPvz4YiDn9SV1pBHjP1yPuF7RmFSyNu74YnTh1KeC+0OQCRCukG
         Anv5LP25INrlgLzZ+WtaMSh0ZX0hCgW+5whzzO+sqzftvM2bWDecXvaBuJ5+mt8wPqNd
         +kdQ6lyoefBcG1npO95QAlph9oZNKvA9sTOwceZhws4QIcZEisP/OZjrzUdhpJZDM4xJ
         cuSYHuCMFHD5inAYzREqoePgYK4nNMmwufJznq0jElIQcgP9A6+DsIZVkzLeEOg3pELn
         tWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710319567; x=1710924367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xl9/EZGLKxGGHgqxXQrNVV9/fXW9fCPtZn84F/TZCWo=;
        b=DNXrwbyfN220cikAuUlCDnNBGYpadRa5YcVK5bGl48Ltp7Uvv+Mx4JEhgwoz3/W7R0
         KxClJbS1ZGBzCNcFAC6AoC8DsTTjyb4seJFeYU8aiRbChqkD/TJ9XzUs36m6O9K+HiJx
         tk9NvS3BqOo9UdNwiQO734qdaxTZ+YV99jftrjCKtWBkpzquiuhJfQb4RYoPI42SADBj
         Z4PhyptEGrdj64BR2ogtSrreFZcY41FVhAgU+VufQu/+2o1nqnuqieUyJPgOWwE34D2R
         Z0nOBZsl2utKyoFJn6G6U+P0aDSQ3Ve4TG5J5J/sijN5+MkTjU7gb2fXWbmOr0RBWQzG
         EsRw==
X-Forwarded-Encrypted: i=1; AJvYcCWarf740gujxGgfWSu5GztxoJ1htt28QKRhHHc2mIddRLonp0BiGeP1Q/IGtiCYkbJkll0X44uWLe74F3EAvW4W0JJCK7sPiamM
X-Gm-Message-State: AOJu0Yy2pODqh3IpN1/qGZx4LC3uTItL9oLrUexkxJW0KG4DpNzb7ROT
	PqFIXO7EaF1BEJ9MCJxTXjhaG2xMbH92rEdmCe5b052/z+9AFo0LRE8Kjr2WUys=
X-Google-Smtp-Source: AGHT+IE5ezVmJ/Ll3UL9RF2ZSCycTaV8On1GZv4yRfDw6BjYLYByS2PLSa+T54t0GJaDHT8MYXbE3w==
X-Received: by 2002:a05:600c:1c84:b0:413:4299:ecd7 with SMTP id k4-20020a05600c1c8400b004134299ecd7mr2825793wms.0.1710319566968;
        Wed, 13 Mar 2024 01:46:06 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:1a26:f18f:eb07:b76a])
        by smtp.gmail.com with ESMTPSA id w9-20020a05600c474900b00412706c3ddasm1612743wmo.18.2024.03.13.01.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 01:46:06 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Robin Ehn <rehn@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	"Stefan O'Rear" <sorear@fastmail.com>,
	Jessica Clarke <jrtc27@jrtc27.com>
Subject: [PATCH v4] riscv: hwprobe: export highest virtual userspace address
Date: Wed, 13 Mar 2024 09:45:33 +0100
Message-ID: <20240313084554.31925-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some userspace applications (OpenJDK for instance) uses the free MSBs
in pointers to insert additional information for their own logic and
need to get this information from somewhere. Currently they rely on
parsing /proc/cpuinfo "mmu=svxx" string to obtain the current value of
virtual address usable bits [1]. Since this reflect the raw supported
MMU mode, it might differ from the logical one used internally which is
why arch_get_mmap_end() is used. Exporting the highest mmapable address
through hwprobe will allow a more stable interface to be used. For that
purpose, add a new hwprobe key named
RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS which will export the highest
userspace virtual address.

Link: https://github.com/openjdk/jdk/blob/master/src/hotspot/os_cpu/linux_riscv/vm_version_linux_riscv.cpp#L171 [1]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

---

v4:
 - Added Charlie Reviewed-by
 - Replace a tab instead of a space
 - Resend with actual V4 tag in front of message which was missing
 - Link to v3: https://lore.kernel.org/lkml/20240301164407.475957-1-cleger@rivosinc.com/

v3:
 - Note: I did not added Stefan Reviewed-by since I did more
   modifications than just a simple respin.
 - Handle CONFIG_MMU=n as well and rename the key to
   RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS
 - Add a user_max_virt_addr() macro to handle !MMU config
 - Link to v2: https://lore.kernel.org/lkml/20240220110950.871307-1-cleger@rivosinc.com/

v2:
 - Note: tried sysconf to export it but this is not backed by syscall
   and thus does not allow exporting such information easily.
 - Use arch_get_mmap_end() instead of VA_BITS since it reflects the
   maximum logical address used by the riscv port
 - Change hwprobe key name from RISCV_HWPROBE_KEY_VA_BITS to
   RISCV_HWPROBE_KEY_MAX_ADDRESS
 - Link to v1: https://lore.kernel.org/lkml/20240201140319.360088-1-cleger@rivosinc.com/
---
 Documentation/arch/riscv/hwprobe.rst  | 3 +++
 arch/riscv/include/asm/hwprobe.h      | 2 +-
 arch/riscv/include/asm/processor.h    | 8 +++++++-
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 4 ++++
 5 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index b2bcc9eed9aa..875d3122bd66 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -210,3 +210,6 @@ The following keys are defined:
 
 * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
   represents the size of the Zicboz block in bytes.
+
+* :c:macro:`RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS`: An unsigned long which
+  represent the highest userspace virtual address usable.
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 630507dff5ea..150a9877b0af 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY 6
+#define RISCV_HWPROBE_MAX_KEY 7
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index a8509cc31ab2..8af1182f5180 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -14,7 +14,7 @@
 
 #include <asm/ptrace.h>
 
-#ifdef CONFIG_64BIT
+#if defined(CONFIG_64BIT) && defined(CONFIG_MMU)
 #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
 #define STACK_TOP_MAX		TASK_SIZE
 
@@ -58,6 +58,12 @@
 
 #define STACK_TOP		DEFAULT_MAP_WINDOW
 
+#ifdef CONFIG_MMU
+#define user_max_virt_addr() arch_get_mmap_end(ULONG_MAX, 0, 0)
+#else
+#define user_max_virt_addr() 0
+#endif /* CONFIG_MMU */
+
 /*
  * This decides where the kernel will search for a free chunk of vm
  * space during mmap's.
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9f2a8e3ff204..3630e3f30354 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -67,6 +67,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_MISALIGNED_UNSUPPORTED	(4 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_MASK		(7 << 0)
 #define RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE	6
+#define RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS	7
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
 /* Flags */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index a7c56b41efd2..560ea41a716d 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -8,6 +8,7 @@
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/hwprobe.h>
+#include <asm/processor.h>
 #include <asm/sbi.h>
 #include <asm/switch_to.h>
 #include <asm/uaccess.h>
@@ -202,6 +203,9 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
 			pair->value = riscv_cboz_block_size;
 		break;
+	case RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS:
+		pair->value = user_max_virt_addr();
+		break;
 
 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
-- 
2.43.0

