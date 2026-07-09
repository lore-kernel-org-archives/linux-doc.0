Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069D73F1670
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 09:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590756; cv=none; b=owWDnwKr8+CiIsep25CNbkdLY91rPdv1dpdwIyhpEz8HyziRdTkO85BeCEqF8yn3PTJKItor4ta4PqdsCFuiMBiTUrBRgXIU6XNgnTROH5d3+3JyBtUY304sqmhKJPjmLOTt22cwBvwPcdDKapRkSAxv+T7g3zKOy9qU0wbNUW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590756; c=relaxed/simple;
	bh=iQNrGVvv3ujLtkwmKctK+PWCeJB+Z38/i3Nxrwmlsrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqodRHJ7FiDzBcV9S7An39uO5uC8dkAQTDhmqhh8u3YS5ci93/Luxhwq+kCoe276+uG2Pym4oto2+zzWL/lIQczgfytONyVvS9rHsic8QuHAccDcHsP20Ww+UgYplVFsxjFKB+nWYWyr+iyZucjipDPmXtnC9sdwDyA5Don3YLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=bMxSyS0j; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="bMxSyS0j"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493b77b150aso13103345e9.2
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 02:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1783590752; x=1784195552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cmUvpg/LGglbFmX5TbG8S8cuP4tLEOPmrTkk7nQFQLo=;
        b=bMxSyS0jwGsmJ9MuQogJyBz3F63LUvsACq+qyW5SuL5TGiMrFn6oWnP1raMt0zSqOs
         KPCHAvEOkvHnkgapRFG3coOIo2t7LdYiwODMKtMHP6dhftejtSoBSnC6yt57SoDVYGyS
         SkhTVmOi6VM6+P3CGSP2ryQE6Iv+vEm5x5RL8J8gMojBQuvog5v3dyC+em/tw/nGQ1rx
         ewWmylZPOhEYFoL16n5oSCbtFWL0GWF8MDYlBlw3QRnx75eWGNeE4EdAJcgZMd+U8wGb
         f1z2SUs+qsLUakRRl5k/M/CdjDwr5+6vDIdpXVIdWMeXsbGrfpJmIkoxrfLaCzmfpliB
         iErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783590752; x=1784195552;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cmUvpg/LGglbFmX5TbG8S8cuP4tLEOPmrTkk7nQFQLo=;
        b=J4U33Z5Z/uc/pwt2ebhg+gtanLnPsXmYHx+w/oskvK21gJtAes9yjqzFSLKtQDvjdu
         7EkyfnNt4SxysRGZQ/zMJjQEuMuZGAYcfnShaqGpuWGxrTsnioQWvUuMWy/RrRfroILn
         3l1JOar89TaJmVb4NbZ3RaAZIFFuDt5o4Xq2vr1XKme4m4pDm+uoZOUT6YE6QdMjXy2I
         SMiFxFmjzuxyjkumZa/unTnDGmNQSbOQ4x/quAe45C1P+ROvZ8WuCH3Xl+1mgjFUsosR
         yd9apzHJHn0eI29ODTUg/3/TXp2aMOqp3ym3PDe4Y5zZNjK2FzmXmIQdgiQMB7MtEekF
         aEQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0Y494TGRaY+LmT7jLHTDCkQpQ5GmMjA+YG/Z9kfKb+wfF/OVjILEPzK5Bkh5zslCM8ABHjIb49WA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLTKel4BpD6AL43NwxVPHOgg9IylvqCWT79bVHTDgbiewPRxhi
	E7Iw5ziCLj/SHmBAhSU6oo4CH8K8nVk5W8V4JWCKGitYxzHUV32C6t30gMeG0TntF5w=
X-Gm-Gg: AfdE7clafjMaNKFfllD+HSrsCm3C3sgfqsEQ8/09z0GimlroXlNy+GlLYrtrgIleOvO
	wexQpI83oazghh2Ii271lKLVeajR9NcBofp+yt0i6nj3hxban16EgmfXZli6mG5GSn0SEGptv12
	eZ9//kNxjfCf9bD3rktPGN0EtT5Bo+X2xrs1gLDJDyjlqz2ynZmsp4Eqvt5vT/uMWx0NHfFFxsm
	qt5DekaPvMmBX4dWK3Zarj58DXQBbIqFhzpwcXpW+9yAp5UXhlZSbAeb+2GpQQqgW9uFKpkY3me
	dx+GrmNyZHWSOZL49DGuUduVEwYD4Uobh4D08ZlgmNX+cpHZcyBn29VSoXYOOvlOZxd+Pypo/b+
	p+gK7GWIBL4jj+0mgTJExoq3LuVAh6mlIJErD5VQUNEXddUwQXGLJUCvOtbh4qqiiklm9gWw+4u
	FM2m+JcC8CIa7YhnwGiIElO/g1UR0ogjrX
X-Received: by 2002:a05:600c:3111:b0:493:aab3:c09c with SMTP id 5b1f17b1804b1-493e6a4a8b1mr61043955e9.28.1783590752378;
        Thu, 09 Jul 2026 02:52:32 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8cdsm53652344f8f.1.2026.07.09.02.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:52:31 -0700 (PDT)
Date: Thu, 9 Jul 2026 11:52:28 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Mark Bloch <mbloch@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next V5 6/6] net/mlx5: Apply devlink eswitch mode
 boot default on probe
Message-ID: <ak9un-lCDmhGI9tL@FV6GYCPJ69>
References: <20260707174527.425134-1-mbloch@nvidia.com>
 <20260707174527.425134-7-mbloch@nvidia.com>
 <ak4LVcyKofmtrWcU@FV6GYCPJ69>
 <7309e57a-89bc-4e4a-97e9-d843b02efa42@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7309e57a-89bc-4e4a-97e9-d843b02efa42@nvidia.com>

Thu, Jul 09, 2026 at 08:00:19AM +0200, mbloch@nvidia.com wrote:
>
>
>On 08/07/2026 11:34, Jiri Pirko wrote:
>> Tue, Jul 07, 2026 at 07:45:27PM +0200, mbloch@nvidia.com wrote:
>>> Apply devlink_eswitch_mode= boot defaults for mlx5 after the initial
>>> probe finishes device initialization while holding the devlink instance
>>> lock.
>>>
>>> At this point the devlink instance is registered and mlx5 can perform an
>>> eswitch mode change. Calling devl_apply_default_esw_mode() also clears
>>> any pending default apply work queued by devl_register(), so the queued
>>> work will not apply the same default again.
>>>
>>> Keep this call in mlx5_init_one() rather than the lower-level
>>> devl-locked init helper. That helper is also used by devlink reload, and
>>> devlink core already applies the boot default after a successful
>>> DRIVER_REINIT reload.
>>>
>>> Signed-off-by: Mark Bloch <mbloch@nvidia.com>
>>> ---
>>> drivers/net/ethernet/mellanox/mlx5/core/main.c | 13 +++++++++++++
>>> 1 file changed, 13 insertions(+)
>>>
>>> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/main.c b/drivers/net/ethernet/mellanox/mlx5/core/main.c
>>> index 643b4aac2033..0712efea74cc 100644
>>> --- a/drivers/net/ethernet/mellanox/mlx5/core/main.c
>>> +++ b/drivers/net/ethernet/mellanox/mlx5/core/main.c
>>> @@ -1392,6 +1392,17 @@ static void mlx5_unload(struct mlx5_core_dev *dev)
>>> 	mlx5_free_bfreg(dev, &dev->priv.bfreg);
>>> }
>>>
>>> +static void mlx5_devl_apply_default_esw_mode(struct mlx5_core_dev *dev)
>>> +{
>>> +	struct devlink *devlink = priv_to_devlink(dev);
>>> +
>>> +	if (!MLX5_ESWITCH_MANAGER(dev))
>>> +		return;
>>> +
>>> +	devl_assert_locked(devlink);
>>> +	devl_apply_default_esw_mode(devlink);
>>> +}
>>> +
>>> int mlx5_init_one_devl_locked(struct mlx5_core_dev *dev)
>>> {
>>> 	bool light_probe = mlx5_dev_is_lightweight(dev);
>>> @@ -1471,6 +1482,8 @@ int mlx5_init_one(struct mlx5_core_dev *dev)
>>> 	err = mlx5_init_one_devl_locked(dev);
>>> 	if (err)
>>> 		devl_unregister(devlink);
>>> +	else
>>> +		mlx5_devl_apply_default_esw_mode(dev);
>> 
>> I don't understand why this patch is needed at all. Just leave the job
>> to the devlink core, no? That was the point to not pollute drivers with
>> code like this. Is it some kind of leftover?
>
>It was discussed with Jakub here:
>https://lore.kernel.org/all/20260611085440.4fe36bf2@kernel.org/
>
>The main reason is timing. If the default is applied only by devlink
>core, it has to wait until the driver drops the devlink lock.

I don't follow.

<quote>
	devl_lock(devlink);
	if (dev->shd) {
		err = devl_nested_devlink_set(dev->shd, devlink);
		if (err)
			goto unlock;
	}
	devl_register(devlink);
	err = mlx5_init_one_devl_locked(dev);
	if (err)
		devl_unregister(devlink);
unlock:
	devl_unlock(devlink);
</quote>

devlink lock is droped right after.



>For mlx5, that usually happens very late in the init sequence. I
>wanted drivers to be able to apply the default as soon as the driver
>is ready for it, because on NICs with a DPU the host PF can remain
>stuck until the ECPF moves to switchdev.
>
>This API is also useful beyond the initial devlink registration path.
>Follow-up patches will use it for driver controlled paths that are
>not covered by the devlink core, such as recovery and FW reset.
>
>There is also a race window where userspace may take the devlink lock
>before the core gets a chance to apply the default. Letting the driver
>explicitly apply the default at the right point avoids that scenario.
>
>Thinking about this again, maybe the simpler approach is to apply the
>default from devl_unlock(). That would avoid the whole workqueue
>infra.
>
>I avoided doing that earlier because applying a default mode as a
>side effect of devl_unlock() feels a bit odd. But compared to adding
>dedicated workqueue handling maybe it is the lesser evil here.
>
>What do you think?

I was under impression that you need the work to resolve nested locking.
If not, drop it, sure.


>
>About the extra API, I still think it's useful and would like to keep
>it if possible.
>
>Mark
>
>
>> 
>> 
>> 
>>> unlock:
>>> 	devl_unlock(devlink);
>>> 	return err;
>>> -- 
>>> 2.43.0
>>>
>
