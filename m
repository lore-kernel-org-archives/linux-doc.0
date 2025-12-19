Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FC8327C0C;
	Fri, 19 Dec 2025 17:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766166688; cv=none; b=nCzwRy4QQH0/tSerh5U3NUv/opfkSs/1TTlDxQ7EZD2QIM5VY5e7m2q4ytPWuITia3i9gE0EtLDJahuB5btwx7nYdTC5ceEFuCIuqRBC8DQWLP3tm3Ge3afx2nLBgD+O+JAGbBdd93sL2F7JZQ5gQ5NKEAJX4KI64NCooRy21QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766166688; c=relaxed/simple;
	bh=Q4uhQM8LwFXCcSV2WY9KfZOT50CWN7df9lWe+CGXOq8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ifir4NA+dgIjN1G0rPJe+RNDz3b7TbBqBd3+9MoLzhgqxnppGiPdudrLvbjQK/iH5UDQAkQCLI/xa+lrFgd72iDwPL74UWvxCp72f5p7A11sLcqx0FFytFRP0t1M0JeWRosXkmgSdcquEcGrMazpC7MwSzjhIa6GQ8q2p0ZoOuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IX5qyWp6; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IX5qyWp6"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4F6AFC1B20B;
	Fri, 19 Dec 2025 17:50:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D4B7A6071D;
	Fri, 19 Dec 2025 17:51:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A099102F0B50;
	Fri, 19 Dec 2025 18:51:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766166683; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=gZbsi0/3CZI5iarKyG4+kknPxxal0vEqKpFXZJhtcU8=;
	b=IX5qyWp6BgdVqIKfMv1qi8h7GIJUZAnKj+KErS5E92teFxs0a/aue8nsSwbQVBZ6T7cFFG
	Tv40kzCvJLp8lTeXJJueMJ81d7eZm3GXkhShU64s2zuB20Wh1x9BJnAQN0QZAwS9lOYO04
	x5Md+/ZZtLgEd22EDtCWOYBwi+qq/LeMgQtL5HyPQJlRKCqrrmdDFPnOcGuBa3H8TbV/WV
	Skg2KHfsIakVO+jIiDsvACwB6hHIgSEKYLcs3JkQodp408euTUWOFgJKI+nyBhqMIxXJAy
	rdoqW87wpistffUjZx8ZbH3a6YdDqM/ApwrESYaxGK6YdN4FtmjLPfBK0jFKfg==
Message-ID: <4fbe256e-503c-47c3-959a-5fe8d19d7d4a@bootlin.com>
Date: Fri, 19 Dec 2025 18:51:27 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 12/32] drm/vkms: Introduce configfs for plane
 color encoding
From: Louis Chauvet <louis.chauvet@bootlin.com>
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
 <20251029-vkms-all-config-v2-12-a49a2d4cba26@bootlin.com>
 <DF1JDXPWYWVQ.2FSDNACYTUOMH@bootlin.com>
 <bd38f577-7a09-4287-b71b-6e6e3e0f2cf2@bootlin.com>
Content-Language: en-US
In-Reply-To: <bd38f577-7a09-4287-b71b-6e6e3e0f2cf2@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3


>>> +
>>> +    ret = kstrtouint(page, 10, &val);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    /* Should be a supported value */
>>> +    if (val & ~(BIT(DRM_COLOR_YCBCR_BT601) |
>>> +            BIT(DRM_COLOR_YCBCR_BT709) |
>>> +            BIT(DRM_COLOR_YCBCR_BT2020)))
>>> +        return -EINVAL;
>>> +    /* Should at least provide one color range */
>>> +    if ((val & (BIT(DRM_COLOR_YCBCR_BT601) |
>>> +            BIT(DRM_COLOR_YCBCR_BT709) |
>>> +            BIT(DRM_COLOR_YCBCR_BT2020))) == 0)
>>> +        return -EINVAL;
>>
>> Shouldn't you check that exactly one bit is set? As in patch 9.
> 
> Because this code is wrong... the default rotation should be 
> DRM_COLOR_YCBCR_BT601 / DRM_COLOR_YCBCR_BT709 / DRM_COLOR_YCBCR_BT2020
> not a bitfield...

And after fixing this, I think I will keep bitmask with only one bit set 
so supported_color_encodings and default_color_encoding will have 
exactly the same values. Same for color ranges. Thanks for the report!

> 
>>> +
>>> +    scoped_guard(mutex, &plane->dev->lock) {
>>> +        /* Ensures that the default rotation is included in 
>>> supported rotation */
>>> +        if (plane->dev->enabled)
>>> +            return -EINVAL;
>>
>> As before, wrong comment.
>>
>> Luca
>>
>> -- 
>> Luca Ceresoli, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
> 

