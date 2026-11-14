Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794677997;
	b=r7VX9w/6PYclU5B+6x9pVUIMsCCFRO8f0tHWaoH0KRTc1Gm4FimeTBvsqSYNBJoub8dL
	 4TkBTRV/vTXPsFH+QVwUwLVNyNtL8e6gaIE25RVLrtFDOGMlEODmGFhAQJwo1Z0/bc8Xm
	 T00q7ZiRNMJml0nDkA8QnTyktYBtn22gG1gyMY6P084YSjn+yB8NYXbrUO9NoHVOS6ffd
	 +wcbOoxNxFO5jT5p2ssunztdF0j3aoc93bXMuqiBq94eriWEx8woBMZK9obX/98HoDr2J
	 IQ7dDsayLqqMQKheq09rVa87OkZ8k6xql6P0sC9PrlIH0hqyPKAgHKaj7eOJ7G9eKVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794677997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xATvh/YlyQUwQZIuFw4rNogYanyOXFf+lpF7qaR8+lI=;
	b=IM3Vww+QcqWUf9lJo2mx2pbWpWbs3FIbsCakVU0aQVxVWnO9m0CN2w7CCP6rWeYkqs9j
	 P1Dlk7r7L8mSlsnMg3b/xlxo7686wD26+M/Fd0bonQ/dv/zM0HyuxarylEkj+SSVDjpVa
	 nkRoTcJERttOvQKaLeDFO40udlucZtuyN6ipWpvSdIpO3AYeHbrbST0ScusK6TFp8vMuD
	 fsQ+uf3ZuPP13DlObZrG6U5OmRED+1QAw+wTsolQBADUu+cBdr5R6Eg/PzjKT2ErQjXH0
	 DE7uH3UkM5abfzXM6CC2FFgCUFhzn3CifXlUshVv/NYN6X85OnDW9RyYa39dJPGlD8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GS5hpP/R";
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E077606A8AB
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 17:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E077606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GS5hpP/R
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b3402105b9so17015517b3.0
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 09:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794677996; x=1795282796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xATvh/YlyQUwQZIuFw4rNogYanyOXFf+lpF7qaR8+lI=;
        b=GS5hpP/RFkRP620tKYw27ccXVkSzub/VeL6hNozxkrnbwam4R/NlNGIK9YjiXb3Zfk
         ir0sCIQg5UwU0K5zD6E/b6ck+MaL49mi2UW29Upa4nC2jhT2aHZzeusRccCcaRTOt3Bv
         h9yt4X4D/Bpv9rUSZGT6q9VZw551kgDYtg1JPbB3s+IFK3ZszY4UAF9xhwA1l+5XdwLv
         AZU40paSSvgPjWIqhdnmotWBWqlLuoKCG7IANjIBcRTZhLw2QcpebSKqU8l4MfacX0Py
         8AldG6zIyMMXGKB7FEbuXLLqF3VcwEn2pS4guxyah55hMzgH14RtCL39tm6fgF7kj1Qg
         1tNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794677996; x=1795282796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xATvh/YlyQUwQZIuFw4rNogYanyOXFf+lpF7qaR8+lI=;
        b=P0amigV1gEk3XXsJU1ZQ8RHJYcb5NpuzqIiJxSPB0dX+x++J9CbURfdSoOizoSaHE0
         3KUDXIo4ldYDI0+WkYBTqeHARygkA6qgQZVHiqBIhPoAkJGOlh98WYag5zPXtB4bOuU7
         5IUuJuyyJtx9wlMc/N1btSKpEjj2yfYJBB7xDtccbnsKa1f5/TfADikGrIuKM2w5YbU6
         0Vbra3cYrAqpyO67LPmBu1tnmbLlVX6p1HR/BnYx3N8TBrZgZ/tUM2xntLfR/PChgLBU
         5OcYRBT9CmX4v5v1RtG9e2rYrRgHMda79CtUNgOJ5kkA2InrT8M07YVF7u/a639zArWT
         b0IQ==
X-Forwarded-Encrypted: i=1; AL+hErGe5Hibb0kezN/2yz9DAM6N4Kz7og0A2kOLgfDtCDcLKLAqx2TKd9skq8fdWJ290nbgdzN1mW9O+QM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9m2tjzeV2A4IKUgUh9wosya2oAFcwJZrKfUXhmJoS2pXigZEe
	bcfRHy+b8o9kCirKesf5tn/1wam8kXndJ7BGdAhfV/0feaX9P5hQcVgB
X-Gm-Gg: AYBFou1mJLb3fr18CHEgCTXQa7VF8988diXrrpV4sVXaSsggP+IzJKeOsk629+CvhFP
	9dZp9VOgWXxHA1ikDpsRy29UmmcN15WzQWOVPshGAeB5kjkzmP++KO2yaMhYNqw/2lcDLY7WkqG
	qY7ezjWWW9lQiYCFhSImRVoZklP2yagtPr1bHy5xieFsdlc7lgadihtKNFsgAsj/0D6MhBFI/YR
	iZd+ad0dMHpzWZPJiwfF9BwtBZ8jPBVQTzSTFJ29fYUEhoHvYmpCrOLX77NCrNxP4fqDuNCnZYD
	dQCPumvyk+ZfrEErCa78LuDqslrrymlIucIJ8A5NkPb26hIClf920dfPt0xIJ6zz9GVVlFCJZ1r
	2Mni/jaliLGnxUXN0gUnUjFBENLXEGb3wcRX100EKWSvOinAqTaPftY5++Nt53pSgnqMKN44feI
	YnmE30kMBgHQa3xIeg8gG/UX1+Hjyd7l9nLu9rRUUouPz5AiTj8x7VNxqiFtEE8sHfU6Zj1SLdM
	QiaVUYjQDEOnkzfI7iJWGokOhp5LTpF/m6n6GEw4tUB3VFs68cVuetFHkvXXuGjHbTLKrgxcBk+
	2MDWsmSA5H6FclMp12kxzsYKAVy32TR8Q/Hi0IIltzVuIKLHDxDG9KS0QwRV+1HmjcMs1qqhqFk
	S/E1NeNvujOUkLKbgfqnWoKaBQ0BC0eNmA9fk/c/a5Frt96l8ZLbreNUlIRn1qg==
X-Received: by 2002:a05:690c:7:b0:8a7:6a41:12db with SMTP id 00721157ae682-8b4aa0c98c4mr33791307b3.7.1794677995988;
        Sat, 14 Nov 2026 09:39:55 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa7ee70csm48424317b3.6.2026.11.14.09.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:39:54 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 12:39:49 -0500
Subject: [PATCH 3/7] alpha: marvel: refresh environmental readings through
 the console
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
Message-Id: <20261114-marvel-env-v1-3-890328e4b7e5@gmail.com>
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
In-Reply-To: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6585; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=E1n7dso8uKH0OxM7xMCl16LLLMJeE6kpwWu269/4wrc=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+zHl8W0+20zLdSvJu7Mm6sCzdI4Y7ZRZMUQh/t/rYn
 bwTDx10Oj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaa7UWMDHNqw5ISp/
 Q1P2NK/t2VdfTX5w0T63kXqaenvY6oE/u0cT8jw0dWH/2rJ8Kf+rcetz50cM/p/o2sKl28mz8Kv
 w6dsmj+EU4A
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The SRM console keeps the readings of the temperature, fan, voltage and
power supply sensors in the power and environment (P&E) nodes of the
config tree (GCT), and refreshes those of one node when asked through
config tree callback 0x28, function 0x1f. Add the callback and
marvel_cfgtree_partial_update() for a sensor driver to use, retrying,
as Tru64 UNIX does, while the console reports busy.

On an ES47 the callback takes 13 to 300 ms per node with interrupts
disabled. The console callbacks are not reentrant: a refresh on one CPU
while another printed to the SRM console killed the second CPU, and the
service processor reset the partition. So export the srmcons callback
lock and hold it around the call.

Tru64 UNIX makes this and its other runtime config tree callbacks only on
the master CPU, and the Marvel PAL TOY calls are already known to work
only on the boot CPU, so make the call there as well.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/console.h      |  2 ++
 arch/alpha/include/asm/marvel_env.h   | 12 +++++++++
 arch/alpha/include/uapi/asm/console.h |  2 ++
 arch/alpha/kernel/core_marvel.c       | 48 +++++++++++++++++++++++++++++++++++
 arch/alpha/kernel/proto.h             |  1 +
 arch/alpha/kernel/srmcons.c           |  3 ++-
 arch/alpha/lib/callback_srm.S         |  1 +
 7 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/arch/alpha/include/asm/console.h b/arch/alpha/include/asm/console.h
index 1cabdb6064bb..9b4a0f73c125 100644
--- a/arch/alpha/include/asm/console.h
+++ b/arch/alpha/include/asm/console.h
@@ -15,6 +15,8 @@ extern long callback_read(long channel, long count, const char *buf, long lbn);
 extern long callback_getenv(long id, const char *buf, unsigned long buf_size);
 extern long callback_setenv(long id, const char *buf, unsigned long buf_size);
 extern long callback_save_env(void);
+extern long callback_cfgtree(long func, unsigned long arg1, unsigned long arg2,
+			     unsigned long arg3, unsigned long arg4);
 
 extern int srm_fixup(unsigned long new_callback_addr,
 		     unsigned long new_hwrpb_addr);
diff --git a/arch/alpha/include/asm/marvel_env.h b/arch/alpha/include/asm/marvel_env.h
new file mode 100644
index 000000000000..583dca6c02d1
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
+ * or -0x4a on success, or -ENODEV when not booted from SRM.
+ */
+long marvel_cfgtree_partial_update(unsigned long offset);
+
+#endif /* __ALPHA_MARVEL_ENV_H */
diff --git a/arch/alpha/include/uapi/asm/console.h b/arch/alpha/include/uapi/asm/console.h
index 5fcb65300b56..ed2f0959e035 100644
--- a/arch/alpha/include/uapi/asm/console.h
+++ b/arch/alpha/include/uapi/asm/console.h
@@ -25,6 +25,8 @@
 #define CCB_GET_ENV		0x22
 #define CCB_SAVE_ENV		0x23
 
+#define CCB_CFGTREE		0x28
+
 #define CCB_PSWITCH		0x30
 #define CCB_BIOS_EMUL		0x32
 
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

