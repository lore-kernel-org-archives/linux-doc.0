Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC5439DBDB
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 11:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781437311; cv=pass; b=UAAcrfKoRgBUMRQauQuoXFkwmHrjqPniecHRLdMjwZPsj+mjmeTIrsfx0s+l4hjwmOBebmsWqT9LmNxxAXDKv9fqEosQNwa8PWugC6o99ga42PZBHegMV2xe7fFOe4y3BJYMqLgwDTnSqKWcAs4X88f/CScSsaoYOMX+FC5S9lI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781437311; c=relaxed/simple;
	bh=+QYGK68tYn6kO+42tzFsfF/PI7vOCoxlnLOyNd19xSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rti9K76O32thvp/Zr/Z6fli1k9pCT6mVVp+6es8OA/5ruIYRHfF6JBua0ykNeUptmX1g0SWIydgQWiAdGJIDeIPRM0FXniWTpmWcDY4vnUCMGiTmymD7PGbNtmUWpViqBP/09P29uSnUHYEnXB1PzQ8Rp8tdunxD+KiMOllkDpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=dls+IeA2; arc=pass smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="dls+IeA2"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-48670d35a87so2319366b6e.1
        for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 04:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781437307; cv=none;
        d=google.com; s=arc-20240605;
        b=cuR/EI7FKUNXuALaQ76Dz+vm/2eB+u9Ea2t7axVgGQpdTj2sQ5XBO+cEpkAbMv44H7
         MlVj7dylSmtPugxYCViFYSrOqDiHisegGa0fhEiWc/4+978221V5KanuJwRLkTQzN/ia
         IET2VGYxCOCq87gcZpPy6Upag3IWt7XmaKYImlfTBkHzY1i9dx917WlecBAhsrbGpBdJ
         5wRfTncr8MSTd1A1cvf+Gh2cCLlSKmzWqXg+GEKKI/+VLIVDIpD6CNh6Xoz1ecTaS5FS
         vwm7AFrXRCWI64tY0dZbcMo4EnPIufkxChdY/gK59NFDIJZhlG2l7pZ5ZakZL4KMHCni
         e50A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+QYGK68tYn6kO+42tzFsfF/PI7vOCoxlnLOyNd19xSA=;
        fh=KKhonNp9mTKyjXHtRJKQaEZVPoOEkdT00jmkrVFegt4=;
        b=f8v+3RV4x1vN7xzOSZ1v0STeYBxjM61EDml9KyzEX+q17rQexXhcLDnKTgooUjEy1K
         wVtuWF3YergvvdIPtoQS0noP15dtWwTCYPQ0sDfj/dV2tmqHfAekQsePRirDwn4Q5e47
         ZVxcCnq17FNxT9uA8290tR3HPuN5hOgymDld4bksWSd2CDYBhPHybYaFciMNiYfp/Q4T
         gBSXzjiFsn+KN9tB9xDXNlYmCopPM152imBPTRhhJyf5n217vY3fzKmYa/+TCkKd9Mt7
         tyAsq6uTWbC7LwaeRQ0mtvhcxyUGFKtAcyaiRq/7OORWdUryTUhAmoTnyQbui1sCW5Bt
         Wu1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1781437307; x=1782042107; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+QYGK68tYn6kO+42tzFsfF/PI7vOCoxlnLOyNd19xSA=;
        b=dls+IeA20DL49MlA2/4T10A3XJqXucdWJ4tkSp7/UYsqFmZDbdVrMpherr+3bCdOjX
         sf+fDGD0+IEGRQatXR4d1XzQIBQyvEbEUzQxAi4RYi5P/wD2bze5K6/TjhEI6Nbf3vFR
         Irdh0yUd4el7ZKDVuVs2etYgyCR4wGf7bXYyfqqrC8VbzaXbL5QqPVWGulWQGFQTSqPi
         TtlIST3pTsqhHIJnk0Zp1pe19lB2/2Zf1DP3iIjdt8fjphmZbhvpxsYIg/JKALzfwyH8
         i3hHnnq9z3LdEo8bRwuwVxMKE0VUi0yct8FkTB9L7L+eHqvGPBObUAW3Mzuz8nLGIGSe
         unMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781437307; x=1782042107;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QYGK68tYn6kO+42tzFsfF/PI7vOCoxlnLOyNd19xSA=;
        b=jOzXgd6S/tZ6QSFUe95UAU4qoYPxeQ/TPSoZPXxkKakYNSSEIccipORDD4uhumceDs
         LvpY+NWID+nuF/AvwV8Ttax73Va5QDZHTTiFhyiWXnIwFItno1vu/JTIINONBa4I+lPZ
         1QGltcuBMjivryRf30XjrlhR8YyT5tLDJOEbikee5M6SWDo0M6nXLB6toc9dFJUru4W2
         rEit/T36aXgez3EZGrb5BA+Dwlf/EMVqHuMFz/kvd+ocG6k9sLdnrLAymMhRM1s+nxQJ
         pJrunWEP4rojhEzc9FVmtNlseVkFETrGUfm9cwef2RhW8qGDmip5a4jCjb4m15otPG/k
         Te9w==
X-Forwarded-Encrypted: i=1; AFNElJ/8AqNxmv1vtP5U/qVaK6og4GewMDl4zBfI5cPOJvuP6PXEv0CnlWNRD5MEaPxhKEEYot/TtIqlHas=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMzFM+R/AM13K7S3qfABNzv8FbHRfweHRK1w6KO97jQ1xGTs+R
	bIrOHsLrMMscmC77o7hqaqGP3h85av7XH9qdL8sdEf41x6QTnUg4770t453xxocpJ/XCFk5fmP1
	w9+gUfnU1VPFVMt0aEtJXNxwQiZL30rInk3MmXbkF0Q==
X-Gm-Gg: Acq92OHTewQBo9UuTe9VGj1zEKyAW0LwPtSs9zPFi/Z2nCYwf2G5eviv1trKMcn5XVX
	PUD37xkBUGY95lNcq71rkyZ5KwqBDt39V8zL5AqLCvNa1KgayFJZ4EPy1xcV3r2uufDxxdm/CFq
	QGRb9lBHA0iQ9w/WaCK8unbtyPEoZ9pCDKb9z58BLtJ1OhXT6rvNUECC4FxtEPVVncQoS96SRJ7
	oBvJd2dj4uUJ5wrWJ5s97STd/sWeOdZfRtGmma2ERjluC3DXEGBt4VL9zw/5Y3xjEUkKCpi7S48
	rLgyLAI06aUYyQgm3FVsZSMCvtLf5ehf5nD77pdWNcZTrLzPbx/qK5GDp1LTYUKEJzdaaeVaKgm
	4cJBSK0mLj7+gqocdXnEuund+ahacTaR7yNDvaPol1HMImKDtng==
X-Received: by 2002:a05:6808:5146:b0:485:4f07:eefc with SMTP id
 5614622812f47-4872de6bf08mr6368667b6e.15.1781437307489; Sun, 14 Jun 2026
 04:41:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
 <20260601-deprecate_boot_delay-v1-1-c34c187142a6@thegoodpenguin.co.uk> <aibCBGjVk4yqtYyT@pathway.suse.cz>
In-Reply-To: <aibCBGjVk4yqtYyT@pathway.suse.cz>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Sun, 14 Jun 2026 12:41:36 +0100
X-Gm-Features: AVVi8CeTwM4IEIAOmwN1jpA0UXhc3pxjWDCeUhdF0IP9jBqM1u8l5Way85027k8
Message-ID: <CALqELGy7nET5bRhq-0tf2pWgK7h_f0uyrsj9BAwGMH-tmf8AAg@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] printk: remove BOOT_PRINTK_DELAY config option
To: Petr Mladek <pmladek@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
	linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 8 Jun 2026 at 14:22, Petr Mladek <pmladek@suse.com> wrote:
>
> On Mon 2026-06-01 00:17:37, Andrew Murray wrote:
> > The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay sysctl
> > are two distinct mechanisms for providing similar functionality which add a
> > delay prior to each printed printk message.
> >
> > In preparation of combining them into a single configurable feature, let's
> > first remove the kconfig option BOOT_PRINTK_DELAY.
> >
> > Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
>
> The option allowed to reduce a bit the vmlinux size when people were
> not interested into the functionality. I am not sure if it is worth
> it though. I am personally fine with this change.

I hadn't considered that need.

I'm happy to add this back in, but it would only make sense if this
option covered both boot_delay and printk_delay. That would change the
meaning of this existing Kconfig option, and would also allow the
removal of the printk_delay sysctl, I'm not sure if userspace assumes
this will always be there (probably not).

I'll leave this as is, unless there are objections.

Thanks,

Andrew Murray

>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
>
> Best Regards,
> Petr
