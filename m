Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C211D63E4
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 16:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766163323; cv=none; b=arH5LH+POWemSQfpAb+MyPdb2RRJZarUbQqbbeCRmcoN5EQzc6KzusNgMA08bh0f5lfXn9vAffDTtcyvc++dfSHmDsZt3p4c8l10lqgfJRKb182rl172heRJj6xYyINRMr3rtFuuvA6GxZ5CKmGlFkObot4L7q+U8pyIIbApU2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766163323; c=relaxed/simple;
	bh=/6gsh4zVCbbqtwwE86Z7rz1TML9FY+k2VMQn+/qEFDY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K7Kn7fbQKPvw5O3eJ3teVU54r0fOPkObwxqquuWjvBhfwQcUMkPzS+LiaH3O3sJQkecvjWLMIFUw1DIXrr0uipXuYys+jAaBWOmjR69vaTl78rcS0N0WBV72K7nrokpbFKhiA3c52d08yzlCUHUTPxa2+SsQs9tUlX5j15IdnKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=G/hmILSX; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="G/hmILSX"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2FBEC1A22FA;
	Fri, 19 Dec 2025 16:55:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFF8A6071D;
	Fri, 19 Dec 2025 16:55:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5ED6110AA95A8;
	Fri, 19 Dec 2025 17:55:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766163314; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=4nHU9XmgDwXcH4eBRcNAYGOBdRZWdKYOayQoIo8y2/c=;
	b=G/hmILSXfOSizlvwNV+mhGwYT6j/GEdeSgbN0mavlCeuX2rmz35vPM+n67rk7YHCIGxolW
	vNsvH3n0S9wiklZa7tsYwYUQtLnZZnaGpyX60QmpygCCbDiBQuWe17tYIPCXdTbHc0vdc2
	yC6B2U+Zxx+4HIoYRmr9LslNGPHwfGOScgFgT8fZNFvgbwW6zaWN+yD80cBp7qz2F94DX0
	nqN77i0HCpVa8I+X8t7T3fA9ZC9UWbrIFTO/PkqoGlCLYzpmD2c2r+2iDlnkT3roYzgH2q
	VqSN+tTh8K6fT8tH0vjrBGavnUxcYNfGsAWWjCTuCESBod128p8Gh520YB2Hlg==
Message-ID: <5eeedbf9-7ca0-4e5b-9db0-616866af4ac8@bootlin.com>
Date: Fri, 19 Dec 2025 17:55:19 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 15/32] drm/vkms: Introduce configfs for plane
 color range
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
 <20251029-vkms-all-config-v2-15-a49a2d4cba26@bootlin.com>
 <DF1JETBGEUFA.EK2SDN9BJMB6@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <DF1JETBGEUFA.EK2SDN9BJMB6@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 12/18/25 19:00, Luca Ceresoli wrote:
> On Wed Oct 29, 2025 at 3:36 PM CET, Louis Chauvet wrote:
>> To allows the userspace to test many hardware configuration, introduce a
>> new interface to configure the available color ranges per planes. VKMS
>> supports multiple color ranges, so the userspace can choose any
>> combination.
>>
>> The supported color ranges are configured by writing a color range bitmask
>> to the file `supported_color_ranges` and the default color range is
>> chosen by writing a color encoding bitmask to `default_color_range`.
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
>> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
>> index ee2e8d141f9e..3f658dd41272 100644
>> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
>> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
>> @@ -439,6 +439,91 @@ static ssize_t plane_default_rotation_store(struct config_item *item,
>>   	return count;
>>   }
>>
>> +static ssize_t plane_supported_color_ranges_show(struct config_item *item, char *page)
>> +{
>> +	struct vkms_configfs_plane *plane;
>> +	unsigned int supported_color_range;
>                       supported_color_ranges
> 
>> +
>> +	plane = plane_item_to_vkms_configfs_plane(item);
> 
> As for previous patches, set this on declaration for consistency (same below).
> 
>> +static ssize_t plane_supported_color_ranges_store(struct config_item *item,
>> +						  const char *page, size_t count)
>> +{
>> +	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
>> +	int ret, val = 0;
>> +
>> +	ret = kstrtouint(page, 10, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Should be a supported value */
>> +	if (val & ~(BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
>> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE)))
>> +		return -EINVAL;
>> +	/* Should at least provide one color range */
>> +	if ((val & (BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
>> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE))) == 0)
>> +		return -EINVAL;
>> +
>> +	scoped_guard(mutex, &plane->dev->lock) {
>> +		/* Ensures that the default rotation is included in supported rotation */
> 
> Oh no, that comment again! :-)
> 
>> +static ssize_t plane_default_color_range_store(struct config_item *item,
>> +					       const char *page, size_t count)
>> +{
>> +	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
>> +	int ret, val = 0;
>> +
>> +	ret = kstrtouint(page, 10, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Should be a supported value */
>> +	if (val & ~(BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
>> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE)))
>> +		return -EINVAL;
>> +	/* Should at least provide one color range */
>> +	if ((val & (BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
>> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE))) == 0)
>> +		return -EINVAL;
> 
> As in patch 12, replace this with is_power_of_2() to check that exactly one
> bit is set.

And as the previous patch, this code is simply wrong...
I shoud check if val is one of DRM_COLOR_YCBCR_LIMITED_RANGE / 
DRM_COLOR_YCBCR_FULL_RANGE

Thanks

> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

