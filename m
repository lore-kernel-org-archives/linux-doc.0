Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041174417
	for <linux-doc@vger.kernel.org>; Fri,  1 Mar 2024 16:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709311494; cv=none; b=KVDGddq3LJKOKNqNZ5jtPmYoFjUZuXEeV2Se7lcemnzeGhYH6BusxvC9iVnyUW4xrUa1/wH0Hy5T+H0Fd3d06POW3DTrJo5TQiUkIu5pdeQ4p4Fpupnvd724PATGIS1LrDuHQDInHItsZ8R1zVgEYzF+UDEIZnSxQtCT/HvYSd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709311494; c=relaxed/simple;
	bh=eW/jBE9xiI7mzT0S7JbXnNi/2VZkkXPS3pieWKtDhWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l5bgXiSyZNt0jw66oVHQJmZkLkImhM0YlfRkQEyZCUAdusB6a2r3epEMfzXmHuQLGvrsSPUj7ZMxfdq9xwUBYfdao6jtcKep6bJR+nNaMrdT9w8jOpG4+DLc3b/Tzi1le8UvvNfQlVnmVkohztFKdBIlkwooZAq0M07kW/PnDTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=SkGQcwHQ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="SkGQcwHQ"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5131e21b966so326989e87.0
        for <linux-doc@vger.kernel.org>; Fri, 01 Mar 2024 08:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709311490; x=1709916290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0fSMW0qhtBaxw1Ne7+Ji9afXRUSlXWtRAYNnO9M03wA=;
        b=SkGQcwHQSQw2jvhMg1rtMW0GIpv5/fDSioHSxRxKHmEONt9ynYhKeVKBmc371UcJzf
         3GIb/2VaJP2k9RMeL3qW794AB2QoLsRW7OjOvkTogEzx2Boz+8KDLq58QlmcTBvUZT41
         M7W/ZMVIKvSEAZpsZncsJu7bcT3L/KtgJOxwVgTbKWKL420AJTU+9IG2k/nRDc2fF1BX
         RCMa64JFTQn/URDR2NpGeru0Q76fWHZuc3Sy31a9K8wXZdMmN8RnB4TNDGwVAfUsh0IE
         ZW6RFvUri4mlYP4ZCi0SfRNVNAemLXspnU1kIJAgeTK6mO5M0Kp2Goq4kKpDEfw1lAy/
         137w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709311490; x=1709916290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0fSMW0qhtBaxw1Ne7+Ji9afXRUSlXWtRAYNnO9M03wA=;
        b=mcTLb3AwholviignYAgeK1Bw+MkUiqs6acs+Im3eudq8JAnIQBKqk58w5a68ccI75c
         7MDj4D+IDijT5qnfXlvKHZ+UnS9S2jy/hvFw8G+jrM1WoCFKdhUW6ga95aoeYnZrahfp
         Gw/ahAHHbVWXMDBH8USPQS/mEGLOAQFzwvGKYYKrlEYxFWmUHXgLJZ6EPW/oGga1OiZm
         1DLgIQptOdzJUl630ScwckYPMExzdQOdO8sEGAEvFKyGbFATqWWIKYBxee2HZQy91sB5
         375O1sNTikFKTgJI0/VMAMnSVI+rggqXyoNdKXRro1pB5USBb2BB9GYV2lXjpd74PjId
         b1cg==
X-Forwarded-Encrypted: i=1; AJvYcCXrx5I6YqNFCgYg2Pce59HRE0/MSx6yRqYKLrcZ/ZJFlkJr/JeNpOr+z6ndcBEuf/a7BV/NnQelGDP3QfhLOyncqO/Lmc6YNhsA
X-Gm-Message-State: AOJu0YyxxdvFe5qJVZ3PZ/YpV5gzJNgg0fG7sQPAnxIEtSPSNdJEbsBf
	aWJhozbD/xJ/bAocZ5v0fpHfoMI7K8+ck2aCOPZYcTiqvCHsK7fYOaHTdDWg1Y8=
X-Google-Smtp-Source: AGHT+IH+VZ/Ok1lQGCinD/i871+cRsq/HKRFrVNNHntki84EwJcMBwhp9FeP1K8gbRR0fmgRMfL0cA==
X-Received: by 2002:a05:6512:39c5:b0:513:258f:5ef3 with SMTP id k5-20020a05651239c500b00513258f5ef3mr2453949lfu.1.1709311489974;
        Fri, 01 Mar 2024 08:44:49 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:1cac:c075:fa3d:e5e9])
        by smtp.gmail.com with ESMTPSA id t1-20020a5d5341000000b0033e11acf84asm4456462wrv.15.2024.03.01.08.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 08:44:49 -0800 (PST)
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
Subject: [PATCH] riscv: hwprobe: export highest virtual userspace address
Date: Fri,  1 Mar 2024 17:44:06 +0100
Message-ID: <20240301164407.475957-1-cleger@rivosinc.com>
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

---

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
index a8509cc31ab2..341863d4d989 100644
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
+#define	user_max_virt_addr() 0
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

