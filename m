Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7E73815CF
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 15:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783438303; cv=none; b=f2RBbyyhxRLhsHq6tw7nYEJBOKsvt0B9J7g+xIgWHZNi+XXcIiepwl932uimLvu7gqf3RGcnHQcywgMbSLCSRiGOZRzuYLMoPe/iEJFQZML/OGtd0Utgfe+XojZdzKRvwEBT3pEEIgkHJSUEREkhKyKmzoc18pcB59KncYsYu0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783438303; c=relaxed/simple;
	bh=is6AVzN2o+b1hAJEgaZMoZOIskeWSdm8HCezvmiVjKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWQzil9hw9mUxPb0zlyBqSH3qQa9sJxACBzjBUB8tNrlmScDPAnJZWEDwck3/GlM8TFZRM0jpV40JVWfRBwyN00y8LlGxa01sr9es3k8jNoS+7Z8NTtle7rkvnbg4yVKsp1tSe3TNFLYKqNvGP4m/qKqeXgwxx3ldvsMSon5UvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T/YYjdAl; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T/YYjdAl"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47de0093c42so2413549f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2026 08:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783438300; x=1784043100; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3dnXXTA5QHDGkY6+1EXQz/Z/TzRlKI5k35UU0v99L+Q=;
        b=T/YYjdAlXMPMGgadkbrC+FUsTl6p8fQ5d6fz5HlMzwgdT+k9YktUFZX8e5gVPono1H
         12/NDGzyqiAS8/qMFAW4keRbFen9WC62d8WwTXxpG6D4iDOHKnbj8KBJUAZQCGM1bmzM
         jCNHdas2RQYRt66nVn+PJyAOza0mf1Lk+fd/y1vuzQ8+Hq5J9s2U3EFXGyf9RQhHv7Th
         bKVH6TWprc0eTDucMpWBMi7/06OqTtm1/FjhMqmjKoI1QGP/byazXmdwyLah/se+ix2s
         haHVyl0oGNhEv7wHC2fEMR/XLFF3NWSI3w/jGt7VX1c16ytXwOW2zxu4ayscl72VN0xX
         Oe8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783438300; x=1784043100;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3dnXXTA5QHDGkY6+1EXQz/Z/TzRlKI5k35UU0v99L+Q=;
        b=Okb3vBMsHlZDydfGEgqCTY0gMeXhm51jGZEsliuIv8p/d03Rnd6FDAQTqAZBeUFaA9
         QbF9h7yTzh1hVLuFXiWNelcEk/5+wkAiJmNZrQBp4uVIfHlxXVtSPqzaYWAEUdu2fh+j
         QPGrPALIINLIqvXARqFXVtbadp0uZAYanrOek8zD8dNtXqO6cCAUCKnA7PeACfggcSZx
         J5q5xRiJbpCPCEcutrNQqCUq/hG2AZ9XrQsCB59Hy7lPSkXJ7ArTp1HXP3XwpH0XTRDL
         6WeMuvSc0v325mJUtZ90ZkjmbZXQTTsFDWO+d0VwZnTihHhdUwblXTxGn6MKwe9e+und
         qI4w==
X-Forwarded-Encrypted: i=1; AHgh+Rrc8KgIwuUDOHqkwjCVMrhk8gLHtvAurbh4BBXXQkOuHxFCQGl2Yg8mPcGXJWOCTexvey5ClO66UiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgIXMIEmbr9URU0uUcHNyK+U5qqmFhhdnQYNnYyCdaBZO+u3ES
	c57cy3YWJkdz0OytJxAFqMXrJrPVDTu6TePV/OU8egdNaCd/vWa+SjzueqM6wwWjZ6E=
X-Gm-Gg: AfdE7cn0mAGVND359KwSF0fMOPgYFhJetUVyzReUCzrMIKA5qAihtOlxlxobD7p0lFf
	2hrfJkjUMoZvHgicBAxJ+nDHKpoHUOsDd3gPETQcdpliJkJj8jGHikwjwv+U67aVQxHAV51+ZRZ
	uWuNJGUnnNp66QMVfYNb5TBPVgyrpl9pinjlRfXWB/3c1WaDlnv1aWzItJzun1QKzQN2Ft+qarn
	8E7qr1v6SM4y0B0Q5VQ0D+SAYhOqcJXLLhdEKNzy5YKqt/yweQz7v3TgS5CCT2UCFcx9W/CTswv
	0jGqya/xQy51UwIsSwj0ddj9nue2jfbqiRJtDQqeYvgNKnoGMd/HEqZxcbMAqFI2rrTSVDAmF8D
	aB2Hu/unwkCbwN3k7Fh7FfqrLuppOfNQ1KfSUZMegnLO98NtV4O4hBEZfW0GHjxdm071jTGZOUH
	22xao3DsBA9p1yHgg=
X-Received: by 2002:a05:6000:bc7:b0:47d:dfc6:b27e with SMTP id ffacd0b85a97d-47de66bf187mr4980390f8f.31.1783438299879;
        Tue, 07 Jul 2026 08:31:39 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960b06sm33961270f8f.28.2026.07.07.08.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:31:39 -0700 (PDT)
Date: Tue, 7 Jul 2026 17:31:37 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Andrew Murray <amurray@thegoodpenguin.co.uk>,
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
Message-ID: <ak0b2S9jjYy49a8V@pathway.suse.cz>
References: <20260630-deprecate_boot_delay-v2-0-f9883d36aa4b@thegoodpenguin.co.uk>
 <20260630-deprecate_boot_delay-v2-3-f9883d36aa4b@thegoodpenguin.co.uk>
 <87zf08w7qo.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zf08w7qo.fsf@jogness.linutronix.de>

On Fri 2026-07-03 15:03:51, John Ogness wrote:
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
> >   * @outbuf:		Pointer to the text buffer for output
> >   * @len:		Length to write
> >   * @unsafe_takeover:	If a hostile takeover in an unsafe state has occurred
> > + * @emitted:		The write context attempted to emit the message. Might
> > + *			be incomplete.
> >   * @cpu:		CPU on which the message was generated
> >   * @pid:		PID of the task that generated the message
> >   * @comm:		Name of the task that generated the message
> > @@ -298,7 +300,8 @@ struct nbcon_write_context {
> >  	struct nbcon_context	__private ctxt;
> >  	char			*outbuf;
> >  	unsigned int		len;
> > -	bool			unsafe_takeover;
> > +	unsigned char		unsafe_takeover : 1;
> > +	unsigned char		emitted		: 1;
> 
> This is the wrong structure to add this flag. This structure is for
> the nbcon drivers.

Good point. I see:

  + "struct nbcon_write_context" is intended for passing
     information down to the console drivers via
     .write_thread() and .write_atomic() callbacks.

  + "struct nbcon_contex" aleady contains section
    "members set by emit".

> struct nbcon_context would be the correct structure.
> 
> > diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> > index 4b03b019cd5ee25d68e9ace84392045e91241a7f..ae45cb0589c0effafc66f1756bdaecd1c1e53ab9 100644
> > --- a/kernel/printk/nbcon.c
> > +++ b/kernel/printk/nbcon.c
> > @@ -1525,6 +1532,8 @@ bool nbcon_legacy_emit_next_record(struct console *con, bool *handover,
> >  	}
> >  
> >  	progress = nbcon_emit_one(&wctxt, use_atomic);
> > +	if (progress && wctxt.emitted)
> > +		printk_delay(use_atomic);
> >  
> >  	if (use_atomic) {
> >  		start_critical_timings();
> 
> This is too deep (also pointed out by Sashiko) because it multiplies the
> delay times the number of consoles. For the legacy printing, it would be
> more appropriate to put the delay inside console_flush_all() and
> legacy_kthread_func().

True. The question is if the proper solution is worth the complexity.
We would need to pass the information down two level of the API.
It would require adding a new (output) parameter to console_flush_one_record(),
nbcon_legacy_emit_next_record(), and console_emit_next_record().

It is not that complicated but these functions are already hairy
enough so we should be careful.

Best Regards,
Petr
