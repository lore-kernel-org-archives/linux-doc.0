Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF309399001
	for <linux-doc@vger.kernel.org>; Tue,  3 Feb 2026 09:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770111863; cv=none; b=qe2Hq3/K0oVl7khzrLfrvty43poht9gKaM0EuaFyOUBB4SV5moOhbSaP0JR9dIOtXweFdXDnnSYwBW3PSLHm6QfZTTZqq251g8ZzU0f0QaKB+1GiSpNv7uiNQBtJ2Iwa47uq+k242OpuaSKmQQt8e0eYsV8Wgt0U2TgQ8YGWdZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770111863; c=relaxed/simple;
	bh=+LoK5vMPKAT4d7HNt+4rYvxY6d0PqQkC7S4nBXL7pQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbHwkvjaQnKEEIkU779yUoDb37jiJz6G2G36ozfd6jnMV65Nt8/K3oCkqdHBMjyX4wvEfbbSX9zE3PixAPdf2GI7Pud0S3v6czfoRJrn64vFEzgsvxPumBan3uf8bfm7Uuyn153fi78Hf27MSckhMxAqX8+2H41P/r6FKsTveNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=XLNtWRHP; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="XLNtWRHP"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fed090e5fso4241595f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Feb 2026 01:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1770111860; x=1770716660; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+mmJhBHP/2MQgA56LecZqFvpbK/EEvY+icUfVMGut74=;
        b=XLNtWRHPQYSZVfrHI+VqXUFHrGZhLu1vFVp/9VLdOdSJpYpgkqv3eXNAdbrJTAv3hs
         8bQo2vGOpf20bI2zqLEAkiHe48erDDBrZhsh+tasKB/U5wiiToiPfeLGjYWp6Uq8tKGo
         +9zmHb81094Ss2S/tnfjBJ0u1gw/9jNv7TItFVFhHUCU33mP6H2CzT7+wV1d8eW23Nk4
         1DtOBY4x1r81rIu078oQJoD0YTMkYbqgUlpdgM9LL77V2V62Jr1J9NvVM4Bhr4N4Rx2m
         NuW1uGDHnbRizg+YdshHKIkbJY8Rwo1NDL9VQ/emxuxksC0KBU+/PFVuVJtx64M3Zkjv
         zjKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770111860; x=1770716660;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mmJhBHP/2MQgA56LecZqFvpbK/EEvY+icUfVMGut74=;
        b=vD89zPJSCE3FFa54DR/lnvwAA9MddkiCjTIK6geiHcIOPZ7EN1ZEp5MKzr4pzwI8PR
         AsQ+wehGQ1tjav5V8PYizKNOtWBSwraxMx62aEx4j1Q0l1kqRTDSUIbNXAxlpL/3m0/T
         oOT5qgn6s1OsfcSv6yOgE8QNo+dLCYfhe6Ydys4PrfzGNhlYMIoeieiFfpmL4ipMGV9Q
         zwqCp0rFs0soI/nCcc4fWrMyv4oeSQK1hTRth+LuNCk1Ar+A1MG3EJplzMoYa6rSx7GB
         Hg7ipBxgLF5XOiO4XarfJNG+Fyv7U8dHGQl09/kLTC7c/nI0ZDxNU/cLxnLOmltcKYaG
         d4Qg==
X-Forwarded-Encrypted: i=1; AJvYcCU9Sj8YE1fUotGOryfIIak7IbETujcDF+sKeTbLRlzAuYsPw68k8awAOW/XYdEqcu3l+2WWi0nBT/g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx0MpaYIXFddNbLMFKb2oKwOChSyvu+cnPcJqAF0U7MlfmGMuu
	yp7GREVAds+4DsQCqY3OgUePifwBI5Dx1k21gWDnCCt/2sp2FzYV6CTcyuEFY5GKSps=
X-Gm-Gg: AZuq6aII/rvzGqoOo71qlh9W8jBxnB7t4Hqksp34Nz0Fm6r7N5WOGb30y9ZU2C8OsvZ
	huo4eb8p5x4jq6FvRw1v4GF+TrNjUMqU41mw/agT36G383aCLKYmaVzUS1r1tNo9HZUEumjn4vn
	PPww24EyjwUTH6zqOLKffs/jKWRcvQGJ0z6Ptm06NFs/teWRh8unnwD6EWKUrx/lyQtMOh35Cv+
	qHNLbwFC/T9Uw3XhbWerQBsP2XUJAOt+7y9xTwXWoW02O3JbPF6uF851ZcmAKbE5rf7PZMnjj6p
	hE5I0ropVJRUvuGS8RbNnKTg0PlgJ2o5u3RGt5yItbHdvguNl1W4UTmPzebCgTtdL7TAzHAaOzJ
	+QnLGUqfGJIMhz3flbZJ0GM5FrwyTjFxCBXjehG2PehpUgWUsZO8J9bXOHzAiIf4AZkJGi+Nyo9
	74ToPPguS4q9PGk9o60i3hq6CCjpwX4Q==
X-Received: by 2002:adf:f7cc:0:b0:436:143c:c000 with SMTP id ffacd0b85a97d-436143cc130mr1101812f8f.45.1770111859982;
        Tue, 03 Feb 2026 01:44:19 -0800 (PST)
Received: from FV6GYCPJ69 ([85.163.81.98])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436142de842sm2407305f8f.30.2026.02.03.01.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 01:44:19 -0800 (PST)
Date: Tue, 3 Feb 2026 10:44:16 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Tariq Toukan <tariqt@nvidia.com>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Donald Hunter <donald.hunter@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org, 
	Gal Pressman <gal@nvidia.com>, Moshe Shemesh <moshe@nvidia.com>, 
	Carolina Jubran <cjubran@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>, Jiri Pirko <jiri@nvidia.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Simon Horman <horms@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH net-next V7 02/14] devlink: introduce shared devlink
 instance for PFs on same chip
Message-ID: <wdkd7yelgosii7bklmahxf5t6xnn2vydnwiiruiwqpyue722dj@yjnkcdctzeav>
References: <20260128112544.1661250-1-tariqt@nvidia.com>
 <20260128112544.1661250-3-tariqt@nvidia.com>
 <20260202194946.64555356@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202194946.64555356@kernel.org>

Tue, Feb 03, 2026 at 04:49:46AM +0100, kuba@kernel.org wrote:
>On Wed, 28 Jan 2026 13:25:32 +0200 Tariq Toukan wrote:
>> From: Jiri Pirko <jiri@nvidia.com>
>> 
>> Multiple PFs may reside on the same physical chip, running a single
>> firmware. Some of the resources and configurations may be shared among
>> these PFs. Currently, there is no good object to pin the configuration
>> knobs on.
>> 
>> Introduce a shared devlink instance, instantiated upon probe of the
>> first PF and removed during remove of the last PF. The shared devlink
>> instance is backed by a faux device, as there is no PCI device related
>> to it. The implementation uses reference counting to manage the
>> lifecycle: each PF that probes calls devlink_shd_get() to get or create
>> the shared instance, and calls devlink_shd_put() when it removes. The
>> shared instance is automatically destroyed when the last PF removes.
>
>> diff --git a/include/net/devlink.h b/include/net/devlink.h
>> index cb839e0435a1..c453faec8ebf 100644
>> --- a/include/net/devlink.h
>> +++ b/include/net/devlink.h
>> @@ -1644,6 +1644,12 @@ void devlink_register(struct devlink *devlink);
>>  void devlink_unregister(struct devlink *devlink);
>>  void devlink_free(struct devlink *devlink);
>>  
>> +struct devlink *devlink_shd_get(const char *id,
>> +				const struct devlink_ops *ops,
>> +				size_t priv_size);
>> +void devlink_shd_put(struct devlink *devlink);
>> +void *devlink_shd_get_priv(struct devlink *devlink);
>
>Would Cosmin or someone else be willing to take on co-maintainership 
>of this API (including reviews of other drivers using it)?
>We could add a maintainers entry with:
>
>K:	devlink_shd_
>
>So y'all get CCed.
>
>> +#include <linux/device/faux.h>
>> +#include <net/devlink.h>
>
>> +/* This structure represents a shared devlink instance,
>> + * there is one created per identifier (e.g., serial number).
>> + */
>> +struct devlink_shd {
>> +	struct list_head list; /* Node in shd list */
>> +	const char *id; /* Identifier string (e.g., serial number) */
>
>Why does this have to be a string? The identifier should be irrelevant,
>and if something like serial number exists it can be reported in dev
>info for the shared instance?

String gives drivers flexibility to use anything. Perhaps I'm missing
your point. Are you againts free-form or just string and buf+buf_len
would be fine?


>
>> +	struct faux_device *faux_dev; /* Related faux device */
>> +	refcount_t refcount; /* Reference count */
>> +	char priv[] __aligned(NETDEV_ALIGN); /* Driver private data */
>
>size member annotated with __counted_by() is missing here

Will add.


>
>> +};
>
>> +static struct devlink_shd *devlink_shd_create(const char *id,
>> +					      const struct devlink_ops *ops,
>> +					      size_t priv_size)
>> +{
>> +	struct faux_device *faux_dev;
>> +	struct devlink_shd *shd;
>> +	struct devlink *devlink;
>> +
>> +	/* Create faux device - probe will be called synchronously */
>> +	faux_dev = faux_device_create(id, NULL, NULL);
>> +	if (!faux_dev)
>> +		return NULL;
>> +
>> +	devlink = devlink_alloc(ops, sizeof(struct devlink_shd) + priv_size,
>> +				&faux_dev->dev);
>> +	if (!devlink)
>> +		goto err_devlink_alloc;
>
>error labels should be named after the target not the source in new code

Okay. Tried to be consistent with the rest of the code. But as you wish.


>
>> +	shd = devlink_priv(devlink);
>> +
>> +	shd->id = kstrdup(id, GFP_KERNEL);
>> +	if (!shd->id)
>> +		goto err_kstrdup_id;
>> +	shd->faux_dev = faux_dev;
>> +	refcount_set(&shd->refcount, 1);
>> +
>> +	devl_lock(devlink);
>> +	devl_register(devlink);
>> +	devl_unlock(devlink);
>> +
>> +	list_add_tail(&shd->list, &shd_list);
>> +
>> +	return shd;
>> +
>> +err_kstrdup_id:
>> +	devlink_free(devlink);
>> +
>> +err_devlink_alloc:
>> +	faux_device_destroy(faux_dev);
>> +	return NULL;
>> +}
>
>> +struct devlink *devlink_shd_get(const char *id,
>> +				const struct devlink_ops *ops,
>> +				size_t priv_size)
>> +{
>> +	struct devlink_shd *shd;
>> +
>> +	if (WARN_ON(!id || !ops))
>> +		return NULL;
>
>Seems a little too defensive to check input attrs against NULL.
>Let the kernel crash if someone is foolish enough..

Okay.


>
>> +	mutex_lock(&shd_mutex);
>> +
>> +	shd = devlink_shd_lookup(id);
>> +	if (!shd)
>> +		shd = devlink_shd_create(id, ops, priv_size);
>> +	else
>> +		refcount_inc(&shd->refcount);
>> +
>> +	mutex_unlock(&shd_mutex);
>> +	return shd ? priv_to_devlink(shd) : NULL;
>> +}
>> +EXPORT_SYMBOL_GPL(devlink_shd_get);
>> +
>> +/**
>> + * devlink_shd_put - Release a reference on a shared devlink instance
>> + * @devlink: Shared devlink instance
>> + *
>> + * Release a reference on a shared devlink instance obtained via
>> + * devlink_shd_get().
>> + */
>> +void devlink_shd_put(struct devlink *devlink)
>> +{
>> +	struct devlink_shd *shd;
>> +
>> +	if (WARN_ON(!devlink))
>> +		return;
>
>ditto

Okay.


>
>> +	mutex_lock(&shd_mutex);
>> +	shd = devlink_priv(devlink);
>> +	if (refcount_dec_and_test(&shd->refcount))
>> +		devlink_shd_destroy(shd);
>> +	mutex_unlock(&shd_mutex);
>> +}
>> +EXPORT_SYMBOL_GPL(devlink_shd_put);
