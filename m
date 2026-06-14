Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F4131A057
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 12:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781441747; cv=pass; b=CNWllCO7D9aJP/tG2oZx+WaqH4BmHZthbhMopl6kyCIOvV6groWu6dzxqgYFJ9Qrn6SYUAfFTAGBaj29puEZjfCdswTM/uZokcO8Dokxxa6mQzVKR+0aIfoBOVRnIDbDzLj39x5Qs9cBPXrc38twJG0VGOjFLeJ1YJ/gb0c+o6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781441747; c=relaxed/simple;
	bh=GDOnrWvp7Y+HFbU9Pe0p0Y8r9RbjMkfXMF0u1Hxcfbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=efds5d6ac5G30QbJAH7/AA3+xBZQwftR+CjVr1aR83wjoE4x0ovJYGIy2BZIebJPiya0cSh4CrjP/IAiUQdTAAOR2tkfYgLGEpB/HByBa89dsADREo0LVBzNeS3gpNc0FlbIMfJnnUp3Bbg6Sjy1yUICK+jEuhMyIVwXJUl9ANM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=PmD51STB; arc=pass smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="PmD51STB"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7e6d14aaef8so1059132a34.3
        for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 05:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781441744; cv=none;
        d=google.com; s=arc-20240605;
        b=OP0u0qUP7DFrhZjoG/Lgw2M/YdPiqmr5QqGxTwm+g4elGQAlUwMXMsseNme1Pxp3lm
         XROSlWTRCKOcdFEiC79Vgipa4IthgnSUJi5rLC5tHnF5rJw4nfl3JnMXAN3xzjsx8Btb
         am8eOEufj4SLEG4CFfp9ry9MMPjjAWB2pBlxkmDCjrC1vL3JKEPIarOB+CWD/xVwtSgv
         2jD3sq38VbWw8a+zoSgksY5oAjP5m2ee1vQvUs6mgijXmLMw+vhribvmTciDhFssY0WN
         ccpTFJfdrZiKWDDX1NnEfN8Sp85qMmRkzhVYmBBq8exEl51ZVx7gylZ+NxTuC0ea5qEt
         L03Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WZeTyf1C0nn8STuLXoAYPKsgBtsVBb2BP7ZZv+Bey8Y=;
        fh=3Rcg3DFez/EnP9J2qHvgRUvj87WZnbBYxWbgU65hSBg=;
        b=KcLExgIZS3Jd4SIt3YFZeWv1NEfcdv7ZwlflgHHrCgneIxPzdXlAQ4zRNK7IEJ9E4u
         t64DV85BBcOw/2mWLrWZ4xKmPXAaW4TNsml91AKd3fBh/6yoGKbxU5t6VmUATNZcM6pI
         rstMYme4UyqRejgHZadRQcWJmVgQVX5ZKJTo9XRY8wT4ZTCwakc9pj+GdbvVF/yYj5ma
         qrjKHsxnOo52IeM5YrkmIE7OdBVjJP8dKN30UatUWpF4XK+S5e5GbT+KRezaKT50M2wj
         1Aa3Lv0pnp68DgcxdZsbtosaflAptKgyttG15YsXxgCokPi5YhcRvM31K7AC279DoNVH
         Zqvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1781441744; x=1782046544; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WZeTyf1C0nn8STuLXoAYPKsgBtsVBb2BP7ZZv+Bey8Y=;
        b=PmD51STBlbQucFae1FnqlC4lYFY5yj739aPoGkyGtD/sI9MB/hY9kCFj3IK7GWbki+
         xfbY8pES2vmRqwW9u/m6QreH4r5fyNQ+rCPBaP/T22vsh6SlZ7nEQtveoM8vgtE8Z46q
         c/9Ou60/eG4jsXG2yhxgCzEo3ZWDZHSWzXMq9ZXVHsx1gMKSLceBcMk3juSUnWWVSI40
         rQZjkh2yHeZA/5QEExBbLuW4UY2WRLTZQ3BarTQ1O1EwWwpSfWGo/xcqOfhpShoY4u/C
         f4u5io7QdUSC7avZ7KwxMr8ShYI/M+Yp31yEvHixI0Nx2jBM7ZM35N7drADh1rkxamg+
         jmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781441744; x=1782046544;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZeTyf1C0nn8STuLXoAYPKsgBtsVBb2BP7ZZv+Bey8Y=;
        b=k8whzAIOYySUGcQGKwwSwGIPzq8LfSuyPfamKiVS2Wr0xs/wq4F1CT6tG4s7pq+LkA
         +U1TIMRSCj2CU3hsvkF1+dr2jBfOCnOcv6I8NA0oERVirqTXMqcGtpKvlyBy+lDG/VcX
         XVP7UK4kueYjVRQxg1Z3pmG5WKfmgmhRBBQqGYwu+Fe+VVr4Uln8lLoI4dtYdNIVPgWs
         8yUn/8Ynf3TubMANzRJ0LN8X/exhu8LmKJnD1Y1aWBAn1x53nOh7mUtwAPySk4daTVgG
         Sq25YiZYB07hb7mhpQJ4kNCr/K/rBg5vUWj9We0qyyKLBr1jqcLwczHIIiN0eDGjPRYy
         DqRQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Nojucpc3cLEy/KNi0YbQJTc5Z9rJnQAtMjYKiEKhYTWFxov2CyCYdOoTRrkNBhpZRJI83KJxJxSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHReVrNrDuX4eqiql6Y3tVAzOY9AzeOJ2nTvxy969h0lgh3BP7
	0VRdpuQd7ShaL4HTD4P8cqDvcjqi+Y3IqgYR+6Q8hpcu7Fkopyk7lThC4BI6ZDZI1WrsdoPmts9
	OXdbSx9wJlO3YPfO4SKWj59xC4PL3SIVpXGcOhU2zMA==
X-Gm-Gg: Acq92OEpYvky/T+hTpbIQMLZruP8MRbQZAraYR9j/vTz+LgjJagvG43j6xBmyZlxiAh
	igxbrCxhGMqD3Dix+6C33/L/1V2Z8u5cFg+3tq6hpPAdBjlZrRUNipjJNkNnYbVyIaoja9BopZU
	cblY3Ve4+Am+t/XFKDakSuVrEXWjIuDSRUqLpV7gFMjN1XOcqxlaPoLZCMEkyClrCa5Sy1JhFfp
	4p4ZfQfBoT96/E3tQ0Z/6w0siJ6wPhcQ9VXTiaGJpoqYV14CsiiQlNVvYQeSgePK98xt5pFIYC/
	5OUJYA1q0CpEBmFORUpQLMy2JldcMPwIX6OCIOLKQo0hC/aiAjxo5RFLoV6BlBci740GA3n8l7Z
	KRhMQWbeNAi0/jhVNsBiUP2HwNv/dvMW2XhCJePs=
X-Received: by 2002:a05:6808:170a:b0:485:403d:9b78 with SMTP id
 5614622812f47-48741936d9dmr4143100b6e.3.1781441744013; Sun, 14 Jun 2026
 05:55:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
 <20260601-deprecate_boot_delay-v1-3-c34c187142a6@thegoodpenguin.co.uk> <aibe12WcrLxVWTez@pathway.suse.cz>
In-Reply-To: <aibe12WcrLxVWTez@pathway.suse.cz>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Sun, 14 Jun 2026 13:55:31 +0100
X-Gm-Features: AVVi8CflUYPsTo9tQrMGcwZHbhm2kwfKfqeb77lT7O7OOqLaCglAj6vHQG53s8k
Message-ID: <CALqELGymunRD=ku6CpoZ6OMH9QOYvyPB-EMN24ez5WAeXFtCsg@mail.gmail.com>
Subject: Re: [PATCH RFC 3/4] printk: nbcon: move printk_delay to console
 emiting code
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

On Mon, 8 Jun 2026 at 16:25, Petr Mladek <pmladek@suse.com> wrote:
>
> On Mon 2026-06-01 00:17:39, Andrew Murray wrote:
> > The printk_delay and boot_delay features are helpful for debugging
> > as kernel output can be slowed down during boot allowing messages to
> > be seen before scrolling off the screen, or to correlate timing between
> > some physical event and console output.
> >
> > However, since the introduction of nbcon and the legacy printer thread
> > for PREEMPT_RT kernels, printk records are now emited to the console
> > asynchronously to the caller of printk. Thus, any printk delay added by
> > boot_delay/printk_delay continues to slow down the calling process but
> > may not have any impact to the rate in which records are emited to the
> > console.
> >
> > Let's address this by moving the printk delay from the calling code
> > to the console emiting code instead. Whilst this ensures that delays
> > are still observed (especially for slower consoles), it doesn't improve
> > the use-case of using boot_delay/printk_delay to correlate timings
> > between physical events and console output.
> >
> > --- a/include/linux/printk.h
> > +++ b/include/linux/printk.h
>
> The declaration is needed just inside kernel/printk/ directory.
> It should better be done via kernel/printk/internal.h

OK.


>
> > @@ -209,6 +209,7 @@ extern bool nbcon_device_try_acquire(struct console *con);
> >  extern void nbcon_device_release(struct console *con);
> >  void nbcon_atomic_flush_unsafe(void);
> >  bool pr_flush(int timeout_ms, bool reset_on_progress);
> > +void printk_delay(bool use_atomic);
> >  #else
> >  static inline __printf(1, 0)
> >  int vprintk(const char *s, va_list args)
> > @@ -326,6 +327,9 @@ static inline bool pr_flush(int timeout_ms, bool reset_on_progress)
> >  {
> >       return true;
> >  }
> > +static inline void printk_delay(bool use_atomic)
> > +{
> > +}
> >
> >  #endif
> >
> > diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> > index d7044a7a214bdd4537a5e20d876d99bc3ffe8b3a..a507a2fed5bf4366e24330f763b842a698ecf6f7 100644
> > --- a/kernel/printk/nbcon.c
> > +++ b/kernel/printk/nbcon.c
> > @@ -1267,11 +1267,16 @@ static int nbcon_kthread_func(void *__console)
> >
> >               con_flags = console_srcu_read_flags(con);
> >
> > +             wctxt.len = 0;
> > +
> >               if (console_is_usable(con, con_flags, false))
> >                       backlog = nbcon_emit_one(&wctxt, false);
> >
> >               console_srcu_read_unlock(cookie);
> >
> > +             if (backlog && wctxt.len > 0)
>
> Heh, this is tricky. It might probably work but it is not guarantted
> by design.
>
> The "backlog" name is a bit misleading. The value is basically
> wctxt.ctxt.backlog. The real meaning is that printk_get_next_message()
> was able to read a message. It means that there _was_ a backlog.
> But it is not clear whether there are still pending messages or not.

Yes I found that to be the case (see my notes in the cover letter) -
backlog is only true if a record was successfully retrieved, though
that record may be one that is suppressed.


>
> Also it is not clear that whether the message was pushed to the
> console or not. It might have been supressed in which case
> (wctxt.len == 0). But it might also be emitted only partially
> when a higher priority context took over the console context
> ownership.

You say it might probably work but isn't guaranteed by design, I'm
struggling to see what I've missed...

As far as I could tell, nbcon_emit_next_record only returns true when
a record has been printed and it still has context. The only exception
to that is where pmsg.outbuf_len is zero (suppressed), in which case
it may return true. Thus if (nbcon_emit_next_record() &&
!pmsg.outbuf_len) then we can be sure a record was printed. In order
to apply this test from the various callers...

for nbcon_emit_one - this returns ctxt->backlog if
nbcon_emit_next_record returned true. But backlog is *always* true
when nbcon_emit_next_record returns true. Thus the test of (backlog &&
wctxt.len) is equivelant to (nbcon_emit_next_record() &&
!pmsg.outbuf_len).

So I still think this implementation is valid.


>
> I would prefer to explicitely set some flag when
> nbcon_emit_next_record() really called con->write*().
> See below.
>
> > +                     printk_delay(false);
> > +
> >               cond_resched();
> >
> >       } while (backlog);
> > @@ -1525,6 +1530,8 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
> >       }
> >
> >       progress = nbcon_emit_one(&wctxt, use_atomic);
> > +     if (progress && wctxt.len > 0)
>
> Same here.
>
> > +             printk_delay(use_atomic);
> >
> >       if (use_atomic) {
> >               start_critical_timings();
> > @@ -1584,6 +1591,8 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
> >                       if (!nbcon_context_try_acquire(ctxt, false))
> >                               return -EPERM;
> >
> > +                     wctxt.len = 0;
> > +
> >                       /*
> >                        * nbcon_emit_next_record() returns false when
> >                        * the console was handed over or taken over.
> > @@ -1595,7 +1604,9 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
> >                       nbcon_context_release(ctxt);
> >               }
> >
> > -             if (!ctxt->backlog) {
> > +             if (ctxt->backlog && wctxt.len > 0) {
> > +                     printk_delay(true);
> > +             } else {
>
> This changes the semantic. The original code call this when
> no message was read. The new code would call this path also
> when the output was suppressed. It would probably work.
> But still.

Ah, good spot! I missed that.


>
> >                       /* Are there reserved but not yet finalized records? */
> >                       if (nbcon_seq_read(con) < stop_seq)
> >                               err = -ENOENT;
>
>
> As mentioned above, I would add a flag which would be set when
> con->write*() was called.

I'm not sure why I tried to avoid adding members to nbcon_context, but
I prefer your solution, it isn't so fragile, and makes it easier to
understand. I'll update for my next revision.


>
> It modifies the type of unsafe_takeover in struct nbcon_write_context.
> But it actually makes it more compatible with struct nbcon_state.

What is the intent of this change (bool to unsigned char)?


>
> My proposal (on top of this patch):
>
> diff --git a/include/linux/console.h b/include/linux/console.h
> index 5520e4477ad7..5a86942e55ef 100644
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -290,6 +290,7 @@ struct nbcon_context {
>   * @outbuf:            Pointer to the text buffer for output
>   * @len:               Length to write
>   * @unsafe_takeover:   If a hostile takeover in an unsafe state has occurred
> + * @emitted:           The write context tried to emit the message. Might be incomplete.
>   * @cpu:               CPU on which the message was generated
>   * @pid:               PID of the task that generated the message
>   * @comm:              Name of the task that generated the message
> @@ -298,7 +299,8 @@ struct nbcon_write_context {
>         struct nbcon_context    __private ctxt;
>         char                    *outbuf;
>         unsigned int            len;
> -       bool                    unsafe_takeover;
> +       unsigned char           unsafe_takeover :  1;
> +       unsigned char           emitted : 1
>  #ifdef CONFIG_PRINTK_EXECUTION_CTX
>         int                     cpu;
>         pid_t                   pid;
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index a507a2fed5bf..060534becefc 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1069,6 +1069,9 @@ static bool nbcon_emit_next_record(struct nbcon_write_context *wctxt, bool use_a
>         else
>                 con->write_thread(con, wctxt);
>
> +       /* Tried to emit something. Might be incomplete. */
> +       wctxt.emitted = 1;
> +
>         if (!wctxt->outbuf) {
>                 /*
>                  * Ownership was lost and reacquired by the driver. Handle it
> @@ -1267,14 +1270,14 @@ static int nbcon_kthread_func(void *__console)
>
>                 con_flags = console_srcu_read_flags(con);
>
> -               wctxt.len = 0;
> +               wctxt.emitted = 0;
>
>                 if (console_is_usable(con, con_flags, false))
>                         backlog = nbcon_emit_one(&wctxt, false);
>
>                 console_srcu_read_unlock(cookie);
>
> -               if (backlog && wctxt.len > 0)
> +               if (wctxt.emitted)
>                         printk_delay(false);
>
>                 cond_resched();
> @@ -1530,7 +1533,7 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
>         }
>
>         progress = nbcon_emit_one(&wctxt, use_atomic);
> -       if (progress && wctxt.len > 0)
> +       if (wctxt.emitted)
>                 printk_delay(use_atomic);
>
>         if (use_atomic) {
> @@ -1591,7 +1594,7 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
>                         if (!nbcon_context_try_acquire(ctxt, false))
>                                 return -EPERM;
>
> -                       wctxt.len = 0;
> +                       wctxt.emitted = 0;
>
>                         /*
>                          * nbcon_emit_next_record() returns false when
> @@ -1604,9 +1607,10 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
>                         nbcon_context_release(ctxt);
>                 }
>
> -               if (ctxt->backlog && wctxt.len > 0) {
> +               if (wctxt.emitted)
>                         printk_delay(true);
> -               } else {
> +
> +               if (!ctxt->backlog) {
>                         /* Are there reserved but not yet finalized records? */
>                         if (nbcon_seq_read(con) < stop_seq)
>                                 err = -ENOENT;

Thanks,

Andrew Murray
