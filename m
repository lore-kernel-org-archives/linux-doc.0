Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6316B1F790F
	for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 10:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761560177; cv=none; b=lp1oBNTf4T4esDqQ5+1cmu4eTlPtXx/EvA6R6qucPGdKqVAtXs+8KGzbeuozgAVOamzO9e+Q1FdP7D/XoqqPbRbn8Bja9EXMMBYz/fD/K8u6Ne8LMoFSoEvlAFDoCr8tS4UteVzR2e++fo9KWb1p6ewGUPVpXRpYsDRntuht9qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761560177; c=relaxed/simple;
	bh=wqCBTIXKG5ggT+fpgkKiBNToVHmeAQxE5x4PRcGTT8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1X+2Bo4Q49huhZy4h2gWl27klW5mWsuNztdYgTFFEEepZbqn9IZWT0jP7YP43tKtrQkQQWLhg7elvqOs1YzZ4DHhOzGPQe64W9pXtIaU9EoYb/WXiTLOHk+0bWvwOtDC2UFnQ/0y8skHakOt+F4Bi1+qrK69u15VxejnSINGjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IvN3G2a5; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IvN3G2a5"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3f99ac9acc4so4056528f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 03:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761560174; x=1762164974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1ycKl+/hhb5itE1+Ltmy7ywAINLYWd1g7hlRkyXI1s=;
        b=IvN3G2a5WXS7ePbrx67JRYkiZE7Ot1QgWN476IkmAWQOrjxPKmYXstyrRaQoIBSRlt
         ayJJEMAsA7dO6/fmtTC5hOuzvy0gta6X/BLVUGILATd9oFgbJhhJTFwtHd9CTBry6mQn
         bSN4ZX/h22UmWhuCocTHbF3uXAFRoCGxfFn+uDVKuoeXPdCdJMPK/ZEScTyMxy8MLEl6
         brACXkt58iorRn/D2kKZ/IqisneGMECDcLnBCygObYg/Ib0/fGkk9esiVcq+QLp8Sw4t
         Za9CdLOQQFnDoNbhGSA+e8S1zxVf6kzPeB5aRxKbLVI3AXjXcF4FyNSKAAWhCZloBiHk
         M0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761560174; x=1762164974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1ycKl+/hhb5itE1+Ltmy7ywAINLYWd1g7hlRkyXI1s=;
        b=CqlmSIWvmNzhnRZkVU0BPSAHCSpbjQ5kG5m3CRJF8Oz+9WfiBhvFSjs+FUf66pn2pt
         jPw1NKHQO0OvXl69Mqm3Bgb8PkkBf3UsWg4MhZYGg70aGx7AeNvTld8USs+zPPc6xde5
         XzrZOQLh3ZT2Ya9OhfCuf3DDSmN8VS2EUF5LN5TxsjaQTy0dT3t4UkQKaj5U6k+q3lvS
         kYLVSkcwgmicgmMkIltKo/9FM/P5i09LKkEvYrjLWrjVO6eWQuZM4oxlnpRgXLTDXUud
         hERs16zfxZdc6wXk+QdO0W9QrEjqzdnkTylpbHa8sh+IvtMe/MuM7HS2QZ9ILKAVrzyd
         oSWg==
X-Forwarded-Encrypted: i=1; AJvYcCXXwSWmoRh5Z0jUOypdv3cULTN8JTc5a2e/fwnP8h4nBvCau3yJ+PIuni4QQPiL4aEmNmblclePHEM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8wZ8ov6jg9f9Virl26GPHPjZhGS925vdrEPVotSVMR2awF6WQ
	TPfHc8XMdbHjImHyj5vVRs4rhXeCpz06sAYaD/RsFpxEYE+oFBRdL4pc
X-Gm-Gg: ASbGncuNyAU2cNV9ZOni4gbtbw7QeTQnc5uNZ00itWSg6pNucueVAT+kqgdfFW8LblP
	W4E4x8g4mL3FRPZJXXgxqNaHlry0S3GRWm/T5YjQWQ1ku7xf2gFYp2f/HA8YYDOilKD/+5cpDrH
	ONG+xCYfc/K3qVRRalJ9SrDzSq+JQU5TRpS9+akzzLZSWLgCXzZMSYY+NvbQErYQzWDk/Ih7RIB
	VdkOPu9ic4MyR4mCuGrmjGH3bjjzaXLOaQgKDD51+kpm0Uod5cskjGWV+i5vf0236WpC0KxcNra
	B2nhemENL2UCDdKLG5Qg0B3+WMwaZLzfdBAULafRfPd03F1Fhq6qQ2RnoS20NM1z1wXcEJ4Qhn0
	hcOhJxqOdJ3te859lcEToJjRmuHztv+JPEE8+O8Q/cauTvWrC11Oj/H/c27MuL1luQbSQPO7IrQ
	qfnLWl2lwJ
X-Google-Smtp-Source: AGHT+IE7fN8riSaWaNPQPqcUj2U08wNbGcgk+vXxUy3VGXZu/BsYJXKvAJFY4MF4vDgu2NMVkd5xEw==
X-Received: by 2002:a05:6000:400a:b0:427:492:79e6 with SMTP id ffacd0b85a97d-42704d83d9amr24642621f8f.2.1761560173512;
        Mon, 27 Oct 2025 03:16:13 -0700 (PDT)
Received: from fedora ([94.73.38.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952de4a1sm13341611f8f.37.2025.10.27.03.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 03:16:13 -0700 (PDT)
Date: Mon, 27 Oct 2025 11:16:11 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	victoria@system76.com, sebastian.wick@redhat.com,
	thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 19/22] drm/vkms: Introduce configfs for connector EDID
Message-ID: <aP9GawE3nY082QJs@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-19-a7760755d92d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-vkms-all-config-v1-19-a7760755d92d@bootlin.com>

On Sat, Oct 18, 2025 at 04:01:19AM +0200, Louis Chauvet wrote:
> Introduce new attributes to configure EDID of a connector:
> - edid_enable - chose if the connector will have an EDD or not
> - edid - raw edid content
> 
> Due to limitation of ConfigFS, the max len of EDID is PAGE_SIZE (4kB on
> x86), it should be sufficient for many tests. One possible evolution is
> using a ConfigFS blob to allow bigger EDID.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---

Hey Louis,

I wasn't able to set the EDID, could you provide an example?

This is what I tried:

# I'm using QEMU's EDID:
$ cat /sys/class/drm/card0-Virtual-1/edid > qemu-edid.bin

# Create a simple device:
$ sudo mkdir /sys/kernel/config/vkms/gpu1 && \
sudo mkdir /sys/kernel/config/vkms/gpu1/planes/plane0  && \
echo "1" | sudo tee /sys/kernel/config/vkms/gpu1/planes/plane0/type && \
sudo mkdir /sys/kernel/config/vkms/gpu1/crtcs/crtc0 && \
echo "0" | sudo tee /sys/kernel/config/vkms/gpu1/crtcs/crtc0/writeback && \
sudo mkdir /sys/kernel/config/vkms/gpu1/encoders/encoder0 && \
sudo mkdir /sys/kernel/config/vkms/gpu1/connectors/connector0 && \
sudo ln -s /sys/kernel/config/vkms/gpu1/crtcs/crtc0 /sys/kernel/config/vkms/gpu1/planes/plane0/possible_crtcs && \
sudo ln -s /sys/kernel/config/vkms/gpu1/crtcs/crtc0 /sys/kernel/config/vkms/gpu1/encoders/encoder0/possible_crtcs && \
sudo ln -s /sys/kernel/config/vkms/gpu1/encoders/encoder0 /sys/kernel/config/vkms/gpu1/connectors/connector0/possible_encoders

$ cat qemu-edid.bin | sudo tee /sys/kernel/config/vkms/gpu1/connectors/connector0/edid

# The EDID is stored and it is correct:
$ cat /sys/kernel/config/vkms/gpu1/connectors/connector0/edid | edid-decode

$ echo "1" | sudo tee /sys/kernel/config/vkms/gpu1/connectors/connector0/edid_enabled
$ echo "1" | sudo tee /sys/kernel/config/vkms/gpu1/enabled

# After enabling the device, the EDID is not present:
$ cat /sys/class/drm/card1-Virtual-2/edid
<empty>

And drm_info does not show the EDID property.

Am I missing something?

>  Documentation/gpu/vkms.rst           |  5 ++-
>  drivers/gpu/drm/vkms/vkms_configfs.c | 81 +++++++++++++++++++++++++++++++++++-
>  2 files changed, 84 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 650d6f6e79fd..bbd03f61e61c 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -135,7 +135,7 @@ Last but not least, create one or more connectors::
>  
>    sudo mkdir /config/vkms/my-vkms/connectors/connector0
>  
> -Connectors have 3 configurable attribute:
> +Connectors have 5 configurable attribute:
>  
>  - status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
>    as those exposed by the "status" property of a connector)
> @@ -144,6 +144,9 @@ Connectors have 3 configurable attribute:
>    If supported_colorspaces is not 0, the HDR_OUTPUT_METADATA will also be created.
>    Value is a bitfield, 0x1 = NO_DATA, 0x2 = SMPTE_170M_YCC... see enum drm_colorspace
>    for full list.
> +- edid_enabled: Enable or not EDID for this connector. Some connectors may not have an
> +  EDID but just a list of modes, this attribute allows to disable EDID property.
> +- edid: Content of the EDID. Ignored if edid_enabled is not set
>  
>  
>  To finish the configuration, link the different pipeline items::
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 909f4557caec..a977c0842cd6 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -1,5 +1,4 @@
>  // SPDX-License-Identifier: GPL-2.0+
> -#include "asm-generic/errno-base.h"
>  #include <linux/cleanup.h>
>  #include <linux/configfs.h>
>  #include <linux/mutex.h>
> @@ -1222,14 +1221,94 @@ static ssize_t connector_supported_colorspaces_store(struct config_item *item,
>  	return count;
>  }
>  
> +static ssize_t connector_edid_enabled_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_connector *connector;
> +	bool enabled;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +
> +	scoped_guard(mutex, &connector->dev->lock)
> +		enabled = vkms_config_connector_get_edid_enabled(connector->config);
> +
> +	return sprintf(page, "%d\n", enabled);
> +}
> +
> +static ssize_t connector_edid_enabled_store(struct config_item *item,
> +					    const char *page, size_t count)
> +{
> +	struct vkms_configfs_connector *connector;
> +	struct vkms_config_connector *connector_cfg;
> +	bool enabled;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +	connector_cfg = connector->config;
> +
> +	if (kstrtobool(page, &enabled))
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &connector->dev->lock)
> +	{
> +		vkms_config_connector_set_edid_enabled(connector_cfg, enabled);
> +
> +		if (connector->dev->enabled &&
> +		    vkms_config_connector_get_status(connector_cfg) !=
> +		    connector_status_disconnected)
> +			vkms_trigger_connector_hotplug(connector->dev->config->dev);
> +	}
> +	return count;
> +}
> +
> +static ssize_t connector_edid_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_connector *connector;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +
> +	scoped_guard(mutex, &connector->dev->lock)
> +	{
> +		unsigned int len = 0;
> +		const u8 *edid = vkms_config_connector_get_edid(connector->config, &len);
> +
> +		memcpy(page, edid, min(len, PAGE_SIZE));
> +		return min(len, PAGE_SIZE);
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static ssize_t connector_edid_store(struct config_item *item,
> +				    const char *page, size_t count)
> +{
> +	struct vkms_configfs_connector *connector;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +
> +	scoped_guard(mutex, &connector->dev->lock)
> +	{
> +		vkms_config_connector_set_edid(connector->config, page, count);
> +
> +		if (connector->dev->enabled &&
> +		    vkms_config_connector_get_status(connector->config) !=
> +		    connector_status_disconnected)
> +			vkms_trigger_connector_hotplug(connector->dev->config->dev);
> +	}
> +
> +	return count;
> +}
> +
>  CONFIGFS_ATTR(connector_, status);
>  CONFIGFS_ATTR(connector_, type);
>  CONFIGFS_ATTR(connector_, supported_colorspaces);
> +CONFIGFS_ATTR(connector_, edid_enabled);
> +CONFIGFS_ATTR(connector_, edid);
>  
>  static struct configfs_attribute *connector_item_attrs[] = {
>  	&connector_attr_status,
>  	&connector_attr_type,
>  	&connector_attr_supported_colorspaces,
> +	&connector_attr_edid_enabled,
> +	&connector_attr_edid,
>  	NULL,
>  };
>  
> 
> -- 
> 2.51.0
> 
