Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6760F36F91F
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 17:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618178; cv=none; b=atsJJZY27By8NdTFtjDv6OMKJy4BJZ2e6hojILnfKfbcLPFPbnffBDJzRZAz9J/G87aSpSiFx/OzidtdgmOkWaE5wtAh+Haj8LaOIzqVNL/YV1kkx99aK9J52xAF+zr3PIm5OkEMcXYsoTvvKMOTX/uZdnw3XCAHQ7adOAnkXeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618178; c=relaxed/simple;
	bh=kjPzSgKukGJeOcNErrJKgTuGs69bRKEq8kMNgC1lM6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hM3vbZu1zzPoOUEvSKzuaKrHad/qzKvBtcoAU1jcpKzQJAIbL4HNAEu56lJUxxD2IrALKBff0NBiY5wX1wscQqy3/mA/Bqml0dA0PMwhD0T5EJQ4lqpRXiVfmA4POuHv/XKlGCwn63eLEryex2CPeKiB2JYoYLUwvYxTjcfiUOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=B3x8eZR/; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="B3x8eZR/"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2d560775ca2so9272355ad.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 10:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618177; x=1791222977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ejipg3r3UVU9vc4qrGUJPGiICgZ3Att93JZtQzMULZA=;
        b=YQo22T+y9nszyKrWS4Maas4Fhc40HCYsrJxuVPwCiT+Oj/VaQVlUBNATbtzGoUjJKD
         r6/Rkj5/Ae7ROoY1mLjozvkuqWdrAMryD8C+obsl+Sh47LsNQwHGhKb0BVvbC2hMla2Y
         WygwS3X16L/ecH1JK3dK4jfKCzHM+sB2RSRFUqr4BbZxFOuYSlOQZLcS85JEqSjCQVAM
         6M0qyP0u7zg+Fj7o5ynYruNqKKMhF0Z4PFl/Mb4vKH0+xlFa8nVKJeOdzUunTOED1jDm
         oj0mTH56RTrcqytA89Y9MeeF9rDB3yeo+H+7R7VBxyLZxVFGiKSqeUfmDD7N1NWyWPJC
         WEnA==
X-Forwarded-Encrypted: i=1; AKwUvByyfn63brSkcZv4uJtbPVt5WIY8bAlCYKoupm906cp/VRO0YXpCnw11FCXPTe6iLxCftVVz33NJ8yY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6GaeIu3yeARpks2d0GQTHcLnmASGWmWtw+G4+aXIUbHUXph70
	VGcv9s4TKoh+CfAp/bX9yt93fcpmtIb5VEgOVrcoUdHTvYJT0VoBrzTbzp9EjZcRQ2tmSNBJmJx
	tcdup/2zdKFVdT2et4eZ/l2QXJv/bMgs6DVm4vQeC4UP2+MfBCoSAVhj4kPWGUhJVZkiH/qQ4wP
	84oasqbkiHbUQgb+8EOs5GaBfmg40M8B0G0/hywKfEyt0GwUJGxsNkjPrWdkr6LQU2KMEEfKTfu
	mRENLQSCX8c
X-Gm-Gg: AYBFou3tFM27jMOLO81XSrVV5N1bsgxU6dzI/BbtK8pdv6zEUdie+kKjysqYFGldYwl
	dbcnUcSK7MorSGf6BFCfMjpV3hrSm9ocoIrAeaIKhBThquyNayUCJPJ+cmENYzr2RkuxP+O5pn3
	DB95xVy0AJyufsav+e5yo94tmTnNuG8c74jmaXK5dR9uIFqufI7fNOkkjr0ZQZrRrFYrXFfcZCd
	yihptVfhzTDet/T7Ng7+JdMAg/PhOwyMauiKHx1ojpcQ8ZgcCy6NBWxXvNXUaEaJmXhlNOjyPiI
	RZMttbs2nyXVHN4YpjJzzc3vrooRrJcdNpfgis5/K+jyX01ItYiSsuXeHn4v7AuJl1o6JLulpWB
	RIRgrLZpvry/joqIxTEGCpjLZQrIdMHNubfgF79kmmKxidVvdmFkQHVcY7HJea8pVk+7a/dvMOY
	SttxQ+nsU2f+dPspXJGrSDWgOaS9SlxXTB
X-Received: by 2002:a17:90b:1b03:b0:39e:6c6a:4b67 with SMTP id 98e67ed59e1d1-3a098dfb096mr11690228a91.49.1790618176588;
        Mon, 28 Sep 2026 10:56:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-18.dlp.protect.broadcom.com. [144.49.247.18])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a49b3eeff1sm26859a91.3.2026.09.28.10.56.10
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:56:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34344599f01so713091eec.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 10:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790618169; x=1791222969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ejipg3r3UVU9vc4qrGUJPGiICgZ3Att93JZtQzMULZA=;
        b=B3x8eZR/ZEc4N5Io2yGpVwbN6GFYmOXZDYvw00uDEZOPKaxEEIDreOZTi5rxDsNhWh
         HexRsHK8hHgozNovMmdehEHUJ2dYrFhp6eRHYC57JU5OfETOZ2cB04T4pqvCFQMJmoLQ
         3CEsYWE9ecTIn09qbx5q+NeEQ31+iatPgb02w=
X-Forwarded-Encrypted: i=1; AKwUvBxgOWPXruNqNUP4rfhl+LyyeMJTzaUEKvCIXI7UXlGJiV05RZh2k/H5RR0XS+4d01uxMidsEPPXkCw=@vger.kernel.org
X-Received: by 2002:a05:7300:3e93:b0:340:f935:5fa with SMTP id 5a478bee46e88-3427384f956mr10865967eec.40.1790618168030;
        Mon, 28 Sep 2026 10:56:08 -0700 (PDT)
X-Received: by 2002:a05:7300:3e93:b0:340:f935:5fa with SMTP id 5a478bee46e88-3427384f956mr10865927eec.40.1790618167270;
        Mon, 28 Sep 2026 10:56:07 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3421dbb2971sm26076069eec.10.2026.09.28.10.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:56:01 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>
Cc: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v2 1/6] panic: Add a notifier chain for pre-kdump callbacks
Date: Mon, 28 Sep 2026 13:55:35 -0400
Message-ID: <81cb85568b36273a8e66215b3e6d671b8488d402.1790014793.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790014793.git.zack.rusin@broadcom.com>
References: <cover.1790014793.git.zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Selected crash callbacks should not require running every panic notifier
before kdump. Add a separate atomic chain with an at-most-once dispatch
helper, and invoke it before panic reaches the kmsg dumpers.

The helper permits another call from the crash path without repeating
callbacks or recursing into them. Document that callbacks may run in NMI
context, with other CPUs running and the kexec lock held.

Link: https://lore.kernel.org/r/aquttpMVKX8e6zGB@pathway.suse.cz
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
New in v2: separate pre-kdump chain, with a set-once dispatch guard.

 include/linux/panic_notifier.h |  3 +++
 kernel/panic.c                 | 26 ++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/include/linux/panic_notifier.h b/include/linux/panic_notifier.h
index 41e32483d7a7..3ad390764a41 100644
--- a/include/linux/panic_notifier.h
+++ b/include/linux/panic_notifier.h
@@ -6,6 +6,9 @@
 #include <linux/types.h>
 
 extern struct atomic_notifier_head panic_notifier_list;
+extern struct atomic_notifier_head panic_pre_kdump_list;
+
+void panic_notify_pre_kdump(char *msg);
 
 extern bool crash_kexec_post_notifiers;
 
diff --git a/kernel/panic.c b/kernel/panic.c
index 213725b612aa..d78e90abb192 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -82,6 +82,10 @@ ATOMIC_NOTIFIER_HEAD(panic_notifier_list);
 
 EXPORT_SYMBOL(panic_notifier_list);
 
+struct atomic_notifier_head panic_pre_kdump_list =
+	ATOMIC_NOTIFIER_INIT(panic_pre_kdump_list);
+EXPORT_SYMBOL_GPL(panic_pre_kdump_list);
+
 static void panic_print_deprecated(void)
 {
 	pr_info_once("Kernel: The 'panic_print' parameter is now deprecated. Please use 'panic_sys_info' and 'panic_console_replay' instead.\n");
@@ -567,6 +571,27 @@ static void panic_other_cpus_shutdown(bool crash_kexec)
 		crash_smp_send_stop();
 }
 
+/**
+ * panic_notify_pre_kdump - invoke selected callbacks before kdump
+ * @msg: Panic message, or NULL for direct crash-kexec entry
+ *
+ * Dispatch at most once per boot, including recursive entry. Callbacks run
+ * with interrupts disabled, possibly in NMI context, before other CPUs have
+ * necessarily stopped. The kexec lock may be held. They must not sleep,
+ * allocate, wait for other CPUs, or call into kexec management operations.
+ * The message is read-only and may only be used during the callback.
+ */
+void panic_notify_pre_kdump(char *msg)
+{
+	static atomic_t started = ATOMIC_INIT(0);
+	unsigned long flags;
+
+	local_irq_save(flags);
+	if (!atomic_xchg(&started, 1))
+		atomic_notifier_call_chain(&panic_pre_kdump_list, 0, msg);
+	local_irq_restore(flags);
+}
+
 /**
  * vpanic - halt the system
  * @fmt: The text string to print
@@ -682,6 +707,7 @@ void vpanic(const char *fmt, va_list args)
 
 	sys_info(panic_print);
 
+	panic_notify_pre_kdump(buf);
 	kmsg_dump_desc(KMSG_DUMP_PANIC, buf);
 
 	/*
