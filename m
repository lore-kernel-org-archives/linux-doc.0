Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7E71CD15
	for <linux-doc@vger.kernel.org>; Wed, 28 Feb 2024 05:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709099900; cv=none; b=Z4YxBUSwRFD3iBTB0ESqBh5kMxWiXsAXNVC/iYIHj9pn9YnRO1Him3wuZZJvQYrAUZyrDj1k0wCSoImkVFBt4Vyb5nustEqhisMmRR4fNVMAAUH6+5MEjjYSjeLWJ1KrroCyyp8ozTcXCBl+cuHirU5+VtsV3xEzdtbynbRgo58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709099900; c=relaxed/simple;
	bh=ee7Vp1TB+Ew1LAT2T+j7SXT+wKOj71PUtQg1CudCgYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lCY691Jsy5bwlD6D/+FlyaRhLgC7tdUyd+4+RT1VoTVgjMQMZ4wYxLRAPN1aTq01CmRNh0msnQqPnk7P8ZWW1kCwyqfGMafnB6djcGN4KEodsB+I+w8j/LA7f1qFVpZuW9OJN1Q2KBTOkjk28z5CKHoeJBuGR95+mcHvkEfMdgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xG/frEBl; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xG/frEBl"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7dadba3284cso183725241.2
        for <linux-doc@vger.kernel.org>; Tue, 27 Feb 2024 21:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709099897; x=1709704697; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGe9lOncSq556xqf1ibLSzm0UZ/qDNnkGKZZwN7/jGk=;
        b=xG/frEBlyXVMSa+LRcZzBqhdiAz4kz4VQhfiFEwt30WFSnnRFSESqLgiudN+IL6EDG
         N4Xl5XfCifEblLCTEZEKF32e9QlMzdkEnGLeFO9J/Eljm/WKbcCN/knwRlX7D8YP+5u5
         RxLj4Ud18ZTvyRnHXhX07DNY7i1tnTcadO6HZ2xoYE5G+r+fIMdOwNoBEzkZv5y9yDN3
         lkg/5qI6MBgf36TDPevV7WaW/BYio3ZVF2D4NWFky71wXfsxsCFp4/FHO64+MyC7CbND
         +kDcurbKdsaNkLpGCxUcNoo5kMdRgc7w+1R42EcBNJJWhKvEU8yE4WUcN99LFbYwQ7lr
         1+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709099897; x=1709704697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGe9lOncSq556xqf1ibLSzm0UZ/qDNnkGKZZwN7/jGk=;
        b=b5TqJ+f5W6V0O1/Sg22w/5SlbXeU2tUtB7K9FOabEqyFbIanhm5YcMN7W7D2indvXi
         /uH4QhjVR1kjfykS6Sxyiosg/I7HHL93U0W0ylypM8ac4OZ2RG/oY5sSR0FW75j8w7PW
         z10vsODcMKz57pvUu/tEZbaQte7glglkNKOKwGrqj+QZBFhRMjruxR2CeImzHDqZgid4
         fxJ2iyxKtf3yw5B/dQFIIWlKZmj9231iNalTntidhDaP/kJl0kSU/L3hR6PzF84mryjC
         1n1Ew+Kx66P3iTlG95Or8L5bYIsiS9lWOokCVPEbtnOpl8L5OHmp0HoAM6DA7t8QhLG1
         IQ5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWqrTy4zwfx5hCrVlBTKpJGRe/GKa0Z4WS5vmm8MeD1wHm9nZ1aOGZsTX1voSKZwvuujh/cVPJHJUkjCxKtjIG6yG+r4gAXELc0
X-Gm-Message-State: AOJu0Yx/08Y4xTSmAxPk325sInRXFxnY9OlEF0/WQHv6lyvuy3JZGScU
	mdmUJ0uDRD6krFNActqky7MYTw0PVSfBMrg0UeqgDUM9xTHub4jS4SZIyxgXHb6sCNLsJqD5kyo
	Dhot9CMROSgTZl7yhaMg/0RzfSso0rpbmmP5rUw==
X-Google-Smtp-Source: AGHT+IE0yPOh6qHRst0Gdv6eWVbDYZtYCCHqx6ykderKyu7T+A7lr0EINgN8KyyqukS+aiEggNnII5g/SpyQztVrOnc=
X-Received: by 2002:a05:6102:2751:b0:471:fc79:bf0d with SMTP id
 p17-20020a056102275100b00471fc79bf0dmr5589340vsu.2.1709099896756; Tue, 27 Feb
 2024 21:58:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223095133.109046-1-balint.dobszay@arm.com>
 <20240223095133.109046-2-balint.dobszay@arm.com> <CAFA6WYNW9-7gCZQSEaV=Gcr+GLdu25rQ8MpTg9yNpX7OwyZ0Tg@mail.gmail.com>
 <CAHUa44G70L9CnQD6V3ivWf1hYfK0iWFt-cfg98-JGB-s8TVd-A@mail.gmail.com>
In-Reply-To: <CAHUa44G70L9CnQD6V3ivWf1hYfK0iWFt-cfg98-JGB-s8TVd-A@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 28 Feb 2024 11:28:05 +0530
Message-ID: <CAFA6WYOq3tHq5n7=XYpsSgBghCF0RtAxs-sLxvLYMWwnQuFSeQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] tee: optee: Move pool_op helper functions
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Balint Dobszay <balint.dobszay@arm.com>, op-tee@lists.trustedfirmware.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, corbet@lwn.net, sudeep.holla@arm.com, 
	rdunlap@infradead.org, krzk@kernel.org, gyorgy.szing@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 27 Feb 2024 at 21:20, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
>
> On Tue, Feb 27, 2024 at 7:06=E2=80=AFAM Sumit Garg <sumit.garg@linaro.org=
> wrote:
> >
> > Hi Balint,
> >
> > On Fri, 23 Feb 2024 at 15:22, Balint Dobszay <balint.dobszay@arm.com> w=
rote:
> > >
> > > Move the pool alloc and free helper functions from the OP-TEE driver =
to
> > > the TEE subsystem, since these could be reused in other TEE drivers.
> > > This patch is not supposed to change behavior, it's only reorganizing
> > > the code.
> > >
> > > Suggested-by: Jens Wiklander <jens.wiklander@linaro.org>
> > > Signed-off-by: Balint Dobszay <balint.dobszay@arm.com>
> > > ---
> > >  drivers/tee/optee/core.c          | 64 -----------------------------=
-
> > >  drivers/tee/optee/ffa_abi.c       |  6 +--
> > >  drivers/tee/optee/optee_private.h | 12 ------
> > >  drivers/tee/optee/smc_abi.c       | 11 +++---
> > >  drivers/tee/tee_shm.c             | 65 +++++++++++++++++++++++++++++=
++
> > >  include/linux/tee_drv.h           | 11 ++++++
> > >  6 files changed, 85 insertions(+), 84 deletions(-)
> > >
> > > diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> > > index 3aed554bc8d8..9390f21f9902 100644
> > > --- a/drivers/tee/optee/core.c
> > > +++ b/drivers/tee/optee/core.c
> > > @@ -9,7 +9,6 @@
> > >  #include <linux/crash_dump.h>
> > >  #include <linux/errno.h>
> > >  #include <linux/io.h>
> > > -#include <linux/mm.h>
> > >  #include <linux/module.h>
> > >  #include <linux/slab.h>
> > >  #include <linux/string.h>
> > > @@ -17,69 +16,6 @@
> > >  #include <linux/types.h>
> > >  #include "optee_private.h"
> > >
> > > -int optee_pool_op_alloc_helper(struct tee_shm_pool *pool, struct tee=
_shm *shm,
> > > -                              size_t size, size_t align,
> > > -                              int (*shm_register)(struct tee_context=
 *ctx,
> > > -                                                  struct tee_shm *sh=
m,
> > > -                                                  struct page **page=
s,
> > > -                                                  size_t num_pages,
> > > -                                                  unsigned long star=
t))
> > > -{
> > > -       size_t nr_pages =3D roundup(size, PAGE_SIZE) / PAGE_SIZE;
> > > -       struct page **pages;
> > > -       unsigned int i;
> > > -       int rc =3D 0;
> > > -
> > > -       /*
> > > -        * Ignore alignment since this is already going to be page al=
igned
> > > -        * and there's no need for any larger alignment.
> > > -        */
> > > -       shm->kaddr =3D alloc_pages_exact(nr_pages * PAGE_SIZE,
> > > -                                      GFP_KERNEL | __GFP_ZERO);
> > > -       if (!shm->kaddr)
> > > -               return -ENOMEM;
> > > -
> > > -       shm->paddr =3D virt_to_phys(shm->kaddr);
> > > -       shm->size =3D nr_pages * PAGE_SIZE;
> > > -
> > > -       pages =3D kcalloc(nr_pages, sizeof(*pages), GFP_KERNEL);
> > > -       if (!pages) {
> > > -               rc =3D -ENOMEM;
> > > -               goto err;
> > > -       }
> > > -
> > > -       for (i =3D 0; i < nr_pages; i++)
> > > -               pages[i] =3D virt_to_page((u8 *)shm->kaddr + i * PAGE=
_SIZE);
> > > -
> > > -       shm->pages =3D pages;
> > > -       shm->num_pages =3D nr_pages;
> > > -
> > > -       if (shm_register) {
> > > -               rc =3D shm_register(shm->ctx, shm, pages, nr_pages,
> > > -                                 (unsigned long)shm->kaddr);
> > > -               if (rc)
> > > -                       goto err;
> > > -       }
> > > -
> > > -       return 0;
> > > -err:
> > > -       free_pages_exact(shm->kaddr, shm->size);
> > > -       shm->kaddr =3D NULL;
> > > -       return rc;
> > > -}
> > > -
> > > -void optee_pool_op_free_helper(struct tee_shm_pool *pool, struct tee=
_shm *shm,
> > > -                              int (*shm_unregister)(struct tee_conte=
xt *ctx,
> > > -                                                    struct tee_shm *=
shm))
> > > -{
> > > -       if (shm_unregister)
> > > -               shm_unregister(shm->ctx, shm);
> > > -       free_pages_exact(shm->kaddr, shm->size);
> > > -       shm->kaddr =3D NULL;
> > > -       kfree(shm->pages);
> > > -       shm->pages =3D NULL;
> > > -}
> > > -
> > >  static void optee_bus_scan(struct work_struct *work)
> > >  {
> > >         WARN_ON(optee_enumerate_devices(PTA_CMD_GET_DEVICES_SUPP));
> > > diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.=
c
> > > index ecb5eb079408..ee11918a2b35 100644
> > > --- a/drivers/tee/optee/ffa_abi.c
> > > +++ b/drivers/tee/optee/ffa_abi.c
> > > @@ -374,14 +374,14 @@ static int optee_ffa_shm_unregister_supp(struct=
 tee_context *ctx,
> > >  static int pool_ffa_op_alloc(struct tee_shm_pool *pool,
> > >                              struct tee_shm *shm, size_t size, size_t=
 align)
> > >  {
> > > -       return optee_pool_op_alloc_helper(pool, shm, size, align,
> > > -                                         optee_ffa_shm_register);
> > > +       return tee_shm_pool_op_alloc_helper(pool, shm, size, align,
> > > +                                           optee_ffa_shm_register);
> > >  }
> > >
> > >  static void pool_ffa_op_free(struct tee_shm_pool *pool,
> > >                              struct tee_shm *shm)
> > >  {
> > > -       optee_pool_op_free_helper(pool, shm, optee_ffa_shm_unregister=
);
> > > +       tee_shm_pool_op_free_helper(pool, shm, optee_ffa_shm_unregist=
er);
> > >  }
> > >
> > >  static void pool_ffa_op_destroy_pool(struct tee_shm_pool *pool)
> > > diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/op=
tee_private.h
> > > index 7a5243c78b55..a153285a1919 100644
> > > --- a/drivers/tee/optee/optee_private.h
> > > +++ b/drivers/tee/optee/optee_private.h
> > > @@ -283,18 +283,6 @@ int optee_cancel_req(struct tee_context *ctx, u3=
2 cancel_id, u32 session);
> > >  int optee_enumerate_devices(u32 func);
> > >  void optee_unregister_devices(void);
> > >
> > > -int optee_pool_op_alloc_helper(struct tee_shm_pool *pool, struct tee=
_shm *shm,
> > > -                              size_t size, size_t align,
> > > -                              int (*shm_register)(struct tee_context=
 *ctx,
> > > -                                                  struct tee_shm *sh=
m,
> > > -                                                  struct page **page=
s,
> > > -                                                  size_t num_pages,
> > > -                                                  unsigned long star=
t));
> > > -void optee_pool_op_free_helper(struct tee_shm_pool *pool, struct tee=
_shm *shm,
> > > -                              int (*shm_unregister)(struct tee_conte=
xt *ctx,
> > > -                                                    struct tee_shm *=
shm));
> > > -
> > > -
> > >  void optee_remove_common(struct optee *optee);
> > >  int optee_open(struct tee_context *ctx, bool cap_memref_null);
> > >  void optee_release(struct tee_context *ctx);
> > > diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.=
c
> > > index a37f87087e5c..b0c616b6870d 100644
> > > --- a/drivers/tee/optee/smc_abi.c
> > > +++ b/drivers/tee/optee/smc_abi.c
> > > @@ -592,19 +592,20 @@ static int pool_op_alloc(struct tee_shm_pool *p=
ool,
> > >          * to be registered with OP-TEE.
> > >          */
> > >         if (shm->flags & TEE_SHM_PRIV)
> > > -               return optee_pool_op_alloc_helper(pool, shm, size, al=
ign, NULL);
> > > +               return tee_shm_pool_op_alloc_helper(pool, shm, size, =
align,
> > > +                                                   NULL);
> > >
> > > -       return optee_pool_op_alloc_helper(pool, shm, size, align,
> > > -                                         optee_shm_register);
> > > +       return tee_shm_pool_op_alloc_helper(pool, shm, size, align,
> > > +                                           optee_shm_register);
> > >  }
> > >
> > >  static void pool_op_free(struct tee_shm_pool *pool,
> > >                          struct tee_shm *shm)
> > >  {
> > >         if (!(shm->flags & TEE_SHM_PRIV))
> > > -               optee_pool_op_free_helper(pool, shm, optee_shm_unregi=
ster);
> > > +               tee_shm_pool_op_free_helper(pool, shm, optee_shm_unre=
gister);
> > >         else
> > > -               optee_pool_op_free_helper(pool, shm, NULL);
> > > +               tee_shm_pool_op_free_helper(pool, shm, NULL);
> > >  }
> > >T
> > >  static void pool_op_destroy_pool(struct tee_shm_pool *pool)
> > > diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> > > index 731d9028b67f..641aad92ffe2 100644
> > > --- a/drivers/tee/tee_shm.c
> > > +++ b/drivers/tee/tee_shm.c
> > > @@ -202,6 +202,71 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct te=
e_context *ctx, size_t size)
> > >  }
> > >  EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
> > >
> > > +int tee_shm_pool_op_alloc_helper(struct tee_shm_pool *pool, struct t=
ee_shm *shm,
> >
> > I don't see the first argument (struct tee_shm_pool *pool) being used,
> > so drop that. Also, we can just rename it as
> > tee_dyn_shm_alloc_helper().
> >
> > > +                                size_t size, size_t align,
> > > +                                int (*shm_register)(struct tee_conte=
xt *ctx,
> > > +                                                    struct tee_shm *=
shm,
> > > +                                                    struct page **pa=
ges,
> > > +                                                    size_t num_pages=
,
> > > +                                                    unsigned long st=
art))
> > > +{
> > > +       size_t nr_pages =3D roundup(size, PAGE_SIZE) / PAGE_SIZE;
> > > +       struct page **pages;
> > > +       unsigned int i;
> > > +       int rc =3D 0;
> > > +
> > > +       /*
> > > +        * Ignore alignment since this is already going to be page al=
igned
> > > +        * and there's no need for any larger alignment.
> > > +        */
> > > +       shm->kaddr =3D alloc_pages_exact(nr_pages * PAGE_SIZE,
> > > +                                      GFP_KERNEL | __GFP_ZERO);
> > > +       if (!shm->kaddr)
> > > +               return -ENOMEM;
> > > +
> > > +       shm->paddr =3D virt_to_phys(shm->kaddr);
> > > +       shm->size =3D nr_pages * PAGE_SIZE;
> > > +
> > > +       pages =3D kcalloc(nr_pages, sizeof(*pages), GFP_KERNEL);
> > > +       if (!pages) {
> > > +               rc =3D -ENOMEM;
> > > +               goto err;
> > > +       }
> > > +
> > > +       for (i =3D 0; i < nr_pages; i++)
> > > +               pages[i] =3D virt_to_page((u8 *)shm->kaddr + i * PAGE=
_SIZE);
> > > +
> > > +       shm->pages =3D pages;
> > > +       shm->num_pages =3D nr_pages;
> > > +
> > > +       if (shm_register) {
> > > +               rc =3D shm_register(shm->ctx, shm, pages, nr_pages,
> > > +                                 (unsigned long)shm->kaddr);
> > > +               if (rc)
> > > +                       goto err;
> > > +       }
> > > +
> > > +       return 0;
> > > +err:
> > > +       free_pages_exact(shm->kaddr, shm->size);
> > > +       shm->kaddr =3D NULL;
> > > +       return rc;
> > > +}
> > > +EXPORT_SYMBOL_GPL(tee_shm_pool_op_alloc_helper);
> > > +
> > > +void tee_shm_pool_op_free_helper(struct tee_shm_pool *pool, struct t=
ee_shm *shm,
> >
> > Ditto tee_shm_pool_op_free_helper() -> tee_dyn_shm_free_helper()
> >
> > > +                                int (*shm_unregister)(struct tee_con=
text *ctx,
> > > +                                                      struct tee_shm=
 *shm))
> > > +{
> > > +       if (shm_unregister)
> > > +               shm_unregister(shm->ctx, shm);
> > > +       free_pages_exact(shm->kaddr, shm->size);
> > > +       shm->kaddr =3D NULL;
> > > +       kfree(shm->pages);
> > > +       shm->pages =3D NULL;
> > > +}
> > > +EXPORT_SYMBOL_GPL(tee_shm_pool_op_free_helper);
> > > +
> > >  static struct tee_shm *
> > >  register_shm_helper(struct tee_context *ctx, struct iov_iter *iter, =
u32 flags,
> > >                     int id)
> > > diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
> > > index 911ddf92dcee..4cf402424e71 100644
> > > --- a/include/linux/tee_drv.h
> > > +++ b/include/linux/tee_drv.h
> > > @@ -275,6 +275,17 @@ void *tee_get_drvdata(struct tee_device *teedev)=
;
> > >  struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size=
_t size);
> > >  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, si=
ze_t size);
> > >
> > > +int tee_shm_pool_op_alloc_helper(struct tee_shm_pool *pool, struct t=
ee_shm *shm,
> > > +                                size_t size, size_t align,
> > > +                                int (*shm_register)(struct tee_conte=
xt *ctx,
> > > +                                                    struct tee_shm *=
shm,
> > > +                                                    struct page **pa=
ges,
> > > +                                                    size_t num_pages=
,
> > > +                                                    unsigned long st=
art));
> > > +void tee_shm_pool_op_free_helper(struct tee_shm_pool *pool, struct t=
ee_shm *shm,
> > > +                                int (*shm_unregister)(struct tee_con=
text *ctx,
> > > +                                                      struct tee_shm=
 *shm));
> > > +
> >
> > These rather belong to drivers/tee/tee_private.h as we shouldn't
> > expose them to other kernel client drivers.
>
> This is the right place, this .h file is for TEE drivers too.
>

But this is shared with other kernel TEE client drivers and we
shouldn't expose internal APIs which aren't meant for them with a side
effect of API abuse too. Any particular reason to not use
drivers/tee/tee_private.h?

-Sumit

> Cheers,
> Jens
>
> >
> > -Sumit
> >
> > >  struct tee_shm *tee_shm_register_kernel_buf(struct tee_context *ctx,
> > >                                             void *addr, size_t length=
);
> > >
> > > --
> > > 2.34.1
> > >
