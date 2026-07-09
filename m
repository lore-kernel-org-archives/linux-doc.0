Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1D132E126
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 14:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783607217; cv=none; b=APjKOvdvfWxdyCsmgF/jD1JgnXQ3kLzkynWLGVWQyz9P0VcDKfo9/rzy8i3SBknYs3iZspGoWfCAaKuCRoaHwWjAiXlZGqb0CwKvV1tQnhkeUnQXOsrqa8A4eiNjR9y0sK7XvUSmrM1MnnrL4dRIMUWZEM88bkYN8MMO026gQfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783607217; c=relaxed/simple;
	bh=YI6Csvady8zUfpKj0TSyww8TUuACFjmAGkHdUe3RKM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVGiYTLSG/1IRMQFnFsUwnwsII/GgaeNcOq2oYsQEZ1AjPjjikxyNkUAFUTDdgqIPgniXszXd/DT1p83uwiK9Tog9vipEzdtEb+x3Tl6kPOHTrKYPd7yU/k2FDUFAvUxIbIOvody0L57CupuZyQyHiisKft6eyfGfaSfvWcvYBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JeQqwm7f; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JeQqwm7f"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493ba701891so14498505e9.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 07:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783607213; x=1784212013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pgKeluas+jUY/8yJAiAEBG5t4/+qnuDSzD0+HGXJqIM=;
        b=JeQqwm7fY5TK5HdwKmPnbsPyJbmwKls0Sd/TdmA7PSFYVzQwNiDwXzLw0bo05wd1Cz
         VHDCmoZmImDtjbHy9RqH4i52Xe/dndjYuatgwO93vtkszavtg2iI4KqYsb2e+WY+HP2P
         hisYTv5sDVlHgE6l1lbTMANbYNPF6JUSpaIZLEYUclAkEE3YHlbV5mB6yK188P5i8zhk
         SRwWtYrnbkej+ExQIkqu1Fnsuo7tWrTPVIvNtey3CoUL9O3XdtGb0JkuCJ5E8Vv5KUAw
         C2Mis5lpzNny2XsybWus/sY2UnwB7P2kcpNjP9+ml21AaP7L1WTDckVPN4d0WFfkTz+N
         Ysfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783607213; x=1784212013;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pgKeluas+jUY/8yJAiAEBG5t4/+qnuDSzD0+HGXJqIM=;
        b=W0iGuvQCLui2Uiv1J6Hdy9Z/Fz+ffdcU+wEijf5Qxv9unpVObq/V8Er6r8/lHVrbpl
         aBg65tB5PopiKeoxXEup9Nho7f1FAndzbxDH3WYuiA3I+sTzwrURy0W3ZFb72HEgU8pM
         vupxr7fNSrvSbGptAv4irBq9CVPYuIaVAZkoakl3KJQdtZ5VLXVHaJFS0jcbNuFmZI1I
         LWEzMP63grvOU/EQZkpjvOlfq/iAMPUDq1rSSHphJd6GXobwGm9G5/M4XYlVz0bliM3B
         HEqZ3U8Dp9ND2WMUnGxbzSAMWjwKXeop19CJpNtLBZsWUZ2VCrQI6v7KsJXbc+dsOQLP
         n6/Q==
X-Forwarded-Encrypted: i=1; AHgh+RoMiD05Y9kiL6A3ruv4nSLTiyeiGO0aezb1G/sKY9wOLqLqBD0P1Rx+d9GbhsTb1sO3UdyzYiaGbqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZHP4c+rJ982ZHigjn6RqUm1PFR9dDQdctZZs5f8KdjBmWu/cN
	iYSnsUSmPak35bppi+67XvoxnlODUA9eIVT5VfPSlFa5ZOpGo19ICyz8f0ACQxO4wXA=
X-Gm-Gg: AfdE7cnbCTTj/aBf52LsEXWyfwISsogbUgjm6z8GTEkolh5r7PZc/zkFa+av/+M5f0u
	mfP9roS3cZi46JiNLksaADocbndx8k8W8rcej1m0IMerb8RI+lYKlRLJQ2nIgENiym95WH2OdBu
	JNbXN5mTpfUJRzI3lE9+7oGbw+KLSicVeZIDos07/QWdYvD75NfB/NLxrvUXjqF093hp3UkGaAH
	vxiJMkWgddiPvhlyn6KiU345C4ucazvZNRpCWu9YSBiFHXp68ETXHBz/pL9NiYZP4gecCvan2Fv
	TZRqgGyhE6LaoGlZMdHxScNblvOetmxxKUazARoZhQxPI6un1K999CV3dA4+vICHjKax2Fa7GxE
	SaWkDpFhWKj8wL8FQUO9G1Cooud1HSlv5uttqpMnemXjsJHRpHQ2txrWxzIBxduZ+pyvf2xZ4MJ
	DwEgsFSyeBGQftP38=
X-Received: by 2002:a05:600c:34c3:b0:493:bb29:af40 with SMTP id 5b1f17b1804b1-493e689b37amr85711945e9.14.1783607213522;
        Thu, 09 Jul 2026 07:26:53 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb74835esm72452175e9.14.2026.07.09.07.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 07:26:53 -0700 (PDT)
Date: Thu, 9 Jul 2026 16:26:50 +0200
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 2/4] printk: deprecate boot_delay in favour of
 printk_delay
Message-ID: <ak-vqrSr7NLCkGQw@pathway.suse.cz>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-2-f9883d36aa4b@thegoodpenguin.co.uk>
 <ak5mPxUdp2pzCMt5@pathway.suse.cz>
 <CALqELGxjTZAXEp1C1CNO2tLbUpUChZW3DHcNgyhEu4Ma-ct2ow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALqELGxjTZAXEp1C1CNO2tLbUpUChZW3DHcNgyhEu4Ma-ct2ow@mail.gmail.com>

On Thu 2026-07-09 13:32:10, Andrew Murray wrote:
> Hi Petr,
> 
> On Wed, 8 Jul 2026 at 16:01, Petr Mladek <pmladek@suse.com> wrote:
> >
> > On Tue 2026-06-30 17:35:58, Andrew Murray wrote:
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
> > > additionally configured via an early kernel parameter.
> > >
> > > Behavior change:
> > >
> > > The delay enabled by both "boot_delay" and "printk_delay" continues
> > > working even in SYSTEM_RUNNING state. It must be explicitly stopped
> > > by setting printk_delay=0 via sysctl.
> > >
> > > The delay is skipped when the message is suppressed in all system
> > > states. It used to skipped only for the boot_delay.
> > >
> > > Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>
> >
> > Looks good to me:
> >
> > Reviewed-by: Petr Mladek <pmladek@suse.com>
> >
> > Note that Sashiko AI warns about possible problems with negative
> > printk_delay values, see
> > https://sashiko.dev/#/patchset/20260630-deprecate_boot_delay-v2-0-f9883d36aa4b%40thegoodpenguin.co.uk
> >
> > But they should be handled in both the early parameter
> > and sysctl interface by the "10 * 1000" and "&ten_thousand"
> > limits.
> 
> Yes, that was my also view.
> 
> 
> >
> > The only potential problem might be a warning about possible
> > "sign" mismatch from the compiler. But I do not see any
> > even with make W=2.
> 
> I suspect this will come up everytime a change is made in this area,
> or perhaps some W=2 errors will pop up via kernelci or similar. I
> propose updating the patch as follows:
> 
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index 5278d9cb19e4..fbb67f10c21e 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -1338,10 +1338,13 @@ static inline void early_boot_delay_msec(void)
> 
>  static int __init printk_delay_setup(char *str)
>  {
> -       get_option(&str, &printk_delay_msec);
> -       if (printk_delay_msec > 10 * 1000)
> -               printk_delay_msec = 0;
> +       int printk_delay_val = 0;
> 
> +       get_option(&str, &printk_delay_val);
> +       if (printk_delay_val < 0 || printk_delay_val > 10 * 1000)
> +               return 0;
> +
> +       printk_delay_msec = (unsigned int)printk_delay_val;
>         printk_delay_calculate();
> 
>         return 0;
> diff --git a/kernel/printk/sysctl.c b/kernel/printk/sysctl.c
> index f15732e93c2e..f256fc05faaf 100644
> --- a/kernel/printk/sysctl.c
> +++ b/kernel/printk/sysctl.c
> @@ -46,7 +46,7 @@ static const struct ctl_table printk_sysctls[] = {
>                 .data           = &printk_delay_msec,
>                 .maxlen         = sizeof(int),

I would change this to sizeof(unsigned int) as well.

>                 .mode           = 0644,
> -               .proc_handler   = proc_dointvec_minmax,
> +               .proc_handler   = proc_douintvec_minmax,
>                 .extra1         = SYSCTL_ZERO,
>                 .extra2         = (void *)&ten_thousand,
>         },

Otherwise, it looks good to me.

> This makes the cast explict, verifies the range before casting

Yup.

> (I guess a range of negative values could result in a postive value
> within the 10,000 range) and also uses the correct proc_handler.

IMHO, this should not happen. I have never seen int smaller than 4
bytes. If I count it correctly, positive numbers should be up to 32767.


> This has the side effect of not showing the following pr_debug for the
> lpj calculation when a delay is not set. Though loops_per_msec is only
> used during boot, so I don't think there is any loss here.

I agree that it should not harm. But please mention this in
the commit message.

>         pr_debug("printk_delay: %u, preset_lpj: %ld, lpj: %lu, "
>                 "HZ: %d, loops_per_msec: %llu\n",
>                 printk_delay_msec, preset_lpj, lpj, HZ, loops_per_msec);
> 
> Can I keep your Reviewed-By with these changes?

Feel free to keep it. That said, please put at least the change
of the ctl_table into a separate patch. I would rather put both new
changes into separate file. It is never a good idea to hide
such changes in a complex patch which mostly reshuffles an existing
code.

Best Regards,
Petr
