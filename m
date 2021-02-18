Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B97B5C433DB
	for <linux-doc@archiver.kernel.org>; Thu, 18 Feb 2021 06:40:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7273E64E79
	for <linux-doc@archiver.kernel.org>; Thu, 18 Feb 2021 06:40:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbhBRGjE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Feb 2021 01:39:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48036 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230495AbhBRGdz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Feb 2021 01:33:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613629891;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=SmKJbr1ghRBYuWCVlTYOn3L53WGI5otg/AW/GKJqUOE=;
        b=eemc93wEZd6+Pn+F/0MpbyfBoIFirSMf2vq7cMNw+HwyNujNR1wglfPt3G3qv7OumjTGFd
        BeIbFHYWmKtjqiJuy4zLxM0LivKKocX80vGSnLc4oQNd4LK6qTZgc/eJNzGDda3TXWFbsw
        /sjZEVzkE70T6be9AtWq5pvapzPwD6E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-oTsIV7GUPRCTIKjvA24gOA-1; Thu, 18 Feb 2021 01:31:29 -0500
X-MC-Unique: oTsIV7GUPRCTIKjvA24gOA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92F3D1935780;
        Thu, 18 Feb 2021 06:31:26 +0000 (UTC)
Received: from localhost (ovpn-12-112.pek2.redhat.com [10.72.12.112])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id E21D85C730;
        Thu, 18 Feb 2021 06:31:21 +0000 (UTC)
Date:   Thu, 18 Feb 2021 14:31:19 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Chen Zhou <chenzhou10@huawei.com>
Cc:     mingo@redhat.com, tglx@linutronix.de, rppt@kernel.org,
        dyoung@redhat.com, catalin.marinas@arm.com, will@kernel.org,
        nsaenzjulienne@suse.de, corbet@lwn.net, John.P.donnelly@oracle.com,
        prabhakar.pkin@gmail.com, horms@verge.net.au, robh+dt@kernel.org,
        arnd@arndb.de, james.morse@arm.com, xiexiuqi@huawei.com,
        guohanjun@huawei.com, huawei.libin@huawei.com,
        wangkefeng.wang@huawei.com, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kexec@lists.infradead.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v14 06/11] x86/elf: Move vmcore_elf_check_arch_cross to
 arch/x86/include/asm/elf.h
Message-ID: <20210218062508.GH2871@MiWiFi-R3L-srv>
References: <20210130071025.65258-1-chenzhou10@huawei.com>
 <20210130071025.65258-7-chenzhou10@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210130071025.65258-7-chenzhou10@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 01/30/21 at 03:10pm, Chen Zhou wrote:
> Move macro vmcore_elf_check_arch_cross from arch/x86/include/asm/kexec.h
> to arch/x86/include/asm/elf.h to fix the following compiling warning:
> 
> make ARCH=i386
> In file included from arch/x86/kernel/setup.c:39:0:
> ./arch/x86/include/asm/kexec.h:77:0: warning: "vmcore_elf_check_arch_cross" redefined
>  # define vmcore_elf_check_arch_cross(x) ((x)->e_machine == EM_X86_64)
> 
> In file included from arch/x86/kernel/setup.c:9:0:
> ./include/linux/crash_dump.h:39:0: note: this is the location of the previous definition
>  #define vmcore_elf_check_arch_cross(x) 0
> 
> The root cause is that vmcore_elf_check_arch_cross under CONFIG_CRASH_CORE
> depend on CONFIG_KEXEC_CORE. Commit 2db65f1db17d ("x86: kdump: move
> reserve_crashkernel[_low]() into crash_core.c") triggered the issue.
> 
> Suggested by Mike, simply move vmcore_elf_check_arch_cross from
> arch/x86/include/asm/kexec.h to arch/x86/include/asm/elf.h to fix
> the warning.
> 
> Fixes: 2db65f1db17d ("x86: kdump: move reserve_crashkernel[_low]() into crash_core.c")

Where does this commit id '2db65f1db17d' come from? Here you are fixing
another pathc in the same patchset. Please merge this with patch 05/11.

> Reported-by: kernel test robot <lkp@intel.com>
> Suggested-by: Mike Rapoport <rppt@kernel.org>
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
> ---
>  arch/x86/include/asm/elf.h   | 3 +++
>  arch/x86/include/asm/kexec.h | 3 ---
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/include/asm/elf.h b/arch/x86/include/asm/elf.h
> index 66bdfe838d61..5333777cc758 100644
> --- a/arch/x86/include/asm/elf.h
> +++ b/arch/x86/include/asm/elf.h
> @@ -94,6 +94,9 @@ extern unsigned int vdso32_enabled;
>  
>  #define elf_check_arch(x)	elf_check_arch_ia32(x)
>  
> +/* We can also handle crash dumps from 64 bit kernel. */
> +# define vmcore_elf_check_arch_cross(x) ((x)->e_machine == EM_X86_64)
> +
>  /* SVR4/i386 ABI (pages 3-31, 3-32) says that when the program starts %edx
>     contains a pointer to a function which might be registered using `atexit'.
>     This provides a mean for the dynamic linker to call DT_FINI functions for
> diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
> index 2b18f918203e..6fcae01a9cca 100644
> --- a/arch/x86/include/asm/kexec.h
> +++ b/arch/x86/include/asm/kexec.h
> @@ -72,9 +72,6 @@ struct kimage;
>  
>  /* The native architecture */
>  # define KEXEC_ARCH KEXEC_ARCH_386
> -
> -/* We can also handle crash dumps from 64 bit kernel. */
> -# define vmcore_elf_check_arch_cross(x) ((x)->e_machine == EM_X86_64)
>  #else
>  /* Maximum physical address we can use pages from */
>  # define KEXEC_SOURCE_MEMORY_LIMIT      (MAXMEM-1)
> -- 
> 2.20.1
> 

