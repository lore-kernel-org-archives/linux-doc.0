Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807105;
	b=DRhSMsFXV2aUePO+9aG1YWgtvmXDMArb3Jt19kcpvfMLOy3FOaQCg1A3op7A5l+KHXIk
	 21PzQZyh5ogdY95sz/ikHj6sD0+P9MeIPDzXuapf9eFqje2VNzSt0RCRhtH44yS2VuRAa
	 ByqBNN0Z80wLQLae65bPIS4e+piy1i2+Jlqj0PEjfhXY/fGo9o9gmKSI/XYU5/0xzCSNY
	 Naa3/sV5cQldwlUmstlm9XfnoQkYbEUD8+AdjCGyVxNYWlnaASyeqVZ7Urw1JBIeZao/0
	 pXhaRx7xfTnRLgilAH52Ee41moS3Oy9Eyr3/96hd2qqPp/GBas4wmeZjPpsSqWt/IHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=W1FdGtSZDb7NmxvDylEt54duEw4UgMOOnUX7lvsLEnY=;
	b=2xnVWsHVs4j05mGcd7kQU25MRkuvbH6coqhUB6RBG8lATFWivOxGzLlGYsMOF+COkALc
	 ar/9roMjiZTgApjFRCGTYvzwc0U5cnkHrdigYjtNFB7NSvwUdZstJBZ2kqBovI94UyN3J
	 3BqGYcECTLU6VKmBV8ak5SamGZ6NIWTx6e7izA5pvk264nmdpVHZD/7qygmYw/x1f0GaG
	 B5mG+HJ2ilzqNaGu43DAzdWRizlfD4N78lpnY7a+igKKMyjpLleeKadgAQkNFFsN3tN9Q
	 /xW0dMTDW1oLMGIENSF+jYKw2/PpbcD+SYoKGyOf0UKqjRYvWbmROoPyhwzmggubvKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Au2hPQjf;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0340A606A324
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 19:18:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0340A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Au2hPQjf
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-94961d90b79so851100585a.3
        for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 11:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795807104; x=1796411904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W1FdGtSZDb7NmxvDylEt54duEw4UgMOOnUX7lvsLEnY=;
        b=Au2hPQjfRRLKqpzLdUlS4qTuMZfutWDMs3nxeZ6kBFtz5N2Xk2LtgNA1S5U0oOtM1F
         pUH04r+cU6kZ0kDgUOxrstM7z2Im5gAyxPSe4aD83cFjmAwAj+Fkxac12C/8nN6ofeLR
         MFElkoYfleQYMRT7phF4+sDQ9A/GDPgp08AagWSlO9SiwrCyijC940FqmwCDAQns8SPF
         vr8fSP2KNc3B6d+8S0JwcH7uT18lonZeGkS87z1MJOqJgxKlovDuQgZgrTINI217fher
         UuRXmrGlqd2cTXfhETi+BHgGNRW6PAqgPj4iVvWnFYjeFdjgAOpMLRYBPKKqoDP1GfuD
         ymIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807104; x=1796411904;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1FdGtSZDb7NmxvDylEt54duEw4UgMOOnUX7lvsLEnY=;
        b=vI4NInMwfkp2PPkYjq0hy9FlZ0tICju60A5lKaQZQmz6mFPi3kXxZJOk4Gxi2Q9Sc/
         yJ+Ffvmi+VoZkV5bMkCKfLLE9o7Eiu+vpw5TpLueA2DdQM7jg1jnfYH6ZNa4xH+uufFF
         Uq0itFnj1Zhu74+j6Q0I9Cz1XMgP96MrKkh6kgf+rvoG2488DKxGzzLvVShAXAVCDD7f
         X6uDVEG7owMfMhw+Uf44OY4X2sYi/cBZ/RqNvuYZQ096nUUfib83OiYP3YrbahZRFY04
         nMyFFndYyoqmd7TXHwPOt4f2ioqS2FMGrDLat7oK2zYKXDQHBhNid+ZRsUuVhewP52en
         5tWQ==
X-Forwarded-Encrypted: i=1; AL+hErFZpPySZ8TmoNUMZQJIAlO6itLgd9JxikWkD/IDXgMOgeV8H9pUrgUN6GSNNkrRsA/aPQHIlinu0aM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+t687ulXji4MzfYV1XzyPSRnorSsy1JWTW+Lak2Gh8YnJpEY5c
	Jfm48bYiCn+0fPW6EfrXQL2FQJzskyDpBIr3GoGawe78BPq/xEeSTgvLibxHDYdd61U=
X-Gm-Gg: AZFdTZekB9YDIOvVrH7riX1MZ21XfaZCxQyq9MCh303qIy22rw3NJeaUe92cz8Oy02/
	WKWHKy/9z/ED6c+NrODm1/UklZ0vmSbErZrsmXd6L222qiGMVQxJIInBV4b7wUnRg1KtUiXpvaG
	rTRhzICkXEPcCbrkjf4Hm+ooU/+R5CoKCdu00oL8ttv8Zbpd9pDqhOpQ7SnOelQR+HedCW6T/uA
	JmowB4bOONMQlRyUFFbVphw3ihDjfqgcbvxwu5oOuEITwFDBl8zhAUuPPspFsPW2VvlPAkJEkzF
	H2PWL35wfKpQxITxz3Gp3sOh06RkVaLOiFGxOJr3sHACa+q6KdAplxQtqTABIisbgpZ9XGPKthK
	Z1Ak/rmvx3cKQaZxgAXGu7bRlljQDxpoMCmHjGVmmcf2Y09qRAA3ieUDrr0BHicV0biT/PjEiC0
	OmlElcWr8f+gWIoPxtYvYrV9O0Hl0gt5f30AL+FzyJ9MGK8wXy23LkBfacopSCp4yeRhpVqrls0
	/sberQ/ulJezzqpVRKzY0fbOi1z5e2SXE1e4FB9i9Tvld2ZZlaI9rcLWoLXFkV9W75vtFshUbay
	9sEDIA==
X-Received: by 2002:a05:620a:6f0d:b0:939:6dea:374d with SMTP id af79cd13be357-949ba9d1fa6mr4395559985a.49.1795807103939;
        Fri, 27 Nov 2026 11:18:23 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb418241sm1867466985a.38.2026.11.27.11.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:18:23 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xX1Sg-00000007nGK-3YSV;
	Fri, 27 Nov 2026 15:18:22 -0400
Date: Fri, 27 Nov 2026 15:18:22 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>,
	Pawel Chmielewski <pawel.chmielewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>, Len Brown <lenb@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RFC v3 7/8] attestation: providers: introduce CCA Guest
 attestation provider
Message-ID: <20261127191822.GA1856591@ziepe.ca>
References: <20261127-arm_cca_mr-v3-0-df3230afce8f@arm.com>
 <20261127-arm_cca_mr-v3-7-df3230afce8f@arm.com>
 <20261127170722.GT246011@ziepe.ca>
 <awnK2c3kMq8p2a_7@e129823.arm.com>
 <20261127183550.GV246011@ziepe.ca>
 <awnV5S703Rgf5sh5@e129823.arm.com>
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
In-Reply-To: <awnV5S703Rgf5sh5@e129823.arm.com>

On Fri, Nov 27, 2026 at 07:11:33PM +0000, Yeoreum Yun wrote:
> I think the problem is the *max-token-size* could be changed.
> once the LFA updates the Realm definitely the contents of hash of
> firmware binary can be changed. this means the token's content could be
> change including the *max-token-size*.

I think that is broken, there is no good way to make that work in a
sane manner.

LFA must stay under the hard wired max-token-size limit, not try to
change it while a realm is running. Take this to your spec team.

> For this, the RSI host call interface has the way to get LFA eventlog.
> IOW, after LFA, there will be LFA log is genreated and then for the
> time of re-attestation, it should deliver the LFA logs together.

The detached event log is even more reason the token should not ever
be changed by a LFA.

> > I saw in your FIRME series a solution to this problem, I think that
> > would be good to get out on its own and apply it first to RSI as
> > well. We will have the core RSI stuff, the realm attestation and TSM
> > driver at a minimum..
> 
> Hm,, Does this mean do we need to create two device one for TSM and
> one for attestation even the functionality same?

They won't have the same functionality. It will be the same as you had
with FIRME where there is a driver doing CPU attestation and another
one (the TSM driver actually) doing link IDE.

Jason
