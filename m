Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981736;
	b=q/i2ejOVVO1H82NB/SxWZIInh4CosuUOn7Mzrleutz1rI8Ga1RCnXn9clkdb7VFsa2BM
	 RnH5RiRcdpjv9wY/pzOG7PNIx8BzNEPRFdEL5W/JdUnyfEXFAIg2h3pRc0v31LBqZw8FC
	 j7FCCisycL9e7o/r+t/8CdDL+pwEasGAYBrKrfm2mnPZw9D6t1LiS+vf8/G/yAcO6YK5B
	 lJwq5qLxKQ1geqcr7xnxBTEAvIQedKMCXlbGVldS09LD+S/jpMbupG9BtKHwMJp+BQpAW
	 ruEUyzHJUauQ1vebFMZD74ad3D6g7vLNnCclXhPcvYwb4Sx/GqFTMFnkThDg5Jakd6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981736;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=I0NMn6fHPSVKHVHVNpMiE+ggLiJC/6XmQS3TcCioiGQ=;
	b=x6QvlQPncQdCYGMRt4evmQkMR1/wWHcDTjkYwLm7ig8flA8fbw1f14ygNl9/5gZYZszG
	 NDMlVHHr+wKpwtqMBo/63qQshJHks5ru1Zpsw9rTUUlx8jjfGRYvHBSJwWB9gCugagIbL
	 mnQ22zenv7kW7HHwwNHT11pBjrM89i+tKz7y+acTIyNN8moiZFvnSffBeVifTfAcukEUY
	 52Wp6/r6/st89CfDh3st/F8RO1VPu21W86bpyO1JsKIy/3wKHZh2/sTs96KXFMesSrUvx
	 0umkRMfwMKXhUYE6mBkaStqRPxdwDbrL/v4KgCkd2Bhxb8Wpwc3DjNN/g9er5pTkMGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cQgsmFTw;
	arc=none smtp.remote-ip=209.85.221.228
Received: from mail-vk1-f228.google.com (mail-vk1-f228.google.com [209.85.221.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19432606A330
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 06:02:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19432606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=cQgsmFTw
Received: by mail-vk1-f228.google.com with SMTP id 71dfb90a1353d-5eac7220e9cso182598e0c.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 22:02:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981735; x=1795586535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I0NMn6fHPSVKHVHVNpMiE+ggLiJC/6XmQS3TcCioiGQ=;
        b=hg9bKqPzR9VMphJ8P/oIjQjxmNQWALoFqFHFfknLlvHwYqqA0SVZu4Z+Gg4meSAmp7
         z3KgWXH+S7bhRwlafJ91kkPUibseyz1lAe8Jw92piO2qZbeQUOkEDkE+LHFNrdrrG8Cv
         ew1XqDwvrEiR2OEAIF2DPoHinDOpLtAI6VSTPRENb+5lWdwlOoMbo+Jr402NhmCQYDYp
         A3YRYnKn1R2E9FO7MV/D/bF69o9tUq6fzygbxd47tPtxjGYWCOIMaQveqx94r7th2KvW
         ml0LrP8L+id8YRENkJzIv2/3wTLaEh1wj5Q0san/5YY+OM8IYQT7WBiJxPHbPZUPWgY3
         RpSg==
X-Forwarded-Encrypted: i=1; AL+hErFTwMGVX3u5TLaUm6Hqs3AtLuxWV+n6F1nlhNcdJulCWCMzeUunhai6QvwAfk4nAex8o38/4gdKaNA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IOOVpLwfbymK4gb88RVWO7jMECRSj7VleUMRV4Zr7AqqGBkei
	cJgDTsTEGYj+VPKsFL3ZcQJ0oDjhlJMh+1Kfnj1XiNQqAO25VACof68Hm0kh1LpwBVNyfwoxBId
	BVlaDlZFt5Z/Vomuu6aSNF2FWSak4Ot60oBwdhWK8J/X87wQgm5L5jOJexXWx/eHbYMzXINcT3r
	0LBvm97evOtGKi2MrmFDbWiuLVMfEJAE4OSU7ySnE6CeIY8nVzz4aUmoKcjcCDUgnQ00Yy2+pqq
	5eqcux5EB60
X-Gm-Gg: AZFdTZfTNd9UQJOUvppOnYV4/AMkWWD6sSYhacZICQODVRcLWht0zgosWirvp235mzx
	s8ewkd0obzvH5QkRNm0S8rMP0LHjYdIfT7rgbIxwiMUBhwLhMB1QUmq0H/HFOo1OEK8xX6xuX+Z
	WVq7MuHnsaUAdfdcP9vl48CD/wN5ZXcsWDM8+C/ZS02eQfNTY3zMw6cqPmP9ISbdKUkWrjWlIlD
	Knm3+CgCiBevJ/KiZUKajAbgod8fyPsj+5Kb6un3CYWWvnVC8R1xdM+KpH+KEfLs9w/yxAodi7I
	mOekBg3lRM2I1udd+6erg0ZW81LedJGO40Izln+oabVP8c64ghCGL/gHhV2qWPqxdSHxqXVIlzw
	/1Trr/LSdYbFu6IMSH34mpYvT7HyrM3/D8maSmo++bTwvGq1E96zD6y9lALQT4+iFMAP0BFM8M4
	Iz5GOELCGCk5RS5CMKVCwLmyqhtyZsWFIN
X-Received: by 2002:a05:6122:8b10:b0:5ec:d70c:6326 with SMTP id 71dfb90a1353d-5ee6473c5c6mr863454e0c.23.1794981734943;
        Tue, 17 Nov 2026 22:02:14 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5ee64df139asm20405e0c.7.2026.11.17.22.02.13
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 22:02:14 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55d33f412b1so10406231cf.3
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 22:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794981733; x=1795586533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I0NMn6fHPSVKHVHVNpMiE+ggLiJC/6XmQS3TcCioiGQ=;
        b=cQgsmFTwM5SB2ZM0Bg/gt1/Q0oTnQ18Dwfo8w6L0b7OeC4IbvhvQeJlNoEYqCcs0AV
         hW2mmnDo8kWHSfl5URHapNgLKex58j5qyzbnBENcpnmmKMTGUbkTX4Ve1W1tc1hz9PXW
         6XmOmGtcYLw/kfUQOzxC9p3ETLsrJHwQBJh28=
X-Forwarded-Encrypted: i=1; AL+hErEZnBNjaIGYjDdYAza2eWo3QbM5T0Xl1CdKLsr8UsUO5O+EUwEPtXHLWUo845KLIMfw0yNh9gWXnvA=@vger.kernel.org
X-Received: by 2002:a05:622a:551b:b0:55d:1944:a2b9 with SMTP id d75a77b69052e-55d5a5b7756mr24482271cf.51.1794981733048;
        Tue, 17 Nov 2026 22:02:13 -0800 (PST)
X-Received: by 2002:a05:622a:551b:b0:55d:1944:a2b9 with SMTP id d75a77b69052e-55d5a5b7756mr24481831cf.51.1794981732440;
        Tue, 17 Nov 2026 22:02:12 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d58ff0065sm14886841cf.5.2026.11.17.22.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:02:10 -0800 (PST)
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
Subject: [PATCH v4 4/4] x86/vmware: Report guest crashes after kmsg dumpers
Date: Wed, 18 Nov 2026 01:01:51 -0500
Message-ID: <d0f9c1188b5f78bb20bb43737b3cf80c5c0f94f4.1794980455.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794980455.git.zack.rusin@broadcom.com>
References: <cover.1794980455.git.zack.rusin@broadcom.com>
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
v4: No change.

v3: Rebase. No code change from v2.

 arch/x86/include/asm/vmware.h |  1 +
 arch/x86/kernel/cpu/vmware.c  | 62 +++++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index dc3cf8123914..6d3c9922c92b 100644
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
