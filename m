Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046996;
	b=g+oE2Jv2I/4TZCXQTJyWd1hUHXOwF7c3HrK1PBLW+oVHsbixZq7vEZ1jf6UQmp2xVTlm
	 Mfkiu2+dTDjROQf3r5AlGxg5uCa1AZk+jMHSiq64zHEEsf2++c1jo7Kjl0MmMHgSo80gX
	 aNOgWnKZ6uIBnQNt6NmaUKWdlM0NwSQIuxVz7OS8jDAfMtcvlLuF6YB3Ng19Vq3qjEsoO
	 ZIFnP73gY/QgJ3y7dQKuKe0BXAZN0AUOguk+D8Pm7yWZCc+mZ0866VoF9dfVgTYxE8p/q
	 zU6xkkxH3Rsd2Kb0WsrpsSxKPZFa36slbpOOSVjRkcX72tCLN/pOOaMmE4sMhztkG9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=kPOmjZHL2MVM+96ZWfKvkOf0Mofm4xRzdrRKCy7xI80=;
	b=4qykTS98nOKwAJIk2eXAdfgJAAX/OoamTcu/oNtRHbRiLtbaePY26x0UIGD8MIeqMhp5
	 xLPlMHybR07YTei6EMwM0aWrLKc6QTCpV+A/QCssd+rdxpXHBdye1KYKbdISr3xxH8elF
	 TxwSVmmKW2TSXAI7V4XmQaTgY2gK6UQeUyZD4ZH5OCTZOPoZZYO/i8A5C0RTS7w03+1Wr
	 R3lVJPRiOKj6SW90z2LtaMGPk9LSDEltDJ6zQwSfQ1GrSZJ0uXKXoV496MyGHWC0faLHl
	 wGxrQEWcKquZo1GXPfxHo7G2+VN2z2Zu1m17+AXiqat3yjPoZ8DyqDS6Bse+GwZljcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7VS64mn;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB3B60A2603
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 00:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEB3B60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E7VS64mn
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b30ff12f84so11006467b3.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 16:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795046995; x=1795651795; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kPOmjZHL2MVM+96ZWfKvkOf0Mofm4xRzdrRKCy7xI80=;
        b=E7VS64mnFp6l8FCWuCRBxcX9YMl/2v23EqZHLiM+UezIl2FzGpaRLOw8vT3KbvaXSj
         M3pgt2gBzEcurWOzbzCMXF6laxjCofxmNfE0sTtHEOnGWU95zoTmHm83tH43NXE4G5ma
         xn26IL6sjeUVB5LqgsfQBhdOhgr62ZwiIsR7Fzfwr5LyWz5x4tjp4Jviq9UAbQg2DLRG
         S/MsyA0nJu246TYufLB4t7Za41wSWMWtfgxnnx7EiFVJYlZ03jkf046DFKt8LnTpu5cr
         VLiFq1rlfv6OZTnJvksZ0Qz71qC6t4OrtN0CRfWnx+a/NZuQs47rakQheFeIFsGUYwWz
         wTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795046995; x=1795651795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPOmjZHL2MVM+96ZWfKvkOf0Mofm4xRzdrRKCy7xI80=;
        b=WvUGPIJjpmmzev3JYwPW3sE/5uYMqM9AfMD03GUfoL8CI/L+fdmM7zMiYz/F49Bq2j
         ehmS/3WYWJPUJFN3i2iTSQAnl4zxYks7YJ469eBBtb0oQuCrI/ioHrdToHw46i1yvsQZ
         bTIHXkp6OV9+4Qa193u2PnQXQL93Uw7oiP46RbGfvCiaNS0At9Y2vqgnV8pX+wGyiwGn
         ugxFKJBR7VvuuVBnxJoUkOXuDgxCMM9eT1LJXqyo1GBbMsv61wW5SXawacQL1Dvn+LkX
         l6wkAI+isu1evVlS2zlPTn/QuR3f3llhy99K8d/hfZ3FSI9QzBWRoDnEN2TCbcfxIg36
         EL2A==
X-Forwarded-Encrypted: i=1; AL+hErE6G3D2Fup+kVsHnmSirZM3zUgRR4xRfAHieJT3BvkkhGWDMVEJpyeq9KxSDULhlhrI1rbKjGqZzcU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mBcpwr/OpzixQXzF/u1XRIXieU8n3nA84E5l/m57HXCNlN5E8
	DXQx8pAL6Wrn3jl6r+zrWZEX6XT7QdfieRHDSHOBdsoYFj5zgivLsdW3
X-Gm-Gg: AZFdTZfiJLRMXPXz+PqkKaja1DpJ5wecF9q3WHU907k7qoOTI0q5Tle6faE9kx8m/gp
	fBoAL7qf3uHfiM0aThtplkVu5sQzKqh5xyg2ZJb/2IAu4XLk69sZtDY3UUWWy9SO6dE4VooxwiZ
	ORDVRQ0ExKhfnScFAHKMeYVIL5XQvCCkYwlqtSxiID9EK82FSK0OzHUbQnoqgGHq3MmrCK/286h
	YpIETyIzqz0c75EygOVdIrUPHW7fkbKHgEwYOQFEJyj4wxYdCqa46cVuDR6hVz8N95ZQESUUEaP
	Zms9iVyx277mvBbSW7FPVhawBgC1U/n0LsC0w3lkXPz7TR1M1Vi+FLk1NxQN1blIu9+l6iHyBy8
	ROOrDEQeVYzPjzlsjsLmJjpYs/GJgZRnnydbr6HV+uFSGfrlfXO36LVKoStINVODzWwdtCN26Ez
	KNFviCXjiSIsycbgacZmBnHL3i+GrXX+v1eS4oBg64mVxjla4mfk/JmImKJvRICF47S0u+wKW+r
	vyPq3EmQyKp2x0Su9fKjkxmXWSzyY+leYxTVRpdbiNYpqyeoOuihFhKxgZWCESH6jD2RDTP+gF+
	+2xvTqzIVKOf+zHZf79pC4fkDjFzZb2dHQGNtBCxsqB2i43AhSerO8ZBc4jHAppYBIgY0Ul1kPP
	7lC38zxd8eFiywMCFOexaS+dYgHfk6n/WvnNRRbYHcvKpbjoj5eNwJsadl6CO5CCXORsz3E4Ft4
	lBXePZGxn0O/DqFqSkDQ==
X-Received: by 2002:a05:690e:1c09:b0:67d:a5bf:ac89 with SMTP id 956f58d0204a3-67dd3cfd1dbmr2362473d50.10.1795046994928;
        Wed, 18 Nov 2026 16:09:54 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67dd58a192esm2510247d50.15.2026.11.18.16.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:09:54 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Wed, 18 Nov 2026 19:09:48 -0500
Subject: [PATCH v4 3/7] alpha: marvel: refresh environmental readings
 through the console
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-marvel-env-v4-3-200317e496c2@gmail.com>
References: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
In-Reply-To: <20261118-marvel-env-v4-0-200317e496c2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6757; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=YTQz99AodTvjW23cOs7Td9nyoVGKiltxq+8RLcxy6vI=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLL+2Xnlv2WrvPbwvLzqguL4Z2cNLhxPuXDNOOTiBHXtc
 IFFN82rOz6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaazbMZ/jukzr91VD
 2St/WG0KWbb9ecWa/TFH88q46hr3XdHEe1ZnGG/14Wf9PTZOxM51ncODJj06c8t4d2V17tP9fMd
 JTR8tyBaD4A
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The SRM console keeps the readings of the temperature, fan, voltage and
power supply sensors in the power and environment (P&E) nodes of the
config tree (GCT), and refreshes those of one node when asked through
config tree callback 0x28, function 0x1f. The Alpha Architecture
Reference Manual reserves every callback code it does not list, so this
is a Marvel console extension; its code and function number come from
Tru64 UNIX. Define CCB_CFGTREE in asm/console.h, and add the callback
and marvel_cfgtree_partial_update() for a sensor driver to use,
retrying, as Tru64 UNIX does, while the console reports busy.

On an ES47 the callback takes 13 to 300 ms per node with interrupts
disabled. The console callbacks are not reentrant: a refresh on one CPU
while another printed to the SRM console killed the second CPU, and the
service processor reset the partition. So export the srmcons callback
lock and hold it around the call. The lock is declared even when SRM
support is not built; there alpha_using_srm is the constant 0, and the
call is compiled out.

Tru64 UNIX makes this and its other runtime config tree callbacks only on
the master CPU, and the Marvel PAL TOY calls are already known to work
only on the boot CPU, so make the call there as well.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/console.h    |  5 ++++
 arch/alpha/include/asm/marvel_env.h | 12 ++++++++++
 arch/alpha/kernel/core_marvel.c     | 48 +++++++++++++++++++++++++++++++++++++
 arch/alpha/kernel/proto.h           |  1 +
 arch/alpha/kernel/srmcons.c         |  3 ++-
 arch/alpha/lib/callback_srm.S       |  1 +
 6 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/console.h b/arch/alpha/include/asm/console.h
index 1cabdb6064bb..4f5cf589aff7 100644
--- a/arch/alpha/include/asm/console.h
+++ b/arch/alpha/include/asm/console.h
@@ -4,6 +4,9 @@
 
 #include <uapi/asm/console.h>
 
+/* Not architected: a Marvel console extension, as used by Tru64 UNIX. */
+#define CCB_CFGTREE		0x28
+
 #ifndef __ASSEMBLER__
 extern long callback_puts(long unit, const char *s, long length);
 extern long callback_getc(long unit);
@@ -15,6 +18,8 @@ extern long callback_read(long channel, long count, const char *buf, long lbn);
 extern long callback_getenv(long id, const char *buf, unsigned long buf_size);
 extern long callback_setenv(long id, const char *buf, unsigned long buf_size);
 extern long callback_save_env(void);
+extern long callback_cfgtree(long func, unsigned long arg1, unsigned long arg2,
+			     unsigned long arg3, unsigned long arg4);
 
 extern int srm_fixup(unsigned long new_callback_addr,
 		     unsigned long new_hwrpb_addr);
diff --git a/arch/alpha/include/asm/marvel_env.h b/arch/alpha/include/asm/marvel_env.h
new file mode 100644
index 000000000000..16ccd2002a11
--- /dev/null
+++ b/arch/alpha/include/asm/marvel_env.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ALPHA_MARVEL_ENV_H
+#define __ALPHA_MARVEL_ENV_H
+
+/*
+ * Ask the console to refresh the environmental readings of the GCT node at
+ * @offset from the start of the GCT. Returns the console status, which is 1
+ * or -0x4a on success.
+ */
+long marvel_cfgtree_partial_update(unsigned long offset);
+
+#endif /* __ALPHA_MARVEL_ENV_H */
diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index 92e3312e786e..bd918028b410 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -20,10 +20,13 @@
 #include <linux/string.h>
 #include <linux/module.h>
 #include <linux/memblock.h>
+#include <linux/workqueue.h>
 
 #include <asm/ptrace.h>
 #include <asm/smp.h>
 #include <asm/gct.h>
+#include <asm/console.h>
+#include <asm/marvel_env.h>
 #include <asm/tlbflush.h>
 #include <asm/vga.h>
 
@@ -1094,3 +1097,48 @@ marvel_agp_info(void)
 
 	return agp;
 }
+
+/*
+ * The console refreshes the environmental packets of a GCT node through
+ * config tree callback function 0x1f, returning -26 while it is busy. The
+ * callback runs for up to 300 ms with interrupts disabled. Hold the console
+ * callback lock: a concurrent callback from another CPU, such as SRM console
+ * output, kills that CPU. Make the call on the boot CPU, as Tru64 UNIX does
+ * for its config tree callbacks; the PAL TOY calls also work only there.
+ */
+#define CFGTREE_PARTIAL_UPDATE	0x1f
+#define CFGTREE_BUSY		(-26)
+
+static long marvel_cfgtree_partial_update_local(void *arg)
+{
+	unsigned long flags;
+	long status;
+
+	spin_lock_irqsave(&srmcons_callback_lock, flags);
+	status = callback_cfgtree(CFGTREE_PARTIAL_UPDATE, (unsigned long)arg,
+				  0, 0, 0);
+	spin_unlock_irqrestore(&srmcons_callback_lock, flags);
+
+	return status;
+}
+
+long marvel_cfgtree_partial_update(unsigned long offset)
+{
+	long status;
+	int tries;
+
+	if (!alpha_using_srm)
+		return -ENODEV;
+
+	for (tries = 0; tries < 100; tries++) {
+		status = work_on_cpu(boot_cpuid,
+				     marvel_cfgtree_partial_update_local,
+				     (void *)offset);
+		if (status != CFGTREE_BUSY)
+			break;
+		usleep_range(10000, 20000);
+	}
+
+	return status;
+}
+EXPORT_SYMBOL_GPL(marvel_cfgtree_partial_update);
diff --git a/arch/alpha/kernel/proto.h b/arch/alpha/kernel/proto.h
index c418333d0b89..dc4ae0e0ed05 100644
--- a/arch/alpha/kernel/proto.h
+++ b/arch/alpha/kernel/proto.h
@@ -111,6 +111,7 @@ extern void * __init move_initrd(unsigned long);
 extern struct screen_info vgacon_screen_info;
 
 /* srmcons.c */
+extern spinlock_t srmcons_callback_lock;
 #if defined(CONFIG_ALPHA_GENERIC) || defined(CONFIG_ALPHA_SRM)
 extern void register_srm_console(void);
 extern void unregister_srm_console(void);
diff --git a/arch/alpha/kernel/srmcons.c b/arch/alpha/kernel/srmcons.c
index d19e51ec711d..45a10d539f19 100644
--- a/arch/alpha/kernel/srmcons.c
+++ b/arch/alpha/kernel/srmcons.c
@@ -24,7 +24,8 @@
 #include "proto.h"
 
 
-static DEFINE_SPINLOCK(srmcons_callback_lock);
+/* The console callbacks are not reentrant. */
+DEFINE_SPINLOCK(srmcons_callback_lock);
 static int srm_is_registered_console = 0;
 
 /* 
diff --git a/arch/alpha/lib/callback_srm.S b/arch/alpha/lib/callback_srm.S
index 36b63f295170..6d3c9ce6b815 100644
--- a/arch/alpha/lib/callback_srm.S
+++ b/arch/alpha/lib/callback_srm.S
@@ -94,6 +94,7 @@ CALLBACK(reset_env, CCB_RESET_ENV, 4)
 CALLBACK(save_env, CCB_SAVE_ENV, 1)
 CALLBACK(pswitch, CCB_PSWITCH, 3)
 CALLBACK(bios_emul, CCB_BIOS_EMUL, 5)
+CALLBACK(cfgtree, CCB_CFGTREE, 6)
 
 EXPORT_SYMBOL(callback_getenv)
 EXPORT_SYMBOL(callback_setenv)

-- 
2.56.1

