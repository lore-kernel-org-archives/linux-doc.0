Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A31A17583
	for <linux-doc@vger.kernel.org>; Fri, 28 Jun 2024 03:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719545242; cv=none; b=egrICKxlOGmeCtmvVrbB80dXC7yAR9X3sBU5Dxtm/phYu7REeXdqgSMoDqiiv7CyBnV4j6+AVyVBfDjfv0wcqCY7iCBF66HMX9mxbsmPkfVYfFDXtJePbYRV8TvpUnfwgzyjxbbGQhnH4XhH3UeHWnc4F2Btmb6wvSEK6eADfPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719545242; c=relaxed/simple;
	bh=KYEJIysJLBBz8YMwcDlW01V44BPHmibTcSm9mVrIBA8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HXX0lCNPxENo63SF4QTUCUGqzp3E74kW5lqw6SVensbAK9cERrfRjQHES3BcJ8dtG0iTu4F575ba0snrnscYR8cgByKg1XXt5Cb0FHZcqILcWBgmfPh4DhIB8LXF2q7lXF1j+Rafk0ozIzhLujL8E+7OEn/gN9EF0cq//n89fmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2DLWDtFB; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2DLWDtFB"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fa3086cf25so56405ad.1
        for <linux-doc@vger.kernel.org>; Thu, 27 Jun 2024 20:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719545241; x=1720150041; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dSkydqVrOylet5hZHTv4JAa4/5ZRn/MCtw+KWg/qGPQ=;
        b=2DLWDtFB1Z0Cib2o5MtHHCwtbAcTl3bI4i0wxHZku4P9ICdQN1UzrwhXOfwMNf01LD
         0/oE+hBCnPI3avRLSrWwyhwnp8jXgKnaMeQddCyldq3isrBASBK+ZfKiWgNcgnFjXR4p
         WMrQNR2CozP16pBmoHBvQWlmUa39k5mzfDcx6O8UITcjQcGJcJ0vacKF1DKVQVogX7tO
         GMZaQX2lOrymxVLxLkS2t5LrXFeiPyruhufKqLv10QLxBREY5/JrvjWMPLDzOU47DwAs
         uSUBHWX54BpBO0096UqkFGqVT8ldaQase2WxPTojiUN9d9XxPLJUHQkD0HxjgSjO99E+
         VVIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719545241; x=1720150041;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSkydqVrOylet5hZHTv4JAa4/5ZRn/MCtw+KWg/qGPQ=;
        b=U5ok86/ZaCTOiblUtEBT2RXpUhKNLz9htli+MQT1gn0A5u9YjendhSX4xoxW1BTE2C
         QS94DpyIT4UdFrSc6rRsnFgRNOPkAQLWl0/UVYRT53rQ1fXFhq67bIuolbmP7v1AG1ee
         r0fqXRxTsvGy4tYDLEcr5UD8raulMT6QTECvm4cxKKTn8W95wcEBmwLZ+yhgoYNNIgLg
         eotVUsvbLrbmbA6XKFZE6+gQNzWCfvqp1ZLur80g9Qk9/Ke1G/j66ER+M8djU4xnV351
         2NOr+M5YDuz0G4WfVFNrU1QmhvK/5JBUxyuByM/86dFgWhhEN/R4SUJrRvmjd/xc9/kr
         VbbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE5l0FEIh+F3/IZlALuM15cx+JsIUr7JQ0uVmPT01Q+IPNYaS1TZAuVJcNCFK/CMAJq+EI+Ukmsw5KGQev5M/trs21M7QxcjZu
X-Gm-Message-State: AOJu0YzoW4bSjt+3VmA0qG8SFUNq7jCrVHbKufKm/i3t9gKinq5WvTi+
	sIzu/pg3lMDjLa/HEeI0EU3hB3fPGTRFcH/41cDwAhcbLUowjyTjd+FV/hsicQ==
X-Google-Smtp-Source: AGHT+IFknHUiBK4QKZl3RYX8Cc7u+xPDs+/iq1BOC/jaRS3yGmAHCWXBIfTUh5gu7x74dwrBoCs81A==
X-Received: by 2002:a17:903:7c4:b0:1f8:6250:dfa5 with SMTP id d9443c01a7336-1fac18172dbmr1724525ad.28.1719545240167;
        Thu, 27 Jun 2024 20:27:20 -0700 (PDT)
Received: from [2620:0:1008:15:6e58:e031:b1d9:8b1e] ([2620:0:1008:15:6e58:e031:b1d9:8b1e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6d1f77bcsm414842a12.79.2024.06.27.20.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 20:27:19 -0700 (PDT)
Date: Thu, 27 Jun 2024 20:27:18 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Jiaqi Yan <jiaqiyan@google.com>
cc: nao.horiguchi@gmail.com, linmiaohe@huawei.com, jane.chu@oracle.com, 
    rdunlap@infradead.org, ioworker0@gmail.com, muchun.song@linux.dev, 
    akpm@linux-foundation.org, shuah@kernel.org, corbet@lwn.net, 
    osalvador@suse.de, duenwen@google.com, fvdl@google.com, linux-mm@kvack.org, 
    linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 2/4] mm/memory-failure: userspace controls soft-offlining
 pages
In-Reply-To: <20240626050818.2277273-3-jiaqiyan@google.com>
Message-ID: <e61fa5ea-09f3-c5f4-96be-ab0c5e7b233e@google.com>
References: <20240626050818.2277273-1-jiaqiyan@google.com> <20240626050818.2277273-3-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 26 Jun 2024, Jiaqi Yan wrote:

> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index 6f5ac334efba..1559e773537f 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -68,6 +68,8 @@ static int sysctl_memory_failure_early_kill __read_mostly;
>  
>  static int sysctl_memory_failure_recovery __read_mostly = 1;
>  
> +static int sysctl_enable_soft_offline __read_mostly = 1;
> +
>  atomic_long_t num_poisoned_pages __read_mostly = ATOMIC_LONG_INIT(0);
>  
>  static bool hw_memory_failure __read_mostly = false;
> @@ -141,6 +143,15 @@ static struct ctl_table memory_failure_table[] = {
>  		.extra1		= SYSCTL_ZERO,
>  		.extra2		= SYSCTL_ONE,
>  	},
> +	{
> +		.procname	= "enable_soft_offline",
> +		.data		= &sysctl_enable_soft_offline,
> +		.maxlen		= sizeof(sysctl_enable_soft_offline),
> +		.mode		= 0644,
> +		.proc_handler	= proc_dointvec_minmax,
> +		.extra1		= SYSCTL_ZERO,
> +		.extra2		= SYSCTL_ONE,
> +	}
>  };
>  
>  /*
> @@ -2749,8 +2760,9 @@ static int soft_offline_in_use_page(struct page *page)
>   * @pfn: pfn to soft-offline
>   * @flags: flags. Same as memory_failure().
>   *
> - * Returns 0 on success
> - *         -EOPNOTSUPP for hwpoison_filter() filtered the error event
> + * Returns 0 on success,
> + *         -EOPNOTSUPP for hwpoison_filter() filtered the error event, or
> + *         disabled by /proc/sys/vm/enable_soft_offline,
>   *         < 0 otherwise negated errno.
>   *
>   * Soft offline a page, by migration or invalidation,
> @@ -2786,6 +2798,13 @@ int soft_offline_page(unsigned long pfn, int flags)
>  		return -EIO;
>  	}
>  
> +	if (!sysctl_enable_soft_offline) {
> +		pr_info_once("%#lx: disabled by /proc/sys/vm/enable_soft_offline\n",
> +			pfn);

Any strong reason to include the pfn in the log message?

I'm concerned about allowing a user to deduce the physical mapping for any 
arbitrary page since this is possible to do through MADV_SOFT_OFFLINE and 
I don't think that it adds value, especially if this is pr_info_once().

If we remove the pfn, feel free to add

	Acked-by: David Rientjes <rientjes@google.com>

> +		put_ref_page(pfn, flags);
> +		return -EOPNOTSUPP;
> +	}
> +
>  	mutex_lock(&mf_mutex);
>  
>  	if (PageHWPoison(page)) {
> -- 
> 2.45.2.741.gdbec12cfda-goog
> 
> 
