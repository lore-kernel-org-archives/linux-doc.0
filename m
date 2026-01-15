Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA74125FA0E
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 02:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768443092; cv=pass; b=UeliHWpoPC5CcWGD7wsbRq6G6l6lFotIaBjygt7LGupAiRmH3wcjg0v+PfrSLLoSG1/FOrBQesVCD2uRJ5Bsq5nwXlzvqSn4/KBjgQhgGR6NzGjGfkPLc7X6DvD43TcWjfoeT7MAfhj6f3bAbLw7HLsQx8TcuqgWCQvd/oshX7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768443092; c=relaxed/simple;
	bh=GU9gFbsEQKP3YK7yys92528/fDnsy2Fkse95G/VoLxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F80En5idMAIrDBLIyHHInbHaMYZ9adGmQ/4Rca1wJX9YooQOk0XfB4qzOAVrbrP6VlFOeG7Z76idh+i2o/tzrHksl+Umj9oLlLwEXsRoychQB7mFb7/gS1P7D+UOmy/1cWvEptoV0RlMH1/kh2wr3XeE27cJ9Lxjd1P17DH4S7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LmS0Affo; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LmS0Affo"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ee730612dso31775e9.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 18:11:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768443089; cv=none;
        d=google.com; s=arc-20240605;
        b=exQLAS09IotvWFUfQUvLzexymE0fZL/H3PQJd6f42MI6yx0hi+Y1Caq5LscGkX1ugf
         UNKlAY2C9i4215O2jyc/taCynse6GdWKDJhXQJDII3LBE4343TXkO9cwClcc2SnulFw2
         9pEGVg8h/au5j4FnkBhsVt8TqbAIW0M4wLFV/Wb4xe1Rc7WdONG/uMf00IsfoUWzuPsw
         X0OCsCXOybzrD+9eXnPonEKFGdpDJ5+8wUwnS9QjTqKb/2wiIh06A3tFwggqvkOL/mUl
         uiTNPtszp7jab3BRuuZCRL9l75i3OI/kdWcmt8YuubLq7kJ4/NjWrPAzmVAQSAnxKmUu
         xycg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZB2Tkb2iBFUCMnkjohKuozepoklzEsrHClEgCnaxUK8=;
        fh=p2YHRIEdYEVRcVkuqkEvdpoRPgVPsArWYz0dMqHDpYI=;
        b=bkJq9ziFQqrMeVoiWxfcPS+97vgbvkuTZD+tWVn7MvzlSh6ZJtWq1Qy1pCv8+6bENA
         xbr5cRj3kgKCwAgMXHFfiDUhycjfRbDWa8Lcl4fAquDFFFiqBbZhJSgCoUHmkpxyMQFX
         ogQggbGUeZ/qLrDQWxJJgrkh1U/OgRp1hn2WHYdosXv1rYE9CUOaoCUuWJIoOGSBvUjT
         neAQDT+nuys1SkEjW4LmT2Eea3K4exgGVnkK0lVD96jrZdzTIJTBh+IX2hSzEjRuN7eV
         YKW6HNPFQGLByIpx/h5pvpsJjfqmTbvEwxqJn2SoL3oEvca3LT/3wDVYfA7mkBcF0xOG
         N7dA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768443089; x=1769047889; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZB2Tkb2iBFUCMnkjohKuozepoklzEsrHClEgCnaxUK8=;
        b=LmS0AffoT/V7muaWPbErujyQ9EZhZwsVdqJezhlprALRNlWGEGnblSid/8PNZs3ovp
         Tu4Yt59SIvCL5mxa+enNHB7sJcPlQyfeLfKeLJVYmDuwhMeQRnm5Cf+Z0m2m9zA+0y35
         8rNAjRkzHv0f1P2ZLSUGdi5WLY2vl8ClruB+Tvy2JX09/QlxobkliRqCmJ0k7WiKh4lx
         FsXzBEPj+PhFQf3biVL1zwuRc02mqlke3KTWs8IytnKFzZp1CjJ7TfAmjmO0wqzPfmAl
         rbBsHYc19c7G8TYXwuWoKbDXwApIbmcITOOEQT5mdPfign0qZgEZy3WjkxUGmYk5XvfC
         e6cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768443089; x=1769047889;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZB2Tkb2iBFUCMnkjohKuozepoklzEsrHClEgCnaxUK8=;
        b=GYBotrq0vDqYj4UylohSeay3wqUmvcC2fEqlfyEub/ChGbMt9EX091DAwGJMo8QPWc
         JusJLJh3qnfQnN2mmghWV9XVj+B/wSPKep438tAQziZUEOsahR/6Lw8GRopLPe4TfPp4
         Uwj5jN5ImJTFaV1pRfszIXayQoXPmcqfTK4zz+Ju5Xq0G6nYLUuCBcsKBdVd3tdFSpQI
         tExxUOvLb08fPHTmYG8BoeAtAf2VzlQ5gGGGxWO6XkAgqZBYNzT1y5u7nfyNm7IfuBu7
         B6D0FIkyJxi4pct1lk/Iu6+zrZkgwDujvVp9+xa+ShnpkwvD9wpneJzV+Aqf31U3dqgn
         eiyA==
X-Forwarded-Encrypted: i=1; AJvYcCWepBfkSvcjzhvXFbur0uRTJ5CBiHPfhkb5zJV4Z6KzMscBc+EciRQyratcR+NbPLM74Af/y8tasTs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx52hWJFD0K/g5cVdr1Vk6G71ev8Ckvbe+9s6Q15QXUeA3k1MmZ
	ZJsBD34efPJsuPIbzPwkkOrWBuyM7IddZLLBbpKHjQJaQCWT0rcFuTH8cSK8bJPNH10tIYIoAJg
	ucAOp7nG0AVpbPOmxH+evHMlxOzQycDfEWuvsPNGX
X-Gm-Gg: AY/fxX56kCQoiJO4bsw2Xh28H1Xw7l0DEwHUsUxjlr2vX48RPg4QuCZ0Y0kjNixEje9
	VhKGdo2kuCWblom5joCC4kcxOouqtK2vUMuLphF8u0l3wV0q6Pfr0q+LNfDF2CQGknXi9EBMf7P
	d3ga2xOMRJ7Xd/vagj+5bj9nj2vK1Mvg8BNAHh+vHKCpppfMd73qeo7u8U+gp9t7yydw78x3BiB
	SbaTux2E2W7fvy5I139t6jemA9Q5z6MLZUauLqvSe9fa4B7JGRPBdS+O/I93zYDNUl/O8OUMeOg
	uKF5AOW4UdAP2Cuw/lCTl44=
X-Received: by 2002:a05:600c:19ce:b0:47d:6b82:d954 with SMTP id
 5b1f17b1804b1-47ff94e9861mr213485e9.5.1768443089055; Wed, 14 Jan 2026
 18:11:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114145243.3458315-1-lucaswei@google.com> <d10116ae-fc21-42e3-8ee0-a68d3bb72425@infradead.org>
In-Reply-To: <d10116ae-fc21-42e3-8ee0-a68d3bb72425@infradead.org>
From: Lucas Wei <lucaswei@google.com>
Date: Thu, 15 Jan 2026 10:11:12 +0800
X-Gm-Features: AZwV_QjxHuOYFBK_XIX3hZH91ksqeZtJ2lgVboIBtf45I2RCXUJSUGcAgkAQ8Vg
Message-ID: <CAPTxkvRXmVB9MbPX2vkyhAnLDyJX7YviekOH=y3EcS_1e796Zg@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: errata: Workaround for SI L1 downstream
 coherency issue
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, sjadavani@google.com, stable@vger.kernel.org, 
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, robin.murphy@arm.com, 
	maz@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Randy,

> > diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> > index 8cb3b575a031..5c0ab6bfd44a 100644
> > --- a/arch/arm64/kernel/cpu_errata.c
> > +++ b/arch/arm64/kernel/cpu_errata.c
> > @@ -141,6 +141,30 @@ has_mismatched_cache_type(const struct arm64_cpu_capabilities *entry,
> >       return (ctr_real != sys) && (ctr_raw != sys);
> >  }
> >
> > +#ifdef CONFIG_ARM64_ERRATUM_4311569
> > +static DEFINE_STATIC_KEY_FALSE(arm_si_l1_workaround_4311569);
> > +static int __init early_arm_si_l1_workaround_4311569_cfg(char *arg)
> > +{
> > +     static_branch_enable(&arm_si_l1_workaround_4311569);
> > +     pr_info("Enabling cache maintenance workaround for ARM SI-L1 erratum 4311569\n");
> > +
> > +     return 0;
> > +}
> > +early_param("arm_si_l1_workaround_4311569", early_arm_si_l1_workaround_4311569_cfg);
> > +
>
> It looks like all other errata don't use early_param() -- are they auto-detected?
> Could this one be auto-detected?

Sadly, this can't be auto-detected...

In my v2 patches, thanks Marc and Will for pointing this question out
and we don't have a reliable way to detect
errata in runtime because Linux generally doesn't need to worry about the SLC.

Robin also proposes a few feasible ways(SMCCC, top-level SoC/platform
compatible or kernel cmdline) to
enable this workaround. But, I think it would be more straightforward
to let the admin to enable this workaround via cmdline.

> > +/*
> > + * We have some earlier use cases to call cache maintenance operation functions, for example,
> > + * dcache_inval_poc() and dcache_clean_poc() in head.S, before making decision to turn on this
> > + * workaround. Since the scope of this workaround is limited to non-coherent DMA agents, its
> > + * safe to have the workaround off by default.
>
> But it's not off by default...

I think it's off by default.
Would you point me to where the workaround was enabled without cmdline?

Thanks.

 - Lucas
