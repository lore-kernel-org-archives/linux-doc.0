Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2313B47D3
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 16:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779812622; cv=none; b=IDCayJFWwci9wxWQOSHTZXhj8OHNnt8KHU2IrK/F4RN7mvSzePoeHi+szqykp35QPQWagkIVoiZHaUW8jaVxTBussUdzrIb5l8rT20I0j0sA6+RvDXKOK71EyH3JEYx/pH69F7DdMMMJHXqU6cZwcV2R4FlhVnznCi+Rg2iySW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779812622; c=relaxed/simple;
	bh=/guMXgQW93OWipJLT8Mg8akWH/y+aqGs8oksgRHFwb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1WBhPMynS2KSZncexlD6MK45XwOfP05O7a6tVnWQ5NeNdTo+d9aad7W9qoG/3aWwe0bY2OJGJub/CQYSocvluQjiharHYknFcH9lkCvK2SD3mTD9VQSKN8vIgjbCcmpTjhylCJatMlzQ7pyawIhrW/8WLbFGbqmdrF/h3SXdK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=McGYWAVT; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="McGYWAVT"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-44a74032ff8so7998377f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 09:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1779812615; x=1780417415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sLZvkzp6ATjH3l5+aCHSeZgpKYTRGGuT+8/f+7jWDUA=;
        b=McGYWAVTbwMXqgEdQk8ZvRP61Eno8f2trDAHxIk2ytoHfJFVzRN6EChxoOK5tjZC57
         tBPfDcIvpqpBw5/hG5mj7MwahTHn1hZaA32H8wFbeOofQtULyPsMN9k14mFP9fGjPFln
         ETuBgg4tX25Zyt7bD9X7V3RopNICPY83QUyjqDgj7CNJcMR4OIsvoc4Ei8YlNoKbi27L
         7KisFlfoxbtSNkTPfSx466bWc5EmtMS2BZaj1s8Xi4Fb0GLJTtHghxMPcrsdQTmTHUAK
         X+e+602Z2Q41aAmFpnPDNP1yP8lc5FDRH6r+nt9dLfK+S9oSq4hzS8rplBUWdjrWS/1w
         XW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779812615; x=1780417415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLZvkzp6ATjH3l5+aCHSeZgpKYTRGGuT+8/f+7jWDUA=;
        b=k9kTHkMApVDwqtwKMWgZWAmkscefEg2T6YMh6Bf1e3p5h7B1SWXhZo3aD052qAOmjJ
         mkJ+yy7xGd7ijkwdWqmUisBJaWvwRPlOZxMunAmTns70/fs6DWjpuOB/gB7MM0YYHNrd
         L2/pGN97OgXkq5ZzDXTuPxTX3MqFnssEZ/ww+y8Fhp65eNaXkV7agg2jvQ6WRhgxwXJa
         PdeGQWUAmZsSkziuY7FD5f5LIARoG3CWiufWjJbhkxdrfJjSwSaZr4nRK5ZsPcwufktT
         tA7LlINE+ch9o+KOgerRhnViCQQzez4aXouGYbv3jcdKkCDLkTfDs81Bg3nRcNGgMBQs
         jSXw==
X-Forwarded-Encrypted: i=1; AFNElJ9vGSCK7ud1HkKFiGNY8Yv3GZ6RRfd+kNw2kNIvL4U+RNckGkam0YLQvwDIjBm8rTbBSKhHgt5kth8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy1l1ysATf9ctVFJ1Bfg1kSY8umBHZtNH9B1SQ3s66KDvM6GRz
	pFHuWMXDVO/8o78kuHRjdnjd/w+QmGb3SU23d06OJtIQKhEzspRMfCPfZ3fvrjcCzkA=
X-Gm-Gg: Acq92OHwjh48DqL8Ii/cNndZW6YTKohfBscLvnIdNjTzFVLJCr1HL/3f0KZRM2ntlWb
	tVaN/KuT/PdKSx2TllLUr0Sx6VVITUwxAzs49jNeOlme/gDdwGCqFuDJ+oWRAIN5AHhv1rEOcv/
	1iYotmbv5wv/a/2BOuyoH8OvSA0DSeVy175H4A2iNI36ojkM7sg/XIeNC0CeUkhl+4uaI5G+Bp/
	Cu4qt+guxogRkNH0PDvtM6yj4bYS4bhW9ZaJotX7FrjaHtA+0wW7RUu/YJPgnk3QDd1+ZBXY58c
	cfqHcCWZ1DRfWMEL3Lv9Np3vz3ITqx5gCRf2e7YF4GbCB1/kiTTNCC3jo/TIQhBWigrI4pLO9So
	FfgqFJkOgWbY2dsY22o5jiZMbdgXi6EBcL6SbVmSMiANKM+EF+Dm/afDJYoqsYfnyNildPN3nEz
	yfGGKDkGGzoLisnVaaCE8ZwvY93a/ZpVnzB/zqzyLO4y8=
X-Received: by 2002:a05:6000:401e:b0:45d:4b37:7fcf with SMTP id ffacd0b85a97d-45eb367fac4mr33534428f8f.15.1779812614061;
        Tue, 26 May 2026 09:23:34 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6cd1780sm39478805f8f.16.2026.05.26.09.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 09:23:33 -0700 (PDT)
Date: Tue, 26 May 2026 18:23:29 +0200
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
Message-ID: <ahXF2aQZNOwHdCG_@FV6GYCPJ69>
References: <20260521072434.362624-1-tariqt@nvidia.com>
 <20260521072434.362624-4-tariqt@nvidia.com>
 <ahVPASuh4BZGOfx0@FV6GYCPJ69>
 <8c8df8da-62a9-49e8-84eb-572d54cfeb1f@nvidia.com>
 <ahWm4NXph9gdazV_@FV6GYCPJ69>
 <9aa7c295-35cb-428b-9031-13a2f507ae4b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9aa7c295-35cb-428b-9031-13a2f507ae4b@nvidia.com>

Tue, May 26, 2026 at 05:03:57PM +0200, mbloch@nvidia.com wrote:
>
>
>On 26/05/2026 17:07, Jiri Pirko wrote:
>> Tue, May 26, 2026 at 11:44:46AM +0200, mbloch@nvidia.com wrote:
>>>
>>>
>>> On 26/05/2026 10:44, Jiri Pirko wrote:
>>>> Thu, May 21, 2026 at 09:24:34AM +0200, tariqt@nvidia.com wrote:
>>>>> From: Mark Bloch <mbloch@nvidia.com>
>>>>>
>>>>> Apply devlink default eswitch mode for mlx5 devices after successful
>>>>> device initialization while holding the devlink instance lock.
>>>>>
>>>>> At this point the devlink instance is registered and the mlx5 devlink
>>>>> operations are available, so the default eswitch mode can be applied to
>>>>> the matching PCI devlink handle.
>>>>>
>>>>> Signed-off-by: Mark Bloch <mbloch@nvidia.com>
>>>>> Reviewed-by: Shay Drori <shayd@nvidia.com>
>>>>> Reviewed-by: Moshe Shemesh <moshe@nvidia.com>
>>>>> Signed-off-by: Tariq Toukan <tariqt@nvidia.com>
>>>>> ---
>>>>> drivers/net/ethernet/mellanox/mlx5/core/main.c | 17 +++++++++++++++++
>>>>> 1 file changed, 17 insertions(+)
>>>>>
>>>>> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/main.c b/drivers/net/ethernet/mellanox/mlx5/core/main.c
>>>>> index 0c6e4efe38c8..4528097f3d84 100644
>>>>> --- a/drivers/net/ethernet/mellanox/mlx5/core/main.c
>>>>> +++ b/drivers/net/ethernet/mellanox/mlx5/core/main.c
>>>>> @@ -1391,6 +1391,21 @@ static void mlx5_unload(struct mlx5_core_dev *dev)
>>>>> 	mlx5_free_bfreg(dev, &dev->priv.bfreg);
>>>>> }
>>>>>
>>>>> +static void mlx5_devl_apply_default_esw_mode(struct mlx5_core_dev *dev)
>>>>> +{
>>>>> +	struct devlink *devlink = priv_to_devlink(dev);
>>>>> +	int err;
>>>>> +
>>>>> +	if (!MLX5_ESWITCH_MANAGER(dev))
>>>>> +		return;
>>>>> +
>>>>> +	devl_assert_locked(devlink);
>>>>> +	err = devl_apply_default_esw_mode(devlink);
>>>>> +	if (err)
>>>>> +		mlx5_core_warn(dev, "Couldn't apply default eswitch mode, err %d\n",
>>>>> +			       err);
>>>>> +}
>>>>> +
>>>>> int mlx5_init_one_devl_locked(struct mlx5_core_dev *dev)
>>>>> {
>>>>> 	bool light_probe = mlx5_dev_is_lightweight(dev);
>>>>> @@ -1437,6 +1452,7 @@ int mlx5_init_one_devl_locked(struct mlx5_core_dev *dev)
>>>>> 		mlx5_core_err(dev, "mlx5_hwmon_dev_register failed with error code %d\n", err);
>>>>>
>>>>> 	mutex_unlock(&dev->intf_state_mutex);
>>>>> +	mlx5_devl_apply_default_esw_mode(dev);
>>>>
>>>> I wonder how we can make this work for all. I mean, other driver would
>>>> silently ignore this command like arg, right? Any idea how to make all
>>>> drivers follow the arg from very beginning?
>>>>
>>>
>>> I have a follow-up series that adds the call to all drivers which support
>>> setting eswitch mode. When going over the other drivers, what I found is
>>> that the right point to apply the default is driver specific, drivers
>>> I have patch for:
>>>
>>> 46e16c6d9836 net: Apply devlink esw mode defaults
>>> ab4f54102ba9 bnxt_en: Apply devlink default eswitch mode during init
>>> b48cce1607bb liquidio: Apply devlink default eswitch mode during init
>>> 4ea54b0fe04a ice: Apply devlink default eswitch mode during init
>>> b7faddaa1c90 octeontx2-af: Apply devlink default eswitch mode during init
>>> 74b0c22c47b9 octeontx2-pf: Apply devlink default eswitch mode during init
>>> 5000e4c3d768 nfp: Apply devlink default eswitch mode during init
>>> 97a218e95e41 netdevsim: Apply devlink default eswitch mode during init
>>>
>>> I don't think doing this generically from devlink is realistic. devlink
>>> doesn't really know when a given driver is ready to change eswitch mode.
>>> Some drivers need SR-IOV state, representor setup, or other init pieces to
>>> be ready first, and the locking is not identical across drivers either.
>> 
>> 
>> Low hanging fruit would be just to call ops->eswitch_mode_set at the end
>> of register. Multiple reasons:
>> 
>> 1) end of devl_register is exactly the point userspace is free to issue
>>    the eswitch mode set. Driver should be ready to handle it.
>> 2) all drivers would transparently get this functionality, without
>>    actually knowing this kernel command line arg ever existed, without
>>    odd wiring call of related exported function. I prefer that stongly.
>> 3) you should add a there warning for the case this arg is passed yet
>>    the driver does not implement eswitch_mode_set. User should
>>    get a feedback like this, not silent ignore.
>> 
>> The only loose end is see it the void return of devl_register().
>> Multiple ways to handle the possibly failed eswitch_mode_set(). I would
>> probably just go for pr_warn, seems to be the most correct.
>> 
>> Make sense?
>
>I see the point, but I don't think devl_register() (at least not the only place)
>is the right place.
>
>There is a small but important difference between userspace doing
>"devlink eswitch set" after register is done, and devlink core calling
>eswitch_mode_set() from inside the register flow.
>
>Some drivers call devlink_register() while holding the device lock.
>liquidio is one example. If devlink core calls ops->eswitch_mode_set() from
>there, we may start the full eswitch mode change while holding that lock.
>That mode change can create representors, register netdevs, take rtnl,
>allocate resources, etc. I don't think we want this to become an implicit
>side effect of devlink registration.

I believe your AI may untagle liquidio locking :)


>
>For mlx5, the placement after intf_state_mutex is also intentional:
>
>mutex_unlock(&dev->intf_state_mutex);
>mlx5_devl_apply_default_esw_mode(dev);
>
>We can't call it while holding intf_state_mutex because the mode set path
>takes it internally, and switchdev mode may also create IB representors.
>
>Also, devl_register() only covers the first registration. The mlx5 call in
>mlx5_load_one_devl_locked() is for reload/fw reset recovery kind of flows.
>In those flows devlink is already registered, so devl_register() is not
>called again, but the driver state was rebuilt and we may need to apply the
>default again.

Call it from reload too, right?


>
>Same for reload, fw reset and pci recovery in general. If the driver tears
>down and rebuilds eswitch related state, the place to apply the default is
>in that driver's reinit flow, not in devl_register().
>
>When I went over the other drivers, the right place was not always the same
>as devlink registration. I'm not an expert in any of them, so I hope I got
>the details right, but for example octeontx2 AF needs sr-iov and the
>representor switch state to be initialized first. nfp can do it after
>app/vNIC init while the devlink lock is already held. liquidio should do it
>only after dropping the PCI device lock.

Idk, perhaps do it from devlink_post_register_work of some kind? That
would allow you to have the same locking ordering as a userspace call.

>
>Mark
>
>> 
>> 
>>>
>>> Also, since this knob is only about eswitch mode, I don't think we need to
>>> touch every devlink driver. Drivers that don't implement eswitch_mode_set()
>>> would just ignore it anyway. The follow-up only wires the default into
>>> drivers that actually support changing eswitch mode.
>>>
>>> Mark
>>>
>>>>
>>>>> 	return 0;
>>>>>
>>>>> err_register:
>>>>> @@ -1538,6 +1554,7 @@ int mlx5_load_one_devl_locked(struct mlx5_core_dev *dev, bool recovery)
>>>>> 		goto err_attach;
>>>>>
>>>>> 	mutex_unlock(&dev->intf_state_mutex);
>>>>> +	mlx5_devl_apply_default_esw_mode(dev);
>>>>> 	return 0;
>>>>>
>>>>> err_attach:
>>>>> -- 
>>>>> 2.44.0
>>>>>
>>>
>
