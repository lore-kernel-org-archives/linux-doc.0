Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB661096F;
	Wed, 26 Nov 2025 10:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764151853; cv=none; b=uRUhsndIOdB5rNGCu5tRKy3hPYaV0gMZRBQ2IC3bTUvZTEPXkNcodEfXDdoyaTI1YbLda70z5IEG8rkjJmytI1SudvAyDcaQOWqIursfodhDNn4o6sPnsJWPaIRhHY7Ijo3RG8ZBk4vo4AKE1YDLcPO0iOs+hrKQZjq/iJZwwu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764151853; c=relaxed/simple;
	bh=ecJ1vGlyPj6hsCofjHA7b6XDNSRT7xhJLj2BkLxAf6M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cZDOvyzjUabTmYkFncf04onYVq5qLUw8XBAeRwnshNv8iprq21CKChrmAR/b17rGIBwgblSM03x/OrRDMeI9JUu5nmdG+VgfIlFaNpJrZllrsPjbRyy0SmoWiqn7C3Ubbe69LpkLdVIjOOttYhABlxJnuYQB5wNLckiCnQ3YuVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BTGwNJiY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BTGwNJiY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764151849;
	bh=ecJ1vGlyPj6hsCofjHA7b6XDNSRT7xhJLj2BkLxAf6M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BTGwNJiYhH0pw6GB3bsWRZFrAfxZlQsY1XcuEL3zlNWjVHArUqmwi2Hmr9H0spuYR
	 ZZLN8ys30zhBHkvnwuv0MKYs3j2MayURZg1nfvQj5Y4SfOLRj6Pez/y7IfBn1pylM1
	 cJqj73uPzEbF1Bw70LjOzOLA1MpiTPezmO1B5FvasUQqo+0u9dm8piYmTyL/ParorP
	 Bsp8pqlHveaqQfQR8+cI2S2sRFvucsZrCuUUbiIE0g79lQfF7L74VOl3eJ0IHL+lNs
	 X2GqZWDiZ+gtHSazhxFkL8ABfWHWgkf5YvUXT39/hblLTtJvYreeuprfcmj/tGpnHI
	 /WoTfM4zP4pHA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E4EC417E10E9;
	Wed, 26 Nov 2025 11:10:47 +0100 (CET)
Date: Wed, 26 Nov 2025 11:10:43 +0100
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
Subject: Re: [PATCH v9 09/11] drm/panthor: Improve IOMMU map/unmap debugging
 logs
Message-ID: <20251126111043.145e1aa2@fedora>
In-Reply-To: <20251114170303.2800-10-loic.molinari@collabora.com>
References: <20251114170303.2800-1-loic.molinari@collabora.com>
	<20251114170303.2800-10-loic.molinari@collabora.com>
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

On Fri, 14 Nov 2025 18:03:00 +0100
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> Log the number of pages and their sizes actually mapped/unmapped by
> the IOMMU page table driver. Since a map/unmap op is often split in
> several ops depending on the underlying scatter/gather table, add the
> start address and the total size to the debugging logs in order to
> help understand which batch an op is part of.
>=20
> Signed-off-by: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

Just queued this specific patch to drm-misc-next since it had no
external deps. Make sure you rebase before preparing your v10.

> ---
>  drivers/gpu/drm/panthor/panthor_mmu.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/pant=
hor/panthor_mmu.c
> index 58fead90533a..32410713c61c 100644
> --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> @@ -918,10 +918,9 @@ static int panthor_vm_unmap_pages(struct panthor_vm =
*vm, u64 iova, u64 size)
>  {
>  	struct panthor_device *ptdev =3D vm->ptdev;
>  	struct io_pgtable_ops *ops =3D vm->pgtbl_ops;
> +	u64 start_iova =3D iova;
>  	u64 offset =3D 0;
> =20
> -	drm_dbg(&ptdev->base, "unmap: as=3D%d, iova=3D%llx, len=3D%llx", vm->as=
.id, iova, size);
> -
>  	while (offset < size) {
>  		size_t unmapped_sz =3D 0, pgcount;
>  		size_t pgsize =3D get_pgsize(iova + offset, size - offset, &pgcount);
> @@ -936,6 +935,12 @@ static int panthor_vm_unmap_pages(struct panthor_vm =
*vm, u64 iova, u64 size)
>  			panthor_vm_flush_range(vm, iova, offset + unmapped_sz);
>  			return  -EINVAL;
>  		}
> +
> +		drm_dbg(&ptdev->base,
> +			"unmap: as=3D%d, iova=3D0x%llx, sz=3D%llu, va=3D0x%llx, pgcnt=3D%zu, =
pgsz=3D%zu",
> +			vm->as.id, start_iova, size, iova + offset,
> +			unmapped_sz / pgsize, pgsize);
> +
>  		offset +=3D unmapped_sz;
>  	}
> =20
> @@ -951,6 +956,7 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64 iova,=
 int prot,
>  	struct scatterlist *sgl;
>  	struct io_pgtable_ops *ops =3D vm->pgtbl_ops;
>  	u64 start_iova =3D iova;
> +	u64 start_size =3D size;
>  	int ret;
> =20
>  	if (!size)
> @@ -970,15 +976,18 @@ panthor_vm_map_pages(struct panthor_vm *vm, u64 iov=
a, int prot,
>  		len =3D min_t(size_t, len, size);
>  		size -=3D len;
> =20
> -		drm_dbg(&ptdev->base, "map: as=3D%d, iova=3D%llx, paddr=3D%pad, len=3D=
%zx",
> -			vm->as.id, iova, &paddr, len);
> -
>  		while (len) {
>  			size_t pgcount, mapped =3D 0;
>  			size_t pgsize =3D get_pgsize(iova | paddr, len, &pgcount);
> =20
>  			ret =3D ops->map_pages(ops, iova, paddr, pgsize, pgcount, prot,
>  					     GFP_KERNEL, &mapped);
> +
> +			drm_dbg(&ptdev->base,
> +				"map: as=3D%d, iova=3D0x%llx, sz=3D%llu, va=3D0x%llx, pa=3D%pad, pgc=
nt=3D%zu, pgsz=3D%zu",
> +				vm->as.id, start_iova, start_size, iova, &paddr,
> +				mapped / pgsize, pgsize);
> +
>  			iova +=3D mapped;
>  			paddr +=3D mapped;
>  			len -=3D mapped;

