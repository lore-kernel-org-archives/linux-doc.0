Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EC047D940
	for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781708446; cv=none; b=CpTO7zIy7DijeWfMRWJ0RrLg5HEEdQtwrhL/ajlF8LMJai1IGuyQU/hGfjhLwixvalZmOl1gxZx7tInOsPpe9UdvTsbV/cbQVD6Xc7uc+bNrSlzv+7hZftoC9m+lWoH0Qc1fJvKiInA0FelvfCKurvq5jncdP25LbGvAm5GX8M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781708446; c=relaxed/simple;
	bh=McQ+qO1hYfBNZThW7q+uEink7ZkGXzP0Q+QVRx1/9J0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SF8AnZPiaOd+vzFijl7WBfXfbspT4pw9BJwCjrO45kdoGlHAYGDnXR7fABKw6/ewbh3dX2YKdaC29SonpBB7hIJMLDaglaA0njXrQuj5CwaV5IqKf3WWddg133xxwNvJc4UoITQYDc7MQj6JTAxlpMl3Q132ugdm8cjud5xt/iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=B/IP9OET; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="B/IP9OET"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490c0c92cffso39370265e9.2
        for <linux-doc@vger.kernel.org>; Wed, 17 Jun 2026 08:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781708439; x=1782313239; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T1rkmuWuJXVzNvn1+c174indnosmtT4pQFumhbjNtd8=;
        b=B/IP9OETfkI7LozReZqCgO4CJFaNxOE7u21CvLSuVMfIpSvhNMCeNswDVvfFsEtOeq
         F3xH7qWGddYuIzPPPKJe4q9DWvZPBugH45DGMW9B3s7khHpkFQZNpNjwO2Setd3tfkdJ
         APyuVEQP29gJP3sd8b8NW1RbuUKADZEyoLOG6tOOJcCN50uNfn1zbEi5EqfqFusKi2H4
         gPcwphC8qGiAzTzaqUkDEgkvGTh/9ZoKT3J6NgwqFknFh7/cOCJId5arEX7t/vhh0dpF
         nEy4NRVrzj+baKCGDieoreFVeKO8ASdxpYoRKI6GSR8hfk8y+tKw0n20Ys0DnRfYi5w5
         kADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781708439; x=1782313239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T1rkmuWuJXVzNvn1+c174indnosmtT4pQFumhbjNtd8=;
        b=nuC1aVekrjWCDzFAwgxZpBiPnnFLsJhjng1vSP0xlKlHq9anGnEryeYhpeFG/7SEjm
         jPEHuLgAgzbNNJ/abCI4nCJCqAyDgniYD/97AVTQFu4HBMCkZTG6AvryPhK3gbjiGhUk
         e33MsXjy83pbNHWJmzTK7NYFH8p57kOn//ocIWJr35iPdJ/0/xj2A9KlDEABMYgBkjQu
         fvYLEcwyIBpWIkRyG+/o3/ZErs2GNpMDSLkDzKFgz5U7g1Rg1fPERdppBdGAHIu3lW2o
         KGlw72CrTTjjXf5oAb1SrVpLphusegsW+4ZOPUbM6wp3uGgp9OFTUDPX0fFKqL2EeotH
         hq4Q==
X-Forwarded-Encrypted: i=1; AFNElJ80tW2kG455uCdA3UQA7AoyRPJyIhc1bMB9Z7SHMK1WV+Cc//DGD8cWJuu5INwGcoS0IpdAnK1z/Nw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrokgqWpgJ8pUJ9Lg7aMdxu7q0gSWdznaD4jMHjk+TO1i5ocU9
	VQTWKUErd3sSu/klgyILsPWBd675KAh/ExpN4t4NuYTK8iNKQr81TLQxvxWsgzrswKa3Ij4qheC
	2Tf8f
X-Gm-Gg: Acq92OGtA6kIsPB8pVfT64P9LUwzfe80p7I+kW0qDBllVOLe5iikzJYyMsTylLrUoaZ
	gpG4Ulmun1odQV56PLYQf99/immfeEtJMYpb0GxtiYWgM8Tn6K0blwS5sPH+aQUZZD7bSnSd32z
	HyRx/PQpdFBpURD3hbRMLxI4BEAR+5fGfQa27H5bZFTDFkj5xHTGwnYMu/stYYip7lqq9zoD0Tg
	k6vlt8trk6N0fufqT6N+B8ZlA9eLTdhUE5h/kalhdHNiQNB8z92BMKqt/0JMOBg9Gs24UPbwdpt
	REeq3WAiDaS7jkpVyjBb0Afcr3pq3MbVTHJHUq8jHEW9LusMOfPCKeaIUabeplFrYEw0u3vWBX8
	hO0toM58Y8dWnxEYckO1UqHfupLOnu3c5zL30JcqfehR70ud+1aoj+YfL9aFv9CycofialvUOdA
	7GcC6OLEwK+Y4ShzgQAU20Uie1ug==
X-Received: by 2002:a05:600c:19cf:b0:490:b8ee:d6a5 with SMTP id 5b1f17b1804b1-492333e8d65mr67062435e9.6.1781708437706;
        Wed, 17 Jun 2026 08:00:37 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619fb12edbsm17636664f8f.17.2026.06.17.08.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:00:37 -0700 (PDT)
Date: Wed, 17 Jun 2026 17:00:34 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH RFC 2/4] printk: deprecate boot_delay in favour of
 printk_delay
Message-ID: <ajK2kpLbvpiKkKBI@pathway.suse.cz>
References: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
 <20260601-deprecate_boot_delay-v1-2-c34c187142a6@thegoodpenguin.co.uk>
 <aibMr16r55xE26rU@pathway.suse.cz>
 <CALqELGzTH8cTLVgX9CXuf_LFLgC97_yfqYJVHzU9ghPuev7SNA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALqELGzTH8cTLVgX9CXuf_LFLgC97_yfqYJVHzU9ghPuev7SNA@mail.gmail.com>

On Sun 2026-06-14 12:45:44, Andrew Murray wrote:
> On Mon, 8 Jun 2026 at 15:07, Petr Mladek <pmladek@suse.com> wrote:
> >
> > On Mon 2026-06-01 00:17:38, Andrew Murray wrote:
> > > The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay sysctl
> > > are two distinct mechanisms for providing similar functionality which add a
> > > delay prior to each printed printk message.
> > >
> > > boot_delay provides a kernel parameter for delaying printk output from
> > > kernel start through to boot (SYSTEM_RUNNING), whereas printk_delay is
> > > configurable only via sysctl and thus is only used post boot.
> > >
> > > Let's deprecate the boot_delay feature in favour of printk_delay. In order
> > > to preserve functionality, we'll also extend printk_delay such that it can
> > > additionally configured via a kernel parameter.
> >
> > > --- a/kernel/printk/printk.c
> > > +++ b/kernel/printk/printk.c
> > > @@ -1339,11 +1327,34 @@ static void boot_delay_msec(int level)
> > >       }
> > >  }
> > >  #else
> > > -static inline void boot_delay_msec(int level)
> > > +static inline void __init printk_delay_calculate(void)
> > > +{
> > > +}
> > > +
> > > +static inline void early_boot_delay_msec(void)
> > >  {
> >
> > It would be nice to print a warning that the early boot delay
> > does not work, something like:
> >
> >         pr_warn_once("Early boot delay does not work without CONFIG_GENERIC_CALIBRATE_DELAY enabled.\n");
> >
> > >  }
> > >  #endif
> > >
> > > +static int __init printk_delay_setup(char *str)
> > > +{
> > > +     get_option(&str, &printk_delay_msec);
> > > +     if (printk_delay_msec > 10 * 1000)
> > > +             printk_delay_msec = 0;
> >
> > Sashiko AI warns that this code accepts negative values.
> > It might cause long delays, see
> > https://sashiko.dev/#/patchset/20260601-deprecate_boot_delay-v1-0-c34c187142a6%40thegoodpenguin.co.uk
> >
> > The problem has already been there even before. But it would be nice
> > to fix it.
> 
> Thanks for pointing out Sashiko, I hadn't seen its review on my
> patches. Are authors expected to get emails from it, as I didn't?

Sashiko is able to send mails but it is opt-in.

It might create too much noise because it has false positives, it
keeps reporting minor or nice-to-fix problems which will "never"
get fixed. Also it is not predictable so that you could not reliably
check the patchset before sending.

Anyway, I thought about enabling this for printk-related patches
because Sashiko also gives a lot of useful feedback. And it is easier
to discuss it as reply to a mail. But AFAIK, it can be done only
per-mailing list. And printk does not have any dedicated mailing list.

So, I "always" search for the feedback at https://sashiko.dev/

Best Regards,
Petr
