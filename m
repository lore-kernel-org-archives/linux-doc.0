Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6348F37FF54
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 05:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781760523; cv=none; b=lXJwmj0zxtZfFCzHTRnYluIr3UbJjQvwCuLXXdi9Rm6LgV0Cm/KyccWtoAytD/uHiqNSVOQY98EasWX3siqsmiIf5LUdoL88FG9wbMwijqecnjCAL2ZXSJmqEE0Ke0OPSuKf4QwKe62SRfMyTW9AYcDyg0HfM7B1fgXboMHuxGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781760523; c=relaxed/simple;
	bh=TgqiDw5b5VQPj2Gfb7xm2gYBgCDZhtqTtCOxTAHstTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gl7DQQRg+N2VYvk+p70u++L7Kfp39F7DXuZuep0B8gmYW1SENKCrL9JXke/h6LGkJkcT+B+Bw8309UznSIS9jfCsMdRHYToFo/Lpr0agHwZP9aIleRL2AoMSmlrlfldfLFlWPS0KNoT+uMQhXkfJCGdbum0CX5M29EpwAYRmnBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RNTlktTv; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RNTlktTv"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84537777d45so419063b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 22:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781760522; x=1782365322; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CQ7ZXggT1jvOznKKnf3hT4I4MdXGJIQvuFkuvRa45Xo=;
        b=RNTlktTve2TrvgHLvIG7aV9Ca7Tdpmprf+t4Sl/Mk8mNZm2N+HzNhVDPgqj3zIkyaG
         cBQSUZt9v+0YQGpcIYSAvp4NID6McxfQh8RBWSGmSw5uVqNughG/IWOdSSGlGqmmyPOq
         MB7qceRlS5k0MJmXHsEU4OsJcejWFIQqzE9AP7Jl4VLfgpLyZiftwWAeF1zQWM/0x2rk
         yXQRjVpXA3sYkN5itUt6fqiOY+58sADc46Xy1MQ1YSz0tpZiM8VLGaz0ArPAoFhWY3yB
         Gp3AcMP9B+x253kATrljkhlcQzyGrvIglg8Bo5wJBR4TzciicMD+yKrnFbp6fqYg6LZb
         cI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781760522; x=1782365322;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQ7ZXggT1jvOznKKnf3hT4I4MdXGJIQvuFkuvRa45Xo=;
        b=Vr4VnC44A/F7YJxa9hm7JanfL190NvHfW9hdAI+Ph5epMIEnt6EDuj15X2rNNoa7gT
         nizyJwmJpTRPiNv3PEmT5l4PYgK02NVBzEo3bKvkLclFUP1V1BuavqbvFtfoVBxqsp99
         RrVhOl6b9FY5ScjRTcrCqEwV0nTNdPwHoGUdsb6RfV6eWXFb6QFmmLvrPC2lbTU3G8d/
         Nj19JNrCLZ79wZFw/H5EmdiB/CormKgdC5T1R3AdMcicYDQ6wOyjXHyWjpAgnPLhuXRA
         2Cc6UNrEPks8UKP/JDGTEtu5wYcLOk0L0GvUaIk+9mphIHg55juBJXOUAmHni07dCKFj
         PdzQ==
X-Forwarded-Encrypted: i=1; AFNElJ/SuMoipboKvYfbdwMnWWDHSZ0IyBEMuxjGvJ+RBThHXIpecqWJchuTG6POrebUo50qTwYl5SIK5WA=@vger.kernel.org
X-Gm-Message-State: AOJu0YweEqQBAWsuUcV3kBLf77nSZStlGOuztWkPkUwIYd733yHeUJ++
	d49ubFTrs47OnKq0/idlPZ4Vq2QW4kvJIlNKFg1KfIKkm6EsNT8eAAvfVjm2R+TLxnQ=
X-Gm-Gg: Acq92OHuNMrar3jNIC1GgxywmaH0LD3a5UOzgYjqtgjeA0/VCp6VZBr6wF8acbbto9O
	FaEdYqPZRy9IWN1othQPmKlGAzMonS6GWYosuUyg7PMiQXzIzaSzerqH2pbq/LdI/uEPO4/OTVl
	SKF8afRPmZzR5HMRRqgSjhLWHP11GBRVivWO4EuVzN11CPld45/dHZP6HUsIbCWVH+R1Uv1/PqA
	CPy+FyqPBjaS48QXbG+y9xAmIep0CGEA52ENReq5snFQuLFdvBG9yseOvhDSnZjHila2+Zdn7G6
	+e1+e95QR1UplZuvezQhU9MbX2n2tFOvd/vX6krp18ddOdVdXg6anAwNAOUjdcH/EOlIZF2JqEm
	HXXxEMQTc+QpaBaqgyqhoDHZCfVhu9p6ph6WEXVKjnXld/RfADoSJqdrZpFg2vjboFrCdCDRME1
	ihzUuVX84vRyng
X-Received: by 2002:a05:6a00:298d:b0:82f:9407:d167 with SMTP id d2e1a72fcca58-8452457b4acmr7514220b3a.38.1781760521287;
        Wed, 17 Jun 2026 22:28:41 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b049120sm17827806b3a.55.2026.06.17.22.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 22:28:40 -0700 (PDT)
Date: Thu, 18 Jun 2026 10:58:37 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sumit Gupta <sumitg@nvidia.com>
Cc: rafael@kernel.org, pierre.gondois@arm.com, ionela.voinescu@arm.com, 
	zhenglifeng1@huawei.com, zhanjie9@hisilicon.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, mario.limonciello@amd.com, 
	linux-pm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, treding@nvidia.com, jonathanh@nvidia.com, vsethi@nvidia.com, 
	ksitaraman@nvidia.com, sanjayc@nvidia.com, mochs@nvidia.com, bbasu@nvidia.com
Subject: Re: [PATCH v4 0/2] cpufreq: CPPC: add autonomous mode boot parameter
 support
Message-ID: <oxw5k2wad4vorehgmrduoxblequy3ynqufwy4sruclnh5d5wrb@awzmfafoucnn>
References: <20260527202550.206828-1-sumitg@nvidia.com>
 <eacc76aa-318c-4b41-b507-e91e322561de@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eacc76aa-318c-4b41-b507-e91e322561de@nvidia.com>

On 16-06-26, 18:22, Sumit Gupta wrote:
> The dependency it was waiting on, the "cpufreq: Set policy->min and
> max as real QoS constraints" series, is now in linux-pm (linux-next).
> I rebased on top and verified autonomous mode works as expected, and
> it applies cleanly on the current linux-next.
> 
> The [1] reference in patch 2/2 points to v2 of that series; the merged
> version is v3 [2].
> 
> If there are no further comments, please consider acking and queuing
> this for the next cycle.

I was waiting for CPPC reviewers to provide some feedback.i

Jie / Lifeng / Pierre ?

-- 
viresh
