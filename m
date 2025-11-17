Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B319B333422;
	Mon, 17 Nov 2025 14:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763388743; cv=none; b=mmw52X6uNf56gVxjlHVDOjwZfnW4GFJBbWxOo0AvScTiO7UncvmBPzdeyuTo2aAdMarHIrlqEzExBz2nuJn/A9lBJrKKpN6VRHrY7m2awkXeKZog07oKW7lW54JTf4U3AhFkgGlCs6jH30y4U5tYI5lHSVXauBho6Ee+jx9Yyb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763388743; c=relaxed/simple;
	bh=5yg6DfXLMEycTfad8gw155LQsi7rD5glTzJcLTUpvoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fXYDzsNoSHk3Nr740HoAy6Ze2FJ3oC2lb+nPC6GOzpVAiDZd+m5iFGFQcIt9yriAfscznfj2gd2YEVw1a1/dNHgXgZpY8hEY9/1dd3xW0En3mP1Z3TmA5uvLWs6onXEdnJ42q6NRdbiTziZCa27FiDDpsUiH/P9dww86lS5VtD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=d3MtSOOY; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="d3MtSOOY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E7CA11A1B7B;
	Mon, 17 Nov 2025 14:12:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC2C3606B9;
	Mon, 17 Nov 2025 14:12:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D530910371D21;
	Mon, 17 Nov 2025 15:12:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763388737; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=PB5WlJ2VVYXWs9CSju8ciFxFwZiMzfHOl92xvMe6sOo=;
	b=d3MtSOOYOJeOadCBLy5MuDFvmuToxJ4WY/zZ5wSdCq42bHLjhX+fJg+IXjXhvPvsBhz8zA
	Yz/upzMUevJdEn5VLg7v2uRsEmHCXn8wi9zWyAvZK2KsXpDkAjGAZgEvpyBtxf+J249ykC
	Zs3iu4N4xwfCJgZTJJXL9RlEp0d2Ppbw7fZQp2IW9Fq8TMu+QL4p6NlsayJpc7SBVCY1UE
	ZjFTh275Fp8Zxi49V2iJaVZXAuNMqrx8HMG94gAcWLf54Zxq9wObPREqsuR9CghUbnTVBd
	cCFQT6oyqOad8KUHE/NX+1yF+61f/oCbpTO5H8AR+tzoYEAZfEnKbZdUSSvd3w==
Message-ID: <5da5b38f-1f34-4a1e-88a3-f7a90753e094@bootlin.com>
Date: Mon, 17 Nov 2025 14:12:17 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 05/32] drm/vkms: Introduce config for plane name
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
 <20251029-vkms-all-config-v2-5-a49a2d4cba26@bootlin.com>
 <aRXolNJJ5caay_H1@fedora>
From: Louis Chauvet <louis.chauvet@bootlin.com>
Content-Language: en-US
In-Reply-To: <aRXolNJJ5caay_H1@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/13/25 14:17, José Expósito wrote:
> On Wed, Oct 29, 2025 at 03:36:42PM +0100, Louis Chauvet wrote:
>> As planes can have a name in DRM, prepare VKMS to configure it using
>> ConfigFS.
>>
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> ---
>>   drivers/gpu/drm/vkms/vkms_config.c |  4 ++++
>>   drivers/gpu/drm/vkms/vkms_config.h | 26 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/vkms/vkms_drv.h    |  5 +++--
>>   drivers/gpu/drm/vkms/vkms_output.c |  6 +-----
>>   drivers/gpu/drm/vkms/vkms_plane.c  |  6 ++++--
>>   5 files changed, 38 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
>> index 858bec2d1312..bfafb5d2504d 100644
>> --- a/drivers/gpu/drm/vkms/vkms_config.c
>> +++ b/drivers/gpu/drm/vkms/vkms_config.c
>> @@ -352,6 +352,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>>   		seq_puts(m, "plane:\n");
>>   		seq_printf(m, "\ttype=%s\n",
>>   			   drm_get_plane_type_name(vkms_config_plane_get_type(plane_cfg)));
>> +		seq_printf(m, "\tname=%s\n",
>> +			   vkms_config_plane_get_name(plane_cfg));
> 
> I discovered this while working on some basic IGT tests to validate
> your changes.
> 
> I think that this triggers undefined behavior. printf() and friends
> expect a non NULL value for %s:
> https://stackoverflow.com/a/11589479
> 
> In my Fedora system, this prints "name=(null)", instead of an empty
> string.
> 
> The same happens with the ConfigFS API:
> 
> $ cat /sys/kernel/config/vkms/test_plane_default_values/planes/plane0/name
> (null)
> 
> We'd need to return in both places an empty string instead.

Good catch, I will fix for v3!

>>   	}
>>   
>>   	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
>> @@ -392,6 +394,7 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
>>   
>>   	plane_cfg->config = config;
>>   	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
>> +	vkms_config_plane_set_name(plane_cfg, NULL);
>>   	xa_init_flags(&plane_cfg->possible_crtcs, XA_FLAGS_ALLOC);
>>   
>>   	list_add_tail(&plane_cfg->link, &config->planes);
>> @@ -404,6 +407,7 @@ void vkms_config_destroy_plane(struct vkms_config_plane *plane_cfg)
>>   {
>>   	xa_destroy(&plane_cfg->possible_crtcs);
>>   	list_del(&plane_cfg->link);
>> +	kfree_const(plane_cfg->name);
>>   	kfree(plane_cfg);
>>   }
>>   EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy_plane);
>> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
>> index 4c8d668e7ef8..57342db5795a 100644
>> --- a/drivers/gpu/drm/vkms/vkms_config.h
>> +++ b/drivers/gpu/drm/vkms/vkms_config.h
>> @@ -35,6 +35,7 @@ struct vkms_config {
>>    *
>>    * @link: Link to the others planes in vkms_config
>>    * @config: The vkms_config this plane belongs to
>> + * @name: Name of the plane
>>    * @type: Type of the plane. The creator of configuration needs to ensures that
>>    *        at least one primary plane is present.
>>    * @possible_crtcs: Array of CRTCs that can be used with this plane
>> @@ -47,6 +48,7 @@ struct vkms_config_plane {
>>   	struct list_head link;
>>   	struct vkms_config *config;
>>   
>> +	const char *name;
>>   	enum drm_plane_type type;
>>   	struct xarray possible_crtcs;
>>   
>> @@ -288,6 +290,30 @@ vkms_config_plane_set_type(struct vkms_config_plane *plane_cfg,
>>   	plane_cfg->type = type;
>>   }
>>   
>> +/**
>> + * vkms_config_plane_set_name() - Set the plane name
>> + * @plane_cfg: Plane to set the name to
>> + * @name: New plane name. The name is copied.
>> + */
>> +static inline void
>> +vkms_config_plane_set_name(struct vkms_config_plane *plane_cfg,
>> +			   const char *name)
>> +{
>> +	if (plane_cfg->name)
>> +		kfree_const(plane_cfg->name);
>> +	plane_cfg->name = kstrdup_const(name, GFP_KERNEL);
>> +}
>> +
>> +/**
>> + * vkms_config_plane_get_name - Get the plane name
>> + * @plane_cfg: Plane to get the name from
>> + */
>> +static inline const char *
>> +vkms_config_plane_get_name(const struct vkms_config_plane *plane_cfg)
>> +{
>> +	return plane_cfg->name;
>> +}
>> +
>>   /**
>>    * vkms_config_plane_attach_crtc - Attach a plane to a CRTC
>>    * @plane_cfg: Plane to attach
>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
>> index db260df1d4f6..9ad286f043b5 100644
>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
>> @@ -225,6 +225,7 @@ struct vkms_output {
>>   };
>>   
>>   struct vkms_config;
>> +struct vkms_config_plane;
>>   
>>   /**
>>    * struct vkms_device - Description of a VKMS device
>> @@ -298,10 +299,10 @@ int vkms_output_init(struct vkms_device *vkmsdev);
>>    * vkms_plane_init() - Initialize a plane
>>    *
>>    * @vkmsdev: VKMS device containing the plane
>> - * @type: type of plane to initialize
>> + * @config: plane configuration
>>    */
>>   struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>> -				   enum drm_plane_type type);
>> +				   struct vkms_config_plane *config);
>>   
>>   /* CRC Support */
>>   const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
>> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
>> index 2ee3749e2b28..22208d02afa4 100644
>> --- a/drivers/gpu/drm/vkms/vkms_output.c
>> +++ b/drivers/gpu/drm/vkms/vkms_output.c
>> @@ -19,11 +19,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>>   		return -EINVAL;
>>   
>>   	vkms_config_for_each_plane(vkmsdev->config, plane_cfg) {
>> -		enum drm_plane_type type;
>> -
>> -		type = vkms_config_plane_get_type(plane_cfg);
>> -
>> -		plane_cfg->plane = vkms_plane_init(vkmsdev, type);
>> +		plane_cfg->plane = vkms_plane_init(vkmsdev, plane_cfg);
>>   		if (IS_ERR(plane_cfg->plane)) {
>>   			DRM_DEV_ERROR(dev->dev, "Failed to init vkms plane\n");
>>   			return PTR_ERR(plane_cfg->plane);
>> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
>> index e592e47a5736..73180cbb78b1 100644
>> --- a/drivers/gpu/drm/vkms/vkms_plane.c
>> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
>> @@ -9,6 +9,7 @@
>>   #include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_framebuffer_helper.h>
>>   
>> +#include "vkms_config.h"
>>   #include "vkms_drv.h"
>>   #include "vkms_formats.h"
>>   
>> @@ -217,7 +218,7 @@ static const struct drm_plane_helper_funcs vkms_plane_helper_funcs = {
>>   };
>>   
>>   struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>> -				   enum drm_plane_type type)
>> +				   struct vkms_config_plane *config)
>>   {
>>   	struct drm_device *dev = &vkmsdev->drm;
>>   	struct vkms_plane *plane;
>> @@ -225,7 +226,8 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>>   	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 0,
>>   					   &vkms_plane_funcs,
>>   					   vkms_formats, ARRAY_SIZE(vkms_formats),
>> -					   NULL, type, NULL);
>> +					   NULL, vkms_config_plane_get_type(config),
>> +					   vkms_config_plane_get_name(config));
>>   	if (IS_ERR(plane))
>>   		return plane;
>>   
>>
>> -- 
>> 2.51.0
>>

