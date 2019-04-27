Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 95CCC7D08A
	for <lwn-linux-doc@archive.lwn.net>; Sat, 27 Apr 2019 17:58:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726123AbfD0R6h (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 27 Apr 2019 13:58:37 -0400
Received: from casper.infradead.org ([85.118.1.10]:50406 "EHLO
        casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbfD0R6h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 27 Apr 2019 13:58:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=nJGklSTDJqRRTLDP+YFFkcbmoGqftIwmrsGYyeVNxiY=; b=f1XpSOPzSsPsWXta2JFt+XRvn2
        IL5aDj8RaCpk82hnuEUIQx+J5gtMdoQAaNWPagzTp18JGZwdPBBE8izf1cm2ll+o+7rlZWbf7C2/z
        b1rM51nn3R2JhDzyOwQcZIBzUumuc0BaoseixmcTEYUHfRo0o42CStjPqfe2a6Mu5CZemBr9E/LWL
        NtbU7N77W7ZqWYsqGTiswqXqKV1EmKSxA5IRwoeexncN/aFEgInzBHMYuZg8d34PIfC6e282JTnNq
        7cy4+JSuNBiuarwOEFMZxkeTNb/D2B8uAzyCNkEdVQbM7GO+g/7tKEVmkqZb7MMHMUd7bhjfSQJkr
        hFyekP9g==;
Received: from 177.17.250.151.dynamic.adsl.gvt.net.br ([177.17.250.151] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hKRap-0003Hb-13; Sat, 27 Apr 2019 17:58:31 +0000
Date:   Sat, 27 Apr 2019 14:58:26 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Changbin Du <changbin.du@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 16/27] Documentation: x86: convert microcode.txt to reST
Message-ID: <20190427145826.6761a4cf@coco.lan>
In-Reply-To: <20190426153150.21228-17-changbin.du@gmail.com>
References: <20190426153150.21228-1-changbin.du@gmail.com>
        <20190426153150.21228-17-changbin.du@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Fri, 26 Apr 2019 23:31:39 +0800
Changbin Du <changbin.du@gmail.com> escreveu:

> This converts the plain text documentation to reStructuredText format and
> add it to Sphinx TOC tree. No essential content change.
> 
> Signed-off-by: Changbin Du <changbin.du@gmail.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

> ---
>  Documentation/x86/index.rst                   |  1 +
>  .../x86/{microcode.txt => microcode.rst}      | 62 ++++++++++---------
>  2 files changed, 35 insertions(+), 28 deletions(-)
>  rename Documentation/x86/{microcode.txt => microcode.rst} (81%)
> 
> diff --git a/Documentation/x86/index.rst b/Documentation/x86/index.rst
> index 1c675cef14d7..2fcd10f29b87 100644
> --- a/Documentation/x86/index.rst
> +++ b/Documentation/x86/index.rst
> @@ -22,3 +22,4 @@ Linux x86 Support
>     intel_mpx
>     amd-memory-encryption
>     pti
> +   microcode
> diff --git a/Documentation/x86/microcode.txt b/Documentation/x86/microcode.rst
> similarity index 81%
> rename from Documentation/x86/microcode.txt
> rename to Documentation/x86/microcode.rst
> index 79fdb4a8148a..a320d37982ed 100644
> --- a/Documentation/x86/microcode.txt
> +++ b/Documentation/x86/microcode.rst
> @@ -1,7 +1,11 @@
> -	The Linux Microcode Loader
> +.. SPDX-License-Identifier: GPL-2.0
>  
> -Authors: Fenghua Yu <fenghua.yu@intel.com>
> -	 Borislav Petkov <bp@suse.de>
> +==========================
> +The Linux Microcode Loader
> +==========================
> +
> +:Authors: - Fenghua Yu <fenghua.yu@intel.com>
> +          - Borislav Petkov <bp@suse.de>
>  
>  The kernel has a x86 microcode loading facility which is supposed to
>  provide microcode loading methods in the OS. Potential use cases are
> @@ -10,8 +14,8 @@ and updating the microcode on long-running systems without rebooting.
>  
>  The loader supports three loading methods:
>  
> -1. Early load microcode
> -=======================
> +Early load microcode
> +====================
>  
>  The kernel can update microcode very early during boot. Loading
>  microcode early can fix CPU issues before they are observed during
> @@ -26,8 +30,10 @@ loader parses the combined initrd image during boot.
>  
>  The microcode files in cpio name space are:
>  
> -on Intel: kernel/x86/microcode/GenuineIntel.bin
> -on AMD  : kernel/x86/microcode/AuthenticAMD.bin
> +on Intel:
> +  kernel/x86/microcode/GenuineIntel.bin
> +on AMD  :
> +  kernel/x86/microcode/AuthenticAMD.bin
>  
>  During BSP (BootStrapping Processor) boot (pre-SMP), the kernel
>  scans the microcode file in the initrd. If microcode matching the
> @@ -42,8 +48,8 @@ Here's a crude example how to prepare an initrd with microcode (this is
>  normally done automatically by the distribution, when recreating the
>  initrd, so you don't really have to do it yourself. It is documented
>  here for future reference only).
> +::
>  
> ----
>    #!/bin/bash
>  
>    if [ -z "$1" ]; then
> @@ -76,15 +82,15 @@ here for future reference only).
>    cat ucode.cpio $INITRD.orig > $INITRD
>  
>    rm -rf $TMPDIR
> ----
> +
>  
>  The system needs to have the microcode packages installed into
>  /lib/firmware or you need to fixup the paths above if yours are
>  somewhere else and/or you've downloaded them directly from the processor
>  vendor's site.
>  
> -2. Late loading
> -===============
> +Late loading
> +============
>  
>  There are two legacy user space interfaces to load microcode, either through
>  /dev/cpu/microcode or through /sys/devices/system/cpu/microcode/reload file
> @@ -94,9 +100,9 @@ The /dev/cpu/microcode method is deprecated because it needs a special
>  userspace tool for that.
>  
>  The easier method is simply installing the microcode packages your distro
> -supplies and running:
> +supplies and running::
>  
> -# echo 1 > /sys/devices/system/cpu/microcode/reload
> +  # echo 1 > /sys/devices/system/cpu/microcode/reload
>  
>  as root.
>  
> @@ -104,29 +110,29 @@ The loading mechanism looks for microcode blobs in
>  /lib/firmware/{intel-ucode,amd-ucode}. The default distro installation
>  packages already put them there.
>  
> -3. Builtin microcode
> -====================
> +Builtin microcode
> +=================
>  
>  The loader supports also loading of a builtin microcode supplied through
>  the regular builtin firmware method CONFIG_EXTRA_FIRMWARE. Only 64-bit is
>  currently supported.
>  
> -Here's an example:
> +Here's an example::
>  
> -CONFIG_EXTRA_FIRMWARE="intel-ucode/06-3a-09 amd-ucode/microcode_amd_fam15h.bin"
> -CONFIG_EXTRA_FIRMWARE_DIR="/lib/firmware"
> +  CONFIG_EXTRA_FIRMWARE="intel-ucode/06-3a-09 amd-ucode/microcode_amd_fam15h.bin"
> +  CONFIG_EXTRA_FIRMWARE_DIR="/lib/firmware"
>  
> -This basically means, you have the following tree structure locally:
> +This basically means, you have the following tree structure locally::
>  
> -/lib/firmware/
> -|-- amd-ucode
> -...
> -|   |-- microcode_amd_fam15h.bin
> -...
> -|-- intel-ucode
> -...
> -|   |-- 06-3a-09
> -...
> +  /lib/firmware/
> +  |-- amd-ucode
> +  ...
> +  |   |-- microcode_amd_fam15h.bin
> +  ...
> +  |-- intel-ucode
> +  ...
> +  |   |-- 06-3a-09
> +  ...
>  
>  so that the build system can find those files and integrate them into
>  the final kernel image. The early loader finds them and applies them.



Thanks,
Mauro
