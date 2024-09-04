Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE041CEE86
	for <linux-doc@vger.kernel.org>; Wed,  4 Sep 2024 09:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725443805; cv=none; b=eQtLZj95+/mz5ZVX/3x/KHI3cwFKJVvqkXvDlAUCi6/wXQAD6Ch/T4pjt6rNCfaw+4BdPu5SFRjflic6eLHUNNDgA0fRDV8B5V7y6d9D9HyfmgLR8y/iS7LmVm5odZaGaW4Nbwr5ChwSRWYqGc0kTrUjCnNzguJ6xYaREQpvClo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725443805; c=relaxed/simple;
	bh=tCuk2mV1y4PiVJvxpU2GLPmf58V5xXMb8LK0IYQ95Lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XMxcN8z8xNggTm8Vzr5GDT9ew7JoFbVJrZVMeXEw267U9HHnA/eLukrHy3Xw6pYypQsaM/6jX9sYXIrwpY1ebIgB0bZmHMDMXBp4wTDP86Jnqq+K2XzqVfA5DyGV8nvTjk+pnfeRInE9ADlti10yiBfY17CSfvlmk02st5bwNjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cdYJKsYc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cdYJKsYc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725443801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rMDEvCKdCk4WIymhHfyU1DYt7Mm9yUFTwXqHIwpMZWg=;
	b=cdYJKsYcNva0kpCsjCteVnvUD5wG+Bo5DyLfWDnS5yGXrFc5lDRAH52wNFnu9gzOGuC550
	goPJnSWAhlBsawL1HgXLDfj/hN2E3Rq9jnvli96pUKjyCxUCIzuU0UWPN8v+HrgAD+T1QX
	0a14Xg3nhysckyWu0V85z8W5LdGm3n8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-6s7x5Si8OIuWUDV4mF6VOg-1; Wed, 04 Sep 2024 05:56:40 -0400
X-MC-Unique: 6s7x5Si8OIuWUDV4mF6VOg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5c250f3b18aso496725a12.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Sep 2024 02:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725443799; x=1726048599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rMDEvCKdCk4WIymhHfyU1DYt7Mm9yUFTwXqHIwpMZWg=;
        b=vuxUiGpB+JpRQ6KoCzXNCgWxu6NOk2lqi1vcDsGwmpIy0XoC41jrUxN8B+287zC+GS
         oZSidWo4R9pavyvcElb/sDFm0luXYSbT3WzMslVaoT4dvlUORAOuRc2orw8vB/vVWOMd
         dc4yrOfQUzOGIqj9Pv5/nWMxtqh7bB+nD2Q4YiFBMBFX/K+WOVdxkTrAV4lpf+SoZJKE
         tekjjdVOESSYZ1LBY/dyHct4LZNGmbnKMRDx0YLCJoDYFDywR7loOfDMA+p8NlKGVY+V
         +1xafXjYD1OAQ1neND5om2/K/evAHjGOu2mIlOivGoR1PCoV3UIgP1461NKqE7TOA2gy
         xhOg==
X-Gm-Message-State: AOJu0Yx0Cojrqw4H5yXYDh3HBK3xqzsRWo7KaiJTSGzZ/z3EXY8BAnb0
	p2THSkt6d1hSMctEEUa5pEaFzI0bCTxCzh5aCz175UK3FMaJMJiK6EzflOaHAK9A5IPxFFxO0nS
	JKXaa7jKB/q/ciwbHYVvWuHq0L8nNOQ6Y+e+j2KVmBbScE3u8pxd8+TXAEg==
X-Received: by 2002:a05:6402:42cd:b0:5b8:d362:3f46 with SMTP id 4fb4d7f45d1cf-5c2caf33337mr1558402a12.35.1725443799058;
        Wed, 04 Sep 2024 02:56:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHlnycoV76oDP9U5UM2YYaIAmUl0Ei3c0MAuEAupv04gX5cU6djy/efboDKaYePfle0+YiXGQ==
X-Received: by 2002:a05:6402:42cd:b0:5b8:d362:3f46 with SMTP id 4fb4d7f45d1cf-5c2caf33337mr1558377a12.35.1725443798497;
        Wed, 04 Sep 2024 02:56:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c73042sm7846700a12.33.2024.09.04.02.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 02:56:38 -0700 (PDT)
Message-ID: <8ed458fc-7a3c-4b1e-838b-0bc020e91308@redhat.com>
Date: Wed, 4 Sep 2024 11:56:37 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86:intel/pmc: Fix comment for the
 pmc_core_acpi_pm_timer_suspend_resume function
To: Marek Maslanka <mmaslanka@google.com>, daniel.lezcano@linaro.org
Cc: linux-doc@vger.kernel.org, lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <d5e6a9b4-f9e2-4c6a-ac2d-bba1b12d7675@redhat.com>
 <20240904094753.1615549-1-mmaslanka@google.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240904094753.1615549-1-mmaslanka@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/4/24 11:47 AM, Marek Maslanka wrote:
> Change incorrect kernel-doc comment to regular comment for the
> pmc_core_acpi_pm_timer_suspend_resume function.
> 
> Signed-off-by: Marek Maslanka <mmaslanka@google.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409031410.a9beukFc-lkp@intel.com/

Looks good, thank you.

Daniel can you add this to the timers/drivers/next branch please?

Regards,

Hans



> ---
>  drivers/platform/x86/intel/pmc/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index c91c753b120e..e2b4c74ce7f6 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -1209,7 +1209,7 @@ static bool pmc_core_is_pson_residency_enabled(struct pmc_dev *pmcdev)
>  	return val == 1;
>  }
>  
> -/**
> +/*
>   * Enable or disable ACPI PM Timer
>   *
>   * This function is intended to be a callback for ACPI PM suspend/resume event.

