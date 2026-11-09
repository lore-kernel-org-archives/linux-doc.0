Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203294;
	b=yBI3z3xSFGJZ71UP4o4k+hFmWLOo0/39t/4FUY4E7sl/M8k+dE4Jlkwb8f56mT4Rdwqg
	 QFJyDRiaUUw/wsGBS3JF97V9aMzzLL7JFXV0+Pqpmn8ifaGEZeJ+JJKQoRv1C3rEYO6Of
	 9rxZWL4YL0K3+VodIwhrFTsbskG8E5YVfXGUg918cHX9j7nWpFyxlr3iByRyKDSItszTZ
	 jZ93jre4+/WgIDXcX7a4Fl6aHhq6YcUJmNGv/TljBmDUZvYQlWnnj58/Af/HsChxIfz+y
	 x+a59V1qYc5gLlSprH57dQLAfZK3RmYFuZ/yPKMLTfLexlkWsoRhOVLf7EYj5MJpSnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203294;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=gWw97lsSXhpRitO5f1gnEdnOwIiPfae0nOjP6jdEUEo=;
	b=FCGVC1xGchx5G0z44qWOjzD7VUQZwR9jpOsgdQXM90oKqj33tAJSayN1VqOVewKbjfYe
	 +5x5t574PgLsLD+SvM9lIMrjgDsFI4WrAQhkyUziirEfpv1jOu5x4zI9qaTBHdPFgDW/N
	 NGygBdS0rJyd6pce+/zjnkdjWnquI13CeYz0Ch9AaGFavKtwvsw0Uxc+vEkUkJRchGIfM
	 Y40KM4WTS9R2+NkGb8eGgakKPBzatBHhiNpubSqYUqvaI+LwSjPo2gRtBUqYDqH0dNA3b
	 mwNTa6y2pSynh7g70Ytt3I846wCnsVw8DIc7v50t6NDq63hHOcM8LPeZZ0bK/g04i0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SMj+wkuP;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FC7606A31C
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 05:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86FC7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=SMj+wkuP
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso320989a91.2
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 21:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203293; x=1794808093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gWw97lsSXhpRitO5f1gnEdnOwIiPfae0nOjP6jdEUEo=;
        b=Ne/dBNhx/S/cPfKBANJl4VLQTDnn6GSVUFdnkVxgoo+7wEjnkZ8S3SHxn1pZ+qDnrC
         1h6DS3DfV/dJ0mTTC7pkBmYg4FtdJyBUWZCoH13KdbkOFpEjoY0kfgtk1D+w5xnjhtHi
         CkvyHefmnwxUN/KQCqk5ObThVMtjRLEMCFuyRyQGEz+W15gkOX+SmYqlAl6vB4DDvubw
         XcCqlrhQM4RjCXXfetB8vAsHQxB0QORKpMiyuOOekoEpMGQDbBDY9ckjJ67aaZwXlU06
         2vNoMlLcg1udVywq/kvyDtX/2Wf/gM44CnbUJjll1mvwH12lYYKFaBjF8CLm8d/2zogP
         QWLQ==
X-Forwarded-Encrypted: i=1; AL+hErGUekJd/rh5HxrTEVzBYXsG0axDxYxmCITB1G/wxkI+uDzmOz8WTbh8yJKPTtfIDkIo/hNX3hrJgt8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VsxmNVEMrd8NFgCVEUrEzNDoLlOlqOvN2TJHo9ALCbsTv2Gjc
	U8e4t1TFFW0rXjHvz+ylUAUG36v/oOKEBiJTzR+ftbVNGVXBn9dPgXhDYmAICSX1Ealls0Asdc9
	az30ysE3kFbAXtAZH5EnKhuMaWq8giC853AsqCaWJVwypzi6HvTXQydF70i+1d7eVxEOzomB2kF
	YfSdLHriLEOkUl8PsvvXcdX/W1yl/xJbYJh0yrU7Q0d3rLY2ZiPS67iWbZk17kRgPdNTpqSPIyx
	lZxdJ6V2ueV
X-Gm-Gg: AYBFou2ECKiSFM0JF7zRDP52VeWu29F4NKTtVGIxKhYkFWRcECKHFNu3jcPeo4shgp8
	eBxM35w+FIKnTBCI8l2jkuXud9k+/RjL/UcARl/i2130cpM+spEu0Eqp8U0GjvDF8Nqbv70bxuv
	n88SiraFodhBMlMIsWNY6fT+1DQWeYSHaEZDkNM7CqqRegNh4i4uMODSqEHzCb163owjej4ay45
	GIevwMqxiIjxlKNMr8EPRlfYgChPRCJebVrsHXdzL2HMLXiBDg3LBY7RbZ2T/cKWOkvpzIuAD4x
	d7Y9AVcWJUze8ruESS7XnK6USOiypWCWJ8YDe73kYJ57jIdR2nYhFMTnog9654d8QNtL7ABNyUT
	StTt1tZs4W5r2Eksg45kZewSev88vbutuakSOdQq8QavOF7g9tbNq47xcZykKRlcB274KS+geKi
	5KNmnLMj//ybiWz0hVv+rxbitPQ3WBPvk+
X-Received: by 2002:a17:90b:4487:b0:3ac:450b:164c with SMTP id 98e67ed59e1d1-3b12d522b98mr3154698a91.47.1794203292794;
        Sun, 08 Nov 2026 21:48:12 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b127728964sm2915870a91.1.2026.11.08.21.48.12
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2026 21:48:12 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b0d864826cso544206c88.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 21:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794203291; x=1794808091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWw97lsSXhpRitO5f1gnEdnOwIiPfae0nOjP6jdEUEo=;
        b=SMj+wkuPxAbxNy0Qg1AbvPDZZKjgDLTHSyjRXfiNKRCyJTE/pXUwqr425GIdRXlKoA
         Z+SOiP9lXoQYZ83TuNzdF3PgjDxlCc+djPT8DrO1pmxn88biy8imPCxXVK4/34tqdehG
         EQE5mXahetgqu5CIPQLuuZU3pzmhfgN2FFkFk=
X-Forwarded-Encrypted: i=1; AL+hErGigPM++Z9HXS6hYlnDa46fmlfE4q/Gg12QL/TWEzHiRckgcen7mxyg5/T+4mfF4NV2u7pdqixObY0=@vger.kernel.org
X-Received: by 2002:a05:7022:b052:20b0:1ae:abd0:e2b6 with SMTP id a92af1059eb24-1b39ff033c5mr5293811c88.38.1794203291167;
        Sun, 08 Nov 2026 21:48:11 -0800 (PST)
X-Received: by 2002:a05:7022:b052:20b0:1ae:abd0:e2b6 with SMTP id a92af1059eb24-1b39ff033c5mr5293760c88.38.1794203290476;
        Sun, 08 Nov 2026 21:48:10 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314626dsm13745136c88.1.2026.11.08.21.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:48:09 -0800 (PST)
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
	Ian Forbes <ian.forbes@broadcom.com>,
	Bradley Morgan <brads@mainlining.org>
Subject: [PATCH v3 4/4] x86/vmware: Report guest crashes after kmsg dumpers
Date: Mon,  9 Nov 2026 00:47:40 -0500
Message-ID: <4dc02120a69e0d4b21f1ea3a12b4aedf6f22e706.1794201807.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794201807.git.zack.rusin@broadcom.com>
References: <cover.1794201807.git.zack.rusin@broadcom.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

VMware accepts a structured guest-crash event, but a host configured with
backdoor.coredumpOnCrash may terminate the VM before the hypercall
returns. Keep this event separate from the log sender, which runs
earlier in panic.

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
v3: Rebase. No code change from v2.

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
index 8c8b6dd7c3e8..ead9f50cf89e 100644
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
