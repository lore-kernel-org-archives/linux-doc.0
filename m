Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448BF33121E
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 15:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783609308; cv=pass; b=mxr68P6ps0Ph5StVL1UPLe0lRTt5tS6mHZtLMSw+RuwVLn/st4QhihtddYLjg97QbUWV2AX+ygfWbMh/IE1odSIYzZEKZgM/Tmyo4ZwuvXkfUICAmm6a5X9SutnOUjeRidGh6VRZMFNzgTIE8qHhjipInp2xLmkrRaiGk2oqDVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783609308; c=relaxed/simple;
	bh=4SZMuyVOXCpXxD5R6Zg7kloOZfZmtjVJIRVSodune7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l+iKGCK2woVi9DE0schb+iyNpp/z3NClmyNxKMuhjzIGzMayu1GW09o5GBlwJYMWVxXiXY5xl1Lyaw31ZKrkm9EpK4w+RiYgqNk9xPhkrI0BHn0ZiAJb/8dGPR6xLQf4BB3HmyJUa9jos52pIWYw8GGZUjKiF9hdM1Mm0CIRp0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=DxpiU6L4; arc=pass smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="DxpiU6L4"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6a190528769so5210eaf.0
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 08:01:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783609306; cv=none;
        d=google.com; s=arc-20260327;
        b=UwWNEwTYJkWTt1F/c8nj/FFc0QyIJA7NNiG1BppNQoXMQLCVTofTNcKcxEoW4Bpn0z
         n+ICDFiAd6h5QCl1j5teM9Zc32vvzA2vinQ/vLH0WrmP1cGljUHQ7fAGe9Imq1o9uzGU
         A19xnz0VG+co7NhmIH58zX74KxP4bOdGvrgo40BT5Hzv0SSlzvrGGKhtSCdfKjjvgODS
         k3kJG/uovLelcBaVCy82ApyU8siyfbDpglSvD4uFdB6J0At0iKoxJ7VB0mC1P8YurkgP
         XQTqcTX6THXDNd7+UXRHr71/9687WvqUlKFAjDxMLri41Dp9fYYvTvh7Jw6dy+b6rqbw
         rYhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=54Dj02k3uul5TPtw9U5JIJjN3eOpWu3nQg9JkvEUFro=;
        fh=3hwNWqUbOh69NCPXbwKdyjjefOooaVkOFyTlQfDBXiU=;
        b=ZpWybYWJqbOZHg8lZJa4STMuBN39FIPJl1cQ9h1m0qfPfU3lGfahQOQV2Da59Nsytj
         CeC/28CK6f1H8s88UzS2xtFgIIvgbbaqLSLWZQHLi5Z0I2Yz8A+w5/FIhdjVrb9JgcNc
         RkIM6e3U7+s4kO6/INWaFEUHGByNQX3w/3LSTzVFUvslbiv3QV//wDd8Bu6dPA34ASHm
         vaNLZKmkRJdCYirXsqjHfMo8vbEbq0wiHf5NYHyTPgMNu3B+e4dBW6LZ7Vc33YRDgdsn
         j7DSOT8yJvPQBdsyNEY7KNgidhHrTaBsFuA+cafkZksXh1j0rs5uLRmcTlxhIjdEiaMW
         l0RQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783609306; x=1784214106; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=54Dj02k3uul5TPtw9U5JIJjN3eOpWu3nQg9JkvEUFro=;
        b=DxpiU6L4G9rYJEL8AB6AdF2BIUxuL5IV3mx6XtVCL4bTNHQdbDl+Dri2nhp2LEeRpH
         ahI6ifLzNdjnH5Ni8SU9FCSTOZ6tRBXp7SV2zab2Wg0mizHUCX1Qj+fzpoNF9B+/dMtH
         4KmJmy4HlVTkkOurCafb2dSuKLIpdvW5vCpkrlkpBX3g39V+Mfl5rY4nDpBTzhA3CO3d
         5K5HaZsn7cq0bPtIDQHz+reVc8CFfyi1KZPC0Ut7GIdC321RvND9LL1U2QcF5R2xNNTn
         a3TO6pJfR9U0rF7j01r45WBs1lTuzIzPOUs8bnbiuxEczx4Ii7DOiVrnvPhqHRbJGKbp
         qY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783609306; x=1784214106;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=54Dj02k3uul5TPtw9U5JIJjN3eOpWu3nQg9JkvEUFro=;
        b=o+7JWeuNx5B3DriE3Xhe4uXdrcL5x2NRz3z3422RZCT2bBebhxxVDNrPj2jaxjrvfI
         /U1oHl+p1lskeuIASP60GMCMkVkGm2VOYRGQeA3eMFZXgN5I+ZEcfzT8HTqTvMUVj99u
         TuuGBJUh/f3WmzNLuRhMzlKLxGiEQtnejTo881hSbuci4jbaszV/ePjVJkWamjDBAi6o
         TKsEsAGYXvxGcEG4SvIpmpfmp2EcN/xzcymesxzrAiPLM+ILcJDz9n5bdx9sfgPm2BlQ
         1Cu8OIAVN5E3phl2WnXMe/RY93cWBbQigJpYot4yzaYjvFKaDnzX02GaQjMLGXyDr/CL
         0Qkw==
X-Forwarded-Encrypted: i=1; AFNElJ/YXRgbaXAPInegIvEQNeIFk8rRI76P65D/Y/xbICSoKgiaXUZ/+lhG5bGmNfCgRNOn2WejQOIrjjU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0ZSNyk2oQ5iuVNJ0gjAVmV9v3FpIVyhro/dExyNDziRqf8sLq
	DjBlGstJUibW9kh+30LrQ/Ky4laMlmAkrkdWEBUuhsXOWnmjorclhQI2UGrWH3DXDMfvgU5qcDl
	JwbF9qdGSdwJmH2Aqc7Wnsj/a3/ZgQ0t9XgwCBE3l5g==
X-Gm-Gg: AfdE7cnHBnYId4zRJksTudPiLlwsc5w34EQeD5fpLDvNoGs3uQU2ZzsQsz9MRjqALxw
	x0+qlrxpcnaAt34iFnlbXgjH+h6f7VWNfhTINLkPEBUifUHuQAe2sOOIJiraU/204YKyB5Sansx
	CTLi7kIclysBNy/gi1kTZf/+RJy7QWP/LCxa3WiAIqGG6Te0eSzVziYaWcZEL3ptH1fYTizTdUD
	/a2MKLr8bG6g+a1ysMNjqYOWLxfz7PUlAtTHgrUFnIjVwHzX4XYNdrI7i43ocv1sPG/Se8zVZ2u
	xy3/LuD+2SZeobzUwz8jJft1JhsrG4NkhnVEh4tx7AoJNWJf86ItaWtkDpOWMPHVLxSDQqWttL5
	18xLUhog75g+GSGIasV8Wefak8nck
X-Received: by 2002:a05:6820:80c9:b0:6a1:7d5d:d55b with SMTP id
 006d021491bc7-6a36da40a78mr6610565eaf.63.1783609306048; Thu, 09 Jul 2026
 08:01:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk> <87zf08w7qo.fsf@jogness.linutronix.de>
In-Reply-To: <87zf08w7qo.fsf@jogness.linutronix.de>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Thu, 9 Jul 2026 16:01:33 +0100
X-Gm-Features: AUfX_mzxAEUtA0gfeGBkNwUL4IfvDIIDWxjRLhkwrbukoka3ocYrFDWdq-jaaZM
Message-ID: <CALqELGxAXDF-cz-b=2G64TayXDU1U1vBzb_qBwcEJ2Bvw+fFjA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
To: John Ogness <john.ogness@linutronix.de>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Jul 2026 at 13:57, John Ogness <john.ogness@linutronix.de> wrote:
>
> Hi,
>
> Sorry I am so late to this party.
>
> On 2026-06-30, Andrew Murray <amurray@thegoodpenguin.co.uk> wrote:
> > diff --git a/include/linux/console.h b/include/linux/console.h
> > index d624200cfc1708bf73925892a466efe0c95c5586..3478b556c0eb9579530409dc6fbb9b5a8bff581c 100644
> > --- a/include/linux/console.h
> > +++ b/include/linux/console.h
> > @@ -290,6 +290,8 @@ struct nbcon_context {
> >   * @outbuf:          Pointer to the text buffer for output
> >   * @len:             Length to write
> >   * @unsafe_takeover: If a hostile takeover in an unsafe state has occurred
> > + * @emitted:         The write context attempted to emit the message. Might
> > + *                   be incomplete.
> >   * @cpu:             CPU on which the message was generated
> >   * @pid:             PID of the task that generated the message
> >   * @comm:            Name of the task that generated the message
> > @@ -298,7 +300,8 @@ struct nbcon_write_context {
> >       struct nbcon_context    __private ctxt;
> >       char                    *outbuf;
> >       unsigned int            len;
> > -     bool                    unsafe_takeover;
> > +     unsigned char           unsafe_takeover : 1;
> > +     unsigned char           emitted         : 1;
>
> This is the wrong structure to add this flag. This structure is for
> the nbcon drivers.
>
> struct nbcon_context would be the correct structure.

That's no problem, I'll update on the next series.


>
> > diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> > index 4b03b019cd5ee25d68e9ace84392045e91241a7f..ae45cb0589c0effafc66f1756bdaecd1c1e53ab9 100644
> > --- a/kernel/printk/nbcon.c
> > +++ b/kernel/printk/nbcon.c
> > @@ -1525,6 +1532,8 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
> >       }
> >
> >       progress = nbcon_emit_one(&wctxt, use_atomic);
> > +     if (progress && wctxt.emitted)
> > +             printk_delay(use_atomic);
> >
> >       if (use_atomic) {
> >               start_critical_timings();
>
> This is too deep (also pointed out by Sashiko) because it multiplies the
> delay times the number of consoles. For the legacy printing, it would be
> more appropriate to put the delay inside console_flush_all() and
> legacy_kthread_func().
>
> > @@ -1584,6 +1593,8 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
> >                       if (!nbcon_context_try_acquire(ctxt, false))
> >                               return -EPERM;
> >
> > +                     wctxt.emitted = 0;
> > +
> >                       /*
> >                        * nbcon_emit_next_record() returns false when
> >                        * the console was handed over or taken over.
> > @@ -1600,6 +1611,8 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
> >                       if (nbcon_seq_read(con) < stop_seq)
> >                               err = -ENOENT;
> >                       break;
> > +             } else if (wctxt.emitted > 0) {
> > +                     printk_delay(true);
>
> @emitted is a flag:
>
>                 } else if (wctxt.emitted) {
>

Good spot, that was sloppy of me. I'll fix.

Thanks,

Andrew Murray

> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index cc203327247aa4f81f55b907c66ac88f30ce6da8..5278d9cb19e4177a00998fba5c1438251e033578 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -3211,6 +3208,8 @@ static bool console_emit_next_record(struct console *con, bool *handover, int co
> >               *handover = console_lock_spinning_disable_and_check(cookie);
> >               printk_safe_exit_irqrestore(flags);
> >       }
> > +     printk_delay(true);
> > +
>
> Again, too deep. Let console_flush_all() and legacy_kthread_func()
> perform the delay appropriately between each message.
>
> John Ogness
