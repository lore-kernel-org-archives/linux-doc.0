Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CD62DEA89
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 14:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782914962; cv=none; b=uyzFOH0XsRedeE1vZBHXTUHENYrXT4tXl35AT+5oefT+/Lqxqrl/fG0PbYq/wD11HRG3bTYO6+mmcfaoCpcnaB+9j005wdMqr3Su1ylROTA764Gw4pgh5lUPfD0mCaLhbzA/AhFLq7Uf9KPMiOhX6gn9wu4OiIiZG8WX0+UJ0KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782914962; c=relaxed/simple;
	bh=9573nrWrSx/Y9UOpr/TlheCNkMPqUyYtfuIixr6r3Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kxEqGHCE9gcgLa5vZy3zQUT1BAkJhnS/tDqi/zxE3w4mC/CVjmv86mKNeeRgkjBY2mXJpgft2QBVEPwIhiPy61d532/Ef9vH+va/UG3377pJueI1CdarTWShTIVCjY7NE+xszfAsXkJhruVryO4SC1VjwbUL0tXxdZi9wkDm4SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=n41nM9bK; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b="n41nM9bK"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c1254b73d63so91289366b.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 07:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1782914957; x=1783519757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h5yGg7xTrcKVGSs2/RAkolvsvNsO9JL3VCUQsl5nfCM=;
        b=n41nM9bKknfDSII57sUQPENrA4Ng5DsEfRL3eWWCo/bbwhodzoikFkhqKLOweRDaci
         7pyaqeO+O32WrlUmGJSf46JU91myU51QRi5yMo89WymHVuGtOSiF6gpkg3WTbIcsewnC
         zzz83E61Q/ukK9yzOE2did4Klq4Bp6TB7RjRXE4LvhS+xDTegZe4CcJmggUaAAS+AfJo
         8tZPOGn/pVVJkHAKeC3xqzHKuVO0v6pQcrb8gXCI488U1e/bczogCOWyKdyH72/KDAZV
         7UxEHJC0ctXfPVk0vGJIAfkHsOtIlOlVtnXp445XuNJK3oZCCYMegSj5Ez/nxm7CYYCG
         tazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782914957; x=1783519757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h5yGg7xTrcKVGSs2/RAkolvsvNsO9JL3VCUQsl5nfCM=;
        b=lYizK1t/KsYimlWc4orLvuEf0hvkkj4HyhwbUwwoTnEtKSiBIXHobhSnInk4Y+KWVb
         EMoGwmNzItRth/F0kz90zBQn0rNWjT+BdLRREVcgnMgGFf5gEqI6xBw36kbsVDSt/Qea
         KlriS+LZYatiLRa6MIS2OBUBIwfttV/uQV4NU8VMlvP0vZ7hlDdkKdmmgLJnhOEFza9z
         wIYVL2grgjx/bfNkP+EwKttP9DRHXhfztUaNr/o0rdaCsMunBEzdNYFrxLaCin5iBI9Z
         VvKjrdGd/WrXHANo3pBBNQKshtSXvA6TrKwETD2NRKQlMaIxknjkvDtfD8YsDc5ta9X2
         zaUA==
X-Forwarded-Encrypted: i=1; AHgh+RoNTy9axFJ1qKLvSzEY/VAoqmh6aS9Ue/QltrMX4X8RnxhaeGCwifTcD9udpI27zR0j14CA++NkMgc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUURwEforKajNzvH7sIACkegqrmp40jVTRYFi6nnECq+J0V8X+
	7nZsf2zoDcUd2l3+ydgjQq8Id3TJsQzA0PNSUJNf6Tf6TJMffPXkVF5XguzJ1+EZ0DU=
X-Gm-Gg: AfdE7cl/ypQtL93jA5dxOO1KLDT9tWWOkkyVwbwoqwL+/oAJEI+cqSw285f96FuC8zN
	7I6VMRBpllMUWLepVc+63YgUb6pT9g0sqo5VeBaoHbew00Uu7hat5h1/4themiLT6nRMtMbexhJ
	NzyXdzlQy/05zBbvqPP5LWBzrf0xPVp24Mswwaw6aQyeguMnKg1yR5Y3MjAypEnQVdQg6NYbOxi
	Wx4yB/RdALveB/hcin8AWVIuS86l8JfJbqMli+YqBtF7OELxCZdICq+hWOezDUGZMCUU/SRDG/R
	N2YGhrdr/Ub72cxSvOtSaAxlorI/HkvLD6H10gqJM74gjIplTtcUhvXfX9Pp9iTekvVaUUYgWLQ
	1IRyScL0S5BGZW4gI3I9XuRFpMIBzWLC4KCpemYaGRLiOGKAB1jA4bupTpynCmxMhQDDzSiTiOL
	0T6pTRN4mfD7oVXq0Z6+B5ww==
X-Received: by 2002:a17:906:e907:b0:c12:8ec5:eb8 with SMTP id a640c23a62f3a-c12aa1411eemr71054966b.41.1782914957090;
        Wed, 01 Jul 2026 07:09:17 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d6a3e8sm281311366b.19.2026.07.01.07.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 07:09:16 -0700 (PDT)
Date: Wed, 1 Jul 2026 16:09:12 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Mark Bloch <mbloch@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next V4 4/6] devlink: Apply eswitch mode boot defaults
Message-ID: <akUfXyKioGNAO_iB@FV6GYCPJ69>
References: <20260629182102.245150-1-mbloch@nvidia.com>
 <20260629182102.245150-5-mbloch@nvidia.com>
 <akThPmvUHvCMT2cp@FV6GYCPJ69>
 <1d4ca929-82b8-4891-9058-1451bf71a660@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d4ca929-82b8-4891-9058-1451bf71a660@nvidia.com>

Wed, Jul 01, 2026 at 02:57:21PM +0200, mbloch@nvidia.com wrote:
>
>
>On 01/07/2026 12:48, Jiri Pirko wrote:
>> Mon, Jun 29, 2026 at 08:20:59PM +0200, mbloch@nvidia.com wrote:
>>> Apply parsed devlink_eswitch_mode= defaults after devlink registration
>>> and after successful reload.
>>>
>>> devl_register() may still be called before the device is ready for an
>> 
>> How so? I would assume that driver calls devl_register only after
>> everything is up and running and ready. If not, isn't it a bug?
>> 
>
>You would think so :)
>
>Some drivers, mlx5 included, call devl_register() while holding the
>devlink instance lock and then finish setting up state before releasing
>the lock.
>
>In v3 I tried to enforce exactly that model, move devl_register() to
>be the last thing the driver does. Jakub pushed back on making that a
>general rule. So in v4 I changed the approach. devl_register() only
>schedules the work, and the actual eswitch mode change can run only
>after the driver releases the devlink lock.

Wouldn't it make sense to use a completion instead of loop-reschedule of
delayed work?

>
>Mark
>
>> 
>>> eswitch mode change, so keep a per-devlink delayed work item and pending
>>> flag for the registration path. Registration queues the work, and the
>>> worker tries to take the devlink instance lock.
>>>
>>> If the lock is busy, the worker requeues itself with a delay.
>>>
>>> For successful reloads that performed DRIVER_REINIT, devlink_reload()
>>> already holds the devlink instance lock and the driver has completed
>>> reload_up(). Clear pending work and apply the default directly from the
>>> reload path instead of queueing work.
>>>
>>> If a user sets eswitch mode through netlink before the pending
>>> registration work runs, clear the pending flag so the queued default does
>>> not override that user request. Cancel pending default apply work when
>>> freeing the devlink instance.
>> 
>> These AI generated code descriptive messages are generally not very
>> useful :(
>> 
>
