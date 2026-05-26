Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2283FDC14
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 14:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779804442; cv=none; b=Y4XTN21WLeCIIBR774afJ9pe/9ulbFH5FDok19t27yAK8lfO7zmmNTfj5h8bW0GRVlyV4DKoOu5CjV5SIz9+cVTiUFm04xbwAPp7pd0JrlhFSftVVcAEJV/PZ29AGUM5mnaWknArZiUpwn4Vl24TQZ3oaNFi7a8+PkXrtXABFT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779804442; c=relaxed/simple;
	bh=T1UqiNTVmB4/tDb0kiqnEMrv4GrgBQEv5c3B2KoOQ+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNEH4Tht7Jchtt+gdWF1MetGs1Lwc+bSRCsioFT/I0dGUnZWGYz7K4F+vMSq/+sPLnhKWnm7H0umSyX8kedwR9nU6mmXh9l+DIzjX6qOLxnC1THPCPV6XXZbOb+kUOttZUpO2ziivLEPMxpUdb8DuBDuFJukK1es8oaPLlVIPCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=Z5SavboQ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="Z5SavboQ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-459bf19e87bso6295315f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 07:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1779804435; x=1780409235; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GdJEpA7bMT8GO5yFBjPJn50s6+iOwqU78oJOnULy2Sc=;
        b=Z5SavboQ8OfmgiOMXeMNLttL+ek46pq6N4vtuNm9QxlcqyoOI4xJyW3JUZG+p51Iq9
         QMpNll0CyQ7obzOu1z02CyKJlMRH4ez2ray5djb2y+6XJviSdoBqUwHeiw7XQ9g4ZW2c
         5vYCAp51dZy7ulO6W3/L4QsNanzQppg890v77m2d3IyoPIeEaSxs/EvNNnDtCDSbR48a
         RbVc6uVLoii+CHswDM2ALLCNDuY4hk1VBDapcOMEG+06DWvPdGGxrWGn7eJxjAaFIqAG
         GU/5DNQcXVGWtcD4hcGz7QQaMjMnHes+hbrcu2vbn0EGPfjWT8sbKtZaGmv8fC/FzMdr
         Cn6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779804435; x=1780409235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GdJEpA7bMT8GO5yFBjPJn50s6+iOwqU78oJOnULy2Sc=;
        b=ru3DSEeeS18gFauifYcQOxBOgkpAKTS7YsK8Gy4DX2wd/3PGxy42q44gp4ds4w3kFt
         mFk4T59XGcYIvuyZE0mA3z4W35E2MJ0fuMEJQZhsjqlM17Ooum8IOjMlxdGEzl/M4rUr
         a4zk0kJ71u42A32dw4QUaLMHElCdm7mXun5c+FgXRJ2YmJGXFahI/R9+wZPygG9O8RMG
         BPZl4r2CsAOZhCzo1Tz7txwaJVkvYOVKccgMBFyNjrPgxGW9o+m2toxioxPiP+Dl10JD
         x0mbpOgryw9trK0jrrMVkbkWb8zYPIIeHDiy5+gEy91OzEyGresiF5XsKniWUIw4DKvv
         XGlw==
X-Forwarded-Encrypted: i=1; AFNElJ/cxLraLTh9ApPIMZA4QMJT11XXZbUZsN6zyyVhYJkJNMu1AA52zVv4/RqFcmx+DWDR9DlrtAQiQDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyuJcVcvzzrsS4l2rRrkKnzxxvIG69yjtqFpmLFVC9H0lQVaPI
	OK4OsCh2z8Mfb8FkNQYY6EE58V5lkzVnTYdPolSzwowwyWemWCfst5jly45NVF/KZAk=
X-Gm-Gg: Acq92OG6U9XmLVXPr72tYr01kEvz0MS47/k4UHZqBhJsDciSwcWJQLogh3PIjwM2aWh
	HJDBTzY32JvPC1GRfxm6J+c3mr9DTIlCCVY/J2183BRP4/DypGd1XtMoFkBSSzUBMXiWH2k5sJU
	4wfmQgcSig5W7VUyzisZvYzoLU8qXhTgT22EVdCgQ/rcMvlWEAjD2wA7QMp1dlMGSExyRFYZJoF
	5gRlBBJCe31OLH6Qv2DI/auSxyLmkZX0DnAr9/+Km2w/QkRzSYWFrdAfRhDXtYzI09lxh9B/fwh
	mH15TdRLSMEATAmrcsoQ84+fHpIfldHcpsXs+JLdUo7fh2EICSKAopuoQRYOn/q7kS7i+dsrr7a
	VLTCNHpouDq/Vyo/vllKK+prS83Gp/bd4SU/vcOZwgmrfoBHhzAA9JEk2l3O+ZpyfDBAPyXA8m0
	s5LH8JPhJaiPe/ji5NbROF/roPo5Gm9vbo
X-Received: by 2002:a05:6000:2003:b0:43b:4136:1e6f with SMTP id ffacd0b85a97d-45eb38e4b46mr32483028f8f.38.1779804435027;
        Tue, 26 May 2026 07:07:15 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d4ca0dsm35432258f8f.18.2026.05.26.07.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:07:14 -0700 (PDT)
Date: Tue, 26 May 2026 16:07:11 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Mark Bloch <mbloch@nvidia.com>
Cc: Tariq Toukan <tariqt@nvidia.com>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Simon Horman <horms@kernel.org>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Petr Mladek <pmladek@suse.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Tejun Heo <tj@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Feng Tang <feng.tang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Kees Cook <kees@kernel.org>, Marco Elver <elver@google.com>, 
	Li RongQing <lirongqing@baidu.com>, Eric Biggers <ebiggers@kernel.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-rdma@vger.kernel.org, Gal Pressman <gal@nvidia.com>, 
	Dragos Tatulea <dtatulea@nvidia.com>, Jiri Pirko <jiri@nvidia.com>, Shay Drori <shayd@nvidia.com>, 
	Moshe Shemesh <moshe@nvidia.com>
Subject: Re: [PATCH net-next 3/3] net/mlx5: Apply devlink default eswitch
 mode during init
Message-ID: <ahWm4NXph9gdazV_@FV6GYCPJ69>
References: <20260521072434.362624-1-tariqt@nvidia.com>
 <20260521072434.362624-4-tariqt@nvidia.com>
 <ahVPASuh4BZGOfx0@FV6GYCPJ69>
 <8c8df8da-62a9-49e8-84eb-572d54cfeb1f@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c8df8da-62a9-49e8-84eb-572d54cfeb1f@nvidia.com>

Tue, May 26, 2026 at 11:44:46AM +0200, mbloch@nvidia.com wrote:
>
>
>On 26/05/2026 10:44, Jiri Pirko wrote:
>> Thu, May 21, 2026 at 09:24:34AM +0200, tariqt@nvidia.com wrote:
>>> From: Mark Bloch <mbloch@nvidia.com>
>>>
>>> Apply devlink default eswitch mode for mlx5 devices after successful
>>> device initialization while holding the devlink instance lock.
>>>
>>> At this point the devlink instance is registered and the mlx5 devlink
>>> operations are available, so the default eswitch mode can be applied to
>>> the matching PCI devlink handle.
>>>
>>> Signed-off-by: Mark Bloch <mbloch@nvidia.com>
>>> Reviewed-by: Shay Drori <shayd@nvidia.com>
>>> Reviewed-by: Moshe Shemesh <moshe@nvidia.com>
>>> Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
>>> ---
>>> drivers/net/ethernet/mellanox/mlx5/core/main.c | 17 +++++++++++++++++
>>> 1 file changed, 17 insertions(+)
>>>
>>> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/main.c b/drivers/net/ethernet/mellanox/mlx5/core/main.c
>>> index 0c6e4efe38c8..4528097f3d84 100644
>>> --- a/drivers/net/ethernet/mellanox/mlx5/core/main.c
>>> +++ b/drivers/net/ethernet/mellanox/mlx5/core/main.c
>>> @@ -1391,6 +1391,21 @@ static void mlx5_unload(struct mlx5_core_dev *dev)
>>> 	mlx5_free_bfreg(dev, &dev->priv.bfreg);
>>> }
>>>
>>> +static void mlx5_devl_apply_default_esw_mode(struct mlx5_core_dev *dev)
>>> +{
>>> +	struct devlink *devlink = priv_to_devlink(dev);
>>> +	int err;
>>> +
>>> +	if (!MLX5_ESWITCH_MANAGER(dev))
>>> +		return;
>>> +
>>> +	devl_assert_locked(devlink);
>>> +	err = devl_apply_default_esw_mode(devlink);
>>> +	if (err)
>>> +		mlx5_core_warn(dev, "Couldn't apply default eswitch mode, err %d\n",
>>> +			       err);
>>> +}
>>> +
>>> int mlx5_init_one_devl_locked(struct mlx5_core_dev *dev)
>>> {
>>> 	bool light_probe = mlx5_dev_is_lightweight(dev);
>>> @@ -1437,6 +1452,7 @@ int mlx5_init_one_devl_locked(struct mlx5_core_dev *dev)
>>> 		mlx5_core_err(dev, "mlx5_hwmon_dev_register failed with error code %d\n", err);
>>>
>>> 	mutex_unlock(&dev->intf_state_mutex);
>>> +	mlx5_devl_apply_default_esw_mode(dev);
>> 
>> I wonder how we can make this work for all. I mean, other driver would
>> silently ignore this command like arg, right? Any idea how to make all
>> drivers follow the arg from very beginning?
>> 
>
>I have a follow-up series that adds the call to all drivers which support
>setting eswitch mode. When going over the other drivers, what I found is
>that the right point to apply the default is driver specific, drivers
>I have patch for:
>
>46e16c6d9836 net: Apply devlink esw mode defaults
>ab4f54102ba9 bnxt_en: Apply devlink default eswitch mode during init
>b48cce1607bb liquidio: Apply devlink default eswitch mode during init
>4ea54b0fe04a ice: Apply devlink default eswitch mode during init
>b7faddaa1c90 octeontx2-af: Apply devlink default eswitch mode during init
>74b0c22c47b9 octeontx2-pf: Apply devlink default eswitch mode during init
>5000e4c3d768 nfp: Apply devlink default eswitch mode during init
>97a218e95e41 netdevsim: Apply devlink default eswitch mode during init
>
>I don't think doing this generically from devlink is realistic. devlink
>doesn't really know when a given driver is ready to change eswitch mode.
>Some drivers need SR-IOV state, representor setup, or other init pieces to
>be ready first, and the locking is not identical across drivers either.


Low hanging fruit would be just to call ops->eswitch_mode_set at the end
of register. Multiple reasons:

1) end of devl_register is exactly the point userspace is free to issue
   the eswitch mode set. Driver should be ready to handle it.
2) all drivers would transparently get this functionality, without
   actually knowing this kernel command line arg ever existed, without
   odd wiring call of related exported function. I prefer that stongly.
3) you should add a there warning for the case this arg is passed yet
   the driver does not implement eswitch_mode_set. User should
   get a feedback like this, not silent ignore.

The only loose end is see it the void return of devl_register().
Multiple ways to handle the possibly failed eswitch_mode_set(). I would
probably just go for pr_warn, seems to be the most correct.

Make sense?


>
>Also, since this knob is only about eswitch mode, I don't think we need to
>touch every devlink driver. Drivers that don't implement eswitch_mode_set()
>would just ignore it anyway. The follow-up only wires the default into
>drivers that actually support changing eswitch mode.
>
>Mark
>
>> 
>>> 	return 0;
>>>
>>> err_register:
>>> @@ -1538,6 +1554,7 @@ int mlx5_load_one_devl_locked(struct mlx5_core_dev *dev, bool recovery)
>>> 		goto err_attach;
>>>
>>> 	mutex_unlock(&dev->intf_state_mutex);
>>> +	mlx5_devl_apply_default_esw_mode(dev);
>>> 	return 0;
>>>
>>> err_attach:
>>> -- 
>>> 2.44.0
>>>
>
