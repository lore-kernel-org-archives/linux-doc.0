Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D533B1B3
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 22:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766181676; cv=none; b=iHuaPszuLxgE1z5iwL2Xl6868N2E7XdUzGAYATzSA2qY9Mu2v9zSlTzIqpMd1MmEv2SXzA76nqclQaBRcQHwLK414c5ANZmRGdTGjuk5bArwUV1lHKpMCbcR14bUphhdo0jmYLzgxgLMA2VUlQWMuQIQd6JecWW40WNAyGvCTpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766181676; c=relaxed/simple;
	bh=3431ox0ZbFQjlMMdoL22e/G2T8QFX+FQBznI2vzsZe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BTVSLQXyi9VghC5ZLkTzVa3wlekA+7XvWHpi9e2tU/B6aJ+GvKsdrC8w4ZCA+w7T79ATFDmhr9rImC9IOddD25DkuZ5ovHYiyJ9y3EZYOeYNzNW4TDM5gOG0PG3nNeVn9tS41l0Ac5u1wx6pAdjLT2VALS3VVGMySMqcT+LM2Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gtS0+pfg; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gtS0+pfg"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CAD1F4E41CC2;
	Fri, 19 Dec 2025 22:01:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8D0956071D;
	Fri, 19 Dec 2025 22:01:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8F0A10AA90A2;
	Fri, 19 Dec 2025 23:01:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766181665; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Hcf0kFeXH7oqQdJ4h33PEPQp1m05Fo5cD4GMBj4xBKU=;
	b=gtS0+pfgoBfTSfM9F/q5Z7G1JYvo665vPP3BBhqlA/6Fgg8JOoH8ciosrqWz2XqfoumeDZ
	SancNmCsbKVYM/Qpqs9ifM3be8rO9U4M30KU7CLfl9XODUA92b26YbB770X9J9F1veL+FJ
	Ss7s2lYFjP0jwGZLj7m9BUuARtEGFRu3Gn4pHPWuK5OQu3MUlcoplL8kH810zLh74x/XLn
	pQDFAIla9RBTRICecWBNvYz1vNOuBnf0YpECNwlVMCcKSlwvCSkc62dy27OmP4ZpAQRA1D
	2ttaYZcGAcSU5moCcSKCGZ0wjDXZg6sZL9PM377hwncs8xHlgLHljHZv5Q2Kbw==
Message-ID: <5b173e9e-bcff-4b19-b16f-fe57796b99ae@bootlin.com>
Date: Fri, 19 Dec 2025 23:01:09 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 32/32] drm/vkms: Introduce configfs for dynamic
 connector creation
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-32-a49a2d4cba26@bootlin.com>
 <DF2HL69KF83U.GX59AN7IN8L@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <DF2HL69KF83U.GX59AN7IN8L@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 12/19/25 21:47, Luca Ceresoli wrote:
> On Wed Oct 29, 2025 at 3:37 PM CET, Louis Chauvet wrote:
>> DRM allows the connector to be created after the device. To allows
>> emulating this, add two configfs attributes to connector to allows this.
>>
>> Using the dynamic attribute you can set if a connector will be dynamic or
>> not.
>> Using the enabled attribute, you can set at runtime if a dynamic connector
>> is present or not.
>>
>> Co-developed-by: José Expósito <jose.exposito89@gmail.com>
>> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
>> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
>> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> 
>> @@ -1215,8 +1223,10 @@ static ssize_t connector_type_store(struct config_item *item,
>>   	}
>>
>>   	scoped_guard(mutex, &connector->dev->lock) {
>> -		if (connector->dev->enabled)
>> -			return -EINVAL;
>> +		if (connector->dev->enabled) {
>> +			if (connector_is_enabled(connector->config))
>> +				return -EBUSY;
>> +		}
> 
> You are changing from -EINVAL to -EBUSY. Why? Was -EINVAL wrong in the
> first place?

EINVAL was wrong in the first place, we try to remove EBUSY when you 
can't do something because the device is already enabled and EINVAL when 
the value is false.

> 
> And you can avoid the nested if:
> 
> 		if (connector->dev->enabled && connector_is_enabled(connector->config))
> 			return -E<WHATEVER>;

It is probably a remaining of previous implementation, thanks!

>> +static ssize_t connector_dynamic_show(struct config_item *item, char *page)
>> +{
>> +	struct vkms_configfs_connector *connector;
>> +	bool enabled;
>               ^^^^^^^
>               dynamic
> 
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

