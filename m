Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3A3327D043
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Jun 2018 16:44:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933179AbeFGQoV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Jun 2018 12:44:21 -0400
Received: from merlin.infradead.org ([205.233.59.134]:56274 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932781AbeFGQoU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Jun 2018 12:44:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=UpE63isvIVvmWid1vL4aSbQ78fHuGL21+RbhQV0oj3Y=; b=shyfW/RBQpyqsYJfZXJdaGTR2F
        HmvlDeIpEVe6APUTWWksfIFCmv5IrJGTkOIbe4M4G7O/xSww5AGcoOLaEWHsTe28VgGbiEaclxKtq
        ozrZldD7fyKneeOJkJpJj2Ag+ZvJSQCMl+ttcdzNDrgmHGOE7nmWikfnvuVycOOSW+3BF+YlpIkJj
        +NourjxcrndfBD22IVSFQMm2eggS3p6jRYW/oepJngRj/obZt3KQF3qf1XLFVdWgzuog47cOlP2Z4
        QjmVGWQGot7joep4XIhFh+r2AU+gTl0C+Zuntm1g0AlRzVQys73UbZ18+ZkVHVHH/UEfeNYoeXZST
        F87JQiqw==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fQy0u-0001hC-0a; Thu, 07 Jun 2018 16:43:52 +0000
Subject: Re: [PATCH 1/7] x86/cet: Add Kconfig option for user-mode Indirect
 Branch Tracking
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@amacapital.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Oleg Nesterov <oleg@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        Mike Kravetz <mike.kravetz@oracle.com>
References: <20180607143855.3681-1-yu-cheng.yu@intel.com>
 <20180607143855.3681-2-yu-cheng.yu@intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <9c99f892-8965-8b08-4a80-506b48c2205d@infradead.org>
Date:   Thu, 7 Jun 2018 09:43:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180607143855.3681-2-yu-cheng.yu@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 06/07/2018 07:38 AM, Yu-cheng Yu wrote:
> The user-mode indirect branch tracking support is done mostly by
> GCC to insert ENDBR64/ENDBR32 instructions at branch targets.
> The kernel provides CPUID enumeration, feature MSR setup and
> the allocation of legacy bitmap.
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> ---
>  arch/x86/Kconfig | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 24339a5299da..27bfbd137fbe 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -1953,6 +1953,18 @@ config X86_INTEL_SHADOW_STACK_USER
>  
>  	  If unsure, say y.
>  
> +config X86_INTEL_BRANCH_TRACKING_USER
> +	prompt "Intel Indirect Branch Tracking for user-mode"
> +	def_bool n
> +	depends on CPU_SUP_INTEL && X86_64
> +	select X86_INTEL_CET
> +	select ARCH_HAS_PROGRAM_PROPERTIES
> +	---help---
> +	  Indirect Branch Tracking provides hardware protection against 	
> +	  oriented programing attacks.

	           programming

and please just move the return/jmp parts to the next line also:

	                                             protection against
	  return-/jmp-oriented programming attacks.

> +
> +	  If unsure, say y
> +
>  config EFI
>  	bool "EFI runtime service support"
>  	depends on ACPI
> 


-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
