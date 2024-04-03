Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9F41353E3
	for <linux-doc@vger.kernel.org>; Wed,  3 Apr 2024 09:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712137439; cv=none; b=XJIPbTrdt6FvuSBCK+b2RXjYrNRhKTE1A92vnBqihNP5qyH1OVPwsTLindfqRR4xFGXNuz0o0jf243y+RApSwSXvYUn92DjjRXiYNWC7tAOgzROAeDqQUhw/KP8ZvqevES+rmwJ1W4lN8t96pR2DPm/xQCVlo7GUTLhAYRwPbHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712137439; c=relaxed/simple;
	bh=zd3hdpIBHxtGXRlfcXv6AQeqcLTkxfmM0u8KuzZO8iA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IyWDjp1sbdQbW6pAeONNJUCbSwmha/B2DZKfxXhSUSsW/0m2vuPn/rSgzpm/o+B4pYRNCI9T1RVQLbIQsDnIyIXtKR3gpLRjpumLpaR8DMEaTcb8Di1IEKVMUo14NLg2tcjf354gzdbip7GEQnY9Iiz1mEZHq+VzETgHut6ss7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SE7VTJFk; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SE7VTJFk"
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-22a96054726so4862037fac.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Apr 2024 02:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712137436; x=1712742236; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIfzt30/DGIaEEuXFIzCipybYkXAdw+YVnGru2crRzw=;
        b=SE7VTJFkSzjImncWRrrPNpBdOHui7GeGxu8dOsUSvBsMbxbcbRahqgArnerrEEnWXh
         OsQh1ErxbAyFDL4W+qWShs+BF3FRDtodWuuob09PGiHw9GWNf89UbWROslVH9WoXL55h
         +Lq/AvDOXum2Vog50hvaFbdDx5SIWGGTFwK2QTHem3DTgp69r+45Cg9/TloaHZrtwJPU
         prOdh3hepGkRWyi41fW3gByMgCr00hfTsCux6Xf2OzjlIWB33lTY7oC9FCINXWcDFBWN
         rLRVz8Ct1vJr/c03aek4NWfPGIgHoAOHmEcN+16t+zAZ7V4CrdzDpwlEiD/ZNi8efcoh
         yCRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712137436; x=1712742236;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DIfzt30/DGIaEEuXFIzCipybYkXAdw+YVnGru2crRzw=;
        b=FzA3+igHe+UninxjPPuWf/VMobSQ6BbxaYqzDlKnHMdTDlKeP81Up6fqpQbDIlP0V/
         nRNQMltl1iJa9Mh2hg1bBTtaKd0loY9O3gYtx4tiRB9lFbCKcAweA4nI1LLwokDl6W8Y
         Nz6vu0hFJG1HBB2XU3QWAXrMagDsxzBNu1M9vkYw7hGADx7RLHV2DV7kiiewIeBRRzKu
         JzJWOjscl799ByJEdXCl+46Smv8d5S5NLZJe0mPQq0B2vJPEJzbuD6QcYPV/cPXPHC3s
         35ln0mdvKOEaJI/jHXSwBahZBNFD6tma9p/2dP4Vyse9r6vshEoh+v9/FNm7imE4lLOz
         hM7g==
X-Forwarded-Encrypted: i=1; AJvYcCX1IcysIshYKfEZ849PqB9Iny3ay5YsXOOCxGy7O8hItWafqO/WZx4MKEGZ3ugDNOvcxdKwbabiJj7xG+XYFzQyW/DWVqyTfa+V
X-Gm-Message-State: AOJu0YwtI5hiHO0CJjFe4O2iqg67Mabaw4AcvPYZ+cGXjl/2/BAA4Y9+
	q1voodYmJ6TXVOXIgDtOnTdwfAGvWRIBlvbiLnOTr508MjZL/hOentVHGI1072BcN1rmcxsafDg
	PlkPXveIPmVeLa/vsgobHj2JLRe8fadGbFWujmw==
X-Google-Smtp-Source: AGHT+IFvG0WeB2oD0twZuqMRHVHuoF89Qxd4rfbJS3NO3zzdp1UD86URQS3rH16qBpNcxQUwTSbigtzC1ELG+mQm7ac=
X-Received: by 2002:a05:6871:e70f:b0:221:793a:3b9a with SMTP id
 qa15-20020a056871e70f00b00221793a3b9amr17424336oac.40.1712137436436; Wed, 03
 Apr 2024 02:43:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325151105.135667-1-balint.dobszay@arm.com> <20240325151105.135667-3-balint.dobszay@arm.com>
In-Reply-To: <20240325151105.135667-3-balint.dobszay@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 3 Apr 2024 11:43:45 +0200
Message-ID: <CAHUa44HHikgA2R_nZw9+f6ug1nKBZgwVEYvqPgKo6dx=iijAqA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] tee: optee: Move pool_op helper functions
To: Balint Dobszay <balint.dobszay@arm.com>
Cc: op-tee@lists.trustedfirmware.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	sumit.garg@linaro.org, corbet@lwn.net, sudeep.holla@arm.com, 
	rdunlap@infradead.org, krzk@kernel.org, gyorgy.szing@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Balint,

On Mon, Mar 25, 2024 at 4:11=E2=80=AFPM Balint Dobszay <balint.dobszay@arm.=
com> wrote:
>
> Move the pool alloc and free helper functions from the OP-TEE driver to
> the TEE subsystem, since these could be reused in other TEE drivers.
> This patch is not supposed to change behavior, it's only reorganizing
> the code.
>
> Reviewed-by: Sumit Garg <sumit.garg@linaro.org>
> Suggested-by: Jens Wiklander <jens.wiklander@linaro.org>
> Signed-off-by: Balint Dobszay <balint.dobszay@arm.com>
> ---
>  drivers/tee/optee/core.c          | 64 -------------------------------
>  drivers/tee/optee/ffa_abi.c       |  6 +--
>  drivers/tee/optee/optee_private.h | 12 ------
>  drivers/tee/optee/smc_abi.c       |  9 ++---
>  drivers/tee/tee_shm.c             | 64 +++++++++++++++++++++++++++++++
>  include/linux/tee_core.h          | 10 +++++
>  6 files changed, 81 insertions(+), 84 deletions(-)

This patch fails to build on x86_64:
  CC [M]  drivers/tee/tee_shm.o
drivers/tee/tee_shm.c: In function =E2=80=98tee_dyn_shm_alloc_helper=E2=80=
=99:
linux/drivers/tee/tee_shm.c:226:22: error: implicit declaration of
function =E2=80=98virt_to_phys=E2=80=99; did you mean =E2=80=98virt_to_page=
=E2=80=99?
[-Werror=3Dimplicit-function-declaration]
  226 |         shm->paddr =3D virt_to_phys(shm->kaddr);
      |                      ^~~~~~~~~~~~
      |                      virt_to_page

It's fixed by adding
#include <linux/io.h>

I'll fix up the patch if you agree with the fix.

Cheers,
Jens

>
> diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
> index f762e3a25119..39e688d4e974 100644
> --- a/drivers/tee/optee/core.c
> +++ b/drivers/tee/optee/core.c
> @@ -9,7 +9,6 @@
>  #include <linux/crash_dump.h>
>  #include <linux/errno.h>
>  #include <linux/io.h>
> -#include <linux/mm.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> @@ -17,69 +16,6 @@
>  #include <linux/types.h>
>  #include "optee_private.h"
>
> -int optee_pool_op_alloc_helper(struct tee_shm_pool *pool, struct tee_shm=
 *shm,
> -                              size_t size, size_t align,
> -                              int (*shm_register)(struct tee_context *ct=
x,
> -                                                  struct tee_shm *shm,
> -                                                  struct page **pages,
> -                                                  size_t num_pages,
> -                                                  unsigned long start))
> -{
> -       size_t nr_pages =3D roundup(size, PAGE_SIZE) / PAGE_SIZE;
> -       struct page **pages;
> -       unsigned int i;
> -       int rc =3D 0;
> -
> -       /*
> -        * Ignore alignment since this is already going to be page aligne=
d
> -        * and there's no need for any larger alignment.
> -        */
> -       shm->kaddr =3D alloc_pages_exact(nr_pages * PAGE_SIZE,
> -                                      GFP_KERNEL | __GFP_ZERO);
> -       if (!shm->kaddr)
> -               return -ENOMEM;
> -
> -       shm->paddr =3D virt_to_phys(shm->kaddr);
> -       shm->size =3D nr_pages * PAGE_SIZE;
> -
> -       pages =3D kcalloc(nr_pages, sizeof(*pages), GFP_KERNEL);
> -       if (!pages) {
> -               rc =3D -ENOMEM;
> -               goto err;
> -       }
> -
> -       for (i =3D 0; i < nr_pages; i++)
> -               pages[i] =3D virt_to_page((u8 *)shm->kaddr + i * PAGE_SIZ=
E);
> -
> -       shm->pages =3D pages;
> -       shm->num_pages =3D nr_pages;
> -
> -       if (shm_register) {
> -               rc =3D shm_register(shm->ctx, shm, pages, nr_pages,
> -                                 (unsigned long)shm->kaddr);
> -               if (rc)
> -                       goto err;
> -       }
> -
> -       return 0;
> -err:
> -       free_pages_exact(shm->kaddr, shm->size);
> -       shm->kaddr =3D NULL;
> -       return rc;
> -}
> -
> -void optee_pool_op_free_helper(struct tee_shm_pool *pool, struct tee_shm=
 *shm,
> -                              int (*shm_unregister)(struct tee_context *=
ctx,
> -                                                    struct tee_shm *shm)=
)
> -{
> -       if (shm_unregister)
> -               shm_unregister(shm->ctx, shm);
> -       free_pages_exact(shm->kaddr, shm->size);
> -       shm->kaddr =3D NULL;
> -       kfree(shm->pages);
> -       shm->pages =3D NULL;
> -}
> -
>  static void optee_bus_scan(struct work_struct *work)
>  {
>         WARN_ON(optee_enumerate_devices(PTA_CMD_GET_DEVICES_SUPP));
> diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
> index cee8ccb84cb8..3235e1c719e8 100644
> --- a/drivers/tee/optee/ffa_abi.c
> +++ b/drivers/tee/optee/ffa_abi.c
> @@ -374,14 +374,14 @@ static int optee_ffa_shm_unregister_supp(struct tee=
_context *ctx,
>  static int pool_ffa_op_alloc(struct tee_shm_pool *pool,
>                              struct tee_shm *shm, size_t size, size_t ali=
gn)
>  {
> -       return optee_pool_op_alloc_helper(pool, shm, size, align,
> -                                         optee_ffa_shm_register);
> +       return tee_dyn_shm_alloc_helper(shm, size, align,
> +                                       optee_ffa_shm_register);
>  }
>
>  static void pool_ffa_op_free(struct tee_shm_pool *pool,
>                              struct tee_shm *shm)
>  {
> -       optee_pool_op_free_helper(pool, shm, optee_ffa_shm_unregister);
> +       tee_dyn_shm_free_helper(shm, optee_ffa_shm_unregister);
>  }
>
>  static void pool_ffa_op_destroy_pool(struct tee_shm_pool *pool)
> diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_=
private.h
> index a0698ac18993..429cc20be5cc 100644
> --- a/drivers/tee/optee/optee_private.h
> +++ b/drivers/tee/optee/optee_private.h
> @@ -283,18 +283,6 @@ int optee_cancel_req(struct tee_context *ctx, u32 ca=
ncel_id, u32 session);
>  int optee_enumerate_devices(u32 func);
>  void optee_unregister_devices(void);
>
> -int optee_pool_op_alloc_helper(struct tee_shm_pool *pool, struct tee_shm=
 *shm,
> -                              size_t size, size_t align,
> -                              int (*shm_register)(struct tee_context *ct=
x,
> -                                                  struct tee_shm *shm,
> -                                                  struct page **pages,
> -                                                  size_t num_pages,
> -                                                  unsigned long start));
> -void optee_pool_op_free_helper(struct tee_shm_pool *pool, struct tee_shm=
 *shm,
> -                              int (*shm_unregister)(struct tee_context *=
ctx,
> -                                                    struct tee_shm *shm)=
);
> -
> -
>  void optee_remove_common(struct optee *optee);
>  int optee_open(struct tee_context *ctx, bool cap_memref_null);
>  void optee_release(struct tee_context *ctx);
> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> index 9c296b887dc1..734c484ed0f6 100644
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -592,19 +592,18 @@ static int pool_op_alloc(struct tee_shm_pool *pool,
>          * to be registered with OP-TEE.
>          */
>         if (shm->flags & TEE_SHM_PRIV)
> -               return optee_pool_op_alloc_helper(pool, shm, size, align,=
 NULL);
> +               return tee_dyn_shm_alloc_helper(shm, size, align, NULL);
>
> -       return optee_pool_op_alloc_helper(pool, shm, size, align,
> -                                         optee_shm_register);
> +       return tee_dyn_shm_alloc_helper(shm, size, align, optee_shm_regis=
ter);
>  }
>
>  static void pool_op_free(struct tee_shm_pool *pool,
>                          struct tee_shm *shm)
>  {
>         if (!(shm->flags & TEE_SHM_PRIV))
> -               optee_pool_op_free_helper(pool, shm, optee_shm_unregister=
);
> +               tee_dyn_shm_free_helper(shm, optee_shm_unregister);
>         else
> -               optee_pool_op_free_helper(pool, shm, NULL);
> +               tee_dyn_shm_free_helper(shm, NULL);
>  }
>
>  static void pool_op_destroy_pool(struct tee_shm_pool *pool)
> diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
> index 96a45c817427..5bf76c35cd9e 100644
> --- a/drivers/tee/tee_shm.c
> +++ b/drivers/tee/tee_shm.c
> @@ -202,6 +202,70 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_co=
ntext *ctx, size_t size)
>  }
>  EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
>
> +int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t al=
ign,
> +                            int (*shm_register)(struct tee_context *ctx,
> +                                                struct tee_shm *shm,
> +                                                struct page **pages,
> +                                                size_t num_pages,
> +                                                unsigned long start))
> +{
> +       size_t nr_pages =3D roundup(size, PAGE_SIZE) / PAGE_SIZE;
> +       struct page **pages;
> +       unsigned int i;
> +       int rc =3D 0;
> +
> +       /*
> +        * Ignore alignment since this is already going to be page aligne=
d
> +        * and there's no need for any larger alignment.
> +        */
> +       shm->kaddr =3D alloc_pages_exact(nr_pages * PAGE_SIZE,
> +                                      GFP_KERNEL | __GFP_ZERO);
> +       if (!shm->kaddr)
> +               return -ENOMEM;
> +
> +       shm->paddr =3D virt_to_phys(shm->kaddr);
> +       shm->size =3D nr_pages * PAGE_SIZE;
> +
> +       pages =3D kcalloc(nr_pages, sizeof(*pages), GFP_KERNEL);
> +       if (!pages) {
> +               rc =3D -ENOMEM;
> +               goto err;
> +       }
> +
> +       for (i =3D 0; i < nr_pages; i++)
> +               pages[i] =3D virt_to_page((u8 *)shm->kaddr + i * PAGE_SIZ=
E);
> +
> +       shm->pages =3D pages;
> +       shm->num_pages =3D nr_pages;
> +
> +       if (shm_register) {
> +               rc =3D shm_register(shm->ctx, shm, pages, nr_pages,
> +                                 (unsigned long)shm->kaddr);
> +               if (rc)
> +                       goto err;
> +       }
> +
> +       return 0;
> +err:
> +       free_pages_exact(shm->kaddr, shm->size);
> +       shm->kaddr =3D NULL;
> +       return rc;
> +}
> +EXPORT_SYMBOL_GPL(tee_dyn_shm_alloc_helper);
> +
> +void tee_dyn_shm_free_helper(struct tee_shm *shm,
> +                            int (*shm_unregister)(struct tee_context *ct=
x,
> +                                                  struct tee_shm *shm))
> +{
> +       if (shm_unregister)
> +               shm_unregister(shm->ctx, shm);
> +       free_pages_exact(shm->kaddr, shm->size);
> +       shm->kaddr =3D NULL;
> +       kfree(shm->pages);
> +       shm->pages =3D NULL;
> +}
> +EXPORT_SYMBOL_GPL(tee_dyn_shm_free_helper);
> +
>  static struct tee_shm *
>  register_shm_helper(struct tee_context *ctx, struct iov_iter *iter, u32 =
flags,
>                     int id)
> diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
> index d9b3ba8e8fa9..efd16ed52315 100644
> --- a/include/linux/tee_core.h
> +++ b/include/linux/tee_core.h
> @@ -232,6 +232,16 @@ void *tee_get_drvdata(struct tee_device *teedev);
>   */
>  struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t s=
ize);
>
> +int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t al=
ign,
> +                            int (*shm_register)(struct tee_context *ctx,
> +                                                struct tee_shm *shm,
> +                                                struct page **pages,
> +                                                size_t num_pages,
> +                                                unsigned long start));
> +void tee_dyn_shm_free_helper(struct tee_shm *shm,
> +                            int (*shm_unregister)(struct tee_context *ct=
x,
> +                                                  struct tee_shm *shm));
> +
>  /**
>   * tee_shm_is_dynamic() - Check if shared memory object is of the dynami=
c kind
>   * @shm:       Shared memory handle
> --
> 2.34.1
>
