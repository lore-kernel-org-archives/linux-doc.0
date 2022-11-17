Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A107CC433FE
	for <linux-doc@archiver.kernel.org>; Thu, 17 Nov 2022 04:16:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239135AbiKQEQo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Nov 2022 23:16:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233785AbiKQEP6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Nov 2022 23:15:58 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE115532DE
        for <linux-doc@vger.kernel.org>; Wed, 16 Nov 2022 20:15:55 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id b185so591055pfb.9
        for <linux-doc@vger.kernel.org>; Wed, 16 Nov 2022 20:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mDD27eRVr6Jpi3mv3EpbjZBfO7XDNZID1/HCkNCN7Lc=;
        b=gq4qQ68HZFLk59q+PiEYGf4KzSPXoaHUCGwkgytoBfV4K3UXyLtQ2hMzRC5aOA5dXl
         eaXR7lnrkMQ5OB82HlcrD6e4+rvYsdmKyUGqDxa5dzldStKrUaPEeB+uUO1cNDjU7sFO
         2J5JcdaRhESAPx6/3TBJ+botN3IwFQ8UWQOBPtpqgMKy1AnYeOkWMKa6+1Eig6DYMkYN
         larq/bjcceNN8CMNhOVRKuk2svcVPlK3XafSQL2ljGXKVqEsha6lkNZveRSYragc3+CC
         61+10oaKb+iDkIrMZ3OuvCyQRiXmanL+ElMojCyZc3coiJMeGoDVZzsPVV2FwOPMlM0v
         33tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDD27eRVr6Jpi3mv3EpbjZBfO7XDNZID1/HCkNCN7Lc=;
        b=SYFeEYm0KBgrokpZ0avxuUI4NBtHDMOGizN2uPu1X7zZCTJvvB0Pk7aQc45w9cOwTO
         +CFV0RDSHPdp1rYpDFf79EiGhHG2EJzWQK2KFFptJ+80DbJZ0yDGOcThsag8mLOrg+K4
         +QbfjpBecBLPiwEtjWkoERo+KNhr8KRlGTFf9osm1ShjbMQWAWn+4d+8eDbxx6JP3U5x
         7YqOLx3AhhdfYBiMiLLLlcVd6N4ex5miATCPdzWp4D/glXnwoXDMdfdLI1UZ10oJr+zo
         yO743oQphE2kqTjdfDKFXNNvnPtbClOPljc8K/sYzRR6XgsVmEux0WyYeIyojWMCSe7u
         xyiw==
X-Gm-Message-State: ANoB5pn+KIwTqGoEtXDanBtT+/qrtvdwDpp3PF55R5MtLLxqNq0aGfMQ
        7V4zfJJOO0q/g/S1ZQRmK7oS5Q==
X-Google-Smtp-Source: AA0mqf5V6OHqKAmUjJGcpIKqwpZ/GjFFX4NKQgV3lxyTXpAi69qVN9PHK/mDtD9wPzRAO4Z61xHymQ==
X-Received: by 2002:a63:712:0:b0:438:e0dc:9c53 with SMTP id 18-20020a630712000000b00438e0dc9c53mr478580pgh.322.1668658555199;
        Wed, 16 Nov 2022 20:15:55 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id fu15-20020a17090ad18f00b0020d51aefb82sm431788pjb.19.2022.11.16.20.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 20:15:54 -0800 (PST)
Date:   Wed, 16 Nov 2022 20:15:51 -0800
From:   Deepak Gupta <debug@rivosinc.com>
To:     Xianting Tian <xianting.tian@linux.alibaba.com>
Cc:     paul.walmsley@sifive.com, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, anup@brainfault.org, heiko@sntech.de,
        guoren@kernel.org, mick@ics.forth.gr,
        alexandre.ghiti@canonical.com, bhe@redhat.com, vgoyal@redhat.com,
        dyoung@redhat.com, corbet@lwn.net, Conor.Dooley@microchip.com,
        bagasdotme@gmail.com, kexec@lists.infradead.org,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, crash-utility@redhat.com,
        heinrich.schuchardt@canonical.com, k-hagio-ab@nec.com,
        hschauhan@nulltrace.org, yixun.lan@gmail.com
Subject: Re: [PATCH V5 1/2] RISC-V: Add arch_crash_save_vmcoreinfo support
Message-ID: <20221117041551.GA2197698@debug.ba.rivosinc.com>
References: <20221026144208.373504-1-xianting.tian@linux.alibaba.com>
 <20221026144208.373504-2-xianting.tian@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20221026144208.373504-2-xianting.tian@linux.alibaba.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 26, 2022 at 10:42:07PM +0800, Xianting Tian wrote:
>Add arch_crash_save_vmcoreinfo(), which exports VM layout(MODULES, VMALLOC,
>VMEMMAP ranges and KERNEL_LINK_ADDR), va bits and ram base for vmcore.
>
>Default pagetable levels and PAGE_OFFSET aren't same for different kernel
>version as below. For pagetable levels, it sets sv57 by default and falls
>back to setting sv48 at boot time if sv57 is not supported by the hardware.
>
>For ram base, the default value is 0x80200000 for qemu riscv64 env and,
>for example, is 0x200000 on the XuanTie 910 CPU.
>
> * Linux Kernel 5.18 ~
> *      PGTABLE_LEVELS = 5
> *      PAGE_OFFSET = 0xff60000000000000
> * Linux Kernel 5.17 ~
> *      PGTABLE_LEVELS = 4
> *      PAGE_OFFSET = 0xffffaf8000000000
> * Linux Kernel 4.19 ~
> *      PGTABLE_LEVELS = 3
> *      PAGE_OFFSET = 0xffffffe000000000
>
>Since these configurations change from time to time and version to version,
>it is preferable to export them via vmcoreinfo than to change the crash's
>code frequently, it can simplify the development of crash tool.
>
>Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
>---
> arch/riscv/kernel/Makefile     |  1 +
> arch/riscv/kernel/crash_core.c | 21 +++++++++++++++++++++
> 2 files changed, 22 insertions(+)
> create mode 100644 arch/riscv/kernel/crash_core.c
>
>diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
>index db6e4b1294ba..4cf303a779ab 100644
>--- a/arch/riscv/kernel/Makefile
>+++ b/arch/riscv/kernel/Makefile
>@@ -81,6 +81,7 @@ obj-$(CONFIG_KGDB)		+= kgdb.o
> obj-$(CONFIG_KEXEC_CORE)	+= kexec_relocate.o crash_save_regs.o machine_kexec.o
> obj-$(CONFIG_KEXEC_FILE)	+= elf_kexec.o machine_kexec_file.o
> obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
>+obj-$(CONFIG_CRASH_CORE)	+= crash_core.o
>
> obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
>
>diff --git a/arch/riscv/kernel/crash_core.c b/arch/riscv/kernel/crash_core.c
>new file mode 100644
>index 000000000000..b351a3c01355
>--- /dev/null
>+++ b/arch/riscv/kernel/crash_core.c
>@@ -0,0 +1,21 @@
>+// SPDX-License-Identifier: GPL-2.0-only
>+
>+#include <linux/crash_core.h>
>+#include <linux/pagemap.h>
>+
>+void arch_crash_save_vmcoreinfo(void)
>+{
>+	VMCOREINFO_NUMBER(VA_BITS);
>+	VMCOREINFO_NUMBER(phys_ram_base);
>+
>+	vmcoreinfo_append_str("NUMBER(PAGE_OFFSET)=0x%lx\n", PAGE_OFFSET);
>+	vmcoreinfo_append_str("NUMBER(VMALLOC_START)=0x%lx\n", VMALLOC_START);
>+	vmcoreinfo_append_str("NUMBER(VMALLOC_END)=0x%lx\n", VMALLOC_END);
>+	vmcoreinfo_append_str("NUMBER(VMEMMAP_START)=0x%lx\n", VMEMMAP_START);
>+	vmcoreinfo_append_str("NUMBER(VMEMMAP_END)=0x%lx\n", VMEMMAP_END);
>+#ifdef CONFIG_64BIT
>+	vmcoreinfo_append_str("NUMBER(MODULES_VADDR)=0x%lx\n", MODULES_VADDR);
>+	vmcoreinfo_append_str("NUMBER(MODULES_END)=0x%lx\n", MODULES_END);
>+#endif
>+	vmcoreinfo_append_str("NUMBER(KERNEL_LINK_ADDR)=0x%lx\n", KERNEL_LINK_ADDR);
>+}
>-- 
>2.17.1
>

I had been looking around to play around with crash-utility.
Applied v5 patches, triggered a crash and have been able to use crash tool with commands 
like vtop/bt.

Tested-by: Deepak Gupta <debug@rivosinc.com>

Thanks
debug

