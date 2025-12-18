Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0935B352925
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 18:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080858; cv=none; b=LvbXd743SaW2MOCPgfPA+vFeT7+e4GT0nOssLkE8iNpIvVihHyWX+S/tfkMvg3bDbK5327gUqPKAaXs88pIM0ByOxH5h/BpLro6CpLkKIn1hyzU6SWve0T2/TiVbj/1f4nCzrEGk7OyA8bSmUpREZMhtSvqMLIsrkXmmAQo1WFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080858; c=relaxed/simple;
	bh=AstMwyrc9ZlNvilncAUr2MLmkYTnJy/Ra7JqyM7o2Kk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=I0AKM6KJG1Oc3GobKl7xvSrT3mvhB2G401TEFjr5QzFAYeGRgWlHM+LziDiquJAozdpltotyd7wh91jpeETiWZKqKlWtkuM0R9Jq8MgzBsUChIWdb01Gf5Fs9IbwOUwgt4DxjD68c5jgC96HCnWTSzNU77Q1a1uj3KzOtJ3xaO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qaXzUB/C; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qaXzUB/C"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D3F5EC1A5B5;
	Thu, 18 Dec 2025 18:00:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7471C60715;
	Thu, 18 Dec 2025 18:00:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9ADC102F0B52;
	Thu, 18 Dec 2025 19:00:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766080850; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NiVoi+M8qO/I/Ju9YOlhfK4FUtabWy/e5OhxAn7IcBk=;
	b=qaXzUB/CqkZ8vwDkHMM3y4NfStLMgvR8/Shng1MSlidZn1D1HgO+Gw0lNHrFRruwL9x7p9
	7U0SLaWibDoMRQ3wtgCr+34WqIensWQPrgx+GV991FP8oUn/jpJSr/tdfMebehZj/ngp9D
	8bgCLOelY++7B6sTc2865WvIOzQYuOsvbVKH0Ewfcbe2SG2REZbmp6P1tgm8FhjunZP3yk
	3Lpj1kXCF1yPqweqjAvYyMxxR5qrS1NvfUDfVwMqwIgupxGH/L1NQLIljNB/4T0oK3mNEl
	hUda+z6j7+Tb9VaFaoJR1F3IdjOyHNJ8dVHqx2/eueUTX6hSb9RudmqNvpuGxA==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 19:00:48 +0100
Message-Id: <DF1JETBGEUFA.EK2SDN9BJMB6@bootlin.com>
Subject: Re: [PATCH RESEND v2 15/32] drm/vkms: Introduce configfs for plane
 color range
Cc: <victoria@system76.com>, <sebastian.wick@redhat.com>,
 <thomas.petazzoni@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>, "Haneen Mohammed"
 <hamohammed.sa@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Melissa Wen"
 <melissa.srw@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, <jose.exposito89@gmail.com>, "Jonathan Corbet"
 <corbet@lwn.net>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
 <20251029-vkms-all-config-v2-15-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-15-a49a2d4cba26@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 29, 2025 at 3:36 PM CET, Louis Chauvet wrote:
> To allows the userspace to test many hardware configuration, introduce a
> new interface to configure the available color ranges per planes. VKMS
> supports multiple color ranges, so the userspace can choose any
> combination.
>
> The supported color ranges are configured by writing a color range bitmas=
k
> to the file `supported_color_ranges` and the default color range is
> chosen by writing a color encoding bitmask to `default_color_range`.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/=
vkms_configfs.c
> index ee2e8d141f9e..3f658dd41272 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -439,6 +439,91 @@ static ssize_t plane_default_rotation_store(struct c=
onfig_item *item,
>  	return count;
>  }
>
> +static ssize_t plane_supported_color_ranges_show(struct config_item *ite=
m, char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int supported_color_range;
                     supported_color_ranges

> +
> +	plane =3D plane_item_to_vkms_configfs_plane(item);

As for previous patches, set this on declaration for consistency (same belo=
w).

> +static ssize_t plane_supported_color_ranges_store(struct config_item *it=
em,
> +						  const char *page, size_t count)
> +{
> +	struct vkms_configfs_plane *plane =3D plane_item_to_vkms_configfs_plane=
(item);
> +	int ret, val =3D 0;
> +
> +	ret =3D kstrtouint(page, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* Should be a supported value */
> +	if (val & ~(BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE)))
> +		return -EINVAL;
> +	/* Should at least provide one color range */
> +	if ((val & (BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE))) =3D=3D 0)
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		/* Ensures that the default rotation is included in supported rotation=
 */

Oh no, that comment again! :-)

> +static ssize_t plane_default_color_range_store(struct config_item *item,
> +					       const char *page, size_t count)
> +{
> +	struct vkms_configfs_plane *plane =3D plane_item_to_vkms_configfs_plane=
(item);
> +	int ret, val =3D 0;
> +
> +	ret =3D kstrtouint(page, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* Should be a supported value */
> +	if (val & ~(BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE)))
> +		return -EINVAL;
> +	/* Should at least provide one color range */
> +	if ((val & (BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
> +		    BIT(DRM_COLOR_YCBCR_FULL_RANGE))) =3D=3D 0)
> +		return -EINVAL;

As in patch 12, replace this with is_power_of_2() to check that exactly one
bit is set.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
