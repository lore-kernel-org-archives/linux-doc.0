Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79CA42B753
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 16:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778515825; cv=none; b=i3YInpcg6dqgU5v5BRfwRRYdKEtvRJSKxeAruTJARUG2EK69hJGk5+g3UyTuk4eHYLTfQvUnqjMTfvhR03WjW2aPT1HWgrCRKQCkBYYP+qPtZFoGZtiAlzEn5qQmsI/8+0JtCEjvb2zdMd0EdAUIgzZOYQrawLU00bUztVqhRc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778515825; c=relaxed/simple;
	bh=OmvtPFStqV16YJcLxeDtexAgfQAtOiiq7qfNn3U/6xI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AQUhm6c9c5kVKajx6ftj3pchWsujktUEWPhCw9M4twBCt3n7OzUMYuAUjF8rzM9VrPi8uCnZrK069OXm0oxo8BXOap+bNfN+Y42AeoNqalEPVZAmqTckfDD9gL3R6Da+/YIxiV61TB0zOF+dW6PfjElCQr1MyqE4Cw+RoBZCUb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BO4d5rk1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BO4d5rk1"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48e82c23840so10505215e9.3
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 09:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778515822; x=1779120622; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OQS2pqCl4CIffFZYG4lF0Zb7HM0F6Dphiww0tGWvLbM=;
        b=BO4d5rk1MeYPDxmoKxd3BVxwNwZoDHaUmBxmM34dERnhRpcwRJvHXAdxUgsvN44axx
         zdg85Dnv8bKwtz0j0hGxvSY+7tWXqghVrsiHif64QNeOBrusxHWzhQ2H5eU7iYdpn0N+
         8qZuMOm00YrI6mWNi5cpLC8/8CGzJ4k3Y7gnWy0MRBeybFsMguosxN+08Ed8rxtKpeq8
         RmNDdu9lb3iMakktHPhIpGw1JDBeiFb85gaOWD/Tk3YIPQiDM7CTha1qTi7fn3L1njE1
         qQ3y/VeCTwtgaYAB+3eN8QWi1lQXyxbEMW3cWuYo9yy2ym2E4feCIokzBmf5oguvCjj4
         SVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778515822; x=1779120622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQS2pqCl4CIffFZYG4lF0Zb7HM0F6Dphiww0tGWvLbM=;
        b=AQ8gkM8aRuYze73Ir3L9AlaeQTrZ7saFto96jNPrR2dKdlGHVmivklbJfIaMju7HFQ
         /4cOB9l+KMzPiGDgN4BYGCo5sN5FC5U6AgirJFOOkgRiCUTjtqI/q9DJmPrwJ5G80tOK
         mNSSyYMRyY93CFwUgC376KfgNQRnsWVrkjxIInZwmBs5/fuo/iaJRzkAD7RMWPq8umtA
         B60odxJmV5FPCkoYKX6fkxj0izf9qvfXbo/9+r9Sv7ytHO0J8FY9rF2CUxp3uRpvbwL/
         38pNwtNz0p6SdRTgEtMK3RAi7NduBft+LQB8ZU6g1ttt7AZkwnP/AJxXYw9/89nT31hk
         XS+A==
X-Forwarded-Encrypted: i=1; AFNElJ/pVtjVwcloxdBDTLG3psQFxhoHvbMoTigBLaHK721+uVG/x6PR2EvDp7PNn86j9WxtJideMBGwLRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVuX7dfR30ISbJATRYfA3P2S7WS6n+gky2EM7XHHn0nqe/FBhf
	lO/vQ0NBEFpFARKRW3FV9vQ7DXct2eJycL6EmbtQoBrFl5FWzgQz1FEupFnYo445MKg=
X-Gm-Gg: Acq92OERS+6CNnp5d8c0fDQFJvkhyYX9bqG5ftAlWXxDh/pjU6sdMXWILt+1lrSAeS+
	CPUJ/IWzraRl/46qABYuzsJSUSBf6ImBnGlY327iiNcrdrRHf94EIbw6aD34Ja5yv8aisp2qxF8
	3eHcLlZ4XYWqneXb+Zzo/sjwTAwZRb4nnEs6eGv0Rc3WP6/6I6zjwmNLL7jDrLdKCoDHcqgJUFG
	SOnl1W4eoi6U1qOAqT5wJQAxVHaBmIQNcXPKpxVzchyyKMqtP0BT68PcmkgpMrKPf02x/up1yCb
	K8ibC+kF3BdAkoEzvaWdcBo7CTNfFrnzjG7dSEoLo8Q9o9v/RQCVj+8ZZ1fn93IGxLwcdLHlq2a
	0WxwqO5F/P3KimQtNFAee7USV2/lX0rod7MUzWFSgLh7irFefMVXURU+qWkhKg+kRa+PXzmtF/G
	FfXkr7A+6UfoiLAEB/bxx0jUyj0qW9zES4uktVSQ9O+QnvvT0=
X-Received: by 2002:a05:600d:1:b0:48e:7f1c:8760 with SMTP id 5b1f17b1804b1-48e7f1c87bdmr94074745e9.27.1778515822123;
        Mon, 11 May 2026 09:10:22 -0700 (PDT)
Received: from localhost (109-81-87-110.rct.o2.cz. [109.81.87.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0c70sm214374865e9.6.2026.05.11.09.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 09:10:21 -0700 (PDT)
Date: Mon, 11 May 2026 18:10:20 +0200
From: Michal Hocko <mhocko@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Breno Leitao <leitao@debian.org>,
	Andrew Morton <akpm@linux-foundation.org>, corbet@lwn.net,
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	gregkh@linuxfoundation.org
Subject: Re: [PATCH] killswitch: add per-function short-circuit mitigation
 primitive
Message-ID: <agH_bGUTvWm2h5g4@tiehlicka>
References: <20260507070547.2268452-1-sashal@kernel.org>
 <20260508135630.a380e3c187b59e4c04e6f358@linux-foundation.org>
 <af5Z2IvtS5pVorSl@laps>
 <agG_PZ3qcl6TwLnL@gmail.com>
 <agHUp8ulaWJ75WU5@tiehlicka>
 <agHcFCRVSn5ra5Kc@laps>
 <agHeZPA3eHhJHIsQ@tiehlicka>
 <agHgDgwu8H9Opzpl@laps>
 <agHm9Vj7bPPCRS1g@tiehlicka>
 <agH7_QBPLWKTZucB@laps>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agH7_QBPLWKTZucB@laps>

On Mon 11-05-26 11:55:41, Sasha Levin wrote:
> On Mon, May 11, 2026 at 04:25:57PM +0200, Michal Hocko wrote:
> > On Mon 11-05-26 09:56:30, Sasha Levin wrote:
> > > On Mon, May 11, 2026 at 03:49:24PM +0200, Michal Hocko wrote:
> > > > On Mon 11-05-26 09:39:32, Sasha Levin wrote:
> > > > > On Mon, May 11, 2026 at 03:07:51PM +0200, Michal Hocko wrote:
> > > > > In a similar way to how they would know if a given livepatch is safe to apply -
> > > > > ideally it would be communicated by the vendor/distro/kernel team.
> > > >
> > > > You have missed my point. KLP takes an extra steps to make sure patching
> > > > a particular function is safe to modify or to put the change into the
> > > > effect.
> > > 
> > > Safety checks like making sure the patched function is on the stack, or did you
> > > mean something else?
> > 
> > Yes, exactly what LP infrastructure already provides.
> 
> But do we actually need it here?

If not then you can simply systemtap or use BPF to inject the code. In
other words we have several ways how to runtime modify the kernel so
before yet another interface is provided (with a non-trivial amount of
code and very limited functionality) you should really start by
describing why none of the existing one is fitting well.

I do understand your argument that solutions based on loading a module
might have an additional step to deal with (AFAIK you do not need to
build your own kernel to deploy your key) is that a brohibitive
roadblock? We also do have fault injection which is much less convenient
because of all the existing constraines but can those be elevated?

So nothing really against playing with ideas nad LLMs to generated a
quick PoC. That is all good but for this to be considered more seriously
I think we really need to think deeper whether the existing
infrastructure is really not fitting and if not whether it could be
changed to cover more usecase like the one you have mentioned here and I
believe it is something worth thinking about.
-- 
Michal Hocko
SUSE Labs
