Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E9A4EE876
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 17:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618219; cv=none; b=rIMR1K4e/Sr7h2GGh0RmNCg+yS99CJZqo6/Scc0UStKP6hZ88KvTnrDPBknd3UsJLeG1LApXbFE3PYrQKoEY5UUwWfWk0xmSkizxSHvS1cfn7mzSWI89/K8tWtDcaqWApc+XTCPF+wRbcJm7+zXRGp+sjXdxLdffayMsLBHsc4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618219; c=relaxed/simple;
	bh=CBv00AL3BTLNsUFe9tB6GyqcDTTDzgpUZMK43TlrJOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AA83PJ/1MpsM+C0z9b4DZIdM3kQQxNnKuxnpuc96eBqLnD/pS34OQRIUw7OYmWtB1/DNqsIzLsVFPsjKi1TuStENb7F7HyxhcceSClWSinkZfE7Zarqx4XAYZxaWzK/ttJ0rHq+bIy3Wfri/0O+ormst14XZDgBP36UgwyE31ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Oc/tatWx; arc=none smtp.client-ip=209.85.214.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Oc/tatWx"
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2d944747d41so14940615ad.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 10:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618217; x=1791223017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yiEqvVPcujwO0jzo0ebX90rTLmO4XRBVQ6+xmjHfKA0=;
        b=M4ppbja0ssFGr34CJiRa9qntSzxLVo3beZ+HSnwufH8KJyrK+IVyio/3D4K4JQCkv7
         TN/14IFgq97/Hud2/VBD5YZ23brgtuVD4n4F/ch9f8qn7emzrxl5rxRTp5aBDtPFYktB
         Nj7TGDspaBwAOijyF+HQdxkIooAPZKEOWSrTlVRZE256i6TVRTVcu1WbRdW/ib/AOQA8
         HEh9/IalmL9vz9bzAv6ZJ4+h/EFWph1dCPn0xXehXngjQ0A5DwdpCNlVyov+0wSjkucZ
         PZEutevca4QJE4cRJzH7eSuoaU8KdSdqc4uK+eRGhaty0ukpj5/vkhyQTKNDg9UNoWmb
         eD6Q==
X-Forwarded-Encrypted: i=1; AKwUvBz4Tuu7an7esNY2fF8cgAfY1STHZp2Q6wqiSng9W4oBlIuOxm4YVqF2WaP4mEnGlmGMvoaaBMyjzAE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSDT+8eCbz4yHlVHzydImMP31vXIg53Xjz3X7bfJr7VM8yhmBi
	8KzqsDB5se5bYlMPxnlz5mWn6gKLawe+J9h46IGtNDk07FQKSkG5b35EvKPyksuC9y1aCiRgEpj
	nJ+6QKY6U0z27h10M+i6bIiuT4cXeKu4CIeNjAwjUX5dzHrhf8Cetr02nilTmQenWRGDOUHv44r
	wqdSEi20EGy9uycfQ6steYJlMwnGNVJ9dBlhhumi/gH02slIHNwCSHKGuqw7wgmXmrncABP/yIN
	S/lPRLPsnPS
X-Gm-Gg: AYBFou3xz2qaHM36Oor5P0+YXcuigkOAPH9RiURTIRm7kBNQR27/POrF5YYBiihsHeg
	l4oRvQypN8tTjwwudxdyA3B+vsa33FhU+YWSkMiZOcvVy11W8VnF9XgKMwyGMgEJiE8ZLR14faT
	FksDhywXSbrd5ZltVH5W82FJMQGLI76GgcA7s4cOMCZX3kMCBEMecRFHQmsLYkIATyzm4LTvwdA
	GYCmfPJwmOZKkbA8HWIdZN//GeamKDk74g7nzusfPSnpQq0YL3mpi1fe5cjz6b9lgiJaR22DMB1
	aRo5N9LurtOJCyVSoWVerJV96iGly0dXRQ0mXDC7eRmS7ZbqWVHDzjyhvkhz4SC/n5ZFkGvLUb/
	mHNy0CFHTWaa0qrUDPUV8GHrihGemEaG0PAWEWOmA5Ti57HpDrKWUbOiKOSgCcpNLaZIVosYPJr
	KmlYI8/GW2Zm7t987AojSwlHo+6zWeIWhz
X-Received: by 2002:a17:903:1b68:b0:2c6:90ec:f601 with SMTP id d9443c01a7336-2e2c397f80bmr2614775ad.8.1790618216891;
        Mon, 28 Sep 2026 10:56:56 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2df90f924f8sm4184505ad.3.2026.09.28.10.56.56
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:56:56 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so1957674eec.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 10:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790618215; x=1791223015; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yiEqvVPcujwO0jzo0ebX90rTLmO4XRBVQ6+xmjHfKA0=;
        b=Oc/tatWxDnvlwMpr0nV24f0byzWRqxZ+SCKVdgbWpwgQptPJyrC71TCd3FaQd3Jrvu
         XJ2TkJZ+XBIpSBgDy0aq1cddLdYldvaznSEh4M54z9f23wFw0HOC+8Z44maH+d1ovlUy
         55itRhw8LsAi7JpUkp0ajfXhIp7rDJ7NwvdNU=
X-Forwarded-Encrypted: i=1; AKwUvBx5Y633mG0T9+NTcO9U5wxWz4/Ran6w17DHr0vNl+vS+mNTN35Kd69rbPfJSF62gkU0/XJfHpsgRDo=@vger.kernel.org
X-Received: by 2002:a05:7300:561c:b0:33c:343a:1045 with SMTP id 5a478bee46e88-342702bf61dmr9331308eec.10.1790618214824;
        Mon, 28 Sep 2026 10:56:54 -0700 (PDT)
X-Received: by 2002:a05:7300:561c:b0:33c:343a:1045 with SMTP id 5a478bee46e88-342702bf61dmr9331262eec.10.1790618214131;
        Mon, 28 Sep 2026 10:56:54 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3421dbb2971sm26076069eec.10.2026.09.28.10.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:56:46 -0700 (PDT)
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
Subject: [PATCH v2 6/6] x86/vmware: Report guest crashes after kmsg dumpers
Date: Mon, 28 Sep 2026 13:55:40 -0400
Message-ID: <996d3ceefd98ed9a7c40508e6f62039ba5a15325.1790014793.git.zack.rusin@broadcom.com>
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

VMware accepts a structured guest-crash event, but a host configured with
backdoor.coredumpOnCrash may terminate the VM before the hypercall
returns. Keep this event separate from the pre-kdump log sender.

Register a panic-only kmsg dumper with late_initcall_sync(), after built-in
dumpers registered by then. Skip the event while a crash kernel is loaded
so the host cannot terminate the guest before kdump saves its vmcore.

Issue the event at most once. With CONFIG_PRINTK=n, use a late INT_MIN
panic notifier. An unexpected dumper registration failure with printk
enabled leaves reporting disabled rather than overtaking working dumpers.

Link: https://lore.kernel.org/r/20260309235250.2611115-4-alexey.makhalov@broadcom.com
Co-developed-by: Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>
Signed-off-by: Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>
Co-developed-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
v2: keep the terminating event separate from the pre-kdump logger.
Maaz's v1 Reviewed-by is omitted for renewed review of the new ordering.

 arch/x86/include/asm/vmware.h |  1 +
 arch/x86/kernel/cpu/vmware.c  | 62 +++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index 598d4cd448ec..ea2ce5272a00 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -61,6 +61,7 @@
 #define VMWARE_CMD_GETHZ		45
 #define VMWARE_CMD_GETVCPU_INFO		68
 #define VMWARE_CMD_STEALCLOCK		91
+#define VMWARE_CMD_REPORTGUESTCRASH	102
 /*
  * Hypercall command mask:
  *   bits [6:0] command, range [0, 127]
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 4b0e5b084c2c..70553da771c9 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -22,9 +22,12 @@
  */
 
 #include <linux/dmi.h>
+#include <linux/atomic.h>
+#include <linux/crash_core.h>
 #include <linux/init.h>
 #include <linux/export.h>
 #include <linux/kmsg_dump.h>
+#include <linux/limits.h>
 #include <linux/mm.h>
 #include <linux/panic_notifier.h>
 #include <linux/clocksource.h>
@@ -330,6 +333,65 @@ static int __init vmware_panic_log_init(void)
 }
 early_initcall(vmware_panic_log_init);
 
+static atomic_t vmware_crash_reported = ATOMIC_INIT(0);
+
+static void vmware_report_guest_crash(void)
+{
+	if (kexec_crash_loaded())
+		return;
+	if (atomic_xchg(&vmware_crash_reported, 1))
+		return;
+
+	vmware_hypercall1(VMWARE_CMD_REPORTGUESTCRASH, 0);
+}
+
+static void vmware_crash_report_dump(struct kmsg_dumper *dumper,
+				     struct kmsg_dump_detail *detail)
+{
+	vmware_report_guest_crash();
+}
+
+static struct kmsg_dumper vmware_crash_report_dumper = {
+	.dump = vmware_crash_report_dump,
+	.max_reason = KMSG_DUMP_PANIC,
+};
+
+static int vmware_crash_report_notify(struct notifier_block *nb,
+				      unsigned long action, void *data)
+{
+	vmware_report_guest_crash();
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block vmware_crash_report_nb = {
+	.notifier_call = vmware_crash_report_notify,
+	.priority = INT_MIN,
+};
+
+static int __init vmware_crash_report_init(void)
+{
+	int ret;
+
+	if (!hypervisor_is_type(X86_HYPER_VMWARE))
+		return 0;
+
+	ret = kmsg_dump_register(&vmware_crash_report_dumper);
+	if (!ret)
+		return 0;
+	if (IS_ENABLED(CONFIG_PRINTK)) {
+		pr_err("failed to register crash report dumper: %d\n", ret);
+		return 0;
+	}
+
+	ret = atomic_notifier_chain_register(&panic_notifier_list,
+					     &vmware_crash_report_nb);
+	if (ret)
+		pr_err("failed to register crash report notifier: %d\n", ret);
+
+	return 0;
+}
+late_initcall_sync(vmware_crash_report_init);
+
 #ifdef CONFIG_PARAVIRT
 static struct cyc2ns_data vmware_cyc2ns __ro_after_init;
 static bool vmw_sched_clock __initdata = true;
