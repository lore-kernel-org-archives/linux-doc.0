Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552B82D2486;
	Fri, 14 Nov 2025 17:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763140550; cv=none; b=jPZfNQc+P5Ypwy3cvZwfxb/ZqhVOLXsrVUKE9tHm9aBKYXYLc4I121tcF8d1E6gRghQRgxP60OfV7lFBN3l/UJXqhMk5sMROIaNE6eD4CluCDuczUq/hev2/lTOl+8PVA4b0R9yET7sTjbZWyV2Q+Ahp3JQR4fSssxJfLuxj3Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763140550; c=relaxed/simple;
	bh=ID+wxlGDegTSQQqO+tfv+j3F//xuzjuJ6+40mXVWHgY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sWFYz7epZfmQTQrDt/ygRjq+a3WXA/xRr+hum04AjJr6MI/Bp7ql45UHG1h+jPaDi2QzVJF5f2KQLA5BhnRoaEXD38lv6yqZtyP0VCdxHX9OfvFQw8JC/VrXiv3Bio2YzpFAQPYmiaCvz4TVn5MDsMYe0t+54f9St1FzgVMRXi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nU+iuGAT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nU+iuGAT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1763140546;
	bh=ID+wxlGDegTSQQqO+tfv+j3F//xuzjuJ6+40mXVWHgY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=nU+iuGATE0QjIxjGhzFYT6AUXWPCOhQdAJu/0W8EeKONVvx28VL4l3LWvT8ti+wnq
	 +xbEFjKI3wOXVR0b2FApQZpSaFWkNXCU7xXgw3rWQjBQzC1kj8yel2Tcrq4+ZhXBaK
	 uXB/FJPJC8jm5qEJo3pfFqZeRF1n4JxVzKCOBMj+QLff+2m4l/SH5OOUtWHMCXbnof
	 CLpAdSxKiln4mzIs+3D25R2MEZzE1f5fI//kmoSMdvmcWKx91cfbmxr/Rd8tsMY58x
	 TjHf1gQEWa/3TIK3bfNMqykgd6dcCBsivQWynhnjFE+pQmiAY32ASryZdqairHzF54
	 OSmSAnXo9ArXg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5EB6C17E12D5;
	Fri, 14 Nov 2025 18:15:45 +0100 (CET)
Date: Fri, 14 Nov 2025 18:15:40 +0100
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
Subject: Re: [PATCH v9 07/11] drm/gem: Get rid of *_with_mnt helpers
Message-ID: <20251114181540.102789b1@fedora>
In-Reply-To: <20251114170303.2800-8-loic.molinari@collabora.com>
References: <20251114170303.2800-1-loic.molinari@collabora.com>
	<20251114170303.2800-8-loic.molinari@collabora.com>
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

On Fri, 14 Nov 2025 18:02:58 +0100
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
> index 211578abf9b6..c4316b768b3d 100644
> --- a/drivers/gpu/drm/v3d/v3d_bo.c
> +++ b/drivers/gpu/drm/v3d/v3d_bo.c
> @@ -153,12 +153,7 @@ struct v3d_bo *v3d_bo_create(struct drm_device *dev,=
 struct drm_file *file_priv,
>  	struct v3d_bo *bo;
>  	int ret;
> =20
> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -	shmem_obj =3D drm_gem_shmem_create_with_mnt(dev, unaligned_size,
> -						  dev->huge_mnt);
> -#else
>  	shmem_obj =3D drm_gem_shmem_create(dev, unaligned_size);
> -#endif

Hm, okay, the thing I complained about in patch 6 is dropped here. If
there's nothing else to address, don't bother sending a new version
just for that.

>  	if (IS_ERR(shmem_obj))
>  		return ERR_CAST(shmem_obj);
>  	bo =3D to_v3d_bo(&shmem_obj->base);
