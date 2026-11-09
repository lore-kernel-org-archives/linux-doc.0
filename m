Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794203289;
	b=qSlkusntTZf69gwIT6tNyfJnw7COd1/rXoDvPbmhRZFLubOgi9R9fTMhMIN11AAUvZvP
	 BG+koMHotSlVsGN2gaCQRKVU81RtAcVQjlfD2h8/pbguJgI8VElKQR55zcX4BcgLcuR9J
	 LQCwlxwAX/MqYXlGiKB8Uwv3OB2ZXLg/M6LaxtnGGmxA4/J5UAhD+bGf2suWuOmI7pRJq
	 xkYe0PRtNTt45wukTAbRxm12KHAAkt2qqY2j97AO/OM4AWGcCEAW8LZ2eD7AC0zLZdMwM
	 9FRso2XFC2V+wFGvWGEoiK+WSK2MWkKM7yIynD19coQPCdNsRmhoCkSXkZMbe8s7K4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203289;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=JGC1OZer+fxOvlxCzlIKJtRbCmUbw0UPR8fUshisWB0=;
	b=jjKISXZV5KIKESNsdb4jdU8inF41SB5lYWN9nJhKAyK/mYVSokxpXlrz4gaypCr75R6K
	 Z2iOmkGbQ3fzej/od7BSVXPNNIecb5Zdqk3yKkOU4C9SKZLl+TXUK0rD1kXH76O+Lfmkg
	 GI1zoKAi8nYod3EjyAk8dayySg8Xn8K0vlirozkn06J9lDNY6pTc9+IoJRjE2yUOCsXyK
	 qB62s910NikOeDxgsybDsD2TYk66irF3m1PfYr7LUVOciVYOVOv1iF5YtztEuoTMHdlnR
	 W2wSmvvjFXvOhrniiTOnQHyZXqZu4W4u26IXB4z9FMJuXYehMnd5KO8LocQ3VLDZRSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UvGnY4Mj;
	arc=none smtp.remote-ip=209.85.222.228
Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8837C606D801
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 05:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8837C606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=UvGnY4Mj
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-93f3c895a0eso41713385a.2
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 21:48:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203288; x=1794808088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JGC1OZer+fxOvlxCzlIKJtRbCmUbw0UPR8fUshisWB0=;
        b=nnpWpxz9ITKOlBID41FcxcLtblo4FUkhulIaWJ9xy8T0cMEOitGDHphwT0wxtvQKs/
         xCqcMNN2ijF6ojVLuQTBSKvGFUl68ZbUvY3dtrrJaN5Kp4Bni5TBUaU+nRDjmhIXgDn7
         B2ryUSMTGLhXzrbR2bX8o4jE4z6nsFLZKsDL0RRPXAi16WLkQh5yBAIGBB4b3fmSybIb
         pn1B4GI6YunHToUaSzyCyyvT9YvD+AFWs3pdWjqMSbduN2zDfj0MaonJMhM6jVbsMwIK
         aD4LA26sgXn+E+nkeWZqD3GkLgpAPwXKwP2YMq4VyWcWadBsm403bIpYg/gb+Ze9CXeJ
         03lA==
X-Forwarded-Encrypted: i=1; AL+hErGC0N2Thk6cG6ap4VDVB4KLaJBtjRIgZVcYFyV8OJT3Z99xxG5lz6cqVMt4JmjPLAAsMkCwHw3/VLg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m/jY1ZWMuL64vsK4EcUuq1JIGISJkEFUtx0uW3dXhIEf1LphO
	xrfVilg+h1Kga1NXyOjKWU6hUg6krDGWGPKAouiq/4QKMW4uA/sn+SScuDZ1+tPe7AO+OEw0/9W
	MwY73CiL9p0PVE7iW7PTPcyt13ue+61+T52frudaG2L0L2560FP9w8pOgIgfeh9oV1W95Uql1D4
	uyfzXuoFMVv0+zy07n5UXznJBHCfQkkISkPYQIIAnYi+jx1PwdbtF+k5R/xiy+HsrVslmOzhvlV
	SNbhek9amHP
X-Gm-Gg: AYBFou0bZRwlU8YuOHN7kERHhUWOFSxYXfbVxoFafEW4mHarMRsPHrM9VGCHnL4O49O
	E32x+3KHyV8mFzdGR8jIc7iBvEpj00w0Aqt2gA8o7NDuq6TctgekMONmkDZAoQhtM+0MhmzMlIw
	JI/uKvLJcHB/1xXiJg/miWUvasRJdp+J+HSz83H+VMpDLYsLnDVr/Sny9sTQ0ZPKy4cCYJRanlS
	ZDYDfb7YKDLrMAr7i5swXwfiOV9LK9wfZw+xvou5VH9ww/jjuEtc0fCUI41ZpIwAS59NbqiMS1Z
	GhBpyrDqULYZnq0h7W24SCLuUYa8D1Cnf2PvSnk+f6wtngWy17p4qvn88DnuOz4ccNDN+inYyx1
	pccHT6CRJ+8F3XVd2/0L0pjq2r40mPrfHjpF1/pSXZbraYHFI1z2vp8P18EPXXxBEFgh2PDtA8N
	Mmed6kuZ6Bz9P/De3xuDWauoAaVfyMV71J
X-Received: by 2002:a05:620a:4152:b0:945:fcd7:7823 with SMTP id af79cd13be357-947848e1029mr470545985a.63.1794203287611;
        Sun, 08 Nov 2026 21:48:07 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-94782db8accsm32875485a.19.2026.11.08.21.48.07
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2026 21:48:07 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a71dd190b0so2292326c88.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 21:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794203286; x=1794808086; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JGC1OZer+fxOvlxCzlIKJtRbCmUbw0UPR8fUshisWB0=;
        b=UvGnY4MjLynlK25mSf+k6MbC/Z6xgq6t+6Zfnx2aHIz4uaY3WKApFVIlgT0lGLdwDY
         /p0g/PFPtvYmwdUHKGhJ6yMJS8T7KPHdFnPTmqG71BOCj0YuXnRDJ7UtX4Q/Lec4jeWf
         j00lhCCbXjC7ZAIX15UgoI29/i9jXUgWYj2Zo=
X-Forwarded-Encrypted: i=1; AL+hErHPjmwgI4PpFx63WFMJ9UgbG+rChMupMmoOcHkhB5818ZU3XwX7z/snpTvC1h0iziN5SajBT+ZeWY8=@vger.kernel.org
X-Received: by 2002:a05:701a:844d:20b0:153:21e5:4328 with SMTP id a92af1059eb24-1b39fe9a93dmr4799606c88.17.1794203286118;
        Sun, 08 Nov 2026 21:48:06 -0800 (PST)
X-Received: by 2002:a05:701a:844d:20b0:153:21e5:4328 with SMTP id a92af1059eb24-1b39fe9a93dmr4799565c88.17.1794203285441;
        Sun, 08 Nov 2026 21:48:05 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314626dsm13745136c88.1.2026.11.08.21.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 21:48:04 -0800 (PST)
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
Subject: [PATCH v3 3/4] x86/vmware: Add the vmware_record_panic_msg sysctl
Date: Mon,  9 Nov 2026 00:47:39 -0500
Message-ID: <abaa78b64a6f975bae42d8ef523062e55554a28e.1794201807.git.zack.rusin@broadcom.com>
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
