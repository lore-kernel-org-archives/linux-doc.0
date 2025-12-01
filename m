Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC14C1E868
	for <linux-doc@vger.kernel.org>; Mon,  1 Dec 2025 07:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764575590; cv=none; b=f8BMPWMONdu6On1lmAWQdPCDbC0MjYhyxNFJXhrI0XEb5Qlv57DCqWblAhvDimHCwSLbtsXVM0msUob+kyoDM8G6jJnC3y61FKwzxU6lJJV+oxXH42VC5UZfAsPWpwSWId7GuIOvkHrWwCdMcLoBp1OeUVu91mjkXFNnMpBXlMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764575590; c=relaxed/simple;
	bh=c0NkWRvDHjDZ6vLDBhzg2i7QO2P+jVP+j1KebOcI1bE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDL9ztI1W04NVFDVUwHbG/jHl/SIAoCRyyFeZi8qdcLWlDhZpJLYQ6ZFsG+Y5Y19ad28Uy8Xlf9jwdeUAw9VWVCaAidO0L7Lp0WlrKeLuLRQyyIOhb/Ta4t4xP/2SRWap15dWWDqERWy7CzaM2xOU2C2mQiYwIpiP/JEGlDlRa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dt3QKrk1; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dt3QKrk1"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-298144fb9bcso37711735ad.0
        for <linux-doc@vger.kernel.org>; Sun, 30 Nov 2025 23:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764575588; x=1765180388; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gaVAYubTTHnTVtytpaBYGZFzgOCnLstoEySaefvC3iw=;
        b=Dt3QKrk1B8swoG1SMkYwHIOr1yalWqpwKdgegdpFccy3slX0YMaIx6dO85ZOFfV1OJ
         O9c0oIOwPLvq6s8wO0TV776b5SnPA7Ctt6qRsMG6+DN7GI4nCrG1C+Jns2SD8+j0jNSe
         jG2bb1uhWdn4DN1n31NHn8tiLdOJ0O2uNmj6V1Ec59yl3hnM3kKvE9PNR2rVU3YA1qv/
         k++xs/Jdn1yW11jkc0BxYvmg6puMuvTq4OZAE5G13ouAs5zOLPzxqW9tHkPrpSSSXT4j
         6BqSXXiAJvF93sfrx/BkBPDXXSgqZ/FIDgSaaPCrsju9c40TwUV08PsEkqOmKTzJxIsE
         Q/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764575588; x=1765180388;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gaVAYubTTHnTVtytpaBYGZFzgOCnLstoEySaefvC3iw=;
        b=IuPIrQ+VdX+G5a0ewA4dJ1ZwTKAv2cTushnHizKF9ZN0vO22l66WNLv7pTRjKbeqAk
         GCX7uPZ5TY28l4eeUepfz3j/khevEOqDLxXGr4iUWx3STpUFmMBFhPqu32UgCPBlIIYd
         N5rOyXott+nDtYzElxVe/kVy4nPwKaYFqBkF5MVvsKAekG1kdx0EuW/d0ZiJfJm/PuYc
         6UYt+dF7jQWeY9juxPFRVLSbbiLqyrO+u+q0BKHQIb52nfOWYU9uYyyM9tSCPdWyKvb2
         p/ORXgEHeJVk9f589mVW7nXoK5EyFENGKZ9nV/PGrvBZx4UUA/tUtqN/3HnGbwVLXdyP
         +CFw==
X-Forwarded-Encrypted: i=1; AJvYcCWUBUc0DncT9cWjjCph+lqQwcGp+fkKd2SEtYWokgtDZmSLku/dIOBSMoenVLtRklGH5O+gLTdZxwg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2aTVLt71c7QOfiA7N6gtMGkgBPsis4bGAH1HTU11q/hJfPOIP
	AOLsdjUI4BhW6IZ306Kl1iGK/RThfMUg1wIcMEvPzuBNsa7PVmfyQXd+
X-Gm-Gg: ASbGncs2W1uBuoj3OBuZbfD2a3ebhP2zsMAjHfp1KfAM8T1kZzFFA3/lY5Lq7oehyO6
	pAMWM4uEpF+LZ3NdrnjQP7y5HcIc+rVgyjlbwy8APhm7Z9mZ3hUvrQyvHSf+5bsM1PhGffFywzd
	8RG6OHSi7lYrJU4v6/fUUZPezgvBETQ9dQiqUidOF6uuJWy+MNOAb1voKu7/NX8kXE5R9u5Hmk9
	3DhUGwrtRIIqpb1hjUI9l9J8VYuVu/VhOm2t5V4grGXxzNz7vlvkoKAYJJY/b8w57Vgc6CPLLZb
	az/tUE0tR7Y7noDFdzd4VzTdvXREVNXbejV8RyRpkuKo4sZ/rtM/fVCDOy9HTKmC4r+y0dyvSEW
	lIMbefOJN4tcClgF6QzU/wsKqWCfzMB4f3oKimYL+uwfclpkTmqAkPgdwlCJHVG1WuawO1Hpslx
	X0WmCZPU9wVGMbDWiwLSgr
X-Google-Smtp-Source: AGHT+IGlmCeUIpwU3Ydo+tzqNkpFv3NHVIjiD567+Cj+5rL592Tgy7C6Ht+ABzfU61uvmKPtq3k2Rw==
X-Received: by 2002:a17:902:d583:b0:288:5d07:8a8f with SMTP id d9443c01a7336-29baafb7ec1mr273010985ad.24.1764575588133;
        Sun, 30 Nov 2025 23:53:08 -0800 (PST)
Received: from google.com ([2401:fa00:95:201:2a71:e28f:ae3c:b20c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce44389bsm115488825ad.32.2025.11.30.23.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 23:53:07 -0800 (PST)
Date: Mon, 1 Dec 2025 15:53:03 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, "Tsao, Anson" <anson.tsao@amd.com>,
	"Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
Subject: Re: [PATCH v3 4/5] drm/amdgpu: add UMA allocation interfaces to sysfs
Message-ID: <aS1JX1VNNJFb9T60@google.com>
References: <20251126-vram-carveout-tuning-for-upstream-v3-0-cf1729c4cb3c@amd.com>
 <20251126-vram-carveout-tuning-for-upstream-v3-4-cf1729c4cb3c@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-vram-carveout-tuning-for-upstream-v3-4-cf1729c4cb3c@amd.com>

Hi Leo and Mario,

On Wed, Nov 26, 2025 at 05:05:15PM +0800, Yo-Jung Leo Lin (AMD) wrote:
> Add a uma/ directory containing two sysfs files as interfaces to
> inspect or change UMA carveout size. These files are:
> 
> - uma/carveout_options: a read-only file listing all the available
>   UMA allocation options and their index.
> 
> - uma/carveout: a file that is both readable and writable. On read,
>   it shows the index of the current setting. Writing a valid index
>   into this file allows users to change the UMA carveout size to that
>   option on the next boot.
> 
> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 137 +++++++++++++++++++++++++++++++
>  1 file changed, 137 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> index bce9027fa241..c3b7b8c91919 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
> @@ -30,6 +30,7 @@
>  #include <linux/power_supply.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/suspend.h>
> +#include <linux/device.h>
>  #include <acpi/video.h>
>  #include <acpi/actbl.h>
>  
> @@ -1246,6 +1247,135 @@ int amdgpu_acpi_get_mem_info(struct amdgpu_device *adev, int xcc_id,
>  	return -ENOENT;
>  }
>  
> +static ssize_t carveout_options_show(struct device *dev,
> +				     struct device_attribute *attr,
> +				     char *buf)
> +{
> +	struct amdgpu_uma_carveout_info *uma_info = &amdgpu_acpi_priv.atcs.uma_info;
> +	uint32_t memory_carved;
> +	ssize_t size = 0;
> +
> +	if (!uma_info || !uma_info->num_entries)
> +		return -ENODEV;
> +
> +	for (int i = 0; i < uma_info->num_entries; i++) {
> +		memory_carved = uma_info->entries[i].memory_carved_mb;
> +		if (memory_carved >= SZ_1G/SZ_1M) {
> +			size += sysfs_emit_at(buf, size, "%d: %s (%u GB)\n",
> +					      i,
> +					      uma_info->entries[i].name,
> +					      memory_carved >> 10);
> +		} else {
> +			size += sysfs_emit_at(buf, size, "%d: %s (%u MB)\n",
> +					      i,
> +					      uma_info->entries[i].name,
> +					      memory_carved);
> +		}
> +	}
> +
> +	return size;
> +}
> +static DEVICE_ATTR_RO(carveout_options);
> +
> +static ssize_t carveout_show(struct device *dev,
> +			     struct device_attribute *attr,
> +			     char *buf)
> +{
> +	return sysfs_emit(buf, "%u\n", amdgpu_acpi_priv.atcs.uma_info.uma_option_index);
> +}
> +
> +static ssize_t carveout_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct amdgpu_uma_carveout_info *uma_info = &amdgpu_acpi_priv.atcs.uma_info;
> +	struct drm_device *ddev = dev_get_drvdata(dev);
> +	struct amdgpu_device *adev = drm_to_adev(ddev);
> +	struct amdgpu_uma_carveout_option *opt;
> +	unsigned long val;
> +	uint8_t flags;
> +	int r;
> +
> +	r = kstrtoul(buf, 10, &val);
> +	if (r)
> +		return r;
> +
> +	if (val >= uma_info->num_entries)
> +		return -EINVAL;
> +
> +	opt = &uma_info->entries[val];
> +
> +	if (!(opt->flags & AMDGPU_UMA_FLAG_AUTO) &&
> +	    !(opt->flags & AMDGPU_UMA_FLAG_CUSTOM)) {
> +		drm_err_once(ddev, "Option %ul not supported due to lack of Custom/Auto flag", r);

I'm not an expert in drm or gpu related stuff.
But r is always 0 here. Also, its type is int, so it doesn't match the
%ul format specifier.

I guess you mean val instead of r here?

Regards,
Kuan-Wei

> +		return -EINVAL;
> +	}
> +
> +	flags = opt->flags;
> +	flags &= ~((flags & AMDGPU_UMA_FLAG_AUTO) >> 1);
> +
> +	guard(mutex)(&uma_info->update_lock);
> +
> +	r = amdgpu_acpi_set_uma_allocation_size(adev, val, flags);
> +	if (r)
> +		return r;
> +
> +	uma_info->uma_option_index = val;
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RW(carveout);
> +
> +static struct attribute *amdgpu_uma_attrs[] = {
> +	&dev_attr_carveout.attr,
> +	&dev_attr_carveout_options.attr,
> +	NULL
> +};
> +
> +const struct attribute_group amdgpu_uma_attr_group = {
> +	.name = "uma",
> +	.attrs = amdgpu_uma_attrs
> +};
> +
> +static int amdgpu_acpi_uma_option_init(struct amdgpu_device *adev)
> +{
> +	struct amdgpu_atcs *atcs = &amdgpu_acpi_priv.atcs;
> +	int rc;
> +
> +	if (!atcs->functions.set_uma_allocation_size)
> +		return -ENODEV;
> +
> +	rc = amdgpu_atomfirmware_get_uma_carveout_info(adev, &atcs->uma_info);
> +	if (rc) {
> +		drm_dbg(adev_to_drm(adev),
> +			"Failed to parse UMA carveout info from VBIOS: %d\n", rc);
> +		goto out_info;
> +	}
> +
> +	mutex_init(&atcs->uma_info.update_lock);
> +
> +	rc = devm_device_add_group(adev->dev, &amdgpu_uma_attr_group);
> +	if (rc) {
> +		drm_dbg(adev_to_drm(adev), "Failed to add UMA carveout sysfs interfaces %d\n", rc);
> +		goto out_attr;
> +	}
> +
> +	return 0;
> +
> +out_attr:
> +	mutex_destroy(&atcs->uma_info.update_lock);
> +out_info:
> +	return rc;
> +}
> +
> +static void amdgpu_acpi_uma_option_fini(void)
> +{
> +	struct amdgpu_uma_carveout_info *uma_info = &amdgpu_acpi_priv.atcs.uma_info;
> +
> +	mutex_destroy(&uma_info->update_lock);
> +	uma_info->num_entries = 0;
> +}
> +
>  /**
>   * amdgpu_acpi_event - handle notify events
>   *
> @@ -1290,6 +1420,12 @@ static int amdgpu_acpi_event(struct notifier_block *nb,
>  int amdgpu_acpi_init(struct amdgpu_device *adev)
>  {
>  	struct amdgpu_atif *atif = &amdgpu_acpi_priv.atif;
> +	int rc;
> +
> +	rc = amdgpu_acpi_uma_option_init(adev);
> +
> +	if (rc)
> +		drm_dbg(adev_to_drm(adev), "Not creating uma carveout interfaces: %d", rc);
>  
>  	if (atif->notifications.brightness_change) {
>  		if (adev->dc_enabled) {
> @@ -1342,6 +1478,7 @@ void amdgpu_acpi_get_backlight_caps(struct amdgpu_dm_backlight_caps *caps)
>  void amdgpu_acpi_fini(struct amdgpu_device *adev)
>  {
>  	unregister_acpi_notifier(&adev->acpi_nb);
> +	amdgpu_acpi_uma_option_fini();
>  }
>  
>  /**
> 
> -- 
> 2.43.0
> 
> 
