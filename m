Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4882D056
	for <linux-doc@vger.kernel.org>; Wed, 28 Feb 2024 08:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709109670; cv=none; b=KpIKktircxiQosn/hx36fQghXR9s7cmJb0o2IUsfQIvBLAWBuD37q0n1S7SkCj3/do5zEzi9bYfwC1vEJdmwbFFVACcAAcD+bKDg8FcggU7wkwBct1RHct8u0dfCTJNl/eoaMkkrSV3X2x8MTx/vs2ynGpvCE/pZ5upMLm5p/nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709109670; c=relaxed/simple;
	bh=2kzias5Fk7aTKcGGkjTT6RQgXcDAlJOnjNzlZIVBjqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z5OJ8dB1KeLL0t9gPIfIMAPsNDgbQXZRQUjpP/m5axSV0A5pH3bO/qhx0Iinu1+UcUhN1oZKZfDWCn9S8uWXeB76dK4JeS76cJd9EqwMx4ph/TNmrFP1ECtAylM/Bfon/YKe8gv556OsnLY5wup4DM6eKtKC1YDQHg755AXmjqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qPS9GF0G; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qPS9GF0G"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5a04fb5e689so2672310eaf.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Feb 2024 00:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709109667; x=1709714467; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oloRY23bmCenkucSXxe8sY8KoPpHk012VyqqNCEkUko=;
        b=qPS9GF0GQbprId+w2eXZtlC9Ddlu0Y2eLjfXJ8n2KIBsCbsrAnKgUws6CvH+xoPFfh
         pcOhgaxfT1MDHD0t4f+AFAyEQBGmkoZi4blLV+X7goBgsZSSk1owBKAXyrXg23m88Oy6
         7SZVKyc0wWWT2Po/sWYA4qbA+gkfcEfA6G8fYPLtlhgtkLhdAa9zIikupgd2uV/G64+a
         piFImysXhGWVbUXkjhQjTp82/zVXHhPFoHGGZ+EM2/4povFbrz7gdH43TJeRIQv545c5
         hY4xhAv2BtivZEx0pySi6pIyjmaqfb6cWnZnXYvqmom2yuF71ddiqBf1l2FTDePlEaM8
         qGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709109667; x=1709714467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oloRY23bmCenkucSXxe8sY8KoPpHk012VyqqNCEkUko=;
        b=PZvLpvvzF7YqlB/YEfbmQmG3XPw2uz421yX2RfN7GG26Aob8e3O7MvXgfDA6I6yy+L
         lXGn0WXaViPt3HIpfNlhy1DDPlPrlEZgGllqOG5LCQd9/3dIqn4qskcYLTBzPauKyK06
         zx59I9plTX2bNtGZoP6LbYSA8edIC0pE024VhE9f5t3w2iyg4ukWn4GExiQRnx2+Dhbi
         pwfYxzTwNDZueEFXaWm7ogealTN7uEVcXSiyPMATSKmVDjEVUuwhVK+vlZ9tV7flwuyS
         9mEacv4EmS+X5XwSl8ZvfUmAKneiISDbEpq8R01Bnk23Ss47uGPKYQvH/pWKJoYqyJCD
         yHcA==
X-Forwarded-Encrypted: i=1; AJvYcCXFIWU2ss5ZXFq4QBsdZwzQOvySe5jE7mrJrSDWESRmIQGYwNJsxXUU2onPKQM/kCIguFevVDWTYq0kNerDWNNlIdcLfWx226Oi
X-Gm-Message-State: AOJu0YyAXrmBg/3gByektCBh3VueNzvdGGcqZLwW8+CNWwhUuOxjYbkE
	NlYxiVb5dL7LzjwMQsD/wveTkOpLV6UYS5DnzUfPfIBiRAlCmv4zHdA2rwvcSIv9oLE8rL28gFd
	3HpqpG/hOWK7IdbsYvfxTW5vAFrJ6gsx4cD2Vlw==
X-Google-Smtp-Source: AGHT+IGFzapDyE0U7yeKzazzeLGFVPqxRC37WybFKQxdMt8JsBMaU6tnLVe7p0dvCltNbqBn3+vYTf3v7xUm6P9lkCg=
X-Received: by 2002:a4a:385e:0:b0:5a0:c476:3461 with SMTP id
 o30-20020a4a385e000000b005a0c4763461mr1752589oof.9.1709109666716; Wed, 28 Feb
 2024 00:41:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223095133.109046-1-balint.dobszay@arm.com>
 <20240223095133.109046-2-balint.dobszay@arm.com> <CAFA6WYNW9-7gCZQSEaV=Gcr+GLdu25rQ8MpTg9yNpX7OwyZ0Tg@mail.gmail.com>
 <CAHUa44G70L9CnQD6V3ivWf1hYfK0iWFt-cfg98-JGB-s8TVd-A@mail.gmail.com> <CAFA6WYOq3tHq5n7=XYpsSgBghCF0RtAxs-sLxvLYMWwnQuFSeQ@mail.gmail.com>
In-Reply-To: <CAFA6WYOq3tHq5n7=XYpsSgBghCF0RtAxs-sLxvLYMWwnQuFSeQ@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 28 Feb 2024 09:40:55 +0100
Message-ID: <CAHUa44F=0juXyyhA7Bu0SzCK+1igRYEWCn1XRL1sDG1ZWNhr3g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] tee: optee: Move pool_op helper functions
To: Sumit Garg <sumit.garg@linaro.org>
Cc: Balint Dobszay <balint.dobszay@arm.com>, op-tee@lists.trustedfirmware.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, corbet@lwn.net, sudeep.holla@arm.com, 
	rdunlap@infradead.org, krzk@kernel.org, gyorgy.szing@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 6:58=E2=80=AFAM Sumit Garg <sumit.garg@linaro.org> =
wrote:
>
> On Tue, 27 Feb 2024 at 21:20, Jens Wiklander <jens.wiklander@linaro.org> =
wrote:
> >
> > On Tue, Feb 27, 2024 at 7:06=E2=80=AFAM Sumit Garg <sumit.garg@linaro.o=
rg> wrote:
[snip]
> > > > --- a/include/linux/tee_drv.h
> > > > +++ b/include/linux/tee_drv.h
> > > > @@ -275,6 +275,17 @@ void *tee_get_drvdata(struct tee_device *teede=
v);
> > > >  struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, si=
ze_t size);
> > > >  struct tee_shm *tee_shm_alloc_kernel_buf(struct tee_context *ctx, =
size_t size);
> > > >
> > > > +int tee_shm_pool_op_alloc_helper(struct tee_shm_pool *pool, struct=
 tee_shm *shm,
> > > > +                                size_t size, size_t align,
> > > > +                                int (*shm_register)(struct tee_con=
text *ctx,
> > > > +                                                    struct tee_shm=
 *shm,
> > > > +                                                    struct page **=
pages,
> > > > +                                                    size_t num_pag=
es,
> > > > +                                                    unsigned long =
start));
> > > > +void tee_shm_pool_op_free_helper(struct tee_shm_pool *pool, struct=
 tee_shm *shm,
> > > > +                                int (*shm_unregister)(struct tee_c=
ontext *ctx,
> > > > +                                                      struct tee_s=
hm *shm));
> > > > +
> > >
> > > These rather belong to drivers/tee/tee_private.h as we shouldn't
> > > expose them to other kernel client drivers.
> >
> > This is the right place, this .h file is for TEE drivers too.
> >
>
> But this is shared with other kernel TEE client drivers and we
> shouldn't expose internal APIs which aren't meant for them with a side
> effect of API abuse too. Any particular reason to not use
> drivers/tee/tee_private.h?

drivers/tee/tee_private.h is supposed to be used internally by only
the files in drivers/tee. If you look in include/linux/tee_drv.h
you'll find a few functions and other definitions that a kernel TEE
client driver should not use, for instance, tee_device_register() and
tee_device_unregister(). This kernel TEE client interface was
introduced with commit 25559c22cef8 ("tee: add kernel internal client
interface"). include/linux/tee_drv.h existed before we even had any
kernel TEE client interface.

Cheers,
Jens
