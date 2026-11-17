Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884358;
	b=aC6orDeVowCC36Nj5pAw1PvbrdWKr5HzRH7pe4e3RHWKExzu/pX/0QdqgitZLBJZHkUE
	 mO1v8x07xf2y0V/RauKty1qTzgaNd65m08du+NqnGePihiowxPmYNCjiFZUIlE+vRe2Rf
	 F9lfD6VH3mqv8xDptolScJ7mJ3DKin0e8WPFWcsEPfikfdUzek5hc6jfkS9duajc37AVn
	 9eTfIYZ9ipcsn1LgRShXHeISOXais4OSPMpBleMpyKUvHjzEJTegez1BMXrY0KVVrRXMF
	 FRCWrB/IMbY/WazQ0TVC/2Cow5VcImKmRCCgZK6AXpIKbQ7b84yv3RXzxikU55LMtzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=/otiRlm9GJOdQnRhtll5mmWBKq53CnnLHi1E5IePZno=;
	b=J1PORfjJOKlgO9FYJrLqWUgOVVIo6RvR1av9fvQnhk3myhcxy5zfrNH8y6X+eXj8DXWG
	 DVWVDW0Ku5KgvFtG9W3Rw9CZQD3Vx8HnMDJPcQww3o6wYCOgmjmT9IhdGwHsC0UGPo3+T
	 RSzXIAoON5KJmkumwBzPWmhqV+w4tbvNH23nREa/oifLZYnUzddG9yAyDhOKRsdO7N189
	 Osa141MQ9odagNZmMvBqBl2tz+YtfTVlMQrx3Lumowufl9CBXOQbMElcj0lxm4uUeAp3o
	 8/WK5m9QZsxU1eZWo/CfrDCwh9I6FUk5eaAWlT29NUkTAtfUpXj1GyLkESqpIIsnMDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SgI8tVpW;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3DA606A886
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 02:59:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD3DA606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SgI8tVpW
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b305d38bafso27715137b3.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 18:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884357; x=1795489157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/otiRlm9GJOdQnRhtll5mmWBKq53CnnLHi1E5IePZno=;
        b=SgI8tVpWo1un1bWdg/jAyoaT9kVe3EWLk+5y1DaQZiREawkJBJCSuZ/DRQSBy+gEX+
         BhixvHU374OKVIOPif9SoDrpcgOjzvs5GbREGURAnNI/YYv9a/ZRa+zxaf4eIPskI6gF
         ZYDdp9NJyKNpqDwYSa2S3Uktkd1GSp/38BNzDkTY73FqseWVaRZHaUfWNe9HR7zhy5wt
         feBOCkvd69cslnTdl6jN5Ah3C7LyzOQTvF3AqZ0LQwIbPDOjS6iPFFaLZFAR/o0cPkHw
         hHPpgvgVs0NPH7+Tb10culaBi8mmgv22EQqqjCfNLJiMah3h2vmf++AhAiKCpEeFB5qx
         zKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884357; x=1795489157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/otiRlm9GJOdQnRhtll5mmWBKq53CnnLHi1E5IePZno=;
        b=zF7maDxCfqZu5jHGupXWDSiNn+IaMdAk1Gm56Vxo82o+9pdCXILqjLvdNUjdEvVD/t
         apNKeHKDBAW02o69/o+MjT7cLlbse8SECooHnkcIH6+XpE6vJINb3Xe68csVySRMNXNI
         6FQnkEM02tj1nxxTzdkLyjAI0ZFerAVujRz5V4Q+At2RPygSjjNwIsHuAU5Keq8iHrRU
         izgi+KG0Zmri5AIVi4ZBE5tb/QpBdLcNVEHflDk4GjrU8wmQHL2SgZsbzW45/z3tas07
         BBW5/vjkmfhmabBWCDWhdbpWk3dfttqz4HqNBBY86zQoV2cj13ToySyZfLyAdP9kDWd/
         zidA==
X-Forwarded-Encrypted: i=1; AL+hErEHpxbtytNlrtfciGiR3Pim3fHk8tNtSg8n1GT0uWEUvrUFgGYtWbKRMRSsf4vVYNWr57UOdnCvnco=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EFsYPSkYB8kN/aYyVFQQC8S28B9OUgv4/xcZMAotS8qh9XI05
	QY3C702PmmTntAFa8O79Tq86iuCuJlmYynjZ4lnoB/nQKt17qAP65LJ/bYs3avld0mk=
X-Gm-Gg: AZFdTZeH1ToxVOS75WEEsDHgcgvWDUuo4/qMh7sZ4N+KneVnBNpQRZs+9J5Sh7TycGj
	YgmFLtvGIyZvSU9HP/NgiadiN07ALz7K5fYuaVasL20QCddJPoLPcD1+ScTUFvo4xGhQMDSFKoZ
	buUM9qUAoDqwxOiNd8Mvi75mYfgsy0YDCfCpbvv0i/l391FoozgKRFBsxAIb5NGyIRIblw/wH1t
	MkAqEqw1Xayrzb/0E7ixitkvc8GBVOGOCjuylyZx8V4OpWU75lnFajHZX9fDjJNsF929R5SZ6I5
	M+WhO8TOraSE9GGrTEmwVLj1rL1T7SwT4jBslDYrIH125dUJsBwbsz8FPy8NrKk5eYLEG7GBxwH
	cyzE7eeHTdXP4EnsHLgqe1jV7lUVymw4RQQoNDhxpuG1xaZobhBZ3jbr7eFkD580XFjcPg4e+rP
	LZpMNpAJMYP7ctlWQ3z+nS86FCieiFwclvCP4rkbOFzSRM7S5Q5msg5ps0VkuY3aHmuFmfCzb/r
	nvH/8F5Ret1pfwdIAmB2jfm5BNKZBOd19FA39h2rOdRkHzzzO+usYOk0IrGfqHyYeOp28QSnOaa
	BdrEBjXYs56+tloh8q/SSpWVcGgWdLqB84CUqwzjS/vCp5J7ilSdxVMYkDAIyTf5UED2Xm4DvfP
	EM4j+taNHI2hMpOVcTqn9QJcgA2z+cQNT4+ivKtS4xOs9W7nNPseAhEXE+38eU/KdmGc1JF3Rci
	hxgF9pTsn3CT33IoJoFw==
X-Received: by 2002:a05:690c:e094:b0:8b4:d584:6182 with SMTP id 00721157ae682-8b4d5846654mr25619447b3.41.1794884356807;
        Mon, 16 Nov 2026 18:59:16 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ed01d566sm13181047b3.38.2026.11.16.18.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:59:15 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 16 Nov 2026 21:59:10 -0500
Subject: [PATCH v2 3/7] alpha: marvel: refresh environmental readings
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
Message-Id: <20261116-marvel-env-v2-3-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6487; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=cy0Hm6tWEv4iz+cwupzbWBz9P0vxI5XyH7aQNeBvpgk=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+H/qzTPxH5OzZPRXvHMM0BOT/WvGUF1RP/7DhVpvIh
 ca5N9k9Oj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOYa570M/93/F16SZM
 g+Xv3A+fgVse6nYbzlU4PuvJk89UbW8eB5vBEM/yvLihYYWPJ/XeRRc13AV+fjbZWXPWwFTqe2m
 NTZHr8pwwQA
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
lock and hold it around the call.

Tru64 UNIX makes this and its other runtime config tree callbacks only on
the master CPU, and the Marvel PAL TOY calls are already known to work
only on the boot CPU, so make the call there as well.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/console.h    |  5 +++++
 arch/alpha/include/asm/marvel_env.h | 12 ++++++++++
 arch/alpha/kernel/core_marvel.c     | 45 +++++++++++++++++++++++++++++++++++++
 arch/alpha/kernel/proto.h           |  1 +
 arch/alpha/kernel/srmcons.c         |  3 ++-
 arch/alpha/lib/callback_srm.S       |  1 +
 6 files changed, 66 insertions(+), 1 deletion(-)

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
index 92e3312e786e..7525f3ed6b62 100644
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
 
@@ -1094,3 +1097,45 @@ marvel_agp_info(void)
 
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
index c418333d0b89..b54f4fd69a0f 100644
--- a/arch/alpha/kernel/proto.h
+++ b/arch/alpha/kernel/proto.h
@@ -112,6 +112,7 @@ extern struct screen_info vgacon_screen_info;
 
 /* srmcons.c */
 #if defined(CONFIG_ALPHA_GENERIC) || defined(CONFIG_ALPHA_SRM)
+extern spinlock_t srmcons_callback_lock;
 extern void register_srm_console(void);
 extern void unregister_srm_console(void);
 #else
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

