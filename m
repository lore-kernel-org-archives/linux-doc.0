Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794982117;
	b=JM5joIUGm+T/Q4Dk/cCCn75FTWN32pudMuC3k8y9rfI64rmlAAJqhNt9CprAWVxHlwfl
	 vJU8DjMe+ptYfvPePqCeRoZzOhHq48qzcvC8ncAFw57lxmPNuqvjH0K0keZalYhqktBDW
	 IxRI1xcCwOZF+0z/ltBhZMDtDXFpJUucimMaE2OCidJ44CO1IIK5qC3yY5PynjBcFH/OT
	 tfkbNVpsyml3lrJi/ged5xCV0/Ue+o8mAVr1FnoLGosURpTnCK2fiC+cWFEoS4+2tKrlX
	 0kIjf5DIIpz9QaV6qHOhRIs1S1mfjMd5Totvq1/JFxc6BxImfqqgr845+5QPutnWGnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794982117;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=hDAVKUxd5qtHRxyEIWChofvlPqSC6zajAOsizwKxViY=;
	b=LU/anegSM5JieHVeUuFOG9Tsc13mzOqZDW4vY4wqs9v5XjV3Cu6LC2NusJJM0ykv2VkQ
	 qpq0VsRzc0FKcZ6HjxcY1xPSL0hGDWVgpPtnmwpUosmiEDL+MJESbCcojWrdKHNNsuNC7
	 +PItWE73Re1mxvYxoeEmvbOvft9/x6X+tgCJ6d10Irl5u7LrZS0CeB++lbd1AOkjIsZUx
	 LuYVl22Wa8VXP9QqykbXk4ue+V2uaI4Sh7KDazzh7Q+zaPPrH3vacImpbFP5RFRd+DOEY
	 FWbrrlAj34kuIWjhGdcuFCdJPcvzYurFohVEWJsMz/VOUsi0EWoAaz9N/x6ECoaP9rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=f3T48mLl;
	arc=none smtp.remote-ip=209.85.217.97
Received: from mail-vs1-f97.google.com (mail-vs1-f97.google.com [209.85.217.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4D8606A31C
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 06:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F4D8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=f3T48mLl
Received: by mail-vs1-f97.google.com with SMTP id ada2fe7eead31-7d6a6776719so331023137.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 22:08:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794982116; x=1795586916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hDAVKUxd5qtHRxyEIWChofvlPqSC6zajAOsizwKxViY=;
        b=m/H+tnGRenExI59h75gqAkDPTTzfS7gnUfxz0JsbWS175+vCK3EFMG7f0dKcOmwRBr
         wIXDEt9khlUmeAN/31SNmeORTF+VrF0Jv77XUSGYpj0brc2KjF85fkUQ8QMXWNh3mOqK
         oSHZD08IsZ2IpPOgUbbOscYUJx2bgH5+gsrLW57DQk9b0sf5u87ZD09fLcsFIpNtBABX
         z5n986gILDMSP4g1ZQRG3aBTxj8D4OgrQWbfmo4mRvQKa08Lpr0gt03clVXhd5TnmB7d
         hZw1yfOXWvXA81EcS+XS4pK3HHASZARroAIdew4gyBWGAl3UB8SQR+7fkqKtNKIJxx4I
         WSqg==
X-Forwarded-Encrypted: i=1; AL+hErHgQPpDLlPUX2z3s7phZZZkV3s//5qNTvSRYKVF+cMpQAEEwMrBeMFjFsdynUGUEElYGsv/axSMzT8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kMa9O+L0SHD++UF2bvkwaCr1PKlSrpRnC2tMoSOkdWx2UYhJU
	fMf24xuk5RTa0qUGhpt9ILulCjv7xlS93JJuTschax40TdAeMaaf3Wr/W1zM/z1l7/sy7TGyPN1
	ApXPo+WyOWbv3XpHaMiIuHly1NgTEllod2UEw+EzTRIUJNeXZY409QnLY9uTsfxKbAXDHTV6KLa
	w1iU0uuIA5Fd2Zit1a2u/VpadNJGcLpLRQ8sQ9BMf+ineeDINmqV1pyEKSd9jOVMn5J5hs5jZEL
	o6OznU9k2Pd
X-Gm-Gg: AYBFou1qoCHKcRI/Z0oFE3prOExM2kCNDsMv2I7SRrgstIQRgxz5P+uXpKaF3QloEyB
	H58MYCvpt+4to3wskfXXxsRHhp1z7h5B5xhNUf1UDa2D98+6NLy+stzP1NPoaS1XCr85mDQcJ3h
	Ukrsr5G78arrpafBHCBHkQz/Pia6iyiMeA2/pU7SGLlrcRtJl3hUm33Z0pQhB0vrfGnOH08ObVx
	icZLRF7eFMCo2tEFxjjyLf7ISx6bCpbS5eSOSpglaGEQ09kVv04dWwES4Ern4mwLab6/x/M/aqM
	xNCxU8ebovwiC3UkI95ZgfztZuhWT9qsBdHVKbJttd0xJCt3v9gVmt564zqZtdnwGE6RKBJbmgZ
	6Rl43yGoujZ9QPzJ27yAH0PxneKlnxmohCgugrEmWYy94nrjzv3iO2d4eFuJ+Um1LKIQ42H+Uq/
	B44uRwOvut5WasYJ2rkacHwt1M7LEJ5FZ2
X-Received: by 2002:a05:6102:1608:b0:7b4:879c:bb76 with SMTP id ada2fe7eead31-7d6ba45bc9fmr540893137.21.1794982116189;
        Tue, 17 Nov 2026 22:08:36 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e4a656fa1sm166400241.19.2026.11.17.22.08.35
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 22:08:36 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eab0467c89so718107e0c.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 22:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794982115; x=1795586915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hDAVKUxd5qtHRxyEIWChofvlPqSC6zajAOsizwKxViY=;
        b=f3T48mLlt+Dop6dB+mrXeEZjCaiRkYvmnueKwAjrFe75Z5EUcTWjA2tJjsIbqGfJmq
         Y0UTVcwxH41wJzQ5pTaAt6J7BH4xFhOXJ3wDO72r0rX5yIMMGzLNYeIQcue5FIktX/Qr
         ktPtvGihB2RZnIeAy3BOTBg7KVoj3Oi4dmWNM=
X-Forwarded-Encrypted: i=1; AL+hErE/6CkO+dAQfexXXhq18NPc4ZFJLIagngiFKpklGS+VFjCCN/vgrFPNmxQyFrpWvlLGpzP5kfg/R6s=@vger.kernel.org
X-Received: by 2002:a05:622a:50e:b0:55b:8632:6d42 with SMTP id d75a77b69052e-55d5a539184mr26035521cf.23.1794981730228;
        Tue, 17 Nov 2026 22:02:10 -0800 (PST)
X-Received: by 2002:a05:622a:50e:b0:55b:8632:6d42 with SMTP id d75a77b69052e-55d5a539184mr26035081cf.23.1794981729786;
        Tue, 17 Nov 2026 22:02:09 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d58ff0065sm14886841cf.5.2026.11.17.22.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:02:05 -0800 (PST)
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
Subject: [PATCH v4 3/4] x86/vmware: Add the vmware_record_panic_msg sysctl
Date: Wed, 18 Nov 2026 01:01:50 -0500
Message-ID: <4c5de34b10f579368b890eaa9333a2755886bad3.1794980455.git.zack.rusin@broadcom.com>
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

Allow administrators to disable host log transfer on ordinary guests or
opt in on encrypted guests. Expose the boolean recording policy through
kernel.vmware_record_panic_msg using proc_dobool(), as Joel suggested.
Zero disables recording, nonzero integers enable it, and reads return
0 or 1.

Register the sysctl only after the logger is ready. A registration failure
leaves the internal default in force. Document that the log is sent
before kdump, and that disable_panic_notifiers_platform_list also skips
it.

Link: https://lore.kernel.org/r/4e73yd2ofpdzl6rptzvd74no3hnyfblknoq7wzxlw7f3zjbz7c@srfabx6lsusj
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
v4: No change.

v3: Document the platform list ordering and the disable switch, and fix
the short section-title underline reported by Sashiko. No code change
from v2.

 Documentation/admin-guide/sysctl/kernel.rst | 20 ++++++++++++++++++++
 arch/x86/kernel/cpu/vmware.c                | 15 +++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 608055d7ccc4..be2d5aa52362 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1680,6 +1680,26 @@ entry will default to 2 instead of 0.
 = =============================================================
 
 
+vmware_record_panic_msg
+=======================
+
+Controls whether kmsg data is written to the host's ``vmware.log`` on
+panic. This setting does not control the separate VMware guest-crash
+event. Writing zero disables recording; writing a nonzero integer
+enables it. Reads return 0 or 1.
+
+= ==============================================================
+0 Do not write kmsg data to ``vmware.log``. This is the default
+  for encrypted guests.
+1 Write kmsg data to ``vmware.log``. This is the default for
+  ordinary guests.
+= ==============================================================
+
+The data is written by a platform panic notifier: early in panic,
+before kdump, and also when a fatal oops enters kdump without a panic.
+Setting ``disable_panic_notifiers_platform_list`` skips it as well.
+
+
 warn_limit
 ==========
 
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 0c6f7248a665..8c8b6dd7c3e8 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -33,6 +33,7 @@
 #include <linux/reboot.h>
 #include <linux/sizes.h>
 #include <linux/static_call.h>
+#include <linux/sysctl.h>
 #include <linux/wordpart.h>
 #include <linux/sched/cputime.h>
 #include <asm/div64.h>
@@ -260,6 +261,16 @@ static int vmware_log_rpc(const char *buffer, size_t length)
 static struct page *vmware_panic_page;
 static bool vmware_record_panic_msg;
 
+static const struct ctl_table vmware_panic_sysctls[] = {
+	{
+		.procname	= "vmware_record_panic_msg",
+		.data		= &vmware_record_panic_msg,
+		.maxlen		= sizeof(vmware_record_panic_msg),
+		.mode		= 0644,
+		.proc_handler	= proc_dobool,
+	},
+};
+
 static int vmware_panic_log_notify(struct notifier_block *nb,
 				   unsigned long action, void *data)
 {
@@ -311,6 +322,10 @@ static int __init vmware_panic_log_init(void)
 		vmware_panic_page = NULL;
 	}
 
+	if (vmware_panic_page && IS_ENABLED(CONFIG_SYSCTL) &&
+	    !register_sysctl("kernel", vmware_panic_sysctls))
+		pr_err("failed to register panic log sysctl\n");
+
 	return 0;
 }
 early_initcall(vmware_panic_log_init);
