Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AE233DECA
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 16:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766162452; cv=none; b=G+vkoxrPgO5uZJfHfo3hTvKDoZ5sQNCwUOqRHbKVeWRPcB42BwpBbg1Z8RVqxpedZ6g1fBOEJheMz8PLXUn3pFY1YOdHLGcSQ1wmkXiq1Cl/94n1hG0GCzL0sj6t9QqnqvyqRCxEjVuZm+DBptiTuihkxw+eZ7kxdF5aZ3Pbps0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766162452; c=relaxed/simple;
	bh=YRw5nFfsSdP5m4HvFMFEcnnPHHYsfASuaK/2XD6kHBs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oc4RFMZtdLd1I/MmQ51+KiK50Lb4ohs/KKWKDGUXi2T10OqVDUwf7dwXLtYmlwjX2LIA2gXSEN8ARAzlNNdJCXXRMtUc2d9EDcyI1hfZEEJCKapWuoO03EzLWJogdWi5V595cjHiAAfZHg24jDdf5fbs0tSNs1kId08lLVxCP7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mIr9rN0q; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mIr9rN0q"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 089341A22FA;
	Fri, 19 Dec 2025 16:40:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D168F6071D;
	Fri, 19 Dec 2025 16:40:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4BF6810AA9569;
	Fri, 19 Dec 2025 17:40:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766162444; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=NCMEYgYBBOfsMOSUVOgb5Vc8+vHUsWS6MI3ekHQpRuw=;
	b=mIr9rN0qnlHIUjN9gq2nWMmNEjhWz7LA/JIWjvHP2+RhFO1kwwH7ywjCUUA9iZwypa5QbC
	ZaDTcpY3zQlIlKos5uFarkAbX7p053yw0a0ZBHJKcn7aJCF+It3yCNNO9Xf6To58pwJHsN
	UIXJp4pPoJzfNswtkMnZR8Ix3Dy4b3dA+NzjB3+z1Qo6xqeWZ+ElyO1Ll+vViWrUuslf55
	vrN3qsjmqOlqBQsCZn8U5lFUqkrl0v/Hy9kbtC2RXEQ+XfDkXb9n+/iBNRGM5PLjvpPzb+
	8kE19JSdOxf9i8CdWuu3x4SYm02k8ipovymFORjhM1/1lO9nGGqHLHuxw5fPcg==
Message-ID: <bd38f577-7a09-4287-b71b-6e6e3e0f2cf2@bootlin.com>
Date: Fri, 19 Dec 2025 17:40:38 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 12/32] drm/vkms: Introduce configfs for plane
 color encoding
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
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <DF1JDXPWYWVQ.2FSDNACYTUOMH@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 12/18/25 18:59, Luca Ceresoli wrote:
> On Wed Oct 29, 2025 at 3:36 PM CET, Louis Chauvet wrote:
>> To allows the userspace to test many hardware configuration, introduce a
>> new interface to configure the available color encoding per planes. VKMS
>> supports multiple color encoding, so the userspace can choose any
>> combination.
>>
>> The supported color encoding are configured by writing a color encoding
>> bitmask to the file `supported_color_encoding` and the default color
>> encoding is chosen by writing a color encoding bitmask to
>> `default_color_encoding`.
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> ---
>>   Documentation/gpu/vkms.rst           |  7 ++-
>>   drivers/gpu/drm/vkms/vkms_configfs.c | 98 ++++++++++++++++++++++++++++++++++++
>>   2 files changed, 104 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
>> index eac1a942d6c4..dab6811687a2 100644
>> --- a/Documentation/gpu/vkms.rst
>> +++ b/Documentation/gpu/vkms.rst
>> @@ -87,7 +87,7 @@ Start by creating one or more planes::
>>
>>     sudo mkdir /config/vkms/my-vkms/planes/plane0
>>
>> -Planes have 4 configurable attributes:
>> +Planes have 6 configurable attributes:
>>
>>   - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
>>     exposed by the "type" property of a plane)
>> @@ -97,6 +97,11 @@ Planes have 4 configurable attributes:
>>     (same values as those exposed by the "rotation" property of a plane)
>>   - default_rotation: Default rotation presented to the userspace, same values as
>>     possible_rotations.
>> +- supported_color_encoding: Available encoding for a plane, as a bitmask:
>                                           encodings
> 
>> +  0x01 YCBCR_BT601, 0x02: YCBCR_BT709, 0x04 YCBCR_BT2020 (same values as those exposed
>                             ^
> 
> Unintended colon? While I think it's nice to have, there is none elsewhere,
> even in previous patches, and I'd say we can live happy without.
> 
>> +  by the COLOR_ENCODING property of a plane)
>> +- default_color_encoding: Default color encoding presented to the userspace, same
>> +  values as supported_color_encoding
>>
>>   Continue by creating one or more CRTCs::
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
>> index 7cc8ba315ef0..ee2e8d141f9e 100644
>> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
>> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
>> @@ -439,16 +439,114 @@ static ssize_t plane_default_rotation_store(struct config_item *item,
>>   	return count;
>>   }
>>
>> +static ssize_t plane_supported_color_encodings_show(struct config_item *item, char *page)
>> +{
>> +	struct vkms_configfs_plane *plane;
>> +	unsigned int supported_color_encoding;
>                       supported_color_encodings
> 
>> +
>> +	plane = plane_item_to_vkms_configfs_plane(item);
> 
> As for patch 9, for consistency:
> 
>    struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
> 
>> +
>> +	scoped_guard(mutex, &plane->dev->lock) {
>> +		supported_color_encoding = vkms_config_plane_get_supported_color_encodings(plane->config);
>> +	}
>> +
>> +	return sprintf(page, "%u", supported_color_encoding);
>> +}
>> +
>> +static ssize_t plane_supported_color_encodings_store(struct config_item *item,
>> +						     const char *page, size_t count)
>> +{
>> +	struct vkms_configfs_plane *plane = plane_item_to_vkms_configfs_plane(item);
>> +	int ret, val = 0;
>> +
>> +	ret = kstrtouint(page, 10, &val);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Should be a supported value */
>> +	if (val & ~(BIT(DRM_COLOR_YCBCR_BT601) |
>> +		    BIT(DRM_COLOR_YCBCR_BT709) |
>> +		    BIT(DRM_COLOR_YCBCR_BT2020)))
>> +		return -EINVAL;
>> +	/* Should at least provide one color range */
>> +	if ((val & (BIT(DRM_COLOR_YCBCR_BT601) |
>> +		    BIT(DRM_COLOR_YCBCR_BT709) |
>> +		    BIT(DRM_COLOR_YCBCR_BT2020))) == 0)
> 
> I'm mentioning here as it comes to mind, but it's valid for other similar
> patches in this series: why not adding a
> 
>    #define DRM_COLOR_ENCODINGS_SUPPORTED ( \
>                     BIT(DRM_COLOR_YCBCR_BT601) |
>                     BIT(DRM_COLOR_YCBCR_BT709) |
>                     BIT(DRM_COLOR_YCBCR_BT2020))
> 
> and use it in place of the various bitwise-or sequences?
> 
> This would simplify work later on if adding a new color encoding (or color
> range, or...).
> 
> Somewhat like DRM_MODE_*_MASK.
> 
>> +		return -EINVAL;
>> +
>> +	scoped_guard(mutex, &plane->dev->lock) {
>> +		/* Ensures that the default rotation is included in supported rotation */
>> +		if (plane->dev->enabled)
>> +			return -EINVAL;
> 
> And here the comment is definitely wrong. :-)
> 
>> +
>> +		vkms_config_plane_set_supported_color_encodings(plane->config, val);
>> +	}
>> +
>> +	return count;
>> +}
>> +
>> +/* Plane default_color_encoding : vkms/<device>/planes/<plane>/default_color_encoding */
> 
> There's no such comment in other places, so for consistency remove it (or
> add it everywhere?!? ... no, just kidding).
> 
>> +
>> +static ssize_t plane_default_color_encoding_show(struct config_item *item, char *page)
>> +{
>> +	struct vkms_configfs_plane *plane;
>> +	unsigned int default_color_encoding;
>> +
>> +	plane = plane_item_to_vkms_configfs_plane(item);
>> +
>> +	scoped_guard(mutex, &plane->dev->lock) {
>> +		default_color_encoding = vkms_config_plane_get_default_color_encoding(plane->config);
>> +	}
>> +
>> +	return sprintf(page, "%u", default_color_encoding);
>> +}
>> +
>> +static ssize_t plane_default_color_encoding_store(struct config_item *item,
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
>> +	if (val & ~(BIT(DRM_COLOR_YCBCR_BT601) |
>> +		    BIT(DRM_COLOR_YCBCR_BT709) |
>> +		    BIT(DRM_COLOR_YCBCR_BT2020)))
>> +		return -EINVAL;
>> +	/* Should at least provide one color range */
>> +	if ((val & (BIT(DRM_COLOR_YCBCR_BT601) |
>> +		    BIT(DRM_COLOR_YCBCR_BT709) |
>> +		    BIT(DRM_COLOR_YCBCR_BT2020))) == 0)
>> +		return -EINVAL;
> 
> Shouldn't you check that exactly one bit is set? As in patch 9.

Because this code is wrong... the default rotation should be 
DRM_COLOR_YCBCR_BT601 / DRM_COLOR_YCBCR_BT709 / DRM_COLOR_YCBCR_BT2020
not a bitfield...

>> +
>> +	scoped_guard(mutex, &plane->dev->lock) {
>> +		/* Ensures that the default rotation is included in supported rotation */
>> +		if (plane->dev->enabled)
>> +			return -EINVAL;
> 
> As before, wrong comment.
> 
> Luca
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

