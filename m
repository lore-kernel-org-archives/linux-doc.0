Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A68368D78
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 15:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783610881; cv=pass; b=eduPgpvbtKg1rnFOf6HwF77DsCa0E4e/0yJzPSTV5mN4lsKpfI68Bko1oLoTS+moN/SloPrHt+tCSKdYww2kQMTu3M9Tzl+xV+bCJY80A9MeZ8vbjhoi32GyNYS50+XL3X8I2tnWUS8elIqyFKAmpWVr539yL9nwsPq9wubrqCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783610881; c=relaxed/simple;
	bh=21RPxRc4cmI9WN0jYw1wxAhXRKd+dQO6mAAvwxMOeQ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I5YNgOrLuW6hJmWDLdzl25+rxa7rDrYsJWvuWLXAMWD2QNgVWAvFiuk3jTTSey2kwzK2a3tNsn0AQtVVA/LEmdGYaygmFK8kT5bUSaScud1K6lHOCYqBBKJN3qh5unAZNUpXLKc1fU7EtdZuwF4OXw00wNxLFqkqXUfS2h+JMXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=CD/BLg/u; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="CD/BLg/u"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-43b7e186a0cso854231fac.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 08:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783610879; cv=none;
        d=google.com; s=arc-20260327;
        b=M+i/ffr9uWXR+DBfTHeWl9WHsRVBmPtplJo0boyiZs6LCrWvbAeNqDzJasO/1v9e24
         SDldlsmedK/uiKrvj0kuEWssPTrU7GOboSfeeEpsEoIgZXcg8vU7tShKe6NwacKer0Xy
         +4uMSbEKLrYW1dwhS1YyqDrH1THCBVptLM1AHOu3oDz36IwpDmmyp1kgrTvh8jbE/Kht
         BhCmveh8OMeUwSzEl8/I3tF2GAkX78E83s9RSww4CnE47tIzFtZ9RHVxNJxS7WRqcKY7
         AIPyaECmpHZldVUxWEjrOv3lGYedmzJfp1iuVj4ymPs0hMyVVnZXjt8kFfs4QHHeknbz
         aQcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3ETsmdmb+3cHXN08EH+iCV/ETN1CcrQj41jPmLj5YZI=;
        fh=KkmwYUz4t65t2J8XsnfDXcK0d3yORAbksEptIJHSpuY=;
        b=Fx1cAl/scgBZt68UvpuJll0LEiO7sU9VvrHWRWLrYPO4ftFSUNs3BVT7ISQu5CxE1N
         kew9lOWJOqvEGjMZgFf6EOXyOWMq8TEXxBoaGNspiRAFAbUHD+Iy1SqkmNDXR8LSSlti
         oJlMa9mXCMdEI8qkfTIAg+rGf7bU7f8+s7dfQ0ks8pnijtGJwfDqfafOD0bPh4IRIylL
         0zYERw7HFL/TvVsH2AV2uiMacxs28Ph3IBNHal2SqyaW8yGFXGHLrOuefACXozt5hVk+
         UE8tVm+nejS2gNAm2P7FEhTNSX4zIjJF94FmZQNOj7C6u9CBWib+2kP9RPjFGtHbHKek
         1PIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783610879; x=1784215679; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ETsmdmb+3cHXN08EH+iCV/ETN1CcrQj41jPmLj5YZI=;
        b=CD/BLg/uKd2sHlNwz0XMs0sl9GDGLPjTpPAwXW1pkolywPM2DjFZ9rfxe7EY1Glx09
         ePpPZMksRidv4T6tQVqsC5WMwTOZABHhE3dlrQuvxKMOTQOTopKiHbSV+POLIoQn76C7
         t943G2wQj04kG1dMC0+HLCjLwIvI9ZeVCtlc9phV881F0noguKV2fgyYwDg0UkEskV+t
         gLrTMG8kAeI8f8w6lJ6vOMV7Zf4magV+02P8prlelN1Gy4FPiP7/b3lgl3sys2tKKidF
         9V66W+uyxq8BA1IORQAnLETcnGKHFXJOB7JXv/VWBdUUeaPe8cWzXwqhhVYQpA2HZAjd
         Ap2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783610879; x=1784215679;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3ETsmdmb+3cHXN08EH+iCV/ETN1CcrQj41jPmLj5YZI=;
        b=b/BzaG956FoeP+mOFqmT7+KqveMaFYpUE8DL+XydTOtHyx6+F4aDrLTtnD5L8ao8ce
         ND9zk2XS+t2T8oROJZqpZqp0sJ8u0cQB0KkNHy18xt99oxVq3OzYzJPrrCJM+GEnt114
         zogNlTDfUa8HxHOFe+WAOd/riuy3of6ne5TGXVFX2HG/iFLW2bsDE9+XdaarmyY6kcbK
         id/fcZQ3v+G6tks2ebY7iQVJL+0plYzGVn7ESE6YSNU2GnxdhQcot+EwI6K98cmjnVPk
         g6OZtd3RB2OrdmvEqet1Gk5LQ/hL3Y3Mrpyw+mTUASbcGxXTCUuaRR9QfBJnq5TxR++i
         IM+g==
X-Forwarded-Encrypted: i=1; AFNElJ/++bMVJvSZkKjR9I/axo8qle5Fi8Ipz3lGMbpyUawaV6xibDpymDORzjMs9b0AQyUnyDylRud6NDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTcLyb1eJljssmQTpulf/L3EVjpYQZ4MLkjdcUu6c7e2+lhL1M
	7BTvTHoCL4WxfOj7t4oev0gYnQYQDujSXbenAdbX3p8jRJzEoyYe3GBAClP07n0m3DLki90ij12
	9ztcITber3z+s+LSPYVFZA5L2iFkh/B5OT0mg/dybSZawqU6D6Wyr+Etv1w==
X-Gm-Gg: AfdE7cm9fw6r1200vzmcshrbUGqOG1+Y01KpInrocLclpFlkAriK3edR6QJ4ALbH/V6
	S93lJVwlyURXleVFSvrMR8qYmUVTddQsO9DYDj3VxXvrUq+qOCOoUR56D6v3Ba0TehwLARUJowA
	tJLBqAgnGG9FBA3wm2SUQkD4vgzrOjpgzj09JjEq0678Ff4s9hz+RjjCDeGUgy94vBoN153hkxu
	DMMVBxdgFFgTGE8b11HqrAdxmGVh8Dc7nxyQCeHjSs7KrBvi9NXgD8XVSQOo7wchE2U+5QVd5Pb
	FgoZG0RMTW33JsKWraf/hWEjdLdzwS59rKqiBgHeVlllJCTRSAlOi9yQHiVYrnaYed9SeOChQH8
	2Q5HrEG5W72mgAmNIzhdKMETrQHuX
X-Received: by 2002:a05:6820:4dc6:b0:6a3:c14:c985 with SMTP id
 006d021491bc7-6a36da6566dmr5303668eaf.72.1783610879362; Thu, 09 Jul 2026
 08:27:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <87zf08w7qo.fsf@jogness.linutronix.de> <ak0b2S9jjYy49a8V@pathway.suse.cz>
 <87echdvkd5.fsf@jogness.linutronix.de> <ak5X718OcOi8OeT4@pathway.suse.cz>
In-Reply-To: <ak5X718OcOi8OeT4@pathway.suse.cz>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Thu, 9 Jul 2026 16:27:47 +0100
X-Gm-Features: AUfX_mzqUqAOJpVXS1zSrcgE0KUX94znIqSV83ZukwijZLhjWKW1vacbJxvZC-s
Message-ID: <CALqELGwMa8N8VRQeDWK=vWX+YGpa66HNMSA1VmvSvu1-adbh3A@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jul 2026 at 15:00, Petr Mladek <pmladek@suse.com> wrote:
>
> On Wed 2026-07-08 12:42:22, John Ogness wrote:
> > On 2026-07-07, Petr Mladek <pmladek@suse.com> wrote:
> > >> This is too deep (also pointed out by Sashiko) because it multiplies the
> > >> delay times the number of consoles. For the legacy printing, it would be
> > >> more appropriate to put the delay inside console_flush_all() and
> > >> legacy_kthread_func().
> > >
> > > True. The question is if the proper solution is worth the complexity.
> > > We would need to pass the information down two level of the API.
> > > It would require adding a new (output) parameter to console_flush_one_record(),
> > > nbcon_legacy_emit_next_record(), and console_emit_next_record().
> > >
> > > It is not that complicated but these functions are already hairy
> > > enough so we should be careful.

Indeed - It would have been nice to put the delay in
console_flush_one_record, but nbcon_legacy_emit_next_record and
console_emit_next_record don't provide an easy way of knowing if the
record was actually printed.


> >
> > Fair enough. But then it should be consistent and
> > console_emit_next_record() should perform the delay before allowing the
> > handover. Something like this:
>
> Great catch!

I'll update the series to reflect this.


>
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index 2fe9a963c823a..62fd6a5ebef66 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -3161,6 +3161,8 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
> >                */
> >
> >               con->write(con, outbuf, pmsg.outbuf_len);
> > +             printk_delay(false);
> > +
> >               con->seq = pmsg.seq + 1;
> >       } else {
> >               /*
> > @@ -3182,6 +3184,7 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
> >               printk_legacy_allow_spinlock_enter();
> >               con->write(con, outbuf, pmsg.outbuf_len);
> >               printk_legacy_allow_spinlock_exit();
> > +             printk_delay(true);
>
> It is pity that this is inside printk_safe context with IRQs
> disabled. A solution might be to call it before the write.

I tried to be consistent about always performing the delay before or
after the emit. As part of this series I moved the delay so it now
occurs after the emit. This made it easier to know if the message was
actually emitted (rather than delaying, and then a handover occurring
before actually emitting).


>
> But maybe, this is good enough. This code path is called from
> vprintk_emit() and it might be in an atomic context anyway.
> Also it increases the chance of successful handover which
> might help as well.
>
> Anyway, it would be nice to mention these pitfalls into commit message.

Sure.

Thanks for the feedback Petr, John, Benedikt!

Andrew Murray

>
> >
> >               start_critical_timings();
> >
> >
> > John
