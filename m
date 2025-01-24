Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FC81D61A7
	for <linux-doc@vger.kernel.org>; Fri, 24 Jan 2025 03:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737689284; cv=none; b=T5+Q2jWkMx3g92S4Q/vUnqoXMv6cMAxvXUXEBZbNUdI5jGXS7BiNq9y4gWQP+GsdJ6bTqFTjvMSlVqShymNSK/q+wJLksXkY9QlA7cTPaZ8DLXmUpWgNIRI5892UBdwrlic5LuCrbl9DrUH2vi3OWRZGaymFaj1jfhtwbWOTSwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737689284; c=relaxed/simple;
	bh=zd5mbJtlJ0Ako1I0wwZyEmzljoZUKIYnq0abszIYUmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g1Z+YrOK2pZfLhQ139/MQNHJCJ15co/qDTEVHIb4m9tG1VKdn0H2LNT0Bpvs7wKb1aSp6RUN/L5Nqc6V4Phorxr5I9Qn0Ot444O7bZCBO9bsoj7mB/DIcN8aKQn5lh6BVb4qTPQQw5VYiM03iBDJoACsApnYLU082bJgC/8DNrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fC6IsEO5; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fC6IsEO5"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2ee76befe58so3020578a91.2
        for <linux-doc@vger.kernel.org>; Thu, 23 Jan 2025 19:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737689282; x=1738294082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1YtHwD+3ED5cGp9BL5t1b6GReiZ2l6fBPO+RUUjVzlU=;
        b=fC6IsEO5tVMzrbH4PBh9WeeGnjsfhz1p77SO41aiSxNJZfIi+1lxjbifJeob8+u/bm
         ggOYrAJba9iggr7PieB0j3d4dOl3aOSMoRb6+x9xhrTCC5fuDvQ1kzWK5zF4E42PH5t+
         p88cX0F0YrjtATDsyiOITQETHP3NKgGO6obO3Ar9DbrTiUyK9gN1Y+bRHnYZbFz0C7Lx
         VdfuyQGVibcwGPzX/usiIZ8NVEClTyvOmUWDQdJQX1V0za7/3fXh4I+11NIvHj5gZZls
         37/i81OZzC3i49NBUk2IjEAyY9tCsquh+QYimTwyW2jAIksBt0Uqet24WnS2BhaSMggh
         bUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737689282; x=1738294082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YtHwD+3ED5cGp9BL5t1b6GReiZ2l6fBPO+RUUjVzlU=;
        b=tzZN6pl8cCVbE4ryTCWqhIgJX7c/gW+N5wzcKkCbk57NiPthESRjzHglB5yFd5pIk+
         Vl7Yo09tpx0aU3l/eM2HqiJPwEBHBt/lQQ3whPo/zMkqQa+UZ2iuqLOhkdda1Wf5Dv1g
         gj9GSrKr3hv2vdXQp+mRs+1GafVHJ+v9OfS9fsmwR6hsiuj/fy/G48p4UQROd665u1Dy
         BT2BUMVGulsOep6rztjR7zqTsDmQOtmrIoYhqaH4Ry2wrYGXMXSpI/cBzRVHpW1MGgHa
         BsfsoJbvNMI6ClPKftTcc+LzrJD1OytmOgzcSGOGhg4g0yF/IbJ+ErAggPPvinixPpKJ
         F//g==
X-Forwarded-Encrypted: i=1; AJvYcCX/LG/1V1YK8ZHJg8R6R1qX0HVpWhbb2jwJaB5pR4ENNZ9DNa0f5VSHvMjIoEO0xQTns1i10Vtrw3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoipBDjJkI1j554IjhhaFtx/h5Y0QqS6L9el90o3rAPz6LG81b
	ZHD/kEpHc4PJgB9iBXhhgZAGZJUT6orgga2jIl4vkHV8fbBqyPdWpJCacS+yk00=
X-Gm-Gg: ASbGnctPz01PmIJCNpPF84mH7tUWAOIOb7VCkXIiRG2hGB66g/5SldxhaZeIwmqzSth
	0xoIqPMiU777L8N7b1kxjP/w3AX8hj5DfIKwFqCBQFiWC2oOy0mSjJJG4rTG2WZRBwbh8TffJLu
	HzYVAdW8LXytUqlZJNRhlVjupOfkzIDrjCDQBcrPN5lDpLWoZtFZIDKDwKuGMYIQwGW7t9tEeWD
	pRDDsXNO28szJAZiDLWkAdiMlp7nyNkQd25Ln8eahk1eNyH3fCfI76seaovR/xzqNdB6pBBRGA9
	e1FA2tE=
X-Google-Smtp-Source: AGHT+IEjcYLFKFT/4zjAgtn0Ur09jWOBQWRSc3NOeyRishuwgqWAN1BJw6YRpnHk99tT5Mt/zypi9A==
X-Received: by 2002:a17:90b:2cc3:b0:2ee:d193:f3d5 with SMTP id 98e67ed59e1d1-2f782c628ddmr46198761a91.7.1737689281866;
        Thu, 23 Jan 2025 19:28:01 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa76ebdsm514831a91.34.2025.01.23.19.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 19:28:01 -0800 (PST)
Date: Fri, 24 Jan 2025 08:57:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com, Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>, Phil Auld <pauld@redhat.com>,
	x86@kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 2/5] cpufreq: Introduce an optional cpuinfo_avg_freq
 sysfs entry
Message-ID: <20250124032759.zo5l7pvdlfttyu5y@vireshk-i7>
References: <20250121084435.2839280-1-beata.michalska@arm.com>
 <20250121084435.2839280-3-beata.michalska@arm.com>
 <20250121105355.sdrgmjv2w2256qfn@vireshk-i7>
 <Z4-6bsDzfe9CLcVf@arm.com>
 <20250122060902.5pgfr5g24jpjrxw3@vireshk-i7>
 <Z5K42yXtcDSZGuUF@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5K42yXtcDSZGuUF@arm.com>

On 23-01-25, 22:47, Beata Michalska wrote:
> Do you mean the new config option? If so, it is in Kconfig.x86 already.
> Unless you have smth else in mind ?

Its good then :)

-- 
viresh
