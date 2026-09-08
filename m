Received: from mail-oo1-f97.google.com (mail-oo1-f97.google.com [209.85.161.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A849735CBC3
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 18:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890870; cv=none; b=TsPGXCGuMOZZTgR4SIfHBmynAOLwSuyhbbAwE6fJtO4ivL7JYKYiCUID/2JeG24d5is94JtX8G++PYC2mxPn1JdcbTfWYqeAw25phsJwJJ+9tI0sl2TN2HryQdN7LhuMyVahT7Za0olJWmEJczATKbuD5YPtCcJXn6DGK2FgiJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890870; c=relaxed/simple;
	bh=j2DJfVUt0mtvNFgR9qjhwA26YfFt3lRsoWgx9vJ3wP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jvGh2D/LhbiMfZSKjYvbWmURDic4zgeWHqrSXk2r6WXTIfkBXrUC4cu8x3wCeR+JTb221v6urFjC9CIMpGCcj2Q3bvpMiVqy5a/7kr5jxcHIr20ykZZi7uddgSkwSqi3pnBg7Doj+SPxYxQJS4KjB7DgPO1llBkllB0XZ0RF0MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Ndc26CFr; arc=none smtp.client-ip=209.85.161.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ndc26CFr"
Received: by mail-oo1-f97.google.com with SMTP id 006d021491bc7-6b1c75f0049so3769870eaf.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 11:07:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788890858; x=1789495658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+U6lKJy3E9UudZt3FknVdHylx4G9kfIGWhaOGKfOa4=;
        b=X72GaiYzHPbsPpqHlgZV8idm2Ioui5UNDp3aWTg4uoBJlLHtqv1T8RHHANCX2IHoak
         Gy0n3Wz80DtC2a71pgKVHT2GzujJ3rt6tvRZSvqU6oy0J3GjPVbLdVlOeOmJGrYGFbWp
         rVnb/1mZdt0Epk90qHc193yW2G9jr/q6I2Z0m19cY0B6GqNVMlf8EbB7myos+Wcjl7tR
         AXo9vk4ME0XxwPy1zTlD1x84n1mdu1h5exhil+bKX+o9JdOseE2z/L8IKheHX1e9zer9
         7F28Mek0Hf7f7ALrNDKp9oMJclAeZ+PmEN98wr22k8iMYNhYSJXjs6SfrzPgx904kU3S
         LORw==
X-Forwarded-Encrypted: i=1; AKwUvBxZHtisAc43XwUq9sO5FVY0vk+uy6208Il1+DhP0uCQ6bJpCUKU+aOq5UT563F178kpuR9/PsgBBYY=@vger.kernel.org
X-Gm-Message-State: AFuF++l1gyev5MesmKMVDBC4wUBSKvbLSy8Brd9FPH0FqBct/Dw9r1IJ
	OGykj0rO9RLO/uyq9L5n0Y8dS83G3sIK9poUdX+qtr+SQ4ehE7prV6GbI1adqaR/xSsJFO6SwTR
	Z35rEVh2fraG4AuC43ZtBpZfrH0u0oETrVFQdErZp0bHoXAp/If2MalbML2J7tOenXVzZG2pfyp
	Lr84t8Oe2rShO7Eryc5Z+vofWnNlNovuHCRfPpwObVWjcRm+MlSk8jcWBjeu7VrsPvS7gPfmm7m
	TykHnKNgOnl
X-Gm-Gg: AYBFou1DwOaJb04KpHvtWD6z4TANxfCb/uqoLgW2/L1FVDsOcgggIonVV3YygTOai2u
	7IajMQBJFvKDWuAQAqAiis9n95NIvwMqxdsQQzcJW3ylxQYOkAozyvEtN7HDb+3kIoVjNUcMu61
	HGDj4FB7Yiv6hRbKdJRKuptWks571GMQWrKbFYcAy/Or3AjXSdoS2o81Cv5I34SdP4QOG1SIQxO
	ONln7mR2iVo/TRWcwdL0N6D7tvXt7OUy212+UDN8BHhblNo+kaz4qiE8W8N7S3K65xAXcBH2pOn
	Iw9DnL32Jp0BIqzU1RQUylt7ui7RjCeVdmlQQlCWcYBTHsrvqlbsUaL+C0Jgo9+py4rsetN3peb
	z9Bkb3B/lZUYgi5zDnAURNQWsu0LlEh2Ngs7XsUuWtQsE81ZJNZSk1+MauzRUoANaskpPiwvbFF
	LicAHYPOrKrwci8Hhr9dcywPy6UpPhd+vLkIY=
X-Received: by 2002:a05:6820:c0cd:20b0:6b9:d167:362b with SMTP id 006d021491bc7-6b9d1673f8bmr6235642eaf.66.1788890857875;
        Tue, 08 Sep 2026 11:07:37 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-475550b5892sm243945fac.14.2026.09.08.11.07.35
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2026 11:07:37 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91030f96c70so61295216d6.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 11:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788890855; x=1789495655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+U6lKJy3E9UudZt3FknVdHylx4G9kfIGWhaOGKfOa4=;
        b=Ndc26CFrugjXq2As6EqUSxAzy5IPFhE0gRb5Ody8aE3Lgga1nW+EaIaafzfi46rnl+
         7xMG9uK6b7bnowSvDQtzcsyvuEyYi5kMB4tdX5kvoo1yqEqvmNewNjzsiGi4OUDhJS0+
         EPdbmAeoZOXT9ZAeEJuQ07q1Vozv9hjbTwteI=
X-Forwarded-Encrypted: i=1; AKwUvByjRaVKPtqOrOueGNGUsgls03HWMhZfxEL2HyqIqjZC4+Mn0wxt3xISjhzItmwWOhwDjKXaHzqAPww=@vger.kernel.org
X-Received: by 2002:a05:6214:4905:b0:90e:7e02:cc3f with SMTP id 6a1803df08f44-9103ef88ddemr25982236d6.18.1788890854653;
        Tue, 08 Sep 2026 11:07:34 -0700 (PDT)
X-Received: by 2002:a05:6214:4905:b0:90e:7e02:cc3f with SMTP id 6a1803df08f44-9103ef88ddemr25981186d6.18.1788890853962;
        Tue, 08 Sep 2026 11:07:33 -0700 (PDT)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9106412e038sm27114866d6.20.2026.09.08.11.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:07:29 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Petr Mladek <pmladek@suse.com>,
	Joel Granados <joel.granados@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v1 2/4] x86/vmware: Add the vmware_record_panic_msg sysctl
Date: Tue,  8 Sep 2026 14:07:14 -0400
Message-ID: <03e5c9855e9578b00abf8da69764f1b468597218.1788414671.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788414671.git.zack.rusin@broadcom.com>
References: <cover.1788414671.git.zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Full panic text is useful on ordinary guests. Encrypted guests should
export it only when an administrator opts in. Reporting a crash does not
require transferring the log.

Enable panic recording by default for ordinary VMware guests and disable
it when guest memory encryption is active. Expose the policy as the
boolean kernel.vmware_record_panic_msg sysctl and document that it
controls only the vmware.log transfer.

Register the sysctl only after the panic buffer and dumper are ready, and
only when sysctl support is built. A registration failure leaves the
internal default in force.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 Documentation/admin-guide/sysctl/kernel.rst | 14 +++++++++++++
 arch/x86/kernel/cpu/vmware.c                | 23 +++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index b6328cd0f43e..4577e935ddcf 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1690,6 +1690,20 @@ entry will default to 2 instead of 0.
 = =============================================================
 
 
+vmware_record_panic_msg
+=======================
+
+Controls whether panic kmsg data is written to the host's ``vmware.log``.
+This setting does not control the separate VMware guest-crash event.
+
+= ==============================================================
+0 Do not write panic kmsg data to ``vmware.log``. This is the
+  default for encrypted guests.
+1 Write panic kmsg data to ``vmware.log``. This is the default for
+  ordinary guests.
+= ==============================================================
+
+
 warn_limit
 ==========
 
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index bf59653d6e07..3848811550e9 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -31,6 +31,7 @@
 #include <linux/efi.h>
 #include <linux/reboot.h>
 #include <linux/static_call.h>
+#include <linux/sysctl.h>
 #include <linux/wordpart.h>
 #include <linux/sched/cputime.h>
 #include <asm/div64.h>
@@ -255,6 +256,19 @@ static int vmware_log_rpc(const char *buffer, size_t length)
 }
 
 static struct page *vmware_panic_page;
+static int vmware_record_panic_msg;
+
+static const struct ctl_table vmware_panic_sysctls[] = {
+	{
+		.procname	= "vmware_record_panic_msg",
+		.data		= &vmware_record_panic_msg,
+		.maxlen		= sizeof(vmware_record_panic_msg),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
+	},
+};
 
 static void vmware_panic_log_dump(struct kmsg_dumper *dumper,
 				  struct kmsg_dump_detail *detail)
@@ -263,6 +277,9 @@ static void vmware_panic_log_dump(struct kmsg_dumper *dumper,
 	char *buffer = page_address(vmware_panic_page);
 	size_t length = 0;
 
+	if (!READ_ONCE(vmware_record_panic_msg))
+		return;
+
 	memcpy(buffer, VMWARE_LOG_PREFIX, VMWARE_LOG_PREFIX_LEN);
 	kmsg_dump_rewind(&iter);
 	(void)kmsg_dump_get_buffer(&iter, true,
@@ -283,6 +300,9 @@ static int __init vmware_panic_log_init(void)
 	if (!hypervisor_is_type(X86_HYPER_VMWARE))
 		return 0;
 
+	vmware_record_panic_msg =
+		!cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
+
 	vmware_panic_page = alloc_page(GFP_KERNEL);
 	if (!vmware_panic_page) {
 		pr_err("failed to allocate panic log buffer\n");
@@ -295,6 +315,9 @@ static int __init vmware_panic_log_init(void)
 		__free_page(vmware_panic_page);
 		vmware_panic_page = NULL;
 	}
+	if (vmware_panic_page && IS_ENABLED(CONFIG_SYSCTL) &&
+	    !register_sysctl("kernel", vmware_panic_sysctls))
+		pr_err("failed to register panic log sysctl\n");
 
 	return 0;
 }
-- 
2.53.0

