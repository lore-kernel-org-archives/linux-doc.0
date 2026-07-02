Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57423CFF7F
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 07:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978760; cv=none; b=DMFPYDps2WJWy+LsQqwCgAFMUD+QMWMMPiqevE6Q1PZ9KkZFU7+sp6iRVjblIKYXcamnEoGIBAe2GDmhh+1KVPQTNnWyZeDZK72LrCfAJAh4uXYisBj6axCsyQw/9mXX4MtbxonFiWfg6JNqBRwA8FOKInknKzUqecUD8zNZ6JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978760; c=relaxed/simple;
	bh=tkTbs5WEomVgmghemsBWZ8vvMtlIsS90pwefFFYS67o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHRvzdw6eIbSzsdnMWdX6X3Q9Um27EXlpE5AJK4O0EojSn4rSf+13rfESOZLh/1wU+rBzKTXJpkNU86CBbwbJjCYFKyDPpoyxx0XsMQN+m3+C7NfjdDMKz8i+YlQpXJsuHTkyRESso7LUQM/1F3P5hzRGTcFfbj00jaV4h0RIfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=LGzO9brO; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="LGzO9brO"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47122683cf3so1101064f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 00:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1782978748; x=1783583548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kESoQxWQJP4S+fDdlEQZkP18r4Y5za67xWurR8NPaGI=;
        b=LGzO9brOLsAmggJcjv2mpsSISA3wkiKChF1hBC3mjlzBxpToiPRqxUzAJg3u9PxWn+
         MjJufWTFv3xlPnBH6C9Wf5RtZEeovjxJLea8QpAILr/Y9JZq+9/VzEsYUa3JWf6eY/qT
         eS6IU2T/yluuO1KvWcDr+N5zNvXe3cO4C8XuS/DKDtbI9a3lUoEx3gFjjAYR5rNJIRGj
         LEqpaaMf9EV/eCU4pP94N2bc3oPHvkFuv/hsw5tyGqI5Vs//XxC+xHfePBZ3oxyn06T+
         e1aQhaKzoF7MlUjDEvskQG+XS5e7Kduz4VbzEEVUh7ou3sUSNSNclz4WZNw4OWBLTngP
         SSnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782978748; x=1783583548;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kESoQxWQJP4S+fDdlEQZkP18r4Y5za67xWurR8NPaGI=;
        b=hfdD8N0ic9WrlHMWvLI1Ew0BAqj3OqyXx5loQHDcuvqJ/sq8QR9bIfYEQE8DdbBUMn
         VtJL1Z9yH1N0vSvFN5TATIvi1kpoZFAxwcS9baAr2k7C8YYYcUqVUzg0TSOe2JzpZown
         uuQG3y2fvrrAK+k/dAOwrbUByKsCcllLfRevAeWxieJDvJVxlPSUIISE1K06V64H6+l8
         Pad2BJKsqTi682owLpj+6KavqaJUlFYNgr2T5+lhhBNG+Kk03KNbNfrWeOlAIYuTh+f2
         IBIaODSJnq3Uy8FY1XZAWSJMRBZJp5UbEhuyJwjfyryWJoqY46lxTXRBjhvXyyvg3Vy2
         ieaA==
X-Forwarded-Encrypted: i=1; AHgh+RpthD67MOM+fbvXc9J+416HZRZBtPx+s7xbRnrYPJzQ8B82SygaYy2juu3SgQgoeHHLtn8f/hkDuiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzSDaccWaJbbDa/FDaKR7UaPeSw0oxeGMQaMteBsPUDTskOk08
	ef9+RTtOEpuzgfqjoChbp9FMqga5A4HuwTVo9GH2eWEXbCdgvnBM7HAPalzWeJZhMz0=
X-Gm-Gg: AfdE7cmnO+kjLDAF/HlJUOksxtmnxZEafpoYln3z+o/UkWjmSNuhMsRftliZeUpq0/5
	ierhgv8w595oLa5FTGzT1pX5Kmb+D9+1ssmZVv2IaSdwBYpDeP5yrfL5XGE6ZdOUV58f0v+iISY
	1oaRB4SPD2Yhmrw0dtEKUWhKdMNYa933VwTF56Nmzs89x6OBPYxT8U5tkLwvnQ71FX2G16X52Pz
	oKZgErylsfvYeY1q1teD425l41TgtfqlYpyr6GV32bv3tfBZbC8e7Fo9AwctGmAt7PBfmp0VDbN
	bUrZjUieCkb5kfqMGXAZdV2otrfZec8vHVGU+n8CQnWpaI/uX0StoscP8hshSGXugqdYSt0h6Ao
	olMTIzpjD0+fXSh50t1t9bk36HnUMGtt0GIM1wzvIRHyS5Dd9iPKQeMoo0t+M9n/fUnofQ1DOe9
	YWl/rSEqz7Y5On0TmeYLKLnwloTimj6U69
X-Received: by 2002:a05:6000:4687:b0:475:e015:c2a with SMTP id ffacd0b85a97d-47757e57e6cmr5234114f8f.8.1782978747939;
        Thu, 02 Jul 2026 00:52:27 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94cb64sm6592524f8f.23.2026.07.02.00.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 00:52:27 -0700 (PDT)
Date: Thu, 2 Jul 2026 09:52:25 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Mark Bloch <mbloch@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next V4 4/6] devlink: Apply eswitch mode boot defaults
Message-ID: <akYX4pMrDTnxa6yK@FV6GYCPJ69>
References: <20260629182102.245150-1-mbloch@nvidia.com>
 <20260629182102.245150-5-mbloch@nvidia.com>
 <akThPmvUHvCMT2cp@FV6GYCPJ69>
 <1d4ca929-82b8-4891-9058-1451bf71a660@nvidia.com>
 <akUfXyKioGNAO_iB@FV6GYCPJ69>
 <ecaeeef0-c463-4f10-885a-02ad2d648be0@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ecaeeef0-c463-4f10-885a-02ad2d648be0@nvidia.com>

Wed, Jul 01, 2026 at 07:42:57PM +0200, mbloch@nvidia.com wrote:
>
>
>On 01/07/2026 17:09, Jiri Pirko wrote:
>> Wed, Jul 01, 2026 at 02:57:21PM +0200, mbloch@nvidia.com wrote:
>>>
>>>
>>> On 01/07/2026 12:48, Jiri Pirko wrote:
>>>> Mon, Jun 29, 2026 at 08:20:59PM +0200, mbloch@nvidia.com wrote:
>>>>> Apply parsed devlink_eswitch_mode= defaults after devlink registration
>>>>> and after successful reload.
>>>>>
>>>>> devl_register() may still be called before the device is ready for an
>>>>
>>>> How so? I would assume that driver calls devl_register only after
>>>> everything is up and running and ready. If not, isn't it a bug?
>>>>
>>>
>>> You would think so :)
>>>
>>> Some drivers, mlx5 included, call devl_register() while holding the
>>> devlink instance lock and then finish setting up state before releasing
>>> the lock.
>>>
>>> In v3 I tried to enforce exactly that model, move devl_register() to
>>> be the last thing the driver does. Jakub pushed back on making that a
>>> general rule. So in v4 I changed the approach. devl_register() only
>>> schedules the work, and the actual eswitch mode change can run only
>>> after the driver releases the devlink lock.
>> 
>> Wouldn't it make sense to use a completion instead of loop-reschedule of
>> delayed work?
>
>Just to make sure I understand the suggestion, this would mean that the
>work waits until the devlink lock holder drops the lock, and devl_unlock()
>would signal it, something like:
>
>void devl_unlock(struct devlink *devlink)
>{
>	ool complete_apply = devlink->default_esw_mode_apply_pending;
>
>	mutex_unlock(&devlink->lock);
>
>	if (complete_apply)
>		complete(&devlink->default_esw_mode_apply_ready);
>}
>
>That would avoid the retry loop, but it also means the queued work 
>sleeps until the driver drops devl_lock. It does keep one worker
>blocked per pending instance and adds this default-esw-mode signalling to
>the generic devl_unlock() path.
>
>The delayed retry was meant to avoid a sleeping worker and keep the
>instances independent. If one devlink instance is still locked, we just
>try it again later while other instances can progress.
>
>If you prefer the completion approach I can switch to it, but I don't see
>it as simpler overall.

Yeah, I don't have preference. I was just wondering. Feel free to leave
it as is.

Maybe, instead of "complete", you can schedule with "0" delay in
devl_unlock? Well, it does not really need to be delayed work, right?
The only single schedule may be done from devl_unlock. That would help
to eliminate the rescheduling. Am I missing something?


>
>Mark
>
>> 
>>>
>>> Mark
>>>
>>>>
>>>>> eswitch mode change, so keep a per-devlink delayed work item and pending
>>>>> flag for the registration path. Registration queues the work, and the
>>>>> worker tries to take the devlink instance lock.
>>>>>
>>>>> If the lock is busy, the worker requeues itself with a delay.
>>>>>
>>>>> For successful reloads that performed DRIVER_REINIT, devlink_reload()
>>>>> already holds the devlink instance lock and the driver has completed
>>>>> reload_up(). Clear pending work and apply the default directly from the
>>>>> reload path instead of queueing work.
>>>>>
>>>>> If a user sets eswitch mode through netlink before the pending
>>>>> registration work runs, clear the pending flag so the queued default does
>>>>> not override that user request. Cancel pending default apply work when
>>>>> freeing the devlink instance.
>>>>
>>>> These AI generated code descriptive messages are generally not very
>>>> useful :(
>>>>
>>>
>
