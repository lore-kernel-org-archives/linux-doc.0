Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9BC4A5EB5
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551009; cv=pass; b=OAS2BqNOqVaOrqmZC1FK4BNV402nAAE5bcJp7Bo+TjBgYE1PbRy14ONu9wpTtdkzCO1/ynDipdvg/Gh8bkwdhMl97syLeUPkMAk946l0ZawHY8B0Xzx22SiBJxtYsRpnRURNclb+Byo/KI6eWvVHTp+LuiMRkd51k7wmC7OaaG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551009; c=relaxed/simple;
	bh=rVlNPjI4P2z37o7qE9/JXBSWEwGmZChcHXGnM7D9n6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V2bv7LekPaXR4/J5gblLwMbalaH6TZiVmhP/HamfnB6JtA2KCxqU4Rq10bohNINCVWLyaKJsR2BdWUQ7nuNfY9VOLXL3PV5NwDXv0Itz5UHPyTH6dy/peruFqg3qxmKwK+qHVmWnVqzBvr/7QWpb8urmlp6Aaz+1b7SOJcA0sTA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YCaIdDCy; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=WRnBBIGW; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YCaIdDCy";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="WRnBBIGW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789550997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pLJ3zniryXoIXYXj2kORk+UpoeKS9R6ImYDJyVbdKgw=;
	b=YCaIdDCyoE93yZmBAfESVoajo49TPwa7hyUImgklXjgAUauE0Chzl86f50GNoG1YHkECbX
	uKOo7D/Pns4ekjXFNcSGeDA73JAlN9XoMn0nntR3B7692bbvQVsqyPCtGxslQ+DCgKEJnz
	UEYk9QAiKvMY6GLKrQa4HtfSFvVHLhs=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-sph19JNGNoCieqQzDTlnmw-1; Wed, 16 Sep 2026 05:29:56 -0400
X-MC-Unique: sph19JNGNoCieqQzDTlnmw-1
X-Mimecast-MFC-AGG-ID: sph19JNGNoCieqQzDTlnmw_1789550995
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2db22383e8fso28716285ad.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 02:29:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789550995; cv=none;
        d=google.com; s=arc-20260327;
        b=GEXopOZiay85NO3yBnBso1dQylpg6BOA1XxoYIvHCz0egoyBXqjqLL7CALzf5ZNniz
         d8NpziviWbtB8CCicVYkejr/sPzJnf6MBlcP6GAIJhc3aQuFMVHD0ozYzZ/U1IsQnR+T
         RtF3iQNwSqTBTIG/3IVct1wsHmpq4nKBbqPzQZu5fGfhQ6syktzvbVEQ/C+muKN0LC0W
         qJZbHaYsnK3GyhNBX9VyJtFjzdY16TL9Kcl9P6vHW1iKA3aJwv8ZTYU8uJKDUIWYDsRF
         +sXAky6ZXTf47nSaV4ptcQ14hJjQauiJoEUsVUw92VDyuwafwUGxCW9WPsuAEVZ2l9rt
         QWvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pLJ3zniryXoIXYXj2kORk+UpoeKS9R6ImYDJyVbdKgw=;
        fh=xw/DZvgkroqz7gbMIyFaQAEHY1y3NW9MUHNfa1IzRyw=;
        b=WkdJxsRe48pV5PU+97KHNZzGM+tAmKFrP+DKHiI6LGk8BpMO+Q662kJJgDvKJSVkmn
         3mRbNNpMs7l6IUfsTOigdKBw1jKMfUl0LrXZ+jaTROs06maWxlx3ave3OJgAzXCMOm9o
         NtOustRAJx1Olv+rNe+gvtesZk+vnfgK8LQAwSazvi6iCXTaY3G3/kdEOhQ/go7XeA/4
         7X1nroQhUFmB4/DrOx0WbL7JzBmRniPSKO2ZDcFKnc8MiCQznl+VGHSHD/1hw/eCdbki
         e4vwHsOqb6EB7dA7HSzNctR3BCEtF01Pf/ZePJZCJDUBNMGXWAqYNEzG3IGVUXjbJHoo
         RerQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789550995; x=1790155795; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pLJ3zniryXoIXYXj2kORk+UpoeKS9R6ImYDJyVbdKgw=;
        b=WRnBBIGWZwHMn0ZjkwESc0vAF9AHz6MKg5a+Le6ugPl2SpFowsXuhEonCafP6F+ZjS
         W0qMM4kk5aqErx/gFDyI3fCZvELr9KMvk0bjPR25BsIwqMIPUiCxlChn6VbCIGc8Hr8x
         P/l7JkuNt+enKPxChzh6cIms67RaPlFkSL/Z066e2tEsw+Uwc9bnKUAAbowsgS2leZRA
         OgzKAvyMwJprx4UXVctmV8jAdbojb3Py6EnFTTziuHf4d+aVJMrjh+5ZCUuLooOyDPkz
         pgiYOkdl6i/0sf1bBnzYeUh4vWE1OorhRxF4143F35mg7tBnNp2s1cEAK0jCLZDswaS7
         lZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550995; x=1790155795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pLJ3zniryXoIXYXj2kORk+UpoeKS9R6ImYDJyVbdKgw=;
        b=bP1yDeIblFrp1HIA93Xo/M89Zv6rltGtA20hFu9Y0UVPeaBKbuAp83tGstY/app00d
         PGjZ2jef+xYlpGHS0MmYoP6J8O6iVV7phk0r1GarMrG1kUYc7ZqIUMDCkflA8tGC495D
         KeGzpe2k3dDVDjpx3675U3zM7kCg+V2NjAzLwR+6YeGk5Zz0ilo4u09rMPwJAZE/SMyU
         BDpP4fxXOjCaP3qOU91X0mwFblaqAhpGtO8fl14LrUvIqBe7JEHXyoFrsxll/CHA6NTs
         JAjXuEp2l4mHg/RP21g+PCbiADSX5IcO9KjwSrLFpLc9/DOcDuXoAwydYXgPQy/OTDkl
         q8LQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1M+nlXwDLWOl4Fp5wj1XuGUKfDD5TqHaITRxMs1V+wS08akYmjIjob+licIRiQCwKhSthPT8yZYM=@vger.kernel.org
X-Gm-Message-State: AFuF++ksYYFMChzZNJAZg3RLNbbx9m1Fj4mlElPUToXUfGIeOfmv3CEZ
	7OVr1lsgJjN5HN/j6NRy7Q0GCJp9F3+MA2iYtC0AVEJqj0XrATT2SMAGANel4F9QPFtDafCBKwj
	X2iEAVuExPtn91rgKMJ/PkoFIjpyOGsPLEg2gTHmT4Ges1ATFkXh6BgZE1bpNxxmrHNVhQnFuOK
	4uPlm/RzBU9cO/54tUlCNYhI0icuNc90eD78zc
X-Gm-Gg: AYBFou2bxdmaZze2iPCs7TxbWssOC6O1DkMI+ZfIL9TgAIdsz9eMg6txOWm/wyWpsui
	GWDOqd1YjT/3uqh+h1PeLzZeJ/+lV7jtHjaKJ5tSrACihEejp4f/t9E4v6Y7f8lxbgQ1OLCrSmS
	rS5/ixX9ytJbYVapl2weXeOuYAVMSYi2dBureNjTwwBgdquxmtd+DcB1F2
X-Received: by 2002:a17:903:3b8f:b0:2d7:4bc8:41a4 with SMTP id d9443c01a7336-2dd8ea1cd1dmr23798715ad.10.1789550995064;
        Wed, 16 Sep 2026 02:29:55 -0700 (PDT)
X-Received: by 2002:a17:903:3b8f:b0:2d7:4bc8:41a4 with SMTP id
 d9443c01a7336-2dd8ea1cd1dmr23798155ad.10.1789550994573; Wed, 16 Sep 2026
 02:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911124540.279841-1-tzimmermann@suse.de> <20260911124540.279841-3-tzimmermann@suse.de>
In-Reply-To: <20260911124540.279841-3-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Wed, 16 Sep 2026 11:29:42 +0200
X-Gm-Features: AcwNN1VjQRR608PaSU5v9yXg9eP7o3aE9lu55JInhqrDujLUhvS3kxSMIUXF4N0
Message-ID: <CAFOAJEfWX09ZvnQvn1+SBeW4_MaSRO2JNLfoJRGYS4jXGr-09w@mail.gmail.com>
Subject: Re: [PATCH v5 02/14] drm/panic: Test address from kmap op for NULL
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: jfalempe@redhat.com, airlied@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, geert@linux-m68k.org, rdunlap@infradead.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev, 
	sashiko-reviews@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

On Fri, Sep 11, 2026 at 2:46=E2=80=AFPM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Do nothing if kmap_local_page_try_from_panic() returns NULL. This is
> not likely to hapen, as the previous page from the same memory area
> has been mapped successfully.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 23437509a694 ("drm/panic: Fix 24bit pixel crossing page boundaries=
")
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v6.18+
> ---
>  drivers/gpu/drm/drm_panic.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index ba21df4be338..d28ce8878e05 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -178,6 +178,8 @@ static void drm_panic_write_pixel24_xpage(void *vaddr=
, struct page *next_page,
>         u8 *p =3D vaddr + offset;
>
>         vaddr2 =3D kmap_local_page_try_from_panic(next_page);
> +       if (!vaddr2)
> +               return;
>
>         *p++ =3D color & 0xff;
>         color >>=3D 8;
> --
> 2.55.0
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

