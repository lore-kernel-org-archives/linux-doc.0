Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447373BBEE
	for <linux-doc@vger.kernel.org>; Wed, 28 Feb 2024 11:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709120924; cv=none; b=HRMmEgDldp/EubhUW02svItwxr8TekAgcN3Gu6aWMOTHpb49YKumGBlEXwWhwqeH1ikOWtTnK3iwE0IVcVkvcxQx6ujmi/fv3EuS+hpbDLSxmaAsbggWGSg0jVWlI/QhPUi8KgES5JRlDEMgaaea0hGA3t6qLJYEKX2SkMd6Lww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709120924; c=relaxed/simple;
	bh=EZ3/r6jP1UeKfZdj8PKX1ArWpQFnaQK6pWIFMIOxEzI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LqSOvC9pQ8pbMdf9VZg/k1m/9h5tM9uJ+8yyfJQDHPN0k9tipGs4Lc8x+ZPCcbeK2wcsLslW9jx2GGNdsn8ZtTPEV9JllACrGYCzGI2ftHRmG5sbP2114HK+eFtHBd9WRv0VyG+O0WoYW6DW85+LIfXRBVFMPrnqYssmY6fM/CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fi5K13Kc; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fi5K13Kc"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6ddca59e336so352066a34.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Feb 2024 03:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709120922; x=1709725722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0TXLzB4Msoul4s4dV1mPZ7ImJpimQ1+1LUAA44CprZQ=;
        b=Fi5K13KcZ9BJQvejUPlnPg1UckybtQgfK0rayxEJCAXHnABj02OIXb0mJdZ5X5HPzJ
         V6tIHW3Ue4/Nzt//b3uRh0eZoJcwiKaMAVtsymtIKlF84Gt7l1Zrhb0zqKkcrtajXDbi
         DaCrMLotSq9qNk9n/ZHJ3I0DqKjW9co88B6K87HmU67kgMoYlpk46sYRw2SqoWdJS+KH
         iZfVMbl53+Eo0uoTDSXnUzyXi/ntISyS8t7iIIqadUh8dEwyZGjaRtKs0qjpZk9K2BEf
         jDLwITB1xatenkExSVvXjrHzRdtZASmk6EqC3YH6iPcY4vYT05iSuwNZTEDeLhMsE+p2
         J05Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709120922; x=1709725722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0TXLzB4Msoul4s4dV1mPZ7ImJpimQ1+1LUAA44CprZQ=;
        b=BU1VHT4NyD73au7IElI5KMfsQrrqdVHEHhYmOxkItgNZGOxj7znbBV2I/Cxzqg4Goy
         A1c1cdsjNfbDNoCcRJCs5q7IknN7NCSbnvamBiGWSKNUhm+1nBXngkz0sD7udbu3gCde
         +yucT+st4ziW38Ymwxs1N41qCxFGy3do/qxxVFMZWm6Uor5P63i3+X+bgdkpMhJ9/PeQ
         5lnwwPC04bjtg74Uhz9eF1xgTiq/kre4xd8wfY9RFJDu9n7nMnvhzYrtyjGZsdtyJyzn
         gAlAs0CeIihsrRqu5aNRNTINIS0Z/Oql4FVQvY7KGRJADqCN+W66RKJNJcNNn2LCJHV/
         kAYA==
X-Forwarded-Encrypted: i=1; AJvYcCV4X1bXlGfj/3hp1o0/D9e80nWTVXQ72IKKucVFaqTy7fw/hKfx8T0NCorxyshkRXYEPuCjAo8tPHw52noJI4fAaptIbWMtlV7K
X-Gm-Message-State: AOJu0YwouuT/D49peZf5YoZmYskV4zxchtu/FJLWvQZScOLQgsc8T/oc
	cg/kEQqxC7gGuGNN8pVvCk4Ww6CqM699NGtMBYYd1cB3cKTm0IBxOuLwc7HM/EygCzvK8Dol0xE
	eweeMlSSpWbwi5jVwZ9Zbx7nei+mpikg3tIQzYA==
X-Google-Smtp-Source: AGHT+IHgDESK6BBCVqBJuDnLFAnZ8PiBh71uRn7/EKUnrjapCyGIR+ORjcHdsUr3ZWJX91sVAwmdJ0sd0zGakBKb6aY=
X-Received: by 2002:a9d:6190:0:b0:6e4:9482:8b99 with SMTP id
 g16-20020a9d6190000000b006e494828b99mr1007821otk.0.1709120922271; Wed, 28 Feb
 2024 03:48:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223095133.109046-1-balint.dobszay@arm.com>
 <20240223095133.109046-2-balint.dobszay@arm.com> <CAFA6WYNW9-7gCZQSEaV=Gcr+GLdu25rQ8MpTg9yNpX7OwyZ0Tg@mail.gmail.com>
 <CAHUa44G70L9CnQD6V3ivWf1hYfK0iWFt-cfg98-JGB-s8TVd-A@mail.gmail.com>
 <CAFA6WYOq3tHq5n7=XYpsSgBghCF0RtAxs-sLxvLYMWwnQuFSeQ@mail.gmail.com>
 <CAHUa44F=0juXyyhA7Bu0SzCK+1igRYEWCn1XRL1sDG1ZWNhr3g@mail.gmail.com> <CAFA6WYOWQZqtAcdCKcBa7qnCY1ueBzU1_1HSbfHPaLeyPdtxbw@mail.gmail.com>
In-Reply-To: <CAFA6WYOWQZqtAcdCKcBa7qnCY1ueBzU1_1HSbfHPaLeyPdtxbw@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 28 Feb 2024 12:48:31 +0100
Message-ID: <CAHUa44EunLWSsVgFbH8fQNhWz69MAHj2j-JFu+cguXxUDUvLSg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] tee: optee: Move pool_op helper functions
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Balint Dobszay <balint.dobszay@arm.com>, op-tee@lists.trustedfirmware.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, corbet@lwn.net, sudeep.holla@arm.com, 
	rdunlap@infradead.org, krzk@kernel.org, gyorgy.szing@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:20=E2=80=AFPM Sumit Garg <sumit.garg@linaro.org>=
 wrote:
>
> On Wed, 28 Feb 2024 at 14:11, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> >
> > On Wed, Feb 28, 2024 at 6:58=E2=80=AFAM Sumit Garg <sumit.garg@linaro.o=
rg> wrote:
> > >
> > > On Tue, 27 Feb 2024 at 21:20, Jens Wiklander <jens.wiklander@linaro.o=
rg> wrote:
> > > >
> > > > On Tue, Feb 27, 2024 at 7:06=E2=80=AFAM Sumit Garg <sumit.garg@lina=
ro.org> wrote:
> > [snip]
> > > > > > --- a/include/linux/tee_drv.h
> > > > > > +++ b/include/linux/tee_drv.h
> > > > > > @@ -275,6 +275,17 @@ void *tee_get_drvdata(struct tee_device *t=
eedev);
> > > > > >  struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx=
, size_t size);
> > > > > >  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *c=
tx, size_t size);
> > > > > >
> > > > > > +int tee_shm_pool_op_alloc_helper(struct tee_shm_pool *pool, st=
ruct tee_shm *shm,
> > > > > > +                                size_t size, size_t align,
> > > > > > +                                int (*shm_register)(struct tee=
_context *ctx,
> > > > > > +                                                    struct tee=
_shm *shm,
> > > > > > +                                                    struct pag=
e **pages,
> > > > > > +                                                    size_t num=
_pages,
> > > > > > +                                                    unsigned l=
ong start));
> > > > > > +void tee_shm_pool_op_free_helper(struct tee_shm_pool *pool, st=
ruct tee_shm *shm,
> > > > > > +                                int (*shm_unregister)(struct t=
ee_context *ctx,
> > > > > > +                                                      struct t=
ee_shm *shm));
> > > > > > +
> > > > >
> > > > > These rather belong to drivers/tee/tee_private.h as we shouldn't
> > > > > expose them to other kernel client drivers.
> > > >
> > > > This is the right place, this .h file is for TEE drivers too.
> > > >
> > >
> > > But this is shared with other kernel TEE client drivers and we
> > > shouldn't expose internal APIs which aren't meant for them with a sid=
e
> > > effect of API abuse too. Any particular reason to not use
> > > drivers/tee/tee_private.h?
> >
> > drivers/tee/tee_private.h is supposed to be used internally by only
> > the files in drivers/tee.
>
> How about "struct tee_device" being in drivers/tee/tee_private.h?

What about it?

>
> > If you look in include/linux/tee_drv.h
> > you'll find a few functions and other definitions that a kernel TEE
> > client driver should not use, for instance, tee_device_register() and
> > tee_device_unregister(). This kernel TEE client interface was
> > introduced with commit 25559c22cef8 ("tee: add kernel internal client
> > interface"). include/linux/tee_drv.h existed before we even had any
> > kernel TEE client interface.
>
> Anyhow, it looks like there is a chance for refactoring here. How
> about splitting this header further in something like
> include/linux/tee_core.h which will contain all the pieces relevant to
> TEE drivers?

Sure.

>
> BTW, this patch series can keep using include/linux/tee_drv.h for the
> time being.

Agreed.

Cheers,
Jens

>
> -Sumit
>
> >
> > Cheers,
> > Jens
