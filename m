Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E45313AA3E
	for <linux-doc@vger.kernel.org>; Mon,  2 Sep 2024 16:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725294588; cv=none; b=npjrWPc9OQS1U6xcJ9dq/UXvvdPMxnWTdFO7/W4fXNydkJmqc51pC1A9KJITP+FNADwDApmn89N7aBBVPoR41PMWonmB8ypL0bfwJigTsDuQyzbx7CIkUdPjBukL0guj5qpMP0l7ss+GN4UYY7IvSQQiqPO8w++VhbDMp0BMoOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725294588; c=relaxed/simple;
	bh=H9KQi/YeoHXtFjvXAZTjfZ0POvVPW/truEu9aI90Uvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jVClnMYzWVGcQ+0XzJ4/5GSemj5IW8+cg+Ki4H9m86Buc3T8bGt100VwYYcopgMmOBRRmv2O5iTEgrWSD+Icu045+OO+sBm0PG2/nuR4BQABhOlc192X1WqiOftKLFqL/Zqun6R0pkVZSH0mdBbeYpAFZ6H44RMEGImb91FBlgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=VtFKIPq5; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="VtFKIPq5"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53346132348so5461568e87.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Sep 2024 09:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1725294585; x=1725899385; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7kIi9VgkWI5peIYLMCXIR56ai0Kv2Eq0SSJ1yh02a8=;
        b=VtFKIPq5bE1LJoYFrtPjyHh17hBOH0OtCa+BZK6MrQRe4Fj/57EvwWeJtJ8jix2lE5
         SfzxE+MdeOAgWsaRgjKUWcLaUBjFJyTR7GqZPwmmepB5zfhoiAhRd9CQlb+WQmycekcQ
         ESt0m6kkrg6yVIWYYc5WHFVQReiGoh98B8lAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725294585; x=1725899385;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7kIi9VgkWI5peIYLMCXIR56ai0Kv2Eq0SSJ1yh02a8=;
        b=u8QD/Qw37qa0shtsUYsthFaOtZjm1uYiYUN4/2lC7iJG5Dqn0msl3ODP5ySU7p34Nk
         mVsqJfCGoNlaEW5XH/Mm6p5NRDZgYi+iBhtdgub3XJYY/ehhb3XVK2Noh+SRMxQP3iY7
         Yuxx9H985Kxv2UlDOvaVxnnVcp7KjKbSYq/TC9WX1+VbOQSbgWfzGHT6JGV0tglIo64J
         dA+9esJ53zdWwcvszenGomLwQ17MgWY3HCDDx+1p01oL1rqMpoRQMsEfR2bZibQ6n50r
         hwv0qt8ygEOosv8rKnBgvgq1sDC08zKNBy98lDozPqcYTRtauxshgGNJBxCz3Hjsq6CQ
         UEPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU48l4C3rLTheX0WlE2XtFKJiAcShqdGhtmRwp+PhMi+GBQp0mLBITqHBwdvMpPxbj49fgkayCgfaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQONVE0rPOhRcYeBqGuUw9acuCESCpbkO1whHUePaCRauvSIKD
	8bm8CGlPtxjaqM3eitXrlrDxTlt5oFIlufLc7PKTf7D0u4s5y/p7hyQIB4/3k1Q54GUNZJUc+Kg
	BAANVAQ==
X-Google-Smtp-Source: AGHT+IHBcGBv97yqXC1II5Ix1onhTrpJagjB0ibZGEXN6my9qc0EYW1Y+PYnB4ikwCdSQkl4/++2ew==
X-Received: by 2002:a05:6512:3f1a:b0:52c:7fe3:d3e5 with SMTP id 2adb3069b0e04-53546bb0855mr7068398e87.50.1725294584621;
        Mon, 02 Sep 2024 09:29:44 -0700 (PDT)
Received: from LQ3V64L9R2.station (net-2-42-195-208.cust.vodafonedsl.it. [2.42.195.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feaf3fsm579944366b.40.2024.09.02.09.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 09:29:44 -0700 (PDT)
Date: Mon, 2 Sep 2024 18:29:42 +0200
From: Joe Damato <jdamato@fastly.com>
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, mkarsten@uwaterloo.ca, stable@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Breno Leitao <leitao@debian.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: napi: Make napi_defer_irqs u32
Message-ID: <ZtXn9gK6Dr-JGo81@LQ3V64L9R2.station>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
	mkarsten@uwaterloo.ca, stable@kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Paolo Abeni <pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
	Breno Leitao <leitao@debian.org>,
	Johannes Berg <johannes.berg@intel.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
References: <20240831113223.9627-1-jdamato@fastly.com>
 <CANn89iK+09DW95LTFwN1tA=_hV7xvA0mY4O4d-LwVbmNkO0y3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANn89iK+09DW95LTFwN1tA=_hV7xvA0mY4O4d-LwVbmNkO0y3w@mail.gmail.com>

On Mon, Sep 02, 2024 at 03:01:28PM +0200, Eric Dumazet wrote:
> On Sat, Aug 31, 2024 at 1:32 PM Joe Damato <jdamato@fastly.com> wrote:
> >
> > In commit 6f8b12d661d0 ("net: napi: add hard irqs deferral feature")
> > napi_defer_irqs was added to net_device and napi_defer_irqs_count was
> > added to napi_struct, both as type int.
> >
> > This value never goes below zero. Change the type for both from int to
> > u32, and add an overflow check to sysfs to limit the value to S32_MAX.
> >
> > Before this patch:
> >
> > $ sudo bash -c 'echo 2147483649 > /sys/class/net/eth4/napi_defer_hard_irqs'
> > $ cat /sys/class/net/eth4/napi_defer_hard_irqs
> > -2147483647
> >
> > After this patch:
> >
> > $ sudo bash -c 'echo 2147483649 > /sys/class/net/eth4/napi_defer_hard_irqs'
> > bash: line 0: echo: write error: Numerical result out of range
> >
> > Fixes: 6f8b12d661d0 ("net: napi: add hard irqs deferral feature")
> > Cc: stable@kernel.org
> > Cc: Eric Dumazet <edumazet@google.com>
> > Suggested-by: Jakub Kicinski <kuba@kernel.org>
> > Signed-off-by: Joe Damato <jdamato@fastly.com>
> > ---
> 
> I do not think this deserves a change to stable trees.

OK, I can send any other revisions to -next, instead.
 
> Signed or unsigned, what is the issue ?
>
> Do you really need one extra bit ?

I made the maximum S32_MAX because the practical limit has always
been S32_MAX. Any larger values overflow. Keeping it at S32_MAX does
not change anything about existing behavior, which was my goal.

Would you prefer if it was U32_MAX instead?

Or are you asking me to leave it the way it is?
