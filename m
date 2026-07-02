Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAFC3B3883
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 07:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978120; cv=none; b=RLSRIlGS0sA3nBuGeA1WRta6yqiC/EE2T5S06LikiKoDUFXJt+zj3j8//LMiAeP578WzsJOY0BZBCYamFosxWsoYUDL/ewX+95XurrhBd0inW0kwN9DRmV9PxGxg67bTKZhWA0F+efrMWsCupfWTy/JLQmkfEeS5R2/PBT+c/p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978120; c=relaxed/simple;
	bh=Jy7te9F4JzjiJ24kXaDzZA0x2YkjrWkIuXyfcffXSNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mwUtpwCmbcs/gsolZE5iCaSuDiVgzDNUiehn4q8cxaxSGdek+xcpnv8XWfr6dh4kQNs+RkjopXUaOnWUrVJ1E6Uqf+FiH59R83+8wbAfT3Sc7HCG4V9xggHyFcCNbtUEfYc8FkrWksWH4qylOM06fwoikVYEgI9tcAzYLdTiKX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z0zIwPb8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hs9gKVEx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z0zIwPb8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hs9gKVEx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782978116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UfJYqrcmN2j5NYMZu30t1ga7TK1DhGbiNFDYQD6B84Q=;
	b=Z0zIwPb8oRkrsuGCuWqd3ZxAQO7RVfUwbBlCamBShIrhSNrniOQnD70h2vrbsfFuhB0P/d
	0fQqDzfYkUF7hMtwMkdaN/IB0wTtjGWkr0k8mUyWjqkeck5wR6X0lniw5MA0TpI/Wu2nNQ
	3xGDmy5nglU9AYm688Sq29C/axCrOrE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329--4so4Lj8Mhe7XUFlnm7YNw-1; Thu, 02 Jul 2026 03:41:54 -0400
X-MC-Unique: -4so4Lj8Mhe7XUFlnm7YNw-1
X-Mimecast-MFC-AGG-ID: -4so4Lj8Mhe7XUFlnm7YNw_1782978113
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-473de38dcfaso999059f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 00:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782978113; x=1783582913; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UfJYqrcmN2j5NYMZu30t1ga7TK1DhGbiNFDYQD6B84Q=;
        b=hs9gKVExnvSis062Ar9tXMTNdD22HQOGQSwfUnQ0WYd6z3thW8f5O9lC+ho9k6OsX6
         4TBT3ads+oNnd9iB6RJ42GQcXnZAyX8O9qOFtl/127dP9OpUIcE6jQMEIN5GtxPln4IF
         VYuvWm/16+O+W5thcbB+wV/6GuyCRtoB/wK9vB3c3X61zm5J9ZJu9T9qYq2WaGH79WVf
         HLSCxfKTgUYBzt0J28dmXFQ/xLlrnYDNT8hmiZPiMLv0AP/S2E6/l4z+/r8PkQ1vqytG
         415rB6p0QD8JzVVZzFcuRb1r75j6TtX89Ns2qrnPP9JjO/wt1604hx8mYDtGVARpTNYM
         WTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782978113; x=1783582913;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UfJYqrcmN2j5NYMZu30t1ga7TK1DhGbiNFDYQD6B84Q=;
        b=MBIPdOcTjQgUCQKaQzfanPRuyf25MLgq5a3KOAYPd8k04UowT9GUmEL0Dc6NGYqv7O
         I+Zkd79FBKs9smLY/ufID9q/iS6iS2ZKYJIQ5VoSx3w7QCH69tGrQ2fGOP0RiKVC16lh
         Gd4H6nG8iYsKhOMEHS8txllzuyZObh7X2/9XbHabyOKQ6L4RFhHVrq6rFN/43wcOX6Ag
         /m0rU3xsve2Leq+0SAG37t1yBwVz8iNEHhrrBZlUbWDn0y+XKo/uM1YRURs7qEwqBk5B
         znIFBA3HKaxaAV4HQHgJTo1MZ/YVVV8SAPXl0y7z4SyIeuNq/UCMIb+aBDzMCiSYqcLO
         13vA==
X-Forwarded-Encrypted: i=1; AFNElJ+KPzMNmWC7AmNEErXMTizJlNWmehGEZtMfXd6q6HSUztsX0Ec3aCRIdAgExq06xR8omKUSeTkxjQc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeEhzG7DyH7+fQGGdB3d5UFuGNJzVo62cul35OJ0313NRbvQ8F
	ThPrFdfiruxi9F+/lt8PjR6Igy/gr7TAwzq6zRgXKeNaSkZ4qPE58rwmNNb0KfOGYxuBKgNb2iz
	XxqnyObrceXHt47kbxWqXL9Y5ggLXRDf5KkpIpWg/XM9x4PhZs0mIg8YMO0gszg==
X-Gm-Gg: AfdE7cm3zLi3QMJmfNUf9aptB5XjmjqpNeAaBLEIQABE0M9FrAZPfiKCoMiyiM7/0dc
	sWQq6GpN0STVkj2RlfmDJ0JvtfPhZvDfx9rLBlcmlDjDdXYIDLNqWC07nDh1gXowV/89UI1q5yZ
	pbz9yfCQGdsqUvQ9ogJASynBLyolEGXWEuI8q1CxQTm5COnmFqGyo7GbR7y69BIs+fGDtlU3tzA
	oQCT8BW7X6E8y62kx/y6jAnB/ZpLy8JyUSIkqvbSIJV3+h0QbJ+c4X23v7aETwdfsSzw6XJC327
	67pxRsCE9GyYFtCVVsg0KWPvcxFbNNEOx6NPLTxJomeHbCDnq1ngDNJZgPGX8X13KbJQytwUOmv
	N/KKTZPtdDLmPigAobRRVXORGxJ1TiX93y1NFyGomQ+qGlKehuQb/1fNY2pntcFsD6yW8RpKI97
	yoG7aavTPutA==
X-Received: by 2002:a05:600c:810b:b0:493:b61c:72c3 with SMTP id 5b1f17b1804b1-493c2b99c43mr64303605e9.32.1782978113471;
        Thu, 02 Jul 2026 00:41:53 -0700 (PDT)
X-Received: by 2002:a05:600c:810b:b0:493:b61c:72c3 with SMTP id 5b1f17b1804b1-493c2b99c43mr64303185e9.32.1782978112913;
        Thu, 02 Jul 2026 00:41:52 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:2eb7:f61a:75:4534? ([2a0d:3344:5521:6b10:2eb7:f61a:75:4534])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6377479sm28151965e9.15.2026.07.02.00.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 00:41:52 -0700 (PDT)
Message-ID: <b8ff6104-790e-441f-a095-d50843d241c4@redhat.com>
Date: Thu, 2 Jul 2026 09:41:50 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next V4 4/6] devlink: Apply eswitch mode boot defaults
To: Mark Bloch <mbloch@nvidia.com>, Jiri Pirko <jiri@resnulli.us>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 netdev@vger.kernel.org, linux-rdma@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260629182102.245150-1-mbloch@nvidia.com>
 <20260629182102.245150-5-mbloch@nvidia.com>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260629182102.245150-5-mbloch@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/29/26 8:20 PM, Mark Bloch wrote:
> Apply parsed devlink_eswitch_mode= defaults after devlink registration
> and after successful reload.
> 
> devl_register() may still be called before the device is ready for an
> eswitch mode change, so keep a per-devlink delayed work item and pending
> flag for the registration path. Registration queues the work, and the
> worker tries to take the devlink instance lock.
> 
> If the lock is busy, the worker requeues itself with a delay.
> 
> For successful reloads that performed DRIVER_REINIT, devlink_reload()
> already holds the devlink instance lock and the driver has completed
> reload_up(). Clear pending work and apply the default directly from the
> reload path instead of queueing work.
> 
> If a user sets eswitch mode through netlink before the pending
> registration work runs, clear the pending flag so the queued default does
> not override that user request. Cancel pending default apply work when
> freeing the devlink instance.
> 
> Signed-off-by: Mark Bloch <mbloch@nvidia.com>
> ---
>  net/devlink/core.c          | 198 +++++++++++++++++++++++++++++++-----
>  net/devlink/dev.c           |   6 ++
>  net/devlink/devl_internal.h |   5 +
>  3 files changed, 182 insertions(+), 27 deletions(-)
> 
> diff --git a/net/devlink/core.c b/net/devlink/core.c
> index 5126509a9c4e..998e4ffd5dce 100644
> --- a/net/devlink/core.c
> +++ b/net/devlink/core.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/init.h>
> +#include <linux/jiffies.h>
>  #include <linux/list.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> @@ -22,8 +23,12 @@ DEFINE_XARRAY_FLAGS(devlinks, XA_FLAGS_ALLOC);
>  
>  static char *devlink_default_esw_mode_param;
>  static bool devlink_default_esw_mode_match_all;
> +static bool devlink_default_esw_mode_enabled;
>  static enum devlink_eswitch_mode devlink_default_esw_mode;
>  static LIST_HEAD(devlink_default_esw_mode_nodes);
> +static struct workqueue_struct *devlink_default_esw_mode_wq;
> +
> +#define DEVLINK_DEFAULT_ESW_MODE_APPLY_DELAY msecs_to_jiffies(100)
>  
>  struct devlink_default_esw_mode_node {
>  	struct list_head list;
> @@ -166,6 +171,7 @@ static void __init devlink_default_esw_mode_nodes_clear(void)
>  	}
>  
>  	devlink_default_esw_mode_match_all = false;
> +	devlink_default_esw_mode_enabled = false;
>  }
>  
>  static int __init devlink_default_esw_mode_parse(char *str)
> @@ -192,14 +198,113 @@ static int __init devlink_default_esw_mode_parse(char *str)
>  		return err;
>  
>  	err = devlink_default_esw_mode_handles_parse(handles);
> -	if (err)
> +	if (err) {
>  		devlink_default_esw_mode_nodes_clear();
> -	else
> +	} else {
>  		devlink_default_esw_mode = esw_mode;
> +		devlink_default_esw_mode_enabled = true;
> +	}
>  
>  	return err;
>  }
>  
> +static bool devlink_default_esw_mode_match(struct devlink *devlink)
> +{
> +	const char *bus_name = devlink_bus_name(devlink);
> +	const char *dev_name = devlink_dev_name(devlink);
> +	struct devlink_default_esw_mode_node *node;
> +
> +	if (devlink_default_esw_mode_match_all)
> +		return true;
> +
> +	node = devlink_default_esw_mode_node_find(bus_name, dev_name);
> +	return !!node;
> +}
> +
> +void devlink_default_esw_mode_apply(struct devlink *devlink)
> +{
> +	const struct devlink_ops *ops = devlink->ops;
> +	int err;
> +
> +	devl_assert_locked(devlink);
> +
> +	if (!devlink_default_esw_mode_match(devlink))
> +		return;
> +
> +	if (!ops->eswitch_mode_set) {
> +		if (!devlink_default_esw_mode_match_all)
> +			devl_warn(devlink,
> +				  "devlink_eswitch_mode= selected this device but eswitch mode setting is not supported\n");

Not a very strong opinion on my side, but I *think* it would be more
consistent to emit this warning even for devlink_default_esw_mode_match_all

/P

