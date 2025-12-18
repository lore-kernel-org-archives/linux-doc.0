Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D211C33FE0C;
	Thu, 18 Dec 2025 17:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766080753; cv=none; b=AKJH8uDSIw5dLS73qlV5dzhhdy1LVk2PAiDnvEnXCTo1NFmf2ZTWXQR6iPUTIBilqeHk1kGzdl03PePWVRSx/j0WkoQbKtsx60pJcXhfXeTxHU29gZebtpdedK1QMb/gOq+/V3UevP+qAAy7ry5D8iw07Sm8DspLzb3BOyTuRR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766080753; c=relaxed/simple;
	bh=YR/7Q2g8BZIo358jMlSABlqla+DXbbwOo0cerZXPMWU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=l9JQf8fFd7fFXVvXEFqvtKLy9mdGt+Gbp04nE13skEo/Xy1DeDn8S2bb79Fe8WFNG/1NQgEpZVwjxz3+3j13/uMjG0ctoUs/l3sq52yOnsjGQM8mC6JsZp1/CkcIexOfA6w/e+Lrtd4a36WBwW07DpGSRQl2zYd3GCHo3Lu109c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qcd7UiRh; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qcd7UiRh"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 662291A22D5;
	Thu, 18 Dec 2025 17:59:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C21260715;
	Thu, 18 Dec 2025 17:59:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92AF4102F0B52;
	Thu, 18 Dec 2025 18:59:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766080749; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=U2PcXRWPdqqdKexuvgL8gJLIRktRu9Qz+va7+IXRxc4=;
	b=qcd7UiRhm43q+fC+Cgmyi+SBrM5loQXBn9CrlFrx6NJuQhB3jNiqWzd9/YJk3qSvsWd3bW
	hgOFr6PNbBa65+wWl6JNmDRVrlwmAgRMxs3qjg0jU/lhMrhT+TvpswqjSVvn7aN9zpD181
	NH6OTTD14a8QSi2TGi4XOFX7dNjkmJW5AaTybmPgTfXo64O+zsF+hLuToe/s1cQMZetlTI
	No8+ekS9rLUQaBmwcF4wZ9Q8i07Wfbi2pnA8+jhhIvSwuE8G04rBf+q5aWE+zXLLyAD0Re
	5n11zCokSv6CdgCFvgoFGbycEIZu+HX8gVwhyQRzUkY4jDrBo6F7bfp1IzfyDA==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 18:59:07 +0100
Message-Id: <DF1JDIS852IP.3JJPD06T65AB3@bootlin.com>
Subject: Re: [PATCH RESEND v2 09/32] drm/vkms: Introduce configfs for plane
 rotation
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
 <20251029-vkms-all-config-v2-9-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-9-a49a2d4cba26@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 29, 2025 at 3:36 PM CET, Louis Chauvet wrote:
> To allows the userspace to test many hardware configuration, introduce a
                                                configurations

> new interface to configure the available rotation per planes. VKMS
> supports any rotation and reflection, so the userspace can choose any
> combination.
>
> The supported rotations are configured by writing a rotation bitmask to
> the file `supported_rotations` and the default rotation is chosen by
> writing a rotation bitmask to `default_rotation`.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/gpu/vkms.rst           |  7 ++-
>  drivers/gpu/drm/vkms/vkms_configfs.c | 91 ++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 97 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 1fe6e420c963..eac1a942d6c4 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -87,11 +87,16 @@ Start by creating one or more planes::
>
>    sudo mkdir /config/vkms/my-vkms/planes/plane0
>
> -Planes have 2 configurable attributes:
> +Planes have 4 configurable attributes:
>
>  - type: Plane type: 0 overlay, 1 primary, 2 cursor (same values as those
>    exposed by the "type" property of a plane)
>  - name: Name of the plane
> +- possible_rotations: Available rotation for a plane, as a bitmask: 0x01=
 no rotation,
> +  0x02 rotate 90=C2=B0, 0x04 rotate 180=C2=B0, 0x08 rotate 270=C2=B0, 0x=
10 reflect x, 0x20 reflect y
> +  (same values as those exposed by the "rotation" property of a plane)
> +- default_rotation: Default rotation presented to the userspace, same va=
lues as
> +  possible_rotations.
>
>  Continue by creating one or more CRTCs::
>
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/=
vkms_configfs.c
> index be6c3ba998b9..7cc8ba315ef0 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -352,12 +352,103 @@ static ssize_t plane_name_store(struct config_item=
 *item, const char *page,
>  	return (ssize_t)count;
>  }
>
> +static ssize_t plane_supported_rotations_show(struct config_item *item, =
char *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int plane_supported_rotations;
> +
> +	plane =3D plane_item_to_vkms_configfs_plane(item);

Small nit: below you do

  struct vkms_configfs_plane *plane =3D plane_item_to_vkms_configfs_plane(i=
tem);

Why not here as well?

> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		plane_supported_rotations =3D vkms_config_plane_get_supported_rotation=
s(plane->config);
> +	}
> +
> +	return sprintf(page, "%u", plane_supported_rotations);
> +}
> +
> +static ssize_t plane_supported_rotations_store(struct config_item *item,
> +					       const char *page, size_t count)
> +{
> +	struct vkms_configfs_plane *plane =3D plane_item_to_vkms_configfs_plane=
(item);
> +	int ret, val =3D 0;
> +
> +	ret =3D kstrtouint(page, 0, &val);
> +	if (ret)
> +		return ret;
> +
> +	/* Should be a supported value */
> +	if (val & ~(DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK))
> +		return -EINVAL;
> +	/* Should at least provide one rotation */
> +	if (!(val & DRM_MODE_ROTATE_MASK))
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		/* Ensures that the default rotation is included in supported rotation=
 */
> +		if (plane->dev->enabled)
> +			return -EINVAL;

The comment does not seem related to the code.

> +
> +		vkms_config_plane_set_supported_rotations(plane->config, val);
> +	}
> +
> +	return count;
> +}
> +
> +static ssize_t plane_default_rotation_show(struct config_item *item, cha=
r *page)
> +{
> +	struct vkms_configfs_plane *plane;
> +	unsigned int plane_default_rotation;
> +
> +	plane =3D plane_item_to_vkms_configfs_plane(item);

Same as above.

> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		plane_default_rotation =3D vkms_config_plane_get_default_rotation(plan=
e->config);
> +	}
> +
> +	return sprintf(page, "%u", plane_default_rotation);
> +}
> +
> +static ssize_t plane_default_rotation_store(struct config_item *item,
> +					    const char *page, size_t count)
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
> +	if (val & ~(DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK))
> +		return -EINVAL;
> +	/* Should at least provide one rotation */
> +	if ((val & DRM_MODE_ROTATE_MASK) =3D=3D 0)
> +		return -EINVAL;

This if is redundant because...

> +	/* Should contains only one rotation */
        /* Should contain exactly one rotation */


> +	if (!is_power_of_2(val & DRM_MODE_ROTATE_MASK))
> +		return -EINVAL;

...is_power_of_2() returns false if the parameter is 0.

> +
> +	scoped_guard(mutex, &plane->dev->lock) {
> +		/* Ensures that the default rotation is included in supported rotation=
 */
> +		if (plane->dev->enabled)
> +			return -EINVAL;

Same as above.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
