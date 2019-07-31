Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4FE137D913
	for <lwn-linux-doc@archive.lwn.net>; Wed, 31 Jul 2019 15:39:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729476AbfGaPjH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 31 Jul 2019 11:39:07 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:46476 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729604AbfGaPjH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Jul 2019 11:39:07 -0400
Received: by mail-qt1-f193.google.com with SMTP id h21so66968497qtn.13
        for <linux-doc@vger.kernel.org>; Wed, 31 Jul 2019 08:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vwP4vIc0noA3GXpIp2IQdFlP9YBsdVIQ86rMMFQHlJM=;
        b=bmnJDnBXrFzsPdPJlhIiPTmaGeesbqD7rZSzxNAb8BxmIp23jrZdPfMLRFi14l2ssi
         +MldCdNoTReJdzXbI87YQgXkSZsOY/uTDTfGENd9Z0oAFGj4d08FwR5y5nA3Pyswlt8P
         5OHOTrLRllqWgDkSfrheQcXD3/mUhh7DqVH741r+Pg9+Q7blN+6TT2PrWXHOpftkcrcr
         kBYok4X3V7QSAgSrZWqymy7LSkr3BMjCJqxxhfXbebhSHhsoqSmE1JkNEwPqUHYNS5H1
         ROWgpLyL2FgY3FFvQqmz+ZPEu9uztX7qVxnifJW4I+AahWwcJKKJ2s7dFzQUYdF/h2XQ
         V4vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vwP4vIc0noA3GXpIp2IQdFlP9YBsdVIQ86rMMFQHlJM=;
        b=BdAWrpVTXv88fVyTlyxIeulKcX3ANoKcJQDZEiWda+BCmtAmRnp0xvD7pnw499f+dy
         i3ldk5/FqAHsbnd+uvdodlburMk8up3lUypTbJouF2uodP4Q+xGhfc4jYlJi0x//60oV
         f5Bpuh4xzrUIS/h7vPW6E3NGi7MA8URfp/KtT2Lf7r3h9+oatpgtt5P0BEzEM6KaPIc3
         R+NnYkm4YFIjL4h3w5/vImDOrb7ZTBihZ3dYoBH5Wxd6UpRm0CaMXyMpj8vgAKN6D9wg
         cv54jM7c6xDRJgh3AA/7/wNjDHWqOoxT1jc21y7l3Hdr4MhTyvBd/AxGv98Kg5rPSlfG
         i3dA==
X-Gm-Message-State: APjAAAUJPhC3vuD/Qm8BQ58jPuLigvRIS0V4Hg5u73349kNltr9pv3Jr
        tc1VfFBQWZEIIRODrI7+0bw=
X-Google-Smtp-Source: APXvYqz1tq+CtgHliRp2L5RpkoQXD3KfaK/eiVw7PrmTvCdr9o0f1bBNHtnLrfzZMnLMdMnsyVi8nQ==
X-Received: by 2002:a0c:98e9:: with SMTP id g38mr86986095qvd.187.1564587546083;
        Wed, 31 Jul 2019 08:39:06 -0700 (PDT)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id f25sm35116803qta.81.2019.07.31.08.39.04
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 08:39:05 -0700 (PDT)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, jmorris@namei.org, sashal@kernel.org,
        ebiederm@xmission.com, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        catalin.marinas@arm.com, will@kernel.org,
        linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        marc.zyngier@arm.com, james.morse@arm.com, vladimir.murzin@arm.com,
        matthias.bgg@gmail.com, bhsharma@redhat.com
Subject: [RFC v2 5/8] arm64, kexec: move relocation function setup and clean up
Date:   Wed, 31 Jul 2019 11:38:54 -0400
Message-Id: <20190731153857.4045-6-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190731153857.4045-1-pasha.tatashin@soleen.com>
References: <20190731153857.4045-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently, kernel relocation function is configured in machine_kexec()
at the time of kexec reboot by using control_code_page.

This operation, however, is more logical to be done during kexec_load,
and thus remove from reboot time. Move, setup of this function to
newly added machine_kexec_post_load().

In addition, do some cleanup: add infor about reloction function to
kexec_image_info(), and remove extra messages from machine_kexec().

Make dtb_mem, always available, if CONFIG_KEXEC_FILE is not configured
dtb_mem is set to zero anyway.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
---
 arch/arm64/include/asm/kexec.h    |  3 +-
 arch/arm64/kernel/machine_kexec.c | 47 +++++++++++--------------------
 2 files changed, 18 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/include/asm/kexec.h b/arch/arm64/include/asm/kexec.h
index 12a561a54128..d15ca1ca1e83 100644
--- a/arch/arm64/include/asm/kexec.h
+++ b/arch/arm64/include/asm/kexec.h
@@ -90,14 +90,15 @@ static inline void crash_prepare_suspend(void) {}
 static inline void crash_post_resume(void) {}
 #endif
 
-#ifdef CONFIG_KEXEC_FILE
 #define ARCH_HAS_KIMAGE_ARCH
 
 struct kimage_arch {
 	void *dtb;
 	unsigned long dtb_mem;
+	unsigned long kern_reloc;
 };
 
+#ifdef CONFIG_KEXEC_FILE
 extern const struct kexec_file_ops kexec_image_ops;
 
 struct kimage;
diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
index 0df8493624e0..596c9b9657be 100644
--- a/arch/arm64/kernel/machine_kexec.c
+++ b/arch/arm64/kernel/machine_kexec.c
@@ -42,6 +42,7 @@ static void _kexec_image_info(const char *func, int line,
 	pr_debug("    start:       %lx\n", kimage->start);
 	pr_debug("    head:        %lx\n", kimage->head);
 	pr_debug("    nr_segments: %lu\n", kimage->nr_segments);
+	pr_debug("    kern_reloc: %pa\n", &kimage->arch.kern_reloc);
 
 	for (i = 0; i < kimage->nr_segments; i++) {
 		pr_debug("      segment[%lu]: %016lx - %016lx, 0x%lx bytes, %lu pages\n",
@@ -58,6 +59,19 @@ void machine_kexec_cleanup(struct kimage *kimage)
 	/* Empty routine needed to avoid build errors. */
 }
 
+int machine_kexec_post_load(struct kimage *kimage)
+{
+	unsigned long kern_reloc;
+
+	kern_reloc = page_to_phys(kimage->control_code_page);
+	memcpy(__va(kern_reloc), arm64_relocate_new_kernel,
+	       arm64_relocate_new_kernel_size);
+	kimage->arch.kern_reloc = kern_reloc;
+
+	kexec_image_info(kimage);
+	return 0;
+}
+
 /**
  * machine_kexec_prepare - Prepare for a kexec reboot.
  *
@@ -67,8 +81,6 @@ void machine_kexec_cleanup(struct kimage *kimage)
  */
 int machine_kexec_prepare(struct kimage *kimage)
 {
-	kexec_image_info(kimage);
-
 	if (kimage->type != KEXEC_TYPE_CRASH && cpus_are_stuck_in_kernel()) {
 		pr_err("Can't kexec: CPUs are stuck in the kernel.\n");
 		return -EBUSY;
@@ -143,8 +155,7 @@ static void kexec_segment_flush(const struct kimage *kimage)
  */
 void machine_kexec(struct kimage *kimage)
 {
-	phys_addr_t reboot_code_buffer_phys;
-	void *reboot_code_buffer;
+	void *reboot_code_buffer = phys_to_virt(kimage->arch.kern_reloc);
 	bool in_kexec_crash = (kimage == kexec_crash_image);
 	bool stuck_cpus = cpus_are_stuck_in_kernel();
 
@@ -155,30 +166,8 @@ void machine_kexec(struct kimage *kimage)
 	WARN(in_kexec_crash && (stuck_cpus || smp_crash_stop_failed()),
 		"Some CPUs may be stale, kdump will be unreliable.\n");
 
-	reboot_code_buffer_phys = page_to_phys(kimage->control_code_page);
-	reboot_code_buffer = phys_to_virt(reboot_code_buffer_phys);
-
 	kexec_image_info(kimage);
 
-	pr_debug("%s:%d: control_code_page:        %p\n", __func__, __LINE__,
-		kimage->control_code_page);
-	pr_debug("%s:%d: reboot_code_buffer_phys:  %pa\n", __func__, __LINE__,
-		&reboot_code_buffer_phys);
-	pr_debug("%s:%d: reboot_code_buffer:       %p\n", __func__, __LINE__,
-		reboot_code_buffer);
-	pr_debug("%s:%d: relocate_new_kernel:      %p\n", __func__, __LINE__,
-		arm64_relocate_new_kernel);
-	pr_debug("%s:%d: relocate_new_kernel_size: 0x%lx(%lu) bytes\n",
-		__func__, __LINE__, arm64_relocate_new_kernel_size,
-		arm64_relocate_new_kernel_size);
-
-	/*
-	 * Copy arm64_relocate_new_kernel to the reboot_code_buffer for use
-	 * after the kernel is shut down.
-	 */
-	memcpy(reboot_code_buffer, arm64_relocate_new_kernel,
-		arm64_relocate_new_kernel_size);
-
 	/* Flush the reboot_code_buffer in preparation for its execution. */
 	__flush_dcache_area(reboot_code_buffer, arm64_relocate_new_kernel_size);
 
@@ -214,12 +203,8 @@ void machine_kexec(struct kimage *kimage)
 	 * userspace (kexec-tools).
 	 * In kexec_file case, the kernel starts directly without purgatory.
 	 */
-	cpu_soft_restart(reboot_code_buffer_phys, kimage->head, kimage->start,
-#ifdef CONFIG_KEXEC_FILE
+	cpu_soft_restart(kimage->arch.kern_reloc, kimage->head, kimage->start,
 						kimage->arch.dtb_mem);
-#else
-						0);
-#endif
 
 	BUG(); /* Should never get here. */
 }
-- 
2.22.0

