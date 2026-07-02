Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E57828DB54;
	Thu,  2 Jul 2026 23:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783033272; cv=none; b=T/niQi0AFlIaXLOASd4XVzeTZiB0AJTRCULc0Og/tBbv1/JM2BKBpgjtalbThr5uwPbd3SLiMCFL5B5w+m9B5+iojr/ve6BBeJbu6K3t9m8lWw/zQZc1kGdinihRGf+fx6ureN9iS6OVncOKkHk5hei0M3MMHEEO48wNvRgJeRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783033272; c=relaxed/simple;
	bh=gcl/8Feuq9V50/biB63y1mXH1jUxiFKHWN+pbZ2QyLM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=CQDWRuzA+p8ps9vm5IUelyWF51zRLg+yiT5TTtQAqY4QII92NfftHX42hShxASUYXnRfOzM1SCowF3W4dRh1MC/gC8Fqw2xr7hapre/Uyp7FauVjcZvRJTpDdLoPilHoXoxQVODeLLgkRPQzh55KSWsYs04XjZzXiWbBz9mAewE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SW44xOgp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SW44xOgp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99CEB1F000E9;
	Thu,  2 Jul 2026 23:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1783033270;
	bh=Bh7Low9CQmmv1iMLpY59v954KtOu9i1ocb0oKEuyJT4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=SW44xOgpij+Q2jG82s6/OzwzEFuf+ZAS5rmKHgHMoMiaBHfhyMb0GuuXUmLk+rmq8
	 fQUukKEXSdLYxHUw/ghYBxl+YtkYUxDLIz877A/kLBCe2uzQZ9QJ9Ry1SKznCy5Wov
	 VOJjfaaED6plQ2awOWYxvl6ll4KhxNuhvUAApX4I=
Date: Thu, 2 Jul 2026 16:01:10 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: <wang.yaxin@zte.com.cn>
Cc: <fan.yu9@zte.com.cn>, <yang.yang29@zte.com.cn>, <corbet@lwn.net>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <xu.xin16@zte.com.cn>
Subject: Re: [PATCH 2/3] delaytop: add timestamp of delay max
Message-Id: <20260702160110.789de3e4f12f28ae958ecea8@linux-foundation.org>
In-Reply-To: <20260702205854461V25Py2xQvLesD8HF_2Rh8@zte.com.cn>
References: <20260702205704180NZ3cu_QF04KfBIL6vjTHL@zte.com.cn>
	<20260702205854461V25Py2xQvLesD8HF_2Rh8@zte.com.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 2 Jul 2026 20:58:54 +0800 (CST) <wang.yaxin@zte.com.cn> wrote:

> From: Wang Yaxin <wang.yaxin@zte.com.cn>
> 
> Record the wall-clock timestamp when each maximum delay occurred for
> all delay types. The timestamp is displayed in the MAX_TIMESTAMP column
> when using -t/--type option.
> 
> This enables:
> - Identifying the time when a process experienced an abnormal delay spike
> - Correlating delay peaks across multiple processes at the same timestamp
> - Cross-referencing with system logs, traces, or other metrics at that time
> - Pinpointing the root cause of latency issues by finding concurrent events
> 
> ...
> 
> +/*
> + * Format __kernel_timespec to human readable string (YYYY-MM-DDTHH:MM:SS)
> + * Returns formatted string or "N/A" if timestamp is zero
> + */
> +static const char *format_timespec64(struct __kernel_timespec *ts)
> +{
> +	static char buffer[32];
> +	time_t time_sec;
> +	struct tm tm_info;
> +
> +	/* Check if timestamp is zero (not set) */
> +	if (ts->tv_sec == 0 && ts->tv_nsec == 0)
> +		return "N/A";
> +
> +	/* Avoid Y2038 truncation: check if timestamp fits in time_t on 32-bit platforms */
> +	if (sizeof(time_t) < sizeof(ts->tv_sec) &&
> +	    ts->tv_sec > (__u64)((1ULL << (sizeof(time_t) * 8 - 1)) - 1))
> +		return "N/A";
> +
> +	time_sec = (time_t)ts->tv_sec;
> +
> +	if (localtime_r(&time_sec, &tm_info) == NULL)
> +		return "N/A";
> +
> +	snprintf(buffer, sizeof(buffer), "%04d-%02d-%02dT%02d:%02d:%02d",
> +		tm_info.tm_year + 1900,
> +		tm_info.tm_mon + 1,
> +		tm_info.tm_mday,
> +		tm_info.tm_hour,
> +		tm_info.tm_min,
> +		tm_info.tm_sec);
> +
> +	return buffer;
> +}

This appears to be a copy-paste-edit from format_timespec() in
tools/accounting/getdelays.c.  Why do the two differ?  Is it possible
to use a common implementation?  tools/accounting/format_tiomespec.o?

Does the getdelays.c version have the possible issue which AI review
identified?


