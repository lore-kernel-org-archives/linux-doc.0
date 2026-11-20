Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.30.148.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158292;
	b=n7D0sx//3xYtHg4z0Ac93V/2NWmWebE8QBbtJRU2wd+ksPbE6JT2OwBa+rCgjUyOLWBi
	 cWQ6IncS3VoXVatRKiQf2Ktd+HPIeRLcnBw/sqE7iqQuDhGPXE6YofQ/V1mEWEyy0t8Uv
	 PonN/6nGxrvK1AeaIM9Vv7cP7cinlRvqX9rv+5tFjpqtjcBAK965iQHtoX51Aru+ZZGEN
	 96yMwzGHsrB44R0VRvkw9YjmFJa/fzbWC+pjiRZgLByv1Xu1AiI7+1E4d9w7Ujn8RltoM
	 zwuBHUUTd9Ung/lV1meSNO4F+3rF1ZWvrdZU3ZAIpsGOOkrxKvgm8bo6cMSyfPEBZkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158292;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Zmail-TransId:X-Mailer:Message-ID:In-Reply-To:References:Date:
	 Mime-Version:From:To:Cc:Subject:Content-Type:X-MAIL:X-TLS:
	 X-ENVELOPE-SENDER:X-SOURCE-IP:X-CLEAN:X-Fangmail-Anti-Spam-Filtered:
	 X-Fangmail-MID-QID;
	bh=Wdwxx5GH93eKF2T3s2xALcMpz827RuJ1VUwIbt8SdrY=;
	b=zGXmBJ51LXuNUUP1mFHgzcjlUES43x9NgiWuReuApiXPGi9bhWz+6tNFWC17DBMiDGpB
	 WE7uVd9qrTLfGHy3M/lyw3kKCZxUz0hfK2kW+7ZaOmRXP1nYIc2nD/Kvhf5qjTVrP+pOs
	 aaQywk5hQg2aTNHAoZAGrt8Zeokh6wq+Y25SwDe71Vwh9nawUCljmK9aNnCIJMwxh95+8
	 cjoQpNvGlIFBABO6M3CFRZQPaBY1r8ECa/WirX/9VIFBY8j6f3MN+SHhJyzKAF7zs8Sca
	 zMDdspdlNntlOj0Fwnk0MSyJlsU4DKWBR+1AUgEwyreFgZ213gl/qfL/G0g5I3B+u6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	dkim=pass header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=IuPfR+9E;
	arc=none smtp.remote-ip=160.30.148.34
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2F9606A330;
	Fri, 20 Nov 2026 07:04:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC2F9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=zte.com.cn header.i=@zte.com.cn header.a=rsa-sha256 header.s=z202610 header.b=IuPfR+9E
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4jW5tn1q7mz4yjjL;
	Fri, 20 Nov 2026 15:04:49 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zte.com.cn;
	s=z202610; t=1795158289;
	bh=4+1lyQmiJ7E7/9yDQHEf7/ul7FAGyjQEtWwm73lcZYI=;
	h=In-Reply-To:References:Date:From:To:Cc:Subject;
	b=IuPfR+9EzrXbn3u2TjqmaEePVwT1D0MakmVfmuw4o7NHFTCKKeH7t4CYkU7KLId4l
	 SXZ0ntXK8dONEVqjuVVSbzurJBIqdnTl0+jo8FgC0+8SYv1B4jIb51Dlr4ZK7K5x32
	 GZ11QQ4+My0lhkAIpnyV5IMxfE/Uyd9ciwN44Uyigm43zTPyhkCjme5ZB+o0SU7Dek
	 QjCkOGzorZ0VDblHZ3sHsyCSXJVTEVELl8NU2H4U7Ouvr4cnAWeP5RhdzCUM0sxLDb
	 41Ysr1JdpB1McXVf9FCOZqkImQnD8P743C3eSjKnXIBMrGdNkJpkwGCmyZJhU6DTSM
	 b5sFDzWT+9FLg==
Received: from szxlzmapp01.zte.com.cn ([10.5.231.85])
	by mse-fl2.zte.com.cn with SMTP id 6AK74ZFv028056;
	Fri, 20 Nov 2026 15:04:35 +0800 (+08)
	(envelope-from lv.yating@zte.com.cn)
Received: from mapi (szxl2zmapp07[null])
	by mapi (Zmail) with MAPI id mid16;
	Fri, 20 Nov 2026 15:04:37 +0800 (CST)
X-Zmail-TransId: 2b096afff1055e3-354eb
X-Mailer: Zmail v1.0
Message-ID: <20261120150437672HnkUOWm6mhr5u-3Ha2pJQ@zte.com.cn>
In-Reply-To: <20261120145117988UPrFJYA461pgTds3xOCwH@zte.com.cn>
References: 20261120145117988UPrFJYA461pgTds3xOCwH@zte.com.cn
Date: Fri, 20 Nov 2026 15:04:37 +0800 (CST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <lv.yating@zte.com.cn>
To: <lv.yating@zte.com.cn>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
        <rdunlap@infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <liu.qingtao2@zte.com.cn>,
        <he.yilin@zte.com.cn>, <ye.zhihao1@zte.com.cn>,
        <zhang.cheng35@zte.com.cn>, <hu.shengming@zte.com.cn>,
        <linux-doc@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIHYyIDIvMl0gcmlzY3Y6IGh3cHJvYmU6IEFkZCBMZWFwUmlzZSB2ZW5kb3IgZXh0ZW5zaW9uCiBmcmFtZXdvcmsgc3VwcG9ydA==?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 6AK74ZFv028056
X-TLS: YES
X-ENVELOPE-SENDER: lv.yating@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Fri, 20 Nov 2026 15:04:49 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AFFF111.000/4jW5tn1q7mz4yjjL

From: Lv Yating <lv.yating@zte.com.cn>

Add RISCV_HWPROBE_KEY_VENDOR_EXT_LEAPRISE_0 (key 17) and the
supporting vendor extension framework entries for Beijing LeapRise
Technology Co., Ltd.

The key is recognized by riscv_hwprobe() and reports an empty
bitmask for now: no LeapRise vendor extensions are defined yet.
Recognizing the key allows userspace to distinguish a kernel that
supports LeapRise vendor extension probing (empty bitmask) from an
older kernel that does not know the key at all (key set to -1), so
LeapRise userspace libraries can be prepared ahead of the first
hardware shipping vendor extensions.

Follow-up patches will register extensions as they are defined.

Signed-off-by: Lv Yating <lv.yating@zte.com.cn>
---
 Documentation/arch/riscv/hwprobe.rst          |  4 ++++
 arch/riscv/Kconfig.vendor                     | 14 +++++++++++++
 arch/riscv/include/asm/hwprobe.h              |  3 ++-
 .../include/asm/vendor_extensions/leaprise.h  | 17 ++++++++++++++++
 .../asm/vendor_extensions/leaprise_hwprobe.h  | 20 +++++++++++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h         |  1 +
 arch/riscv/include/uapi/asm/vendor/leaprise.h |  3 +++
 arch/riscv/kernel/sys_hwprobe.c               |  4 ++++
 arch/riscv/kernel/vendor_extensions.c         | 10 ++++++++++
 arch/riscv/kernel/vendor_extensions/Makefile  |  2 ++
 .../riscv/kernel/vendor_extensions/leaprise.c | 12 +++++++++++
 .../vendor_extensions/leaprise_hwprobe.c      | 19 ++++++++++++++++++
 12 files changed, 108 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/vendor_extensions/leaprise.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/leaprise_hwprobe.h
 create mode 100644 arch/riscv/include/uapi/asm/vendor/leaprise.h
 create mode 100644 arch/riscv/kernel/vendor_extensions/leaprise.c
 create mode 100644 arch/riscv/kernel/vendor_extensions/leaprise_hwprobe.c

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 8454a6ae6fd1..336a2c5b05d9 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -431,3 +431,7 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZIC64B`: The Zic64b extension is supported,
     as defined in the RISC-V Profiles specification starting from commit
     b1d80660 ("Updated to ratified state.")
+
+* :c:macro:`RISCV_HWPROBE_KEY_VENDOR_EXT_LEAPRISE_0`: A bitmask containing the
+  leaprise vendor extensions that are compatible with the
+  :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
index 3c1f92e406c3..03af8bc0f903 100644
--- a/arch/riscv/Kconfig.vendor
+++ b/arch/riscv/Kconfig.vendor
@@ -16,6 +16,20 @@ config RISCV_ISA_VENDOR_EXT_ANDES
 	  If you don't know what to do here, say Y.
 endmenu

+menu "LeapRise"
+config RISCV_ISA_VENDOR_EXT_LEAPRISE
+	bool "LeapRise vendor extension support"
+	select RISCV_ISA_VENDOR_EXT
+	default y
+	help
+	  Say N here to disable detection of and support for all LeapRise vendor
+	  extensions. Without this option enabled, LeapRise vendor extensions
+	  will not be detected at boot and their presence not reported to
+	  userspace.
+
+	  If you don't know what to do here, say Y.
+endmenu
+
 menu "MIPS"
 config RISCV_ISA_VENDOR_EXT_MIPS
 	bool "MIPS vendor extension support"
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 9b04377c0f98..e37e5a8afbb4 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@

 #include <uapi/asm/hwprobe.h>

-#define RISCV_HWPROBE_MAX_KEY		16
+#define RISCV_HWPROBE_MAX_KEY		17

 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
@@ -25,6 +25,7 @@ static inline bool hwprobe_key_is_bitmask(__s64 key)
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_THEAD_0:
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0:
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0:
+	case RISCV_HWPROBE_KEY_VENDOR_EXT_LEAPRISE_0:
 		return true;
 	}

diff --git a/arch/riscv/include/asm/vendor_extensions/leaprise.h b/arch/riscv/include/asm/vendor_extensions/leaprise.h
new file mode 100644
index 000000000000..0d4ab8f03983
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/leaprise.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_LEAPRISE_H
+#define _ASM_RISCV_VENDOR_EXTENSIONS_LEAPRISE_H
+
+#include <asm/vendor_extensions.h>
+#include <linux/types.h>
+
+/*
+ * Extension keys should be strictly less than max.
+ * It is safe to increment this when necessary.
+ */
+#define RISCV_ISA_VENDOR_EXT_MAX_LEAPRISE			32
+
+extern struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_leaprise;
+
+#endif
diff --git a/arch/riscv/include/asm/vendor_extensions/leaprise_hwprobe.h b/arch/riscv/include/asm/vendor_extensions/leaprise_hwprobe.h
new file mode 100644
index 000000000000..980402df0095
--- /dev/null
+++ b/arch/riscv/include/asm/vendor_extensions/leaprise_hwprobe.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _ASM_RISCV_VENDOR_EXTENSIONS_LEAPRISE_HWPROBE_H
+#define _ASM_RISCV_VENDOR_EXTENSIONS_LEAPRISE_HWPROBE_H
+
+#include <linux/cpumask.h>
+
+#include <uapi/asm/hwprobe.h>
+
+#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_LEAPRISE
+void hwprobe_isa_vendor_ext_leaprise_0(struct riscv_hwprobe *pair, const struct cpumask *cpus);
+#else
+static inline void hwprobe_isa_vendor_ext_leaprise_0(struct riscv_hwprobe *pair,
+						   const struct cpumask *cpus)
+{
+	pair->value = 0;
+}
+#endif
+
+#endif
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9a121ee3b436..6907ca4648ef 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -124,6 +124,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZA64RS	_BITULL(5)
 #define		RISCV_HWPROBE_EXT_B		_BITULL(6)
 #define		RISCV_HWPROBE_EXT_ZIC64B	_BITULL(7)
+#define RISCV_HWPROBE_KEY_VENDOR_EXT_LEAPRISE_0	17

 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */

diff --git a/arch/riscv/include/uapi/asm/vendor/leaprise.h b/arch/riscv/include/uapi/asm/vendor/leaprise.h
new file mode 100644
index 000000000000..9ee13f1ca559
--- /dev/null
+++ b/arch/riscv/include/uapi/asm/vendor/leaprise.h
@@ -0,0 +1,3 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+
+/* LeapRise vendor extensions: none defined yet */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index cd7cf272e6e1..e60facabdd86 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -15,6 +15,7 @@
 #include <asm/uaccess.h>
 #include <asm/unistd.h>
 #include <asm/vector.h>
+#include <asm/vendor_extensions/leaprise_hwprobe.h>
 #include <asm/vendor_extensions/mips_hwprobe.h>
 #include <asm/vendor_extensions/sifive_hwprobe.h>
 #include <asm/vendor_extensions/thead_hwprobe.h>
@@ -364,6 +365,9 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 	case RISCV_HWPROBE_KEY_VENDOR_EXT_MIPS_0:
 		hwprobe_isa_vendor_ext_mips_0(pair, cpus);
 		break;
+	case RISCV_HWPROBE_KEY_VENDOR_EXT_LEAPRISE_0:
+		hwprobe_isa_vendor_ext_leaprise_0(pair, cpus);
+		break;

 	/*
 	 * For forward compatibility, unknown keys don't fail the whole
diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
index bb4a75923685..e7372194096e 100644
--- a/arch/riscv/kernel/vendor_extensions.c
+++ b/arch/riscv/kernel/vendor_extensions.c
@@ -6,6 +6,7 @@
 #include <asm/vendorid_list.h>
 #include <asm/vendor_extensions.h>
 #include <asm/vendor_extensions/andes.h>
+#include <asm/vendor_extensions/leaprise.h>
 #include <asm/vendor_extensions/mips.h>
 #include <asm/vendor_extensions/sifive.h>
 #include <asm/vendor_extensions/thead.h>
@@ -17,6 +18,9 @@ struct riscv_isa_vendor_ext_data_list *riscv_isa_vendor_ext_list[] = {
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_ANDES
 	&riscv_isa_vendor_ext_list_andes,
 #endif
+#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_LEAPRISE
+	&riscv_isa_vendor_ext_list_leaprise,
+#endif
 #ifdef CONFIG_RISCV_ISA_VENDOR_EXT_MIPS
 	&riscv_isa_vendor_ext_list_mips,
 #endif
@@ -53,6 +57,12 @@ bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsig
 		cpu_bmap = riscv_isa_vendor_ext_list_andes.per_hart_isa_bitmap;
 		break;
 	#endif
+	#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_LEAPRISE
+	case LEAPRISE_VENDOR_ID:
+		bmap = &riscv_isa_vendor_ext_list_leaprise.all_harts_isa_bitmap;
+		cpu_bmap = riscv_isa_vendor_ext_list_leaprise.per_hart_isa_bitmap;
+		break;
+	#endif
 	#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_MIPS
 	case MIPS_VENDOR_ID:
 		bmap = &riscv_isa_vendor_ext_list_mips.all_harts_isa_bitmap;
diff --git a/arch/riscv/kernel/vendor_extensions/Makefile b/arch/riscv/kernel/vendor_extensions/Makefile
index bf116c82b6bd..1f76fd4050c7 100644
--- a/arch/riscv/kernel/vendor_extensions/Makefile
+++ b/arch/riscv/kernel/vendor_extensions/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only

 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_ANDES)	+= andes.o
+obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_LEAPRISE)	+= leaprise.o
+obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_LEAPRISE)	+= leaprise_hwprobe.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_MIPS)  	+= mips.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_MIPS)  	+= mips_hwprobe.o
 obj-$(CONFIG_RISCV_ISA_VENDOR_EXT_SIFIVE)	+= sifive.o
diff --git a/arch/riscv/kernel/vendor_extensions/leaprise.c b/arch/riscv/kernel/vendor_extensions/leaprise.c
new file mode 100644
index 000000000000..bdc2eed288ba
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions/leaprise.c
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/cpufeature.h>
+#include <asm/vendor_extensions.h>
+#include <asm/vendor_extensions/leaprise.h>
+
+/* LeapRise vendor extensions: none defined yet */
+
+struct riscv_isa_vendor_ext_data_list riscv_isa_vendor_ext_list_leaprise = {
+	.ext_data_count = 0,
+	.ext_data = NULL,
+};
diff --git a/arch/riscv/kernel/vendor_extensions/leaprise_hwprobe.c b/arch/riscv/kernel/vendor_extensions/leaprise_hwprobe.c
new file mode 100644
index 000000000000..260a2b38e4d6
--- /dev/null
+++ b/arch/riscv/kernel/vendor_extensions/leaprise_hwprobe.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/vendor_extensions.h>
+#include <asm/vendor_extensions/leaprise.h>
+#include <asm/vendor_extensions/leaprise_hwprobe.h>
+#include <asm/vendor_extensions/vendor_hwprobe.h>
+
+#include <linux/cpumask.h>
+#include <linux/types.h>
+
+#include <uapi/asm/hwprobe.h>
+#include <uapi/asm/vendor/leaprise.h>
+
+void hwprobe_isa_vendor_ext_leaprise_0(struct riscv_hwprobe *pair,
+				   const struct cpumask *cpus)
+{
+	/* No LeapRise vendor extensions are defined yet. */
+	pair->value = 0;
+}
-- 
2.27.0
