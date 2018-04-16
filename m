Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CE7CF7DE78
	for <lwn-linux-doc@archive.lwn.net>; Mon, 16 Apr 2018 22:03:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751870AbeDPWDw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 16 Apr 2018 18:03:52 -0400
Received: from merlin.infradead.org ([205.233.59.134]:57732 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750972AbeDPWDv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Apr 2018 18:03:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=P1OehhbFJK8/Exj4fM85kNBZsKbd2mUM5SyfC1HYNAc=; b=gCY5PoeOtqSWFXpVP6ohafiSje
        QOeCD/qOf5vsRlf1vOYNrZDxgz0/WWAp74CNUCyncSWhNDaJSz8WzNMi+RXsPPphFeVAZ8lm42QoR
        iHpgFvQDDCX7iFfh73BlzRER/MQL0zmqZ5D9rPEAOpDAymfaOdHsEhRuDWA/hckT4M/Vf3jjjFYHY
        /dGWfeZS8tgSTCRiiZ1o5QVTtdknPrhoWDj0C2Pi/4yUW7Jif0zIyd0MPIosSmknfx4qtTBLGAYVI
        hCe1tR8GVyPRmxIOCzgnmFOcwj6unopARyQn17bUrKJZxXL1UQtwstBCdb5WE82OJnPzdpbVvXSun
        KiFGxf7g==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1f8CE1-0006Q5-RI; Mon, 16 Apr 2018 22:03:50 +0000
Subject: Re: [PATCH v2] docs: kernel-parameters.txt: Fix whitespace
To:     Thymo van Beers <thymovanbeers@gmail.com>, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20180416214939.GA11304@thinkpad>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <31612fbd-6624-140a-ed92-04b8f0bd5f64@infradead.org>
Date:   Mon, 16 Apr 2018 15:03:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180416214939.GA11304@thinkpad>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/16/18 14:49, Thymo van Beers wrote:
> Some lines used spaces instead of tabs at line start.
> This can cause mangled lines in editors due to inconsistency.
> 
> Replace spaces for tabs where appropriate.
> 
> Signed-off-by: Thymo van Beers <thymovanbeers@gmail.com>
> ---
> Changes in v2:
>   - Rebase against docs-next
>   - Fix indentation modifications
> 
>  Documentation/admin-guide/kernel-parameters.txt | 136 ++++++++++++------------
>  1 file changed, 68 insertions(+), 68 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 3487be79847c..f625f65c286f 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt

Most of the patch is OK IMO, but not the intel_pstate part:
The 2-space extra indents work fine here, while the extra tab makes a lot of the
lines go beyond the 80-column mark.

> @@ -1650,39 +1650,39 @@
>  			0	disables intel_idle and fall back on acpi_idle.
>  			1 to 9	specify maximum depth of C-state.
>  
> -	intel_pstate=  [X86]
> -		       disable
> -		         Do not enable intel_pstate as the default
> -		         scaling driver for the supported processors
> -		       passive
> -			 Use intel_pstate as a scaling driver, but configure it
> -			 to work with generic cpufreq governors (instead of
> -			 enabling its internal governor).  This mode cannot be
> -			 used along with the hardware-managed P-states (HWP)
> -			 feature.
> -		       force
> -			 Enable intel_pstate on systems that prohibit it by default
> -			 in favor of acpi-cpufreq. Forcing the intel_pstate driver
> -			 instead of acpi-cpufreq may disable platform features, such
> -			 as thermal controls and power capping, that rely on ACPI
> -			 P-States information being indicated to OSPM and therefore
> -			 should be used with caution. This option does not work with
> -			 processors that aren't supported by the intel_pstate driver
> -			 or on platforms that use pcc-cpufreq instead of acpi-cpufreq.
> -		       no_hwp
> -		         Do not enable hardware P state control (HWP)
> -			 if available.
> -		hwp_only
> -			Only load intel_pstate on systems which support
> -			hardware P state control (HWP) if available.
> -		support_acpi_ppc
> -			Enforce ACPI _PPC performance limits. If the Fixed ACPI
> -			Description Table, specifies preferred power management
> -			profile as "Enterprise Server" or "Performance Server",
> -			then this feature is turned on by default.
> -		per_cpu_perf_limits
> -			Allow per-logical-CPU P-State performance control limits using
> -			cpufreq sysfs interface
> +	intel_pstate=	[X86]
> +			disable
> +				Do not enable intel_pstate as the default
> +				scaling driver for the supported processors
> +			passive
> +				Use intel_pstate as a scaling driver, but configure it
> +				to work with generic cpufreq governors (instead of
> +				enabling its internal governor).  This mode cannot be
> +				used along with the hardware-managed P-states (HWP)
> +				feature.
> +			force
> +				Enable intel_pstate on systems that prohibit it by default
> +				in favor of acpi-cpufreq. Forcing the intel_pstate driver
> +				instead of acpi-cpufreq may disable platform features, such
> +				as thermal controls and power capping, that rely on ACPI
> +				P-States information being indicated to OSPM and therefore
> +				should be used with caution. This option does not work with
> +				processors that aren't supported by the intel_pstate driver
> +				or on platforms that use pcc-cpufreq instead of acpi-cpufreq.
> +			no_hwp
> +				Do not enable hardware P state control (HWP)
> +				if available.
> +			hwp_only
> +				Only load intel_pstate on systems which support
> +				hardware P state control (HWP) if available.
> +			support_acpi_ppc
> +				Enforce ACPI _PPC performance limits. If the Fixed ACPI
> +				Description Table, specifies preferred power management
> +				profile as "Enterprise Server" or "Performance Server",
> +				then this feature is turned on by default.
> +			per_cpu_perf_limits
> +				Allow per-logical-CPU P-State performance control limits using
> +				cpufreq sysfs interface
>  
>  	intremap=	[X86-64, Intel-IOMMU]
>  			on	enable Interrupt Remapping (default)
> @@ -2027,7 +2027,7 @@
>  			* [no]ncqtrim: Turn off queued DSM TRIM.
>  
>  			* nohrst, nosrst, norst: suppress hard, soft
> -                          and both resets.
> +			and both resets.

I would leave that line above indented like the one after "rstonce" below.

>  
>  			* rstonce: only attempt one reset during
>  			  hot-unplug link recovery


-- 
~Randy
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
