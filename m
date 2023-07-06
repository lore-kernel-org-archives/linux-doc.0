Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D62A1EB64D9
	for <linux-doc@archiver.kernel.org>; Thu,  6 Jul 2023 19:51:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbjGFTvI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Jul 2023 15:51:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjGFTvH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Jul 2023 15:51:07 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B3FE1BF4
        for <linux-doc@vger.kernel.org>; Thu,  6 Jul 2023 12:51:06 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1b8b4748fe4so5940215ad.1
        for <linux-doc@vger.kernel.org>; Thu, 06 Jul 2023 12:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688673066; x=1691265066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U7SIfnrH6W+ndBIG+oT0zX41PxWzADh99okj7zLhiK0=;
        b=CO4X1I50kWvov5SoMY3GNP1psp65ddcb3IBeDCXn0w1oq97Zgwf8mxa31TMfEyIr2Q
         W5P69ERWgc5XZQYBGbtiSHEybPu4HeCBoFQpE9u6YXP8TmCPVK2/gSvvD3rj7OgDc56A
         kpck3R+en2tAc/DXlIDatnpT7cA7glU1rbTNt/+iuhljAvZ6eGAawzzOdhKsQNt+PET6
         l8WO5iKW3mK+jBoo6fUxi11xygiunbBEvHF5lpXjYdQDzETC6p8KhgtH2AlsiKIKf/Qq
         KSThj6RDtFlRU0HqWgHDwHffpL29yUeANmhilv7bhCh6PuOzh/TfcD8KmM2mq2qNsb/L
         7QkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688673066; x=1691265066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7SIfnrH6W+ndBIG+oT0zX41PxWzADh99okj7zLhiK0=;
        b=Rfjy/BJvDxAQiVRne+JWyZZ+ksPsfcT4xjKwFlP1kUueytSgdtH7rfphSyRhb4QlxZ
         VY1ZDKQTshoZKjLSFUzIoxrJSe0ypZ15F8ezWVKGDIqYk9gqI96jvP7aSLbc7oWrTGb1
         rbnqgyfnbP3Ybminpdw1LchDKq/RnwHbwPrm/l7OcpEdpsJ3G3pkJVB0lZVWkzz2Sn5F
         u44ZNZJlpV/5Z0IeQlO7tkVdeMXLSmYI+dXe9XPAlAel+OG4qCyVRCKi6hiVmkpUYVoK
         LSbkw2FlFuqMS9FITMuiBTsEsDrea2FMeTvSJ/pQheE/jJX2g3gIubZ254+71s+OzI7m
         tmTA==
X-Gm-Message-State: ABy/qLbtGtaybgVseAAlzlhB4zbJY3WknRBvxKqOCYgQK++pbAZbFnXx
        VHUCA+Y388d2iWUOxW1NRrZO0g==
X-Google-Smtp-Source: APBJJlF2X52/3Pvd+ZdFOhgdfrTYvfNyCuhE45wjY6c2fADHuAleT51p3v7oewUSckaC8xKctXu0qA==
X-Received: by 2002:a17:902:e88e:b0:1b8:b3f9:58eb with SMTP id w14-20020a170902e88e00b001b8b3f958ebmr2849469plg.31.1688673065601;
        Thu, 06 Jul 2023 12:51:05 -0700 (PDT)
Received: from ghost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id q3-20020a170902dac300b001b8aa51821csm1778401plx.138.2023.07.06.12.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 12:51:05 -0700 (PDT)
Date:   Thu, 6 Jul 2023 12:51:03 -0700
From:   Charlie Jenkins <charlie@rivosinc.com>
To:     Conor Dooley <conor@kernel.org>
Cc:     linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Jonathan Corbet <corbet@lwn.net>, evan@rivosinc.com,
        heiko@sntech.de, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] RISC-V: Framework for vendor extensions
Message-ID: <ZKcbJ9MEP/pBx39J@ghost>
References: <20230705-thead_vendor_extensions-v1-0-ad6915349c4d@rivosinc.com>
 <20230705-thead_vendor_extensions-v1-1-ad6915349c4d@rivosinc.com>
 <20230706-curly-swinging-afbf79a4cdb7@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230706-curly-swinging-afbf79a4cdb7@spud>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 06, 2023 at 06:15:57PM +0100, Conor Dooley wrote:
> Hey Charlie,
> 
> On Wed, Jul 05, 2023 at 08:30:17PM -0700, Charlie Jenkins wrote:
> > Create Kconfig files, Makefiles, and functions to enable vendors to
> > provide information via the riscv_hwprobe syscall about which vendor
> > extensions are available.
> 
> This is all apparently from reading the diff, you don't need to tell us
> what files you have created etc. Please just stick with explaining the
> rationale for your changes (especially anything that might make someone
> reading it go "huh").
> 
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> >  arch/riscv/Kbuild                     |  1 +
> >  arch/riscv/Kconfig                    |  1 +
> >  arch/riscv/Kconfig.vendor             |  3 +++
> >  arch/riscv/include/asm/hwprobe.h      |  1 +
> >  arch/riscv/kernel/sys_riscv.c         | 40 ++++++++++++++++++++++++++++++++---
> >  arch/riscv/vendor_extensions/Makefile |  3 +++
> >  6 files changed, 46 insertions(+), 3 deletions(-)
> 
> > diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
> > index afa83e307a2e..bea38010d9db 100644
> > --- a/arch/riscv/Kbuild
> > +++ b/arch/riscv/Kbuild
> > @@ -3,6 +3,7 @@
> >  obj-y += kernel/ mm/ net/
> >  obj-$(CONFIG_BUILTIN_DTB) += boot/dts/
> >  obj-y += errata/
> > +obj-y += vendor_extensions/
> >  obj-$(CONFIG_KVM) += kvm/
> >  
> >  obj-$(CONFIG_ARCH_HAS_KEXEC_PURGATORY) += purgatory/
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index c1505c7729ec..19404ede0ee3 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -276,6 +276,7 @@ config AS_HAS_OPTION_ARCH
> >  
> >  source "arch/riscv/Kconfig.socs"
> >  source "arch/riscv/Kconfig.errata"
> > +source "arch/riscv/Kconfig.vendor"
> >  
> >  menu "Platform type"
> >  
> > diff --git a/arch/riscv/Kconfig.vendor b/arch/riscv/Kconfig.vendor
> > new file mode 100644
> > index 000000000000..213ac3e6fed5
> > --- /dev/null
> > +++ b/arch/riscv/Kconfig.vendor
> > @@ -0,0 +1,3 @@
> > +menu "Vendor extensions selection"
> > +
> > +endmenu # "Vendor extensions selection"
> 
> These files don't do anything, don't add them until you need to.
I wasn't sure if it was more clear to split up the vendor extension
framework from the T-Head specific calls since the main goal of this
series is to propose a vendor extension framework. I can merge this with
the following patch.
> 
> > diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
> > index 78936f4ff513..fadb38b83243 100644
> > --- a/arch/riscv/include/asm/hwprobe.h
> > +++ b/arch/riscv/include/asm/hwprobe.h
> > @@ -9,5 +9,6 @@
> >  #include <uapi/asm/hwprobe.h>
> >  
> >  #define RISCV_HWPROBE_MAX_KEY 5
> > +#define RISCV_HWPROBE_VENDOR_EXTENSION_SPACE (UL(1)<<63)
> 
> Should this not be BIT_ULL(63)? Although I am not sure that we can
> actually do this, more on that front later.
> 
> >  
> >  #endif
> > diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
> > index 26ef5526bfb4..2351a5f7b8b1 100644
> > --- a/arch/riscv/kernel/sys_riscv.c
> > +++ b/arch/riscv/kernel/sys_riscv.c
> > @@ -188,9 +188,35 @@ static u64 hwprobe_misaligned(const struct cpumask *cpus)
> >  	return perf;
> >  }
> >  
> > +static int hwprobe_vendor(__u64 mvendorid, struct riscv_hwprobe *pair,
> > +			 const struct cpumask *cpus)
> > +{
> > +	switch (mvendorid) {
> > +	default:
> > +		return -1;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static void hwprobe_one_pair(struct riscv_hwprobe *pair,
> >  			     const struct cpumask *cpus)
> >  {
> > +	int err;
> > +
> > +	if (((unsigned long) pair->key) >= RISCV_HWPROBE_VENDOR_EXTENSION_SPACE) {
> 
> Hopefully Bjorn or someone that actually knows a thing or two about uapi
> stuff can chime in here, but I think what you are doing here (where the
> vendor space sets the MSB) really muddies the api. These keys are defined
> as signed 64 bit numbers & -1 is the value set when a key is not valid.
> I'd much rather we kept the negative space off-limits, and used the 62nd
> bit instead, avoiding using negative numbers for valid keys.
> 
Yeah that makes sense, I can change this up.
> > +		struct riscv_hwprobe mvendorid = {
> > +			.key = RISCV_HWPROBE_KEY_MVENDORID,
> > +			.value = 0
> > +		};
> > +
> > +		hwprobe_arch_id(&mvendorid, cpus);
> 
> I think this needs a comment explaining why you do this hwprobe call, 
> > +		if (mvendorid.value != -1ULL)
> > +			err = hwprobe_vendor(mvendorid.value, pair, cpus);
> > +		else
> > +			err = -1;
> > +	}
> 
> I don't really understand the control flow here. Why are you continuing
> on to the switch statement, if you have either a) already ran
> hwprobe_vendor() or b) noticed that mvendorid.value is not valid?
> 
The purpose of this was to consolidate the error handling to a single
spot at the bottom of the file. It would fall through the switch
statement and set the values appropriately. I guess it does seem a bit
awkward.
> >  	switch (pair->key) {
> >  	case RISCV_HWPROBE_KEY_MVENDORID:
> >  	case RISCV_HWPROBE_KEY_MARCHID:
> > @@ -217,13 +243,21 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
> >  
> >  	/*
> >  	 * For forward compatibility, unknown keys don't fail the whole
> > -	 * call, but get their element key set to -1 and value set to 0
> > -	 * indicating they're unrecognized.
> > +	 * call, instead an error is raised to indicate the element key
> > +	 * is unrecognized.
> >  	 */
> >  	default:
> > +		err = -1;
> > +		break;
> > +	}
> > +
> > +	/*
> > +	 * Setting the element key to -1 and value to 0 indicates that
> > +	 * hwprobe was unable to find the requested key.
> > +	 */
> > +	if (err != 0) {
> >  		pair->key = -1;
> >  		pair->value = 0;
> > -		break;
> >  	}
> >  }
> >  
> > diff --git a/arch/riscv/vendor_extensions/Makefile b/arch/riscv/vendor_extensions/Makefile
> > new file mode 100644
> > index 000000000000..e815895e9372
> > --- /dev/null
> > +++ b/arch/riscv/vendor_extensions/Makefile
> > @@ -0,0 +1,3 @@
> > +ifdef CONFIG_RELOCATABLE
> > +KBUILD_CFLAGS += -fno-pie
> > +endif
> 
> There are no files in this directory, why do you need to do a dance
> about relocatable kernels?
> 
This is framework for the following patch in the series. I saw these
lines in the errata Makefile so I created this Makefile to set up the
following patch in the series. I can merge this patch with the following
patch to make this series more clear.
> Cheers,
> Conor.


