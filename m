Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4CE2BE7C3;
	Mon,  1 Dec 2025 08:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764578079; cv=none; b=ajA3lQcQ1TVgB36pHQ/rcZcliFgYGpD1N3oevBbojILRbAZbTnrvqeqrcJN6IP4CxnKQ2sZyK9hRpyGaccEeXV2yCXR2bMN2xqoTbKhaSvwA/nON1hFa1ZN6bNSb5K3X+TiTx+mow8xn/HtkwNhhdIDyOTk4BYtDM0WcrcElhiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764578079; c=relaxed/simple;
	bh=bDPYc8Ad43GPmGGO8b4zIo3oVR1qxhpi1lVENnkkQ2s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oG7pXFpqncFfpC18lQuw9IRLpVOGfoW4xDRTo6Yr1bbTaSeBsU+TnjpFyMUG+JtHjSpMUkkGo/FAorcSyceL85hic84bl3iOQYyRLRVzWvSVqjcl4PkTXEfNWLSp+IcA9IqWf7+Cn0YK6oDUyK+tS09s5YUPNV3STmwlX0R2Saw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=M6kHp05m; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="M6kHp05m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764578075;
	bh=bDPYc8Ad43GPmGGO8b4zIo3oVR1qxhpi1lVENnkkQ2s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=M6kHp05mEYL6ScpntjhktZpUKFnN+zzmyRYbC2wAlsMUkg5hXrAUPFQMUPfk5zrXS
	 iBGx3s8Bj90RtXmpxCQMI4R2cUZqYcLkd6bPAxLSTeiRD+p0S17oemRF4TbcwZXN1j
	 BSFJtcibB00n6e3HLlAztUi+9qaPjXsb94cAKFsOR35tQc5fRA/bTR5Z1xfTu/kah3
	 V8gJw9o+n+BYRz6EFa42dlNpUHpc390/W+Jpjnq10XDaqAfYCq3vi/n7xmfdzN6uoM
	 YIgONcd61f0XOpG/pHcBZ/7BVUh5BGkQaJ70K89+Y90ubAbX0QdUa9V24bjXWxWRyn
	 a0w3d1jomS+fA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8153917E0EB8;
	Mon,  1 Dec 2025 09:34:34 +0100 (CET)
Date: Mon, 1 Dec 2025 09:34:32 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mcanal@igalia.com>, Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, =?UTF-8?B?TWlrb8WCYWo=?= Wasiak
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>, Nitin
 Gote <nitin.r.gote@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Christopher Healy <healych@amazon.com>,
 Matthew Wilcox <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v10 04/10] drm/gem: Add huge tmpfs mountpoint helpers
Message-ID: <20251201093432.5cd45ae0@fedora>
In-Reply-To: <20251128185252.3092-5-loic.molinari@collabora.com>
References: <20251128185252.3092-1-loic.molinari@collabora.com>
	<20251128185252.3092-5-loic.molinari@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 28 Nov 2025 19:52:46 +0100
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> Add the drm_gem_huge_mnt_create() and drm_gem_get_huge_mnt() helpers
> to avoid code duplication in the i915, V3D, Panfrost and Panthor
> drivers. The former creates and mounts a dedicated huge tmpfs
> mountpoint, for the lifetime of a DRM device, used at GEM object
> initialization. The latter retrieves the dedicated huge tmpfs
> mountpoint used by a DRM device.
>=20
> The next commits will port drivers to these helpers.
>=20
> v3:
> - store huge tmpfs mountpoint in drm_device
>=20
> v4:
> - return 0 in builds with CONFIG_TRANSPARENT_HUGEPAGE=3Dn
> - return 0 when huge_mnt already exists
> - use new vfs_parse_fs_string() helper
>=20
> v5:
> - remove warning on !dev->huge_mnt and reset to NULL on free
> - inline drm_gem_huge_mnt_create() to remove func from text and avoid
>   calls in builds with CONFIG_TRANSPARENT_HUGEPAGE=3Dn
> - compile out drm_device's huge_mnt field in builds with
>   CONFIG_TRANSPARENT_HUGEPAGE=3Dn
> - add drm_gem_has_huge_mnt() helper
>=20
> v6:
> - move huge_mnt doc into ifdef'd section
> - either inline or export drm_gem_huge_mnt_create()
>=20
> v7:
> - include <drm/drm_device.h> in drm_gem.h
>=20
> v9:
> - replace drm_gem_has_huge_mnt() by drm_gem_get_huge_mnt()
>=20
> Signed-off-by: Lo=C3=AFc Molinari <loic.molinari@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gem.c | 57 +++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_device.h  | 15 +++++++++++
>  include/drm/drm_gem.h     | 33 +++++++++++++++++++++++
>  3 files changed, 105 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 41d344c270a7..94e5e04865ba 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -29,6 +29,9 @@
>  #include <linux/export.h>
>  #include <linux/file.h>
>  #include <linux/fs.h>
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +#include <linux/fs_context.h>
> +#endif
>  #include <linux/iosys-map.h>
>  #include <linux/mem_encrypt.h>
>  #include <linux/mm.h>
> @@ -82,6 +85,60 @@
>   * up at a later date, and as our interface with shmfs for memory alloca=
tion.
>   */
> =20
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +static void drm_gem_huge_mnt_free(struct drm_device *dev, void *data)
> +{
> +	kern_unmount(dev->huge_mnt);
> +}
> +
> +/**
> + * drm_gem_huge_mnt_create - Create, mount and use a huge tmpfs mountpoi=
nt
> + * @dev: DRM device a huge tmpfs mountpoint should be used with
> + * @value: huge tmpfs mount option value
> + *
> + * This function creates and mounts a dedicated huge tmpfs mountpoint fo=
r the
> + * lifetime of the DRM device @dev which is used at GEM object initializ=
ation
> + * with drm_gem_object_init().
> + *
> + * The most common option value @value is "within_size" which only alloc=
ates
> + * huge pages if the page will be fully within the GEM object size. "alw=
ays",
> + * "advise" and "never" are supported too but the latter would just crea=
te a
> + * mountpoint similar to the default one (`shm_mnt`). See shmemfs and
> + * Transparent Hugepage for more information.
> + *
> + * Returns:
> + * 0 on success or a negative error code on failure.
> + */
> +int drm_gem_huge_mnt_create(struct drm_device *dev, const char *value)
> +{
> +	struct file_system_type *type;
> +	struct fs_context *fc;
> +	int ret;
> +
> +	if (unlikely(drm_gem_get_huge_mnt(dev)))
> +		return 0;
> +
> +	type =3D get_fs_type("tmpfs");
> +	if (unlikely(!type))
> +		return -EOPNOTSUPP;
> +	fc =3D fs_context_for_mount(type, SB_KERNMOUNT);
> +	if (IS_ERR(fc))
> +		return PTR_ERR(fc);
> +	ret =3D vfs_parse_fs_string(fc, "source", "tmpfs");
> +	if (unlikely(ret))
> +		return -ENOPARAM;
> +	ret =3D vfs_parse_fs_string(fc, "huge", value);
> +	if (unlikely(ret))
> +		return -ENOPARAM;
> +
> +	dev->huge_mnt =3D fc_mount_longterm(fc);
> +	put_fs_context(fc);
> +
> +	return drmm_add_action_or_reset(dev, drm_gem_huge_mnt_free, NULL);
> +}
> +EXPORT_SYMBOL_GPL(drm_gem_huge_mnt_create);
> +#endif
> +
>  static void
>  drm_gem_init_release(struct drm_device *dev, void *ptr)
>  {
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 5af49c5c3778..7dc560ad14fc 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -3,6 +3,9 @@
> =20
>  #include <linux/list.h>
>  #include <linux/kref.h>
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +#include <linux/mount.h>
> +#endif
>  #include <linux/mutex.h>
>  #include <linux/idr.h>
>  #include <linux/sched.h>
> @@ -168,6 +171,18 @@ struct drm_device {
>  	 */
>  	struct drm_master *master;
> =20
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +	/**
> +	 * @huge_mnt:
> +	 *
> +	 * Huge tmpfs mountpoint used at GEM object initialization
> +	 * drm_gem_object_init(). Drivers can call drm_gem_huge_mnt_create() to
> +	 * create a huge tmfps mountpoint. The default tmpfs mountpoint
> +	 * (`shm_mnt`) is used if NULL.
> +	 */
> +	struct vfsmount *huge_mnt;
> +#endif
> +
>  	/**
>  	 * @driver_features: per-device driver features
>  	 *
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 7c8bd67d087c..4e9ab5d294ac 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -40,6 +40,9 @@
>  #include <linux/list.h>
>  #include <linux/mutex.h>
> =20
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +#include <drm/drm_device.h>
> +#endif
>  #include <drm/drm_vma_manager.h>
> =20
>  struct iosys_map;
> @@ -492,6 +495,36 @@ struct drm_gem_object {
>  		DRM_GEM_FOPS,\
>  	}
> =20
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +int drm_gem_huge_mnt_create(struct drm_device *dev, const char *value);
> +#else
> +static inline int drm_gem_huge_mnt_create(struct drm_device *dev,
> +					  const char *value)
> +{
> +	return 0;
> +}
> +#endif
> +
> +/**
> + * drm_gem_get_huge_mnt - Get the huge tmpfs mountpoint used by a DRM de=
vice
> + * @dev: DRM device
> +
> + * This function gets the huge tmpfs mountpoint used by DRM device @dev.=
 A huge
> + * tmpfs mountpoint is used after a successful call to drm_gem_huge_mnt_=
create()
> + * on builds with Transparent Hugepage enabled.
> +
> + * Returns:
> + * The huge tmpfs mountpoint in use, NULL otherwise.
> + */
> +static inline struct vfsmount *drm_gem_get_huge_mnt(struct drm_device *d=
ev)
> +{
> +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> +	return dev->huge_mnt;
> +#else
> +	return NULL;
> +#endif
> +}
> +
>  void drm_gem_object_release(struct drm_gem_object *obj);
>  void drm_gem_object_free(struct kref *kref);
>  int drm_gem_object_init(struct drm_device *dev,

