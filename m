Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851411CF5D5
	for <linux-doc@vger.kernel.org>; Wed,  4 Sep 2024 09:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725443810; cv=none; b=iInS/p/RcRWMVuSgPzoYgqwDypltxk/TzIuJBmntT5m09Xdu4ta/S7w7a3RGC7J7QFNZLVe2UmVCBU1D5eie3nmRy9EbdxwjZlX9yzbWO3YdLSddfdZeNz8dtkHaKlG55yr1L0iqvuOtd1ixTctXVhvdqqv0xCuQ5av+4iXrt+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725443810; c=relaxed/simple;
	bh=aCDidHUhuCuDHfNZLIqA/sxxjHTRtbuYO3SM1pB/9EY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EUMkjfpPJTH3GjNKwzPXu2gsFCi3O2lQvl/mKCE9wNcVhkJ2AplLGjtRo1I1+dO5Va0+ZamMWax7wIePdoKvXOxTdGAzKjggZXFjrl/3z/YE0DWx8/plyQCKrbDxmiid89lvMilgVJZtEKg988A0cZvVVim3+JA7k3pGqtbB62g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EuxRxFvK; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EuxRxFvK"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-42bac9469e8so5040015e9.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Sep 2024 02:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725443807; x=1726048607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/W78Be/eQHD22S5iu13BDeYflw4dGDs26BDBayFTqk=;
        b=EuxRxFvKDdeAROzz2wpkm1PZK/6UBeKTmcwFuCoI2snoL1zQzQFSrRADlHMWgPUpt2
         toWI2zNYEsD8d5Gsg0mGyiYaJDvdO18aUSbKUHodnZGmEwaAmk+ibOp8ooCf94Q5UEEK
         SFVGkU8CTflFhLWAyXweQGtD5hhV6mygtEBIDZsLY8MhrPty+sseXlccoj2PKxfH8tCL
         A/Bvh6JD8+MzVt/PbFrywmJZtrBZqXEvSoE+t6RwPjHJaJDW0eQJDJxcauxXyTlQWNyE
         JEYuR8doowlUSj6pmIp0hsLHfRQyaDR+r+7a44UShPW9n0mSSHq2ZXd4MN1AfqFK98rB
         q/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725443807; x=1726048607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U/W78Be/eQHD22S5iu13BDeYflw4dGDs26BDBayFTqk=;
        b=ShRR4kcHANrJqeuLNHR+c7km+WhtWGwnTUQH48S5VIvvVcFs2Vu3IEWrQVnXeklcEZ
         wfplTqBje78FftcbKavaj7HkITcmFzo1HImxDEkIBQCzjT16lUN0R5znN2RFOFyvJbVp
         pC7rlSwkD4n/Vd3abjL0Q0Mw4u9WnXNvy2UpwwWvNNVf//x70KJoZZIwPXoK+oQkvr4T
         KVDVdOmo5j41wtGRtK/EO9hzyR4y0UsoOb/HiFy2EuR726FausLWDQF2TA3PNoRqpqB4
         DOYe3tFEq3RGx7YtNjv4HeoGQdi93jrUIytccPCtGn1rUn5m6vXvi4zt6k3pqGlEshqu
         adNA==
X-Gm-Message-State: AOJu0Yy1GU090urCS+6ge6kdGP9700japrrKYqoChHlf9UvWNKAHAubl
	1rq8K+N0DGj6MBaRRa+5FQ5j0qYLUKVe0fdFlcdyEQ3NLi4TLZpHB5fj3/nNZSI=
X-Google-Smtp-Source: AGHT+IFlA/9+wXJR00TBKlcv7t++BLgC83AND2/h5r1U9gBA4bpgaKPOAUnFNgxosCfz41BlVAzrEQ==
X-Received: by 2002:a05:600c:1ca4:b0:427:dac4:d36 with SMTP id 5b1f17b1804b1-42c9542506fmr12927985e9.7.1725443806315;
        Wed, 04 Sep 2024 02:56:46 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42bb6e274b6sm199624165e9.33.2024.09.04.02.56.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 02:56:45 -0700 (PDT)
Message-ID: <53f963f1-7e0a-4add-848f-efcce3681609@linaro.org>
Date: Wed, 4 Sep 2024 11:56:45 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86:intel/pmc: Fix comment for the
 pmc_core_acpi_pm_timer_suspend_resume function
To: Marek Maslanka <mmaslanka@google.com>, hdegoede@redhat.com
Cc: linux-doc@vger.kernel.org, lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <d5e6a9b4-f9e2-4c6a-ac2d-bba1b12d7675@redhat.com>
 <20240904094753.1615549-1-mmaslanka@google.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240904094753.1615549-1-mmaslanka@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/09/2024 11:47, Marek Maslanka wrote:
> Change incorrect kernel-doc comment to regular comment for the
> pmc_core_acpi_pm_timer_suspend_resume function.
> 
> Signed-off-by: Marek Maslanka <mmaslanka@google.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409031410.a9beukFc-lkp@intel.com/
> ---
>   drivers/platform/x86/intel/pmc/core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index c91c753b120e..e2b4c74ce7f6 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -1209,7 +1209,7 @@ static bool pmc_core_is_pson_residency_enabled(struct pmc_dev *pmcdev)
>   	return val == 1;
>   }
>   
> -/**
> +/*
>    * Enable or disable ACPI PM Timer
>    *
>    * This function is intended to be a callback for ACPI PM suspend/resume event.

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
