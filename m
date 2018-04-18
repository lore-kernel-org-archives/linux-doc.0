Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8BF5B7DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Apr 2018 18:16:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752093AbeDRSQm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Apr 2018 14:16:42 -0400
Received: from mail-wr0-f195.google.com ([209.85.128.195]:40298 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750885AbeDRSQl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Apr 2018 14:16:41 -0400
Received: by mail-wr0-f195.google.com with SMTP id v60-v6so7270282wrc.7;
        Wed, 18 Apr 2018 11:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=m/utjJ1PqR2wzb409/X4ww5tXpeqsxU282eN4Jf2/7s=;
        b=vh9D1pv55IWOSwOUfMFHdPE/IrfTC7QwuB1hKAkx5z53cWT6ynW30aus0+ixORcSyM
         /mD4RGUEpp1Z8JS7pTcIeQFtdm4ypRsRJwnkOqe77nwEeSZbU7H4qidm5Xvbg0XAuUIn
         lZh5jmhAjMbazIOg/lDLkYCDU5Vq0ZahvB3M8nI8Tf2Fpf0Z903bFyFmbIdzpbQLvvvx
         cBu0e43ZuUR9XMKCpg4dtdsxd5G72pBngu6NVlycaSUBV2PW8K9WX2AGHmZEWNH6QfP6
         EkbiVpvYrf4oFiprlwRSxyyq5IikZrEumy8926nFt/6+uLlyioBYn4XG5zQbMtuwQZlz
         htpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=m/utjJ1PqR2wzb409/X4ww5tXpeqsxU282eN4Jf2/7s=;
        b=Ge7kKTqjhFKg//iKshySAwHxPnJ2HZnOAKNM/y4/gh3CLMtR3tkLmC9GewzoS3cMgc
         byya1DlYniAvfj1DkHyNHG9sEkn18kuqHvtffGvhBYGky/szVmo/uNSbf4w8r4BmwKJc
         azTDKxsYn/Vg4qL7x6g80tjf3kBIySFaELJsBOPFFQopVri5tknK5SFET0hR2CzWcpXf
         B4SXukTLSS6K2XCrVrOPZZ5/5pAwxNsGhBo2+5iK2st/idpzFZFTq5v31QW1ed1GC71s
         uHAPf2Z7eF5Bj17q6lnKnA6BjHW70kcHTG8EgIUx6HUwobNSg1yVBCG/XcuksXmiEnGX
         boZQ==
X-Gm-Message-State: ALQs6tCn+Rs09zKa8xsVcXjWs7M9/TTMjMKFaNTYXQCe6NvY/4V6NZW2
        zNYHx9BtwTUVTfMFkxhp8AvoTBHh
X-Google-Smtp-Source: AIpwx49/XYIl7z5648Kep+gVlTGSdChrzd0pvJ+RdomH+kaM79PmYSzvCgCdLqFZ4/+mW6T5oXG9Iw==
X-Received: by 10.80.224.68 with SMTP id g4mr4559716edl.123.1524075400216;
        Wed, 18 Apr 2018 11:16:40 -0700 (PDT)
Received: from thinkpad (524A8B4B.cm-4-3c.dynamic.ziggo.nl. [82.74.139.75])
        by smtp.gmail.com with ESMTPSA id p1sm452326edm.0.2018.04.18.11.16.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Apr 2018 11:16:39 -0700 (PDT)
Date:   Wed, 18 Apr 2018 20:16:37 +0200
From:   Thymo van Beers <thymovanbeers@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: kernel-parameters.txt: Fix whitespace
Message-ID: <20180418181635.GA24031@thinkpad>
References: <20180416214939.GA11304@thinkpad>
 <31612fbd-6624-140a-ed92-04b8f0bd5f64@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <31612fbd-6624-140a-ed92-04b8f0bd5f64@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 16, 2018 at 03:03:47PM -0700, Randy Dunlap wrote:
> On 04/16/18 14:49, Thymo van Beers wrote:
> > Some lines used spaces instead of tabs at line start.
> > This can cause mangled lines in editors due to inconsistency.
> > 
> > Replace spaces for tabs where appropriate.
> > 
> > Signed-off-by: Thymo van Beers <thymovanbeers@gmail.com>
> > ---
> > Changes in v2:
> >   - Rebase against docs-next
> >   - Fix indentation modifications
> > 
> >  Documentation/admin-guide/kernel-parameters.txt | 136 ++++++++++++------------
> >  1 file changed, 68 insertions(+), 68 deletions(-)
> > 
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index 3487be79847c..f625f65c286f 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> 
> Most of the patch is OK IMO, but not the intel_pstate part:
> The 2-space extra indents work fine here, while the extra tab makes a lot of the
> lines go beyond the 80-column mark.
> 
> > @@ -1650,39 +1650,39 @@
> >  			0	disables intel_idle and fall back on acpi_idle.
> >  			1 to 9	specify maximum depth of C-state.
> >  
> > -	intel_pstate=  [X86]
> > -		       disable
> > -		         Do not enable intel_pstate as the default
> > -		         scaling driver for the supported processors
> > -		       passive
> > -			 Use intel_pstate as a scaling driver, but configure it
> > -			 to work with generic cpufreq governors (instead of
> > -			 enabling its internal governor).  This mode cannot be
> > -			 used along with the hardware-managed P-states (HWP)
> > -			 feature.
> > -		       force
> > -			 Enable intel_pstate on systems that prohibit it by default
> > -			 in favor of acpi-cpufreq. Forcing the intel_pstate driver
> > -			 instead of acpi-cpufreq may disable platform features, such
> > -			 as thermal controls and power capping, that rely on ACPI
> > -			 P-States information being indicated to OSPM and therefore
> > -			 should be used with caution. This option does not work with
> > -			 processors that aren't supported by the intel_pstate driver
> > -			 or on platforms that use pcc-cpufreq instead of acpi-cpufreq.
> > -		       no_hwp
> > -		         Do not enable hardware P state control (HWP)
> > -			 if available.
> > -		hwp_only
> > -			Only load intel_pstate on systems which support
> > -			hardware P state control (HWP) if available.
> > -		support_acpi_ppc
> > -			Enforce ACPI _PPC performance limits. If the Fixed ACPI
> > -			Description Table, specifies preferred power management
> > -			profile as "Enterprise Server" or "Performance Server",
> > -			then this feature is turned on by default.
> > -		per_cpu_perf_limits
> > -			Allow per-logical-CPU P-State performance control limits using
> > -			cpufreq sysfs interface
> > +	intel_pstate=	[X86]
> > +			disable
> > +				Do not enable intel_pstate as the default
> > +				scaling driver for the supported processors
> > +			passive
> > +				Use intel_pstate as a scaling driver, but configure it
> > +				to work with generic cpufreq governors (instead of
> > +				enabling its internal governor).  This mode cannot be
> > +				used along with the hardware-managed P-states (HWP)
> > +				feature.
> > +			force
> > +				Enable intel_pstate on systems that prohibit it by default
> > +				in favor of acpi-cpufreq. Forcing the intel_pstate driver
> > +				instead of acpi-cpufreq may disable platform features, such
> > +				as thermal controls and power capping, that rely on ACPI
> > +				P-States information being indicated to OSPM and therefore
> > +				should be used with caution. This option does not work with
> > +				processors that aren't supported by the intel_pstate driver
> > +				or on platforms that use pcc-cpufreq instead of acpi-cpufreq.
> > +			no_hwp
> > +				Do not enable hardware P state control (HWP)
> > +				if available.
> > +			hwp_only
> > +				Only load intel_pstate on systems which support
> > +				hardware P state control (HWP) if available.
> > +			support_acpi_ppc
> > +				Enforce ACPI _PPC performance limits. If the Fixed ACPI
> > +				Description Table, specifies preferred power management
> > +				profile as "Enterprise Server" or "Performance Server",
> > +				then this feature is turned on by default.
> > +			per_cpu_perf_limits
> > +				Allow per-logical-CPU P-State performance control limits using
> > +				cpufreq sysfs interface
> >  
> >  	intremap=	[X86-64, Intel-IOMMU]
> >  			on	enable Interrupt Remapping (default)
> > @@ -2027,7 +2027,7 @@
> >  			* [no]ncqtrim: Turn off queued DSM TRIM.
> >  
> >  			* nohrst, nosrst, norst: suppress hard, soft
> > -                          and both resets.
> > +			and both resets.
> 
> I would leave that line above indented like the one after "rstonce" below.
> 
> >  
> >  			* rstonce: only attempt one reset during
> >  			  hot-unplug link recovery
> 
> 
> -- 
> ~Randy

Okay, thanks for your feedback.

I reindented intel_pstate as you said and I can still see the whole
description for the 'advanced' option is going past the 80-column mark.

I'll leave it indented with two spaces for this patch.
If you wish I can make a separate patch that addresses 80-column overrun
for intel_pstate.

I'll indent the nohrst,... section like rstonce.

Does that sound good to you?

-Thymo
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
