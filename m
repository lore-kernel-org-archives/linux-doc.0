Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CADA2116E0
	for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 05:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744954463; cv=none; b=rnuHje4lAJliHhK1eVcuztZmdOe098u5ZIHB/WNu9LD5aKdZJKpm0auo7ZYORDmp4BapIH+2XF9GaRV45wZNySzmb8RAPiYPDLOBVNxSkbw40uRwXQ9NBywYHoXsas/ZHE96Lg698ZvQL0w3G52+TJJcjP0BgjE3mEhYEu+w2tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744954463; c=relaxed/simple;
	bh=h+vHAUoPGBj9ueEF40vasfKWJtbIhR4WDJYtsgSQiqY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HbTsvoJgQ9n0P6JJZudpVQ6tlmm6bFn1xp5wDDXhreLA7EoFZh5yNNfMEIUNgK7JjWZcDGWZuOa3sZhOpNphtS4UAMMibISFm18RuUk+wpIJEiTIO/tdQmThMZdqJfVHk0gP8CQxDlnYphR/9wKkMiUm35Cvd+PlDG1ZhMQWmJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=FFLMQ+SQ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FFLMQ+SQ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so1288376b3a.2
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 22:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954461; x=1745559261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Vt4avVN1JMW1dLLTypBf6HyDWimdmGBTky31Gipgqs=;
        b=FFLMQ+SQSEX77JklN02mMgRBsLd61cyOhp947DFOXPjSxsQ2KOIFjNeHvAyDDPnLaK
         zH5hbA3Bgmmr+9SZ8CBFJUscxMEB3+KxT8LiwbysFRWAPE6vR9TD9Zr+4JTzL4tOvVlO
         3KDMg9NjsU0asVOIeTuwf6j5a4IPYD7V+skdaMLD/e/3ofDdwl8uURWITHV4WrC2S+6L
         rVCunEVUAdffFMaatrbVHZ8VjyxZ32oraFez8s6DY+InGPyEI0NZ5tOP+/ifMYF51bZV
         DAeL/ZPa0w0OWZ8wSfgx0IROAlGrGUJe/l1punJSQn6wtYU8+4m8/Z9K3raSUBFuoUmB
         A8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954461; x=1745559261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Vt4avVN1JMW1dLLTypBf6HyDWimdmGBTky31Gipgqs=;
        b=FYmMij9G7X9biD5uyXGZIKAO3dukigefMkA3lBcbvfNI4VI/PXDIMjC072CUhTj88b
         avbxm7ig13ZivzZKN2mvrTN9XvhxGOGeyaNEP2fRgLsro2qTgYV0jGdnwPThZXgPjNFR
         iA5Yca0BviGBi4kx2x2l5oJlcQvh6415nyGc/TQnPHJqXTtA6IOhlQ8QfgkQtDxjWJ+k
         vEmIlGZCzKXoZfXd+73LY9jVpUTcsIW4WOhPxtEVfGd0Pra6edCWnb34WAl0oMbyMITp
         7EsP3fDfdAskOpXIIKLi6vHUiKCFUirORIbMF+Vc9sikOF01wgjjaZIZT9ZCpDwz23Ul
         Q5bQ==
X-Gm-Message-State: AOJu0YxCaJJSXYQU0bOB5foV2AoiD/z5b05xX7VOhJD7IWBSsQfgvth1
	yJznBGEp0huBwo+RKJfkW8+Zh93k2Pd+kutHyWGF4qQn1AGF0m9Qxk6KcQsp1Xo=
X-Gm-Gg: ASbGncvNId11vizHEOaI4ngiqcDKsrybjzy4mickZOUX4RXtJYLsRhkWjp0070JODyO
	o5Z/04muBaDK/rIXHpZjMO5XROYhILJWcFcwP7Uuk5EfLwPX3cNgPffA4KUuLsXFyFISVoL4iEG
	/mkyVkFFWA6m9M4gOZrWDcZlVwCKA6VscirdDfseRyffP3LFYKvrVhyT88jiUuKGwvIjbnygSvz
	EpBVfaICKLS6jA9yYP7NaRJeRs5y+sm94C+3vlY0t881DLfKd6UJvJzvXdt+1219f5ONbGV8zcE
	yvWK02YdXIdh3jBDkBYdmlRC1mXFFEWFGOetUaYKiumJP2yXbbnv7iX7iJDzotKO32oaIfNnIAF
	l
X-Google-Smtp-Source: AGHT+IH8oGcm9ULNBkRHJ+8ND/tHi2d1pyYFA/e6s/eR4NX5it1jIhKYwDK3JnyfigD7W5uIUOe5uA==
X-Received: by 2002:a05:6a00:e05:b0:736:55ec:ea8b with SMTP id d2e1a72fcca58-73dc15cfb93mr2114304b3a.24.1744954461151;
        Thu, 17 Apr 2025 22:34:21 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:20 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH 04/12] riscv: hwprobe: Add SiFive vendor extension support and probe for xsfqmaccdod and xsfqmaccqoq
Date: Fri, 18 Apr 2025 13:32:31 +0800
Message-Id: <20250418053239.4351-5-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250418053239.4351-1-cyan.yang@sifive.com>
References: <20250418053239.4351-1-cyan.yang@sifive.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new hwprobe key "RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0" which allows
userspace to probe for the new vendor extensions from SiFive. Also, add
new hwprobe for SiFive "xsfvqmaccdod" and "xsfvqmaccqoq" vendor
extensions.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>
---
 arch/riscv/include/asm/hwprobe.h              |  1 +
 .../asm/vendor_extensions/sifive_hwprobe.h    | 19 ++++++++++++++++++
 arch/riscv/include/uapi/asm/vendor/sifive.h   |  4 ++++
 arch/riscv/kernel/sys_hwprobe.c               |  5 +++++
 arch/riscv/kernel/vendor_extensions/Makefile  |  1 +
 .../kernel/vendor_extensions/sifive_hwprobe.c | 20 +++++++++++++++++++
 6 files changed, 50 insertions(+)
 create mode 100644 arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
 create mode 100644 arch/riscv/include/uapi/asm/vendor/sifive.h
 create mode 100644 arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c

diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 1c6977305776..7fe0a379474a 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -22,6 +22,7 @@ static inline bool hwprobe_key_is_bitmask(__s64 key)
 	case RISCV_HWPROBE_KEY_IMA_EXT_0:
 	case RISCV_HWPROBE_KEY_CPUPERF_0:
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
+	case RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0:
 		return true;
 	}
 
diff --git a/arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h b/arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
new file mode 100644
index 000000000000..90a61abd033c
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_SIFIVE_HWPROBE_H
+#define _ASM_RISCV_VENDOR_EXTENSIONS_SIFIVE_HWPROBE_H
+
+#include <linux/cpumask.h>
+
+#include <uapi/asm/hwprobe.h>
+
+#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE
+void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const struct cpumask *cpus);
+#else
+static inline void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair,
+						   const struct cpumask *cpus)
+{
+	pair->value = 0;
+}
+#endif
+
+#endif
diff --git a/arch/riscv/include/uapi/asm/vendor/sifive.h b/arch/riscv/include/uapi/asm/vendor/sifive.h
new file mode 100644
index 000000000000..f25d8cf110d1
--- /dev/null
+++ b/arch/riscv/include/uapi/asm/vendor/sifive.h
@@ -0,0 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+#define	RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCDOD		(1 << 0)
+#define	RISCV_HWPROBE_VENDOR_EXT_XSFVQMACCQOQ		(1 << 1)
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 249aec8594a9..138e74f05de7 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -15,6 +15,7 @@
 #include <asm/uaccess.h>
 #include <asm/unistd.h>
 #include <asm/vector.h>
+#include <asm/vendor_extensions/sifive_hwprobe.h>
 #include <asm/vendor_extensions/thead_hwprobe.h>
 #include <vdso/vsyscall.h>
 
@@ -300,6 +301,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		pair->value = riscv_timebase;
 		break;
 
+	case RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0:
+		hwprobe_isa_vendor_ext_sifive_0(pair, cpus);
+		break;
+
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
 		hwprobe_isa_vendor_ext_thead_0(pair, cpus);
 		break;
diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
index d5fdde0e863b..a4eca96d1c8a 100644
--- a/arch/riscv/kernel/vendor_extensions/Makefile
+++ b/arch/riscv/kernel/vendor_extensions/Makefile
@@ -2,5 +2,6 @@
 
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+= andes.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE)	+= sifive.o
+obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE)	+= sifive_hwprobe.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_THEAD)	+= thead_hwprobe.o
diff --git a/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
new file mode 100644
index 000000000000..461ce0f305ce
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/vendor_extensions/sifive.h>
+#include <asm/vendor_extensions/sifive_hwprobe.h>
+#include <asm/vendor_extensions/vendor_hwprobe.h>
+
+#include <linux/cpumask.h>
+#include <linux/types.h>
+
+#include <uapi/asm/hwprobe.h>
+#include <uapi/asm/vendor/sifive.h>
+
+void hwprobe_isa_vendor_ext_sifive_0(struct riscv_hwprobe *pair, const struct cpumask *cpus)
+{
+	VENDOR_EXTENSION_SUPPORTED(pair, cpus,
+				   riscv_isa_vendor_ext_list_sifive.per_hart_isa_bitmap, {
+		VENDOR_EXT_KEY(XSFVQMACCDOD);
+		VENDOR_EXT_KEY(XSFVQMACCQOQ);
+	});
+}
-- 
2.39.5 (Apple Git-154)

