Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DFA1BD9D0
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 14:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783607283; cv=pass; b=d/tvphwCFgyhDKdFnvQe3CwK1meugma1uinKD8VWfVRDgBUn7Vb8PJOQBvRVFUoms36744BKjCmTldYjG4Aq2xBr/HPtyscCc2Jd7BHPw6nMFhlF03seh1wD+68HvIn1I/GKMN1426NULvhkAWlQD3KCA8ouXg2H8kQrmeaGoGY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783607283; c=relaxed/simple;
	bh=ew/ahYHt1PSqBy2HvgZ4gSry+8kYZ616VqSL2DoDe+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfnCfXqxVHj3y7uT9MEH+dl0HS4kI80ILftJZznoUSv8l9NfbK9Ch51nCqcHy5tuyzs2AZBY2rn1g1sQtre++9V1uiSo+Wymw3rBzAqXYW75bAhVkdN7AAP+NRmJwQ0JN0ZMyvwFE9cpCEh/nhqXsrymPgHY16z8421uoz/KJMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=Mjnmn2EM; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="Mjnmn2EM"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7eb64085c45so1157330a34.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 07:28:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783607279; cv=none;
        d=google.com; s=arc-20260327;
        b=kLZMA6T6R8EZYrjLCyQIyBg9cQPYXUGHkZuA0XVb7pgDAK3jGZYA3VHHLF5xtoVMNL
         X5UdsvnE6Zbjti1NS4oXE8XqTCEPtiryB6ffl1FvW/unlNX3ZGb4TmER6TwSwrQxl17q
         k1Z9ADhZ/JXbyGHzO/8NHYVOqPO1ynxRDRu/nWM5sCxXCsUeDzwYMFsdpLFwIk8RjLkM
         l0tbmPN134+YNQoB2AmWwAd0anH8+Jjv3FtDLS9BXEIVLd5Bb697qg+AE7UNluzI0NuG
         9P0TnjMb9Sg4vaaTVQcvxPSGG1AwuvIcPjr1rQGTcVO3ZL9fATR3LWYZ0e95zB22doCA
         cgUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o/Aj/fQ0/cX0gUBelTJEVsUYvKgREoT3ILbqcgtsbZk=;
        fh=M7FxkSKNZxTYmK5s++/oYTIFBB85J74KFZ2OIyGLc+U=;
        b=BUy6E0c2WnEzPFPzRJt9Z/Xy0J5NEYbkXA5jgVZCXvUpL/ZX4OgA5MaYnF6yDeCceY
         Ic5dsKh5JxyWzmmI7EAx5ECYihtWM6kGHDXSSylBd5PeaKRPyBitZktbsjuAYgvbFsCr
         AgsvCPJmaXewonHdGUKr4H7evlBcj9QfW2mdQxo3UGX2CMvqSm70SmMVxykNiGyz2jyq
         lkeC/gKWyJAullNIvo5VjPqyDU/zYGAyGi2B7/Kkqw5mIqqquili88IiKeb1casCM3nm
         d7+g+gKKRWjdwg7iw0Ru78YHQuBsQDFWeinMh/2N61itpQhV3TbztmTWl0DV4Ad3BERM
         G9mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1783607279; x=1784212079; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o/Aj/fQ0/cX0gUBelTJEVsUYvKgREoT3ILbqcgtsbZk=;
        b=Mjnmn2EMtBf3x8igFQKf1/TdlKL5LcGzR9jVohup+qDcWWodo/kHZwGiRwhanmNOor
         Fq43BVNOFgZQR8et7IiQ6J5XgVZxHV9ntZWqozrX1WBDfCGEkYapR6e0BF0ZMofPAwZL
         oh5egbtKz5kggHCJSTZzm3KKoJYB74VRQPrEHfC0tSZxoCD4cUbhKFZkqKT1Tlv2WrCG
         0egaCkITMzn7BZN8JPh6YFL6Q3P1O9YqqMycKaPiZIjVy0hDhpv7o+L8R3v9f9DcJWvq
         /4zm3nF87lHmOIYlLlH8ZwrN7UO3xHXUuN/Xrnrl6XU2d+7QKIDHMsYpHGHCEY2/i4Oc
         kXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783607279; x=1784212079;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o/Aj/fQ0/cX0gUBelTJEVsUYvKgREoT3ILbqcgtsbZk=;
        b=OvuX/bNbRQZD/a1viwlJ6vgil6Fw3CXOA1KQhBtUg6q+gC8qIoF6CQnJ2nwOr7bg26
         lKhhEq75gCz5tP3pqlRZIp7v5cUGxK3NOFxpgG5jtSjHIMQOSOrtoSvMa7Ryq6bbSBX1
         Z+vCVJZ6nMCpnWrTlGdZJeVzQSirSvVxDluGRZgjkXtqZfOvg6lpDsrew+btcwxokYli
         vGJCraPOty8To+p23p2fy+TAdayoQ9SOHE0nIDhNlD8eFrhan+R8MOqxF3vat8q3Ym7I
         d+6M5v2VFvn+a1zE73s11JimuVp23DLEnGdnSFBuKNVK8f7aQZEBAPJ4bmNekpw5QH3W
         pl+g==
X-Forwarded-Encrypted: i=1; AFNElJ8q/g5GRDH/4jTnWYlhV2bKTB4PXZa61Tk37R1qycSFcRomXk4309maSeK8nImweNSD9HGbvf4Mszo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeLdPgUPHVcpf3RjbxcnqiNFbzU1BG+GffU87N3RnPAagqvIM+
	bC/aRcJS5wS45aFP/ylmMi2yE/3iec1UpD3FMf6giypXEHOYqOCnsssiyzuFcge6r+/qyx2b34R
	PpQPwAZOtYIkI26Km7LEt5QX1a2qpvb6AxTC0KMHLPg==
X-Gm-Gg: AfdE7cmRuoRdgIzYFjEVdzgzBy4x0jP4V4rJnS+KFW53/srgyAfwTCxl/yOYCC/q+W5
	FRePCaJbFq+355SbLRVlWAZ6uoL6AItA+u6mYkpBD0/ImeMcXDr1+wfRQp/ftpd5jZABKoJMliW
	jTFY07xr8eRD8JL01jQe0jhfkstCp1dchoDgJyaMqqGFiz1aHsYzQLDuhZcF9KgeKo2g82wYtq/
	LwActsOBn/gf0aD51aGSDXEhlPEQ9h44ISau/XGOQySFlHD6On37hjBqPidC2GF/f9jPOjbUPjl
	/Pt6XZh1UgqM81r9WBqFEpuRMuUwW2IKYbrfd/NUwwYQZXOC3glTzkjeEzvdqWag/A7P6HmFWTq
	AjvM+O2aP2OYyUMaT9qldqqZmdOiD
X-Received: by 2002:a05:6820:210d:b0:6a1:87cb:c34e with SMTP id
 006d021491bc7-6a36da8c20amr5154700eaf.72.1783607279485; Thu, 09 Jul 2026
 07:27:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260703165654.71be8707@mitra> <CALqELGz-KSrGq5JYvLedZiO-p21pjpRKbceO+jiSfwZGyx+91Q@mail.gmail.com>
 <20260707145411.53a10893@mitra> <ak0VguIf-PxmbUOS@pathway.suse.cz> <87qzldvqpm.fsf@jogness.linutronix.de>
In-Reply-To: <87qzldvqpm.fsf@jogness.linutronix.de>
From: Andrew Murray <amurray@thegoodpenguin.co.uk>
Date: Thu, 9 Jul 2026 15:27:47 +0100
X-Gm-Features: AUfX_mz4PcZ8QKTOvulicXteeeMZuJNGsMqSn_rhQXpmhC8-QWtUxRPj3PV0YiM
Message-ID: <CALqELGx+7RSKL0+kdOxu0TpXaOifYkzxmOTv+4gTSHqrbLEJ5Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>, Benedikt Spranger <b.spranger@linutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Wed, 8 Jul 2026 at 09:19, John Ogness <john.ogness@linutronix.de> wrote:
>
> On 2026-07-07, Petr Mladek <pmladek@suse.com> wrote:
> > To summarize this discussion:
> >
> >   + Benedikt would prefer to add the synchronous mode before
> >     moving the delay from the printk() caller to the console emit
> >     code path.
> >
> >   + The delay in the printk() caller code path did not guarantee
> >     the output but it increased the chance to see it.
> >
> >   + The synchronous mode will be even more reliable than the delay
> >     in printk() caller path.
> >
> > Please, let me know if I did not get it right,
> >
> > John, did you have any plan how to add the synchronous mode, please?
> > Does it look complicated?
> >
> > I guess that we would somehow need to "mis-use" the emergency
> > priority and force it everywhere by some global system setting.
>
> The synchronous mode would rely on the driver being nbcon. I envision
> something like this:

Is it possible to apply synchronous mode for both nbcon and legacy
consoles? For the debugging case Benedikt suggested (is this the main
use case for this feature?), it would be helpful if a developer could
indicate a preference for synchronous mode without first determining
the console type. Though I'm not sure what means you propose to
indicate such a preference.


>
> ---- BEGIN SYNC IDEA ----
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 2fe9a963c823a..beb5bb3c037b5 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -2456,6 +2456,8 @@ asmlinkage int vprintk_emit(int facility, int level,
>
>         if (ft.nbcon_atomic)
>                 nbcon_atomic_flush_pending();
> +       else if (have_nbcon_console_sync)
> +               nbcon_atomic_flush_sync_pending();
>
>         if (ft.nbcon_offload)
>                 nbcon_kthreads_wake();

My interest in misusing (not proposing that as a solution) the
emergency mode, is that the flush mode is nicely abstracted by
printk_get_console_flush_type. Depending on how you trigger the sync
mode, could printk_get_console_flush_type be expanded to look at a
flag and return ft.legacy_direct, ft.legacy_offload or
ft.nbcon_atomic_sync ? I.e. if a sync flag isn't set then
printk_get_console_flush_type returns based on NBCON_PRIO_type but if
it is, then it shortcuts to ft.legacy_direct, ft.legacy_offload or
ft.nbcon_atomic_sync?

I'm not familiar with this area of printk, so please forgive any
obvious issues with this. But as someone that happily uses printk to
debug the kernel, it would be nice to have an easy way to do this
without the friction of figuring out what console I have.


> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index 4b03b019cd5ee..8f8f29f757614 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1200,7 +1200,7 @@ static bool nbcon_kthread_should_wakeup(struct console *con, struct nbcon_contex
>         cookie = console_srcu_read_lock();
>
>         flags = console_srcu_read_flags(con);
> -       if (console_is_usable(con, flags, false)) {
> +       if (!(flags & CON_SYNC) &&  console_is_usable(con, flags, false)) {
>                 /* Bring the sequence in @ctxt up to date */
>                 ctxt->seq = nbcon_seq_read(con);
>
> @@ -1654,7 +1654,7 @@ static void nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
>   *                                     write_atomic() callback
>   * @stop_seq:                  Flush up until this record
>   */
> -static void __nbcon_atomic_flush_pending(u64 stop_seq)
> +static void __nbcon_atomic_flush_pending(u64 stop_seq, bool sync_only)
>  {
>         struct console *con;
>         int cookie;
> @@ -1666,6 +1666,9 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
>                 if (!(flags & CON_NBCON))
>                         continue;
>
> +               if (sync_only && !(flags & CON_SYNC))
> +                       continue;
> +
>                 if (!console_is_usable(con, flags, true))
>                         continue;
>
> @@ -1688,7 +1691,12 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
>   */
>  void nbcon_atomic_flush_pending(void)
>  {
> -       __nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
> +       __nbcon_atomic_flush_pending(prb_next_reserve_seq(prb), false);
> +}
> +
> +void nbcon_atomic_flush_sync_pending(void)
> +{
> +       __nbcon_atomic_flush_pending(prb_next_reserve_seq(prb), true);
>  }
>
>  /**
> @@ -1701,7 +1709,7 @@ void nbcon_atomic_flush_pending(void)
>  void nbcon_atomic_flush_unsafe(void)
>  {
>         panic_nbcon_allow_unsafe_takeover = true;
> -       __nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
> +       __nbcon_atomic_flush_pending(prb_next_reserve_seq(prb), false);
>         panic_nbcon_allow_unsafe_takeover = false;
>  }
>
> ---- END SYNC IDEA ----
>
> BTW: The sync mode is the final piece so that PeterZ can start using
> mainline code for debugging by serial instead of his own workaround [0].
>
> John

Thanks,

Andrew Murray

>
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/log/?h=debug/experimental
