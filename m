Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 79C7E7D048
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Jun 2018 12:58:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751780AbeFAM60 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Jun 2018 08:58:26 -0400
Received: from mail-wr0-f193.google.com ([209.85.128.193]:41885 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751769AbeFAM6V (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Jun 2018 08:58:21 -0400
Received: by mail-wr0-f193.google.com with SMTP id u12-v6so36234750wrn.8;
        Fri, 01 Jun 2018 05:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Gad9OkjCENXhyPvGOdWHa9TNGC4Q7NZ5nQmytmCsRn0=;
        b=PdsmMVNIH5Y3+c3u5Fk4FIDIsVCw6wlKyDvQZ+B1aNqPs1V/MkTvUmXcOYdwgFtc2u
         guH1a3xFgSlP4EfnYpAWDi72VFGtzAj1JZeuiRERhord6nACI5JBuE27Ua1uwwaZEbxa
         5k9N1hZ6cyFBWvv/Eq5W3CUk7dAP9io3H3LeBtjen1e7+rXLLi6aLZjeVSeKfDwfTmB3
         iFtx3zKtjgoC0HKRmppUxgZPJ4C36xNa8nkV7ICo2k1zmNSOiSsBR5XaQH5PSkGT/3sz
         tj1gOJaP7GTZgfg1FNArEoMHJpttoeud3pebfrvHwIp0tif70CimdbfSesQVy2mIQSPj
         RROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Gad9OkjCENXhyPvGOdWHa9TNGC4Q7NZ5nQmytmCsRn0=;
        b=qo9MgsEWlEVVzvgrt3saeUZzs//I650/w+cmZvmsytYgZNv86c5C/BytNCxMg4Hzfr
         /eArOXTydrvFUkJf+T/RxJoU9cAjUXuIUwvTRWzkID/2JdCd/sC6nShAChqjVzbhJ2z0
         i5+NeYWbHBTiFaRaUYUY8/T4xIEtb7cZfmVstm7whcU67Fr8hDTX0BT/B/Zdud4Vyjgt
         HW7dlLX2uRVNCrG8w04kAck/YsyiqURsWD90gsMoj/R2zKa0NkCJf6BpxWjZUE0x53ZW
         8Ks16qRYsTwq+XrAOrb0iXLv2rwCQpEKH+fH1Bt86jig3XCcLPUNo/9sUN177e9iCsAv
         1tkQ==
X-Gm-Message-State: ALKqPwexxddeD9nLUXKNCUbJ5RSsUhHGH0K+w7kbUAvlpcq7ZhqwvLT3
        hlUQ6ERwDq6SGCnMskNP5xooHT/a18Uj1XQvlS0=
X-Google-Smtp-Source: ADUXVKLSUbnZ/EIa3S9LdarfdFb/oEiHNPyUI2LpEHh52PRxGru8jFlJplPMb8hM78yeUW+8aSBiPFwKy26SkBRLzRI=
X-Received: by 2002:adf:90a3:: with SMTP id i32-v6mr8434851wri.78.1527857900116;
 Fri, 01 Jun 2018 05:58:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:dd4f:0:0:0:0:0 with HTTP; Fri, 1 Jun 2018 05:58:19 -0700 (PDT)
In-Reply-To: <20180531161708.5894-3-michel@daenzer.net>
References: <20180531161708.5894-1-michel@daenzer.net> <20180531161708.5894-3-michel@daenzer.net>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Fri, 1 Jun 2018 08:58:19 -0400
Message-ID: <CADnq5_O5-m_=xqszq41eOAVaLTytHUHmtDaSc1MeEorZML6T5g@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: Add documentation for PRIME related code
To:     =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
Cc:     amd-gfx list <amd-gfx@lists.freedesktop.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 31, 2018 at 12:17 PM, Michel D=C3=A4nzer <michel@daenzer.net> w=
rote:
> From: Michel D=C3=A4nzer <michel.daenzer@amd.com>
>
> Signed-off-by: Michel D=C3=A4nzer <michel.daenzer@amd.com>

Series is:
Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  Documentation/gpu/amdgpu.rst              |  14 +++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c | 119 ++++++++++++++++++++++
>  2 files changed, 133 insertions(+)
>
> diff --git a/Documentation/gpu/amdgpu.rst b/Documentation/gpu/amdgpu.rst
> index 41a14e4aa4ac..f557866f6788 100644
> --- a/Documentation/gpu/amdgpu.rst
> +++ b/Documentation/gpu/amdgpu.rst
> @@ -4,3 +4,17 @@
>
>  The drm/amdgpu driver supports all AMD Radeon GPUs based on the Graphics=
 Core
>  Next (GCN) architecture.
> +
> +Core Driver Infrastructure
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +This section covers core driver infrastructure.
> +
> +PRIME Buffer Sharing
> +--------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c
> +   :doc: PRIME Buffer Sharing
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c
> +   :internal:
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_prime.c
> index 4683626b065f..d1f05489595b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c
> @@ -23,6 +23,14 @@
>   *
>   * Authors: Alex Deucher
>   */
> +
> +/**
> + * DOC: PRIME Buffer Sharing
> + *
> + * The following callback implementations are used for :ref:`sharing GEM=
 buffer
> + * objects between different devices via PRIME <prime_buffer_sharing>`.
> + */
> +
>  #include <drm/drmP.h>
>
>  #include "amdgpu.h"
> @@ -32,6 +40,14 @@
>
>  static const struct dma_buf_ops amdgpu_dmabuf_ops;
>
> +/**
> + * amdgpu_gem_prime_get_sg_table - &drm_driver.gem_prime_get_sg_table
> + * implementation
> + * @obj: GEM buffer object
> + *
> + * Returns:
> + * A scatter/gather table for the pinned pages of the buffer object's me=
mory.
> + */
>  struct sg_table *amdgpu_gem_prime_get_sg_table(struct drm_gem_object *ob=
j)
>  {
>         struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
> @@ -40,6 +56,15 @@ struct sg_table *amdgpu_gem_prime_get_sg_table(struct =
drm_gem_object *obj)
>         return drm_prime_pages_to_sg(bo->tbo.ttm->pages, npages);
>  }
>
> +/**
> + * amdgpu_gem_prime_vmap - &dma_buf_ops.vmap implementation
> + * @obj: GEM buffer object
> + *
> + * Sets up an in-kernel virtual mapping of the buffer object's memory.
> + *
> + * Returns:
> + * The virtual address of the mapping or an error pointer.
> + */
>  void *amdgpu_gem_prime_vmap(struct drm_gem_object *obj)
>  {
>         struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
> @@ -53,6 +78,13 @@ void *amdgpu_gem_prime_vmap(struct drm_gem_object *obj=
)
>         return bo->dma_buf_vmap.virtual;
>  }
>
> +/**
> + * amdgpu_gem_prime_vunmap - &dma_buf_ops.vunmap implementation
> + * @obj: GEM buffer object
> + * @vaddr: virtual address (unused)
> + *
> + * Tears down the in-kernel virtual mapping of the buffer object's memor=
y.
> + */
>  void amdgpu_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
>  {
>         struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
> @@ -60,6 +92,17 @@ void amdgpu_gem_prime_vunmap(struct drm_gem_object *ob=
j, void *vaddr)
>         ttm_bo_kunmap(&bo->dma_buf_vmap);
>  }
>
> +/**
> + * amdgpu_gem_prime_mmap - &drm_driver.gem_prime_mmap implementation
> + * @obj: GEM buffer object
> + * @vma: virtual memory area
> + *
> + * Sets up a userspace mapping of the buffer object's memory in the give=
n
> + * virtual memory area.
> + *
> + * Returns:
> + * 0 on success or negative error code.
> + */
>  int amdgpu_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_str=
uct *vma)
>  {
>         struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
> @@ -94,6 +137,19 @@ int amdgpu_gem_prime_mmap(struct drm_gem_object *obj,=
 struct vm_area_struct *vma
>         return ret;
>  }
>
> +/**
> + * amdgpu_gem_prime_import_sg_table - &drm_driver.gem_prime_import_sg_ta=
ble
> + * implementation
> + * @dev: DRM device
> + * @attach: DMA-buf attachment
> + * @sg: Scatter/gather table
> + *
> + * Import shared DMA buffer memory exported by another device.
> + *
> + * Returns:
> + * A new GEM buffer object of the given DRM device, representing the mem=
ory
> + * described by the given DMA-buf attachment and scatter/gather table.
> + */
>  struct drm_gem_object *
>  amdgpu_gem_prime_import_sg_table(struct drm_device *dev,
>                                  struct dma_buf_attachment *attach,
> @@ -132,6 +188,19 @@ amdgpu_gem_prime_import_sg_table(struct drm_device *=
dev,
>         return ERR_PTR(ret);
>  }
>
> +/**
> + * amdgpu_gem_map_attach - &dma_buf_ops.attach implementation
> + * @dma_buf: shared DMA buffer
> + * @target_dev: target device
> + * @attach: DMA-buf attachment
> + *
> + * Makes sure that the shared DMA buffer can be accessed by the target d=
evice.
> + * For now, simply pins it to the GTT domain, where it should be accessi=
ble by
> + * all DMA devices.
> + *
> + * Returns:
> + * 0 on success or negative error code.
> + */
>  static int amdgpu_gem_map_attach(struct dma_buf *dma_buf,
>                                  struct device *target_dev,
>                                  struct dma_buf_attachment *attach)
> @@ -181,6 +250,14 @@ static int amdgpu_gem_map_attach(struct dma_buf *dma=
_buf,
>         return r;
>  }
>
> +/**
> + * amdgpu_gem_map_detach - &dma_buf_ops.detach implementation
> + * @dma_buf: shared DMA buffer
> + * @attach: DMA-buf attachment
> + *
> + * This is called when a shared DMA buffer no longer needs to be accessi=
ble by
> + * the other device. For now, simply unpins the buffer from GTT.
> + */
>  static void amdgpu_gem_map_detach(struct dma_buf *dma_buf,
>                                   struct dma_buf_attachment *attach)
>  {
> @@ -202,6 +279,13 @@ static void amdgpu_gem_map_detach(struct dma_buf *dm=
a_buf,
>         drm_gem_map_detach(dma_buf, attach);
>  }
>
> +/**
> + * amdgpu_gem_prime_res_obj - &drm_driver.gem_prime_res_obj implementati=
on
> + * @obj: GEM buffer object
> + *
> + * Returns:
> + * The buffer object's reservation object.
> + */
>  struct reservation_object *amdgpu_gem_prime_res_obj(struct drm_gem_objec=
t *obj)
>  {
>         struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
> @@ -209,6 +293,18 @@ struct reservation_object *amdgpu_gem_prime_res_obj(=
struct drm_gem_object *obj)
>         return bo->tbo.resv;
>  }
>
> +/**
> + * amdgpu_gem_begin_cpu_access - &dma_buf_ops.begin_cpu_access implement=
ation
> + * @dma_buf: shared DMA buffer
> + * @direction: direction of DMA transfer
> + *
> + * This is called before CPU access to the shared DMA buffer's memory. I=
f it's
> + * a read access, the buffer is moved to the GTT domain if possible, for=
 optimal
> + * CPU read performance.
> + *
> + * Returns:
> + * 0 on success or negative error code.
> + */
>  static int amdgpu_gem_begin_cpu_access(struct dma_buf *dma_buf,
>                                        enum dma_data_direction direction)
>  {
> @@ -253,6 +349,18 @@ static const struct dma_buf_ops amdgpu_dmabuf_ops =
=3D {
>         .vunmap =3D drm_gem_dmabuf_vunmap,
>  };
>
> +/**
> + * amdgpu_gem_prime_export - &drm_driver.gem_prime_export implementation
> + * @dev: DRM device
> + * @gobj: GEM buffer object
> + * @flags: flags like DRM_CLOEXEC and DRM_RDWR
> + *
> + * The main work is done by the &drm_gem_prime_export helper, which in t=
urn
> + * uses &amdgpu_gem_prime_res_obj.
> + *
> + * Returns:
> + * Shared DMA buffer representing the GEM buffer object from the given d=
evice.
> + */
>  struct dma_buf *amdgpu_gem_prime_export(struct drm_device *dev,
>                                         struct drm_gem_object *gobj,
>                                         int flags)
> @@ -273,6 +381,17 @@ struct dma_buf *amdgpu_gem_prime_export(struct drm_d=
evice *dev,
>         return buf;
>  }
>
> +/**
> + * amdgpu_gem_prime_import - &drm_driver.gem_prime_import implementation
> + * @dev: DRM device
> + * @dma_buf: Shared DMA buffer
> + *
> + * The main work is done by the &drm_gem_prime_import helper, which in t=
urn
> + * uses &amdgpu_gem_prime_import_sg_table.
> + *
> + * Returns:
> + * GEM buffer object representing the shared DMA buffer for the given de=
vice.
> + */
>  struct drm_gem_object *amdgpu_gem_prime_import(struct drm_device *dev,
>                                             struct dma_buf *dma_buf)
>  {
> --
> 2.17.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
