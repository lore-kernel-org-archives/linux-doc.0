Received: from mail-vk1-f226.google.com (mail-vk1-f226.google.com [209.85.221.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF81854706C
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 17:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618209; cv=none; b=r0xyqIyZCISvE1D3XYsR6p1w9Bo8vJejZfi4g0gOa5/RNqSTmtACAJ/f7yaqIUte6YHTkh0UHhl8MPCBwv8kyjnJikuLtQBBmRN8mBA+AZMbFJSKqqHHvJtNujO0GHRkolPFmgVaRkfMDFk86r5vHhbRdZVJOajJJYCVthgnKF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618209; c=relaxed/simple;
	bh=5aQuQm3bDSHDGXMaipi3sPWMnLQu2UOrACug29vYOto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rLzUjLJWpUOKXOupUM55m0hYMAetKlWas0RfCM5r6kUde+3Wo2aJgglFcXTwco5Lq06JXXbAlmNxAb8napVOnSb1MspzCM+0p2PTWBW/W7HGSlKa2lTNu/vJYnbp3VWlOJwchxjXD5QvxFaCJqM8DBjmS9gfca1VgatTUxhGymE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FX/P9BPV; arc=none smtp.client-ip=209.85.221.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FX/P9BPV"
Received: by mail-vk1-f226.google.com with SMTP id 71dfb90a1353d-5cfa94ccd6aso99166e0c.3
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 10:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618206; x=1791223006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rTHP+RKFRTvsoz5ZQC0H2auzr0/LWHqaonCSO4TGaa4=;
        b=ilSRz29BV9cdVXKtvkQeqglujtAuu9sdxQPmg9bdAgKna/6UZ0MKqxr9/Fh1Ra5XUu
         ljPWbWk5ZtLDijQXaBPM3Phb1NIHNd49IZrIwyYLxr9kWH8s43qvlNADeEuBbncDJDDE
         lRAQ2MnY2iiIvcs+cehi/x8NQ60WDchO/gRefk9cqUEUllL9G0v5t6rQPJLsiSB5eCoq
         3qX2fAX4/H0cRAIqsPd/ctJET+xeN+ir2kkqsB/oAV4gamWkDrt1rAhHJYkQ47skdh+7
         DdcQVc1IQvwEEEL9D/vH4gZWBt6U5bxHsJz7GCIOFLIboqe+AG98TCiNCZWT3ba3sW3O
         XXNw==
X-Forwarded-Encrypted: i=1; AKwUvByWIC942VF8XtXeDj1JTHxnVywPyymmvskGhR6mDBfRBA5JC1DZ85MofTkdecVIEtTfD5WXq1v2Udw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6ZgDCcIHV/ahoBVbnx47Y6xXz55i1yErRu05szWLii+JUUiMg
	ZMrIK78kEe13iWDSG7nNOqDkAM1Qcvujt7j002OZ5ImP7SpjAtM9CU6rszvEQto7XUi2vW9/huv
	y/wmAsvB6qPQW5nL2bKHYq0tB+9x7OKp6y3QAk3KrSivzdiHCxoQCm/Haq8LfXP5Y3J4R8HQkxo
	xOsB95RHFvUKHYtLo8OkK/KrrjVAVk4q4ROznkgYiBB2Hm8UBH9/Ji6Nusml9QVvJdo2aojpVW6
	CiDAPOsVn6N
X-Gm-Gg: AYBFou0xx8NQ8XKTdo7Ba2pyBzT+IDIAtaOxoNfXDj4ovpkBF3hZbgwyowilCodjz57
	smhdQzVo23LGfNnb6rKhpYKJbcWI/jt3fvk64XMH8b8tXFDLMw3obKx+aMfskacRNfHw5essUuw
	x01KZFQ/2D8GCBS92kzT1ydTq/OF1q5cwtG/lEYA2MHVsPWtiPU4mCrAiDQosvZ+eYcBepgW0ug
	ANF3dz1cTUPHXTu6hos8DUoDCraQNHbMkAFtrfey55mEIJNwTAgkGACdOtDyzAGGliDDcJKp69Q
	v0sMaUcZW0E2n2EMYCRuYWltHJf+CiEPJ9SAGC6urWcshGtM6T0KGzmkMinsWMeYU+vnUOxSHix
	vMJOjGow93XYs2O1Ycy7INDQDUdL04Z+13Bjm7VwAFjZqmO25TNelFddHZlMXSIx5M/XnDtBPnj
	4QnlS6RmO4tvL8QTv3tw==
X-Received: by 2002:a05:6122:3d08:b0:5c8:3697:9289 with SMTP id 71dfb90a1353d-5cb098076e5mr5105844e0c.8.1790618205260;
        Mon, 28 Sep 2026 10:56:45 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 71dfb90a1353d-5cde684ac11sm1576392e0c.6.2026.09.28.10.56.44
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:56:45 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-342a0e1d8c4so6244210eec.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 10:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790618204; x=1791223004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTHP+RKFRTvsoz5ZQC0H2auzr0/LWHqaonCSO4TGaa4=;
        b=FX/P9BPVFkbcjNSTF8HxmGGgH57JHq1fn3d0nhL9xhDdLrCbqaAF6lygQfW+rJEL1d
         CLJUqr9CG2zkVWJCBvvlQqjpEsWCkNXP98xRyhzvxAo1xZji/52WJqZ3+G5ALwhIuCMV
         bmX4tGSBmOg/na6LX82hVNNXaV9kqBKYZh51M=
X-Forwarded-Encrypted: i=1; AKwUvBwFHE8tlAZeZ76sHOlBj+z+56WakHZFZM4dH1KGljt3rEhwXskp/SUCOXPLlYfwEbTOkR+19figo1o=@vger.kernel.org
X-Received: by 2002:a05:7301:1a02:b0:33e:84c3:a056 with SMTP id 5a478bee46e88-342710ae7bamr9978547eec.17.1790618203885;
        Mon, 28 Sep 2026 10:56:43 -0700 (PDT)
X-Received: by 2002:a05:7301:1a02:b0:33e:84c3:a056 with SMTP id 5a478bee46e88-342710ae7bamr9978508eec.17.1790618203106;
        Mon, 28 Sep 2026 10:56:43 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3421dbb2971sm26076069eec.10.2026.09.28.10.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:56:34 -0700 (PDT)
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
Subject: [PATCH v2 5/6] x86/vmware: Add the vmware_record_panic_msg sysctl
Date: Mon, 28 Sep 2026 13:55:39 -0400
Message-ID: <269888613b5dc16d19899b2c87c5ecdfd2610e8d.1790014793.git.zack.rusin@broadcom.com>
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

Allow administrators to disable host log transfer on ordinary guests or
opt in on encrypted guests. Expose the boolean recording policy through
kernel.vmware_record_panic_msg using proc_dobool(), as Joel suggested.
Zero disables recording, nonzero integers enable it, and reads return
0 or 1.

Register the sysctl only after the logger is ready. A registration failure
leaves the internal default in force. Document that disabling the old
post-notifier ordering does not disable this independent logger.

Link: https://lore.kernel.org/r/4e73yd2ofpdzl6rptzvd74no3hnyfblknoq7wzxlw7f3zjbz7c@srfabx6lsusj
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
v2: use bool/proc_dobool as Joel requested; document direct crash entry.
Maaz's v1 Reviewed-by is omitted for renewed review of the changed sysctl.

 Documentation/admin-guide/sysctl/kernel.rst | 20 ++++++++++++++++++++
 arch/x86/kernel/cpu/vmware.c                | 15 +++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index ffea61d448eb..be13c143b8bb 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1690,6 +1690,26 @@ entry will default to 2 instead of 0.
 = =============================================================
 
 
+vmware_record_panic_msg
+======================
+
+Controls whether panic or fatal-oops kmsg data is written to the host's
+``vmware.log`` before kdump. This setting does not control the separate
+VMware guest-crash event. Writing zero disables recording; writing a
+nonzero integer enables it. Reads return 0 or 1.
+
+= ==============================================================
+0 Do not write kmsg data to ``vmware.log``. This is the default
+  for encrypted guests.
+1 Write kmsg data to ``vmware.log``. This is the default for
+  ordinary guests.
+= ==============================================================
+
+``crash_kexec_post_notifiers=0`` alone does not disable this logger.
+``panic_pre_kdump_postpone=1`` skips early logging but leaves late panic
+logging eligible; set this sysctl to 0 to disable both.
+
+
 warn_limit
 ==========
 
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index ccf8dc84b30e..4b0e5b084c2c 100644
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
