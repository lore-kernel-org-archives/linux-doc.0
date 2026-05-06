Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFF4366831
	for <linux-doc@vger.kernel.org>; Wed,  6 May 2026 22:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778107036; cv=pass; b=J8DWuDq07KoUlMUeXsEg50zxBhTTNMb5M8n+w6aPkpAblj42N68HYy96DOdq84Lhsliap7JJyaYdt/BES89/vTCfuqeMHoj+tOvxoX3Ia10CY8Dcrbs2k6MmSr+41GUDjsoqGp6WokwthMuZjXtvLuTGpPr0b/X4VlACrxuh8RA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778107036; c=relaxed/simple;
	bh=H2wod2e50JqMFLrm5v7kdKyN3x98IfEqxeoiWm4eVfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LW+0eGY2pXO2ynV9oIWUkk1g6aQoXVHUryIgL50s5w3epKVb7KL1aP1b9zMkIppXPvveEWrUmrZWnTdT6nvmx9RVt6Yece58Iz+ovBSIsbszZX2W0ZGiOs8NBifkElJtVjlfOxC5Y82YbpfX7RmlULG1sv0uRQFhmxaeNW6v/Bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=ob9n1MI/; arc=pass smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="ob9n1MI/"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-47cba53479aso110028b6e.0
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2026 15:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778107034; cv=none;
        d=google.com; s=arc-20240605;
        b=J9UDINMcxAbXj/QtUVtiIk6bwToLlCwFU6y3+NomJebd0T2QAA3hNafQhzKbtdkEfE
         /bO9LAj1lT5AeZQI8y41qO9yqg3iKQwGrzCnNhyBl5jauMbGIXEZ2biBvyeCkcATARmD
         TjDwve4Nrq0H/D8yf4Mbftpb80kDATxNEuABIMDYHG2B1aeT0L85UyCoNAoLifi66U5O
         4KqStiivOlD0Q5gA7RpD3idcJAqWNT5G5KK15rR5upGrpA9qsLumQk8t3OgdYctaY+ef
         qIyJCjoEY/tLwEtk5dGxF0WtS+pEstGYjOYRzt38mj/CUBwm1zm0KXAJ3LchxoDzupNL
         HIHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=O2M9x4aX4d7Rz8hjq9oGfdKv/HBHH7LxpobCw3rVI4o=;
        fh=qyNNed5BaANo4AYcXZoMOfa97SLpadyG23jurKBEwvU=;
        b=SSKI7gNEwkLuxXuCfCuroulN/CFJKK9u60ZOMce2d7ZVxZgCCap/12SkskWA3xkzAt
         Mk8iymSlgvFDsv9N1lQCeSHoj2QruymiK9qCmpvc36XgRDn3re7lKOXAKT2HdrWfDUAz
         c2jEh9mbKm04bD96dIsm9NjbzCt7SVxcd+yOesVYNuApy4v0pkV9pAPLFGrOmO2vba9h
         CYLUWiJd1sTY2MBLGRGl6PAkG7RV/QdBT96LswEZS468ssFI4V4+5WU81H3UDBQli5Ep
         q1Ce6FFcidtJcWTHRgpX4pfM/gGbPieyqTw+HmH0tKchcBW2i4ciEChukBmDKoSSM2hx
         2KJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1778107034; x=1778711834; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O2M9x4aX4d7Rz8hjq9oGfdKv/HBHH7LxpobCw3rVI4o=;
        b=ob9n1MI/LbxyVxNdzzBuvXtZ758E09c4+kpYFdban7Lm0rNZLxwXVNmATmYsjaAjvd
         /2TDTTkRDqz+zakD5m4Cwl6Vm4BZBSJOKeSvcRtQmgRlJac0lgqAbgesllChIBVEQ91v
         +7kIrevGWcWwu/5MfMJ4VZaLsHvawtDkVRJ2doBeU8HqMSBrO9WBviBuzG0k3fA0RFtm
         zLIKvLrOvqDrGi23jH3OpGP3mPv18EskKmZxxMsep3reVjjoHuvdTbi5T+7PoU9vX3DA
         nLjh1yM/tfwzPXiXq3bm4CdX/ebzoAALBAVh88j1gvY1t/U7CkNtQjqqNyWJW4XNjvXP
         RAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778107034; x=1778711834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O2M9x4aX4d7Rz8hjq9oGfdKv/HBHH7LxpobCw3rVI4o=;
        b=Bf9IufBOAThgKn2E7NZZfKrIu8xRjjYXxQO6Pg7DmIO2k4HHG1eczLvi/yI0nF2uDo
         fk+Dc3QAsVEzbvhU+Ms3ym4bH1puvGbFQeLu9m0kf/H/r2b5y8KX5JL5/0kMslYwUByG
         5nX8Kyt/40EMjYCfuYf/pqSrSxp2/KKzd4DeokYsBamqwaIHGC1RTl2gjBe2dZomSYX8
         rZ5Vt13irLPevQBvbwV5dvx/cvCTWVm3fvLijTKKr00c7tOKYR2nuJIiXdpPNCO0++Mk
         J/wpG5Mkj7m8Qw0avpjgSFkCMDSUEYoVp5I63Uq7SNTOd7JSTZ7PUHmFS8Ou+Gx0BTpD
         RUvQ==
X-Forwarded-Encrypted: i=1; AFNElJ8G2sf/+E6fck0Dh5etvYFoDkhROqkbL6mImM7lH35HCADLEwUW6R7QzmdZbr6wQCWEwFNPEvARxUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwQM8QY+E55F4R5jvNMFDiCDNSVwaDGyL+cWsYgyNHngg9+RrG
	dtmNg+/ia6NG9vB4aUc3NnivIrtN8K8fnsUeLPDzJfxMxbT0eEcsZRSipuGxjKNfv+oFl4lXL3T
	QwQl6fyzdVXojROWNfMz0OsdzJLNmCbRvqmefRg0njA==
X-Gm-Gg: AeBDieuC/fvotlaQT+USfkl/qh+3zJ938Umj8PQoxOEOGgA9DNNqwTP7lsWsmlg0Rl1
	vaiLhll9PBYj3chcZBNkihploAtlwIkRkDc4teqh9TyJKgk3ctxsDvyVNxuejnj/jAFztaF82O2
	xEKpkm4VguDrJ2xvrZ7CP5Ncc1xz5XzCwVlndKDnGynmoKGb7nNl+rREADn6RV7JdVIIpKE7vAM
	NPCeaMOHPHj1+ekRzAXD78Q4X4H38IygkbGJEFQtW0tHbhkwnt/UwttOzJM+CNnJB3WA84OpDTV
	ICE/4tvPLDdoesieLUCpvUddzI2hiKH7clcE9aq/RivDQ/QQ+73aN5ebyHPb9AW5KUiTO9aKKzv
	ycCWyEHV30EHT8pYRP4ylCoeIdYemkmzLgunIGvFmOjCxGLxqDg==
X-Received: by 2002:a05:6820:4c08:b0:68a:e01a:9b99 with SMTP id
 006d021491bc7-69998d4fdfdmr2825460eaf.50.1778107033777; Wed, 06 May 2026
 15:37:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505-printk_delay-v1-1-5dba51d7f17c@thegoodpenguin.co.uk> <afn-H1EQJxnDs0BZ@pathway.suse.cz>
In-Reply-To: <afn-H1EQJxnDs0BZ@pathway.suse.cz>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Wed, 6 May 2026 23:37:01 +0100
X-Gm-Features: AVHnY4Ja58VfipZT-8soAZYnzo0HXiglj_UpI9Yp8PzxiCF3zB-23LSxITGGZYE
Message-ID: <CALqELGxhXO=kzh9bpztd9=Ug9ykPL2NALo9Apq3=Oj6aeiEcKg@mail.gmail.com>
Subject: Re: [PATCH RFC] printk: remove BOOT_PRINTK_DELAY
To: Petr Mladek <pmladek@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Randy Dunlap <rdunlap@infradead.org>, 
	Clark Williams <clrkwllms@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 15:26, Petr Mladek <pmladek@suse.com> wrote:
>
> On Tue 2026-05-05 14:45:00, Andrew Murray wrote:
> > The CONFIG_BOOT_PRINTK_DELAY option enables support for the boot_delay
> > kernel parameter, this allows for a configurable delay to be added before
> > each and every printk is emitted. This is DEBUG_KERNEL option that is
> > helpful for debugging as kernel output can be slowed down during boot
> > allowing messages to be seen before scrolling off the screen, or to
> > correlate timing between some physical event and console output.
> >
> > However, since the introduction of nbcon and the legacy printer thread for
> > PREEMPT_RT kernels, printk records are now emited to the console
> > asynchronously to the caller of printk and its boot_delay. The delay added
> > by boot_delay continues to slow down the calling process, but may not have
> > any impact to the rate in which records are emited to the console. For
> > example, if delay_use is set to 100ms, and the printer thread has a
> > backlog of more than 100ms, perhaps due to a slow serial console, then the
> > records will appear to be printed without any delay between them.
> >
> > It would be unhelpful to add a delay to the printer thread, and it would
> > not be possible to disallow selection of CONFIG_BOOT_PRINTK_DELAY at build
> > time as it's not possible to detect which consoles are nbcon enabled at
> > build time. Therefore, let's remove this feature.
>
> Heh, Randy proposed to remove "boot_delay" few days ago.
> This RFC goes even further and remove both "boot_delay" and
> "printk_delay".

Apologies, I didn't see this. I'll co-ordinate with Randy.


>
> Honestly, I do not feel comfortable by this. The delay seems to
> be handy when there is only graphical console. I would suggest
> to do:
>
>    1. Obsolete "boot_delay" with "printk_delay" as
>       proposed in Randy's thread, see
>       https://lore.kernel.org/all/afn2sYKKsqG4QBVX@pathway.suse.cz/

Your suggestion was:

" 1. Add "printk_delay" early_param() which would allow
     to set "printk_delay_msec" via command line."

And I assume the intent is to replicate the functionality of
boot_delay, by allowing printk_delay to be used to introduce delays
from early_param time? Thus deprecating delay_use.


"  2. Modify boot_delay_setup() to set "printk_delay_msec" as well.
     In addition, it might print a message that it has been
     obsoleted by "printk_delay" and will be removed."

Given the intent may be to deprecate boot_delay, I'm not sure that
setting printk_delay_msec as well would be beneficial, as this would
extend its functionality to add delays beyond SYSTEM_RUNNING which is
where boot_delay stops. Unless you mean to use boot_delay as an alias
to an early_param hook for printk_delay?

It seems that there are also differences in behavior between
printk_delay and boot_use, with printk_delay unconditionally adding
delays to all printks, and delay_use which considers the loglevel.

With this approach, existing delay_use users will have the
inconvenience of having printk delays post SYSTEM_RUNNING. However, as
this is a DEBUG_KERNEL feature, maybe we don't need to preserve
behavior. Additionally, with the proposed changes for moving the
delays from printk time to console_flush_one_record time, the impact
for an uninformed user isn't as drastic.


>
>    2. Move printk_delay() from vprintk_emit() to
>       console_emit_next_record() and nbcon_emit_next_record().
>
>       For nbcon console, even better would be to use a sleeping
>       wait in nbcon_kthread_func(). But it would need some
>       changes to call it only when a record was really emitted.
>       Also we would need to use the busy wait in
>       __nbcon_atomic_flush_pending_con().

This makes sense.

If the use case (in a post kthread printk thread world), is only
relevant for graphical consoles, then I do wonder if printk_delay and
boot_delay can be replaced with a more specific solution? Now that we
have printk threads, the time in which a printk is presented to the
user may not relate to when it was created, and I fear people may
continue to debug issues that rely on that assumption.

I think the most pragmatic solution for now is:
- Move the printk delay to the point where the printk is actually
printed (e.g. console_flush_one_record and descendants)
- Add an early_param to allow for printk_delay_msec to be set
- Deprecate boot_delay, by using it as an alias for setting
printk_delay_msec, and include a user mesage that it is being
deprecated and that it now extends to beyond boot (which could impact
performance on non PREEMPT_RT and non nbcon systems)
- Update printk_delay function to use the appropiate mechanism to
delay based on stage of boot and using printk_delay_msec instead of
boot_delay.

If that makes sense I can fashion a patchset.

>
> IMHO, the only drawback might be that the delay might be multiplied
> when more consoles are registered. But I would ignore it. People
> would use this option only when the graphical console is the only
> one. It does not make sense for serial or network consoles.
>
> Best Regards,
> Petr

Thanks,

Andrew Murray
