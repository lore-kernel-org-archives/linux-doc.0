Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E6C54DAEA
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 15:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992331; cv=none; b=O44CYZXQCQEvPt6ep9oRZG/EQahufzMa4oidsztg3atjSY+nuZJBTW1oJgJ7T0UH++A/DxMUq2Zu9Toqwk8j9m4vK9oDz/AgAfAQAqrG6eza03TjOfe0ezH9iNItfC8Veqv88IRXPsLQ0znTUrZrjpZpG+QjheZ4jhNlH8/gs30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992331; c=relaxed/simple;
	bh=4BFLoc2Qyd3LlDRrfy6DeHLk7jZhhoPcwhcXm3WiVmk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a85n001/aSBuL/0frtSGkDLeD8mnbAGvAbObIJsSvIMdHiqD78KjN0xsu9DWBQlUhLpyxnepcr1gwiG0uuFgqE/HimtuIzdohwCMuIeJxUVBaapRQfwOIBxpQm0LwvtFHdxKCXxUjtR0JMFw+fR36D7a1MB1Z9iJOhOeyOrc5Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HJBtKO4B; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HJBtKO4B"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so14629195e9.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 08:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791992328; x=1792597128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Z/ndJCv29t79k2nyqVh+dd/kAn1yNzZHxVFtofaEew=;
        b=HJBtKO4BZ1CCRbWOn4+IdVzFVP5UfdrXHTmLDYqlZb77Y0IV+H6F8LtTWM6iE1n3HO
         spF2oukpA2adDLYbrsTLzVmX8hrHSWtyLr6jYOzWse00IrygNJdpggEJQrCLEOed/JSn
         Lgq7uslVeyxyW8ZhRv30Y+jM5Yp1anWV6gln32B1x7JbGrC94FQZbbGA9hutb7ruYjB/
         Ti88UOpZkztp+EQb714CwzbLJ4aqVw3S0h/5HDgFVjRsJt2AJw3gs82Vv0FLoRMi11yA
         A3EZr05g0vOby42eIUXP3USGKzJfxYQx4yh0Iep3KNIcVgh/GcjgM6V6LQjhdD/avE6P
         WUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791992328; x=1792597128;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Z/ndJCv29t79k2nyqVh+dd/kAn1yNzZHxVFtofaEew=;
        b=xCy2RUjui6AZGuRBmw1H7ol+FVTP8MtEVxtmRtsw5P342wUhYKpVUFshjj+c3TXMPp
         c/fY/rJgRLGQuu5auA5BuVvivKuNX1mliVcslv5N60cUnDV4e0yBW4XMiZc09Q54ModB
         G164dRvab4A4qDjA7DQPybHVCrE1OU6tptTkf9njiXX5mhN2qczqY7l2s3v55QwiH0X/
         fNQ5FQG+AGX9FhRZgeBHb5vLodT8dKrJe1qVg27fktgJ4R5j/NyWkY4Vab5Kog05R5Jg
         ktcWq/2IwX6QpDRmyUZ2VSasYN5k+/2LwOq0f8cSKxvFubpbsfMf1IXEbZ/p8JDIrBlp
         HNiw==
X-Forwarded-Encrypted: i=1; AKwUvBxkOLEXf5XsA2qbnrO5pF5MWk+T2dobED3e0wq0GBZVrhlpKdKeqpoQChemclwzqKwsn2UR/qXC3f0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfi/bon+buErVSaenA+8JXjHPwmHq5ka5kz/uXYhIeHvhve5fA
	lG88G4bw5iZqgDfjmixqmbr5EPaamOP2vHKUAGjQ24XD/i/3YY/iUj2KbNdFOWy08X0=
X-Gm-Gg: AYBFou0YUW/VWy6lmHoCnyXy3yoh+7UXnXqhDwaPL8HtiAXNQwyDloRnBfdEmfmgOSt
	M16/lkkm0qx1/ppzIOeTZeMOManyTmFQGX2h3AeCFIEh1DO189W8uO3tRQ82YQEQQPlkg4Fnu/K
	VU9b21kuXTzYKDGW9U9MVSvZLkC4uoq2zjqorVdrDBvt10MNXmTckxTWuL7p8lhXPt/fPsdkuLi
	BV6u/KrhC/UtXfiqRjIGgPr1/vzA1JMok6yr8nC5f3OJnexY7atBvKuPGncYOoNzUongF4FPupe
	hLlPFQIJYXPHv+BZvB4x56WgWxQvCetft+u4ZtglN5hhMF7y/Clpi2pQoPX+gI3OlMN+45caI8G
	AC5YMC5xiXy4qaHargrFHb5XUO760mVhz6te4Fig01s0gUQ8lwlBV/HWMjGVq/jXtX/piejVrbd
	myRUE9w98EsIS6KeQQjUiFDpQudCRq4H3qFk28M8moxoqdY3g9pJ0eG3qi3AV3MYuWPCpkbs0es
	RP6IUra5FM=
X-Received: by 2002:a05:600c:609a:b0:4a1:7108:c2b6 with SMTP id 5b1f17b1804b1-4a18e4effabmr313776615e9.31.1791992327765;
        Wed, 14 Oct 2026 08:38:47 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd68585csm1333085e9.4.2026.10.14.08.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:38:47 -0700 (PDT)
Date: Wed, 14 Oct 2026 17:38:44 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	David Gow <david@davidgow.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Kees Cook <kees@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	John Ogness <john.ogness@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/3] hexdump: Allow skipping identical lines
Message-ID: <as-iBP1781DVuZ7p@pathway.suse.cz>
References: <20250319-perso-hexdump-v3-0-a6ba3a9f3742@bootlin.com>
 <as6TIm6xE8Izccb5@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as6TIm6xE8Izccb5@black.igk.intel.com>

On Tue 2026-10-13 22:22:58, Andy Shevchenko wrote:
> +Cc: KUnit maintainers + Kees
> 
> On Wed, Mar 19, 2025 at 05:08:09PM +0100, Miquel Raynal wrote:
> > While working on NAND issues, I used print_hex_dump() a lot to compare
> > data. But I am mostly working on embedded systems where the kernel
> > messages go through a serial console. Sometimes network support is an
> > option, sometimes not. Anyway, I often print buffers both in kernel
> > space and user space to compare them, and they may be full of 0's or
> > 1's, which means lines are repeated a lot in the output and this is slow
> > *and* hard to compare.
> > 
> > I initially hacked into lib/hexdump.c for my own purpose and just
> > discarded all the other users, but it felt like this might be a useful
> > feature for others and decided to make it a public patch.
> > 
> > * First patch creates a helper named print_hex() with a prototype
> >   containing a flags parameter, instead of an entry for the prefix type
> >   and another entry for the ascii boolean. print_hex_dump() now
> >   falls back to print_hex().
> > * Second patch adds a new flag to possibly skip the identical lines.
> > * Third patch is optional, and adds the offset at which the dump
> >   finishes in case the last line to be printed would be skipped.
> > 
> > The Cc-list, as provided by get_maintainers.pl, was returning 330
> > e-mail addresses which felt to much, so I ran the script only on the
> > second patch (the printk/includes/debug/Doc changes). It gave this
> > Cc-list which sounds more reasonable. Hopefully this is a smart move,
> > otherwise let me know what you think would be best.
> 
> Sorry for the so late response. First of all, a bit of a background
> development on my side. At some point a few months ago I asked John
> Ogness to give me a private dive to the printk() guts. He explained
> to me a lot about ow printk() circular buffer works and that the
> implementation is nowadays done in the terms of circular buffer library
> and printk() front-end. This gives a potential to get a clean solution
> for the testing how printk() actually behaves.

I am curious what printk() features you would like to test.

> The main issue with the
> real printk() is that the buffer it's using is defined globally and
> for clean test cases the printk() can't be used. We discussed the way
> of high-jacking that by linking an object file of printk() implementation
> to the KUnit test, but it seems quite a tricky if ever achievable exercise.
> 
> Meanwhile Kees Cook seems found a nice workaround for the similar use case
> in his recent patch series [1]. The idea is to register custom console and
> provide a custom .write() method which is the heart of the solution. On
> the writer side user prints something which has unique prefix, while the
> console callback recognises that pattern and checks the rest of the line.

I ask because the solution used by Kees seems to be quite complicated
and unreliable for the given purpose. In particular, printk() does
only the best effort to flush messages on legacy consoles. And NBCON
consoles drivers are even offloaded to a kthread by default as
pointed out by John in the other mail.

It seems that Kees just want to check some particular printk() calls
and what messages they print. It might be easier and more reliable
to redirect printk() to an alternative implementation via a hook
in vprintk() in kernel/printk/printk_safe.c.

The vprintk() function used to redirect printk() by context,
e.g for recursive messages or NMI. It is much easier with the lockless
ringbuffer now. But it still does a redirection for kdb_printf().

I could even imagine that it could call vprintk_emit() with some
special facility which would cause redirecting the messages to
an alternative ring_buffer. Or we could even add a parameter
for this.

Anyway, the console machinery is pretty complex and just a best
effort. It would be better to avoid it unless you really want
to test the full printk() machinery.

Best Regards,
Petr
