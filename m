Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE26B33CE87
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 17:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766165321; cv=none; b=gcty/P3nDAfpOW5Dop/hohmaU3VElHX38d/dujIo6Hx/P0mVsjUhvOMAlZDllMpKuZmcGZ45xFfvUUx32euYjdTy9Hod2j6tjpn44eKbRK7INPyfsQ0ri66gaCR2hx/6TjC8UyDzSGaPmddIBzwDEarGCXo/COb/uRDQbKAflnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766165321; c=relaxed/simple;
	bh=AIR3Fcvvp4QIn2aUQ7QK6f3x3IbhcnKEmAM73sUpW1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aoCZV8H5vbs33vUJecuWKlO9eY1WvRKr8pfNBvGM0srRitF1Q91zG0tWwk2pT4BKzkqcc+inCxBLl2Nf+NFRx3MMs+7C8l+9Y/q/+x+lVDNlMXwk/CFI++HwwYAHfvBikvFu8FaY+J01EsB21CBGKjaVjMUyVyecNG5txtvXEzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=f6+ELuDI; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="f6+ELuDI"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 51923C1B20B;
	Fri, 19 Dec 2025 17:28:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 077F86071D;
	Fri, 19 Dec 2025 17:28:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BF68010AA8D37;
	Fri, 19 Dec 2025 18:28:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766165316; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=nPZD8vHkydT/3viYLb5wlAUsI81jn4g76Cg2Qd3s3z0=;
	b=f6+ELuDIxl+Vaf6595UvwIX0YbjzwZKdVYWu5iakw/nTwUhjGHGX97ASAJUMx8jmkbIzkV
	RqGUxMu/pREJkTgaF+J2CHa8BN6TJ1Mhl6mqf7sQ1kvr02xyWArUJSfDWx/f/muy6AD5CO
	CKQO7ZyvM8jcc5scgohnvoWJlOGALP47nXGLtzOtcH9Ll+tcHVP/HjfUVNvFJcozj6yUsE
	7Q+92vv5CZX5cAU68U2IcVO0I8JX3BmEIhja6qQ2KQ9ZdCCjjGhvCEp5CpcC4WMi9y3+xi
	LRswkiMdw2dMJil4aoQXicijig7RiilqlWCYkVj6JITESeoGCvXXFyans1BodA==
Message-ID: <e3d3538b-e432-4221-bb79-e8155f42edab@bootlin.com>
Date: Fri, 19 Dec 2025 18:28:37 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 17/32] drm/vkms: Introduce configfs for plane
 format
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
 <20251029-vkms-all-config-v2-17-a49a2d4cba26@bootlin.com>
 <DF2CWONRF4X6.2N7MHWSI1WU6T@bootlin.com>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <DF2CWONRF4X6.2N7MHWSI1WU6T@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

[...]

>> +		.expected_offset = 1
>> +	}, {
>> +		.data = "-R1111",
>> +		.data_len = 3,
> 
> The string is longer than 3 chars, is this intended?

Yes, I wanted to ensure that the algorithm stop at data_len and not \0

>> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
>> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> 
>> +static ssize_t plane_supported_formats_store(struct config_item *item,
>> +					     const char *page, size_t count)
>> +{
>> +	struct vkms_configfs_plane *plane;
>> +
>> +	plane = plane_item_to_vkms_configfs_plane(item);
>> +	int ret = 0;
>> +	const char *end_page = page + count;
>> +
>> +	scoped_guard(mutex, &plane->dev->lock) {
>> +		while (1) {
>> +			char *tmp;
>> +			char fmt[4] = {' ', ' ', ' ', ' '};
>> +			int len = vkms_configfs_parse_next_format(page, end_page, &tmp);
>> +
>> +			// No fourcc code found
>> +			if (len <= 1)
>> +				break;
>> +
>> +			page = tmp + len;
>> +			memcpy(tmp, &fmt[1], min(len - 1, 4));
> Should this be instead:        fmt   tmp
> ?

memcpy(void *to, const void *from

Make sense yes... My tests were not sufficient :(

I will triple check this before sending the v3

> Also I think it would be good to reject strings longer than 4 chars (len >
> 5), because they cannot br fourccs.

I will add this limitation.

Thanks!

> Otherwise looks good.
> 
> BTW, I feel your pain in implementing the parsing!
> 
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

