Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5D121265D
	for <linux-doc@vger.kernel.org>; Tue,  8 Oct 2024 18:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728411572; cv=none; b=GVKKpcD0ASouLR8LAM7sP/sfWuUjo31gEOwSVWfqMQlANBmPzUzJrFPGjSqo2TKVstvKCksjENt6GlhFwaNZ82PPW7vyon9m90+JjDzOEWWrMFudsvpWhwwgw2uKW3BvwUn15HOmHaJSaKyXoTvF/kRYW7+KlXkBAPx8uTnklb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728411572; c=relaxed/simple;
	bh=9eYP7A5/N0DO/nX/nAr52PXSj6ehjX4WQjbyfcs0Zi4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EZM2FmVtXAm09tAijxNy/gTmTntbh1dSnVviONE7toQPYD6q3Oe1RTLik+w1xfXD5KDYSGpk66kF74a6tLNJcptG7CSgpUibsRNCZFQsSxUp7XJo4X6ScfTFf27T0x/lpMI41jjXuOwICUxl3E1gpIqij048o4v8bsJ2+x/qd2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=D1ANaV2f; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="D1ANaV2f"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20b90984971so61294065ad.3
        for <linux-doc@vger.kernel.org>; Tue, 08 Oct 2024 11:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1728411568; x=1729016368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCz1Qc+MHmm+VZJW/bV/ivnW5CrYlGd/Q98fG900he0=;
        b=D1ANaV2f9CAjU9BMJi6MXuGQPoQgcV6RE8hOsqul+qOW0CVrJYkVZZNwDLo/lZxfX5
         2d1xCt2a2evdBBG8T/0eEHWYAcJssoGoyx3ahsGSUQNjQ7vwFpLiwB2TMJUJjE7gF+tk
         2CzyqZZBJxOBIFFlgTk7Hj82RsDX0bYMpWtss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728411568; x=1729016368;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KCz1Qc+MHmm+VZJW/bV/ivnW5CrYlGd/Q98fG900he0=;
        b=TJXeMaLc3fQr8zXUW6ifu+hVSbvh4ZPfMutQ2C4l7RNBA54L26SP4uSRIiCNkm+omx
         1v+GnOIrnq5wsltmNfZRkMACYl24EvfV4g7hyBPKEeYkJCcNwhjCFLFSI6VFgHWsnn2p
         wlYu46xkWHwRFNRXdOCUU6XdZCTn78uAoLbBN/OZMegXFETEzZ2l5MuhVkFwjfMy29f0
         8lemmxMHKCHSka+l7nSyT6Wvx3S+JSVEdzXKChs3FFBiCHjgzAbfowSWY8O4epiZ4d1c
         OAapzl7tS2Gqpj1eEceTUG30u+xRD/JGGefB/z9x/M9Z1URCzqc3U/KfB7p/5pLaOxg/
         GlPw==
X-Forwarded-Encrypted: i=1; AJvYcCVzVwrbURMOgr5DZVWH72vfHe8PwcZ0ky/t9mNzNhyHRnnZJIfTdg37TbhmMGskQ5hzexbx97Vdxh0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8wfRhOnZZNeoIr12aP7HYxnwqqoYBPCr57TWpuE8MRuT59tUi
	c+oCgLdSi2U7zuneIAwua3z82BljtjHo6Uoj9sqHIwH1leOUsfpnhLgzi/sP1pI=
X-Google-Smtp-Source: AGHT+IG3n+8BjvNyfdOQ41CtWB50a+df5hMGC6hZK0ik2wYeBjEF5HII03Wx0Fx78I6sx8mNTwMEPw==
X-Received: by 2002:a17:902:db02:b0:20b:ba72:37c with SMTP id d9443c01a7336-20bfea542c6mr268194995ad.48.1728411568581;
        Tue, 08 Oct 2024 11:19:28 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c1393997fsm58485815ad.179.2024.10.08.11.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 11:19:27 -0700 (PDT)
Date: Tue, 8 Oct 2024 11:19:24 -0700
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: mkarsten@uwaterloo.ca, skhawaja@google.com, sdf@fomichev.me,
	bjorn@rivosinc.com, amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com, willemdebruijn.kernel@gmail.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC net-next v4 5/9] net: napi: Add napi_config
Message-ID: <ZwV3rOFhsEyVoNtR@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>, netdev@vger.kernel.org,
	mkarsten@uwaterloo.ca, skhawaja@google.com, sdf@fomichev.me,
	bjorn@rivosinc.com, amritha.nambiar@intel.com,
	sridhar.samudrala@intel.com, willemdebruijn.kernel@gmail.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Jiri Pirko <jiri@resnulli.us>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Johannes Berg <johannes.berg@intel.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
References: <20241001235302.57609-1-jdamato@fastly.com>
 <20241001235302.57609-6-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241001235302.57609-6-jdamato@fastly.com>

On Tue, Oct 01, 2024 at 11:52:36PM +0000, Joe Damato wrote:
> Add a persistent NAPI config area for NAPI configuration to the core.
> Drivers opt-in to setting the persistent config for a NAPI by passing an
> index when calling netif_napi_add_config.
> 
> napi_config is allocated in alloc_netdev_mqs, freed in free_netdev
> (after the NAPIs are deleted).
> 
> Drivers which call netif_napi_add_config will have persistent per-NAPI
> settings: NAPI IDs, gro_flush_timeout, and defer_hard_irq settings.
> 
> Per-NAPI settings are saved in napi_disable and restored in napi_enable.
> 
> Co-developed-by: Martin Karsten <mkarsten@uwaterloo.ca>
> Signed-off-by: Martin Karsten <mkarsten@uwaterloo.ca>
> Signed-off-by: Joe Damato <jdamato@fastly.com>
> ---
>  .../networking/net_cachelines/net_device.rst  |  1 +
>  include/linux/netdevice.h                     | 32 ++++++++
>  net/core/dev.c                                | 79 +++++++++++++++++--
>  net/core/dev.h                                | 14 ++++
>  4 files changed, 119 insertions(+), 7 deletions(-)

[...]
  
> +/**
> + * netif_napi_add_config - initialize a NAPI context with persistent config
> + * @dev: network device
> + * @napi: NAPI context
> + * @poll: polling function
> + * @weight: the poll weight of this NAPI

For anyone following along, I noticed this unnecessary bit of kdoc
left in from a previous revision and will remove it when submitting
v5.
