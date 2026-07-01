Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544783F86F7
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 09:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782899296; cv=none; b=Znr8e38K9KXYqfk1b8bIfwJsMrmRcTVYLl/wwjHTcmrLYVPanG8nXURMnas3pN2MLk4dwZBGf/YbuAP1u6oFhNywVtAvB253uIhTcLGFbCbN65++L4L1yIA0irs1xzLsFCcq3ELv4/sP68fumGTsbQxMFbt/Cldj6sYxs3SQvns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782899296; c=relaxed/simple;
	bh=mz0vRNQWV5JarJs5YU7f1UVIX6UZW0zFBNIMdXMVDrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZY0hv0I2CtpygHwFOK7X6bTj6456RjCN1IeUrI3EeFxR000VjsC+YlI3N9dsM3pfl0ecg+M2neY2cC29xqfeHC9DIGs3rgNVe+/1ugxO6PzOUygonfBnH39ZKgjelatz+kmf2mG9keNAQilHvcaTk6VeugEG/fK0jUhNuuJ0cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=snFLCVVT; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="snFLCVVT"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4720d22c94aso409786f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 02:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1782899292; x=1783504092; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mz0vRNQWV5JarJs5YU7f1UVIX6UZW0zFBNIMdXMVDrg=;
        b=snFLCVVT9Q8TYu0Ii4Luf+Z7+h1E+Sy0+rdd597Lp2CjdotKOm/YaflZZZPoK3xZI/
         DFIfniTh9a5XVRHuIHi0uZA23X7NwexbGAOdHumZkIpWcaTuS04LwGIJJEreOsuk6bu5
         GAWiBfDZ7zflO7KEWgz8jnuAtb7bcGTZxgdQYuTFY61A4HtvoZgPX0Ts/8aseRqJ0B/r
         JSXWco1PowUxxWYJq42RcPJ51V4Z1WoeegiuwtPrcxDOzRdfdVDo5Z0yETlUZHYr9yDO
         qaPFo7aIDBrzLRccVCicxd+4TBhie0aGG8YLJMN3zYUcsFkjeK+88UQZkaKGTQBh0XYY
         sEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782899292; x=1783504092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mz0vRNQWV5JarJs5YU7f1UVIX6UZW0zFBNIMdXMVDrg=;
        b=TIRzDTzxW81JW07Cx+PJSZBq6QtksLah38quyrvQB8o1n9eEwh8vS4XxPFgKWvA/aH
         pJYHwG0T41nZL+j91D+h+Olmrrb9BH4vHh0dfUOl+J8IDpnwC2Sujf2/Ca8FnmG38FCV
         u1QCiHcZnAEOTqqrzPKAACuPopDOL/9p5FVXpYvtkSj0TU2wpPilOXmdz5SXSNicuby7
         W4zNJMIL9S3EDC4uIZyyjWWQbb0TDrimO8PhBMgJjB1EH/e7UUqbKFW6nL6q0GJJCo+0
         ZPPrdzrxAdh4w/7kAV1vQUBSvSX3SE45duLWiHQmlCLGUcd5I3H1kfKTDEJqxlPeVgaj
         eHEA==
X-Forwarded-Encrypted: i=1; AFNElJ/eqXga6xDuWr3P6q14K+bZNShtXRitNACDCjpAff9qxkNLX/ZIgtibL9z1sVVqnGThhp6Cpg63pkU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUBZh1eIM9ZT1R/zU5b+hTjSiWt5X6Np4pHO/Mu9yxVnMQN6UT
	/0AOkmsKBzusYe1JgUIYnFz5gOyJndvXmvmufzttShGwHmC1fRTL4MNGo0cn4/BpaBI=
X-Gm-Gg: AfdE7ckhqy3x0TnV4itDHQoH4cyohMj+Qt7ufKzLGVhctLoyXC/mteuvBMukp4HCN4w
	uU4DTsII3Ob1NSdZdYrPo6nHZQQUOhU8Hz7f1VZkZdxcy5TBWAxo+cdedzRakv2NQCNe9Qp0R5m
	QNDGQVu/B70UjJBvpymZXGaeTxfwwkihdVgxTA1AP6NEUrEcEzo3+be75D3zj88MEu/9Sl+9Lxe
	yoGkREZW5B6ibH71S8CoD7K6dnfDebNbdRnSrCHHxC6hCv2a0L7gEhm3w2k3pwujCevhQ/gm0t/
	kgSlXRg1220rq3JGtOZ3ZIvg/e61gUb9mZqFIi6exNQmDofHb6YccHVT+ene/fyJltp0bamM+26
	Lp1vYNcVk7g4QZdjs9MBPKvkAeqRrRGKbUF4JOrwH+Eykmm+iPYn43rW+eIZYPo4SczN6MHeSuD
	sLOdIQ0ek+9L98bmmGqKCeug==
X-Received: by 2002:a05:600c:8b44:b0:492:5bb6:6d4b with SMTP id 5b1f17b1804b1-493c2ba5968mr15237255e9.34.1782899292593;
        Wed, 01 Jul 2026 02:48:12 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4756778fac3sm14575152f8f.32.2026.07.01.02.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 02:48:12 -0700 (PDT)
Date: Wed, 1 Jul 2026 11:48:07 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Mark Bloch <mbloch@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next V4 4/6] devlink: Apply eswitch mode boot defaults
Message-ID: <akThPmvUHvCMT2cp@FV6GYCPJ69>
References: <20260629182102.245150-1-mbloch@nvidia.com>
 <20260629182102.245150-5-mbloch@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629182102.245150-5-mbloch@nvidia.com>

Mon, Jun 29, 2026 at 08:20:59PM +0200, mbloch@nvidia.com wrote:
>Apply parsed devlink_eswitch_mode= defaults after devlink registration
>and after successful reload.
>
>devl_register() may still be called before the device is ready for an

How so? I would assume that driver calls devl_register only after
everything is up and running and ready. If not, isn't it a bug?


>eswitch mode change, so keep a per-devlink delayed work item and pending
>flag for the registration path. Registration queues the work, and the
>worker tries to take the devlink instance lock.
>
>If the lock is busy, the worker requeues itself with a delay.
>
>For successful reloads that performed DRIVER_REINIT, devlink_reload()
>already holds the devlink instance lock and the driver has completed
>reload_up(). Clear pending work and apply the default directly from the
>reload path instead of queueing work.
>
>If a user sets eswitch mode through netlink before the pending
>registration work runs, clear the pending flag so the queued default does
>not override that user request. Cancel pending default apply work when
>freeing the devlink instance.

These AI generated code descriptive messages are generally not very
useful :(

