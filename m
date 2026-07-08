Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE3F43934A
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 15:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523356; cv=none; b=IwpdMLpU7/eIKHWJJFhCkjwIsbkoKndFKcJrU0FfZbanF4hIhJJi9ieemAo4HAMoRbanXKH8RLBGc73SdFFgfCTZdP2CbnXF12zCub26HUBi07PnKJ/4SlcI14IHhamli2KZ5gQNDcL6vi4k1qFueKU5zPblIIMVYC12o1ds1Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523356; c=relaxed/simple;
	bh=z/N7Kqy4VoN7rjklbVEOz2uDR/SzdIzcOligfSMXm24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uzIi054yDVEmdhpa3Yxm1hH5CUH2EiYSDLBzNNJWORI4lhgm5mFsrp92MTJsw4Akmx68VHoKG8UNZ5QzKZp+E2M86kIv/hkk3nloIsUeASN1l3Cb9Ac01Q/YihAJHMY0pVU2XtXmn4v1PxEQV1y8/jU49khuWanps2WWCayFcsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FEUsHQQJ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FEUsHQQJ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so6412905e9.1
        for <linux-doc@vger.kernel.org>; Wed, 08 Jul 2026 08:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783523353; x=1784128153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y2V4c6FXtAmxv+8d6AOr3BYyTP+hfZgC/AR0Ye5xNZs=;
        b=FEUsHQQJwClPHVfnwyOxPX9oIVeKKKCU2vwPC5PwxLXU/VFXeTU4oMkORByPM2LMAZ
         hAgo1WgauKhDWvv5HNDCDLuduPyW4q998X4SZbqS42m1Rl/aVShUsxo2sryQ7TCM+Vak
         ti3V0fnIWoet6J1OvsaCJ+Fw+E1+ppUIfQNuscdAhohSHqKGZVeX+nPSOeo3G/drMWU+
         an3b1EydAcf4/nJRciTlW9E/WAB/Xr0PhyhPP25kd9zP9nbi58J7DjqOByZoBAUhPyaL
         zKTaMD7z7p2vYqlVmtn7T1+9PQYmcqhaAOc1xdHNH+3gJtz7EmgEaRCdCmcL8A1P2P1Y
         5j7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523353; x=1784128153;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y2V4c6FXtAmxv+8d6AOr3BYyTP+hfZgC/AR0Ye5xNZs=;
        b=iMmeq+IWe0jVNLG91H4zSn4ECHUbOMkeKxhakCZREjgp33Za/6tdg/bxxrdyx5VH80
         9BGYxVO3WMjIB1pkzcGAqmuEUlVdq1E8Ng4EcXqTCEn99dcuza/kIu0YV1cAYo0V3cQ4
         ktlVQ5F3FaZbFBT/dKwX18Pt7CZ39VAFpdDCHTynGLgomV7cVcblBr90TouQQRU4BZbC
         JGFhsmwdPRU+DOASEONUIp/wo+pZBDdddGIdRf6yCJqGGuLy36FqNW3RL/8ukw+63pjt
         vF418mmT50ma9d4mtf9AOHVJApW+QDUch+c35zxJnM/pRlR/bAmUysq6Cpk/okaTchEr
         OZig==
X-Forwarded-Encrypted: i=1; AHgh+RoHDrqyOWNNu3dlmTEhRl/qikC3k31bwoy0v4I9MCYHw5M5cuXs2Yc5B3rlPaqO2V4wsNRPwLizEuU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWP67Zp9L3Y8y3X4XkXJNz1ORWsFRhZikhvJtHDfesG9NbjGBi
	HOYIAmth4yAwGYgzdQQKO0XrpPMQilzuDS4A9ZKLvcwLHHCuQfIcgfGt3aOczGb6BEk=
X-Gm-Gg: AfdE7cmpzH3J3dRxoxyqRchY9Y95/OHkmyEIvz6p3Mi+C6Jn2p/TPeyQF4ap2mtZoQ4
	Td2yYc1JxIeCvkLCuf5wIkrUhQAWFIFj0cCXnKbriVIwblJlSq3xxCNcpRJFk6c3ZQVCul8sNjj
	HyTVuAkztAMIiicje/WveX/TOgr4jpZiSGY2/YWKUNBKUeaPFhZ8OfCXwlPev+PiAOG7ukY3thm
	n6wij6mt82mpzgxLmLMB6ggpw9zW34jmfwe5+8zGzNdHQElcNbR6CKZ9InIInr2MmpV4O1RG20/
	4v94jFEQsIiTIoOSfgYkKxl5DK9W4ML5nC2Pie7+JvnZHQA7e/6QGlmRWyJW7ndXvPawOMLFIJY
	YNXfvgyQSCi5akLP8IJ6pO1kKaLYYV1iFea8QtVfHrRcI1AYsMLKYOgnX9SGRRKOUXAoWX6Nji7
	n3pXl65IiPUv7N+pQ=
X-Received: by 2002:a05:600c:34d3:b0:493:b4cf:d37f with SMTP id 5b1f17b1804b1-493e68c699bmr33093525e9.16.1783523353384;
        Wed, 08 Jul 2026 08:09:13 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f5b811sm238538095e9.13.2026.07.08.08.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:09:12 -0700 (PDT)
Date: Wed, 8 Jul 2026 17:09:10 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Benedikt Spranger <b.spranger@linutronix.de>,
	Andrew Murray <amurray@thegoodpenguin.co.uk>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
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
Subject: Re: [PATCH v2 3/4] printk: nbcon: move printk_delay to console
 emiting code
Message-ID: <ak5oFk3Snnt9Wr95@pathway.suse.cz>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260703165654.71be8707@mitra>
 <CALqELGz-KSrGq5JYvLedZiO-p21pjpRKbceO+jiSfwZGyx+91Q@mail.gmail.com>
 <20260707145411.53a10893@mitra>
 <ak0VguIf-PxmbUOS@pathway.suse.cz>
 <87qzldvqpm.fsf@jogness.linutronix.de>
 <ak5eCp5qw9LYrnAH@pathway.suse.cz>
 <87zf01ttve.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zf01ttve.fsf@jogness.linutronix.de>

On Wed 2026-07-08 16:59:57, John Ogness wrote:
> On 2026-07-08, Petr Mladek <pmladek@suse.com> wrote:
> >> The synchronous mode would rely on the driver being nbcon. I envision
> >> something like this:
> >>
> >> ---- BEGIN SYNC IDEA ----
> >> --- a/kernel/printk/nbcon.c
> >> +++ b/kernel/printk/nbcon.c
> >> @@ -1200,7 +1200,7 @@ static bool nbcon_kthread_should_wakeup(struct console *con, struct nbcon_contex
> >>  	cookie = console_srcu_read_lock();
> >>  
> >>  	flags = console_srcu_read_flags(con);
> >> -	if (console_is_usable(con, flags, false)) {
> >> +	if (!(flags & CON_SYNC) &&  console_is_usable(con, flags, false)) {
> >
> > The dependency on con->flags means that the sync mode can be entered
> > only in task context where synchronize_srcu() can be called. It might
> > be good enough. But I am afraid that people are creative and would
> > like to have even atomic variant sooner or later.
> 
> You mean it can only be _modified_ in task context. Yes. I expect it is
> either specified as a boot arg or modified via some sysfs interface.

Makes sense.

> > Also it will do the flush in NORMAL_PRIO which is good. But it might
> > fail to get the context ownership when it is blocked, for example,
> > by uart_port_lock() which might be even sleepable context in
> > PREEMPT_RT kernel.
> 
> Indeed. This is the same limitation of the atomic printing in
> general. But I do not think this can be worked around during normal
> operation. Ignoring locks is not an option.

Let's see how it works in practice. But it might work pretty well.

Now, the question is how to move forward. It would be nice to
have the sync mode available before we add this boot/printk_delay
clean up.

Would you have time to prepare and send a patch anytime soon, please?

Or I wonder whether Andrew Murray might try to create a patch
based on your "SYNC IDEA".

Best Regards,
Petr
