Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0EA12FF69
	for <linux-doc@vger.kernel.org>; Wed, 28 Feb 2024 11:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709119218; cv=none; b=MkY5R+Az9z+VrqUd0Oif7PgCP0WHr1RE7QXsh629g0azKzcnHjnwp/RJ27wLktbK17KvTjYAtVyyE97EGtXTmNxHYsRSAZ28Vwx2f0pfSBZCZqHcw+o/8zLAtz4lO0RaPAqIKqlm+ViRHrn1aV7wVGz4iGQKfSQSVS8ioM8cigU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709119218; c=relaxed/simple;
	bh=+nPljukr79/k+aBoFw1zKq3c7bPlfzNhe25zdAfdkf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ow/6SvVqD/VRG3jzd0ZIsJ798EctJE+++wJ0BRLnByWLdGCnE9n7xWSU4tJoJus+83k9C20P2WgNfuP/xCYFTD/aLd3TatXW7BHVVcC3aA+dMZRQ3yDI1clVwUgqYE5iHDxJrcGFUVjyZdfc1oOdmIVtQA4huNFPA0+viwRGNiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sjOLh3Oo; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sjOLh3Oo"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-47268928105so76373137.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Feb 2024 03:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709119215; x=1709724015; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cz56F1rJBplYFoLx/g3BveNwqzw9wyCIbG8M8QMxDrI=;
        b=sjOLh3OoTvyE5A/QuR+/am1mG2gY9wsoDZUGmuC3YxyMOcYzndCorjrItiBXrFC++H
         D7LRGdeOANvM1SbfQEQYTbBc8hhHvflg60OaBc6nkQpFr8g6I7eQ4aUSzYPGAhUkd0Mo
         a3JeBkZLCXed9p0vOiQ1I4Vb/ChyEUarCMp9dRZ7pm1KrQpr8juq5fyXxi8K0lSq0wd2
         EN6w5yK2dZ09+hljkY5iPfpSQ9zob6VCvFlF0R6rEqz5GxmWLH8xIN6lXB9m9ZMc4Et+
         rtDb5V0gc4r/cTme6sKXrgNEOnj11rmjTUo60KOjvt6YmZ7q638sgpBZPn0amXIZfVoq
         4CUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709119215; x=1709724015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cz56F1rJBplYFoLx/g3BveNwqzw9wyCIbG8M8QMxDrI=;
        b=WleZdCRJlqyk2zN3Pj0EErGYjKUe/AKpLY+9GFCR4yAlf5bnIx0QlXgrXha1N4RUVI
         UOruzt4oVGRv8jvKtA9aSMN8bucvYABUPcZPuz+ipQNn+Ps8Ypdlilw+6rxZLCwtSMlC
         HMXrqE6gFdWJNoLdU70tVocJ6s2+42rqJLPqXqvVQwsy3qDEXkyvyAvF+zs392aMJI6q
         Nm8VcMuMz0h/obhRsxxoSp9Tbozjk+3j9/bcVDyu06weuvJjcfa7Lo0elGN5Cgytrplx
         uFLHXfF/Rj/e8O2GsZqQrYKnjkNK6NsBkERJmaZQAU6RWCLt2cMp1Q19quToxfFVfgxv
         Sjiw==
X-Forwarded-Encrypted: i=1; AJvYcCUp81NdL1wO7SQGwyppLiF9jJMdaNCAc88slKb0Lmdzdq4BF6NxyCpUicJDQfWrEv272kzn1Fss0i4mi2gSqyPIuCBzxsxV8BhR
X-Gm-Message-State: AOJu0YwYv3hf7OuZdJjKFNyxmCK5fZH67+V+omHLHkOe0W63/l6KEp6U
	p309b2GMKVat0zSk5/NjckP6MoEc7FcVxhhiw0JztXsVE8nohquVk+UkL3ExTkovtt6fxfKvIWm
	Umy+2hE5V2PPvrE1CwCO6TN1kkEgSy5cwbP4FwA==
X-Google-Smtp-Source: AGHT+IGjLYsLmcXmODaXN692Ax33B+2DO8wWUZO+yRjb3+yUlIx33TwTXTshNhd1Z1IG7aczIPXUNgyD6o94ZePaL0k=
X-Received: by 2002:a05:6102:30b6:b0:472:6e23:1f3d with SMTP id
 y22-20020a05610230b600b004726e231f3dmr1143660vsd.1.1709119213982; Wed, 28 Feb
 2024 03:20:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223095133.109046-1-balint.dobszay@arm.com>
 <20240223095133.109046-2-balint.dobszay@arm.com> <CAFA6WYNW9-7gCZQSEaV=Gcr+GLdu25rQ8MpTg9yNpX7OwyZ0Tg@mail.gmail.com>
 <CAHUa44G70L9CnQD6V3ivWf1hYfK0iWFt-cfg98-JGB-s8TVd-A@mail.gmail.com>
 <CAFA6WYOq3tHq5n7=XYpsSgBghCF0RtAxs-sLxvLYMWwnQuFSeQ@mail.gmail.com> <CAHUa44F=0juXyyhA7Bu0SzCK+1igRYEWCn1XRL1sDG1ZWNhr3g@mail.gmail.com>
In-Reply-To: <CAHUa44F=0juXyyhA7Bu0SzCK+1igRYEWCn1XRL1sDG1ZWNhr3g@mail.gmail.com>
From: Sumit Garg <sumit.garg@linaro.org>
Date: Wed, 28 Feb 2024 16:50:02 +0530
Message-ID: <CAFA6WYOWQZqtAcdCKcBa7qnCY1ueBzU1_1HSbfHPaLeyPdtxbw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] tee: optee: Move pool_op helper functions
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Balint Dobszay <balint.dobszay@arm.com>, op-tee@lists.trustedfirmware.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, corbet@lwn.net, sudeep.holla@arm.com, 
	rdunlap@infradead.org, krzk@kernel.org, gyorgy.szing@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Feb 2024 at 14:11, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
>
> On Wed, Feb 28, 2024 at 6:58=E2=80=AFAM Sumit Garg <sumit.garg@linaro.org=
> wrote:
> >
> > On Tue, 27 Feb 2024 at 21:20, Jens Wiklander <jens.wiklander@linaro.org=
> wrote:
> > >
> > > On Tue, Feb 27, 2024 at 7:06=E2=80=AFAM Sumit Garg <sumit.garg@linaro=
.org> wrote:
> [snip]
> > > > > --- a/include/linux/tee_drv.h
> > > > > +++ b/include/linux/tee_drv.h
> > > > > @@ -275,6 +275,17 @@ void *tee_get_drvdata(struct tee_device *tee=
dev);
> > > > >  struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, =
size_t size);
> > > > >  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx=
, size_t size);
> > > > >
> > > > > +int tee_shm_pool_op_alloc_helper(struct tee_shm_pool *pool, stru=
ct tee_shm *shm,
> > > > > +                                size_t size, size_t align,
> > > > > +                                int (*shm_register)(struct tee_c=
ontext *ctx,
> > > > > +                                                    struct tee_s=
hm *shm,
> > > > > +                                                    struct page =
**pages,
> > > > > +                                                    size_t num_p=
ages,
> > > > > +                                                    unsigned lon=
g start));
> > > > > +void tee_shm_pool_op_free_helper(struct tee_shm_pool *pool, stru=
ct tee_shm *shm,
> > > > > +                                int (*shm_unregister)(struct tee=
_context *ctx,
> > > > > +                                                      struct tee=
_shm *shm));
> > > > > +
> > > >
> > > > These rather belong to drivers/tee/tee_private.h as we shouldn't
> > > > expose them to other kernel client drivers.
> > >
> > > This is the right place, this .h file is for TEE drivers too.
> > >
> >
> > But this is shared with other kernel TEE client drivers and we
> > shouldn't expose internal APIs which aren't meant for them with a side
> > effect of API abuse too. Any particular reason to not use
> > drivers/tee/tee_private.h?
>
> drivers/tee/tee_private.h is supposed to be used internally by only
> the files in drivers/tee.

How about "struct tee_device" being in drivers/tee/tee_private.h?

> If you look in include/linux/tee_drv.h
> you'll find a few functions and other definitions that a kernel TEE
> client driver should not use, for instance, tee_device_register() and
> tee_device_unregister(). This kernel TEE client interface was
> introduced with commit 25559c22cef8 ("tee: add kernel internal client
> interface"). include/linux/tee_drv.h existed before we even had any
> kernel TEE client interface.

Anyhow, it looks like there is a chance for refactoring here. How
about splitting this header further in something like
include/linux/tee_core.h which will contain all the pieces relevant to
TEE drivers?

BTW, this patch series can keep using include/linux/tee_drv.h for the
time being.

-Sumit

>
> Cheers,
> Jens
