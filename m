Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB893644BD
	for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 08:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776934111; cv=none; b=oMS72OooZJi0tIW5ZciP/1ugh2KX1eNw9UssjX/tyXpAueafKPh3QnxvNo6vNmNvdXTJVMEhYArfyFNrJt6U085hgi7RxPiv6coGOH209//+xBqwBHAtvCX0MO3xVw7i5wYpUcdU7PMHjIpJsPDHtUNe3Mw0TQQNW+cATCJrH2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776934111; c=relaxed/simple;
	bh=Px1+ckz6Flybg5LgaLCoe8IlXZEJ6Fa2LltEKOoUZIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EokQnaCYBH+zUpdECUitEwONeky5GVLARN5i8tURjHXpiVKbLb6OA/Cex3rWvNxm+eUitne6MFNQsLsw2hbtTjAwDMN4xjU7RGzNwEcUYVBt6oIeZrzwpeWKvgtwTL2iC4hGCbSb0zO8aFeNxaeLMSgdCMBPHh9X3Qb5dlyQGQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YAmQuIYB; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YAmQuIYB"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F03F61A33BC;
	Thu, 23 Apr 2026 08:48:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA39560495;
	Thu, 23 Apr 2026 08:48:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89F3210460B49;
	Thu, 23 Apr 2026 10:48:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776934106; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=qDvuPqoIPAamKZnetk5HwfP8755e9QC1xs27VXT5Xds=;
	b=YAmQuIYBM90TeGzfP+68hVQHZqBLETsl0aUfglgKdffdCJwu1VEXQb+9hBEY+0UGzukdZo
	axKiqlCmMT1ZaM1Im2vaRElAQjZQXKx1uQulrWwZud9hj8Goc/px+ENOhl78rwCohMZZPL
	0H3KqUeIKK0XTyUx7QKCgO7tv11b/aikxhJdmUifbh+1Ckq5CBYRrg7xJwITNVDGaFLQR/
	+FnatyJdf8HBq8E1YoSewN/00PswroBrb6SrqVKWO4xf66pFH/iyhJJnBmKRnbrW/BLZmY
	Pp++FJI52XAC9q+8h7PvE9fPzdLeBxYRYdewyC3ISTdGPqB1jMa42CQNNFrXLA==
Message-ID: <d9a66f6a-e07c-4bc2-bd91-8b9cb2994760@bootlin.com>
Date: Thu, 23 Apr 2026 10:47:38 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/37] drm/blend: Get a rotation name from it's
 bitfield
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 llvm@lists.linux.dev, =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?=
 <jose.exposito@redhat.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20260422-vkms-all-config-v4-0-dbb52e9aadc3@bootlin.com>
 <20260422-vkms-all-config-v4-2-dbb52e9aadc3@bootlin.com>
 <aej82CO0l9_O1sX2@intel.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <aej82CO0l9_O1sX2@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 4/22/26 18:52, Ville Syrjälä wrote:
> On Wed, Apr 22, 2026 at 06:47:59PM +0200, Louis Chauvet wrote:
>> Having the rotation/reflection name from its value can be useful for
>> debugging purpose. Extract the rotation property table and implement
>> drm_get_rotation_name.
>>
>> Reviewed-by: José Expósito <jose.exposito@redhat.com>
>> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> ---
>>   drivers/gpu/drm/drm_blend.c | 35 ++++++++++++++++++++++++++---------
>>   include/drm/drm_blend.h     |  2 ++
>>   2 files changed, 28 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
>> index 1f3af27d2418..11d8e13caea3 100644
>> --- a/drivers/gpu/drm/drm_blend.c
>> +++ b/drivers/gpu/drm/drm_blend.c
>> @@ -256,6 +256,31 @@ int drm_plane_create_alpha_property(struct drm_plane *plane)
>>   }
>>   EXPORT_SYMBOL(drm_plane_create_alpha_property);
>>   
>> +static const struct drm_prop_enum_list rotation_props[] = {
>> +	{ __builtin_ffs(DRM_MODE_ROTATE_0) - 1,   "rotate-0" },
>> +	{ __builtin_ffs(DRM_MODE_ROTATE_90) - 1,  "rotate-90" },
>> +	{ __builtin_ffs(DRM_MODE_ROTATE_180) - 1, "rotate-180" },
>> +	{ __builtin_ffs(DRM_MODE_ROTATE_270) - 1, "rotate-270" },
>> +	{ __builtin_ffs(DRM_MODE_REFLECT_X) - 1,  "reflect-x" },
>> +	{ __builtin_ffs(DRM_MODE_REFLECT_Y) - 1,  "reflect-y" },
>> +};
>> +
>> +/**
>> + * drm_get_rotation_name - Return the name of a rotation
>> + * @rotation: The rotation mask (DRM_MODE_ROTATE_* | DRM_MODE_REFLECT_*)
>> + *
>> + * Returns: the name of the rotation type (unknown) if rotation is not
>> + * a known rotation/reflection
>> + */
>> +const char *drm_get_rotation_name(unsigned int rotation)
>> +{
>> +	if (rotation < ARRAY_SIZE(rotation_props))
>> +		return rotation_props[rotation].name;
> 
> The value is a bitmask. This does not work.
> 

That true, the documentation is not clear.

Take a look at patch 15 [1] for the usage. Is it better if I change the 
documentation to:

drm_get_rotation_name - Returns the name of a rotation/reflection 
bitmask (with only one bit set).
@rotation: Bitmask with a single bit set.
Name of the rotation/reflection, or "(unknown)" if invalid.

[1]:https://lore.kernel.org/all/20260422-vkms-all-config-v4-15-dbb52e9aadc3@bootlin.com/
