Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C685D3AE19E
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 16:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774283170; cv=none; b=SHrsmyOmZl9sOy23P23myE5+cJpMUe0vG2JICS2hu4wRdkS+g995TjnVbL1a05VqEHO85QOOFx1Ib9dezXdhrAERicloQy3RuQ1F+ZQ9JLj9K6xJ5+L+7jUmDacAUPtrRXPxfqe7wNaBsK2FqyF1HfyriEO3Ke1uYDIPUFbq+qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774283170; c=relaxed/simple;
	bh=RsoS7IM4fh8UEkYum1kpprJSAV19xOoM9rCiG66pt0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OzX3m+AuAZRU/OKH3pqccboW0pE8i3q8BMlJeY5wdMyXwgaKJi1RwjtivM2SY6fM4aIrBXTasLTp97sD8nNfA8NjJJgyLn18/d/EgiSP6iL4z/eyQlUKxKc1FnB+v+OcuBLJRzK5DrnT3/gV8bzGReSG9eg0tNpWUD8BSIk+1vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LM3mf5j+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LM3mf5j+"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48374014a77so42953335e9.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 09:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774283167; x=1774887967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LXZ8hpCF4Dj/yvrRdQJq4wR/bRyMiRERx4Y7rPWlrqg=;
        b=LM3mf5j+zxEUssai7WeQ326Gy9OdKM3ND45rtW3/l+hP8hpWanqQQ01VT45WSVrxl+
         9u1KlZb5eUMXxs6OcMZA5pzngjhIhMki/EU5bq45iat908pywTCpbnqBbR7B6CnRChfq
         EnwGMS4qF+D8zVHMOCLC3huObUupI3yVgUvxtorg+MYeD+5JpS4v4u/TRRhVZfoSaf9A
         IP9wlU6hkGC6bZ6PtJYgumQyFot5CCRvNg1qrpZ+SDL8kaszL3s7qPijUtF1wA2lZ5+3
         bStc8g/mVZNiyjvqpsBRH63WGvso7sBLxXeQUT2AoSeHElrbyoQG8478gOU7cY6H2kcI
         NFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774283167; x=1774887967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXZ8hpCF4Dj/yvrRdQJq4wR/bRyMiRERx4Y7rPWlrqg=;
        b=eHBIeiH4sj5yKrrknxhHztNBhbrlC/dFBPAzxs+QBzrTj03ZLcZX4qr+fwlq7/kGcP
         X8eD6DFkg4z3+lYxOI6rcQSKB55hqrWDE2wyj4aVkEURYO2vRF7iX0Zuf+NxsZvWQq1c
         JmbCFH+7L4J46xW3PpOfCAWwvPumNoPSc+OcguwLgt7a8M8ZcWX0/taOFzloP34g33x7
         BsCRb0HnmsGkh1gKS49P+7pqXT/orB4mClY9XAI0oseMxsz+1Z51EhDoq8HnudxmEE0x
         t6XozeTXo7OltY5EcvAOLlPT0qq8nqpnbe/HzvnIqkR7JGAjrDaTp0J5XnrqsMgluzyR
         +gIg==
X-Forwarded-Encrypted: i=1; AJvYcCVEY7GEiJLWL4x3GlPEkAh+9mYNS/zqDM7dA2ZOZqttuKnicUPjk0S3xoQ4QhKqi68my9SQ8kf5/+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUHEXdOU5luqasUyNwjniaNFquL+uceXFmtWXSKkNOt0pOIexs
	4Fwrb+FbDv2kjuXVsRuErjsC0Ca2FB46xOcnCeugXnkuljdMb0SL5LUXwboyZLH9bn0=
X-Gm-Gg: ATEYQzyTdUkW/OJb8gbsG3abr1qKyWXCwpeswrG95547Ay4Bgnwm8uLB2fNmNL70pbo
	11+aN9/ZjU4EPx9Gl+BjdBi+qecbWeQgh3bepuOC6ufN8qIt7/5sfitGUNR5Drsuxq4zyuhW0cB
	VbrPsBBQdvUcawq87HICEMtGeCDSvZy+NV5vNmLP8AY9pJ+uFfL8R14hPm6JQGb42EGChomVAhs
	wOd+A0/HdGzkCb+u5df8u6LToqWGU0hmQLcsimpa9qCs9uoyho73Se9onuXiNp43ZvB7q8oY4Fk
	PmVu3ezTw1rAxFWThmy94Nei6bk5UsFkZeT24gDMRoY6Gb7dH6S4edH+XUf6Z75a/aWyyC4V9yF
	8ivo1TjhDln8CkQaROxPlJo7eDOIohIk7UyBTV82NP5AOpmUL4hhhpxE4p0o0ZfR+T2g+1NCcYm
	rPLkr1fNsgKnyBhRamR+t3pyTnqA==
X-Received: by 2002:a05:600c:528e:b0:485:6ec7:2df with SMTP id 5b1f17b1804b1-486fedb1586mr179779935e9.8.1774283166939;
        Mon, 23 Mar 2026 09:26:06 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8ba4baesm563315015e9.13.2026.03.23.09.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 09:26:05 -0700 (PDT)
Date: Mon, 23 Mar 2026 17:26:03 +0100
From: Petr Mladek <pmladek@suse.com>
To: mrungta@google.com
Cc: Jinchao Wang <wangjinchao600@gmail.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Stephane Eranian <eranian@google.com>,
	Ian Rogers <irogers@google.com>, Li Huafei <lihuafei1@huawei.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Max Kellermann <max.kellermann@ionos.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Douglas Anderson <dianders@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Florian Delizy <fdelizy@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 4/5] watchdog/hardlockup: improve buddy system
 detection timeliness
Message-ID: <acFpm9xvDQFugsnv@pathway.suse.cz>
References: <20260312-hardlockup-watchdog-fixes-v2-0-45bd8a0cc7ed@google.com>
 <20260312-hardlockup-watchdog-fixes-v2-4-45bd8a0cc7ed@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-hardlockup-watchdog-fixes-v2-4-45bd8a0cc7ed@google.com>

On Thu 2026-03-12 16:22:05, Mayank Rungta via B4 Relay wrote:
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
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Mayank Rungta <mrungta@google.com>

LGTM:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
