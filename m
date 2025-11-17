Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D04524503B;
	Mon, 17 Nov 2025 11:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763378924; cv=none; b=d+4hcsn7c0KB/d9Ck6oUVgXYjRb9pPaW5m69eSLUiaogGKmpevPmJhU+oLir8JrY+OXzvRfeo0PmLxLsk1y+8QwEDoVV1nJkRkbhyJO8EeIjM7SfoVC47sVPqB16ZTaQtfbN3b5ND1QjjcAz5MJ63XpGKpZASWp7CJpQ1Vwl8a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763378924; c=relaxed/simple;
	bh=I7JSpy6o3UIvcWVIbH2DksO/iSpKdF5ZhRj2BNg8NM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bwpqpDxOD6MOEqnRF+pxMci9B5+SQ0ZwdlTMlNyc6hdfSHffMC5yRl+hxpvnpbPjXMyN0G/ATJuxu5D19qYzQGj8actqXqYP2TDjdG+3dMBniuAmRV/YMYy2VO7dYJvzZCUtxiwN+xvy7MZJRBKo3lhPMBeCPXCAG/Q+ox2cwfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dv8SFzc/; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dv8SFzc/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 51D424E4173B;
	Mon, 17 Nov 2025 11:28:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 25BAC606B9;
	Mon, 17 Nov 2025 11:28:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF37510371D28;
	Mon, 17 Nov 2025 12:28:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763378917; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=o5ZIOrn34xY/reGD4ngIHNFr1Jm3RGPHLJgLLBQrQRg=;
	b=dv8SFzc/QVUsQEE96c9wwkwkBgp1uWNVxbrrLINXBIzKpNWa2TuQD+WLTZq8t0HnaMGHgL
	ln4mQ7RryEzZy/2PHJqYIwzQP9yD7UsmEB/E+wMKlfhbiY/BO/pS6B3QlYkjCSF5ns5E/j
	XBoTiDU2hlM6/pPJ6xsoUzYrMcvJSmQn3DbNH4+HojDzyoHsgKK7xDj9gQzvB2esOaiK2e
	3nJPiDovhGTPslSHgQ8vTbfORNRMkfh6yrhCgVxXgYnhE/vzLj8n6/e2HnKnJqvm+vKX20
	uVWto99gt9AtmGmrVJVsh7oR9JfPxDe5aKXi+si10eduzejqcABKjP+2+mUpmw==
Message-ID: <4eb6d187-e06e-4485-b1d0-6ff3a854be3f@bootlin.com>
Date: Mon, 17 Nov 2025 11:28:36 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 01/32] drm/drm_mode_config: Add helper to get
 plane type name
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-1-a49a2d4cba26@bootlin.com>
 <aRXl0jt2_rmXFRUW@fedora>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <aRXl0jt2_rmXFRUW@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/13/25 14:06, José Expósito wrote:
> Hey Louis,
> 
> On Wed, Oct 29, 2025 at 03:36:38PM +0100, Louis Chauvet wrote:
>> Create and export an helper to display plane type using the
>> property string. This could be used to display debug
>> information in VKMS.
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> ---
>>   drivers/gpu/drm/drm_mode_config.c | 13 +++++++++++++
>>   include/drm/drm_mode_config.h     |  3 +++
>>   2 files changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
>> index 25f376869b3a..1a1a3f43db4d 100644
>> --- a/drivers/gpu/drm/drm_mode_config.c
>> +++ b/drivers/gpu/drm/drm_mode_config.c
>> @@ -226,6 +226,19 @@ static const struct drm_prop_enum_list drm_plane_type_enum_list[] = {
>>   	{ DRM_PLANE_TYPE_CURSOR, "Cursor" },
>>   };
>>   
>> +/**
>> + * drm_get_plane_type_name - return a string for plane name
>> + * @type: plane type to compute name of
> 
> Maybe we could document here what happens when the plane type is
> not valid.
> 
> Returns: The name of the plane type. "(unknown)" if type is not a
> known plane type.

Ack, I will integrate it for v3

> Other than that:
> Reviewed-by: José Expósito <jose.exposito@redhat.com>
> 
>> + */
>> +const char *drm_get_plane_type_name(enum drm_plane_type type)
>> +{
>> +	if (type < ARRAY_SIZE(drm_plane_type_enum_list))
>> +		return drm_plane_type_enum_list[type].name;
>> +	else
>> +		return "(unknown)";
>> +}
>> +EXPORT_SYMBOL(drm_get_plane_type_name);
>> +
>>   static int drm_mode_create_standard_properties(struct drm_device *dev)
>>   {
>>   	struct drm_property *prop;
>> diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
>> index 2e848b816218..89f3dd46178d 100644
>> --- a/include/drm/drm_mode_config.h
>> +++ b/include/drm/drm_mode_config.h
>> @@ -30,6 +30,7 @@
>>   #include <linux/llist.h>
>>   
>>   #include <drm/drm_modeset_lock.h>
>> +#include <drm/drm_plane.h>
>>   
>>   struct drm_file;
>>   struct drm_device;
>> @@ -983,4 +984,6 @@ static inline int drm_mode_config_init(struct drm_device *dev)
>>   void drm_mode_config_reset(struct drm_device *dev);
>>   void drm_mode_config_cleanup(struct drm_device *dev);
>>   
>> +const char *drm_get_plane_type_name(enum drm_plane_type type);
>> +
>>   #endif
>>
>> -- 
>> 2.51.0
>>

