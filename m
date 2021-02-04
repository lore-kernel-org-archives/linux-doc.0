Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292C1C433DB
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 20:08:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F175160203
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 20:08:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239155AbhBDUHh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Feb 2021 15:07:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239720AbhBDT4q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Feb 2021 14:56:46 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C00CC061788
        for <linux-doc@vger.kernel.org>; Thu,  4 Feb 2021 11:56:06 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id z9so2436034pjl.5
        for <linux-doc@vger.kernel.org>; Thu, 04 Feb 2021 11:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cREe4mpEbDVYUgSGHck86DN+09/T0KggeVpHRB6Lhw0=;
        b=eup2LSndCOmk227ViA0qGpuq32ZePmfrdzCY9BJdFC59+1KRofF3eCXZSHAMPm05xc
         smyKEebKiEPOW6lcePOHYKqr7MKFsxuF4MVbe6hb2jY5oFL9Dg+Zz432FzpHpYW5RFhf
         T202G8LNBQ7ucEp8j31zZxbtM+sQUqQBUGtI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cREe4mpEbDVYUgSGHck86DN+09/T0KggeVpHRB6Lhw0=;
        b=goSKIeFqadWA+ljocVmd84EeU4Q636agaRsup6rngol5V1VObR+aLdTA+kXLVXuHbA
         BqGEpEYZM9k4OVun67KSNhuQJd47aujoJmhI53VqiM/ieeclilKAl+/1yK3PEKJZmxSN
         D+f0Snnwi1R3p7ZFDYHDp112wq4KLvcNQ6BCI4iX7Xdw2XEhJN4hcFBVW7sX+uxzGRms
         jH6XxFCGvPkFoQglLBH3S1D8H8r30jE3qZaNcmdVzdxbMHhAmMuIDSU7/+5xJZIN/PpM
         rRA8DCdOlENPjDNWA/bQz/wIjGbJ6kes9gbk+y4tRccXR6IL2RAOBgyepHIga2e93MR5
         Gv1Q==
X-Gm-Message-State: AOAM532U5a/oaWEdt1wnRfKG1NUtgkXSKdw6uKfiqAQXh7h09VddH8HQ
        VF0WHo0eYKB2mLXYohIKHNsbig==
X-Google-Smtp-Source: ABdhPJypiZ3aY6ToskYJVpLPmwjx1SQOOmTLh/FTIa/eMU4kbyKkSkLf+aRvyBCJP/3DAOQZoSKViw==
X-Received: by 2002:a17:902:f688:b029:da:a817:1753 with SMTP id l8-20020a170902f688b02900daa8171753mr746883plg.76.1612468565931;
        Thu, 04 Feb 2021 11:56:05 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id d88sm6889445pjk.23.2021.02.04.11.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 11:56:04 -0800 (PST)
Date:   Thu, 4 Feb 2021 11:56:03 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        Pengfei Xu <pengfei.xu@intel.com>
Subject: Re: [PATCH v19 02/25] x86/cet/shstk: Add Kconfig option for
 user-mode control-flow protection
Message-ID: <202102041154.F0264AC33@keescook>
References: <20210203225547.32221-1-yu-cheng.yu@intel.com>
 <20210203225547.32221-3-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203225547.32221-3-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 03, 2021 at 02:55:24PM -0800, Yu-cheng Yu wrote:
> Shadow Stack provides protection against function return address
> corruption.  It is active when the processor supports it, the kernel has
> CONFIG_X86_CET enabled, and the application is built for the feature.
> This is only implemented for the 64-bit kernel.  When it is enabled, legacy
> non-Shadow Stack applications continue to work, but without protection.
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> ---
>  arch/x86/Kconfig           | 22 ++++++++++++++++++++++
>  arch/x86/Kconfig.assembler |  5 +++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 21f851179ff0..074b3c0e6bf6 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -1951,6 +1951,28 @@ config X86_SGX
>  
>  	  If unsure, say N.
>  
> +config ARCH_HAS_SHADOW_STACK
> +	def_bool n
> +
> +config X86_CET
> +	prompt "Intel Control-flow protection for user-mode"
> +	def_bool n
> +	depends on X86_64
> +	depends on AS_WRUSS
> +	select ARCH_USES_HIGH_VMA_FLAGS
> +	select ARCH_HAS_SHADOW_STACK

This seems backwards to me? Shouldn't 'config X86_64' do the 'select
ARCH_HAS_SHADOW_STACK' and 'config X86_CET' do a 'depends on
ARCH_HAS_SHADOW_STACK' instead?

> +	help
> +	  Control-flow protection is a set of hardware features which place
> +	  additional restrictions on indirect branches.  These help
> +	  mitigate ROP attacks.  Applications must be enabled to use it,
> +	  and old userspace does not get protection "for free".
> +	  Support for this feature is present on Tiger Lake family of
> +	  processors released in 2020 or later.  Enabling this feature
> +	  increases kernel text size by 3.7 KB.
> +	  See Documentation/x86/intel_cet.rst for more information.
> +
> +	  If unsure, say N.
> +
>  config EFI
>  	bool "EFI runtime service support"
>  	depends on ACPI
> diff --git a/arch/x86/Kconfig.assembler b/arch/x86/Kconfig.assembler
> index 26b8c08e2fc4..00c79dd93651 100644
> --- a/arch/x86/Kconfig.assembler
> +++ b/arch/x86/Kconfig.assembler
> @@ -19,3 +19,8 @@ config AS_TPAUSE
>  	def_bool $(as-instr,tpause %ecx)
>  	help
>  	  Supported by binutils >= 2.31.1 and LLVM integrated assembler >= V7
> +
> +config AS_WRUSS
> +	def_bool $(as-instr,wrussq %rax$(comma)(%rbx))
> +	help
> +	  Supported by binutils >= 2.31 and LLVM integrated assembler
> -- 
> 2.21.0
> 

-- 
Kees Cook
