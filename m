Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9778199E80
	for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2024 16:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730219547; cv=none; b=JKpTok0X5SfvLD+N3tL/1+WgncsBXdG+TtJHifhkIcqaVywDVjCYhK57Wj2Djg30Srs7nYWGAB0I4ksPXZokOLGfZJuX2Wq+HNcTJ8Eqc0lQsCZACh7QnVLVU5cATfOOMci5tXiyvehVOzeV/fBbS60nuTwIWHdMDy18R4mp+tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730219547; c=relaxed/simple;
	bh=hYolIBUKtKrKGdr/IPiPmwPl8fX/vuUGaiMdAk19sho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mF1zWl295PG70J9+E4/JdLyfOgSC8b/sy/mJ5P4H6NmPJ2GI52BJwg1Obkci1ZvTMb9SJQ95XKV7exWOgKYoy0oWzLm0pmf8O8Ov9T0wuCawVU3LWysVYTiQoVDRHR+FhdMTNO1kHzp5zzteiJI8uCaWFaOLaBSMP4zZxlIqDrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DG5i+xB8; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DG5i+xB8"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so84220181fa.0
        for <linux-doc@vger.kernel.org>; Tue, 29 Oct 2024 09:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730219543; x=1730824343; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bUOJQ4C9/O1JlNHOtWYDDSld89tRwaEqczlK/L6VWlA=;
        b=DG5i+xB8SGrVP6U8PilwMIHhAi5GLnqFt+CvKNzMqJNLw0p5tPaCsgx6XRWncuD1kB
         CfGhNnQBKRiqgENw+hdC7CPdlYXB6Vxl7QNG8g3Y3053jMyNAu2Pp6eVbisGDA+mR2o3
         HV/iBXMSJCkShwetgK7YVtDYssxwmaozMebcV/F+tumD/Eh7gyKMJAKm6jpj8jrM4vpz
         dHOUdJdNWG8obNGNafawz4qyNslWJl3x6MR3Nj8bvNfl2Mc8qWGrni1uz6MwyCjIDax2
         vrxubw3uCO3/zbFbmA9h5z+FeIns8/7bNu3GHgCumQVzS16wKQvN/k8A9r+j5X4o8op4
         r5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730219543; x=1730824343;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bUOJQ4C9/O1JlNHOtWYDDSld89tRwaEqczlK/L6VWlA=;
        b=vvRfQ8EHK7YrhaO49Zu2iq//fBZcj4BqgHxRdJGPGDgNdxijkOF9evdYyTooPYbrL+
         d8ehFSKOrZOx9QTSE0p2Wr9zFIzn7bZRpDRwjhBtCtRlafS/6fJG0u8dGaVA795s2FkQ
         CSYXr7WDa1haRDaHFUN1RoYYsvY2eKxkZD68XooziXoILVwOOFEmA1cmvYIvF2UaZWE9
         ZwJV+byrabA1bUADsHox4YbpS6r3LpvDMlMn2qpPWYi0wmjlUiXMPlC+4pWFH7vKWoLi
         nfgsLmAHBft685h0Xf2a5stjDEs/6U2XQCSEI7KJN1XC3P6ZTUcm/MOIuWNI1w4mSE5Q
         anKw==
X-Forwarded-Encrypted: i=1; AJvYcCW2lDHOpViaiwBJI5f2IOHpCQURKnCi8neuO0xfbNFY/gjvyoe7afM9pMBHLeCr3pbCiVoiLWYpgrU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhqZ4y/YscFlcN6stg0OfqfI30aIZWL28IMhwwcii1owe5jP69
	qBzvNs/LV9GzDVXdlesMG1bzzvft9RSrqc5kNvD706W6Kp8pfCCdVDFAb+qP7yQ=
X-Google-Smtp-Source: AGHT+IFRjAbr9XWeX7K55eMSmZKhkY0RY3XF4MvBwCJPmM2jYr8kSDV9jS96JgjiVUw4zczZOC4WcA==
X-Received: by 2002:a2e:be9f:0:b0:2fa:d4ef:f234 with SMTP id 38308e7fff4ca-2fcbdf6183emr96680611fa.1.1730219542770;
        Tue, 29 Oct 2024 09:32:22 -0700 (PDT)
Received: from ?IPV6:2a10:bac0:b000:7465:7285:c2ff:fedd:7e3a? ([2a10:bac0:b000:7465:7285:c2ff:fedd:7e3a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3099ddf1sm498006466b.149.2024.10.29.09.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 09:32:22 -0700 (PDT)
Message-ID: <35c07733-d9e4-43a3-9dde-2cc10cd1ab9f@suse.com>
Date: Tue, 29 Oct 2024 18:32:20 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/bugs: Check VERW mitigations for consistency
To: Daniel Sneddon <daniel.sneddon@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Cc: hpa@zytor.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 pawan.kumar.gupta@linux.intel.com
References: <cover.1730158506.git.daniel.sneddon@linux.intel.com>
 <3ed45a10e2f7fbecce31d9964b1da1372e8cb838.1730158506.git.daniel.sneddon@linux.intel.com>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
In-Reply-To: <3ed45a10e2f7fbecce31d9964b1da1372e8cb838.1730158506.git.daniel.sneddon@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 29.10.24 г. 1:50 ч., Daniel Sneddon wrote:
> There are currently 4 mitigations that use VERW: MDS, TAA,
> MMIO Stale Data, and Register File Data Sampling. Because
> all 4 use the same mitigation path, if any one of them is
> enabled, they're all enabled. Normally, this is what is
> wanted. However, if a user wants to disable the mitigation,
> this can cause problems. If the user misses disabling even
> one of these mitigations, then none of them will be
> disabled. This can cause confusion as the user expects to
> regain the performance lost to the mitigation but isn't
> seeing any improvement. Since there are already 4 knobs for
> controlling it, adding a 5th knob that controls all 4
> mitigations together would just overcomplicate things.
> Instead, let the user know their mitigations are out of sync
> when at least one of these mitigations is disabled but not
> all 4.
> 
> Signed-off-by: Daniel Sneddon <daniel.sneddon@linux.intel.com>
> ---
>   arch/x86/kernel/cpu/bugs.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> index d1915427b4ff..b26b3b554330 100644
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -582,8 +582,26 @@ static void __init md_clear_update_mitigation(void)
>   		pr_info("Register File Data Sampling: %s\n", rfds_strings[rfds_mitigation]);
>   }
>   
> +static void __init verw_mitigations_check(void)
> +{
> +	if (mds_mitigation == MDS_MITIGATION_OFF ||
> +	    taa_mitigation == TAA_MITIGATION_OFF ||
> +	    mmio_mitigation == MMIO_MITIGATION_OFF ||
> +	    rfds_mitigation == RFDS_MITIGATION_OFF) {
> +		if (mds_mitigation == MDS_MITIGATION_OFF &&
> +		    taa_mitigation == TAA_MITIGATION_OFF &&
> +		    mmio_mitigation == MMIO_MITIGATION_OFF &&
> +		    rfds_mitigation == RFDS_MITIGATION_OFF)
> +			return;

Ugh, why don't you simply XOR the 4 values and if it's 1 it means the 
inputs differe => there is inconsistency.

> +
> +		pr_info("MDS, TAA, MMIO Stale Data, and Register File Data Sampling all depend on VERW\n");
> +		pr_info("In order to disable any one of them please ensure all 4 are disabled.\n");
> +	}
> +}
> +
>   static void __init md_clear_select_mitigation(void)
>   {
> +	verw_mitigations_check();
>   	mds_select_mitigation();
>   	taa_select_mitigation();
>   	mmio_select_mitigation();
