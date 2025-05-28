Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA731F872D
	for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 07:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748416920; cv=none; b=BLPhbG85zWjMLTBkam8XaCmQSnW+/Y6SuyR9eL0zVIs1O4BXqrqc95ncb+o2c0j3naDXIitzblJ8+gV05DJ2glYtfwuDK9DZ4xV6NWYL6RLllkhjT/vVdboTowZSY6UIPcoZ2Oe8E7vAlJ//iQX6fS1E/z4ufq1tOLtxX4NR2h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748416920; c=relaxed/simple;
	bh=o/EBQDrxGdj6WNmlZP1Kd/pL9W3EBdRR95FbKd6mj0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gwLBZZ9dQ4+7QoqBFwtJuw5f68/q3nf+LNuQHSBvl0nG6BZU5VPRc31R1PcQos9dMAIpFrBAPN4mA4WpzrqClXncIGDv1FZ6k/iVfx/KEJkHBGJW3NzkQhK9xuvH66pPjPKQpLBl6fkPbBKirG7pdNpVsLamk9FRDr9L1/jBLMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fMcSmsxW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fMcSmsxW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748416918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WaGWCYscG2gJE/9BxI7p6wq8i7SRMLbgQxHuw11S4oM=;
	b=fMcSmsxWj03XO8nq+n5mtc6BFVHY84T/S1uK+GvWACgJApIz94aw+s9HdXdBJWsmKmVrUz
	l0FYZarICScdFLw58i3+BUvuW7qbfPWzdDhJ8eUUurbTMhquxJr7BD1uTdu3kTe9USiEwy
	kf7ww+rU0ceizkI5Cmgvw/4ESbSzSqs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-YeXRsYJ6POihOPh-vXl0lQ-1; Wed, 28 May 2025 03:21:56 -0400
X-MC-Unique: YeXRsYJ6POihOPh-vXl0lQ-1
X-Mimecast-MFC-AGG-ID: YeXRsYJ6POihOPh-vXl0lQ_1748416915
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d734da1a3so23430135e9.0
        for <linux-doc@vger.kernel.org>; Wed, 28 May 2025 00:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748416915; x=1749021715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WaGWCYscG2gJE/9BxI7p6wq8i7SRMLbgQxHuw11S4oM=;
        b=baLeUF5l/3Lula6rS+WOC3NaPyaH4RSDezBEVhiqbUp8Kkz0ofryglaxts1oVGIJeA
         SvCfuQo+S5VdjE2jl3NugWpb4upHlOr+DX/5vnT5npg6uUq4OYLrwA9XNPceFIFss5Vi
         NrWJMJV/L1I8/5DovfvK0E0AWOgIj54MZ44VH6pJccGa3XxkjzeUnsdg9F9hVj++e5Qr
         fxeAQrzHTi6JmDTmrEF43kCSbaYmMLAyDx7b9EebHZBcuBRXqv3y0PerVY1D6bJpwJr6
         ipOBCyzNvxR+BUT3NSrsF6J4Xws/YudMIGH8C11BgDUFA1qw38kvdFrT/R7kZrl/6kqz
         tkIg==
X-Forwarded-Encrypted: i=1; AJvYcCWv9fIyapgsjkF4HRB/UALKuFKRqzNpSY+jdPtwXeUXspa+nbwkDk4hAYG8SnzE2OwGqqZ4omR7Zu4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr4whr7j/o5rWg2gMwfnk04188UDLzH88BQ5gx11Hw6+n2CEtu
	+RjntFRudAtenJ09g347tpPFvYvzXFfT/mMbRMobvQjKwHe047GINC0kdUwxELzB8KkBI9O8BaN
	qf1ZEq1SlnypA8yXhegLr9O4LefhdtdnXzUM9i3HfNfXDUEZXCr5CgIqp0htT8w==
X-Gm-Gg: ASbGnctAb9CeCv/CMyFVsXhhWlNtfpR7tLk5zgRk0sGt3yhHv2g/edwHPU9yOxOitvm
	p0N3ww6qBNc1XMFawfhsdx5lTAeWmd7YUlrVdLzsv/Z7Vk1tbr6KzLouc9HqlExh+OUKNap0aA/
	RGJStCWX74QfF4XjbufVsmU1CkHxxn+n2MRFkM1gk8txSM5026xsDzYqjbUBR2z1P89rz6SxJMT
	YjDJMQGqtAUbF347yHTNdE6t9wWkVreUbzjstubT/WtGjyr6J9hbO9VF886U4ck6kaJ4Ji9q+IH
	aUJ0euMm/WW03hbnVePx1AoHmBXvSbxNB6Tqo/y1Qaun1bIcxzUgy+98i04Q9osX2zFlnA==
X-Received: by 2002:a05:600c:5011:b0:43d:fa58:8378 with SMTP id 5b1f17b1804b1-44c94c2afbbmr135543695e9.33.1748416915217;
        Wed, 28 May 2025 00:21:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9fCAeAfcUeAKLwTnP6W7JttQB6exfEvg0cHvk7Qq1JvXftAAhGkUc468XOpjRQE7kLJI4xQ==
X-Received: by 2002:a05:600c:5011:b0:43d:fa58:8378 with SMTP id 5b1f17b1804b1-44c94c2afbbmr135543155e9.33.1748416914639;
        Wed, 28 May 2025 00:21:54 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2728:e810:827d:a191:aa5f:ba2f? ([2a0d:3344:2728:e810:827d:a191:aa5f:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4507253b902sm8490115e9.1.2025.05.28.00.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 00:21:54 -0700 (PDT)
Message-ID: <0a23a584-0aac-4c6a-bca4-3e220607cae6@redhat.com>
Date: Wed, 28 May 2025 09:21:52 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 0/3] dpll: add all inputs phase offset monitor
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 donald.hunter@gmail.com, kuba@kernel.org, davem@davemloft.net,
 edumazet@google.com, horms@kernel.org, vadim.fedorenko@linux.dev,
 jiri@resnulli.us, anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com,
 andrew+netdev@lunn.ch, aleksandr.loktionov@intel.com,
 milena.olech@intel.com, corbet@lwn.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-doc@vger.kernel.org
References: <20250523154224.1510987-1-arkadiusz.kubalewski@intel.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250523154224.1510987-1-arkadiusz.kubalewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/23/25 5:42 PM, Arkadiusz Kubalewski wrote:
> Add dpll device level feature: phase offset monitor.
> 
> Phase offset measurement is typically performed against the current active
> source. However, some DPLL (Digital Phase-Locked Loop) devices may offer
> the capability to monitor phase offsets across all available inputs.
> The attribute and current feature state shall be included in the response
> message of the ``DPLL_CMD_DEVICE_GET`` command for supported DPLL devices.
> In such cases, users can also control the feature using the
> ``DPLL_CMD_DEVICE_SET`` command by setting the ``enum dpll_feature_state``
> values for the attribute.
> 
> Implement feature support in ice driver for dpll-enabled devices.
> 
> Verify capability:
> $ ./tools/net/ynl/pyynl/cli.py \
>  --spec Documentation/netlink/specs/dpll.yaml \
>  --dump device-get
> [{'clock-id': 4658613174691613800,
>   'id': 0,
>   'lock-status': 'locked-ho-acq',
>   'mode': 'automatic',
>   'mode-supported': ['automatic'],
>   'module-name': 'ice',
>   'type': 'eec'},
>  {'clock-id': 4658613174691613800,
>   'id': 1,
>   'lock-status': 'locked-ho-acq',
>   'mode': 'automatic',
>   'mode-supported': ['automatic'],
>   'module-name': 'ice',
>   'phase-offset-monitor': 'disable',
>   'type': 'pps'}]
> 
> Enable the feature:
> $ ./tools/net/ynl/pyynl/cli.py \
>  --spec Documentation/netlink/specs/dpll.yaml \
>  --do device-set --json '{"id":1, "phase-offset-monitor":"enable"}'
> 
> Verify feature is enabled:
> $ ./tools/net/ynl/pyynl/cli.py \
>  --spec Documentation/netlink/specs/dpll.yaml \
>  --dump device-get
> [
>  [...]
>  {'capabilities': {'all-inputs-phase-offset-monitor'},
>   'clock-id': 4658613174691613800,
>   'id': 1,
>  [...]
>   'phase-offset-monitor': 'enable',
>  [...]]

I'm sorry, even if this has been posted (just) before the merge window,
I think an uAPI extension this late is a bit too dangerous, please
repost when net-next reopen after the merge window.

Thanks,

Paolo

