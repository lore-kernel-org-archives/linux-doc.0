Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51FC3F39F3
	for <linux-doc@vger.kernel.org>; Thu,  9 Jul 2026 09:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590413; cv=none; b=l+R+6VEY9mDvPPS5O0jYgmxXVrSTLY4x7DT4FAPeVtVM9lmpQq3kcaQsBxl90AOz+6qy31F9MfocP9d+EK+K2TbZcM3Ppu1vw7co4E5X5o71F1Jf5E8yrnyBhOYFMtjTy2+UZky7Dz71j0V1xeCKAuvBth+3SbuVDN7YuRMptL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590413; c=relaxed/simple;
	bh=QjxnfdFkEb0Z6vufY3cN0U0+kv71/r1+joErkMeCX14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGM6grBzRUV6ZlmcBmJoqePpqPpadOACkZQ9SXiLkArz2As5AJQF1euHdBdTcvGoyiyZhxxS/NQxYYauofAb/lf9cyOtnoK0r6Thjd05ZWbkT7DI1xvS42CUif6sJlxqaDxYwzzFho1aCVfhCUT8VU8YY24bWg9RnZk1EqkK3B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=cUZ2jZs3; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="cUZ2jZs3"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4720f3bf164so342937f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 09 Jul 2026 02:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1783590405; x=1784195205; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jCDpigf6NAvGtv4KCK1nKWmd+1oUaDS0btU+snL4BhY=;
        b=cUZ2jZs3CBzcw9ITDguBXjdMkWvvAC214XaHjyoq90rBob86KOU/+yQyj1ktffnD9p
         OpTMwuKs2jJPJn77eRvEO+KuEo3Zqwhfvu5lmVDP2sqxf6ygE0vj3p2h3vK0uNp9/bEO
         pxLQSFmGbY1KUVaAZtGrd+2gH3TYx5ERTXUJ3qkgJb/44iKHwcmmuP3bk+vAr7CKJ5Dr
         n1ZJKQ9ryNHX4+Z18cTN6QH62QAnBBNYbRSIH6K0fg0EuDNAUkV58/73PwT3wfgT5J8p
         flHgTIZEQvAPwBAqpxZYnIgF2ySdUGbBr932kRyWkvf9IVnFT99FOLELz9uDhaw5Es8a
         Fwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783590405; x=1784195205;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jCDpigf6NAvGtv4KCK1nKWmd+1oUaDS0btU+snL4BhY=;
        b=Pt2o8mRmWHFRyLNZLdzyuNmau8JBs1aLM9MV6VpA8J994MAT/BO+ceScwI9FrK75i3
         OyD4ZMA0NUpkqjRPRtzJIimYEaQ687qrUH38VFtdf06x4cc9kJ6lFXdCEfiTHdRU21vr
         rZJUaAGvjaFJ3EzXLd5dF2HS/U6LFqOq85+R7X5r5BMFfkZc+ksipAJio4quyvF6QswD
         hYtcZ+Yaiye1pAkKC1yQ5OcQ/EINVcYa+GmQFYB8Y6fGA7iw4QMWekXPnnhvy7ZyXv0m
         z0pUJg6Iyr2pywAZ29OwVMUrXnDofpoK8ZxcFtLdC7lSn4iksTfF11KTmu+bmuWCSyGU
         gFmA==
X-Forwarded-Encrypted: i=1; AHgh+RpFL7omI1+msWkYN0ODifJ1OW9PWbztkVDIA2Z0Om8Y6sHMzWWA4PAjrno6QHKSg0L0zwBiLuw0ncQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Z91Rg5JGYGMzmwvmg1PSJ59U//nalBSGnG6e2At8K1whLqTV
	QZb1V8Ym/f4bpARf8US5zCfg4N8SaBTTQjP4A3K0YiJ+Y+WWu4QEh7mK7YzwGx29QmI=
X-Gm-Gg: AfdE7cn9ge5A3d9nX1sPzVljD+UnxzbvLLkbtzRLpX5fjbQdT9OKjZ0amxQz0jug1YO
	QoxTQPx6U8gAxiNdswVRLuv797v6Ko/8AVfrenQ0mr7D3iBZc4Z3EX8HN0Twdm9W467DxiqrYei
	jtdfX4XC2ZLlVv7RU/AxsVaYi0b6XFh77Ssdwt+9HT5cBt8PUcm+WRIkImDWEV+DuNiFkGlTguM
	YG5eKG6Xb7+iMK+6yPW3KQ7jNK18yCb9qG0hK204pn5X/qdXdsNJo4SBcRSEhkMMKiTIzH5OvUF
	5vdqnBqPkwnw8RFeUxbWynrxJpA3j01ZrI+0GnhUnBZ5yMKs24qG/JELkd5cEDZGbqe0nt/GhuZ
	ELh/69F4pYiGIf50CZT8qwKsFaiiPaQxCVkaj/EZncRdiEoDRc6iNt16xJfZ/x2gV6KavEiIsSo
	C4aob5cGMSwaQcARQfiuHctw==
X-Received: by 2002:a05:6000:4602:b0:475:f0c2:75ae with SMTP id ffacd0b85a97d-47df7561a22mr2165637f8f.25.1783590404637;
        Thu, 09 Jul 2026 02:46:44 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm53671269f8f.7.2026.07.09.02.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:46:44 -0700 (PDT)
Date: Thu, 9 Jul 2026 11:46:40 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Mark Bloch <mbloch@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next V5 4/6] devlink: Apply eswitch mode boot defaults
Message-ID: <ak9thhKgtDBepkcD@FV6GYCPJ69>
References: <20260707174527.425134-1-mbloch@nvidia.com>
 <20260707174527.425134-5-mbloch@nvidia.com>
 <ak4Muihtk40r3lfV@FV6GYCPJ69>
 <e9445ff1-87b5-4111-8264-74016634d3bb@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9445ff1-87b5-4111-8264-74016634d3bb@nvidia.com>

Thu, Jul 09, 2026 at 07:45:20AM +0200, mbloch@nvidia.com wrote:
>
>
>On 08/07/2026 11:59, Jiri Pirko wrote:
>> Tue, Jul 07, 2026 at 07:45:25PM +0200, mbloch@nvidia.com wrote:
>>> Apply parsed devlink_eswitch_mode= defaults after devlink registration
>>> and after successful reload.
>>>
>>> devl_register() may still be called before the device is ready for an
>>> eswitch mode change. Keep the registration path passive and let the
>>> regular devl_unlock() path queue the async apply work once the instance
>>> is registered and the default is still pending.
>>>
>>> The queueing path runs while the devlink instance lock is held, so the
>>> queued work gets its devlink reference before the caller drops the lock.
>>> The worker then takes the devlink instance lock normally and applies the
>>> default only if the instance is still registered and the default is still
>>> pending.
>> 
>> This is very code-descriptive. What's the benefit of that?
>
>The point is that there is still a window before the queued work
>runs where the user can explicitly set the eswitch mode. If they 
>do, the default will no longer be pending, so the worker will skip
>applying it.
>
>I'll reword.
>
>> 
>> 
>>>
>>> For successful reloads that performed DRIVER_REINIT, devlink_reload()
>>> already holds the devlink instance lock and the driver has completed
>>> reload_up(). Clear pending work and apply the default directly from the
>>> reload path instead of queueing work.
>>>
>>> Preserve the user configured mode when it is set before devlink applies
>>> the default.
>>>
>> 
>> [..]
>> 
>> 
>>> +void devlink_default_esw_mode_apply_locked(struct devlink *devlink)
>>> +{
>>> +	const struct devlink_ops *ops = devlink->ops;
>>> +	int err;
>>> +
>>> +	devl_assert_locked(devlink);
>>> +
>>> +	if (!devlink_default_esw_mode_match(devlink))
>>> +		return;
>>> +
>>> +	if (!ops->eswitch_mode_set) {
>>> +		if (!devlink_default_esw_mode_match_all)
>>> +			devl_warn(devlink,
>>> +				  "devlink_eswitch_mode= selected this device but eswitch mode setting is not supported\n");
>>> +		return;
>>> +	}
>>> +
>>> +	err = devlink_eswitch_mode_set(devlink, devlink_default_esw_mode, NULL);
>>> +	if (err)
>>> +		devl_warn(devlink,
>>> +			  "Couldn't apply default eswitch mode, err %d\n",
>>> +			  err);
>>> +}
>>> +
>>> +void devlink_default_esw_mode_queue_apply_work(struct devlink *devlink)
>> 
>> eswitch/esw - we call it "eswitch" consistently everywhere. Why "esw"
>> here?
>
>Ack
>
>> 
>> 
>> 
>>> +{
>>> +	devl_assert_locked(devlink);
>>> +
>>> +	if (!devlink_default_esw_mode_enabled || !devlink_default_esw_mode_wq)
>>> +		return;
>>> +	if (!devlink->default_esw_mode_apply_pending ||
>>> +	    !__devl_is_registered(devlink))
>>> +		return;
>>> +	if (!devlink_try_get(devlink))
>>> +		return;
>>> +	if (!queue_work(devlink_default_esw_mode_wq,
>>> +			&devlink->default_esw_mode_apply_work))
>>> +		devlink_put(devlink);
>>> +}
>>> +
>>> +static void devlink_default_esw_mode_apply_work(struct work_struct *work)
>>> +{
>>> +	struct devlink *devlink;
>>> +
>>> +	devlink = container_of(work, struct devlink,
>>> +			       default_esw_mode_apply_work);
>>> +
>> 
>> What happens if userspace eswitch mode set happens now? Any userspace
>> attempt should cancel the default apply. I don't see such mechanism in
>> your patches, did I miss it?
>
>devlink_nl_eswitch_set_doit() calls
>devlink_default_esw_mode_apply_pending_clear(), which clears the
>pending bit.
>
>So if a user sets the eswitch mode before the queued default
>work applies it, the worker will see that the default is no longer
>pending and will do nothing

Okay.


>
>> 
>> 
>> 
>>> +	devl_lock(devlink);
>>> +
>>> +	if (devl_is_registered(devlink) &&
>>> +	    devlink->default_esw_mode_apply_pending) {
>>> +		devlink_default_esw_mode_apply_locked(devlink);
>>> +		devlink->default_esw_mode_apply_pending = false;
>>> +	}
>>> +
>>> +	devl_unlock(devlink);
>>> +	devlink_put(devlink);
>>> +}
>>> +
>>> +void devlink_default_esw_mode_instance_init(struct devlink *devlink)
>> 
>> Why "_instance_"? Care to drop?
>
>Ack
>
>> 
>> 
>>> +{
>>> +	INIT_WORK(&devlink->default_esw_mode_apply_work,
>>> +		  devlink_default_esw_mode_apply_work);
>>> +	devlink->default_esw_mode_apply_pending = true;
>>> +}
>>> +
>>> +void devlink_default_esw_mode_apply_pending_clear(struct devlink *devlink)
>>> +{
>>> +	devl_assert_locked(devlink);
>>> +
>>> +	devlink->default_esw_mode_apply_pending = false;
>>> +}
>>> +
>>> +void devlink_default_esw_mode_instance_cleanup(struct devlink *devlink)
>> 
>> Why "_instance_"? Care to drop?
>
>Ack
>
>> 
>> 
>>> +{
>>> +	if (cancel_work_sync(&devlink->default_esw_mode_apply_work))
>>> +		devlink_put(devlink);
>>> +}
>>> +
>>> static int __init devlink_default_esw_mode_setup(char *str)
>>> {
>>> 	devlink_default_esw_mode_param = str;
>>> @@ -228,10 +325,21 @@ int __init devlink_default_esw_mode_init(void)
>>> 		return err;
>>> 	}
>>>
>>> +	devlink_default_esw_mode_wq = alloc_workqueue("devlink_default_esw_mode",
>>> +						      WQ_UNBOUND | WQ_MEM_RECLAIM,
>>> +						      0);
>>> +	if (!devlink_default_esw_mode_wq) {
>>> +		devlink_default_esw_mode_param = NULL;
>>> +		devlink_default_esw_mode_nodes_clear();
>>> +		pr_warn("devlink: devlink_eswitch_mode parameter ignored, failed to allocate workqueue\n");
>> 
>> Why you don't "return"  here? I think that we don't need to allow the
>> case wq is not allocated.
>
>The function returns right after this block. It is not treated

What I ment was "return error".


>as a valid “workqueue unavailable” mode, the parsed defaults are
>cleared, the parameter is ignored, and no default eswitch mode will
>be applied.
>
>I kept it as a non critical failure so we do not abort the whole
>devlink init just because the default-mode workqueue could not be
>allocated.

Why to treat it like this? Is there any other example of such flow in
devlink? I don't see the benefit, only potential confusion in very
unlikely case the alloc_workqueue fails. Am I wrong? If not, just bail
out here.



>
>That said, I can make this more explicit by returning 0 directly
>from this error path.
>
>Mark
>
>> 
>> 
>>> +	}
>>> +
>>> 	return 0;
>>> }
>>>
>>> void __init devlink_default_esw_mode_cleanup(void)
>>> {
>>> +	if (devlink_default_esw_mode_wq)
>>> +		destroy_workqueue(devlink_default_esw_mode_wq);
>>> 	devlink_default_esw_mode_nodes_clear();
>>> }
>> 
>> [..]
>
