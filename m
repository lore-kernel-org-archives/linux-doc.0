Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408C531E836
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 14:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773238027; cv=none; b=m0IimpCmOR83rHSDTrd1CxDXXcleB4m0nBurR7iaP67qQol16aAlphB0FP3d9/JaphTG4mFboTxylCI8xhwmmCb12GWs1gjE0ZrwzvceI5d4OrZydWCqZZQO4KEPaVWIUshn0lNVRATfflOWSKpgTvhfhcMdKDb5EMZzsBhsl0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773238027; c=relaxed/simple;
	bh=Fd1mYtpfk66Zlazj7nT3zuvWvOHW00VZQFPEW9Ttx28=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUHs/S4EGOf3xtpF1M3egl5/ES1PmAp0D2s67KWlaKLCsrbFpCfNhJ8lTTjKCq92lkvDTTKv0sLmTHxqjTSINUwHcjadcy6v27HzY+66T9ed/egrbU/tbPQ8FzI7AdMZwCKw6uOdtWYUzQhHVDi8PrLIolUTD/Gb/QZjH9LE+xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=G8STOH3U; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="G8STOH3U"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-485445e80bdso17743635e9.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 07:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773238025; x=1773842825; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6JiaOxu0oMiUlwTd4Az0OphvPRvCCSUjpenBGodYb5o=;
        b=G8STOH3UEU0Btx7F8Q8BJVO7gCg3tJrobGvA9LlgvPihnIxGj9W7Cc0UO7qDCBWxyG
         sYXORa83izMDjxDWFTHFHGjS3MUQHyhkXIcTsbXOeWJMiHtM0/QTnxfRZ9TGNKW3xbdk
         M6z4JG/eSfuQ5YaU331mOc379eW94D6ontFuP67d6r5kKMSiQAjetv/sAsUmxqhWBArv
         NcmSyjI1jdyBpWMvuRdrZXxJViGD7qgJDu48PNFVIqStqeBsUVbaQNrBXGqJUdcQjYKC
         3MC6jzzNJS0ffUIggn2Wpc3zsCXEuc2GOvRwCyWmnyYsJVY2EmwhFpYt1XwZ8Csi7EaX
         Z5ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773238025; x=1773842825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6JiaOxu0oMiUlwTd4Az0OphvPRvCCSUjpenBGodYb5o=;
        b=UQQiiCEcnlZL02QabpWOJekw8OuQ9Qi0p3h/vdMpkdUD5B1k9ilRLcFTth3JO+fnQo
         aZ+OkLJva1vAw5m9XyRrKFeHCqWfyjEb5l2OmkyBHSS2BC7uHagqx9T64fUtBnR3niDf
         Anc0Jaa9f/wFeRld2T3/Tq2vvd5OuTGq52d9YumabgJX5gh15DMGytc4ny9wMGPEifTl
         LLog0cthCwknYiWDZMLJglc77hWg/cG6TjvO3yrU3KSjC8UEBnkmerA0Kh6OQvDDiSRP
         o1ZV2zMaxYXmpZm+IUvvhDh+MOOnCdz5bT4Se3pTpjzjCF5nMmuVc+a45JSz3yzqzvde
         EFdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKOYGNMwBhhAtw8JPUmwtjN4w7kXDlD17o9MtmVftzgtZewXMq/6iBhbJW4JuoJOAwzsiTegDzTsk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoiO0qAdd2rd8/J+aisg8ZyMYTF/1z53AZd13T5+jt9iFU1ZzN
	I/LDy3ffAbHnsKu7CNmufUDJuC24N/Q7swt+pD/dzr18pUE//CupD8HfcnwnMHHd7nU=
X-Gm-Gg: ATEYQzycHZX7FvIXMrQ8UxbZESbMn/tNWCZ7cyHxFZjvIsXe9BHusPH9RSfjHTUFL2H
	JSFEuyFExhl8iGY4F4TzLzULiwwh4c/COH/QIRji0ym1mJbH1R6Cby14u0lvrSDxCjRfd3WB5Fy
	09fjFnyq9AELbpfJu6fdQdeOVn8cxEHNCHgQeUa2hxbIoRQx3w7Kcm+jwmdCtWnfDgYWBMga+89
	mvsd+t1LsDhRAD9oN7yEWtQfjMAJV0Kwisdfiot0K+Fraw8w9dNGaRrquk1yCAcsTc1TuUQbbjg
	nPFQndR6gs/SesejgRYn1N0a4lthgUsa1VhNUuE4AS+WhzstwhXK8KnpkmeHr4mIISN5we59odu
	SPitSxyfsChziaodCxS9FtoYUrNOtIYqMvvynPNpSIkqC8uoVnhWdH9Kko+6diKvgf/BwMHSiTO
	zjz6GULXeRJNpjp76ZO8RmdLiKk09ZAae47+GP
X-Received: by 2002:a05:600c:1f8e:b0:47e:e076:c7a5 with SMTP id 5b1f17b1804b1-4854b0ca217mr46078285e9.11.1773238024538;
        Wed, 11 Mar 2026 07:07:04 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e912fsm140577955e9.2.2026.03.11.07.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 07:07:04 -0700 (PDT)
Date: Wed, 11 Mar 2026 15:07:02 +0100
From: Petr Mladek <pmladek@suse.com>
To: Doug Anderson <dianders@chromium.org>
Cc: mrungta@google.com, Jonathan Corbet <corbet@lwn.net>,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Stephane Eranian <eranian@google.com>,
	Ian Rogers <irogers@google.com>, Li Huafei <lihuafei1@huawei.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Max Kellermann <max.kellermann@ionos.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/4] watchdog/hardlockup: improve buddy system detection
 timeliness
Message-ID: <abF3BijtTWibBsoG@pathway.suse.cz>
References: <20260212-hardlockup-watchdog-fixes-v1-0-745f1dce04c3@google.com>
 <20260212-hardlockup-watchdog-fixes-v1-3-745f1dce04c3@google.com>
 <aamJUImqf4WfTu3d@pathway.suse.cz>
 <CAD=FV=U1sthV5amOahSe1Yc1tkg39JcUUcUDCCHrKtx8i0f-4g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=U1sthV5amOahSe1Yc1tkg39JcUUcUDCCHrKtx8i0f-4g@mail.gmail.com>

On Thu 2026-03-05 08:45:35, Doug Anderson wrote:
> Hi,
> 
> On Thu, Mar 5, 2026 at 5:47 AM Petr Mladek <pmladek@suse.com> wrote:
> >
> > > --- a/kernel/watchdog.c
> > > +++ b/kernel/watchdog.c
> > > @@ -163,8 +171,13 @@ static bool is_hardlockup(unsigned int cpu)
> > >  {
> > >       int hrint = atomic_read(&per_cpu(hrtimer_interrupts, cpu));
> > >
> > > -     if (per_cpu(hrtimer_interrupts_saved, cpu) == hrint)
> > > -             return true;
> > > +     if (per_cpu(hrtimer_interrupts_saved, cpu) == hrint) {
> > > +             per_cpu(hrtimer_interrupts_missed, cpu)++;
> > > +             if (per_cpu(hrtimer_interrupts_missed, cpu) >= watchdog_hardlockup_miss_thresh)
> >
> > This would return true for every check when missed >= 3.
> > As a result, the hardlockup would be reported every 4s.
> >
> > I would keep the 12s cadence and change this to:
> >
> >                 if (per_cpu(hrtimer_interrupts_missed, cpu) % watchdog_hardlockup_miss_thresh == 0)
> 
> I could be confused, but I don't think this is needed because we clear
> "hrtimer_interrupts_missed" to 0 any time we save the timer count.
> While I believe the "%" will functionally work, it seems harder to
> understand, at least to me.

My understanding is that we save the number of interrupts
and reset missed counter only when:

   + the number of interrupts is different (timer on the watched CPU fired)
   + the watchdog was touched (hiding delay)

=> it is just incremented when the timer was not called
   (hardlockup scenario).

In particular, it is _not_ reset when we report the hardlockup.

Or do I miss anything.

Best Regards,
Petr
