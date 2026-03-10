Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53DF316905
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 15:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773156038; cv=none; b=sU/DM8ZyCD/nB54dXwNx0PILjzDgptNpQQmEhbOk4iTENSGORi0pRcawBixejix9kipy7KXeN/SXKPOwCPZq5YJDf+dNnh+iqFwn+thlUn97vrtOhNiXiK7aJc17ery5BaQrOHEz5ZyyfhQGZEROI2P3lygz2orR+RCModK3dfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773156038; c=relaxed/simple;
	bh=SYZPVJ10Kwp6XnWS5i6rBpPqQl0W9tJjyaomlFn7Qtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sa8I/Z7V2KVmy24DO/XC1Z1dnHk3x6/RjJ88U5l9rR6I/aBvGD9Mu7cDjLPcjZPvXh074xKwxYtXt3sNx8TMMnfV3i9MONAfLM9AKe1IWIpX9206kE31cBI8/clEb1dO1ZS7zfgG9xZG5hQgNXzQ7sEO4ljmerVZSDnlTCSS5r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fu5+DH4v; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fu5+DH4v"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439d8dc4ae4so2882959f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 08:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773156035; x=1773760835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L2/koJdZK95rU0leujZRvjliJH2foHXtNc8nZYKdbVs=;
        b=fu5+DH4vdS5//oTEXY5n42LxB6JFULdB9TnqKe2hiAN3MCIp3QD3XBH2MPwTYGpBtL
         ZLUqOO4RwGX1Io8C42RUAJbFo4YpF5CVl6izWTXZPzsw0x0UHSzCmyVm+YNnDT2KpnsL
         gxFx8i54q7qjPTSViVAnWNR6FcTP0sx6zMX3UA8y/qa4LNnP1EWfTDbCGeO7q46zNU4l
         PU0y9gLIntkPPkovTH74JM29GdJahk7p7SE0JN/scj1yHdIaLbbPdrgNyNgxuGjF/U5q
         MFGm8D7IjSut3qaLBre7JjPzMD8DPbnLDna/P2j+cPTc0tbGaOySUZZ93c+civQpXDRa
         xuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773156035; x=1773760835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L2/koJdZK95rU0leujZRvjliJH2foHXtNc8nZYKdbVs=;
        b=dphdjRAxXsTOyNwe8E+O2IbBVF5+WXqkpqaV3fqnvvJWgif08L0uF63RXIRywFb169
         XH3XW6MbyNhHk2Z5utvbbiyK1jHHRqAtL8Z+AIwmD2fL5GkKIBCAmepOx3el3Vwt683y
         vezgNtoVGfkxh78QL2o4nFrLOsYq7WqBg0vK+/zGtglnBKtOZgOmATZVpLmJXfHz+A4N
         HNXEclTEccgvXd797sdrdM4+7fLYxBI1BYjlYVop49PnLDLYNuN0TrppKp1eQimKgc8z
         jTYem7HbWTAzjbZuTJ6Tb5Gd/i4UQl9/e+SyZb4beG3HMr7nybblI/Z33D4c/gDuqvEB
         7JGg==
X-Forwarded-Encrypted: i=1; AJvYcCVte0Ky9STumiNst45VRMkjg7EmIsfhDkmDp+Fdj+6Z9Ble6snpwQWx+plCAGymYYaSnFKKJT2wfaw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+aba/jLYuFURPJT7hvwe8Xxh91U6dxujiPruW9riwLHX+FF/J
	LQwft6cL5qBKw/ZsrG1+aM5x/y+4StYTrIHwaEx4fVLp+zJYwGlndT2gZbivmZgL4dQ=
X-Gm-Gg: ATEYQzyvWQaWFTMOC/rQAmp+gcNX1k1mhdvHVHswkITmqZjYLpeCNDDFsw/8P2ZsXR1
	Rp+6udm6u6ItLLXyPWYOizskqdpIzn9F7TOr6qXgMm31CPU/RMoZtZiiGPOgiLXa+l4P2zFol0P
	uBcjv/IMuIqvIUgDaNBP3OJSlXkZA9UKXaDUNMV+cdhzWsJuZCCLrGJrxCSeGpCiZxiNGPhcOkI
	RpuBh1KxoI3fCuZXSD8f9g1nySL5dADiOSAxkRauOEsXZMPbplcKSNnq6fOphYlTlkcmvHqm6aG
	1KIWSUxKRs5AWSSurfOTCyEzC+x7A2rltavg3l6VnMkE6uN+cjemWHjirhsxaXhkWMOBBLAmaMG
	141358io5i3Oh8dZUHD0E2ROvIjwUwLYgXvNf8U2jt7Q3K7BallUz3xMl/MDP1hi/ZTlTRaGU5d
	Cli5NF4bYCob+FWt069Q0Lu77qDQ==
X-Received: by 2002:a05:6000:2505:b0:439:b26a:216f with SMTP id ffacd0b85a97d-439da87c0bdmr28137929f8f.56.1773156034926;
        Tue, 10 Mar 2026 08:20:34 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad97abasm33722231f8f.10.2026.03.10.08.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:20:34 -0700 (PDT)
Date: Tue, 10 Mar 2026 16:20:32 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Richard Weinberger <richard@nod.at>,
	Juergen Gross <jgross@suse.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Vlastimil Babka <vbabka@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] kallsyms: embed source file:line info in kernel
 stack traces
Message-ID: <abA2wOsJtK-g2NxY@pathway.suse.cz>
References: <20260303182103.3523438-1-sashal@kernel.org>
 <20260303182103.3523438-2-sashal@kernel.org>
 <aasClESfxETxliLB@pathway.suse.cz>
 <aasLhbZmvcQ8sA9P@laps>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aasLhbZmvcQ8sA9P@laps>

On Fri 2026-03-06 12:14:45, Sasha Levin wrote:
> On Fri, Mar 06, 2026 at 05:36:36PM +0100, Petr Mladek wrote:
> > On Tue 2026-03-03 13:21:01, Sasha Levin wrote:
> > > Add CONFIG_KALLSYMS_LINEINFO, which embeds a compact address-to-line
> > > lookup table in the kernel image so stack traces directly print source
> > > file and line number information:
> > > 
> > > --- a/include/linux/kallsyms.h
> > > +++ b/include/linux/kallsyms.h
> > > @@ -16,10 +16,19 @@
> > >  #include <asm/sections.h>
> > > 
> > >  #define KSYM_NAME_LEN 512
> > > +
> > > +#ifdef CONFIG_KALLSYMS_LINEINFO
> > > +/* Extra space for " (path/to/file.c:12345)" suffix */
> > > +#define KSYM_LINEINFO_LEN 128
> > > +#else
> > > +#define KSYM_LINEINFO_LEN 0
> > > +#endif
> > > +
> > >  #define KSYM_SYMBOL_LEN (sizeof("%s+%#lx/%#lx [%s %s]") + \
> > 
> > I guess that this is used also in ftrace where there formatting
> > is delayed. We might want:
> > 
> >  #define KSYM_SYMBOL_LEN (sizeof("%s+%#lx/%#lx [%s %s] (%s:%u)") + \
> 
> KSYM_LINEINFO_LEN already covers the full expansion of the path and line
> number, not just the literal format characters. ftrace stores raw addresses and
> formats via %pS at print time into a KSYM_SYMBOL_LEN-sized buffer, so there
> shouldn't be an issue here.

I was curious why the sizeof("%s+%#lx/%#lx [%s %s]") was there.
It did not make much sense to count some "random" part of the
format string.

I expected that it was related to the ftrace delayed formatting.
But they are written to the tracing buffer, see trace_vbprintk().

But I believe that it does not need to be counted. It seems to be some
cargo-cult programming. The size has been counted first by the commit
d069cf94ca296b7fb ("kallsyms for new modules") back in v2.6.12-rc2,
see
https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=d069cf94ca296b7fb4c7e362e8f27e2c8aca70f1
And it seems that it was not needed there.

That said, we could not simply remove it witout revisiting the rest of
the computation. Especilly, we need to make sure that it counts all
extra characters, like spaces, brackets, and the trailing '\0'.

Ideally, we should replace the unsafe sprintf() with snprintf() in
all users. (>> TODO ;-)

> > >  			(KSYM_NAME_LEN - 1) + \
> > >  			2*(BITS_PER_LONG*3/10) + (MODULE_NAME_LEN - 1) + \
> > > -			(BUILD_ID_SIZE_MAX * 2) + 1)
> > > +			(BUILD_ID_SIZE_MAX * 2) + 1 + \
> > > +			KSYM_LINEINFO_LEN)
> > > 
> > >  struct cred;
> > >  struct module;

Best Regards,
Petr
