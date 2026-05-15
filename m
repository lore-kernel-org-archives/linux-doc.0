Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D634409E0B
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 21:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778879752; cv=none; b=QFDLbkB3isbrkmWBWPOtQyJ4v2U2G2o7V1dZm5kDZOwBniMhFt6bEwZQ9PvjskqRH/pQ8Hix1U3WXU+ohssxpNux5KFP1r8Bf/Vw7nCHd+Zc1wPtO1XZR6fGDVTgp3r3FDwi2OI/y0af20OTdnJAUDRb260typiCbHkQ8QhEvX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778879752; c=relaxed/simple;
	bh=XbUQZxHpNqBquc7KQic463MCIdXLrI/jlIpArje4CQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aGhmf1yuVCp/zy5UPBVdeARmYohdYk14lQm7ARokiceEyFVy5BhguB92033wx5wQL1cav2k53DDg9cqPhXsJ+pUrkQMSNkWwg2qWGF8XT3F8nxkPX+bwLX3pPK5kHLt/1g79RiZrMJ+xg2oUVTH/zfaGT1YakYXAxSBnOOUhgVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CAGQ8a4i; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CAGQ8a4i"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f3c623322bso1046746eec.0
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 14:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778879750; x=1779484550; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+XRl4qspUk2kb6S4/X/JxR4OkIHL9zexMUP1DlnAUlQ=;
        b=CAGQ8a4iH3SSfmaF4RFgv7YATJ5hLTx06I7TdBd+XDrkvC6tnQMpcT31yKe+LlZ9eB
         YbnhOnhixK1Oqvrp2w2OiYYVXQ4w04Ahlk6hz2e8n6HUb7CEygsVYiKsFLYw5tS1rNgm
         sdm8mqMqRI8gJTDDBJNxpp+iEmvQyJRSVxb8iAN7Fb4XYUqx12BZpKi9ghmDtPPDZzqo
         X1jq/0LqaQjl/FEiSf3ZBiKcc2+V+6ZvaoR7QeTqb9G2suC/lmEfAYR0w43FvjyCzdCV
         aMK/gCSz8IVOKKNUL6cdey//sfpHeSfRLV6IZLstHLAiDJH4tHJSxqvlo+2n2hdiQMjC
         hEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778879750; x=1779484550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+XRl4qspUk2kb6S4/X/JxR4OkIHL9zexMUP1DlnAUlQ=;
        b=l4fnxNeGJ7WBjGX1n7QVMphqwOkISOLRiV4zraWtWW+pslus5bVzvOe+HGe+HSi34q
         WUAR5eM03f5vk2H9qWMaZhCHXf7P0/Mhbwe4u5Jlsq8lYzmogzaNShSMgWGK/NdYEugX
         /M09vFQbnkd/u4efp6UAfz5O5X63Dd3Y0rd03q1l2k494AdguzDgzMpgvagfbRj/XRIi
         c/JJImT74rPDV7WXFnWtmWO5kxIqfxtpzppBlugq/TBQTrf1jmBmAJxojBfHxGHXo/Mu
         DfmkcDKiuGS33TU+Atx4OUKwpAWFKFqVK1ntvzSyzIL+I/jnQdUWW5l/kfZorocVRggX
         bljA==
X-Forwarded-Encrypted: i=1; AFNElJ8kl6m2ElMMZUGt5VtoBZZ1b17paP1ll6miTutkikG2HINgtfJvXnIigGcag0t0a+H5D2CJFTMOAY8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj5DHMCXTGtZ3leZnHmE/C829sCRFG1GGzjaEc0jOugH8W/1vp
	uDyEtkhbnKq+7vwA/XU5d3BlaxF6sDaHbn3HxU3lmF1ixkUyY+DHpYzW
X-Gm-Gg: Acq92OGZOU6ezSCI6hMxx/3lZ3NSHqAeercRanhNUlLG2GE3i5yR6omPhx7a/pXExqi
	HV5mvrQVKsZWH3qYEYaFCc3TxaYadZlmhIDie3hYDK9wh277MqR2n2buFPIyrkC8NacUE+ZlzwH
	4unIxYKChZolv/7fnIH7UNqWQplefJ7hPUo0GA866YHj31r8w2QFkR/FRNvYo1Drcymf+iScYB6
	kr1O1lNT57ie0hMeU/WcTfUWwQdEsHnIutaBxzRTMx9l77sbDBe1zXmxSIchV4WIDqhupQCfn1u
	sYbnN4kTogepflgCU1OGMR7Ds7/CTLDXb+MwbZxPMTHi31JMAIckJtqaKm6dLaTRs7E32IiW/CD
	DIFcnpQ4+LZS6p9YPR1h08VWyieZdOYKhnPgbm5mA3f1FIV8swkWHKzYYjxfzy2dN2AbveuCkWI
	KWc9L1uXlPzFOBMENkwT06ogbw3XSSG3s=
X-Received: by 2002:a05:7300:3252:b0:2ea:5057:a31d with SMTP id 5a478bee46e88-3039818a864mr3228730eec.1.1778879749634;
        Fri, 15 May 2026 14:15:49 -0700 (PDT)
Received: from mimas.lan ([2603:8000:df01:38f7:a6bb:6dff:fecf:e71a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2e686sm9461192eec.5.2026.05.15.14.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 14:15:49 -0700 (PDT)
From: Ross Philipson <ross.philipson@gmail.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-integrity@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-efi@vger.kernel.org,
	iommu@lists.linux.dev
Cc: ross.philipson@gmail.com,
	dpsmith@apertussolutions.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	dave.hansen@linux.intel.com,
	ardb@kernel.org,
	mjg59@srcf.ucam.org,
	James.Bottomley@hansenpartnership.com,
	peterhuewe@gmx.de,
	jarkko@kernel.org,
	jgg@ziepe.ca,
	luto@amacapital.net,
	nivedita@alum.mit.edu,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	corbet@lwn.net,
	ebiederm@xmission.com,
	dwmw2@infradead.org,
	baolu.lu@linux.intel.com,
	kanth.ghatraju@oracle.com,
	daniel.kiper@oracle.com,
	andrew.cooper3@citrix.com,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v16 34/38] kexec/slaunch: Secure Launch kexec SEXIT support
Date: Fri, 15 May 2026 14:14:06 -0700
Message-ID: <20260515211410.31440-35-ross.philipson@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260515211410.31440-1-ross.philipson@gmail.com>
References: <20260515211410.31440-1-ross.philipson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prior to running the next kernel via kexec, the Secure Launch code
closes down private SMX resources and does an SEXIT. This allows the
next kernel to start normally, effectively exiting the DRTM
environment.

The function slaunch_finalize() takes a boolean argument that controls
whether a GETSEC[SEXIT] can be issued. When true, the finalize code can
completely shutdown and exit the DRTM. This allows another kernel to
start normally and in turn can re-establish another DRTM session.

In cases where the machine has not been fully shutdown (e.g. when
machine_shutdown() was not called), the SEXIT step cannot be done
(SEXIT will fail if other processors are busy). In these cases SEXIT
is not attempted. This normally occurs on power off or reboot
operations where it doesn't really matter.

Co-developed-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Ross Philipson <ross.philipson@gmail.com>
---
 arch/x86/kernel/slaunch.c | 80 +++++++++++++++++++++++++++++++++++++++
 kernel/kexec_core.c       |  8 ++++
 2 files changed, 88 insertions(+)

diff --git a/arch/x86/kernel/slaunch.c b/arch/x86/kernel/slaunch.c
index f6e6f1b7e18c..b34997a5f541 100644
--- a/arch/x86/kernel/slaunch.c
+++ b/arch/x86/kernel/slaunch.c
@@ -537,3 +537,83 @@ void __init slaunch_fixup_ap_wake_vector(void)
 
 	pr_info("TXT AP startup vector address updated\n");
 }
+
+static inline void smx_getsec_sexit(void)
+{
+	asm volatile ("getsec\n" : : "a" (SMX_X86_GETSEC_SEXIT));
+}
+
+/*
+ * Used during kexec and on reboot paths to finalize the TXT state
+ * and do an SEXIT SMX operation, exiting the DRTM and disabling SMX mode.
+ */
+void slaunch_finalize(int do_sexit)
+{
+	u64 one = TXT_REGVALUE_ONE, val;
+	void __iomem *config;
+
+	if (!slaunch_is_txt_launch())
+		return;
+
+	config = ioremap(TXT_PRIV_CONFIG_REGS_BASE, TXT_NR_CONFIG_PAGES * PAGE_SIZE);
+	if (!config) {
+		pr_emerg("TXT: SEXIT failed to ioremap TXT private registers\n");
+		return;
+	}
+
+	/* Clear secrets bit for SEXIT */
+	memcpy_toio(config + TXT_CR_CMD_NO_SECRETS, &one, sizeof(one));
+	memcpy_fromio(&val, config + TXT_CR_E2STS, sizeof(val));
+
+	/* Unlock memory configurations */
+	memcpy_toio(config + TXT_CR_CMD_UNLOCK_MEM_CONFIG, &one, sizeof(one));
+	memcpy_fromio(&val, config + TXT_CR_E2STS, sizeof(val));
+
+	/* Close the TXT private register space */
+	memcpy_toio(config + TXT_CR_CMD_CLOSE_PRIVATE, &one, sizeof(one));
+	memcpy_fromio(&val, config + TXT_CR_E2STS, sizeof(val));
+
+	/*
+	 * Calls to iounmap are skipped due to the system state this late in the
+	 * kexec process. Local IRQs are disabled and iounmap causes a TLB flush
+	 * which in turn causes a warning. Leaving these mappings is not an issue
+	 * since the next kernel is going to completely re-setup memory management.
+	 */
+
+	/* Map public registers and do a final read fence */
+	config = ioremap(TXT_PUB_CONFIG_REGS_BASE, TXT_NR_CONFIG_PAGES *
+			 PAGE_SIZE);
+	if (!config) {
+		pr_emerg("TXT: SEXIT failed to ioremap TXT public registers\n");
+		return;
+	}
+
+	memcpy_fromio(&val, config + TXT_CR_E2STS, sizeof(val));
+
+	pr_emerg("TXT clear secrets bit and unlock memory complete.\n");
+
+	/*
+	 * Mostly finalized but the system is still in SMX mode. At this point if the
+	 * system has been quiesced, the APs are halted and the current process is
+	 * running on the BSP, a final GETSEC(SEXIT) can be done exiting DRTM/SMX mode.
+	 * This cannot be done on certain boot paths where the system has not been quiesced
+	 * (e.g. where machine_shutdown() has not been called).
+	 */
+	if (!do_sexit)
+		return;
+
+	if (smp_processor_id() != 0)
+		panic("TXT: SEXIT must be called on CPU 0\n");
+
+	/*
+	 * In case SMX mode was disabled, enable it for SEXIT. Clearing the bit
+	 * anytime during DRTM operation will not have an affect until the next
+	 * GETSEC() op is performed.
+	 */
+	cr4_set_bits(X86_CR4_SMXE);
+
+	/* Do the SEXIT SMX operation */
+	smx_getsec_sexit();
+
+	pr_info("TXT SEXIT complete.\n");
+}
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index 2fea396d29b9..dd284e5043ab 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -43,6 +43,7 @@
 #include <linux/kmsg_dump.h>
 #include <linux/dma-map-ops.h>
 #include <linux/sysfs.h>
+#include <linux/slaunch.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -1201,6 +1202,13 @@ int kernel_kexec(void)
 		cpu_hotplug_enable();
 		pr_notice("Starting new kernel\n");
 		machine_shutdown();
+
+		/*
+		 * If a Secure Launch is in progress and the current kernel is
+		 * running as a DRTM with TXT, finalize the Secure Launch state
+		 * and do the GETSEC(SEXIT) returning from SMX mode to do the KEXEC.
+		 */
+		slaunch_finalize(1);
 	}
 
 	kmsg_dump(KMSG_DUMP_SHUTDOWN);
-- 
2.47.3

