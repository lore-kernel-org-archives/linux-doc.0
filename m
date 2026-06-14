Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDD52D7DEA
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 11:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781437560; cv=pass; b=NpacGO7DZi3SFxpUEpX5rDsIu54pq3zC6haMSzhdA4W9dRZTKzVXYE++ZG5xvvh8Pw0IKkhMTnyJDCBnMj79U+yEcOFF5GiHgjNrx9g2bESZvjZI88ISNTmLgCVbbD/nvE4lGEWbeYa4nW3gilB9hrwnYIHJlqdgdNAmQO03fuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781437560; c=relaxed/simple;
	bh=R9cofiZnoOpIZjJmK6cRQ2P5rRFBhwuYTT6667zmO/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wc8Fjei0cs5P3g5rEoAyOs4MfMV3x/hj/zSNy2vdEr3MLU5uwJf1rnc31J9a4SkT0WDGnA93KdZlRKKFDCzz4mB9Xn5NFCIp1OuokLfo/cAM3Ubwag2N4oBeUWooCUtstjUJJIAfpSNOKehwoWVxBBnmQ2NLDlS2olt+2+giXZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=VIkpJahh; arc=pass smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="VIkpJahh"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-48662d16d08so941465b6e.2
        for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 04:45:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781437558; cv=none;
        d=google.com; s=arc-20240605;
        b=L/l0a4YbZIrkZIieFvJGMi+lLasR6QRuCsNys8P6Sll5YQH7y6C+Wr+Qnp9ktS+J2F
         aEqdR6P5YQlbCVDzrU01amaBQR+QcosUz/VaYWgR9KAzqkD0WQuP587Ho7/NoTAK7+y6
         btg2x2ZkztR+RJ19ah5Tb7CffnzH7VW9JIW42n/SMGq7M1q80PSL3YEMoYhhsUv4WRd+
         ybnX3YK2cHLNAUlF3f8Id0W/3njP7QsfJneilOWuyuz0cazt7DsJIS2akQ3I+k0YwdJW
         cGRSB8fwkIL8UNRB1EghHSrJbNzEOPXvCW1Nru6C0mvSrrRvdvP//DA1z4qxCUxd2c5Z
         HHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UYxOnpq9yBeiaN2mTbvYlWTQWFXGZfN7UV/tTv9hfZQ=;
        fh=Z1jYHe+IWPH8TqU16/2lgZuqonQGfPQpV768L/uycrE=;
        b=RfIezmTsQB0/gx54bJb9gfvfkbiyxskA33CcDENYFJAf558OcpsWYoTk9ImNtv4nLD
         PP6iadxrgEMrAws6sD4sjw/Xyvk7wGoSm6hnp/Ds/Yk4hDFk4bdKUCGL5SzK/VR30hBl
         fZPi18GO36/YwJK8GEvNRlgwpEV5ZqVet1R3lhYXXqenr1MwWDs5fSpZaUdmA7ouw9GM
         efk2J80JpAC1/h5XVf1rQ49Q2YhnhUVyeFvImMI3n9mtmVj1nrbkrjOdGZSfVO6VGZfj
         W6ma4k23DHQVcLsjES8/rdmCp4yK3QZmx/FMCSgw8wV9Ej3GuQ4FNPYhJbTw/6dxEZKn
         6ZUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1781437558; x=1782042358; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UYxOnpq9yBeiaN2mTbvYlWTQWFXGZfN7UV/tTv9hfZQ=;
        b=VIkpJahhczlLp8Yu8q1crcQP5NMFS+w3X1HvG0INTDgJdjCQVGBBBRw0omuBJdo0o5
         bAGAEco5PRjofIgCgSSYXHetkOJiuQ7EGj1ryN5ZmhB+ITHgPq0i4NxgX9zUiW8KAOsW
         oIr44+OTeme/rmqjztwTfpRLAXTwhcBEfkH0GGCo9yuQMFG2q3VacqJ5TlojmCkYWul0
         efynM8yVK8ty4h1zXASNOtyIQsvoummoP5CLLB4YaYQrv1Pa2Y7Jyms9s8AbwwEKNTXe
         nzL0CHtBcGBoE2dI0504r7S4ONgp3DcDfvbJwVp1+4Z+gRA4ojbG+iwX1Iag0z5rpa2X
         E/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781437558; x=1782042358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYxOnpq9yBeiaN2mTbvYlWTQWFXGZfN7UV/tTv9hfZQ=;
        b=qc6IYIvopDte01SAtn02HZEVZMAQoQbJb/UbXqumn0XFBUhv/a1P+V0N2NRabjO98+
         F0Sy60g0qfqo6npYdJ9pQTIF5xvJujT/NHk+ZGnSwI+lqY3/xEY2VeGIEenRDQGUMFf2
         dytN0nuPuuGxAvRV8AE2mfsEaHisRdP+kVZLfzq5+YbwxjZsSN34kGHf27mbgdFqmZ5g
         STkhTF9r3jl0rYfwCT5proz5K33yVx9Cj/IqmJwrEt46oz++si0hVYRjv6BTHwo4h8/h
         SBWIbWvsiNrYDfFMM7YWZDvmxGE2YQMFCv8UB1x2VQsauyTJsl/VK/9EpzVSIgGSTVO+
         rmnQ==
X-Forwarded-Encrypted: i=1; AFNElJ8fnjhotEywTovqLo884Xy9Xg2xG9rXPka8f0V5IlA5AS5ha/MeJoh8fAIEfF1+Jh3KykHOqZTqeOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCooiEYWIgSC4qAb3bhcDYFAFh72IP2tbKb/2BmoFGmV9YiZos
	rl9nL8HuXw86EeRDdmIkVK6m6bKHD+2T43lAVJEzyzx1+NjGucM/ks5Z+7a9TM9pslFTguV4D3q
	tL0GWBfqOAi+hDKfH3NPnX/IJFvIK8eglQclM5ZDPVA==
X-Gm-Gg: Acq92OEgxWqHnXZ0BtF71OIg4jv0P+0Imp7WmOGdeoO7c+8eWCOcd14yCS/Pb3+622/
	N0UxYdZF1X9RqHSfz+wQjbaBaBgfGFG2amRmaepr4+oZJBJ+xU8Gtm0oVNGKS2XiEqBdaFwk9Or
	OOtgrcjVdmLeMdCiREr5NFlj9qB2HLZg7v46I8OfC/d24jZ05KPmI/BRpajEk5xfyp5Kf0HAc+W
	wMl+nz7xIvp0+kqvPUIU2zqNb6rYG3dV881fMY+JvH3l2ie8faJxBwuYuojlOnfsmPus4+tZ3Bo
	buCifxOdCYEN+qt9A4CJdmpzbyMh/pHp3X45f6PmP8pcxYq9iks/pmdRieYWCIWM2usgjB0qJza
	H4Fin8Mj8IvXQdeO6d1p78h0XtqpQ2dbbeHFLKpI=
X-Received: by 2002:a05:6808:4f21:b0:486:5275:8144 with SMTP id
 5614622812f47-4874194d5damr4572042b6e.2.1781437558100; Sun, 14 Jun 2026
 04:45:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
 <20260601-deprecate_boot_delay-v1-2-c34c187142a6@thegoodpenguin.co.uk> <aibMr16r55xE26rU@pathway.suse.cz>
In-Reply-To: <aibMr16r55xE26rU@pathway.suse.cz>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Sun, 14 Jun 2026 12:45:44 +0100
X-Gm-Features: AVVi8Cfqmzx5ANOaLYg4zATzHJIZn1Vg14oXTdjpHhDh_VtEe2JUNu4nQf-biNo
Message-ID: <CALqELGzTH8cTLVgX9CXuf_LFLgC97_yfqYJVHzU9ghPuev7SNA@mail.gmail.com>
Subject: Re: [PATCH RFC 2/4] printk: deprecate boot_delay in favour of printk_delay
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

On Mon, 8 Jun 2026 at 15:07, Petr Mladek <pmladek@suse.com> wrote:
>
> On Mon 2026-06-01 00:17:38, Andrew Murray wrote:
> > The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay sysctl
> > are two distinct mechanisms for providing similar functionality which add a
> > delay prior to each printed printk message.
> >
> > boot_delay provides a kernel parameter for delaying printk output from
> > kernel start through to boot (SYSTEM_RUNNING), whereas printk_delay is
> > configurable only via sysctl and thus is only used post boot.
> >
> > Let's deprecate the boot_delay feature in favour of printk_delay. In order
> > to preserve functionality, we'll also extend printk_delay such that it can
> > additionally configured via a kernel parameter.
>
> I would make it clear and say: "via an early kernel parameter".
>
> Note that there are also kernel parameters which can be modified at runtime
> via /sys/module/kernel/paramters/<parameter>

OK thanks, I will update.


>
> Also I would make it clear that this changes the behavior, for
> example:
>
> <proposal>
> Behavior change:
>
> The delay enabled by both "boot_delay" and "printk_delay" continues
> working even in SYSTEM_RUNNING state. It must be explicitly stopped
> by setting printk_delay=0 via sysctl.
>
> The delay is skipped when the message is suppressed in all system
> states. It used to skipped only for the boot_delay.
> </proposal>

Yes, I'm happy to make that clearer.


>
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -1339,11 +1327,34 @@ static void boot_delay_msec(int level)
> >       }
> >  }
> >  #else
> > -static inline void boot_delay_msec(int level)
> > +static inline void __init printk_delay_calculate(void)
> > +{
> > +}
> > +
> > +static inline void early_boot_delay_msec(void)
> >  {
>
> It would be nice to print a warning that the early boot delay
> does not work, something like:
>
>         pr_warn_once("Early boot delay does not work without CONFIG_GENERIC_CALIBRATE_DELAY enabled.\n");
>
> >  }
> >  #endif
> >
> > +static int __init printk_delay_setup(char *str)
> > +{
> > +     get_option(&str, &printk_delay_msec);
> > +     if (printk_delay_msec > 10 * 1000)
> > +             printk_delay_msec = 0;
>
> Sashiko AI warns that this code accepts negative values.
> It might cause long delays, see
> https://sashiko.dev/#/patchset/20260601-deprecate_boot_delay-v1-0-c34c187142a6%40thegoodpenguin.co.uk
>
> The problem has already been there even before. But it would be nice
> to fix it.

Thanks for pointing out Sashiko, I hadn't seen its review on my
patches. Are authors expected to get emails from it, as I didn't?

In any case, it's a good spot, so I'll address.


>
> > +
> > +     printk_delay_calculate();
> > +
> > +     return 0;
> > +}
> > +early_param("printk_delay", printk_delay_setup);
> > +
> > +static int __init boot_delay_setup(char *str)
> > +{
> > +     pr_warn("boot_delay will soon be deprecated, please use printk_delay instead");
> > +     return printk_delay_setup(str);
> > +}
> > +early_param("boot_delay", boot_delay_setup);
> > +
> >  static bool printk_time = IS_ENABLED(CONFIG_PRINTK_TIME);
> >  module_param_named(time, printk_time, bool, S_IRUGO | S_IWUSR);
>
> Otherwise, it looks good to me.
>
> Best Regards,
> Petr

Thanks,

Andrew Murray
