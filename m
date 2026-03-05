Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD84225A34
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 13:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772718422; cv=none; b=oAZMjkDQUXVTphbOPIQp1+tlDYTNdtNgy+qV0npqkmX1X5GE97Z8mvgtw+4cZxGVIXDmHJPdPgr/4hp+/R6mw1YgLIS6XKsT88HANsalz61Ajklp/pBHdeei4TLMTeFg32ttyHXTndk6/SYuZo01iZ5omnMsaEGq3Z7fYb616mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772718422; c=relaxed/simple;
	bh=sEuDsc0+mp9tmcxZyL7bvKlf4PPTOy0G8mjD4rlPTcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlayEVf329eMssI/Y+DLt0G7QhhqlF1vkzbXipXhFW9yOrrKCGO94jUa4gM5hjzTUMGD+VDL+j5BVB7iu0zXmMaMcwfvoi5C0LL2pQqUdmFi3JmECbzKsAARJ2RRZShWszVC1VjVh1DhFdIHfi6Ie4UBc2kX7ir+b5ki1r+yUpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gMrn46V0; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gMrn46V0"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48371bb515eso120219935e9.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 05:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772718419; x=1773323219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zT+emzS7qx5zsje7mMsVKr8zugK2lzMFjC3SnpIik94=;
        b=gMrn46V0MEVPyU1YMxXYKLVBFCx6ojp6hnIXoo+sVjCcxjPuriJZ+OljAklziJYo38
         hnejw4LOIuDLQjC5fCFcpIB6t3tHK5ryn9cenXrfK+zEKc4TLKQF/uz9sUBCmTzPq4n4
         KfxGADtmRjxwhC341uV3JpDxEZPejiFKgO1bVT1CVpEm+dfA+QRL1XhUGeMfZYTHKTa9
         ldRMygXmYrIYyZDkLvKBzJOvGJ2RTzJo3gpgf/vZcZttOUrKEEd92QsVN+Ou6PeZIwB/
         jrT0PLzzBDgwLC6jcYP4n/a8R4n2a/kpG9YKXsxDK8dQs5FXHIvTBACzeAarA/UB9vN1
         vNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772718419; x=1773323219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zT+emzS7qx5zsje7mMsVKr8zugK2lzMFjC3SnpIik94=;
        b=mm8caM0eA0AOB4AwaMf6Fg+hoL7K6z/yWfM2qsi7FCUPs5USDlqUHelcxpEiIHNlXj
         P6GxiPAtfAe37UeCj2Uo5DGymbCkNET6qsBWoyJo7Hx7P6KNzpnvmWYVXGSyfYfgqjm2
         fePRgVWiMh8JH/UCtbmUHZRBhn1gN1S7fhv1xOrxaLfSE1QdoxE413IDn4eOPXJkC3Jz
         jXxHJrV48kh/3WidBQEwb5qQC8a47NX9DUNnYYxjaVzniQyS+gHx6IkLzRFCMrSgdAdt
         OSTCzBdKkkuXpPqSweFUQ61+1FdmcIESp3j2FN8ActErFx5Vw1OXYhC4agJviD9rICsp
         5EkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJM1QYAXYhpC9oB49dpQCZt/RB41sdiXiAy8JiQoadqVelD3/dcbvmPz7emP7jRFwxNOl1zUqDvTY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Bc04JYS8y2sQR3oEM9GJ8ebykzonMSeapzQpNil+muvrxGnR
	KAFvYCtITvSryEPkEKKHYt6nQjJmW3HgiGb1rkPdF+0/Z4x8MVvB+Iao+TDw4X3y9GM=
X-Gm-Gg: ATEYQzynTnDrMSyaO1Sb96ODrfDnYBOozFmADf9kEGXzpNoCMfjaeVZaFn6doxv16Qu
	MJSdU8v2bP2KHclkgoit0KI2LkQ+OtnUlbkXHTbvOAXy4KIAY4kGWDQDTtlNqy9b9QTDahakWLH
	6LSKBNVE37d2Q/KF6z6bKrVMP3aAqe0T6pTet32xdVBGFIR/6/0PJCQ3+LZ4vuxHdpHuxDdqTcC
	dOTM+AStSfL8O2YNQqJEbAQ92DgbflEeA4PhjMvhU8In+PTAgn1v3ilLzmiqrQdE9hvmXRPtw4K
	PVahDWaZhIWrualA9NzcR8Ju+HNo+WTDFG6uQGHzGrq9KjefqAtrdZhVE2J6rT5OCxZS3WP0BBG
	kQZpvvaAaMN7isMxV0I5vT3CO8iypUK3dypXwiyuLJwPOOtUdtQXkvQzfPit4Ic+xtxGe7gQJIY
	NggxASAbz/f6OQ+Zp6mlX6L8LMYQ==
X-Received: by 2002:a05:600c:444e:b0:47e:e91d:73c0 with SMTP id 5b1f17b1804b1-48519886a55mr99649885e9.19.1772718418844;
        Thu, 05 Mar 2026 05:46:58 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b130abfasm32676008f8f.34.2026.03.05.05.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 05:46:58 -0800 (PST)
Date: Thu, 5 Mar 2026 14:46:56 +0100
From: Petr Mladek <pmladek@suse.com>
To: mrungta@google.com
Cc: Jonathan Corbet <corbet@lwn.net>,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Stephane Eranian <eranian@google.com>,
	Ian Rogers <irogers@google.com>, Li Huafei <lihuafei1@huawei.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Max Kellermann <max.kellermann@ionos.com>,
	Douglas Anderson <dianders@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/4] watchdog/hardlockup: improve buddy system detection
 timeliness
Message-ID: <aamJUImqf4WfTu3d@pathway.suse.cz>
References: <20260212-hardlockup-watchdog-fixes-v1-0-745f1dce04c3@google.com>
 <20260212-hardlockup-watchdog-fixes-v1-3-745f1dce04c3@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212-hardlockup-watchdog-fixes-v1-3-745f1dce04c3@google.com>

On Thu 2026-02-12 14:12:12, Mayank Rungta via B4 Relay wrote:
> From: Mayank Rungta <mrungta@google.com>
> 
> Currently, the buddy system only performs checks every 3rd sample. With
> a 4-second interval. If a check window is missed, the next check occurs
> 12 seconds later, potentially delaying hard lockup detection for up to
> 24 seconds.
> 
> Modify the buddy system to perform checks at every interval (4s).
> Introduce a missed-interrupt threshold to maintain the existing grace
> period while reducing the detection window to 8-12 seconds.
> 
> Best and worst case detection scenarios:
> 
> Before (12s check window):
> - Best case: Lockup occurs after first check but just before heartbeat
>   interval. Detected in ~8s (8s till next check).
> - Worst case: Lockup occurs just after a check.
>   Detected in ~24s (missed check + 12s till next check + 12s logic).
> 
> After (4s check window with threshold of 3):
> - Best case: Lockup occurs just before a check.
>   Detected in ~8s (0s till 1st check + 4s till 2nd + 4s till 3rd).
> - Worst case: Lockup occurs just after a check.
>   Detected in ~12s (4s till 1st check + 4s till 2nd + 4s till 3rd).

One might argue that the interval <8s,24s> is not much worse than
<6s,20s> achieved by the perf detector.

But I personally like that the disperse of <8s,12s> is lower so that
the result is more predictable. And it is relatively cheap.

People might have different option. But I am fine with this change.

> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -163,8 +171,13 @@ static bool is_hardlockup(unsigned int cpu)
>  {
>  	int hrint = atomic_read(&per_cpu(hrtimer_interrupts, cpu));
>  
> -	if (per_cpu(hrtimer_interrupts_saved, cpu) == hrint)
> -		return true;
> +	if (per_cpu(hrtimer_interrupts_saved, cpu) == hrint) {
> +		per_cpu(hrtimer_interrupts_missed, cpu)++;
> +		if (per_cpu(hrtimer_interrupts_missed, cpu) >= watchdog_hardlockup_miss_thresh)

This would return true for every check when missed >= 3.
As a result, the hardlockup would be reported every 4s.

I would keep the 12s cadence and change this to:

		if (per_cpu(hrtimer_interrupts_missed, cpu) % watchdog_hardlockup_miss_thresh == 0)

> +			return true;
> +
> +		return false;
> +	}
>  
>  	/*
>  	 * NOTE: we don't need any fancy atomic_t or READ_ONCE/WRITE_ONCE
> --- a/kernel/watchdog_buddy.c
> +++ b/kernel/watchdog_buddy.c
> @@ -86,14 +87,6 @@ void watchdog_buddy_check_hardlockup(int hrtimer_interrupts)
>  {
>  	unsigned int next_cpu;
>  
> -	/*
> -	 * Test for hardlockups every 3 samples. The sample period is
> -	 *  watchdog_thresh * 2 / 5, so 3 samples gets us back to slightly over
> -	 *  watchdog_thresh (over by 20%).
> -	 */
> -	if (hrtimer_interrupts % 3 != 0)
> -		return;

It would be symetric with the "% 3" above.

> -
>  	/* check for a hardlockup on the next CPU */
>  	next_cpu = watchdog_next_cpu(smp_processor_id());
>  	if (next_cpu >= nr_cpu_ids)

Best Regards,
Petr
