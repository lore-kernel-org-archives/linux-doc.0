Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB0821CC64
	for <linux-doc@vger.kernel.org>; Thu,  1 Jan 2026 08:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767256041; cv=none; b=uXFUCA/OJx3JJIwCdfl6xkWMi0ChSiXCWIqHtHIM5tZoeIGuEqJuU6lRkAHj2vrRCcX1Tbt4ZivMAIJsJRqB7XierqBdlpoEzrYk7HgHie7i7lMLhjLd5SIE8o9/DLJe1o4yU6vUVMHKNqsutj4oM5o1f7ltDJkWa0OyiZPPl4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767256041; c=relaxed/simple;
	bh=g1mMzgD2REYJsThm5iAh62mc8uScUvCP1p2CjKOd77g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjJRbObvXdAJpW2j54snnVX93nyWUUKr450W6ScZRuRaIKo+Kt5hYpx9MRn0++hsBiZBvNyOxzjupmCh+Qw77mM1ZhMFC+VsRwFpH9bwicqtwA2xODj6Y17HBLk0CrAeDI1BpZz/EUO2POcizpXEFDz17qHmOBdETMuwRhFHd04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3llcKuI; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3llcKuI"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso9028995b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 01 Jan 2026 00:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767256040; x=1767860840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=grqBbaE6YnOptD2H7gCSdhIM6A7QBPysLgSlWzZLLhY=;
        b=O3llcKuIlO6pwBCQR7JhpoSws6bzbbdDwMeuhPDpT/WeHwZ+yUhI3zdpndQvaPgP6u
         MAvFGThj7ftw8nZ9rSCAHP/zo8ZBpW0auIilbJNd2JRoBDqh0OEi0v496E+7Fn33nuHw
         BUzDxHwcurxcIyVdCPx6/SO7A5XHMDS4Y/ipJcdGWy3lSyjV7h+Mz9LcXRU2+7TzPT2/
         XNdwlMdxantQbaqAZZF8JGzJ2hzpOJGTmkm9GwJ9evKeOGNSba+gQqhQouNLiwRkUw0w
         2V2o1K8kxlDAfOQDIqwbiHLXzLrfpJzlaUoqI0ybuCyJ4rxv8wQ7JdtN9TYG18eTn1QY
         xQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767256040; x=1767860840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grqBbaE6YnOptD2H7gCSdhIM6A7QBPysLgSlWzZLLhY=;
        b=urWNzpdIWwtIZizU5/9aipBQMMT4W/oCyC2UJloA64EwYQ0ODwQjy1KnZlOzZ2LdDc
         QtATAf59+g1JKPIP4193lfLGHWq4NVsiP+wVMrCIbBCd6+AFYCvxl9AASBw2h/EeVJJ2
         z99s4LtKv+I4+ds6KHStWgc9lKN3OQ4vkJ7pDPDFHmkunzsP/u9UaD/qfvTZtie2QhrX
         MUKtTyfJwybgknZpvIgI9MKAORkYtMHaKCRfzm0/GzPTxYQAfW1cGx3twbq/6onqyM9O
         +n0RqrzvFfhYSBozEWFPEsT5rCLboRgOFanSXy1ih5X0zil3dqR646QVmX6HzhfMTqYV
         51Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWoQHbv1vZDN7BaMx22oyqGdID4eThASgegGC7/BOpdKSQj6U9quDQqVshgsX3eRPzl33+vxYaJb68=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSELDifbM55Wx8rM3bRi7OcMNJM1CMFlEGC/eCkPu4CcncSf5I
	aLEjVf2gtDGkRa6Oky8JoC1+VrncDKAeu92UiNGTzn/SwvRDxwYDRZ94
X-Gm-Gg: AY/fxX4FVtYrrnih49wT9pLF2ZFnO03/HLeLqM4F/+6IB2XLkQLtPGZcpBDaUn56Rkl
	g3L51njpXbJppdcFha2hOdmbs/8BjJvRFNyq1HUHDptq5pRbI6kkeD/7wwolks6m5Z/zwq5YXVV
	QJNS/FMs5BbBEO9pzVsM8QcvFlKsxA3FV03vxihF7eFbcfGrhygxzYI7wOJG7Z+qX5Byi3ptiHn
	4DRkViLqKo0fwcdQ78mSSRZa6BBQ7OsE3OffbI+nvTLkf9PBrLTCt9yZUmfO2jgHptHZBrl3Geb
	DYO54msY8HwsOu3TE8Odn/7QYSonBEib5qEKMyXCHZ4pL4xHm4ZxHkl+BKcQPuuHfG4wwtuk9HA
	espzIxgxZMZctRHYd7IKxqZk18gjthinyGnMGKRiwzEA6VaLE3TrL1tFUgrKQ3RwvqXquqKQ/Hh
	YFQCcZ49nSyiFvo2L8tf7lThA=
X-Google-Smtp-Source: AGHT+IHhkA3a5smj1iEMSa2b7GI5Q9tU3FN8KidSwq7FxEo8bwOhmjGkB12B1a/5qh/4kK54JlHQYQ==
X-Received: by 2002:a05:6a21:32a7:b0:35f:68d:4314 with SMTP id adf61e73a8af0-376a7afae04mr34883862637.24.1767256039592;
        Thu, 01 Jan 2026 00:27:19 -0800 (PST)
Received: from google.com ([2402:7500:499:de94:df89:9172:9a1d:16f])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7ca0baf3sm33118003a12.34.2026.01.01.00.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 00:27:18 -0800 (PST)
Date: Thu, 1 Jan 2026 16:27:13 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Lucas Wei <lucaswei@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	sjadavani@google.com, kernel test robot <lkp@intel.com>,
	stable@vger.kernel.org, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, visitorckw@google.com,
	marscheng@google.com
Subject: Re: [PATCH v2] arm64: errata: Workaround for SI L1 downstream
 coherency issue
Message-ID: <aVYv4bf8BVW8b-Sf@google.com>
References: <20251229033621.996546-1-lucaswei@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229033621.996546-1-lucaswei@google.com>

Hi Lucas,

On Mon, Dec 29, 2025 at 03:36:19AM +0000, Lucas Wei wrote:
> When software issues a Cache Maintenance Operation (CMO) targeting a
> dirty cache line, the CPU and DSU cluster may optimize the operation by
> combining the CopyBack Write and CMO into a single combined CopyBack
> Write plus CMO transaction presented to the interconnect (MCN).
> For these combined transactions, the MCN splits the operation into two
> separate transactions, one Write and one CMO, and then propagates the
> write and optionally the CMO to the downstream memory system or external
> Point of Serialization (PoS).
> However, the MCN may return an early CompCMO response to the DSU cluster
> before the corresponding Write and CMO transactions have completed at
> the external PoS or downstream memory. As a result, stale data may be
> observed by external observers that are directly connected to the
> external PoS or downstream memory.
> 
> This erratum affects any system topology in which the following
> conditions apply:
>  - The Point of Serialization (PoS) is located downstream of the
>    interconnect.
>  - A downstream observer accesses memory directly, bypassing the
>    interconnect.
> 
> Conditions:
> This erratum occurs only when all of the following conditions are met:
>  1. Software executes a data cache maintenance operation, specifically,
>     a clean or invalidate by virtual address (DC CVAC, DC CIVAC, or DC
>     IVAC), that hits on unique dirty data in the CPU or DSU cache. This
>     results in a combined CopyBack and CMO being issued to the
>     interconnect.
>  2. The interconnect splits the combined transaction into separate Write
>     and CMO transactions and returns an early completion response to the
>     CPU or DSU before the write has completed at the downstream memory
>     or PoS.
>  3. A downstream observer accesses the affected memory address after the
>     early completion response is issued but before the actual memory
>     write has completed. This allows the observer to read stale data
>     that has not yet been updated at the PoS or downstream memory.
> 
> The implementation of workaround put a second loop of CMOs at the same
> virtual address whose operation meet erratum conditions to wait until
> cache data be cleaned to PoC.. This way of implementation mitigates
> performance panalty compared to purly duplicate orignial CMO.
> 
> Reported-by: kernel test robot <lkp@intel.com>

I assume the Reported-by tag was added due to the sparse warning in v1?
Since this patch fixes a hardware erratum rather than an issue reported
by the robot, I don't think we need this tag here.

Generally, we don't add Reported-by for fixing robot warnings across
patch versions.

Regards,
Kuan-Wei
