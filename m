Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE1F2459CF
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 15:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774281505; cv=none; b=tcyXpsLl141JfOgHYOiaOHuoWqDjdT26XSRruAcuMB9F2eKWeh5pfOENhRfccQwws5/3jYvAElJqccHIuj9bRUfomVSrJcFOEmIWXo2AGqxA7BIqnydRZ+1vBpCeBd0ZVWmhGIQzHWrapb1lM0+WjpMzAEwjIB7lGjqnkSO1XPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774281505; c=relaxed/simple;
	bh=SIjbg6eQXOuP0jmqsWy91IC/EBDBEn/9XloeItaVU68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLWQGP/b1ph3YcMcvyvERJELeDjAfRub3Z63MhMg3JGCONf/C6kaT1B8febTEviUKUTPkyJIdlXqlVelTWfG3XUxqFnRVMKA6T7UBLHZTsJODOe53EEiy6q6ZMcBftodzhQcz6toxE3RJ56QFx55css6tWU4yqqcEoPEoCzSES8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cgHXN7np; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cgHXN7np"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b7ffed973so162932f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 08:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774281502; x=1774886302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8zPvozvDLJbXtRtO+DHPg5/yA/CXI1wJZEDcBqH6tn8=;
        b=cgHXN7npgAa66dLMAJomcLstkLy5RwlIwYGHigdgK/tyGfVYeJeYv3XlzNpAwSDwCT
         Jphw/S2X+aS8Ne1+/5Z6iG1+vRZTEB/L/R8ivUz0h3ZfoCKnSLBW8YdZLWklN7I1JBCS
         wP/sY/SJ30kwrZCr7OAOyT5mc1fPOCtOYnIQuaTfTiH7b5qOS3nWDb/fKZ5gmMNYna/j
         iLaqX8w9RgYC7MXS8zFJf/PRl2zjjC8j5w8NMeSIruq4X00LkbPwsLobFqkON40F2Sfk
         naqy3xbO/hzb3KGGXZczqRfFwE58zDHJrioLvrUHPIMuU/tO0VqF3S8lHdS72/EryZGg
         2wig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774281502; x=1774886302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8zPvozvDLJbXtRtO+DHPg5/yA/CXI1wJZEDcBqH6tn8=;
        b=TkhS+K4WOyZNil395FnEwVPQm0bTELjRL/mvPDFlEmV02+DtpsSbKwj6s5wIzbCdX/
         sr+kMOCXhe+0AAZexLpsVkQY0WxEY2HN9UyopgqQjDQPQJisb9gq/hW6M00B5M2Z1EOE
         s7onM8Sw7rQB8RwRVm+4Ki3SISzzNm+gs7BH8oabfROB2u4kkE3ltJUSGR8TfTRU3qGe
         d/IptbGnzq3RQRV6FIB3zB2jlLJ08FTAJsZrT5bXx8J5zjbsWnUGPb6PX2EmNDUbyiqi
         CyCIWB0acufa4u8zsVD5+yXaMlNt07/eLBKKN0uUAfVOvXRkw5xPDbB6rgoaT0y8vnjC
         Nopw==
X-Forwarded-Encrypted: i=1; AJvYcCUMI7rT3UOdlDkb+HlMySzNcQ52pMdnMh9/Oppv7CZ+8VHy86VXi/OtRlthm3tYk7vZSjSqPedqFiw=@vger.kernel.org
X-Gm-Message-State: AOJu0YywhgJQfOMSTLKzLEQxtT+1j6/MLpzAuKm9d61+qc76ZedrJJ+A
	ff+RhU+ZdLjJSFyR81Iq+DMGE2BGAuPi390GdqSEMGXPtwj7EJA10Vz/eL5ivegMLdk=
X-Gm-Gg: ATEYQzyFrwy7zrmnv4kXzqeOc9AmfijrVXe1SUlsVK9+qTwoEigosKBE2dPa/Jpx+9g
	GyfFa0wjmrOyziHf7kxTXtpU2hjxL7j2kg1SU/ldMDQNP6KY4zGlWzYMo4uj8N+T/63QJgZUb2F
	i+ni1OEzw3zCoX3XAmTsHCotHu8FXe+KfIbZY4OywTgMS331n7d0otxTPJVMxyTKYQ9tZ5R06BP
	0tzkpfNHOl6nQc6tS0ApAPt3SUBcMKua9KV1m7gTuutdz3/4HS4nCDXoptYwWMVi8hlNPx8w90C
	wCme2qya97Yb6+0POFa4yYpJINRFRgoIVcFQ6MBwOV78qnS790yZ4gVBzIcsNOGU7ecYlB7+DuU
	qWuLFhycJf9A13YHFbKnDYrZvsKQ11G1gIPeHSptX079Ee8g/8BGJ8MeDRDhERh4KzEON/O4BPV
	24QK/qbZWIBH96Q3x6LneeWdrD3Q==
X-Received: by 2002:a05:6000:2302:b0:439:b339:7ee8 with SMTP id ffacd0b85a97d-43b64244554mr19220543f8f.21.1774281501697;
        Mon, 23 Mar 2026 08:58:21 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b646b0b0csm29070120f8f.15.2026.03.23.08.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:58:21 -0700 (PDT)
Date: Mon, 23 Mar 2026 16:58:19 +0100
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
Subject: Re: [PATCH v2 2/5] watchdog: Update saved interrupts during check
Message-ID: <acFjG2u9Y0asuOrt@pathway.suse.cz>
References: <20260312-hardlockup-watchdog-fixes-v2-0-45bd8a0cc7ed@google.com>
 <20260312-hardlockup-watchdog-fixes-v2-2-45bd8a0cc7ed@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312-hardlockup-watchdog-fixes-v2-2-45bd8a0cc7ed@google.com>

On Thu 2026-03-12 16:22:03, Mayank Rungta via B4 Relay wrote:
> From: Mayank Rungta <mrungta@google.com>
> 
> Currently, arch_touch_nmi_watchdog() causes an early return that
> skips updating hrtimer_interrupts_saved. This leads to stale
> comparisons and delayed lockup detection.
> 
> I found this issue because in our system the serial console is fairly
> chatty. For example, the 8250 console driver frequently calls
> touch_nmi_watchdog() via console_write(). If a CPU locks up after a
> timer interrupt but before next watchdog check, we see the following
> sequence:
> 
>   * watchdog_hardlockup_check() saves counter (e.g., 1000)
>   * Timer runs and updates the counter (1001)
>   * touch_nmi_watchdog() is called
>   * CPU locks up
>   * 10s pass: check() notices touch, returns early, skips update
>   * 10s pass: check() saves counter (1001)
>   * 10s pass: check() finally detects lockup
> 
> This delays detection to 30 seconds. With this fix, we detect the
> lockup in 20 seconds.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Mayank Rungta <mrungta@google.com>

I agree with Doug's analyze and it looks good to me:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
