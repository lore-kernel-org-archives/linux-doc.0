Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793231504;
	b=sGl6rEV/8xKgPccm+Sy/f/bb/d3hTw7vAGdGeFH9XI1HmXfSfAS7OWi9VjEaNwZ1d/vw
	 DzDga+Kj03B569IUYObFBqGYoP4oFP8IRcBXkJTwDbWGRlbtGQlb5eZ0nFmc3Yq18mrOp
	 AQBy0tdq05d5lS/yDzmAXs5tEgAloSS/UregL3dn6O3mCh8zQIY3tJr0NH4AQqq4aD7sj
	 RHfhqRlrRMX09evU9wCtNHpkXl3FJU20yCAyrXaVyLNQQgzjEZyfOTBPK4rABq+FldjJe
	 dEpggRTzVq/oM/DT8Bs/K818lb5U4fLrh8YTjfB/2GgeVbfdFcrMepV/kS2XRnWfJuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793231504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9aqlUca5Z2Dix4R9/uyjhIevl9A0MEDe7rswOfSHfFU=;
	b=fAELBQPUTPeVR5luG8XgnjghMlcxngp+sgRGIv3VII3EObhT2wOzgFid93uICF0fEKhw
	 IBAmRj+6NcGn6cND6zXw4KJ4byoFfUXdmVmcP2IAlJUkzMJSnpgNdfgq0ZwLOyi5JJaLX
	 FTl8yQ0QEtfqwaCOsg/+K8mqL4gDQIyXSsn5oVofgLrXokdqS3inMtnG7hIv02nsNOZG1
	 umVhcUme/BSyMxnmvsr3xCDfZYW40ek1Je5yXtG44vEtjOybaAugg2byVjhjk64+Kxevi
	 wRjHf+VDibD+lNnXamjvzaX22+CYL8dgYTcntmKL37bRgZocN9p1PFTRMphMfRxD//Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osandov.com;
	spf=none smtp.mailfrom=osandov.com;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF05606A322
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 23:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDF05606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6de0079fe11so75899eaf.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 16:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20260707.gappssmtp.com; s=20260707; t=1793231502; x=1793836302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9aqlUca5Z2Dix4R9/uyjhIevl9A0MEDe7rswOfSHfFU=;
        b=C6y1l2pry9W5jC8gMQqyEXs572O1glS7gJwNi5E5Pev3o3fsisHScTM0QjjoEJ4UIc
         q+dXK/EnfJdMD0KGixsCI/tc7DwWwOrMLeB5IWNAEUum9mqVmBb2EQUvqu+GHhNisDP4
         wTJGdbOSOfv10TFbp69zQ+kzsjpMSfaFK6hliupd/RXptVPOclpIHN4ON1CBiGwmfbIV
         eMLIK/GJdvW4bfnY6+m1YuwbTDajAVyLr10mfZv5eV0OhzlsBqN2Qh44Dr/gdhsP5k+Y
         TkXVulmHTkhXdURBZwGvOu9avbrR08xNr2xqvRmt0v/7YkMLxpGq9en9VU0BeDn/wCf1
         JJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793231502; x=1793836302;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9aqlUca5Z2Dix4R9/uyjhIevl9A0MEDe7rswOfSHfFU=;
        b=ImFKAwqraKCLLdeZuXS0DgmM67m+gQmYiP3/NFFcvIZpeOLdbm11a3hi/3yGfJuvun
         udoWDuU3HG8ohx4mR1NSWUNmRpVUf60RR+YwV+9uZ0IWNLddEjhOOWMORHSG+WC0Vyz2
         GbQimLQ5rpdYl7SLM4Y7k/6j47l8ug5o3TQkh4UeiLknDisMGfewM6g1DjKDRZVrVGC3
         3HrUIM25WAMgU+uE4ZIlQ0+UCbmTJcihykM9fbjEpo6Y2975U1UhNDVUYBNWkJU0d74s
         SSwqPQ1zEpbChvOLtLST+HRJJPUaO+UjbJpEk52TUyOqSPrN93Tpwv5U/wReHhZuFC2z
         7dFg==
X-Forwarded-Encrypted: i=1; AKwUvBy6xs1Rdjgvc/V3yiff2aNBrWFbKuylB5IDqom4C9+0WmCo//ill6no2FIlj9MLfSLIa6gyaYY59Dw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1tTfJX2c2RspHNwZJKDF6Oz499qzdbW+VbgDLRfDz+yetGgZg
	oAHyZG8RBietNv64Cfb1p7y+KIoZznt9ssI0O//I+xqwzchprVR8rMYEjvLxL8ErE0E=
X-Gm-Gg: AYBFou20RHYjP5zNgi5GlMAY6/gDxb/BR8fCe+BTMKo20f4F2Yo0zOszZtFuTY+4ER6
	B6jNY8prpnngkMgEXPf2b6vRbCDY5cgmG6omMyI9Jf4Us+3H7iMBWGXzbTPoA82/VKNjjj8PMzU
	7ywecRgv9CzEdrjhsjpQ/gHNiGe9C7OpYbttghCXT/z2Jw6VL5JRsRZkjI7LpJh1OuQfz+5RC8C
	r00XhcgMa/BwJ6H6TUONgADOBf13XghR8m2cNhEZM+0jWYbz/sxwgI8joiaQDNGnR6PUoeh62Ap
	4Kj1CZdtmTG/0YA31+7PDxTFvczZKEAzeZ0f3hQ0P2E+DQfNDfLK7JseITB1LJh0CKWPHC+TDuL
	TXac7BzkxUUF+WB43dZm7kjyLlyPnUrC+Jkl76Mx16AcTwRQAqYsHgNXe7QbHlhNjpOFpQCv6p1
	ggzVAs8OP0fP+LABtiWXf6xYddbvWfUDcylvK1eEkGu5SBB01SuDp/At4+4MpiIpGA7F4mGahXs
	vg188Xps4fIHFGP7JT5fQCMJZlff5rxNhoN2r9QF0Y2hLre+vncZ1w1sten9yA5NJ3oOFVOeDmv
	gs8OmQqrh4UJBWIfNeFDDFsrCgJY3r2Ek3+Vk1PxCaULq8giAHNkr1HxLyW54OrIbvfdyVDVKZK
	O0HE=
X-Received: by 2002:a05:6820:6204:b0:6f6:5595:915e with SMTP id 006d021491bc7-713ee85fbbemr3135112eaf.1.1793231502506;
        Wed, 28 Oct 2026 16:51:42 -0700 (PDT)
Received: from os-N5J97HY9XQ ([208.184.142.138])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71426f16f66sm2615609eaf.0.2026.10.28.16.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 16:51:41 -0700 (PDT)
Date: Wed, 28 Oct 2026 16:51:38 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Chris Down <chris@chrisdown.name>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-debuggers@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] proc/kcore: Allow disabling /proc/kcore at boot
Message-ID: <auKKisespDm1xLLg@os-N5J97HY9XQ>
References: <auAmuqZyUodq3iqk@chrisdown.name>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auAmuqZyUodq3iqk@chrisdown.name>

On Tue, Oct 27, 2026 at 12:21:14PM +0800, Chris Down wrote:
> /proc/kcore lets any process with CAP_SYS_RAWIO read all of kernel
> memory. That's a pretty large read primitive for anyone who obtains
> CAP_SYS_RAWIO (and it also gives away the KASLR layout).
> 
> For this reason on some hosts we want to turn /proc/kcore off. However,
> on a kernel built with CONFIG_PROC_KCORE=y the only ways to block it
> today are lockdown=confidentiality (which also disables many other
> things we perhaps don't want to disable), or LSM. That's annoying,
> because on the majority of hosts we do want it on for things like
> drgn/crash, so today we build two separate kernels.
> 
> Let's add a "kcore=" boot parameter so that this can be disabled at
> boot.
> 
> Signed-off-by: Chris Down <chris@chrisdown.name>

Hey, Chris,

The code looks correct, but is there a reason that /proc/kcore
(CAP_SYS_RAWIO) is any more concerning than other ways to read kernel
memory (e.g., CAP_BPF + CAP_PERFMON)?

Thanks,
Omar
